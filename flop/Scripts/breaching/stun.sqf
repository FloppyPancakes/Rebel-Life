/*
Taw_Jarhead
Breaching script v1
3/25/2014

	1. get all men around the player
	2. if AI then excute the stun
	3. if player do nothing


please note there is extra code in here that is necessary sense i took it strait from flashbang script
*/

_objects = nearestObjects [(getpos player), ["Man"], 15];


for [{_l = 0},{_l < (count _objects)},{_l = _l +1}] do
{
	_unit = _objects select _l;
	_posplayer = eyepos _unit;
	_x = _pos select 0;
	_y = _pos select 1;
	_z = _pos select 2;
	_pos2 = [_x,_y,_z+0.2];
               _pos3 = ATLtoASL _pos2;



	if(isplayer _unit) then
	{

		_direye = eyeDirection player;
		_x0 = _direye select 0;
		_y0 = _direye select 1;
		_z0 = _direye select 2;
		_posflashx = _x-((getpos player) select 0);
		_posflashy = _y-((getpos player) select 1);
		_posflashz = _z-((getpos player) select 2);
		_Norm = Sqrt(_posflashx^2+_posflashy^2+_posflashz^2);
		_x1=_posflashx/_Norm;
		_y1=_posflashy/_Norm;
		_z1=_posflashz/_Norm;
		_cos = _x0*_x1+_y1*_y0+_z1*_z0;
		_angle = acos _cos;
		_d = player distance _pos2;

		if (_angle < 90) then
		{

	[_unit] execVM "\SUPER_flash\scripts\effectonplayer_full.sqf";
		} else
		{
			[_unit] execVM "\SUPER_flash\scripts\effectonplayer_light.sqf";
	              };





	} else
	{
		
		}


		//[] execvm "flop\Scripts\breaching\window.sqf"; // break glass on the buildings


};




