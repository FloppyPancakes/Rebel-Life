if (isServer) exitWith { //This prevents double buildings. Or more.

bank1 = "Land_Hospital_side1_F" createVehicle[8328.08,14786.1,-0.535];
bank3 = "Land_Hospital_main_F" createVehicle [8296.4,14793.2,-8.49799];
bank4 = "Land_Hospital_side2_F" createVehicle [8292.381,14826.12,-3.09];
bank2 = "Land_i_Shed_Ind_F" createVehicle [8322.12,14789.5,13.177];


bank1 setPosATL [8329.08,14782.1,-0.535];
bank2 setPosATL [8323.12,14784.45,12.78];
bank3 setPosATL [8297.19,14789.218,-9.165];
bank4 setPosATL [8292.97,14821.95,-1.85];

bank1 setDir 96;
bank2 setDir 186;
bank3 setDir 96;
bank4 setDir 96;


bank1 allowDamage false;
bank2 allowDamage false;
bank3 allowDamage false;
bank4 allowDamage false;

bank2 setVariable ['bis_disabled_Door_1',1,true]; //Eastern Large UNBREACHABLE
bank2 setVariable ['bis_disabled_Door_2',1,true]; //Eastern Large BREACHABLE
bank2 setVariable ['bis_disabled_Door_3',1,true]; //North Eastern BREACHABLE
//bank2 setVariable ['bis_disabled_Door_4',1,true]; //Inside Door
bank2 setVariable ['bis_disabled_Door_5',1,true]; //West Western Large BREACHABLE
bank2 setVariable ['bis_disabled_Door_6',1,true]; //East Western Large BREACHABLE
bank2 setVariable ['bis_disabled_Door_7',1,true]; //Western Large BREACHABLE

fed_bank setPosATL [8311.43,14783.8,8.67317];
fed_bank setDir 9.09261;


bank2 addAction[
"Lock Bank",
"flop\Scripts\lockBank.sqf",
"",
99,
false,
true,
"",
' playerSide == west '
];

//Create Lights and Parking Area
_lamp = "Land_LampStreet_small_F" createvehicle [8375.9,14783.8,-0.0775909];
_lamp setPosATL [8375.9,14783.8,-0.0775909];
_lamp setDir 280.907;
_lamp = "Land_LampStreet_small_F" createvehicle [8357.97,14787.9,-0.00230408];
_lamp setPosATL [8357.97,14787.9,-0.00230408];
_lamp setDir 104.063;
_lamp = "Land_LampStreet_small_F" createvehicle [8340.57,14792.2,0.0286484];
_lamp setPosATL [8340.57,14792.2,0.0286484];
_lamp setDir 185.423;
_lamp = "Land_LampStreet_small_F" createvehicle [8320.05,14798,-0.151939];
_lamp setPosATL [8320.05,14798,-0.151939];
_lamp setDir 186.899;
_lamp = "Land_LampStreet_small_F" createvehicle [8304.31,14805.7,-0.116516];
_lamp setPosATL [8304.31,14805.7,-0.116516];
_lamp setDir 271.886;
_lamp = "Land_LampStreet_small_F" createvehicle [8307.38,14829.6,0.0872498];
_lamp setPosATL [8307.38,14829.6,0.0872498];
_lamp setDir 5.9347;
_shed = "Land_Shed_Small_F" createvehicle [8301.32,14818.1,-0.0739594];
_shed setPosATL [8301.32,14818.1,-0.0739594];
_shed setDir 6.14257;

};