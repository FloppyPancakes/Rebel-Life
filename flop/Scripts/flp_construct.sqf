/*
	File: flp_construct.sqf
	Author: Josh "Floppy Pancakes" Houston
	
	Description:
	Takes any useable item and allows user to place it in the world. 
	Does NOT save between restarts.
*/
phx = 0;
phy = 7;
phz = 1;
pr = 0;

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
_pbm0 = player addAction["Return to Storage",{deleteVehicle pbuild, removeAllActions player, pbuild = nil}];
_pbm2 = player addAction["<t color=""#33FF00"">" + "Change Height" + "</t>",{removeAllActions player, call pbmheight}];
_pbm3 = player addAction["<t color=""#33FF00"">" + "Change Rotation" + "</t>",{removeAllActions player, call pbmrotate}];
_pbm4 = player addAction["<t color=""#33FF00"">" + "Distance" + "</t>",{removeAllActions player, call pbmdistance}];
_pbm5 = player addAction["<t color=""#FF0000"">" + "************************" + "</t>","","",1.5,false];
_pbm6 = player addAction["<t color=""#FFFF00"">" + "You can only place once!","","",1.5,false];
_pbm7 = player addAction["<t color=""#FF0000"">" + "************************" + "</t>","","",1.5,false];
_pbm8 = player addAction["<t color=""#33FF00"">" + "Place Object!" + "</t>",
	{
		removeAllActions player, 
		detach pbuild, 
		pbuild = nil,  
		closeDialog 0,
		pconstruct = [pconstruct,0] call life_fnc_classToVar,
		[false,pconstruct,1] call life_fnc_handleInv
	}
	];
};

//hint format["%1",pconstruct];
pbuild = pconstruct createvehicle position player;
pbuild attachTo [player, [0,7,1]]; call pbmmain;