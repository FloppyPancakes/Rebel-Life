/*
Taw_Jarhead
Breaching script v1
3/25/2014

    pseudo code

    0. create object and hide it then check the distance from the object and if player strays from building activate cleanup
    1. create charge
    2. position charge on the door
    3. excute script to stun AI
    4. open the door
    5. remove action from player
    6. delete object created

*/


_objectTT = "Land_MetalBarrel_F" createvehiclelocal position player;

hideObject _objectTT;

_varible = 0; // varible to stop duplication of actions

// if player strays from building then clean up
while {(player distance _objectTT) < 25} do
{




    // prevents duplicate adding of action
    if (_varible < 1) then
    {

        // create the charge check the direction of player then set charge close to door
        c4 = [];
        action1 = player addAction ["<t color='#00FFFF'>C4 Charge</t>", {
        player playActionNow "PutDown";
        _c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position player; //DemoCharge_Remote_Ammo_Scripted
        player removeaction action1;
        player removeaction action11; // remove the action from player
        _direction = getdir player;
        switch (true) do
        {
        case ((_direction > 0) and (_direction < 90)) : { _c4 setpos [(getpos _c4 select 0)+.3, ((getpos _c4 select 1)+1.2),1]; _c4 setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];};
        case ((_direction > 90) and (_direction < 180)) : { _c4 setpos [(getpos _c4 select 0), ((getpos _c4 select 1)-1.3),1]; _c4 setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];};
        case ((_direction > 180) and (_direction < 270)) : { _c4 setpos [(getpos _c4 select 0)-.5, (getpos _c4 select 1)-.8,1]; _c4 setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];};
        default { _c4 setpos [(getpos _c4 select 0), ((getpos _c4 select 1)+1),1]; _c4 setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];};
        };

        _n = count c4;
        c4 set [_n, _c4];
        action2 = player addAction [format ["<t color='#ff2222'>Detonate Charge #%1</t>", _n + 1], {
            player removeAction (_this select 2);
            (c4 select (_this select 3)) setDamage 1;
                if ((damage (c4 select (_this select 3))) > .3) then
    {

        //
        switch (true) do
        {
            case (selectionName == "door_1_rot") : {
            ["flop\Scripts\breaching\stun.sqf","BIS_fnc_execVM",true,false] call BIS_fnc_MP;
            action123 = 0; // put variable back so file can continue *stops duplication of addactions
            player removeaction action1; // remove the action from player
            cursorTarget1 animate [selectionName, 1];
            cursorTarget1 animate [selectionName2, 1];
            deletevehicle _objectTT;
            };
            case (selectionName == "door_5_rot") : {
            ["flop\Scripts\breaching\stun.sqf","BIS_fnc_execVM",true,false] call BIS_fnc_MP;
            action123 = 0; // put variable back so file can continue *stops duplication of addactions
            player removeaction action1; // remove the action from player
            cursorTarget1 animate [selectionName, 1];
            cursorTarget1 animate [selectionName4, 1];
            deletevehicle _objectTT;
            };
            case (selectionName == "door_2_rot") : {
            ["flop\Scripts\breaching\stun.sqf","BIS_fnc_execVM",true,false] call BIS_fnc_MP;
            action123 = 0; // put variable back so file can continue *stops duplication of addactions
            player removeaction action1; // remove the action from player
            cursorTarget1 animate [selectionName, 1];
            cursorTarget1 animate [selectionName5, 1];
            deletevehicle _objectTT;
            };
            case (selectionName == "door_6_rot") : {
            ["flop\Scripts\breaching\stun.sqf","BIS_fnc_execVM",true,false] call BIS_fnc_MP;
            action123 = 0; // put variable back so file can continue *stops duplication of addactions
            player removeaction action1; // remove the action from player
            cursorTarget1 animate [selectionName, 1];
            cursorTarget1 animate [selectionName3, 1];
            deletevehicle _objectTT;
            };
            default {
            ["flop\Scripts\breaching\stun.sqf","BIS_fnc_execVM",true,false] call BIS_fnc_MP;
            action123 = 0; // put variable back so file can continue *stops duplication of addactions
            player removeaction action1; // remove the action from player
            cursorTarget1 animate [selectionName, 1];
            deletevehicle _objectTT;
            };
        };


    };
            }, _n];
        }];



        _varible = 2;




    };




}; // close while

    action123 = 0; // put variable back so file can continue *stops duplication of addactions
    player removeaction action1;
    player removeaction action11; // remove the action from player
    deletevehicle _objectTT;

