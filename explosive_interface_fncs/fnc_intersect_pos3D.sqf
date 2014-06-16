private ["_upos","_eyes","_pitch","_array","_ball1"];
_unit  = _this select 0;
_dist = _this select 1;
_objectToIgnore = _this select 2;

if (isnil("_objectToIgnore")) then
{
	_objectToIgnore = _unit;
};
_array = [];

_upos = getposATL _unit;
_eyes = eyepos _unit;
_angle = _this select 3;
if (isnil("_angle")) then {_angle = (getdir _unit)};


_camPos = ATLtoASL (positionCameraToWorld [0,0,0]);
_camPosOff = ATLtoASL (positionCameraToWorld [0,0,1]);
_camPosOffD = ATLtoASL (positionCameraToWorld [0,-0.01,1]);
_camPosOffR = ATLtoASL (positionCameraToWorld [0.01,0,1]);

if (isnil("fnc_intersects3D")) then {
fnc_intersects3D = compile "
	private ['_pos','_infront','_obstructed','_object','_objects'];
	_unit = _this select 0;
	_pos = _this select 1;
	_checkdist = _this select 2;
	
	_vX = (_camPosOff select 0) - (_camPos select 0);
	_vY = (_camPosOff select 1) - (_camPos select 1);
	_vZ = (_camPosOff select 2) - (_camPos select 2);
	
	_infront = if ((_angle) >=  180) then {

		[(_pos select 0) + (_vX * _checkdist),(_pos select 1) + (_vY * _checkdist),(_pos select 2) + (_vZ * _checkdist)]

	} else {

		[(_pos select 0) + (_vX * _checkdist),(_pos select 1) + (_vY * _checkdist),(_pos select 2) + (_vZ * _checkdist)]

	};
	
	_objects = (lineintersectswith [_pos,_infront,_unit,_objectToIgnore,true]);
	
	if ((count _objects) == 0) then {_obstructed = false; _object = nul;} else {_obstructed = true;_object = _objects select ((count _objects) - 1);};
	
	[_obstructed,_infront,_object]";

};

if (isnil("fnc_get_angle")) then 
{
	fnc_get_angle = compile loadfile "explosive_interface_fncs\fnc_get_angle.sqf";
};

if (isnil("fnc_test_floor")) then 
{
fnc_test_floor = compile "

	if (!_obstructed) then
	{
		_TIPos = ATLtoASL (screenToWorld [0.5,0.5]);
		_TIDist = _eyes distance _TIPos;
		
		if (_TIDist <= _dist) then
		{
			
			_obstructed = true;
			_infront = _TIPos;
			_obstruction = ""terrain"";
		};	
	};"
};

_array = [_unit,_eyes,0.0001] call fnc_intersects3D;
_obstructed = _array select 0;
_infront = _array select 1;
_obstruction = _array select 2;

if (_obstructed) exitwith
{
	_dirVector = [0,0,0];
	_upVector = [0,0,0];

	[_infront,_obstruction,_dirVector,_upVector]
};

_array = [_unit,_eyes,_dist] call fnc_intersects3D;
_obstructed = _array select 0;
_infront = _array select 1;
_obstruction = _array select 2;

[] call fnc_test_floor;

if (!(_obstructed)) exitwith 
{

	_dirVector = [0,0,0];
	_upVector = [0,0,0];

	_obstruction = nul;

	[_infront,_obstruction,_dirVector,_upVector]
};

if ((typename (_obstruction)) == "String") exitwith 
{
	_dirVector = [0,0,0];
	_upVector = [0,0,0];

	[_infront,_obstruction,_dirVector,_upVector]
};

while {_obstructed} do {
	_dist = _dist - 1;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
};

while {!(_obstructed)} do {	
	_dist = _dist + 0.1;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
};

while {_obstructed} do {
	_dist = _dist - 0.01;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
};

while {!_obstructed} do {
	_dist = _dist + 0.001;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
};

while {_obstructed} do {
	_dist = _dist - 0.001;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;	
};

_infront = _array select 1;








_dist = _this select 1;
_camPosOff = _camPosOffD;




_array = [_unit,_eyes,_dist] call fnc_intersects3D;
_obstructed = _array select 0;
_obstruction = _array select 2;

[] call fnc_test_floor;

if (!(_obstructed)) exitwith 
{
	_dirVector = [0,0,0];
	_upVector = [0,0,0];

	[_infront,_obstruction,_dirVector,_upVector]
};

if ((typename (_obstruction)) == "String") exitwith 
{
_dirVector = [0,0,0];
_upVector = [0,0,0];

[_infront,_obstruction,_dirVector,_upVector]
};

while {_obstructed} do {

	_dist = _dist - 1;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
	
	if (_dist <= 0) then
	{	
		_dist = 0.01;
		_obstructed = false;
	};	
};

while {!(_obstructed)} do {

	_dist = _dist + 0.1;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
	
};

while {_obstructed} do {

	_dist = _dist - 0.01;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
	
};

while {!_obstructed} do {

	_dist = _dist + 0.001;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
	
};

while {_obstructed} do {

	_dist = _dist - 0.001;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
	
};

_infrontD = _array select 1;





_dist = _this select 1;
_camPosOff = _camPosOffR;





_array = [_unit,_eyes,_dist] call fnc_intersects3D;
_obstructed = _array select 0;
_obstruction = _array select 2;

[] call fnc_test_floor;

if (!(_obstructed)) exitwith 
{
	_dirVector = [0,0,0];
	_upVector = [0,0,0];

	[_infront,_obstruction,_dirVector,_upVector]
};

if ((typename (_obstruction)) == "String") exitwith 
{
_dirVector = [0,0,0];
_upVector = [0,0,0];

[_infront,_obstruction,_dirVector,_upVector]
};

while {_obstructed} do {
	_dist = _dist - 1;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;	
};

while {!(_obstructed)} do {

	_dist = _dist + 0.1;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
	
};

while {_obstructed} do {

	_dist = _dist - 0.01;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
	
};

while {!_obstructed} do {

	_dist = _dist + 0.001;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
	
};

while {_obstructed} do {

	_dist = _dist - 0.001;
	_array = [_unit,_eyes,_dist] call fnc_intersects3D;
	_obstructed = _array select 0;
	
};

_infrontR = _array select 1;



_uvX = (_infrontD select 0) - (_infront select 0);
_uvY = (_infrontD select 1) - (_infront select 1);
_uvZ = (_infront select 2) - (_infrontD select 2);
	
_dvX = (_infront select 0) - (_infrontR select 0);
_dvY = (_infront select 1) - (_infrontR select 1);
_dvZ = (_infront select 2) - (_infrontR select 2);

_angle = [_infrontR,_infront] call fnc_get_angle;

if (_angle >= 180) then 
{
	_uvY = (_infront select 1) - (_infrontD select 1);
	_uvZ = (_infrontD select 2) - (_infront select 2);
	
	_dvZ = (_infrontR select 2) - (_infront select 2);
};

_dirVector = [_dvX,_dvY,_dvZ];
_upVector = [_uvX,_uvZ,_uvY];

_distR = _infront distance _infrontR;
_distD = _infront distance _infrontD;

if (_distR <= 0) then {_distR = 0.001};
if (_distD <= 0) then {_distD = 0.001};

_scaleR = 1/_distR;
_scaleD = 1/_distD;
	
for "_i" from 0 to 2 do
{
_sel = _dirVector select _i;
	_dirVector set [_i,(_sel*_scaleR)];

_sel = _upVector select _i;
	_upVector set [_i,(_sel*_scaleD)];
};

[_infront,_obstruction,_dirVector,_upVector]

