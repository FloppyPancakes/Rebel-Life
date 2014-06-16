// lightsoff.sqf
_pos    = _this select 0;

// Add more types if needed
_types = ["land_lampairport_f", "land_lampdecor_f", "land_lamphalogen_f", "land_lampharbour_f", "land_lampshabby_f", "land_lampstreet_small_f", "land_lampstreet_f"];


for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
   _lamps = player nearObjects [_types select _i, 5];
   Sleep 1;
   {_x switchLight "OFF"} forEach _lamps;
		if(!isNil "_lamps") then {
		_la = 
		hint format ["%1",_la];
		diag_log _lamps;
		if("_lamps" == "lampharbour_f.p3d") then {
			hint format["YAY!",""];
			}
		};
};  

/*
_hackables = [
"land_lampairport_f", 
"land_lampdecor_f", 
"land_lamphalogen_f", 
"land_lampharbour_f", 
"land_lampshabby_f", 
"land_lampstreet_small_f", 
"land_lampstreet_f"
];

exploit = objNull;

for [{_i=0},{_i < (count _hackables)},{_i=_i+1}] do
	{
		_htarget = player nearObjects [_hackables select _i, 5];
		exploit = switch _htarget do 
			{
				case "land_lampairport_f": {hint "hi";};
				case "land_lampdecor_f": {hint "hi";};
				case "land_lamphalogen_f": {hint "hi";};
				case "land_lampharbour_f": {hint "hi";};
				case "land_lampshabby_f": {hint "hi";};
				case "land_lampstreet_small_f": {hint "hi";};
				case "land_lampstreet_f": {hint "hi";};
			}
	};
	
	*/