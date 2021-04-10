import 'package:xml/xml.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ModItem.g.dart';

enum PublishedServiceName { STEAM, MODIO, UNKNOWN }

extension ParseToString on PublishedServiceName {
  String toShortString() {
    return toString().split('.').last;
  }
}

@JsonSerializable()
class ModItem {

  String? friendlyName;
  String? name;
  late int publishedFileId;
  PublishedServiceName publishedServiceName = PublishedServiceName.UNKNOWN;
  late bool isDependency;

  ModItem();

  factory ModItem.fromJson(Map<String, dynamic> json) => _$ModItemFromJson(json);
  Map<String, dynamic> toJson() => _$ModItemToJson(this);

  ModItem.fromXml(XmlNode xml) {
    friendlyName = xml.getAttribute('FriendlyName');
    name = xml.getElement('Name')?.text;
    publishedFileId = int.parse(xml.getElement('PublishedFileId')!.text);
    switch (xml.getElement('PublishedServiceName')?.text) {
      case 'Steam':
        publishedServiceName = PublishedServiceName.STEAM;
        break;
      case 'Mod.io':
        publishedServiceName = PublishedServiceName.MODIO;
        break;
    }

    isDependency = xml.getElement('IsDependency')?.text.contains('true') ?? false;
  }
}
