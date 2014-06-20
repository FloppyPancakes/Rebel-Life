

/*
	File: fn_createWallChain.sqf
	Author: Sa-Matra

	Description:
	Function creates chain of objects (walls) from specific pos with supplied array of relative angles.

	Example:
	_walls = ["Land_fort_bagfence_long", 1.5, getPos player, [0, 90, 90]] execVM "fn_createWallChain.sqf";

	Parameter(s):
	_this select 0: string, Wall class name
	_this select 1: float, Wall length divided by 2
	_this select 2: array, PositionATL of first wall
	_this select 3: array, List of angles where each angle is relative to angle of previous wall
	_this select 4: array (optional), List of settings strings. Possible strings are "NO_FIRST" which will not create first wall in the chain and "FLIP_WALLS" to flip all walls the other way

	Returns:
	Array of created objects
*/

if(typeName(_this) != typeName([])) exitWith {
	diag_log format ["Wall chain script error :: Supplied argument is %1, expected %2", typeName(_this), typeName([])];
};
if(!(count(_this) in [4, 5])) exitWith {
	diag_log format ["Wall chain script error :: Supplied array length is %1, expected 4 or 5", count(_this)];
};

private ["_class", "_w", "_pos", "_angles", "_no_first", "_flip_walls"];
private ["_new_pos", "_angle", "_edge_pos", "_obj", "_objs"];

_class		= _this select 0; // Wall classname
_w		= _this select 1; // Length of the wall divided by 2
_pos		= _this select 2; // Initial wall position
_angles		= _this select 3; // Array of angles relative to previous angle

_no_first	= false;
_flip_walls	= false;
if(count(_this) == 5) then {
	if(typeName(_this select 4) != typeName([])) exitWith {
		diag_log format ["Wall chain script error :: 5th argument is %1, expected %2", typeName(_this select 4), typeName([])];
	};
	_no_first	= "NO_FIRST" in (_this select 4);	// Do not create first wall
	_flip_walls	= "FLIP_WALLS" in (_this select 4);	// Flip all walls
};

_new_pos = _pos;
_angle = nil;
_objs = [];
_is_first = true;
{
	if(isNil{_angle}) then {
		_angle = -90 + _x;
	} else {
		_is_first = false;
		_edge_pos = [(_new_pos select 0) + (_w * cos (_angle * -1)), (_new_pos select 1) + (_w * sin (_angle * -1)), _new_pos select 2];
		_angle = _angle + _x;
		_new_pos = [(_edge_pos select 0) + (_w * cos (_angle * -1)), (_edge_pos select 1) + (_w * sin (_angle * -1)), _new_pos select 2];
	};

	if(!_no_first || !_is_first) then {
		_obj = createVehicle [_class, _new_pos, [], 0, "CAN_COLLIDE"];
		_obj setPosATL _new_pos;
		_obj setDir (if(_flip_walls) then {180 + _angle} else {_angle});
		_obj setVectorUp (surfaceNormal getPosATL _obj);
		_objs = _objs + [_obj];
	};
} forEach _angles;

_objs

