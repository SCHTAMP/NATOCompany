params ["_target", "_caller", "_actionId", "_arguments"];

diag_log format ["%1", [_target, _caller, _actionId, _arguments]];

_arguments params ["_type", ["_offset", 3], ["_rotation", 0, [0]]];

// ["ACE_epinephrine","ACE_tourniquet","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_fieldDressing","ACE_packingBandage","ACE_splint","ACE_elasticBandage","ACE_bodyBag","ACE_morphine"]

private _SendToChat = {
	params ["_target", "_text"];
	_text remoteExec ["systemChat", _target];
};

if (isNil "_type") exitWith {
	[_caller, "Type not defined"] call _SendToChat;
};


BOXES = ["C_IDAP_supplyCrate_F", "B_supplyCrate_F", "ACE_medicalSupplyCrate_advanced"];

private _spawn_medic = {
	params["_spawnPoint", ["_BType", 0], ["_mult", 1] ];

	_classname = BOXES select _BType;
	_obj = createVehicle [_classname,_spawnPoint,[],1];

// CLEAR
	clearWeaponCargoGlobal _obj; 
	clearMagazineCargoGlobal _obj; 
	clearItemCargoGlobal _obj;
	clearBackpackCargoGlobal _obj;
//
	_toAdd = [
		["ACE_epinephrine", 70],
		["ACE_morphine", 70],
		["ACE_splint", 50],
		["ACE_tourniquet", 50],
		["ACE_bloodIV", 30],
		["ACE_bloodIV_250", 40],
		["ACE_bloodIV_500", 50],
		["ACE_fieldDressing", 100],
		["ACE_packingBandage", 100],
		["ACE_elasticBandage", 100],
		["ACE_bodyBag", 40]
	];

	
	{
		_obj addItemCargoGlobal [_x select 0, (_x select 1) / _mult]; 
	} forEach _toAdd;

	_obj setVariable ["ace_dragging_ignoreWeightCarry", true, true];
};

private _spawn_ammo = {
	params["_spawnPoint"];

	_classname = BOXES select 1;
	_obj = createVehicle [_classname,_spawnPoint,[],1];

	clearWeaponCargoGlobal _obj; 
	clearMagazineCargoGlobal _obj; 
	clearItemCargoGlobal _obj;
	clearBackpackCargoGlobal _obj;


};

private _isBusy = {
	params ["_spawnPoint", ["_sp", [false,""]], ["_near", []]];
	_near = nearestObjects [_spawnPoint,["Car","Truck","Air","Tank","Ship","Submarine", "ReammoBox_F"],2];
	if((count _near) isEqualTo 0) then {
		_sp = [true, _spawnPoint];
	};

	_sp
};

_pos = _target getpos [_offset, (getDir _target + _rotation)];
_pos = [_pos] call _isBusy;

diag_log format ["%1", _pos];

if !(_pos select 0) exitWith {[_caller, "Spawn Position is busy."] call _SendToChat;};

switch (_type) do {
	case ("medic"): {
		[_pos select 1] call _spawn_medic;
	};
	case ("medic_small"): {
		[_pos select 1, 2, 2] call _spawn_medic;
	};
	default {
		false;
	};
};