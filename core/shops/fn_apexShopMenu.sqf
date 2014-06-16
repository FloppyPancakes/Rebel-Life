/*
	File: fn_weaponShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something
*/
private["_config","_itemInfo","_itemList"];
uiNamespace setVariable ["Weapon_Shop",_this select 3];

disableSerialization;
if(!(createDialog "apex_shop")) exitwith {};

_config = [_this select 3] call life_fnc_weaponShopCfg;
if(typeName _config == "STRING") exitWith {hint _config; closeDialog 0;};

ctrlSetText[39401,_config select 0];

_filters = ((findDisplay 39400) displayCtrl 39402);
lbClear _filters;

_filters lbAdd "Shop Inventory";
//_filters lbAdd "Your Inventory";

_filters lbSetCurSel 0;