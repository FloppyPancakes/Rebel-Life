
//_bombMon = [] execVM "BM.sqf"; // not implimented yet;
//hint "running all use interface check";

_wasPlayers = [];
_bMultiplayer = if (isMultiplayer) then {true} else {false};

while {true} do
{
	EIsync = false;
	if (isServer) then
	{
		_nowPlayers = [];
		
		if (_bMultiplayer) then 
		{
			{
				if (isPlayer _x) then
				{
					_nowPlayers set [(count _nowPlayers),_x];
				};
			}foreach playableUnits;
		}
		else
		{
			{
				if (isPlayer _x) then
				{
					_nowPlayers set [(count _nowPlayers),_x];
				};
			}foreach switchableUnits;
		};

		{
			if (! (_x in _nowPlayers)) then 
			{
				//hint "dead or left";
				_wasPlayers = _wasPlayers - [_x];
			};
		}foreach _wasPlayers;

		{
			if (! (_x in _wasPlayers)) then
			{
				//hint "new guy";
				_x setVariable ["explosive_interface",false];
				_wasPlayers set [(count _wasPlayers),_x];
			};
		}foreach _nowPlayers;
		
		allPlayers = _wasPlayers;
		
		EIsync = true;
		publicVariable "EIsync";
	};
	
	waitUntil {EIsync};
	if (!(player getVariable ["explosive_interface",false])) then
	{
		//player sideChat "running explosive interface";
		nul = [player] execVM "explosive_interface.sqf";
	};
	sleep 5;
};
