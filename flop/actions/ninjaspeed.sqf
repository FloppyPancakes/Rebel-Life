//
private ["_obj","_caller","_id"];
//_npc = player;// object which the action is assigned to 
_caller = player;// the unit who called this action
//_id 	= _this select 2;// ID of the addaction

//removing action : _npc removeAction _id;

_myUnit = _caller; //or another Object
_velocity=velocity player; //get the current velocity
_x = _velocity select 0; //current speed x in m/s
_y = _velocity select 1; //current speed y in m/s
_z = _velocity select 2; //current speed z in m/s
hint format[" X velocity %1 \n Y velocity  %2 \n Z velocity %3", _x , _y , _z];
//add speed in Meter / second
_x = _x + 10;//add to the current X 10 m/s
_y = _y + 1;// add to the current Y 1  m/s
_MyNewVelocity = [ _x, _y,_z];//New velocity array
_myUnit setVelocity _MyNewVelocity;//add the new velocity to myUnit 
execVM "flop\actions\ninjaspeed.sqf";