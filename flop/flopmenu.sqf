flpmain = {
	player addaction ["Teleports", {removeAllActions player; call flptele}];
	player addaction ["Debug", {removeAllActions player; call debug}];
	player addAction ["<t color=""#33FF00"">" + "ZEUS BOLT" + "</t>",{call bolt},"",1.5,true,false];
	player addAction ["<t color=""#FF0000"">" + "Minimize" + "</t>",{removeAllActions player;[] execVM "flop\flopmenu.sqf"}];
};

debug = {
	player addAction ["<t color=""#FFCC26"">" + "Cursor Target" + "</t>",{_ct = cursorTarget; hint format["%1",_ct];}];
	player addAction ["<t color=""#33FF00"">" + "Add $1,000,000" + "</t>",{life_cash = life_cash + 1000000},"",1.5,true,false];
	player addAction ["<t color=""#FF0000"">" + "DELETE CURSOR" + "</t>",{deleteVehicle cursorTarget;}];
	player addaction ["Test 1", "test.sqf","",1.5,true,false];
	player addaction ["Test 2", "test2.sqf","",1.5,true,false];
	player addAction ["<t color=""#FF0000"">" + "Call VAS" + "</t>",{[] execVM "VAS\open.sqf"}];
	player addAction ["Black Out Target",{_vic = cursorTarget; if (isNull _vic) then {_vic = player;}; _vic setObjectTexture [0,'#(argb,8,8,3)color(0,0,0,0)']}];
	player addAction ["Light Me",{call lightme}];
	player addAction ["Return to Main",{removeAllActions player; call flpmain}];
};

flptele = {
	player addAction ["Teleport", {openMap true; titleText["Select Map Position", "PLAIN"];onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";}];
	player addAction ["<t color=""#33FF00"">" + "Teleport to Kavala" + "</t>",{removeAllActions player, player setpos getmarkerpos "cop_car_1",[] execVM "flop\flopmenu.sqf"}];
	player addAction ["<t color=""#33FF00"">" + "Teleport to Athira" + "</t>",{removeAllActions player, player setpos getmarkerpos "cop_car_2",[] execVM "flop\flopmenu.sqf"}];
	player addAction ["<t color=""#33FF00"">" + "Teleport to Donator" + "</t>",{removeAllActions player, player setpos getmarkerpos "donator_2_1",[] execVM "flop\flopmenu.sqf"}];
	player addAction ["Return to Main",{removeAllActions player; call flpmain}];
};

bolt = {
	_vic = cursorTarget;
	_vict = getPos _vic;
	_vic enablesimulationGlobal true;

	_bolt = createvehicle ["LightningBolt",_vict,[],0,"can collide"];
	_bolt setposatl _vict;
	_bolt setdamage 1;



	_light = "#lightpoint" createvehicle _vict;
	_light setposatl [_vict select 0,_vict select 1,(_vict select 2) + 10];
	_light setLightDayLight true;
	_light setLightBrightness 300;
	_light setLightAmbient [0.05, 0.05, 0.1];
	_light setlightcolor [1, 1, 2];

	sleep 0.1;
	_light setLightBrightness 0;
	sleep (random 0.1);

	_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
	_lightning = _class createvehicle [100,100,100];
	_lightning setdamage 1;
	_lightning setpos _vict;
	_vic setVelocity [0,0,150];
	deleteVehicle _lightning;
};

lightme = {

	_loc = getPos player;
	light = "#lightpoint" createvehicle _loc;
	//light setposatl [_loc select 0,_loc select 1,(_loc select 2) + 10];
	_pos = [player];
	light attachTo [player, [0, 0, 1.5]];
	//light attachTo [player];
	light setLightDayLight true;
	light setLightBrightness 1;
	light setLightAmbient [0.05, 0.05, 0.1];
	light setlightcolor [1, 1, 2];

	};

player addaction ["<t color=""#33FF00"">" + "Flop Menu" + "</t>", {removeAllActions player; call flpmain}];