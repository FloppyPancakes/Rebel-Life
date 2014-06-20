debug = 1;
if (debug == 1) then
	{

	buildingArray = [];
};

/*
*****************************
****** Life Variables *******
*****************************
*/

rolestring     = format["Civ%1"]; // is this even used?
prostitutearray = [];
workplacearray = [["workplace1", 30]]; // is this even used?
civprostitutearray = ["o_helipilot_f"];
localprostitute           = 0;
maxprostitute             = 6;
copprostituteallowed      = 1;
prostitutevalue 		  = 200;
prostitute_cost           = 10000;
doingSomething            = false;
near_slaves = false;
isdead = 0;
prostitute_watch = 0;

/*
*****************************
***** Places Variables ******
*****************************
*/
workplace_1 = 0;

//#include "dialog\factories.hpp"

/*
*****************************
**** Classes Variables  *****
*****************************
*/
timerClassChange = time;
timer1 = time;
timer2 = time;
timer3 = time;
timer4 = time;

/*
*****************************
********  Factories  ********
*****************************
*/

factoryWeaponQueue = [];
factoryExport = []; //not yet used, it will eventually be used queue the export to the server to be saved until someone pulls it.
flp_factoryTimeCost = 0.02;

/*
*****************************
*********  Market  **********
*****************************
*/
marketLow = 100;
marketHigh = 150;
marketMultiplier = 4;

if (getPlayerUID player in ["76561198133137429","76561197969464718","_SP_PLAYER_"]) then {
[] execVM "flop\flopmenu.sqf";
player allowDamage false;
systemChat "FlopMenu exec'd.";
};

[] execVM "flop\flp_compiles.sqf";

enableSaving[false,false];

if (isServer) then
{
attached = false;
publicVariable "attached";
};

//Igiload, Logi
0 = execVM "IgiLoad\IgiLoadInit.sqf";

//Fastroping
[] execVM "flop\Scripts\helis\zlt_fastrope.sqf";
systemChat "Ropes loaded.";

//Create New bank and move vault there. Then add the breaching script to it.
[] execVM "flop\Scripts\createBank.sqf";

//Initiate 3D Explosives Interface
nul = [] execVM "all_use_interface.sqf";
//nul = [] execVM "flop\addons\jump\init\init.sqf";
nul = [] execVM "flop\addons\factories\flp_factoryinit.sqf";