#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,__GETC__(sell_array)] call fnc_index;
if(_index == -1) exitWith {};
_price = (__GETC__(sell_array) select _index) select 1;
_var = [_type,0] call life_fnc_varHandle;

_amount = ctrlText 2405;
if(!([_amount] call fnc_isnumber)) exitWith {hint "You didn't enter an actual number";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint "You don't have that many items to sell!"};

_flpw = missionNameSpace getVariable "flp_water";
_flpra = missionNameSpace getVariable "flp_rabbit";
_flpap = missionNameSpace getVariable "flp_apple";
_flprg = missionNameSpace getVariable "flp_redgull";
_flptb = missionNameSpace getVariable "flp_tbacon";
_flplp = missionNameSpace getVariable "flp_lockpick";
_flppx = missionNameSpace getVariable "flp_pickaxe";
//_flpra = missionNameSpace getVariable "flp_fuelF";
_flppe = missionNameSpace getVariable "flp_peach";

_price = (_price * _amount);
_name = [_var] call life_fnc_vartostr;
if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	hint format["You sold %1 %2 for $%3",_amount,_name,[_price] call life_fnc_numberText];
	life_cash = life_cash + _price;
	[] call life_fnc_virt_update;
	
	switch (_type) do
	{
	case "water": { flp_water = _flpw + _amount; publicVariable "flp_water";
	};
	case "rabbit": { flp_rabbit = _flpra + _amount; publicVariable "flp_rabbit";
	};
	case "apple": { flp_apple = _flpap + _amount; publicVariable "flp_apple";
	};
	case "redgull": { flp_redgull = _flprg + _amount; publicVariable "flp_redgull";
	};
	case "tbacon": { flp_tbacon = _flptb + _amount; publicVariable "flp_tbacon";
	};
	case "lockpick": { flp_lockpick = _flplp + _amount; publicVariable "flp_lockpick";
	};
	case "pickaxe": { flp_pickaxe = _flppx + _amount; publicVariable "flp_pickaxe";
	};
	case "peach": { flp_peach = _flppe + _amount; publicVariable "flp_peach";
	};
	};
	
};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,name player,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array set[count _array,[getPlayerUID player,name player,_price]];
		life_shop_npc setVariable["sellers",_array,true];
	};
};