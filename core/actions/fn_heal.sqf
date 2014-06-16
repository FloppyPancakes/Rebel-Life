/*
	Will be revised later
*/
if((damage player) < 0.25) exitWith {};
if(!("FirstAidKit" in (items player))) exitWith {};
player removeItem "FirstAidKit";
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;
player setDamage 0.10; //Heal to 75
//Set to heal up to 90% - Floppy