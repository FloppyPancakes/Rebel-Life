/*
	File: flp_itemUsage.sqf
	Author: Josh "Floppy Pancakes"

	Description:
	Handles Description of Items Usage. Just add as needed.
*/

_item = _this select 0;
if(_item == "") exitWith {};

	switch (_item) do
	{
		case "life_inv_apple": {_item = "Adds 10 to your Food."};
		case "life_inv_rabbit": {_item = "Adds 20 to your Food."};
		case "life_inv_salema": {_item = "Adds 30 to your Food."};
		case "life_inv_ornate": {_item = "Adds 25 to your Food."};
		case "life_inv_mackerel": {_item = "Adds 30 to your Food."};
		case "life_inv_tuna": {_item = "Adds 100 to your Food."};
		case "life_inv_mullet": {_item = "Adds 80 to your Food."};
		case "life_inv_catshark": {_item = "Adds 100 to your Food."};
		case "life_inv_turtle": {_item = "Adds 100 to your Food."};
		case "life_inv_turtlesoup": {_item = "Adds 100 to your Food."};
		case "life_inv_donuts": {_item = "Adds 30 to your Food."};
		case "life_inv_tbacon": {_item = "Adds 40 to your Food."};
		case "life_inv_peach": {_item = "Adds 10 to your Food."};
		case "life_inv_water": {_item = "Adds 100 to your Hydration."};
		case "life_inv_redgull": {_item = "Adds 100 to your Hydration. Allows you to sprint for 3 minutes."};
		case "life_inv_pickaxe": {_item = "Facilitates in mining."};
		case "life_inv_fuelF": {_item = "Adds Fuel to a Vehicle."};
		case "life_inv_spikestrip": {_item = "A deployable Spike Strip used to immobilize vehicles."};
		default {_item = ""};
};

_item;