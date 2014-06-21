/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handler for getting a variables name, short name, etc.
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
			case "oilu": {"life_inv_oilu"};
			case "oilp": {"life_inv_oilp"};
			case "heroinu": {"life_inv_heroinu"};
			case "heroinp": {"life_inv_heroinp"};
			case "cannabis": {"life_inv_cannabis"};
			case "marijuana": {"life_inv_marijuana"};
			case "apple": {"life_inv_apple"};
			case "water": {"life_inv_water"};
			case "rabbit": {"life_inv_rabbit"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "turtlesoup": {"life_inv_turtlesoup"};
			case "donuts": {"life_inv_donuts"};
			case "fuelE": {"life_inv_fuelE"};
			case "fuelF": {"life_inv_fuelF"};
			case "money": {"life_cash"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "copperore": {"life_inv_copperore"};
			case "ironore": {"life_inv_ironore"};
			case "iron_r": {"life_inv_ironr"};
			case "copper_r": {"life_inv_copperr"};
			case "salt": {"life_inv_salt"};
			case "salt_r": {"life_inv_saltr"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "tbacon": {"life_inv_tbacon"};
			case "lockpick": {"life_inv_lockpick"};
			case "redgull": {"life_inv_redgull"};
			case "peach": {"life_inv_peach"};
			case "diamond": {"life_inv_diamond"};
			case "diamondc": {"life_inv_diamondr"};
			case "cocaine": {"life_inv_coke"};
			case "cocainep": {"life_inv_cokep"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "cement": {"life_inv_cement"};
			case "rock": {"life_inv_rock"};
			case "goldbar": {"life_inv_goldbar"};
case "storage1": {"life_inv_storage1"};
case "storage2": {"life_inv_storage2"};
case "storage3": {"life_inv_storage3"};
case "hb1": {"life_inv_HBarrier_1_F"};
case "hb3": {"life_inv_HBarrier_3_F"};
case "hb5": {"life_inv_HBarrier_5_F"};
case "hbtf": {"life_inv_HBarrierTower_F"};
case "hbwcorn": {"life_inv_HBarrierWall_corner_F"};
case "hbwcorr": {"life_inv_HBarrierWall_corridor_F"};
case "hbw4": {"life_inv_HBarrierWall4_F"};
case "hbw6": {"life_inv_HBarrierWall6_F"};
case "rzrw": {"life_inv_Razorwire_F"};
case "patrv1": {"life_inv_Cargo_Patrol_V1_F"};
case "camo": {"life_inv_CamoNet_BLUFOR_F"};
case "camoo": {"life_inv_CamoNet_BLUFOR_open_F"};
case "camob": {"life_inv_CamoNet_BLUFOR_big_F"};
case "camocur": {"life_inv_CamoNet_BLUFOR_Curator_F"};
case "camobcur": {"life_inv_CamoNet_BLUFOR_big_Curator_F"};
case "barg": {"life_inv_BarGate_F"};
case "bcharge": {"life_breaching_charge"};
case "scrapmetal": {"life_inv_scrapmetal"};
case "metalore": {"life_inv_metal_ore"};
case "metalbar": {"life_inv_metal_bar"};
		};
	};

	case 1:
	{
		switch (_var) do
		{
			case "life_inv_oilu": {"oilu"};
			case "life_inv_oilp": {"oilp"};
			case "life_inv_heroinu": {"heroinu"};
			case "life_inv_heroinp": {"heroinp"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_marijuana": {"marijuana"};
			case "life_inv_apple": {"apple"};
			case "life_inv_water": {"water"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_turtlesoup": {"turtlesoup"};
			case "life_inv_donuts": {"donuts"};
			case "life_inv_fuelE": {"fuelE"};
			case "life_inv_fuelF": {"fuelF"};
			case "life_cash": {"money"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_copperore": {"copperore"};
			case "life_inv_ironore": {"ironore"};
			case "life_inv_ironr": {"iron_r"};
			case "life_inv_copperr": {"copper_r"};
			case "life_inv_sand": {"sand"};
			case "life_inv_salt": {"salt"};
			case "life_inv_glass": {"glass"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_tbacon": {"tbacon"};
			case "life_inv_peach": {"peach"};
			case "life_inv_diamond": {"diamond"};
			case "life_inv_diamondr": {"diamondc"};
			case "life_inv_saltr": {"salt_r"};
			case "life_inv_coke": {"cocaine"};
			case "life_inv_cokep": {"cocainep"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_cement": {"cement"};
			case "life_inv_rock": {"rock"};
			case "life_inv_goldbar": {"goldbar"};
case "life_inv_storage1": {"storage1"};
case "life_inv_storage2": {"storage2"};
case "life_inv_storage3": {"storage3"};
case "life_inv_HBarrier_1_F": {"hb1"};
case "life_inv_HBarrier_3_F": {"hb3"};
case "life_inv_HBarrier_5_F": {"hb5"};
case "life_inv_HBarrierTower_F": {"hbtf"};
case "life_inv_HBarrierWall_corner_F": {"hbwcorn"};
case "life_inv_HBarrierWall_corridor_F": {"hbwcorr"};
case "life_inv_HBarrierWall4_F": {"hbw4"};
case "life_inv_HBarrierWall6_F": {"hbw6"};
case "life_inv_Razorwire_F": {"rzrw"};
case "life_inv_Cargo_Patrol_V1_F": {"patrv1"};
case "life_inv_CamoNet_BLUFOR_F": {"camo"};
case "life_inv_CamoNet_BLUFOR_open_F": {"camoo"};
case "life_inv_CamoNet_BLUFOR_big_F": {"camob"};
case "life_inv_CamoNet_BLUFOR_Curator_F": {"camocur"};
case "life_inv_CamoNet_BLUFOR_big_Curator_F": {"camobcur"};
case "life_inv_BarGate_F": {"barg"};
case "life_breaching_charge": {"bcharge"};
case "life_inv_scrapmetal": {"scrapmetal"};
case "life_inv_metal_ore": {"metalore"};
case "life_inv_metal_bar": {"metalbar"};
		};
	};
};
