/*
/*

Taw_Jarhead
Breaching script v1
3/25/2014

v2 changelog
-changed color of actions
-added ability to lock doors so you will be forced to breach
-allowed for user to designate a key to place a charge
-cleaned up files

*credits*

	i was able to put all this together from combineing bits of code from these sources
	without there help it wouldent have been possible

	code for the charges
	http://killzonekid.com/arma-scripting-tutorials-scripted-charges/

	code for stunning the enemy
	http://www.armaholic.com/page.php?id=21139

	code for getting and opening the door
	http://www.armaholic.com/page.php?id=21818

*/

action123 =  0; // varible to hold so duplicate actions is not set to player

diag_log [__FILE__, "CALLED"];

if (!isDedicated) then {


	[] spawn {
		private [
			"_distance",
			"_isAdjust",
			"_isNext",
			"_isPrev",
			"cursorTarget1",
			"_cameraPosition",
			"_cameraVector",
			"_cameraPositionTrue",
			"_finalPosition",
			"_finalPositionTrue",
			"_intersects",
			"selectionName",
			"_doorPhase"
		];


		_distance = 3; // Length of the intersect vector in meters

		// if unit has the action excute the following code
		if (action123 < 1) then
			{

				// [] execvm "flop\Scripts\breaching\breach2.sqf"; -- C4 Script, do not want. -- Floppy
				//[] execvm "flop\Scripts\breaching\breach3.sqf";
				[] execvm "flop\Scripts\breaching\breach3.sqf";
				//[] execvm "flop\Scripts\breaching\breach2.sqf"; // excute breach2 script which creates charge
				action123 = 2; // stops duplication of addactions on player


				cursorTarget1 = cursorTarget;

				// No point in doing anything if the player isn't pointing at anything
				if(!isNull cursorTarget1) then {


				_cameraVector = [positionCameraToWorld [0,0,0], positionCameraToWorld [0,0,1]] call BIS_fnc_vectorFromXtoY; // Get the current camera vector
				_cameraPosition = eyePos player; // Starting point for the intersect line
				_cameraPositionTrue = if(surfaceIsWater _cameraPosition) then {_cameraPosition} else {ASLtoATL _cameraPosition}; // Normalize the starting position
				_finalPosition = [_cameraPosition, [_cameraVector call BIS_fnc_unitVector, _distance] call BIS_fnc_vectorMultiply] call BIS_fnc_vectorAdd; // Calculate the end position for the intersect line based on the camera vector
				_finalPositionTrue = if(surfaceIsWater _finalPosition) then {_finalPosition} else {ASLtoATL _finalPosition}; // Normalize the final position of the intersect line
				_intersects = [cursorTarget1, "GEOM"] intersect [_cameraPositionTrue, _finalPositionTrue]; // Get the stuff the line intersects

				// If we've got something in our way, let's try to open it
				if(count _intersects > 0) then {

				// Currently most interesting doors and hatches are named door_#_rot or hatch_#_rot, those that aren't can rot in hell
				selectionName = format ["%1_rot", (_intersects select 0) select 0];


				// other string used for when breaching multiply doors
				selectionName2 = "door_2_rot";
				selectionName3 = "door_5_rot";
				selectionName4 = "door_6_rot";
				selectionName5 = "door_1_rot";

					};
				};
			};

		//};

	};

};
