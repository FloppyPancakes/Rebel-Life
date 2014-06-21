/*
	File: flp_spawnOrbit.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Orbtis Spawn with Camera on currently selected spawn.
*/

_selection = _this select 0;

flp_orbit = {

camdestroy flpcam;

_camera = _this select 0;

flpcam = "camera" camcreate [0,0,0];
flpcam cameraeffect ["internal", "back"] ;

flpcam camsettarget getMarkerPos _camera;
flpcam camsetrelpos [0,-45,20];
flpcam camcommit 0 ;

titlecut [" ","BLACK IN",2];

while {true} do {
flpcam camsetrelpos [-45,0,20];
flpcam camcommit 30;
sleep 30;

flpcam camsetrelpos [0,45,20];
flpcam camcommit 30;
sleep 30;

flpcam camsetrelpos [45,0,20];
flpcam camcommit 30;
sleep 30;

flpcam camsetrelpos [0,-45,20];
flpcam camcommit 30;
camcommitted flpcam;
sleep 30;
};


flpcam cameraeffect ["terminate", "back"];
camdestroy flpcam;

titlecut [" ","BLACK IN",2];

};

switch (playerSide) do {
    case Civilian: {

    	switch (_selection) do {
    	    case 0: {
    	    	["kavalacam"] call flp_orbit;
    	    };

    	    case 1: {
    	    	["pygroscam"] call flp_orbit;
    	    };

    	    case 2: {
    	    	["athiracam"] call flp_orbit;
    	    };

    	    case 3: {
    	    	["sofiacam"] call flp_orbit;
    	    };
    	    default {
    	     	/* STATEMENT */
    	    };
    	};

    };

    case West: {

    	switch (_selection) do {
    	    case 0: {
    	    	["kavalacam"] call flp_orbit;
    	    };

    	    case 1: {
    	    	["pygroscam"] call flp_orbit;
    	    };

    	    case 2: {
    	    	["athiracam"] call flp_orbit;
    	    };

    	    case 3: {
    	    	["copaircam"] call flp_orbit;
    	    };

    	    case 4: {
    	    	["bordercam"] call flp_orbit;
    	    };
    	    default {
    	     	/* STATEMENT */
    	    };
    	};

    };

    default {
     	/* STATEMENT */
    };
};