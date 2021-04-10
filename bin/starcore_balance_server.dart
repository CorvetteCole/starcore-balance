import 'package:xml/xml.dart';
import 'package:logging/logging.dart';
import 'package:pretty_json/pretty_json.dart';

import 'package:starcore_balance_server/models/World.dart';
import 'package:starcore_balance_server/MapManager.dart';

final starcoreXml = '''<?xml version="1.0"?>
<MyObjectBuilder_WorldConfiguration xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <Settings xsi:type="MyObjectBuilder_SessionSettings">
    <GameMode>Creative</GameMode>
    <InventorySizeMultiplier>3</InventorySizeMultiplier>
    <BlocksInventorySizeMultiplier>1</BlocksInventorySizimport 'models/World.dart';eMultiplier>
    <AssemblerSpeedMultiplier>3</AssemblerSpeedMultiplier>
    <AssemblerEfficiencyMultiplier>3</AssemblerEfficiencyMultiplier>
    <RefinerySpeedMultiplier>3</RefinerySpeedMultiplier>
    <OnlineMode>PUBLIC</OnlineMode>
    <MaxPlayers>16</MaxPlayers>
    <MaxFloatingObjects>56</MaxFloatingObjects>
    <MaxBackupSaves>0</MaxBackupSaves>
    <MaxGridSize>0</MaxGridSize>
    <MaxBlocksPerPlayer>0</MaxBlocksPerPlayer>
    <TotalPCU>0</TotalPCU>
    <PiratePCU>50000</PiratePCU>
    <MaxFactionsCount>0</MaxFactionsCount>
    <BlockLimitsEnabled>NONE</BlockLimitsEnabled>
    <EnableRemoteBlockRemoval>true</EnableRemoteBlockRemoval>
    <EnvironmentHostility>SAFE</EnvironmentHostility>
    <AutoHealing>true</AutoHealing>
    <EnableCopyPaste>true</EnableCopyPaste>
    <WeaponsEnabled>true</WeaponsEnabled>
    <ShowPlayerNamesOnHud>true</ShowPlayerNamesOnHud>
    <ThrusterDamage>true</ThrusterDamage>
    <CargoShipsEnabled>false</CargoShipsEnabled>
    <EnableSpectator>false</EnableSpectator>
    <WorldSizeKm>0</WorldSizeKm>
    <RespawnShipDelete>false</RespawnShipDelete>
    <ResetOwnership>false</ResetOwnership>
    <WelderSpeedMultiplier>5</WelderSpeedMultiplier>
    <GrinderSpeedMultiplier>2</GrinderSpeedMultiplier>
    <RealisticSound>false</RealisticSound>
    <HackSpeedMultiplier>0.33</HackSpeedMultiplier>
    <PermanentDeath>false</PermanentDeath>
    <AutoSaveInMinutes>0</AutoSaveInMinutes>
    <EnableSaving>true</EnableSaving>
    <InfiniteAmmo>false</InfiniteAmmo>
    <EnableContainerDrops>true</EnableContainerDrops>
    <SpawnShipTimeMultiplier>0</SpawnShipTimeMultiplier>
    <ProceduralDensity>0.5</ProceduralDensity>
    <ProceduralSeed>0</ProceduralSeed>
    <DestructibleBlocks>true</DestructibleBlocks>
    <EnableIngameScripts>false</EnableIngameScripts>
    <ViewDistance>20000</ViewDistance>
    <VoxelGeneratorVersion>4</VoxelGeneratorVersion>
    <EnableOxygen>false</EnableOxygen>
    <EnableOxygenPressurization>false</EnableOxygenPressurization>
    <Enable3rdPersonView>true</Enable3rdPersonView>
    <EnableEncounters>false</EnableEncounters>
    <EnableConvertToStation>false</EnableConvertToStation>
    <StationVoxelSupport>true</StationVoxelSupport>
    <EnableSunRotation>false</EnableSunRotation>
    <EnableRespawnShips>false</EnableRespawnShips>
    <ScenarioEditMode>false</ScenarioEditMode>
    <Scenario>false</Scenario>
    <CanJoinRunning>false</CanJoinRunning>
    <PhysicsIterations>8</PhysicsIterations>
    <SunRotationIntervalMinutes>1440</SunRotationIntervalMinutes>
    <EnableJetpack>true</EnableJetpack>
    <SpawnWithTools>true</SpawnWithTools>
    <StartInRespawnScreen>false</StartInRespawnScreen>
    <EnableVoxelDestruction>false</EnableVoxelDestruction>
    <MaxDrones>5</MaxDrones>
    <EnableDrones>false</EnableDrones>
    <EnableWolfs>false</EnableWolfs>
    <EnableSpiders>false</EnableSpiders>
    <FloraDensityMultiplier>1</FloraDensityMultiplier>
    <EnableStructuralSimulation>false</EnableStructuralSimulation>
    <MaxActiveFracturePieces>50</MaxActiveFracturePieces>
    <BlockTypeLimits>
      <dictionary />
    </BlockTypeLimits>
    <EnableScripterRole>false</EnableScripterRole>
    <MinDropContainerRespawnTime>5</MinDropContainerRespawnTime>
    <MaxDropContainerRespawnTime>20</MaxDropContainerRespawnTime>
    <EnableTurretsFriendlyFire>false</EnableTurretsFriendlyFire>
    <EnableSubgridDamage>false</EnableSubgridDamage>
    <SyncDistance>20000</SyncDistance>
    <ExperimentalMode>true</ExperimentalMode>
    <AdaptiveSimulationQuality>false</AdaptiveSimulationQuality>
    <EnableVoxelHand>false</EnableVoxelHand>
    <RemoveOldIdentitiesH>0</RemoveOldIdentitiesH>
    <TrashRemovalEnabled>true</TrashRemovalEnabled>
    <StopGridsPeriodMin>15</StopGridsPeriodMin>
    <TrashFlagsValue>7704</TrashFlagsValue>
    <AFKTimeountMin>0</AFKTimeountMin>
    <BlockCountThreshold>20</BlockCountThreshold>
    <PlayerDistanceThreshold>500</PlayerDistanceThreshold>
    <OptimalGridCount>0</OptimalGridCount>
    <PlayerInactivityThreshold>0</PlayerInactivityThreshold>
    <PlayerCharacterRemovalThreshold>15</PlayerCharacterRemovalThreshold>
    <VoxelTrashRemovalEnabled>false</VoxelTrashRemovalEnabled>
    <VoxelPlayerDistanceThreshold>5000</VoxelPlayerDistanceThreshold>
    <VoxelGridDistanceThreshold>5000</VoxelGridDistanceThreshold>
    <VoxelAgeThreshold>24</VoxelAgeThreshold>
    <EnableResearch>false</EnableResearch>
    <EnableGoodBotHints>true</EnableGoodBotHints>
    <OptimalSpawnDistance>900</OptimalSpawnDistance>
    <EnableAutorespawn>false</EnableAutorespawn>
    <EnableBountyContracts>false</EnableBountyContracts>
    <EnableSupergridding>false</EnableSupergridding>
    <EnableEconomy>false</EnableEconomy>
    <DepositsCountCoefficient>2</DepositsCountCoefficient>
    <DepositSizeDenominator>30</DepositSizeDenominator>
    <WeatherSystem>false</WeatherSystem>
    <HarvestRatioMultiplier>1</HarvestRatioMultiplier>
    <TradeFactionsCount>15</TradeFactionsCount>
    <StationsDistanceInnerRadius>10000000</StationsDistanceInnerRadius>
    <StationsDistanceOuterRadiusStart>10000000</StationsDistanceOuterRadiusStart>
    <StationsDistanceOuterRadiusEnd>30000000</StationsDistanceOuterRadiusEnd>
    <EconomyTickInSeconds>1200</EconomyTickInSeconds>
    <SimplifiedSimulation>false</SimplifiedSimulation>
    <EnablePcuTrading>true</EnablePcuTrading>
    <FamilySharing>true</FamilySharing>
    <EnableSelectivePhysicsUpdates>false</EnableSelectivePhysicsUpdates>
    <PredefinedAsteroids>false</PredefinedAsteroids>
    <UseConsolePCU>false</UseConsolePCU>
    <MaxPlanets>99</MaxPlanets>
    <OffensiveWordsFiltering>false</OffensiveWordsFiltering>
    <AdjustableMaxVehicleSpeed>true</AdjustableMaxVehicleSpeed>
  </Settings>
  <Mods>
    <ModItem FriendlyName="StarCore Modpack">
      <Name>2419038651.sbm</Name>
      <PublishedFileId>2419038651</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
    </ModItem>
    <ModItem FriendlyName="Ultimate Spectator">
      <Name>1914807557.sbm</Name>
      <PublishedFileId>1914807557</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
    </ModItem>
    <ModItem FriendlyName="Say No To Scrap">
      <Name>1146278097.sbm</Name>
      <PublishedFileId>1146278097</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
    </ModItem>
    <ModItem FriendlyName="Text HUD API">
      <Name>758597413.sbm</Name>
      <PublishedFileId>758597413</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="Milkyway Skybox">
      <Name>670948349.sbm</Name>
      <PublishedFileId>670948349</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="StarCore Skybox Alignment Patch">
      <Name>2451526878.sbm</Name>
      <PublishedFileId>2451526878</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="StarCore Battle Points">
      <Name>2450877594.sbm</Name>
      <PublishedFileId>2450877594</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="StarCore Boosted Thrusters">
      <Name>2450881223.sbm</Name>
      <PublishedFileId>2450881223</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="TeamSpot">
      <Name>1896299812.sbm</Name>
      <PublishedFileId>1896299812</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="DamageSphere">
      <Name>2448648454.sbm</Name>
      <PublishedFileId>2448648454</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="StarCore - MWI Weapon Collection 1">
      <Name>2448838169.sbm</Name>
      <PublishedFileId>2448838169</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="StarCore - MWI Homing Weaponry">
      <Name>2448843940.sbm</Name>
      <PublishedFileId>2448843940</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="AQD - Armored Thrusters">
      <Name>1810920525.sbm</Name>
      <PublishedFileId>1810920525</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="Serpent Arms Tournament Version">
      <Name>2446645084.sbm</Name>
      <PublishedFileId>2446645084</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="ShipPoints">
      <Name>2444581264.sbm</Name>
      <PublishedFileId>2444581264</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="MA Weapons Starcore">
      <Name>2441246446.sbm</Name>
      <PublishedFileId>2441246446</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="Block Restrictions">
      <Name>2053202808.sbm</Name>
      <PublishedFileId>2053202808</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="StarCore Remove Prohibited Blocks">
      <Name>2421597411.sbm</Name>
      <PublishedFileId>2421597411</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="StarCore Logo Pack">
      <Name>2425204399.sbm</Name>
      <PublishedFileId>2425204399</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="SE MiniMap (RADAR)">
      <Name>1939217705.sbm</Name>
      <PublishedFileId>1939217705</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="Defense Shields - v1.93(25)">
      <Name>1365616918.sbm</Name>
      <PublishedFileId>1365616918</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="WCT AWG Space Pack">
      <Name>2419628241.sbm</Name>
      <PublishedFileId>2419628241</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="StarCore Visual Adjustments">
      <Name>2419438410.sbm</Name>
      <PublishedFileId>2419438410</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="[VSI] Recolorable Thrusters">
      <Name>1354870812.sbm</Name>
      <PublishedFileId>1354870812</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="WCT PDC Turret">
      <Name>2402363651.sbm</Name>
      <PublishedFileId>2402363651</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="StarCore Halo UNSC Ship Weapons">
      <Name>2408921534.sbm</Name>
      <PublishedFileId>2408921534</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="WCT MA Designator">
      <Name>2402377528.sbm</Name>
      <PublishedFileId>2402377528</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="WeaponCore - 1.6(74)">
      <Name>1918681825.sbm</Name>
      <PublishedFileId>1918681825</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="WCT NorthWind_Weapons Tournament">
      <Name>2404994027.sbm</Name>
      <PublishedFileId>2404994027</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="StrongLightArmor + AQD Armor Expansion">
      <Name>2392459514.sbm</Name>
      <PublishedFileId>2392459514</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="Relative Top Speed">
      <Name>1359618037.sbm</Name>
      <PublishedFileId>1359618Unnamed037</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="Friendly Nametags - Klime">
      <Name>1881448693.sbm</Name>
      <PublishedFileId>1881448693</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="BuildInfo (extra block+terminal info, air leak finder)">
      <Name>514062285.sbm</Name>
      <PublishedFileId>514062285</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
    <ModItem FriendlyName="AQD - No Armor Edges">
      <Name>1825460112.sbm</Name>
      <PublishedFileId>1825460112</PublishedFileId>
      <PublishedServiceName>Steam</PublishedServiceName>
      <IsDependency>true</IsDependency>
    </ModItem>
  </Mods>
  <SessionName>StarCore Kappa - Test Tournament #6</SessionName>
  <LastSaveTime>2021-04-09T17:18:27.0651423+02:00</LastSaveTime>
</MyObjectBuilder_WorldConfiguration>
''';

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
  await mapManager.downloadMods();

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

  // final parsedFile = XmlDocument.parse(starcoreXml);
  // final parsedWorld =
  //     parsedFile.getElement('MyObjectBuilder_WorldConfiguration');
  // if (parsedWorld == null) {
  //   throw FormatException('XML file did not contain world configuration data!');
  // }
  //
  // var world = World.fromXml(parsedWorld);
  //
  // //print('XML: \n $parsedWorld');
  // // print('Printing parsed mod data: ');
  // // for (var mod in world.mods){
  // //     print('${mod.friendlyName}, Mod ID: ${mod.publishedFileId}');
  // // }
  // //
  // // print('Printing parsed settings data: ');
  // // for (var settingKey in world.settings.keys){
  // //   print('Setting $settingKey has value: ${world.settings[settingKey]}');
  // // }
  //
  // // print(world.sessionName);
  // // print(world.lastSaveTime);
  //
  // print('JSON: ');

}
