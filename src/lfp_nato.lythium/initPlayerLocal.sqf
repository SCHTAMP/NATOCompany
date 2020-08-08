_EndSplashScreen = {for "_x" from 1 to 4 do {endLoadingScreen; sleep 3;};};
[] spawn _EndSplashScreen;
[] execVM "scripts\curator.sqf";
base = [player] spawn {sleep 5;execVM "scripts\introtext.sqf";sleep 120;execVM "scripts\restart_anonce.sqf"};
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
player addeventhandler ["killed", {[player,[missionnamespace,"virtualinventory"]] call Bis_fnc_saveinventory;}];
player addeventhandler ["respawn", {[player,[missionnamespace,"virtualinventory"]] call Bis_fnc_loadinventory;}];
player addeventhandler ["respawn", {[] execVM "onplayerrespawn.sqf";}];

if (side player == west) then {
["ace_arsenal_displayClosed", {
_radio = player call TFAR_fnc_activeSWRadio;
if (isNil "_radio") then {
    if ("tf_anprc152" in assignedItems player) then {
   // hintSilent "You already have radio";
}
else {
    player linkItem "tf_anprc152";
   //  hintSilent "Radio Added";
    };
};
}] call CBA_fnc_addEventHandler;};
