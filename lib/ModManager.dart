import 'dart:io';
import 'package:pretty_json/pretty_json.dart';

import 'package:logging/logging.dart';
import 'package:starcore_balance_server/Utilities.dart';
import 'package:starcore_balance_server/models/Weapon.dart';

import 'models/ModItem.dart';
import 'models/World.dart';
import 'Steam.dart';


class ModManager {
  final _log = Logger('ModManager');
  final gameId;
  final subDirectory;

  Map<int, ModItem> modIds = {};

  ModManager(this.gameId, this.subDirectory);

  Future<void> updateMods(var worlds) async {
    await _downloadMods(worlds);
    await _parseMods();
  }

  Future<void> _downloadMods(Iterable<World> worlds) async {
    _log.info('Downloading mods (this might take a little while)');
    for (var world in worlds) {
      for (var mod in world.mods) {
        modIds[mod.publishedFileId] = mod;
      }
    }
    await downloadWorkshopItems(gameId, modIds.keys, directory: subDirectory);
    _log.info('Finished downloading mods');
  }

  // TODO massively optimize and break out this function code
  Future<void> _parseMods() async {
    for (final modId in modIds.keys) {
      var weaponCoreDirectory = Directory('${Directory.current.path}${subDirectory}steamapps/workshop/content/$gameId/$modId/Data/Scripts/WeaponThread');
      if (await weaponCoreDirectory.exists()){
        _log.info('WeaponThread directory exists for mod ${modIds[modId]?.friendlyName} (id: $modId)');
        var weaponCoreFiles = <File>[];
        await for (var fileSystemEntity in weaponCoreDirectory.list(recursive: false, followLinks: false)){
          if (fileSystemEntity is File) {
            weaponCoreFiles.add(fileSystemEntity);
          }
        }

        var weapons = <Weapon>[];

        for (var file in weaponCoreFiles){
          // time to search for our weapon definitions
          var stringList = await file.readAsLines();

          var weaponDefinition = <String>[];

          var recordDefinition = false;
          var bracketCount = 0;
          for (var line in stringList){

            if (recordDefinition) {
              weaponDefinition.add(line);
              if (line.contains('{')){
                bracketCount++;
              } else if (line.contains('}')){
                bracketCount--;
              }

              if (bracketCount == 0) {
                // current values in weaponDefinition should be a weaponDefinition
                _log.info('WeaponDefinition recorded...');
                weapons.add(Weapon.fromScript(weaponDefinition));

                recordDefinition = false;
                weaponDefinition.clear();

              }
            }

            if (line.contains('new WeaponDefinition')){
              assert(recordDefinition == false);
              recordDefinition = true;
              weaponDefinition.add(line);

            }
          }

        }

        // parse ammo types
        for (var file in weaponCoreFiles) {
          var stringFile = await file.readAsString();
          var stringList = await file.readAsLines();
          if (stringFile.contains('new AmmoDef')){
            for (var weapon in weapons){
              for (var ammoName in weapon.ammoNames){
                weapon.parseAmmoDefinition(getCodeBlock('$ammoName => new AmmoDef', stringList));
              }
            }
          }
        }

        for (var weapon in weapons){
          print('definition file created for weapon ${weapon.hardpoint.weaponName}');
          print('juice master');
        }

      }
    }
  }
}
