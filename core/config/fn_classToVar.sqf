/*
	File: fn_classToVar.sqf
	Author: Josh "Floppy Pancakes" Houston
	
	Description:
	Handler for Real items to Virtual Items
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "Land_HBarrier_1_F": {"hb1"};
			case "Land_HBarrier_3_F": {"hb3"};
			case "Land_HBarrier_5_F": {"hb5"};
			case "Land_HBarrierTower_F": {"hbtf"};
			case "Land_HBarrierWall_corner_F": {"hbwcorn"};
			case "Land_HBarrierWall_corridor_F": {"hbwcorr"};
			case "Land_HBarrierWall4_F": {"hbw4"};
			case "Land_HBarrierWall6_F": {"hbw6"};
			case "Land_Razorwire_F": {"rzrw"};
			case "Land_Cargo_Patrol_V1_F": {"patrv1"};
			case "CamoNet_BLUFOR_F": {"camo"};
			case "CamoNet_BLUFOR_open_F": {"camoo"};
			case "CamoNet_BLUFOR_big_F": {"camob"};
			case "CamoNet_BLUFOR_Curator_F": {"camocur"};
			case "CamoNet_BLUFOR_big_Curator_F": {"camobcur"};
			case "Land_BarGate_F": {"barg"};

		};
	};
	
	case 1:
	{
		switch (_var) do
		{
			case "hb1": {"Land_HBarrier_1_F"};
			case "hb3": {"Land_HBarrier_3_F"};
			case "hb5": {"Land_HBarrier_5_F"};
			case "hbtf": {"Land_HBarrierTower_F"};
			case "hbwcorn": {"Land_HBarrierWall_corner_F"};
			case "hbwcorr": {"Land_HBarrierWall_corridor_F"};
			case "hbw4": {"Land_HBarrierWall4_F"};
			case "hbw6": {"Land_HBarrierWall6_F"};
			case "rzrw": {"Land_Razorwire_F"};
			case "patrv1": {"Land_Cargo_Patrol_V1_F"};
			case "camo": {"CamoNet_BLUFOR_F"};
			case "camoo": {"CamoNet_BLUFOR_open_F"};
			case "camob": {"CamoNet_BLUFOR_big_F"};
			case "camocur": {"CamoNet_BLUFOR_Curator_F"};
			case "camobcur": {"CamoNet_BLUFOR_big_Curator_F"};
			case "barg": {"Land_BarGate_F"};

		};
	};
};
