import 'dart:io';
import 'package:logging/logging.dart';

final _log = Logger('Steam');

// returns path
Future<String> downloadWorkshopItem(int gameId, int workshopId,
    {String directory = '/steamcmd/'}) async {
  var steamProcess = await Process.run(
      'steamcmd', _generateArguments(gameId, [workshopId], directory));
  _log.finer(steamProcess.stdout);

  return '${Directory.current.path}${directory}steamapps/workshop/content/$gameId/$workshopId';
}

// doesn't return path
Future<void> downloadWorkshopItems(int gameId, Iterable<int> workshopIds,
    {String directory = '/steamcmd/'}) async {
  var steamProcess = await Process.run(
      'steamcmd', _generateArguments(gameId, workshopIds, directory));
  _log.finer(steamProcess.stdout);
}

List<String> _generateArguments(
    int gameId, Iterable<int> workshopIds, String directory) {
  var workshopDownloads = <String>[];
  for (var workshopId in workshopIds) {
    workshopDownloads.add('+workshop_download_item $gameId $workshopId');
  }

  return [
    '+login anonymous',
    '+force_install_dir ${Directory.current.path}$directory',
    ...workshopDownloads,
    '+quit'
  ];
}
