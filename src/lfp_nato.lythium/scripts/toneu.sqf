h = [] spawn {
	waitUntil {!isNull findDisplay 46};
	disableSerialization;
	_display = (findDisplay 46) createDisplay "RscDisplayEmpty";
	_ctrlEdit = _display ctrlCreate ["RscEdit", 19998];
	private _width = 30 / 108*safeZoneH /(4/3);
	private _height = 4/ 108*safeZoneH;
	private _bufferY = 15 / 108*safeZoneH;
	private _bufferX = ((safeZoneW / 2) - (_width / 2));
	_ctrlEdit ctrlSetPosition [safeZoneX + _bufferX, safeZoneY + safeZoneH - _bufferY, _width, _height];
	_ctrlEdit ctrlSetBackgroundColor [0,0,0,1];
	_ctrlEdit ctrlCommit 0;
	_ctrlEdit ctrlAddEventHandler ["KeyUp", {params ["_ctrl", "_key"];
		_text = (ctrlText _ctrl);
		_isValid = !(parseNumber _text isEqualTo 0) || (count (_text splitString "0123456789.-") isEqualTo 0); 
		if (_isValid) then {
			_number = parseNumber _text;
			if (_number isEqualTo 960485) 
			then {player setposatl [getpos b1 select 0, getpos b1 select 1, getposatl b1 select 2]; titleText ["Вас провожают до этой комнаты", "BLACK FADED", 0.2];} 
			else {hint "Неа, тебя там не ждут"};
			};
	}];
	ctrlSetFocus _ctrlEdit;
	sleep 15;
	hintSilent "";
};
	