private ["_pos","_below","_object","_obstructed","_zDif","_unit"];
_targetObject = _this select 0;
_unit = _this select 1;

_pos = getposASL _targetObject;

_initDist = 10;
_dist = 10;
_array = [];


if (isnil("fnc_intersects_floor")) then 
{
	fnc_intersects_floor = compile "
	private ['_pos','_below','_obstructed','_object','_objects','_toIgnore','_unit'];
	_pos = _this select 0;
	
	_checkdist = _this select 1;
	_toIgnore = _this select 2;
	_unit = _this select 3;
	
	_below = [_pos select 0,_pos select 1,(_pos select 2) - _checkdist];

	_objects = (lineintersectswith [_pos,_below,_toIgnore,_unit,true]);
	
	if ((count _objects) == 0) then {_obstructed = false; _object = objNull;} else {_obstructed = true;_object = _objects select ((count _objects) - 1);};

	[_obstructed,_below,_object]";
};

_array = [_pos,0.001,_targetObject,_unit] call fnc_intersects_floor;
_obstructed = _array select 0;
_object = objNull;

if (_obstructed) exitwith 
{
	_below = _array select 1;
	_unitPos = getPosASL _unit;
	_below set [2,(_unitPos select 2)];
	[_below,_object]
};

_array = [_pos,_dist,_targetObject,_unit] call fnc_intersects_floor;
_obstructed = _array select 0;
_object = _array select 2;

//hint (str(_obstructed));


if (!_obstructed) exitwith 
{
	
	_below = _pos;
	_below set [2,0.01];
	_below = ATLtoASL _below;
	[_below,_object]
	
};

while {_obstructed} do 
{
	_dist = _dist - 1;
	_array = [_pos,_dist,_targetObject,_unit] call fnc_intersects_floor;
	_obstructed = _array select 0;
};

while {!(_obstructed)} do 
{
	_dist = _dist + 0.1;
	_array = [_pos,_dist,_targetObject,_unit] call fnc_intersects_floor;
	_obstructed = _array select 0;
};

while {_obstructed} do 
{
	_dist = _dist - 0.01;
	_array = [_pos,_dist,_targetObject,_unit] call fnc_intersects_floor;
	_obstructed = _array select 0;
};

_below = _array select 1;
[_below,_object]




