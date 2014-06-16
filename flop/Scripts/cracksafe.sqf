private["_obj","_unit","_item","_value"];
_unit = _this select 0;
//flpvault = "Land_CargoBox_V1_F" createVehicle getPos player;
//flpvault setPosATL [3695.12,13151.3,0.00143909];

flpvaultcoords = [(getPosATL flpvault select 0), (getPosATL flpvault select 1), (getPosATL flpvault select 2)];


hint "Cracking the Safe...";
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%","Cracking Progress"];
_progress progressSetPosition 0.01;
_cP = 0.00;

_taco = 1;
while{_taco == 1} do
	{
		sleep  0.001;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Cracking Progress"];
		if(_cP >= 1) exitWith {};
		if(player distance flpvault > 3) exitWith {hint "You must stay within 3 of the safe!";};
	};
	
	5 cutText ["","PLAIN"];

	//_item = _x;
	//_value = missionNamespace getVariable _item;

for [{_count=0},{_count<10},{_count=_count+1}] do
	{
	_safez = [(getPosATL flpvault select 0) + (random 1.00), (getPosATL flpvault select 1) + (random 1.00), (getPosATL flpvault select 2)];
	_pos = flpvault;
	//_pos = [_pos select 0, _pos select 1, _pos select 2];
	_obj = "Land_Money_F" createVehicle [_safez select 0, _safez select 1, (_safez select 2) + 1.5];
	_obj setVelocity [(random 3), (random 3), (random 3)];
	_obj setVariable["item",["money",random 50000],true];
	//_obj setPos [_safez select 0, _safez select 1, (_safez select 2) + 1.5];
	
	[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP;
	//missionNamespace setVariable[_x,0];
				
	};
	deleteVehicle flpvault;
	
	sleep 15;
	//flpvaultcoords = [3679.02,13146.3,0.00247057];
	flpvault = "Land_CargoBox_V1_F" createVehicle [(flpvaultcoords select 0), (flpvaultcoords select 1), (flpvaultcoords select 2)];
	flpvault allowDamage false; 
	flpvault enableSimulation false; 
	flpvault addAction["Crack Safe","flop\Scripts\cracksafe.sqf","",99,false,false,"",' playerSide == civilian && !(_target getVariable ["fed_rob_ip",false]) && !(_target getVariable ["fed_locked",false]) && (currentWeapon player) != ""'];