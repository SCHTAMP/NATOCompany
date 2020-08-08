pvpfw_chatIntercept_allCommands = [
	[
		"help",
		{
			_commands = "";
			{
				_commands = _commands + (pvpfw_chatIntercept_commandMarker + (_x select 0)) + ", ";
			}forEach pvpfw_chatIntercept_allCommands;
			systemChat format["Available Commands: %1",_commands];
		}
	],
	[
		"jump",
		{player setVelocity [0,0,4]}
	],
	[
		"echo",
		{
			_argument = (_this select 0);
			systemChat format["Echo: %1",_argument];
		}
	],
	[
		"roll",
		{
			_rNumber = ceil random 100;
			_rShans = format["Удача благосклонна к %3 на %1%2",_rNumber, "%", name player];
			[_rShans] remoteExec ["systemChat"];
		}
	],
	[
		"s",
		{
			_bob1 = (_this select 0);
			_warning1 = format ["Игроку %1 выдан арма-страйк",_bob1];
			[_warning1] remoteExec ["systemChat"];
		}
	],
	[
		"w",
		{
			_bob2 = (_this select 0);
			_warning2 = format ["Игрок %1 нарушил правила сервера и получает предупреждение",_bob2];
			[_warning2] remoteExec ["systemChat"];
		}
	],
	[
		"try",
		{
			_bob3 = (_this select 0);
			_rrandom = selectRandom [1,2];
			if (_rrandom == 1) then {
			_vzlom = format ["%1 попытался взломать %2, его попытка неудачна!",name player,_bob3];
			[_vzlom] remoteExec ["systemChat"];}
			else {
			_vzlom = format ["%1 попытался взломать %2, его попытка успешна!",name player,_bob3];
			[_vzlom] remoteExec ["systemChat"];};
		}
	],
	[
		"mrk",
		{
		_bob5 = (_this select 0);
		[] execVM "scripts\chat\targetmarker.sqf";
		}
	]
];