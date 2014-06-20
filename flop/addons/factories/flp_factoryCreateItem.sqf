/*
	File: flp_factoryCreateItem.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Checks to make sure person has required materials for item, and cash, then adds to queue.
*/

if ((_this select 0) == "") exitWith {player vehicleChat "You need to first make a selection";};

_item		= _this select 0;
_facnum 	= _this select 1;

switch (_facnum) do {
    case 0: { //Weapons Factory
		{
			private ["_name", "_time"];
			if((_x select 0) == _item) then {

				_cost = parseNumber(_x select 4);
				if(life_cash < _cost) exitWith {hint "You don't have enough money to create this."};

				if ((_x select 2) == "2") then {
					_name = getText(configfile >> "CfgMagazines" >> _x select 0>> "displayName");
				} else {
					_name = getText(configfile >> "CfgWeapons" >> _x select 0>> "displayName");
				};
				_item = _x select 0;
				_time = (parseNumber(_x select 4) * flp_factoryTimeCost);
				if (_time < 60) then {
					_time = 60;
				};
				_time = (_time + time);
				_subtype = _x select 2;

				life_cash = life_cash - _cost;
				factoryWeaponQueue = factoryWeaponQueue + [[_name, _item, _time, _subtype, (_cost * 2)]];
				//hint format ["NAME: %1\n CLASSNAME: %2\n FINISHTIME: %3\n SUBTYPE: %4", _name, _item, _time, _subtype];
			};
		} forEach (missionNameSpace getVariable "flp_weapons");

    };

    default {
     	/* STATEMENT */
    };
};