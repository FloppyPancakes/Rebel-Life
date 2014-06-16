_die = 0;

if (localprostitute==0) exitwith {hint format["You don't have any hookers brah!"]};

if (localprostitute>0) then {
	while {
		(player distance getMarkerPos "workplace_1") < 30 
		OR 
		(player distance getMarkerPos "workplace_2") < 30
		OR 
		(player distance getMarkerPos "workplace_3") < 30
		OR 
		(player distance getMarkerPos "workplace_4") < 30
		} 
		do 
			{
			if (localprostitute==0) exitWith {_die = 1};
				hint format["%1 Hookers are shaking their badonkadonk.",localprostitute];
				player removeAction LIFE_Action_Hook;
				sleep 27;
		
				life_cash = (prostitutevalue * localprostitute) + life_cash;
				hint format["%1 Hookers earned you $%2 cash.",localprostitute, (prostitutevalue * localprostitute)];
				sleep 3;
			};
		if (localprostitute==0) exitwith {};
		};
	//[]execVM "flop\actions\hook.sqf";

hint "You must stay in the Workplace for your hookers to make money.";