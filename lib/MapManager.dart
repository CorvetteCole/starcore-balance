import 'dart:io';
import 'package:logging/logging.dart';
import 'package:xml/xml.dart';

import 'models/World.dart';
import 'Steam.dart';
import 'ModManager.dart';


class MapManager {
  final _log = Logger('MapManager');
  final gameId;
  final subDirectory;
  final _configName = 'Sandbox_config.sbc';
  final Duration updateInterval;
  late final ModManager _modManager;

  Map<int, String?> _tournamentMaps = {};
  Map<int, World> _tournamentWorlds = {};
  var _lastMapUpdate = DateTime.fromMillisecondsSinceEpoch(0);

  MapManager(this.gameId,
      {this.subDirectory = '/steamcmd/',
      this.updateInterval = const Duration(days: 1),
      List<int>? tournamentMaps}) {
    _modManager = ModManager(gameId, subDirectory);
    if (tournamentMaps != null) {
      for (var mapID in tournamentMaps) {
        _tournamentMaps[mapID] = null;
      }
    }
  }

  // TODO maybe get rid of the check and just call this updateMaps?
  // the plan is to run this on a callback for like 24 hours anyways, so it
  // shouldn't matter

  // return true on a map getting updated, false otherwise.
  Future<bool> checkForUpdates({bool force = false}) async {
    if (_needsUpdate() || force) {
      await _downloadTournamentMaps();
      await _parseTournamentMaps();
      await _modManager.updateMods(_tournamentWorlds.values);
      return true;
    }
    return false;
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
          await downloadWorkshopItem(gameId, mapID, directory: subDirectory);
      var mapFile = File('$returnedDirectory/$_configName');
      if (await mapFile.exists()) {
        _tournamentMaps[mapID] = returnedDirectory;
      } else {
        _log.warning('Downloading of map $mapID failed');
      }
    }
    _lastMapUpdate = DateTime.now();
  }

  Future<void> _parseTournamentMaps() async {
    for (var mapId in _tournamentMaps.keys) {
      if (_tournamentMaps[mapId] != null) {
        var mapFile = File('${_tournamentMaps[mapId]}/$_configName');
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
            _log.warning(
                'XML file did not contain world configuration data! skipping..');
          }
        } else {
          _log.severe(
              'Config file for $mapId at ${mapFile.path} does not exist!');
        }
      } else {}
    }
  }

  void addTournamentMap(int id) {
    _tournamentMaps[id] = null;
  }

  Iterable<World> get tournamentWorlds {
    return _tournamentWorlds.values;
  }
}
