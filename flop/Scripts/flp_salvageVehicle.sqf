/*
	File: flp_salvageVehicle.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Salvages Dead Vehicle.
*/


private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Salvaging %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;

		while{true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
			sleep 0.05;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};

		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText["Salvaging cancelled","PLAIN"]; life_action_inUse = false;};
		player removeItem "ToolKit";
		deleteVehicle _veh;
		titleText["You have salvaged that vehicle.","PLAIN"];

		switch (_displayName) do {
   			 case "Offroad": {
    		[true,"life_inv_scrapmetal",4] call life_fnc_handleInv;
	    	};

    		case "Zamak Transport (Covered)": {
    			[true,"scrapmetal",7] call life_fnc_handleInv;
    		};

    		case "Quadbike": {
    			[true,"scrapmetal",1] call life_fnc_handleInv;
    		};

    		case "Offroad": {
    			[true,"scrapmetal",4] call life_fnc_handleInv;
    		};

    		case "SUV": {
    			[true,"scrapmetal",3] call life_fnc_handleInv;
    		};

    		case "Hatchback": {
    			[true,"scrapmetal",3] call life_fnc_handleInv;
    		};

    		case "HEMTT Transport": {
    			[true,"scrapmetal",9] call life_fnc_handleInv;
    		};

    		default {
    		 	[true,"scrapmetal",1] call life_fnc_handleInv;
   			};
};
	} else {

		hint "You need a toolkit to salvage";

	};
};