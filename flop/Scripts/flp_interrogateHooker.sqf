hint parseText format["His pimp is <t color='#33FF00'>%1</t>. You free the ""hooker"" and add a count of Human Trafficking to the record of <t color='#33FF00'>%1</t>.",name leader cursorTarget];
[[getPlayerUID leader cursorTarget,name leader cursorTarget,"484"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
deleteVehicle cursorTarget;