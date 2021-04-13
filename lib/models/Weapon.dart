import 'package:json_annotation/json_annotation.dart';

import 'weaponcore/Ammo.dart';
import 'weaponcore/Hardpoint.dart';
import 'weaponcore/Targeting.dart';

import '../Utilities.dart';

part 'Weapon.g.dart';

// TODO see if I can switch to using the dart:convert toJson instead of doing this
@JsonSerializable(explicitToJson: true)
class Weapon {

  Set<Ammo> ammo = {};
  late Hardpoint hardpoint;
  late Targeting targeting;

  @JsonKey(ignore: true)
  List<String> ammoNames = [];


  Weapon(this.ammo, this.hardpoint, this.targeting);

  factory Weapon.fromJson(Map<String, dynamic> json) => _$WeaponFromJson(json);
  Map<String, dynamic> toJson() => _$WeaponToJson(this);

  Weapon.fromScript(Iterable<String> definition){
    var hardpointList = getCodeBlock('new HardPointDef', definition);
    var targetingList = getCodeBlock('new TargetingDef', definition);
    var ammoList = getCodeBlock('Ammos = new', definition); // TODO most easily broken part of the parsing

    hardpoint = Hardpoint.fromScript(hardpointList);

    targeting = Targeting.fromScript(targetingList);


    // TODO convert from using list of strings to just raw strings
    // TODO do better regex?
    var ammoRegEx = RegExp(r'\s*(?<value>[^,\s\[\]{}\n=]+)\s*,*');
    var matches = ammoRegEx.allMatches(ammoList.join('\n'));
    for (var t in matches){
      // I'm bad at regex, couldn't get the above to do what I wanted so we will filter false positives here for now
      if (t.namedGroup('value') != 'Ammos' && t.namedGroup('value') != 'new'){
        ammoNames.add(t.namedGroup('value')!);
      }
    }

    print('juice');
  }


  void parseAmmoDefinition(List<String> ammoDefinition){
    ammo.add(Ammo.fromScript(ammoDefinition));
  }




}