import 'dart:io';
import 'package:logging/logging.dart';

final _log = Logger('Steam');

// returns path
Future<String> downloadWorkshopItem(int gameID, int workshopId,
    {String directory = '/steamcmd/'}) async {
  var steamProcess = await Process.run(
      'steamcmd', _generateArguments(gameID, [workshopId], directory));
  _log.finer(steamProcess.stdout);

  return '${Directory.current.path}${directory}steamapps/workshop/content/$gameID/$workshopId';
}

// doesn't return path
Future<void> downloadWorkshopItems(int gameID, List<int> workshopIds,
    {String directory = '/steamcmd/'}) async {
  var steamProcess = await Process.run(
      'steamcmd', _generateArguments(gameID, workshopIds, directory));
  _log.finer(steamProcess.stdout);
}

List<String> _generateArguments(
    int gameID, List<int> workshopIds, String directory) {
  var workshopDownloads = <String>[];
  for (var workshopId in workshopIds) {
    workshopDownloads.add('+workshop_download_item $gameID $workshopId');
  }

  return [
    '+login anonymous',
    '+force_install_dir ${Directory.current.path}$directory',
    ...workshopDownloads,
    '+quit'
  ];
}
