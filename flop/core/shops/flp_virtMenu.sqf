/*
	File: flp_virtMenu.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Virtual Items Menu for NPC's.
*/

//Complete this.
//After all functions are done, put in the desc for each column.
//The buy column will list Price, and a Short Desc. Desc will give info on what it does, or what it is used in.
//On the Sell Colum, it will simply list the sell price, which will be 75% of the current buy price.

disableSerialization;

createDialog "flp_virtShops";

ctrlSetText[1000, "Market"];
ctrlSetText[1600, "Rob"];
ctrlSetText[1601, "Close"];
ctrlSetText[1602, "Buy"];
ctrlSetText[1603, "Sell"];


flp_fetchedNSortedItems = [];

flp_fetchPlayerVirtItems =
{
	_i = 0 ;
	lbClear 1501;
{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		lbAdd [1501, format ["%1", _val]];
		lbAdd [1501, _str];
		lbSetData [1501, _i, _x];
		_i = _i + 1;
	};
} foreach life_inv_items;
};

flp_fetchMenuVirtItems =
	{
		_i = 0 ;
		lbClear 1500;
		flp_fetchedNSortedItems = [];
		{
			if((_x select 2) == '0') then {

				_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;

				lbAdd [1500, format ["$%1", _adjustPrice]];
				lbAdd [1500, [_x select 0] call life_fnc_varToStr];
				_items = [str _i, _x select 0, _x select 1, str _adjustPrice];
				flp_fetchedNSortedItems = flp_fetchedNSortedItems + [_items];

				//hint format ["Selected Array: %1", flp_fetchedNSortedItems];
				lbSetData [1500, _i, _items select 1];
				diag_log _x;
				_i = _i + 1;
			};
		} forEach (missionNameSpace getVariable "flp_grocery");
	};

call flp_fetchMenuVirtItems;
call flp_fetchPlayerVirtItems;

buttonSetAction [1602, "[lbCurSel 1500, ctrlText 1400] execVM ""flop\core\shops\flp_virtMenuBuy.sqf""; "]; //Buy editline.
buttonSetAction [1603, "[lbData [1501, lbCurSel 1501], ctrlText 1401] execVM ""flop\core\shops\flp_virtMenuSell.sqf"";"];
_sellID = 0;
//buttonSetAction [1603, "[lbData [1501, lbCurSel 1501], ctrlText 1401] execVM ""flop\core\shops\flp_virtMenuSell.sqf""; "];

_bcolumn = lbCurSel 1500;
_scolumn = lbCurSel 1501;

while {ctrlVisible 1800} do {

	if (lbCurSel 1500 != _bcolumn) then
		{
			_index = lbCurSel 1500;
			_itemName = (flp_fetchedNSortedItems select _index) select 1;
			_desc = [_itemName] call flp_itemUsage;
			((uiNamespace getVariable 'flp_virtShops') displayCtrl 1100) ctrlSetStructuredText parseText format["
			<t size='.95'>%1</t><br/>
			<t size='.75'>Buy Price: <t color='#33FF00'>$%2</t><br/>
			%3
			</t>
			",
			[lbData [1500, _index]] call life_fnc_varToStr,
			(flp_fetchedNSortedItems select _index) select 3,
			//hint format ["%1", _desc]
			_desc
			];
	};

	if (lbCurSel 1501 != _scolumn) then
		{
			_index = lbCurSel 1501;
			_data = lbData [1501, _index];
			_price = 0;
			_sellID = 0;
			{
				_name = _x select 1;
				if (_name == _data) exitWith {
					_price = _x select 3;
					_sellID = _x select 0;
					//hint format ["%1", _sellID];
				};
			} forEach flp_fetchedNSortedItems;
			//hint format ["%1", flp_fetchedNSortedItems];

			_itemName = (flp_fetchedNSortedItems select _index) select 1;
			_desc = [_itemName] call flp_itemUsage;
			_price = floor (parseNumber(_price) * .75);

			((uiNamespace getVariable 'flp_virtShops') displayCtrl 1100) ctrlSetStructuredText parseText format["
			<t size='.95'>%1</t><br/>
			<t size='.75'>Sell Price: <t color='#33FF00'>$%2</t><br/>
			%3
			</t>
			",
			[lbData [1501, _index]] call life_fnc_varToStr,
			_price,
			_desc
			];
	};
	_bcolumn = lbCurSel 1500;
	_scolumn = lbCurSel 1501;
	sleep 0.01;
};