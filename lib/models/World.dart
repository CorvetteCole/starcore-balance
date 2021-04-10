import 'package:xml/xml.dart';
import 'package:logging/logging.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ModItem.dart';

part 'World.g.dart';

@JsonSerializable(explicitToJson: true)
class World {

  String? sessionName;
  DateTime? lastSaveTime;
  Map<String, dynamic> settings = {};
  List<ModItem> mods = [];
  late final int mapId;

  final _log = Logger('World');

  World();

  factory World.fromJson(Map<String, dynamic> json) => _$WorldFromJson(json);
  Map<String, dynamic> toJson() => _$WorldToJson(this);

  World.fromXml(XmlElement xml){
    sessionName = xml.getElement('SessionName')?.text;
    var lastSaveTimeRaw = xml.getElement('LastSaveTime')?.text;
    if (lastSaveTimeRaw != null) {
      lastSaveTime = DateTime.tryParse(lastSaveTimeRaw);
    }

    var modsXml = xml.getElement('Mods')?.findElements('ModItem');
    if (modsXml != null) {
      for (var modXml in modsXml) {
        //print(modXml);
        mods.add(ModItem.fromXml(modXml));
      }
    } else {
      _log.warning("No mods found in world config, this usually isn't right");
    }

    var settingsXml = xml.getElement('Settings')?.children;
    if (settingsXml != null) {
      for (dynamic settingXml in settingsXml) {
        if (settingXml is XmlElement){
          final rawElementValue = settingXml.innerXml;
          dynamic elementValue;
          switch (rawElementValue){
            case 'true':
              elementValue = true;
              break;
            case 'false':
              elementValue = false;
              break;
            default:
              // parse in to double, otherwise just set as the original string type
              elementValue = int.tryParse(rawElementValue) ?? double.tryParse(rawElementValue) ?? rawElementValue;

          }
          settings[settingXml.name.toString()] = elementValue;
        }
      }
    } else {
      _log.severe('World configuration data incomplete... Settings not found!');
      throw FormatException('World configuration data incomplete... Settings not found!');
    }


  }

}