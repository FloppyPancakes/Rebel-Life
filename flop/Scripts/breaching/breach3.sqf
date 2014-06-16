_objectTT = "Land_MetalBarrel_F" createvehiclelocal position player;
hideObject _objectTT;
_varible = 0;
while {(player distance _objectTT) < 25} do
{
    if (_varible < 1) then
    {
        c4 = [];
        //action11 = player addAction ["<t color='#3cff00'>M6 Charge</t>", 
		//{
        player playActionNow "PutDown";
        _c4 = createMine ["SLAMDirectionalMine", position player, [], 0];
        //player removeaction action11;
        _direction = getdir player;
        switch (true) do
        {
        case ((_direction > 0) and (_direction < 90)) : { _c4 setpos [(getpos _c4 select 0)+.3, ((getpos _c4 select 1)+1.2),1]; _c4 setVectorDirAndUp [[0.5,-0.5,0],[0.5,0.5,0]];};
        case ((_direction > 90) and (_direction < 180)) : { _c4 setpos [(getpos _c4 select 0), ((getpos _c4 select 1)-1.3),1]; _c4 setVectorDirAndUp [[0.5,-0.5,0],[0.5,0.5,0]];};
        case ((_direction > 180) and (_direction < 270)) : { _c4 setpos [(getpos _c4 select 0)-.5, (getpos _c4 select 1)-.8,1]; _c4 setVectorDirAndUp [[0.5,-0.5,0],[0.5,0.5,0]];};
        default { _c4 setpos [(getpos _c4 select 0), ((getpos _c4 select 1)+1),1]; _c4 setVectorDirAndUp [[0.5,-0.5,0],[0.5,0.5,0]];};
        };

        _n = count c4;
        c4 set [_n, _c4];
        action2 = player addAction [format ["<t color='#ff2222'>Detonate Charge #%1</t>", _n + 1], {
            player removeAction (_this select 2);
            (c4 select (_this select 3)) setDamage 1;
                if ((damage (c4 select (_this select 3))) > .3) then
    {
        switch (true) do
        {
            case (selectionName == "door_1_rot") : {
            action123 = 0;
            cursorTarget1 animate [selectionName, 1];
            cursorTarget1 animate [selectionName2, 1];
            //deletevehicle _objectTT;
            };
            case (selectionName == "door_5_rot") : {
            cursorTarget1 animate [selectionName, 1];
            cursorTarget1 animate [selectionName4, 1];
            //deletevehicle _objectTT;
            };
            case (selectionName == "door_2_rot") : {
            action123 = 0;
            cursorTarget1 animate [selectionName, 1];
            cursorTarget1 animate [selectionName5, 1];
            //deletevehicle _objectTT;
            };
            case (selectionName == "door_6_rot") : {
            action123 = 0;
            cursorTarget1 animate [selectionName, 1];
            cursorTarget1 animate [selectionName3, 1];
            //deletevehicle _objectTT;
            };
            default {
            action123 = 0;
            cursorTarget1 animate [selectionName, 1];
            //deletevehicle _objectTT;
            };
        };
    };
            }, _n];
        //}];
        _varible = 2;
	};
};
    action123 = 0;
    //player removeaction action11;
    deletevehicle _objectTT;