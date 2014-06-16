/*
	File: flp_marketView.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Shows Market View of all Items in game.
	Shows current Price for each item.
	Later, it will be implemented, that if you are a certain class, it will also show the current supply of each item, as well as Inflate, Deflate, and Freeze options.
*/

disableSerialization;

flp_marketselectedList = [];
flp_cfg = "";

createDialog "flp_market_menu";

ctrlShow [1100, false];
ctrlShow [1200, false];

flp_adjustValue =
{

	_qty = call compile (_this select 0);
	_price = call compile (_this select 1);

	    if (_qty < marketLow) then {
	    	_desc = marketLow - _qty;
			_frac = _desc / 100;
			_mult = _frac * marketMultiplier;
			_price = floor (_price * _mult);
	    };

	    if (_qty > marketHigh) then {
	    	_desc = _qty - marketHigh;
			_frac = _desc / 100;
			_mult = _frac / marketMultiplier;
			_price = floor (_price * _mult);
	    };
	     _price;
};

flp_marketGrocery =
	{
		{
			if((_x select 2) == '0') then {
				_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
				_index = lbAdd [1500, format["%1- $%2", [(_x select 0)] call life_fnc_varToStr, ([_x select 1, _x select 3] call flp_adjustValue)]];
				_value = [_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
				lbSetData [1500, _index, _x];
			};
		} forEach (missionNameSpace getVariable "flp_grocery");
	};

flp_marketWeapons =
	{
		lbSetCurSel [1500, 0];
		ctrlSetText[1611, "Weapons"];
			buttonSetAction [1611, "lbClear 1500; flp_marketselectedList = []; [0] call flp_marketWeapons; flp_marketPriceAdjust = nil; flp_cfg = ""CfgWeapons"";" ];
		ctrlSetText[1612, "Ammo"];
			buttonSetAction [1612, "lbClear 1500; flp_marketselectedList = []; [1] call flp_marketWeapons; flp_marketPriceAdjust = nil; flp_cfg = ""CfgMagazines"";" ];
		ctrlSetText[1613, "Mods"];
			buttonSetAction [1613, "lbClear 1500; flp_marketselectedList = []; [2] call flp_marketWeapons; flp_marketPriceAdjust = nil; flp_cfg = ""CfgWeapons"";" ];

		ctrlShow[1611,true];
		ctrlShow[1612,true];
		ctrlShow[1613,true];
		ctrlShow[1614,false];

		switch (_this select 0) do {
		    case 0: {

				{
					if(((_x select 2) == '1') AND (((_x select 6) != "True"))) then
						{
							_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
							_name = getText(configfile >> "CfgWeapons" >> _x select 0>> "displayName");
							_index = lbAdd [1500, format["%1 - $%2", _name, _adjustPrice]];
							_value = [_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
							lbSetData [1500, _index, _x];
							flp_marketselectedList = flp_marketselectedList + [_x select 0];
					};
				} forEach (missionNameSpace getVariable "flp_weapons");

		    };

		    case 1: {

				{
					if(((_x select 2) == '2') AND (((_x select 6) != "True"))) then
						{
							_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
							_name = getText(configfile >> "CfgMagazines" >> _x select 0>> "displayName");
							_index = lbAdd [1500, format["%1 - $%2", _name, _adjustPrice]];
							_value = [_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
							lbSetData [1500, _index, _x];
							flp_marketselectedList = flp_marketselectedList + [_x select 0];
					};
				} forEach (missionNameSpace getVariable "flp_weapons");

		    };

		    case 2: {

				{
					if(((_x select 2) == '3') AND (((_x select 6) != "True"))) then
						{
							_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
							_name = getText(configfile >> "CfgWeapons" >> (_x select 0) >> "displayName");
							_index = lbAdd [1500, format["%1 - $%2", _name, _adjustPrice]];
							_value = [_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
							lbSetData [1500, _index, _x];
							flp_marketselectedList = flp_marketselectedList + [_x select 0];
					};
				} forEach (missionNameSpace getVariable "flp_weapons");

		    };

		    default {
		     	/* STATEMENT */
		    };
		};
	};

flp_marketClothing = //DOES NOT SHOW ALL ITEMS YET... they are spread weirdly across different configs. -.-
					//Most Cloths don't show.
					//Few Vests Don't Show.
	{
		ctrlSetText[1611, "Clothes"];
			buttonSetAction [1611, "lbClear 1500; flp_marketselectedList = []; [0] call flp_marketClothing; flp_marketPriceAdjust = nil; flp_cfg = ""CfgWeapons"";" ];
		ctrlSetText[1612, "Vests"];
			buttonSetAction [1612, "lbClear 1500; flp_marketselectedList = []; [1] call flp_marketClothing; flp_marketPriceAdjust = nil; flp_cfg = ""CfgWeapons"";" ];
		ctrlSetText[1613, "BackPacks"];
			buttonSetAction [1613, "lbClear 1500; flp_marketselectedList = []; [2] call flp_marketClothing; flp_marketPriceAdjust = nil; flp_cfg = ""CfgVehicles"";" ];
		ctrlSetText[1614, "Accessories"];
			buttonSetAction [1614, "lbClear 1500; flp_marketselectedList = []; [3] call flp_marketClothing; flp_marketPriceAdjust = nil; flp_cfg = ""CfgWeapons"";" ];

		ctrlShow[1611,true];
		ctrlShow[1612,true];
		ctrlShow[1613,true];
		ctrlShow[1614,true];

		switch (_this select 0) do {
		    case 0: {

		    	{
					if((_x select 2) == '1') then {
						_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
						_name = getText(configfile >> "CfgWeapons" >> (_x select 0) >> "displayName");
						if (isText (configfile >> "CfgWeapons" >> (_x select 0) >> "displayName")) then {
							_index = lbAdd [1500, format["%1- $%2", _name, ([_x select 1, _x select 3] call flp_adjustValue)]];
							_value = [_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
							lbSetData [1500, _index, _x];
							flp_marketselectedList = flp_marketselectedList + [_x select 0];
						};
					};
				} forEach (missionNameSpace getVariable "flp_clothing");

		    };

		    case 1: {
		    	{
					if((_x select 2) == '2') then {
					_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
					_name = getText(configfile >> "CfgWeapons" >> (_x select 0) >> "displayName");
					if (isText (configfile >> "CfgWeapons" >> (_x select 0) >> "displayName")) then {
						_index = lbAdd [1500, format["  %1- $%2", _name, ([_x select 1, _x select 3] call flp_adjustValue)]];
						_value = [_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
						lbSetData [1500, _index, _x];
						flp_marketselectedList = flp_marketselectedList + [_x select 0];
						};
					};
				} forEach (missionNameSpace getVariable "flp_clothing");
		    };

		    case 2: {
		    	{
					if((_x select 2) == '3') then {
						_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
						_name = getText(configfile >> "CfgVehicles" >> (_x select 0) >> "displayName");
					if (isText (configfile >> "CfgVehicles" >> (_x select 0) >> "displayName")) then {
							_index = lbAdd [1500, format["%1- $%2", _name, ([_x select 1, _x select 3] call flp_adjustValue)]];
							_value = [_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
							lbSetData [1500, _index, _x];
							flp_marketselectedList = flp_marketselectedList + [_x select 0];
						};
					};
				} forEach (missionNameSpace getVariable "flp_clothing");
		    };

		    case 3: {
		    	{
					if((_x select 2) == '4') then {
						_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
						_name = getText(configfile >> "CfgWeapons" >> (_x select 0) >> "displayName");
						if (isText (configfile >> "CfgWeapons" >> (_x select 0) >> "displayName")) then {
							_index = lbAdd [1500, format[" %1- $%2", _name, ([_x select 1, _x select 3] call flp_adjustValue)]];
							_value = [_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
							lbSetData [1500, _index, _x];
							flp_marketselectedList = flp_marketselectedList + [_x select 0];
							};
						};
				} forEach (missionNameSpace getVariable "flp_clothing");
		    };
		};
	};

flp_marketVehicles =
	{

	ctrlSetText[1611, "Passenger"];
			buttonSetAction [1611, "lbClear 1500; flp_marketselectedList = []; [0] call flp_marketVehicles; flp_marketPriceAdjust = nil; flp_cfg = ""CfgVehicles"";" ];
		ctrlSetText[1612, "Transport"];
			buttonSetAction [1612, "lbClear 1500; flp_marketselectedList = []; [1] call flp_marketVehicles; flp_marketPriceAdjust = nil; flp_cfg = ""CfgVehicles"";" ];
		ctrlSetText[1613, "Armored"];
			buttonSetAction [1613, "lbClear 1500; flp_marketselectedList = []; [2] call flp_marketVehicles; flp_marketPriceAdjust = nil; flp_cfg = ""CfgVehicles"";" ];
		ctrlSetText[1614, "Air"];
			buttonSetAction [1614, "lbClear 1500; flp_marketselectedList = []; [3] call flp_marketVehicles; flp_marketPriceAdjust = nil; flp_cfg = ""CfgVehicles"";" ];

		ctrlShow[1611,true];
		ctrlShow[1612,true];
		ctrlShow[1613,true];
		ctrlShow[1614,true];

		switch (_this select 0) do {
		    case 0: {
		    	{
					if(((_x select 2) == '1') AND (((_x select 6) != "True"))) then
						{
							_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
							_name = getText(configfile >> "CfgVehicles" >> _x select 0>> "displayName");
							_index = lbAdd [1500, format["%1 - $%2", _name, _adjustPrice]];
							[_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
							lbSetData [1500, _index, _x];
							flp_marketselectedList = flp_marketselectedList + [_x select 0];
					};
				} forEach (missionNameSpace getVariable "flp_vehicles");
		    };

		    case 1: {
		    	{
					if(((_x select 2) == '2') AND (((_x select 6) != "True"))) then
						{
							_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
							_name = getText(configfile >> "CfgVehicles" >> _x select 0>> "displayName");
							_index = lbAdd [1500, format["%1 - $%2", _name, _adjustPrice]];
							[_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
							lbSetData [1500, _index, _x];
							flp_marketselectedList = flp_marketselectedList + [_x select 0];
					};
				} forEach (missionNameSpace getVariable "flp_vehicles");
		    };

		    case 2: {
		    	{
					if(((_x select 2) == '3') AND (((_x select 6) != "True"))) then
						{
							_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
							_name = getText(configfile >> "CfgVehicles" >> _x select 0>> "displayName");
							_index = lbAdd [1500, format["%1 - $%2", _name, _adjustPrice]];
							[_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
							lbSetData [1500, _index, _x];
							flp_marketselectedList = flp_marketselectedList + [_x select 0];
					};
				} forEach (missionNameSpace getVariable "flp_vehicles");
		    };

		    case 3: {
		    	{
					if(((_x select 2) == '4') AND (((_x select 6) != "True"))) then
						{
							_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
							_name = getText(configfile >> "CfgVehicles" >> _x select 0>> "displayName");
							_index = lbAdd [1500, format["%1 - $%2", _name, _adjustPrice]];
							[_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
							lbSetData [1500, _index, _x];
							flp_marketselectedList = flp_marketselectedList + [_x select 0];
					};
				} forEach (missionNameSpace getVariable "flp_vehicles");
		    };

		    default {
		     	/* STATEMENT */
		    };
		};
	};



flp_marketItems =
	{
		{
			if((_x select 2) == '0') then {
				_adjustPrice = [_x select 1, _x select 3] call flp_adjustValue;
				diag_log _x select 0;
				_index = lbAdd [1500, format["%1- $%2", [(_x select 0)] call life_fnc_varToStr, ([_x select 1, _x select 3] call flp_adjustValue)]];
				_value = [_x select 1, _index] execVM "flop\addons\livemarket\flp_highlightPrice.sqf";
				lbSetData [1500, _index, _x];
			};
		} forEach (missionNameSpace getVariable "flp_items");
	};


buttonSetAction [1600, "
	lbClear 1500;
	flp_marketselectedList = [];
	[0] call flp_marketWeapons;
	flp_marketPriceAdjust = nil;
	flp_cfg = ""CfgWeapons"";
	" ]; //Weapons
buttonSetAction [1602, "
	lbClear 1500;
	flp_marketselectedList = [];
	[0] call flp_marketClothing;
	flp_marketPriceAdjust = nil;
	flp_cfg = ""CfgWeapons"";
	" ]; //Clothing
buttonSetAction [1603, "
	lbClear 1500;
	flp_marketselectedList = [];
	[0] call flp_marketVehicles;
	flp_marketPriceAdjust = nil;
	flp_cfg = ""CfgVehicles"";
	" ]; //Clothing
buttonSetAction [1604, "
	lbClear 1500;
	flp_marketselectedList = [];
	call flp_marketWeapons;
	call flp_marketClothing;
	call flp_marketVehicles;
	call flp_marketGrocery;
	call flp_marketItems;
	flp_marketPriceAdjust = nil;
	" ]; //Grocery
buttonSetAction [1605, "
	lbClear 1500;
	flp_marketselectedList = [];
	call flp_marketGrocery;
	flp_marketPriceAdjust = nil;
	ctrlShow [1100, false];
	ctrlShow [1200, false];
	ctrlShow [1611,false];
	ctrlShow [1612,false];
	ctrlShow [1613,false];
	ctrlShow [1614,false];
	" ]; //Grocery
buttonSetAction [1606, "
	lbClear 1500;
	flp_marketselectedList = [];
	call flp_marketItems;
	flp_marketPriceAdjust = nil;
	" ]; //Grocery


//Disable Market Manipulation until the class is put in.
ctrlShow [1608, false];
ctrlShow [1609, false];
ctrlShow [1610, false];

ctrlShow [1604, false];

ctrlShow [1611,false];
ctrlShow [1612,false];
ctrlShow [1613,false];
ctrlShow [1614,false];


while {ctrlVisible 1607} do {

	_name = flp_marketselectedList select lbCurSel 1500;
	if (flp_cfg == "CfgWeapons") then
		{
			ctrlShow [1100, true];
			ctrlShow [1200, true];
			_gameName = getText(configfile >> "CfgWeapons" >> _name>> "displayName");
			_description = getText(configfile >> "CfgWeapons" >> _name>> "descriptionShort");
			_picture = getText(configfile >> "CfgWeapons" >> _name>> "picture");
			ctrlSetText [1200, _picture];
    		((uiNamespace getVariable 'myDisplay') displayCtrl 1100) ctrlSetStructuredText parseText format["<t size='.65'>%1</t>", _description];
    	};

    if (flp_cfg == "CfgMagazines") then
		{
			ctrlShow [1100, true];
			ctrlShow [1200, true];
			_gameName = getText(configfile >> "CfgMagazines" >> _name>> "displayName");
			_description = getText(configfile >> "CfgMagazines" >> _name>> "descriptionShort");
			_picture = getText(configfile >> "CfgMagazines" >> _name>> "picture");
			ctrlSetText [1200, _picture];
    		((uiNamespace getVariable 'myDisplay') displayCtrl 1100) ctrlSetStructuredText parseText format["<t size='.65'>%1</t>", _description];
    	};

   	if (flp_cfg == "CfgVehicles") then
		{
			ctrlShow [1100, true];
			ctrlShow [1200, true];
			_gameName = getText(configfile >> "CfgVehicles" >> _name>> "displayName");
			_description = getText(configfile >> "CfgVehicles" >> _name>> "descriptionShort");
			_picture = getText(configfile >> "CfgVehicles" >> _name>> "picture");
			ctrlSetText [1200, _picture];
    		((uiNamespace getVariable 'myDisplay') displayCtrl 1100) ctrlSetStructuredText parseText format["<t size='.65'>%1</t>", _description];
    	};


    sleep 0.1;
};

flp_marketselectedList = nil;