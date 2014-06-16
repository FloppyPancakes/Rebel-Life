/*
	File: flp_destroyRadio.sqf
	
	Description:
	Destroys target Radio
*/

cursorTarget unassignItem "ItemRadio";
cursorTarget removeItem "ItemRadio";
hint "Radio Destroyed.";