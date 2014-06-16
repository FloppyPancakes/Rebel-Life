_camPos = ATLtoASL (positionCameraToWorld [0,0,0]);
_camPosOff = ATLtoASL (positionCameraToWorld [0,0,1]);

_vX = (_camPosOff select 0) - (_camPos select 0);
_vY = (_camPosOff select 1) - (_camPos select 1);
_vZ = (_camPosOff select 2) - (_camPos select 2);

[_vX,_vY,_vZ]