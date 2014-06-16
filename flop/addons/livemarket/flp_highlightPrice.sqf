/*
	File: flp_adjustPrice.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Number is passed to this function, function returns number based on supply and demand.
*/


_item = call compile(_this select 0);
_index = _this select 1;

if (_item > 150) then
	{
		lbSetColor [1500, _index, [1, 0, 0, 1]];
	};

if (_item < 100) then
	{
		lbSetColor [1500, _index, [0, 1, 0, 1]];
	};