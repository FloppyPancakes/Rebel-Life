/*
	File: flp_factoryFetchQueue.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Fetch Queue of selected factory.
*/

flp_queueActive = 1;
_factoryQueue = _this select 0; //Fetch appropriate Factory Queue
//hint format["%1", _factoryQueue];

switch (_factoryQueue) do {
	case 0: //Weapons
		{
			lbClear 1500;
			for [{_x=0},{_x < count factoryWeaponQueue},{_x=_x+1}] do {
				_item = factoryWeaponQueue select _x;
				if (_item select 2 < time) then {
					_time = format["Ready. - $%1", _item select 4];
					_index = lbAdd [1500, format["%1 - %2", _item select 0, _time]];
					lbSetColor [1500, _index, [0, 1, 0, 1]];
					lbSetData [1500, _index, _x];
				} else {
					_time = format["%1 Minutes Remaining", floor ((((_item select 2) - time)+60)/60)];
					_index = lbAdd [1500, format["%1 - %2", _item select 0, _time]];
					lbSetData [1500, _index, _x];
				};
			};
		};
	};