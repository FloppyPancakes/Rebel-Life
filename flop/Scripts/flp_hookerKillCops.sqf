/*
	File: fn_restrain.sqf
	Author: Josh "Floppy Pancakes" Houston
	
	Description:
	Spawns 2 Opfor AI to kill cops. Truck wouldn't move for some reason.
*/

//hookertruck = "I_G_offroad_01_armed_f" createVehicle [9476.24,7976.76,0.00140762];
//hookertruck setDir 310;   
hookergroup = createGroup east;  
"O_Soldier_F" createUnit [[9224.04,8025.52,0.00121307], hookergroup, "hookergunner = this;"];   
"O_Soldier_F" createUnit [[9208.54,8123.23,0.00126266], hookergroup, "hookerdriver = this;"];  
//hookertruck allowDamage false;  
hookerdriver allowDamage false;  
hookergunner allowDamage false;  
//hookerdriver action ["getindriver", hookertruck];   
//hookergunner action ["getingunner", hookertruck]; 
hookerdriver doMove getMarkerPos "hookerkiller"; 
hookergunner doMove getMarkerPos "hookerkiller"; 

sleep 20;

deleteVehicle hookerdriver;
deleteVehicle hookergunner;