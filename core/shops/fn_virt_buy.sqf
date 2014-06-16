/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name"];
if((lbCurSel 2401) == -1) exitWith {hint "You need to select an item to buy."};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call fnc_isnumber)) exitWith {hint "You didn't enter an actual number";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint "You don't have enough space for that amount!"};
_amount = _diff;
if((_price * _amount) > life_cash) exitWith {hint "You don't have that much money!"};

_exit = 0;
_flpw = missionNameSpace getVariable "flp_water";
_flpra = missionNameSpace getVariable "flp_rabbit";
_flpap = missionNameSpace getVariable "flp_apple";
_flprg = missionNameSpace getVariable "flp_redgull";
_flptb = missionNameSpace getVariable "flp_tbacon";
_flplp = missionNameSpace getVariable "flp_lockpick";
_flppx = missionNameSpace getVariable "flp_pickaxe";
//_flpra = missionNameSpace getVariable "flp_fuelF";
_flppe = missionNameSpace getVariable "flp_peach";


switch (_type) do
	{
	case "water": { 
	if(_amount >= (missionNameSpace getVariable "flp_water")) exitWith {hint "Sorry, we are all out of Water."; _exit = 1;};	
	if(_amount < _flpw) then { flp_water = _flpw - _amount;	}; publicVariable "flp_water";
	};
	case "rabbit": { 
	if(_amount >= (missionNameSpace getVariable "flp_rabbit")) exitWith {hint "Sorry, we are all out of Rabbits."; _exit = 1;};	
	if(_amount < _flpra) then { flp_rabbit = _flpra - _amount; }; publicVariable "flp_rabbit";
	};
	case "apple": { 
	if(_amount >= (missionNameSpace getVariable "flp_apple")) exitWith {hint "Sorry, we are all out of Apples."; _exit = 1;};	
	if(_amount < _flpap) then { flp_apple = _flpap - _amount; }; publicVariable "flp_apple";
	};
	case "redgull": { 
	if(_amount >= (missionNameSpace getVariable "flp_redgull")) exitWith {hint "Sorry, we are all out of RedGull."; _exit = 1;};	
	if(_amount < _flprg) then { flp_redgull = _flprg - _amount; }; publicVariable "flp_redgull";
	};
	case "tbacon": { 
	if(_amount >= (missionNameSpace getVariable "flp_tbacon")) exitWith {hint "Sorry, we are all out of Tactical Bacon."; _exit = 1;};	
	if(_amount < _flptb) then { flp_tbacon = _flptb - _amount; }; publicVariable "flp_tbacon";
	};
	case "lockpick": { 
	if(_amount >= (missionNameSpace getVariable "flp_lockpick")) exitWith {hint "Sorry, we are all out of Lockpicks."; _exit = 1;};	
	if(_amount < _flplp) then { flp_lockpick = _flplp - _amount; }; publicVariable "flp_lockpick";
	};
	case "pickaxe": { 
	if(_amount >= (missionNameSpace getVariable "flp_pickaxe")) exitWith {hint "Sorry, we are all out of Pickaxes."; _exit = 1;};	
	if(_amount < _flppx) then { flp_pickaxe = _flppx - _amount; }; publicVariable "flp_pickaxe";
	};
	case "peach": { 
	if(_amount >= (missionNameSpace getVariable "flp_peach")) exitWith {hint "Sorry, we are all out of Peachs."; _exit = 1;};	
	if(_amount < _flppe) then { flp_peach = _flppe - _amount; }; publicVariable "flp_peach";
	};
	};

if(_exit == 1) exitWith {
};

_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	hint format["You bought %1 %2 for $%3",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
	life_cash = life_cash - (_price * _amount);
	[] call life_fnc_virt_update;
};
