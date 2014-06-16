/*
	File: flp_destroyGPS.sqf
	
	Description:
	Destroys target GPS
*/

cursorTarget unassignItem "ItemGPS";
cursorTarget removeItem "ItemGPS";
hint "GPS Destroyed.";