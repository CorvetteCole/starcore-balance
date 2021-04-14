import 'package:json_annotation/json_annotation.dart';
import 'dart:io';
import 'package:pretty_json/pretty_json.dart';

import 'package:logging/logging.dart';
import 'package:starcore_balance_server/Utilities.dart';
import 'package:starcore_balance_server/models/Weapon.dart';
import 'package:xml/xml.dart';

import 'models/ModItem.dart';
import 'models/World.dart';
import 'Steam.dart';

class ModManager {
  final _log = Logger('ModManager');
  final _restrictionsModId = 2421597411;
  final gameId;
  final subDirectory;

  Map<int, ModItem> modIds = {};
  Map<int, List<Weapon>> _weaponModData = {};
  Map<int, List<Weapon>> _enabledWeaponModData = {};
  List<String> restrictionsList = [];

  ModManager(this.gameId, this.subDirectory);

  Map<int, List<Weapon>> get allWeaponData {
    return _weaponModData;
  }

  Map<int, List<Weapon>> get enabledWeaponData {
    return _enabledWeaponModData;
  }

  Future<void> updateMods(var worlds) async {
    await _downloadMods(worlds);
    await _parseMods();
    if (modIds.keys.contains(_restrictionsModId)) {
      await _processRestrictions();
    }
  }

  Future<void> _processRestrictions() async {
    _log.info('Processing weapon restrictions...');
    restrictionsList = await _getRestrictions();
    for (var mod in _weaponModData.keys) {
      var enabledWeapons = <Weapon>[];
      for (var weapon in _weaponModData[mod]!){
        if (restrictionsList.contains(weapon.subTypeId)){
          _log.fine('weapon ${weapon.hardpoint?.weaponName} of subtype ${weapon.subTypeId} restricted');
        } else {
          enabledWeapons.add(weapon);
        }
      }
      _enabledWeaponModData[mod] = enabledWeapons;
    }
  }

  Future<List<String>> _getRestrictions() async {
    var restrictionsDirectory = Directory(
        '${Directory.current.path}${subDirectory}steamapps/workshop/content/$gameId/$_restrictionsModId/Data');
    var restrictedSubtypes = <String>[];

    if (await restrictionsDirectory.exists()) {
      var restrictionsFiles = <File>[];
      await for (var fileSystemEntity
          in restrictionsDirectory.list(recursive: true, followLinks: false)) {
        if (fileSystemEntity is File) {
          restrictionsFiles.add(fileSystemEntity);
        }
      }
      final typeRegex = RegExp(r'MyObjectBuilder_[^\/\s]*\/(?<value>[^<]*)');
      for (var restrictionsFile in restrictionsFiles) {
        final mainDocument =
            XmlDocument.parse(await restrictionsFile.readAsString());
        final descriptions = mainDocument.findAllElements('Description');
        for (var description in descriptions) {
          var restrictionsXmlString = description.innerXml;
          restrictionsXmlString = restrictionsXmlString.replaceAll('[', '<');
          restrictionsXmlString = restrictionsXmlString.replaceAll(']', '>');
          final restrictionsXml = XmlDocument.parse(restrictionsXmlString);
          var types = restrictionsXml.findAllElements('Type');

          for (var type in types) {
            var subtype =
                typeRegex.firstMatch(type.innerText)?.namedGroup('value');
            _log.finer('Subtype restriction found ($subtype)');
            if (subtype != null) {
              restrictedSubtypes.add(subtype);
            }
          }
        }
      }
    } else {
      _log.severe('Restrictions mod directory not found!');
    }
    return restrictedSubtypes;
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
    _log.info('Parsing downloaded mods for weapon data');
    for (final modId in modIds.keys) {
      var weaponCoreDirectory = Directory(
          '${Directory.current.path}${subDirectory}steamapps/workshop/content/$gameId/$modId/Data/Scripts/WeaponThread');
      if (await weaponCoreDirectory.exists()) {
        _log.fine(
            'WeaponThread directory exists for ${modIds[modId]?.friendlyName} (id: $modId)');
        var weaponCoreFiles = <File>[];
        await for (var fileSystemEntity
            in weaponCoreDirectory.list(recursive: false, followLinks: false)) {
          if (fileSystemEntity is File) {
            weaponCoreFiles.add(fileSystemEntity);
          }
        }

        var weapons = <Weapon>[];

        _log.finer('Gathering weapon definitions...');
        for (var file in weaponCoreFiles) {
          // time to search for our weapon definitions
          var stringList = await file.readAsLines();

          var weaponDefinition = <String>[];

          // TODO can this use getCodeBlock() as well?
          var recordDefinition = false;
          var bracketCount = 0;
          for (var line in stringList) {
            if (recordDefinition) {
              weaponDefinition.add(line);
              if (line.contains('{')) {
                bracketCount++;
              } else if (line.contains('}')) {
                bracketCount--;
              }

              if (bracketCount == 0) {
                // current values in weaponDefinition should be a weaponDefinition
                //_log.info('WeaponDefinition recorded...');
                weapons.add(Weapon.fromScript(weaponDefinition));
                if (weapons.last.hardpoint?.weaponName == null) {
                  _log.warning(
                      'weaponName parsed as null, or hardpoint not parsed');
                }
                recordDefinition = false;
                weaponDefinition.clear();
              }
            }

            if (line.contains('new WeaponDefinition')) {
              assert(recordDefinition == false);
              recordDefinition = true;
              weaponDefinition.add(line);
              if (line.contains('{')) bracketCount++;
            }
          }
        }

        _log.fine('Weapon definitions gathered... getting ammo definitions');
        // parse ammo types
        for (var file in weaponCoreFiles) {
          var stringFile = await file.readAsString();
          var stringList = await file.readAsLines();
          if (stringFile.contains('new AmmoDef')) {
            for (var weapon in weapons) {
              for (var ammoName in weapon.ammoNames) {
                var ammoDef =
                    getCodeBlock('$ammoName => new AmmoDef', stringList);
                if (ammoDef != null) {
                  weapon.parseAmmoDefinition(ammoDef);
                }
              }
            }
          }
        }

        for (var weapon in weapons) {
          _log.fine(
              'definition file created for ${weapon.hardpoint?.weaponName} (${weapon.subTypeId})');
        }
        _weaponModData[modId] = weapons;
      }
    }
  }
}
