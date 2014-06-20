/*
	File: flp_factoryFetchItems.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Fetchs items from arrays. The arrays are will be updated every 5 minutes on the server side to the MySQL database.
*/

flp_queueActive = 0;
_facNum = _this select 0; //Which factory? Weapons.. general... vehicles... etc...
_selection = _this select 1; //3 Available Categories, choose one. Weapons... Mods.... Ammo...etc...

//////////////////////////////////
///////////
//1. Change to 3 column format for factories.
//2. Finish the rest of the code of weapons factory.
//3. Add Description.
//4. Add Picture.
//5. Investigate possible algoritm, pulling from the item configs to determine value.

switch (_facNum) do {
    case 0: {
    //hint "FACTORY CALLED";

    	switch (_selection) do {
    	    case "1": {
    	    //hint "WEAPONS CALLED";
    	    lbClear 1500;
    	    _i = 0;
    	    	{

					if(((_x select 2) == _selection) AND (((_x select 6) != "True"))) then
						{
							_name = getText(configfile >> "CfgWeapons" >> _x select 0>> "displayName");
							_price = parseNumber(_x select 4); //This pulls the normal buy price from the array.
							_index = lbAdd [1500, format["%1", _name]];
							_array = [_x select 0, _x select 2, _x select 3, _x select 4];
							lbSetData [1500, _i, _x select 0];
							//hint format ["%1", _x];
							_index2 = lbAdd [1500, format["$%1", _price]];
							_i = _i + 1;
						};
				} forEach (missionNameSpace getVariable "flp_weapons");

    	    };

    	    case "3": {
    	    //hint "MODS CALLED";
    	    lbClear 1500;
    	    _i = 0;
    	    	{
					if(((_x select 2) == _selection) AND (((_x select 6) != "True"))) then
						{
							_name = getText(configfile >> "CfgWeapons" >> _x select 0>> "displayName");
							_price = parseNumber(_x select 4); //This pulls the normal buy price from the array.
							_index = lbAdd [1500, format["%1", _name]];
							lbSetData [1500, _i, _x select 0];
							_index2 = lbAdd [1500, format["$%1", _price]];
							_i = _i + 1;
						};
				} forEach (missionNameSpace getVariable "flp_weapons");

    	    };

    	    case "2": {
    	    //hint "AMMO CALLED";
    	    lbClear 1500;
    	    _i = 0;
    	    	{
					if(((_x select 2) == _selection) AND (((_x select 6) != "True"))) then
						{
							_name = getText(configfile >> "CfgMagazines" >> _x select 0>> "displayName");
							_price = parseNumber(_x select 4); //This pulls the normal buy price from the array.
							_index = lbAdd [1500, format["%1", _name]];
							lbSetData [1500, _i, _x select 0];
							_index2 = lbAdd [1500, format["$%1", _price]];
							_i = _i + 1;
						};
				} forEach (missionNameSpace getVariable "flp_weapons");

    	    };

    	    default {
    	     	/* STATEMENT */
    	    };
    	};


    };

    default {
     	/* STATEMENT */
    };
};