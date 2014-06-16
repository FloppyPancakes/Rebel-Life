	call flp_fetchMenuVirtItems;

	if (isNil (_this select 0)) exitWith {hint "You haven't selected an item."};

	_life_name = _this select 0;
	_amt = call compile(_this select 1);
	_arrayID = 0;
	_price = 0;
	_qty = 0;

	//hint format ["%1 \n%2", _life_name, _amt];
	//hint format ["%1", flp_fetchedNSortedItems];
	{
		_name = _x select 1;
		if (_name == _life_name) exitWith {
			_arrayID = parseNumber(_x select 0);
			_qty = parseNumber(_x select 2);
			_price = parseNumber(_x select 3);
			hint format ["%1", _arrayID];
		};
		hint format ["%1", _name];
	} forEach flp_fetchedNSortedItems;

	_life_name = [_life_name,1] call life_fnc_varHandle;
	[false,_life_name,_amt] call life_fnc_handleInv;
	_price = floor(_price * .75);
	life_cash = life_cash + _price;

	_newqty = _qty + _amt;

	_selectedArray = ((missionNameSpace getVariable "flp_grocery") select _arrayID) set [1,str _newqty];
	publicVariable "flp_grocery";

	call flp_fetchPlayerVirtItems;