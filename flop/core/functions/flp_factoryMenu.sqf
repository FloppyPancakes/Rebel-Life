//#include <flop\core\functions\macro.h>
/*
	File: flp_factoryMenu.sqf
	Author: Josh "Floppy Pancakes" Houston
	
	Description:
	Opens the Factories Menu.

/*
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 3900)};
_display = findDisplay 3900;
_list = _display displayCtrl 2902;

//Purge List
lbClear _list;

{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", name _x,_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
*/