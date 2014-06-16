private["_hndl"];
_loc = _this select 0;
diag_log getPos _hndl;
diag_log "Calling fire";
"test_EmptyObjectForFireBig" createVehicle position _loc;
//sleep 30;
//deleteVehicle _molcoctail;