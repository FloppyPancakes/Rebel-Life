/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {7};
	case "oilp": {6};
	case "heroinu": {6};
	case "heroinp": {4};
	case "cannabis": {4};
	case "marijuana": {3};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {6};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {2};
	case "iron_r": {2};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {1};
	case "glass": {1};
	case "diamond": {4};
	case "diamondc": {2};
	case "cocaine": {6};
	case "cocainep": {3};
	case "spikeStrip": {15};
	case "rock": {6};
	case "cement": {5};
	case "goldbar": {12};
case "storage1": {50};
case "storage2": {50};
case "storage3": {50};
case "hb1": {50};
case "hb3": {50};
case "hb5": {50};
case "hbtf": {50};
case "hbwcorn": {50};
case "hbwcorr": {50};
case "hbw4": {50};
case "hbw6": {50};
case "rzrw": {50};
case "patrv1": {50};
case "camo": {50};
case "camoo": {50};
case "camob": {50};
case "camocur": {50};
case "camobcur": {50};
case "barg": {50};
case "bcharge": {5};
case "scrapmetal": {5};
case "metalbar": {3};
case "metalore": {3};
	default {1};
};
