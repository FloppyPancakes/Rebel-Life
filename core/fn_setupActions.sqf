/*
	File: fn_setupActions.sqf

	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction["Drop Fishing Net",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];

		//Rob person
		life_actions = life_actions + [player addAction["Rob Person",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];

		//Destroy GPS
		life_actions = life_actions + [player addAction["Destroy GPS","flop\Scripts\flp_destroyGPS.sqf","",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" ']];

		//Destroy Radio
		life_actions = life_actions + [player addAction["Destroy Radio","flop\Scripts\flp_destroyRadio.sqf","",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" ']];

		//Gather Ores
		/*
		life_actions = life_actions + [player addAction["Gather Ore",life_fnc_gatherAction,["metalore",1],0,false,false,"",'
		!life_action_in_use && (player distance (getMarkerPos "ore_1") < 150) && (vehicle player == player) && (life_carryWeight + (["metalore"] call life_fnc_itemWeight)) <= life_maxWeight ']];
		*/
	};
};