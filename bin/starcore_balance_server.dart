import 'package:logging/logging.dart';
import 'package:pretty_json/pretty_json.dart';

import 'package:starcore_balance_server/MapManager.dart';

final gameID = 244850;
final testTournamentMaps = [2451284843];
final subDirectory = '/steamcmd/';

final _log = Logger('Main');

void main(List<String> arguments) async {
  Logger.root.level = Level.FINE; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  var mapManager = MapManager(gameID, subDirectory: subDirectory, tournamentMaps: testTournamentMaps);
  await mapManager.checkForUpdates(force: true);

  for (var world in mapManager.tournamentWorlds){
    _log.fine(prettyJson(world.toJson()));

    // print('Printing parsed mod data: ');
    // for (var mod in world.mods){
    //     print('${mod.friendlyName}, Mod ID: ${mod.publishedFileId}');
    // }
    //
    // print('Printing parsed settings data: ');
    // for (var settingKey in world.settings.keys){
    //   print('Setting $settingKey has value: ${world.settings[settingKey]}');
    // }
  }


}
