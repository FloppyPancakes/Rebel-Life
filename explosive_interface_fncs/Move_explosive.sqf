private ["_array","_unit","_charge","_class","_clientID","_complexBombs","_posASL"];
waitUntil {!(isNull (findDisplay 46))};
_array = _this select 3; if (isNil ("_array")) then {_array = _this};
_unit = _array select 0;
_charge = _array select 1;
_class = typeOf _charge;
_clientID = owner _unit;
_complexBombs = ["SatchelCharge_Remote_Ammo","APERSMine_Range_Ammo","ATMine_Range_Ammo","APERSBoundingMine_Range_Ammo"];

if (movingExplosive) exitwith {};
_beingMoved = _charge getVariable ["beingMoved",false];
if (_beingMoved) exitwith {hintSilent "Someone else is already moving it"};

_unitItems = items _unit;
_bHasTools = "ToolKit" in _unitItems;
if ((_class in _complexBombs) && (!_bHasTools)) exitwith
{
	cuttext ["You need Tools to move this explosive","PLAIN",0.2];
};



//defining functions

if (isnil("fnc_intersect_pos3D")) then 
{
	fnc_intersect_pos3D = compile loadfile "explosive_interface_fncs\fnc_intersect_pos3D.sqf";
};

if (isnil ("fnc_drop_object")) then
{
	fnc_drop_object = compile preProcessFilelineNumbers "explosive_interface_fncs\fnc_drop_object.sqf"
};

if (isnil ("fnc_get_view_vector")) then
{
	fnc_get_view_vector = compile preProcessFilelineNumbers "explosive_interface_fncs\fnc_get_view_vector.sqf"
};

if (isNil ("zor_Move_Charge")) then
{
	zor_Move_Charge =
	{
		private ["_charge","_posASL","_vectors","_dir"];
		_charge = _this select 0;
		_posASL = _this select 1; if (isNil ("_posASL")) then {_posASL = [0,0,0]};
		_vectors = _this select 2; if (isNil ("_vectors")) then {_vectors = [[0,0,0],[0,0,0]]};
		_dir = _this select 3; if (isNil ("_dir")) then {_dir = getDir _charge};
			
		if (isNull _charge) exitwith {};
		
		if ((_posASL distance [0,0,0]) >= 0.1) then
		{
			_charge setPosASL _posASL;
		};
			
		if (((_vectors select 0) distance [0,0,0]) >= 0.1) then
		{
			_charge setVectorDirandUp _vectors;
		}
		else
		{
			_charge setVectorUP (surfaceNormal _posASL);
			_charge setDir _dir;
		};
	};
};

// start;

//make sure the network knows charge is being moved;
_charge setVariable ["beingMoved",true,true];

//create dummy for local client;
_dummyCharge = _class createVehicle [0,0,0];
detach _charge;

placeConfirm = false;
movingExplosive = true;
holdingKey = false;

placePos = [0,0,0];



//create spawn for confirm key

nul = [_unit,_charge,_dummyCharge] spawn 
{
	private ["_unit","_charge"];
	_unit = _this select 0 ;
	_charge = _this select 1;
	_dummyCharge = _this select 2;
	
	sleep 0.2; // give user time to lift off the key after pickup;
	
	_keyNames = actionKeysNamesArray "ActionContext";

	_bHadPlaceHint = _unit getVariable ["bHadPlaceHint",false];
	_bHadThrowHint = _unit getVariable ["bHadThrowHint",false];
	
	_message = (str(_keyNames));
	if (!(_bHadPlaceHint && _bHadThrowHint)) then 
	{
		if (_charge isKindof "Grenade") then
		{
			if (!_bHadThrowHint) then
			{
				nul = [_keyNames] spawn
				{
					private ["_keyNames"];
					_keyNames = _this select 0;
					_throwMessage = format [" \n Hold %1 to throw",_keyNames];
					_placeMessage = format [" \n Tap %1 to place/drop",_keyNames];
					cuttext [_throwMessage,"PLAIN",0.3];
					sleep 2;
					cuttext [_placeMessage,"PLAIN",0.3];
				};
				_bHadThrowHint = _unit setVariable ["bHadThrowHint",true];
			};
		}
		else
		{			
			if (!_bHadPlaceHint) then
			{
			_placeMessage = format [" \n Tap %1 to place/drop",_keyNames];
			cuttext [_placeMessage,"PLAIN",0.3];
			_unit setVariable ["bHadPlaceHint",true];
			};
		};
	};
	
	// create interaction keys in a time sensitive way to avoid conflicts;
	nul = [] spawn
	{
		actKeys = actionKeys "ActionContext";
		actionKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown","(if (((_this select 1) in actKeys) && (!placeConfirm))) then {holdingKey = true;};"];
		sleep 0.2; // inline with the need for the key up in the throw mechanic.
		actionKeyUp = (findDisplay 46) displayAddEventHandler ["KeyUp","(if (((_this select 1) in actKeys) && (!placeConfirm))) then {holdingKey = false;};"];
	};
	
	waitUntil {holdingKey};
	if (_charge isKindof "Grenade") then
	{
		nul = [] spawn 
		{
			sleep 0.1;
			if (!holdingKey) exitwith {cuttext ["","PLAIN",0.1];};
			cuttext ["i","PLAIN",0.01];
			sleep 0.05;
			if (!holdingKey) exitwith {cuttext ["","PLAIN",0.1];};
			cuttext [".i.","PLAIN",0.01];
			sleep 0.05;
			if (!holdingKey) exitwith {cuttext ["","PLAIN",0.1];};
			cuttext ["...i...","PLAIN",0.01];
			sleep 0.05;
			if (!holdingKey) exitwith {cuttext ["","PLAIN",0.1];};
			cuttext ["....i....","PLAIN",0.01];
			sleep 0.05;
			if (!holdingKey) exitwith {cuttext ["","PLAIN",0.1];};
			cuttext [".....i.....","PLAIN",0.01];
			sleep 0.05;
			if (!holdingKey) exitwith {cuttext ["","PLAIN",0.1];};
			cuttext ["!.....i.....!","PLAIN",0.01];
			sleep 0.05;
			if (!holdingKey) exitwith {cuttext ["","PLAIN",0.1];};
			cuttext ["..!.....i.....!..","PLAIN",0.01];
			sleep 0.05;
			if (!holdingKey) exitwith {cuttext ["","PLAIN",0.1];};
			cuttext ["...!.....i.....!...","PLAIN",0.01];
			sleep 0.05;
			if (!holdingKey) exitwith {cuttext ["","PLAIN",0.1];};
			cuttext ["....!.....i.....!....","PLAIN",0.01];
			sleep 0.05;
			if (!holdingKey) exitwith {cuttext ["","PLAIN",0.1];};
			cuttext ["!.....!.....i.....!.....!","PLAIN",0.01];
			sleep 0.05;
			while {holdingKey} do
			{
				cuttext ["!.....!.....i.....!.....!","PLAIN",0.01];
			};
		};
	};
	
	_t = time;
	waitUntil {!holdingKey};

	_timeHeld = time - _t;

	if ((_charge iskindof "Grenade") && (_timeHeld >= 0.2)) then
	{
		_timeHeld = (_timeHeld * 2) - 0.2; 						// make the hold duration only 0.5 seconds to reach full power on the throw;
		if (_timeHeld >= 1) then {_timeheld = 1;};
		_velocity = [] call fnc_get_view_vector;
		_i = 0;
		{
			_velocity set [_i,(_x * _timeHeld) * 23];
			_i = _i + 1;
		}foreach _velocity;

		_charge setVelocity _velocity;
		placeConfirm = true;
	}
	else
	{
		nul = [_unit,_charge,_dummyCharge] execVM "explosive_interface_fncs\Place_explosive.sqf";
	};
	
	(findDisplay 46) displayRemoveEventHandler ["KeyDown",actionKeyDown];
	(findDisplay 46) displayRemoveEventHandler ["KeyUp",actionKeyUp];
};

_hiddenPos = getPosASl _charge;
_hiddenPos set [2,(_hiddenPos select 2) - 50];
//_charge setPosASL _hiddenPos;

placeConfirm = false;
movingExplosive = true;

while {sleep 0.01;!placeConfirm && (isPlayer _unit)} do 
{

	_unitPos = getPosATL _unit;
	_intArray = [_unit,2,_charge] call fnc_intersect_pos3D;
	_intPos = _intArray select 0;
	//hint (str(_intPos));
	_intObject = _intArray select 1;
	_dirVector = _intArray select 2;
	_upVector = _intArray select 3;
	_unitDir = getDir _unit;
	
	if (!isnil ("_intPos")) then 
	{

		if (!(_charge iskindof "Grenade")) then 
		{
			_charge setPosASL _intPos;
			_charge setPos (getPos _charge);

			if ((_dirVector distance [0,0,0]) >= 0.1) then
			{
				_charge setVectorDirandUp [_dirVector,_upVector];
			}
			else
			{
				_charge setVectorUP (surfaceNormal _intPos);
				_charge setDir _unitDir;
			};
		}
		else							// keep it local, grenades already update over the network;
		{

			_charge setPosASL _intPos;
			_charge setPos (getPos _charge);
		
			if ((_dirVector distance [0,0,0]) >= 0.1) then
			{
				_charge setVectorDirandUp [_dirVector,_upVector];
			}
			else
			{
				_charge setVectorUP (surfaceNormal _intPos);
				_charge setDir _unitDir;
			};
		};
		
		placePos = _intPos;
		placeSurface = _intObject;
	}
	else
	{
		hint "error placing explosive";
		placePos = [0,0,0];
		placeSurface = "terrain";
	};
};

if !(isPlayer _unit) then
{
	nul = [_charge,_unit] spawn fnc_drop_object;
};

_charge setVariable ["beingMoved",false,true];

placeConfirm = true; 
movingExplosive = false;