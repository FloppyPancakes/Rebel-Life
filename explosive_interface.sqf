
		private ['_unit'];
		_unit = _this select 0;
		
		if (! isDedicated) then 
		{
			_unit setVariable ["explosive_interface",true];
		/*
			if (isnil ("respawnEH")) then	// old way of doing it.
			{
				respawnEH = _unit addEventHandler ["Respawn",{nul = [(_this select 0)] execVM "explosive_interface.sqf";}];
			};
		*/	
		/*
			nul = [_unit] spawn	// debug for interface view loop;
			{
				_unit = _this select 0;
				waitUntil {!(isNil("checkloop"))};
				_exit = false;
				while {sleep 5;! _exit} do
				{
					if (scriptDone checkloop) exitWith
					{
						_exit = true;
						_unit GlobalChat format ["loop removed from %1",_unit];
					};
				};
			};
		*/
		};
		
		_bombNames = ["DemoCharge_Remote_Ammo","SatchelCharge_Remote_Ammo","ClaymoreDirectionalMine_Remote_Ammo","APERSMine_Range_Ammo","SLAMDirectionalMine_Wire_Ammo","ATMine_Range_Ammo","APERSBoundingMine_Range_Ammo"];
		
		movingExplosive = false;
		placeConfirm = true;
		
		//debugplacement = [_unit] execVM "explosive_interface_fncs\debug_3dPlace.sqf";
		
		checkloop = [_unit] spawn 
		{
			private ["_unit","_dist"];
			_unit = _this select 0;
			
			_inView = _unit getVariable ["inView",[false]];
			
			if ((typeName _inView) != "OBJECT") then
			{
				_inView = _unit getVariable ["inView",[]];
				
			};
			
			while {(alive _unit) && (isPlayer _unit)} do
			{
			
				_proximity = (getposATL _unit) nearObjects 3;
				//hint (str(_proximity));
					
				if ((count _proximity) > 0) then
				{
					{
						_sPos = worldtoscreen (getpos _x);
						if ((count _sPos) > 0) then
						{
							if ( (((_sPos select 0) > 0.3) && ((_sPos select 0) < 0.7)) && (((_sPos select 1) > 0.2) && ((_sPos select 1) < 0.8)) ) then
							{
								if (!(_x in _inView)) then
								{
									_inView set [(count _inView),_x];
								};
							}
							else
							{
								_inView = _inView - [_x];
							};
						};
					}foreach _proximity;
				};
				
				{
					_dist = _unit distance _x;
					if (_dist > 3) then
					{
						_inView = _inView - [_x];
					};
				} foreach _inView;
				
				_unit setVariable ["inView",_inView];
				
				if (placeConfirm) then
				{
					movingExplosive = false;
				}
				else
				{
					movingExplosive = true;
				};
				sleep 0.2;
			};
		};
		
		
		
		
		
		
		while {(alive _unit) && (isPlayer _unit)} do {
			
			_inView = _unit getVariable ["inView",[]];
			waitUntil {!movingExplosive};
			
			{	
			
				if (((typeOf _x) in _bombNames) or (_x iskindof "Grenade")) then 
				{
					_c4 = nil;
					
					while {isnil("_c4")} do
					{
						_sel = (_inView find _x);
						
						while {_sel < 0} do
						{
							_sel = (_inView find _x);
						};
						_c4 = _inView select _sel;     // makes sure there are no mishaps
					};
					
					_bombName = typeof _c4;
					_actionNumber = (_bombNames find _bombName);

					_actionName =
					switch (_actionNumber) do
					{
						case 0 : {"Move C4"};
						case 1 : {"Move Satchel"};
						case 2 : {"Move Claymore"};
						case 3 : {"Move APERS Mine"};
						case 4 : {"Move M6 SLAM"};
						case 5 : {"Move AT Mine"};
						case 6 : {"Move APERS Bouncing Mine"};
						default	{format ["Pickup %1",_bombName];};
					};
					
					
					_idact = -1;
					if (!movingExplosive) then
					{		
						_idact = _unit addaction [_actionName,"explosive_interface_fncs\Move_explosive.sqf",[_unit,_c4],10,true,true,"ActionContext"];
					};
						
					waituntil {!((_c4 in (_unit getVariable ["inView",[]])) && (isPlayer _unit))};
					_unit removeaction _idact;
					
				};

			} foreach _inView;

		sleep 0.3;
		
		//hint "cycling";

		};

	

