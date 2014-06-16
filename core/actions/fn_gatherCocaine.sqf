/*
	File: fn_gatherCocaine.sqf
	
	Description:
	Gathers cocaine?
*/
private["_sum"];
_sum = ["cocaine",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

hint format["%1 \n%2", life_carryWeight, life_maxWeight];


if(_sum > 0) then
{
	life_action_inUse = true;
	titleText["Gathering Cocaine...","PLAIN"];
	titleFadeOut 5;
	sleep 5;
	if(([true,"cocaine",1] call life_fnc_handleInv)) then
	{
		titleText["You have collected some Cocaine.","PLAIN"];
	};
}
	else
{
	hint "Your inventory space is full.";
};

life_action_inUse = false;