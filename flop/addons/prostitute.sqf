/*
	File: prostitute.sqf
	Author: Josh "Floppy Pancakes" Houston
	
	Description:
	Checks and adds prostitute.
*/

prostitute_cost           = 10000;
prostitute_count = 0;
_prostitutename = player;

if(playerSide == west) exitwith
	{
	hint format["This guy doesn't look so friendly..."];

	null = [] execVM "flop\Scripts\flp_hookerKillCops.sqf"
	
	//50 Cal wouldn't move for some reason... so we are just substituting 2 opfor for now.
	};

if (localprostitute >= maxprostitute) exitwith {hint format["You can't buy any more hookers."]}; // Enforce maximum amount of hookers.
if (life_cash < prostitute_cost) exitwith {hint format["You don't have enough money to buy a hooker."]}; //Exits if not enough cash on hand.
//may add check for group membership. Just don't care right now.

_prostitutename = "B_Soldier_F" createUnit [position player, group player, 
	"removeallweapons this; 
	removeVest this; 
	removeHeadgear this; 
	removeGoggles this; 
	removeUniform this; 
	this unassignitem ""NVGoggles"";
	if (playerside == west) then {
		if (player distance this < 2) then {	
			this addAction[
			""Interrogate"",
			""flop\Scripts\flp_interrogateHooker.sqf""
			];
		};
	};
	"]; //Create the Unit, remove all gear.
life_cash = life_cash - prostitute_cost; //Subtract the cost from on hand cash.
localprostitute = localprostitute + 1;
prostitute_count = localprostitute;
hint format["You bought 1 Prostitute for $10,000, and you now have %1 hookers. Take your prostitute to a workplace to earn money.", localprostitute];

if (prostitute_watch == 1) exitWith {};

prostitute_watch = 1;
while {localprostitute > 0} do {

	_prostitute_current_count = (count units group player) - 1;
	if (_prostitute_current_count < localprostitute) then {
		
		hint "One of your hookers has died! Protect your investments!";
		localprostitute = localprostitute - 1;
	};
	sleep 5;

};