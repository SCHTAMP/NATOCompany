[] spawn
{
	_curatorUIDs = getArray (missionConfigFile >> "Curators" >> "list");

	if (getPlayerUID player in _curatorUIDs) then
	{
		waitUntil {player isEqualTo vehicle player};
		[vehicle player] remoteExec ["HashCode_Curator_HandleRespawn",2];
	};
};