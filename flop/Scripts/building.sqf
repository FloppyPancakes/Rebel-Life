phx = 0;
phy = 5;
phz = 0;
pr = 0;
//pbuild = "";

pbbuildings = {
_pbm0 = player addAction["***Previous Menu***", {removeAllActions player, call pbmmain}];
_pbm1 = player addAction["<t color=""#33FF00"">" + "HQ" ,{pbuild = "Land_Cargo_HQ_V1_F" createvehicle position player; pbuild attachTo [player, [phx,phy,phz]]; removeAllActions player, call pbmmain},"",1.5,true,false];
_pbm1 = player addAction["<t color=""#33FF00"">" + "Small Tower" + "</t>",{pbuild = "Land_Cargo_Patrol_V1_F" createvehicle position player; pbuild attachTo [player, [phx,phy,phz]]; removeAllActions player, call pbmmain},"",1.5,true,false];
_pbm1 = player addAction["<t color=""#33FF00"">" + "Large Tower" + "</t>",{pbuild = "Land_Cargo_Tower_V1_F" createvehicle position player; pbuild attachTo [player, [phx,phy,phz]]; removeAllActions player, call pbmmain},"",1.5,true,false];
_pbm1 = player addAction["<t color=""#33FF00"">" + "Hospital Main" + "</t>",{pbuild = "Land_Hospital_main_F" createvehicle position player; pbuild attachTo [player, [phx,phy,phz]]; removeAllActions player, call pbmmain},"",1.5,true,false];
_pbm1 = player addAction["<t color=""#33FF00"">" + "Large Shed" + "</t>",{pbuild = "Land_i_Shed_Ind_F" createvehicle position player; pbuild attachTo [player, [phx,phy,phz]]; removeAllActions player, call pbmmain},"",1.5,true,false];
_pbm1 = player addAction["<t color=""#33FF00"">" + "Air Control Tower" + "</t>",{pbuild = "Land_Airport_Tower_F" createvehicle position player; pbuild attachTo [player, [phx,phy,phz]]; removeAllActions player, call pbmmain},"",1.5,true,false];
_pbm2 = player addAction["<t color=""#33FF00"">" + "Large Dome" + "</t>",{pbuild = "Land_dome_small_f" createvehicle position player; pbuild attachTo [player, [phx,phy+10,phz+7]]; phy = phy+10, phz = phz+7, removeAllActions player, call pbmmain},"",1.5,true,false];
_pbm3 = player addAction["<t color=""#33FF00"">" + "Naval Pier (Long)" + "</t>",{pbuild = "Land_nav_pier_m_f" createvehicle position player; pbuild attachTo [player, [phx,phy+14,phz-20]]; phy = phy+14, phz = phz-20,removeAllActions player, call pbmmain},"",1.5,true,false];
_pbm4 = player addAction["<t color=""#33FF00"">" + "Naval Pier (Block)" + "</t>",{pbuild = "Land_pier_box_f" createvehicle position player; pbuild attachTo [player, [phx,phy+14,phz-20]]; phy = phy+14, phz = phz-20,removeAllActions player, call pbmmain},"",1.5,true,false];
_pbm5 = player addAction["<t color=""#33FF00"">" + "House 1" + "</t>",{pbuild = "Land_i_house_big_02_v3_f" createvehicle position player; pbuild attachTo [player, [phx,phy,phz]]; removeAllActions player, call pbmmain},"",1.5,true,false];
_pbm6 = player addAction["<t color=""#33FF00"">" + "Garage" + "</t>",{pbuild = "Land_i_garage_v1_f" createvehicle position player; pbuild attachTo [player, [phx,phy,phz]]; removeAllActions player, call pbmmain},"",1.5,true,false];
};

pbmdistance = {
_pbm0 = player addAction["***Previous Menu***", {removeAllActions player, call pbmmain}];
_pbm1 = player addAction["<t color=""#33FF00"">" + "Half Meter Farther" + "</t>",{phy=phy+0.05; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
_pbm2 = player addAction["<t color=""#33FF00"">" + "One Meter Farther" + "</t>",{phy=phy+1; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
_pbm3 = player addAction["<t color=""#FF0000"">" + "One Meter Closer" + "</t>",{phy=phy-1; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
_pbm4 = player addAction["<t color=""#FF0000"">" + "Half Meter Farther" + "</t>",{phy=phy-0.05; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
};

pbmheight = {
_pbm0 = player addAction["***Previous Menu***", {removeAllActions player, call pbmmain}];
_pbm1 = player addAction["<t color=""#33FF00"">" + "Raise .01 meter" + "</t>",{phz=phz+0.01; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
_pbm2 = player addAction["<t color=""#33FF00"">" + "Raise .1 meter" + "</t>",{phz=phz+0.1; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
_pbm3 = player addAction["<t color=""#33FF00"">" + "Raise .25 meter" + "</t>",{phz=phz+0.25; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
_pbm4 = player addAction["<t color=""#33FF00"">" + "Raise 1 meter" + "</t>",{phz=phz+1; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
_pbm5 = player addAction["<t color=""#FF0000"">" + "Lower 1 meter" + "</t>",{phz=phz-1; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
_pbm6 = player addAction["<t color=""#FF0000"">" + "Lower .25 meter" + "</t>",{phz=phz-0.25; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
_pbm7 = player addAction["<t color=""#FF0000"">" + "Lower .1 meter" + "</t>",{phz=phz-0.1; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
_pbm8 = player addAction["<t color=""#FF0000"">" + "Lower .01 meter" + "</t>",{phz=phz-0.01; pbuild attachto [player, [phx,phy,phz]]},"",1.5,true,false];
};

pbmrotate = {
_pbm0 = player addAction["***Previous Menu***", {removeAllActions player, call pbmmain}];
_pbm1 = player addAction["<t color=""#33FF00"">" + "Turn Clockwise 15 Degrees" + "</t>",{pr = pr + 15; pbuild setDir pr},"",1.5,true,false];
_pbm2 = player addAction["<t color=""#33FF00"">" + "Turn Clockwise 30 Degrees" + "</t>",{pr = pr + 30; pbuild setDir pr},"",1.5,true,false];
_pbm3 = player addAction["<t color=""#33FF00"">" + "Turn Clockwise 45 Degrees " + "</t>",{pr = pr + 45; pbuild setDir pr},"",1.5,true,false];
_pbm4 = player addAction["<t color=""#33FF00"">" + "Turn Clockwise 90 Degrees" + "</t>",{pr = pr + 90; pbuild setDir pr},"",1.5,true,false];
_pbm5 = player addAction["<t color=""#FF0000"">" + "Turn Counter-Clockwise 90 Degrees" + "</t>",{pr = pr + 90; pbuild setDir pr},"",1.5,true,false];
_pbm6 = player addAction["<t color=""#FF0000"">" + "Turn Counter-Clockwise 45 Degrees" + "</t>",{pr = pr + 45; pbuild setDir pr},"",1.5,true,false];
_pbm7 = player addAction["<t color=""#FF0000"">" + "Turn Counter-Clockwise 30 Degrees" + "</t>",{pr = pr + 30; pbuild setDir pr},"",1.5,true,false];
_pbm8 = player addAction["<t color=""#FF0000"">" + "Turn Counter-Clockwise 15 Degrees" + "</t>",{pr = pr + 15; pbuild setDir pr},"",1.5,true,false];
};

pbmmain = {
_pbm0 = player addAction["Return to Storage",{deleteVehicle pbuild, removeAllActions player, pbuild = nil, [] execVM "flop\scripts\building.sqf"}];
_pbm1 = player addAction["Buildings",{removeAllActions player, call pbbuildings}];
_pbm2 = player addAction["<t color=""#33FF00"">" + "Change Height" + "</t>",{removeAllActions player, call pbmheight}];
_pbm3 = player addAction["<t color=""#33FF00"">" + "Change Rotation" + "</t>",{removeAllActions player, call pbmrotate}];
_pbm4 = player addAction["<t color=""#33FF00"">" + "Distance" + "</t>",{removeAllActions player, call pbmdistance}];
_pbm5 = player addAction["<t color=""#FF0000"">" + "************************" + "</t>","","",1.5,false];
_pbm6 = player addAction["<t color=""#FFFF00"">" + "You can only place once!","","",1.5,false];
_pbm7 = player addAction["<t color=""#FF0000"">" + "************************" + "</t>","","",1.5,false];
_pbm8 = player addAction["<t color=""#33FF00"">" + "Place Object!" + "</t>",{removeAllActions player, call pbplace, [] execVM "flop\scripts\building.sqf"}];
};

pbplace = {


detach pbuild;
buildingArray = buildingArray + [[getPosATL pbuild,getDir pbuild]];
diag_log buildingArray;
pbuild = nil;
};

_pbm0 = player addAction["<t color=""#33FF00"">" + "Build Menu" + "</t>",{removeAllActions player, call pbmmain}];