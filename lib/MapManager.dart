import 'package:logging/logging.dart';
import 'package:xml/xml.dart';
import 'models/World.dart';
import 'Steam.dart';
import 'dart:io';

class MapManager {
  final _log = Logger('MapManager');
  late final gameID;
  late final subDirectory;
  late final configName;

  late Duration updateInterval;
  Map<int, String?> _tournamentMaps = {};
  Map<int, World> _tournamentWorlds = {};
  var _lastMapUpdate = DateTime.fromMillisecondsSinceEpoch(0);

  MapManager(this.gameID,
      {this.subDirectory = '/steamcmd/',
      this.configName = 'Sandbox_config.sbc',
      this.updateInterval = const Duration(days: 1),
      List<int>? tournamentMaps}) {
    if (tournamentMaps != null) {
      for (var mapID in tournamentMaps) {
        _tournamentMaps[mapID] = null;
      }
    }
  }

  // return true on a map getting updated, false otherwise.
  Future<bool> checkForUpdates({bool force = false}) async {
    if (_needsUpdate() || force) {
      await _downloadTournamentMaps();
      await _parseTournamentMaps();
      return true;
    }
    return false;
  }

  // TODO temp for testing, remove this
  Future<void> downloadMods() async {
    _log.info('Downloading mods (this might take a little while)');
    for (var world in _tournamentWorlds.values){
      _log.fine('Downloading mods for world: ${world.sessionName}');
      var modIds = <int>[];
      for (var mod in world.mods){
        modIds.add(mod.publishedFileId);
      }
      await downloadWorkshopItems(gameID, modIds, directory: subDirectory);
      _log.finer('Finished downloading mods for world: ${world.sessionName}');
    }
    _log.info('Finished downloading mods for all worlds');
  }

  bool _needsUpdate() {
    return _lastMapUpdate.difference(DateTime.now()) >= updateInterval ||
        _tournamentMaps.values.contains('');
  }

  Future<void> _downloadTournamentMaps() async {
    for (var mapID in _tournamentMaps.keys) {
      _log.info('Downloading map $mapID');
      // set directory of map to returned directory
      var returnedDirectory =
          await downloadWorkshopItem(gameID, mapID, directory: subDirectory);
      var mapFile = File('$returnedDirectory/$configName');
      if (await mapFile.exists()) {
        _tournamentMaps[mapID] = returnedDirectory;
      } else {
        _log.warning('Downloading of map $mapID failed');
      }
    }
    _lastMapUpdate = DateTime.now();
  }

  Future<void> _parseTournamentMaps() async {
    for (var mapId in _tournamentMaps.keys){
      if (_tournamentMaps[mapId] != null) {
        var mapFile = File('${_tournamentMaps[mapId]}/$configName');
        if (await mapFile.exists()) {
          _log.info('Parsing world for $mapId');
          final parsedFile = XmlDocument.parse(await mapFile.readAsString());
          final parsedWorld =
              parsedFile.getElement('MyObjectBuilder_WorldConfiguration');
          if (parsedWorld != null) {
            var world = World.fromXml(parsedWorld);
            world.mapId = mapId;
            _tournamentWorlds[mapId] = world;
          } else {
            _log.warning('XML file did not contain world configuration data! skipping..');
          }
        } else {
          _log.severe('Config file for $mapId at ${mapFile.path} does not exist!');
        }
      } else {

      }
    }
  }

  void addTournamentMap(int id) {
    _tournamentMaps[id] = null;
  }

  Iterable<World> get tournamentWorlds {
    return _tournamentWorlds.values;
  }

}
