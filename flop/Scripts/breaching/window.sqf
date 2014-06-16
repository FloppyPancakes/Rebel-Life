_pos = _this select 0;
_objects = nearestObjects [player, ["house"], 15];

	for [{_l = 0},{_l < (count _objects)},{_l = _l + 1}] do {

	//(_objects select _l) say3D "glass_1";
	(_objects select _l) setHit ["Glass_1", 1];
	(_objects select _l) setHit ["Glass_2", 1];
	(_objects select _l) setHit ["Glass_3", 1];
	(_objects select _l) setHit ["Glass_4", 1];
	(_objects select _l) setHit ["Glass_5", 1];
	(_objects select _l) setHit ["Glass_6", 1];
	(_objects select _l) setHit ["Glass_7", 1];
	(_objects select _l) setHit ["Glass_8", 1];
	(_objects select _l) setHit ["Glass_10", 1];
	(_objects select _l) setHit ["Glass_11", 1];
	(_objects select _l) setHit ["Glass_12", 1];
	(_objects select _l) setHit ["Glass_13", 1];
	(_objects select _l) setHit ["Glass_14", 1];
};