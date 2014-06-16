/*
	File: flp_factoryCreateItem.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Checks to make sure person has required materials for item, and cash, then adds to queue.
*/

//if ((_this select 0) == "") exitWith {player vehicleChat "You need to first make a selection";};

_item		= _this select 0;
_cost		= _this select 1;
_time		= _this select 2;
_type		= _this select 3;
_name		= _this select 4;
_subtype	= _this select 5;

//hint format["%1\n %2\n %3\n %4", _item, _cost, _time, _type, _name];

//Check Price First
if(life_cash < _cost) exitWith {hint "You don't have enough money to create this."};

//Check for materials here.

//Add item to Queue
if(_type == 1) then {

	life_cash = life_cash - _cost;
	factoryWeaponQueue = factoryWeaponQueue + [[_name, _item, ((_time * 60) + time), _subtype, (_cost * 3)]];
	hint format["Added %1 to the queue", _name];
	//hint format["%1", factoryWeaponQueue];
};