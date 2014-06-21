/*
	File: fn_gatherAction.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Master gathering script, to replace all inferior scripts!
*/

private["_sum"];

_item = [_this select 3,0,"",[""]] call BIS_fnc_param;
_count = [_this select 3,1,1,[1]] call BIS_fnc_param;

_itemName = [([_item,0] call life_fnc_varHandle)] call life_fnc_varToStr;

titleText[format["Gathering %1...",_itemName],"PLAIN"];
life_action_in_use = true;

while {life_carryWeight < life_maxWeight} do
{
	if (!(alive player)) exitWith {};
	if (speed player > 1) exitWith { titleText["Gathering aborted. You must remain still while gathering.","PLAIN"]; };
	if (life_carryWeight >= life_maxWeight) exitWith { titleText [format["Gathering done. You can't hold more %1.", _itemName],"PLAIN"]; };
	_sum = [_item,_count,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if(_sum > 0) then
	{
		sleep 5;
		if(!([true,_item,_count] call life_fnc_handleInv)) exitWith
		{
			titleText [format["Gathering done. You can't hold more %1.", _itemName],"PLAIN"];
		};
		titleText [format["Gathered %1 %2.",_count,_itemName],"PLAIN"];
		titleFadeOut 1;
		//[[6, player, format["Picked %1 %2", _sum, _itemName]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;
	};
};

life_action_in_use = false;