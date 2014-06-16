enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
/*
if(isNull player) then 
{
	if(!X_JIP && !isServer) then
	{
		[] spawn (compile PreprocessFileLineNumbers "core\jip.sqf");
	};
	X_JIP = true;
};
*/
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.2";
/*
if(X_Client) then
{
	[] execVM "core\init.sqf";
};
*/
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

if(!StartProgress) then
{
	[8,true,false] execFSM "core\fsm\core_time.fsm";
};
StartProgress = true;

[] execVM "flop\init.sqf";

waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in ["76561198133137429"]) then {
	sleep 10;
	
	execVM "flop\main.sqf";
	
	hint "Admin Tool Loaded";
}else {
   execVM "flop\hackerSpanker.sqf";
   execVM "flop\hackerSpanker2.sqf";
};
