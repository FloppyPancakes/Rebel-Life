/*
	File: flp_factoryFetchItems.sqf
	Author: Josh "Floppy Pancakes" Houston
	
	Description:
	Fetchs items from arrays. The arrays are will be updated every 5 minutes on the server side to the MySQL database.
*/

flp_queueActive = 0;
_selection = _this select 1;
_facNum = _this select 0;
_facArray  = flp_factories select _facNum;
_facItems = _facArray select 5;
_facStorage = _facArray select 7;
_queue = _facArray select 8;

//hint format["var1: %1\n var2: %2", _facnum, _selection];

lbClear 1500;
	for [{_x=0},{_x < count ((_facArray select 5) select _selection)},{_x=_x+1}] do {
		_item = ((_facItems select _selection) select _x);
		_index = lbAdd [1500, format["%1 ($%2, %3 mins)", _item select 0, _item select 2, _item select 3]];
		lbSetData [1500, _index, _x];
	};
	
lbSetCurSel [1500, 0];
