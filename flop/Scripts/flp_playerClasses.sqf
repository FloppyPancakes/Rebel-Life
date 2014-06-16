/*
	File: flp_playerClasses.sqf
	Author: Josh "Floppy Pancakes" Houston

	Description:
	Handles key input from fn_keyHandler, based on players class.
*/
_key = _this select 0; //Gets key pressed from fn_keyHandler
playerClass = player getVariable "flp_playerClass"; //Gets player class, probably better to define this only at player spawn, respawn, and class change. Do it later.

if (isNil "playerClass") exitWith { hint "You don't currently have a class."; };

time_remaining3 = time - timer3;

switch (playerClass) do
{

		/* TEMPLATE BELOW

	case "Exsplosives Expert":
		{

			switch (_key) do
			{

				case "1":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};
				case "2":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};
				case "3":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};

			}

		}

		TEMPLATE ABOVE
		*/

	case "Explosives Expert":
	// 1. (Passive) Access to explosives attachments
	// 2. Can craft and place hand made explosives, prob IEDs.
	// 3. Spawns an RPG on the player with 1 Rocket.
		{

			switch (_key) do
			{

				case "1":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};
				case "2":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};
				case "3":
					{
					//Gets time remaining since last Use. If none, proceed. Set use time
					//Create ammo then weapon so it is loaded, and switch to the weapon.
					//After 17 seconds, delete the rocket and launcher if still exists. Time is 15 for the player, but switch animation takes 2 seconds.

					time_remaining3 = time - timer3;
					if (time_remaining3 < 3) exitwith { hint format["You have used your Rocket Recently and cannot use it again for another %1 minutes", floor (60 - (time_remaining3 / 60))] };//One Hour Cooldown.

					timer3 = time;

					//need to figure out how to disable the command menu and prevent it from coming up.
					//hint "You pull out a Rocket Launcher. Use it within 15 seconds";
					_rocket = player addMagazine ["RPG32_HE_F", 1];
					_launcher = player AddWeapon "launch_RPG32_F";
					player selectWeapon "launch_RPG32_F";
					sleep 17;
					player removeWeapon "launch_RPG32_F";
					player removeMagazine "RPG32_HE_F";



					//Need to add a final check in here that will search within 100 meters for a RPG or rocket, and delete both, be it on ground, inventory, or in vehicle.. later
					}

			};

		};

	case "Hacker":
	// 1. Can overload electrical items
	// 2. Can hack ATMs to steal from the next 5 ATM withdrawls
	// 3. Can exploit any electrical object to do one or two actions remotely.
		{

			switch (_key) do
			{

				case "1":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};
				case "2":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};
				case "3":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};

			};

		};

	case "Ninja":
	// 1. (Passive) Runs faster, and never fatigues. Can jump much further.
	// 2. Can throw down a instant smoke bomb.
	// 3. Can disappear for 3 Seconds
		{

			switch (_key) do
			{

				case "1":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};
				case "2":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};
				case "3":
					{
					if (time_remaining3 < 3600) exitwith { hint format["Although you have immense training and discipline, your body still needs to rest for another %1 minutes", floor (60 - (time_remaining3 / 60))] };//One Hour Cooldown.

					timer3 = time;
					player hideObject true;
					hint "You disappear. You reappear in 3 seconds.";
					sleep 1;
					hint "You disappear. You reappear in 2 seconds.";
					sleep 1;
					hint "You disappear. You reappear in 1 second.";
					sleep 1;
					player hideObject false;
					hint "";

					};

			};

		};

			case "Professional Driver":
		{

			switch (_key) do
			{
			//1. (Passive) Vehicle Twice as Strong, Wheels 3 times.
			//2. (Passive) Increased Top Speed, Moderately Increased Tops Speeds, Increased Braking.
			//3. Oil Slick. BUHAHAHAHA Maybe flat banana peel image that just spawns where used.

				case "1":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};
				case "2":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};
				case "3":
					{

					hint format["Class: %1 \n Key: %2", playerClass, _key];

					};

			}

		}
};





