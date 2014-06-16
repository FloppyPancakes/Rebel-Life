player sideChat "debugging";
_unit = _this select 0;
waituntil {!(isNil("movingExplosive"))};
waituntil {!(isNil("placeConfirm"))};
while {alive _unit} do
{

	hint format ["moving == %1 \n placed == %2 \n action key held == %3 \n down action == %4 \n down action == %5",movingExplosive,placeConfirm,holdingKey,actionKeyDown,actionKeyUp];
	sleep 1;
};