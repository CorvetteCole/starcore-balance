import 'package:logging/logging.dart';
import 'package:pretty_json/pretty_json.dart';

import 'package:starcore_balance_server/MapManager.dart';
import 'package:starcore_balance_server/ModManager.dart';
import 'package:starcore_balance_server/Utilities.dart';

import 'package:xml/xml.dart';

final testXML = r'''
    WeaponName = "X-3", // name of weapon in terminal                DeviateShotAngle = 0.65f,                AimingTolerance = 1f, // 0 - 180 firing angle                AimLeadingPrediction = Advanced, // Off, Basic, Accurate, Advanced                DelayCeaseFire = 0, // Measured in game ticks (6 = 100ms, 60 = 1 seconds, etc..).                Ui = new UiDef                {                    RateOfFire = false,                    DamageModifier = false,                    ToggleGuidance = false,                    EnableOverload = false,                },                Ai = new AiDef                {                    TrackTargets = true,                    TurretAttached = true,                    TurretController = true,                    PrimaryTracking = true,                    LockOnFocus = false,                },                HardWare = new HardwareDef                {                    RotateRate = 0.0023f,                    ElevateRate = 0.0023f,                    MinAzimuth = -180,                    MaxAzimuth = 180,                    MinElevation = -5,                    MaxElevation = 35,                    FixedOffset = false,                    InventorySize = 0.828f,                    Offset = Vector(x: 0, y: 0.35, z: 0),                },                Other = new OtherDef                {                    GridWeaponCap = 0,                    RotateBarrelAxis = 0,                    EnergyPriority = 2,                    MuzzleCheck = false,                    Debug = false,                },                Loading = new LoadingDef                {                    RateOfFire = 120,                    BarrelSpinRate = 0, // visual only, 0 disables and uses RateOfFire                    BarrelsPerShot = 1,                    TrajectilesPerBarrel = 1, // Number of Trajectiles per barrel per fire event.                    SkipBarrels = 0,                    ReloadTime = 780, // Measured in game ticks (6 = 100ms, 60 = 1 seconds, etc..).                    DelayUntilFire = 0, // Measured in game ticks (6 = 100ms, 60 = 1 seconds, etc..).                    HeatPerShot = 0, //heat generated per shot                    MaxHeat = 20000, //max heat before weapon enters cooldown (70% of max heat)                    Cooldown = .999f, //percent of max heat to be under to start firing again after overheat accepts .2-.95                    HeatSinkRate = 200000, //amount of heat lost per second                    DegradeRof = false, // progressively lower rate of fire after 80% heat threshold (80% of max heat)                    ShotsInBurst = 0,                    DelayAfterBurst = 960, // Measured in game ticks (6 = 100ms, 60 = 1 seconds, etc..).                    FireFullBurst = false,                },                Audio = new HardPointAudioDef                {                    PreFiringSound = "",                    FiringSound = "ArcMexHeavyCannon", // WepShipGatlingShot                    FiringSoundPerShot = true,                    ReloadSound = "",                    NoAmmoSound = "",                    HardPointRotationSound = "WepTurretGatlingRotate",                    BarrelRotationSound = "WepShipGatlingRotation",                },                Graphics = new HardPointParticleDef                {                    Barrel1 = new ParticleDef //FIXTHIS                    {                        Name = "",//Muzzle_Flash_Large                        Color = Color(red: 5, green: 3, blue: 1, alpha: 1),                        Offset = Vector(x: 0, y: 0, z: 0),                        Extras = new ParticleOptionDef                        {                            Loop = false,                            Restart = false,                            MaxDistance = 500,                            MaxDuration = 120,                            Scale = 0.75f,                        },                    },                    Barrel2 = new ParticleDef //FIXTHIS                    {                        Name = "MuzzleCannonX3
    ''';

final testHardPointXML = r'''
    HardPoint = new HardPointDef
            {
                WeaponName = "RightRetractPDC", // name of weapon in terminal
                DeviateShotAngle = 0.3f,
                AimingTolerance = 4f, // 0 - 180 firing angle
                AimLeadingPrediction = Advanced, // Off, Basic, Accurate, Advanced
                DelayCeaseFire = 10, // Measured in game ticks (6 = 100ms, 60 = 1 seconds, etc..).
                AddToleranceToTracking = false,
                CanShootSubmerged = false,

                Ui = new UiDef
                {
                    RateOfFire = true,
                    DamageModifier = false,
                    ToggleGuidance = false,
                    EnableOverload =  false,
                },
                Ai = new AiDef
                {
                    TrackTargets = true,
                    TurretAttached = true,
                    TurretController = true,
                    PrimaryTracking = true,
                    LockOnFocus = false,
                },
                HardWare = new HardwareDef
                {
                    RotateRate = 0.03f,
                    ElevateRate = 0.03f,
                    MinAzimuth = -180,
                    MaxAzimuth = 180,
                    MinElevation = -20,
                    MaxElevation = 90,
                    FixedOffset = false,
                    InventorySize = 0.800f,
                    Offset = Vector(x: 0, y: 0, z: 0),
                    Armor = IsWeapon, // IsWeapon, Passive, Active
                },
                Other = new OtherDef
                {
                    GridWeaponCap = 0, // 0=disabled
                    RotateBarrelAxis = 3,
                    EnergyPriority = 0,
                    MuzzleCheck = false,
                    Debug = false,
                },
                Loading = new LoadingDef
                {
                    RateOfFire = 2600,
                    BarrelsPerShot = 1,
                    TrajectilesPerBarrel = 1, // Number of Trajectiles per barrel per fire event.
                    SkipBarrels = 0,
                    ReloadTime = 240, // Measured in game ticks (6 = 100ms, 60 = 1 seconds, etc..).
                    DelayUntilFire = 0, // Measured in game ticks (6 = 100ms, 60 = 1 seconds, etc..).
                    HeatPerShot = 4, //heat generated per shot
                    MaxHeat = 3000, //max heat before weapon enters cooldown (70% of max heat)
                    Cooldown = .75f, //percent of max heat to be under to start firing again after overheat accepts .2-.95
                    HeatSinkRate = 130, //amount of heat lost per second
                    DegradeRof = false, // progressively lower rate of fire after 80% heat threshold (80% of max heat)
                    ShotsInBurst = 0,
                    DelayAfterBurst = 0, // Measured in game ticks (6 = 100ms, 60 = 1 seconds, etc..).
                    FireFullBurst = false,
                    GiveUpAfterBurst = false,
                    BarrelSpinRate = 2600, // visual only, 0 disables and uses RateOfFire
                
                },
                Audio = new HardPointAudioDef
                {
                    PreFiringSound = "",
                    FiringSound = "WepTurretInteriorFire", // subtype name from sbc
                    FiringSoundPerShot = true,
                    ReloadSound = "",
                    NoAmmoSound = "",
                    HardPointRotationSound = "WepTurretGatlingRotate",
                    BarrelRotationSound = "",
                    FireSoundEndDelay = 120, // Measured in game ticks(6 = 100ms, 60 = 1 seconds, etc..).
                },
                Graphics = new HardPointParticleDef
                {
                    Barrel1 = new ParticleDef
                    {
                        Name = "Smoke_LargeGunShot", // Smoke_LargeGunShot
                        Color = Color(red: 1, green: 1, blue: 1, alpha: 1),
                        Offset = Vector(x: 0, y: 0, z: 0),
                        Extras = new ParticleOptionDef
                        {
                            Loop = false,
                            Restart = false,
                            MaxDistance = 200,
                            MaxDuration = 1,
                            Scale = 1.0f,
                        },
                    },
                    Barrel2 = new ParticleDef
                    {
                        Name = "Muzzle_Flash_PDC",//Muzzle_Flash_Large
                        Color = Color(red: 1, green: 1, blue: 1, alpha: 1),
                        Offset = Vector(x: 0, y: 0, z: 0),
                        Extras = new ParticleOptionDef
                        {
                            Loop = false,
                            Restart = false,
                            MaxDistance = 200,
                            MaxDuration = 1,
                            Scale = 1f,
                        },import 'package:xml/xml.dart';
                    },
                },
                ''';

final weirdXML = r'''
    <?xml version="1.0"?>
<Definitions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <EntityComponents>
    <EntityComponent xsi:type="MyObjectBuilder_InventoryComponentDefinition">
      <Id>
        <TypeId>Inventory</TypeId>
        <SubtypeId>BlockRestrictions_StarCore_MWI</SubtypeId>
      </Id>
      <Description>
        [?xml version="1.0" encoding="utf-16"?]
        [DefaultSettings xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"]
          [ForceSetting]true[/ForceSetting]
          
          [DefaultSetting]
            [Type]MyObjectBuilder_LargeMissileTurret/BattleshipCannonMK22[/Type]
            [AllowedForPlayer]false[/AllowedForPlayer]
          [/DefaultSetting]
          
          [DefaultSetting]
            [Type]MyObjectBuilder_LargeMissileTurret/BFG_M[/Type]
            [AllowedForPlayer]false[/AllowedForPlayer]
          [/DefaultSetting]
          
          [DefaultSetting]
            [Type]MyObjectBuilder_SmallMissileLauncher/Static150mm[/Type]
            [AllowedForPlayer]false[/AllowedForPlayer]
          [/DefaultSetting]
          
          [DefaultSetting]
            [Type]MyObjectBuilder_SmallMissileLauncher/Static30mm[/Type]
            [AllowedForPlayer]false[/AllowedForPlayer]
          [/DefaultSetting]
          
          [DefaultSetting]
            [Type]MyObjectBuilder_LargeMissileTurret/TelionAFGen2[/Type]
            [AllowedForPlayer]false[/AllowedForPlayer]
          [/DefaultSetting]
          
          [DefaultSetting]
            [Type]MyObjectBuilder_LargeMissileTurret/TelionAMACM[/Type]
            [AllowedForPlayer]false[/AllowedForPlayer]
          [/DefaultSetting]
          
          [DefaultSetting]
            [Type]MyObjectBuilder_LargeMissileTurret/TelionAF[/Type]
            [AllowedForPlayer]false[/AllowedForPlayer]
          [/DefaultSetting]
          
          [DefaultSetting]
            [Type]MyObjectBuilder_SmallMissileLauncher/M2Destroyer[/Type]
            [AllowedForPlayer]false[/AllowedForPlayer]
          [/DefaultSetting]
          
          [DefaultSetting]
            [Type]MyObjectBuilder_SmallMissileLauncher/M12Swarm[/Type]
            [AllowedForPlayer]false[/AllowedForPlayer]
          [/DefaultSetting]
        [/DefaultSettings]
      </Description>
    </EntityComponent>
  </EntityComponents>
</Definitions>
''';

final gameId = 244850;
final testTournamentMaps = [2451284843];
final subDirectory = '/steamcmd/';

final _log = Logger('Main');

void main(List<String> arguments) async {
  Logger.root.level = Level.INFO; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  //xmlTest();

  var mapManager = MapManager(gameId, subDirectory: subDirectory, tournamentMaps: testTournamentMaps);
  var modManager = ModManager(gameId, subDirectory);
  await mapManager.updateMaps();
  await modManager.updateMods(mapManager.tournamentWorlds);
  
  for (var mod in modManager.enabledWeaponData.keys) {
    print('Enabled weapons for ${modManager.modIds[mod]?.friendlyName}:');
    for (var weapon in modManager.enabledWeaponData[mod]!){
      print(' - ${weapon.hardpoint?.weaponName} (${weapon.subTypeId})');
    }
  }



  //print(parseEnumString('AimLeadingPrediction', testHardPointXML));

  //for (var world in mapManager.tournamentWorlds){
  //_log.fine(prettyJson(world.toJson()));

  // print('Printing parsed mod data: ');
  // for (var mod in world.mods){
  //     print('${mod.friendlyName}, Mod ID: ${mod.publishedFileId}');
  // }
  //
  // print('Printing parsed settings data: ');
  // for (var settingKey in world.settings.keys){
  //   print('Setting $settingKey has value: ${world.settings[settingKey]}');
  // }
  //}
}

void xmlTest(){
  final document = XmlDocument.parse(weirdXML);
  //print(document.toXmlString(pretty: true, indent: '\t'));



  var desc = document.findAllElements('Description');
  for (var t in desc) {
    //print(t.toXmlString(pretty: true, indent: '\t'));
    var weirdString = t.innerXml;
    weirdString = weirdString.replaceAll('[', '<');
    weirdString = weirdString.replaceAll(']', '>');
    print(weirdString);
    final weirdDoc = XmlDocument.parse(weirdString);
    print(weirdDoc.toXmlString(pretty: true, indent: '\t'));
  }
}
