/*
	File: flp_factorySell.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Handles Export and Create Functions
*/
_func = _this select 0; //0 for Create, 1 for Export;
_index= _this select 1;
_item = factoryWeaponQueue select _index;
//hint format["%1, %2", _func, _index];

switch (_func) do {

	case 0:
		{

			//Take current selection and see if it will fit in the players backpack
				if (_item select 2 < time) then {
				//create vehicle
					if !(player canAddItemToBackpack (_item select 1)) exitWith {hint "You don't have enough room in your backpack"};

					switch (_item select 3) do {

						case 1: //Weapon
							{

							player addItemToBackpack (_item select 1);
							hint format["%1 created.", _item select 0];
							factoryWeaponQueue = factoryWeaponQueue - [_item];
							[facnum] execVM "flop\addons\factories\flp_factoryFetchQueue.sqf"

							};
						case 2:
							{

							player addItemToBackpack (_item select 1);
							hint format["%1 created.", _item select 0];
							factoryWeaponQueue = factoryWeaponQueue - [_item];
							[facnum] execVM "flop\addons\factories\flp_factoryFetchQueue.sqf"

							};
						case 3:
							{

							player addItemToBackpack (_item select 1);
							hint format["%1 created.", _item select 0];
							factoryWeaponQueue = factoryWeaponQueue - [_item];
							[facnum] execVM "flop\addons\factories\flp_factoryFetchQueue.sqf"

							};
					};

				} else {
				};

		};

	case 1:
		{
	//Eventually this will create a database for the export, that will allow for anyone to come to factory and transport goods to sell at a higher cost. For now, just sell the item immediately for 3 times the cost.
			if (_item select 2 < time) then {


			//factoryExport= factoryExport +
			hint format["You sold a %1 for $%2.", _item select 0, _item select 4];
			life_cash = life_cash + (_item select 4);
			factoryWeaponQueue = factoryWeaponQueue - [_item];

			} else { hint "Item not yet ready";};
		};

};