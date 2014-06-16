	if (_this select 0 == -1) exitWith {hint "You haven't selected an item."};

	call flp_fetchMenuVirtItems;

	_selection = _this select 0;
	_item = flp_fetchedNSortedItems select _selection;
	_arrayID = call compile(_item select 0);
	_life_name = _item select 1;
	_qty = call compile(_item select 2);
	_price = call compile(_item select 3);
	_amt = call compile(_this select 1);

	if (_qty == 0) exitWith {hint "Sorry, we are out of that item."};
	if (_qty < _amt) exitWith {hint "Sorry, we don't have that much of that item."};

	_price = _price * _amt;
	if (life_cash < _price) exitWith {hint "Sorry, but you don't have enough cash for that."};
	_life_name = [_life_name,1] call life_fnc_varHandle;
	life_cash = life_cash - _price;
	//hint format ["%1\n%2", _life_name, _amt];

	[true,_life_name,_amt] call life_fnc_handleInv;
	_newqty = _qty - _amt;

	//switch (_shop) do {
	//    case "market": {
	    	_selectedArray = ((missionNameSpace getVariable "flp_grocery") select _arrayID) set [1,str _newqty];
			publicVariable "flp_grocery";

	 //   };
	//};

	call flp_fetchPlayerVirtItems;