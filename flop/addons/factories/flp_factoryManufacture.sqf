/*
	File: flp_factoryManufacture.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Main menu for factories.
*/

selection = 0;//Default is First Button
facNum = _this select 0; //Determines which factory is being called from execVM variable.
createDialog "life_factories_menu";

switch (facNum) do {
    case 0: {
    	ctrlSetText [1000, "Weapons Factory"];
    	ctrlSetText [1600, "Weapons"];
    	ctrlSetText [1601, "Mods"];
    	ctrlSetText [1602, "Ammo"];
    	ctrlSetText [1603, "Queue"];
    	ctrlSetText [1604, "Remove"];
    	ctrlSetText [1605, "Add"];
    	ctrlSetText [1606, "Close"];
    	ctrlSetText [1607, "Export"];
    	ctrlSetText [1608, "Create"];
    };

    case 1: {
    	ctrlSetText [1000, "Clothing Factory"];
    	ctrlSetText [1600, "Clothes"];
    	ctrlSetText [1601, "Vests"];
    	ctrlSetText [1602, "Backpacks"];
    	ctrlSetText [1603, "Queue"];
    	ctrlSetText [1604, "Remove"];
    	ctrlSetText [1605, "Add"];
    	ctrlSetText [1606, "Close"];
    	ctrlSetText [1607, "Export"];
    	ctrlSetText [1608, "Create"];
    };

    default {
     	/* STATEMENT */
    };
};


//if (!(createDialog "life_factories_menu")) exitWith {hint "Dialog Error!";}; //Speed test this vs checking for display

[facNum, selection] execVM "flop\addons\factories\flp_factoryFetchItems.sqf";

buttonSetAction [1600, "selection = 0; [facNum, selection] execVM ""flop\addons\factories\flp_factoryFetchItems.sqf"";" ];
buttonSetAction [1601, "selection = 2; [facNum, selection] execVM ""flop\addons\factories\flp_factoryFetchItems.sqf"";" ];
buttonSetAction [1602, "selection = 1; [facNum, selection] execVM ""flop\addons\factories\flp_factoryFetchItems.sqf"";" ];
buttonSetAction [1603, "[facnum] execVM ""flop\addons\factories\flp_factoryFetchQueue.sqf"";" ];


sleep 0.1; // The Script conintues so fast that it gives an error. Prevent that.
while {ctrlVisible 1500} do {

	_selection = selection;
	_facNum = _this select 0;
	_facArray  = flp_factories select _facNum;
	_facItems = _facArray select 5;
	_facStorage = _facArray select 7;
	_queue = _facArray select 8;
	factoryAdd = (_facItems select selection) select lbCurSel 1500;
	//Classname, price, time
		//Create and Export Buttons only valid when on the Queue screen.
	buttonSetAction [1605, "[factoryAdd select 1, factoryAdd select 2, factoryAdd select 3, factoryAdd select 4, factoryAdd select 0, factoryAdd select 5] execVM ""flop\addons\factories\flp_factoryCreateItem.sqf"";"];

	if (flp_queueActive == 1) then { //These buttons only valid when on the Queue screen. Will continue to call itself so the screen updates.
	buttonSetAction [1608, " [0, lbCurSel 1500] execVM ""flop\addons\factories\flp_factorySell.sqf""; "]; //Sell
	buttonSetAction [1604, " factoryWeaponQueue = factoryWeaponQueue - [factoryWeaponQueue select lbCurSel 1500]; "]; //Remove
	buttonSetAction [1607, " [1, lbCurSel 1500] execVM ""flop\addons\factories\flp_factorySell.sqf"";"]; //Export
	[facnum] execVM "flop\addons\factories\flp_factoryFetchQueue.sqf";
	} else {
	buttonSetAction [1607, ""];
	buttonSetAction [1608, ""];
	buttonSetAction [1604, ""];
	};


	sleep 0.2;
};