private["_hndl"];
_loc = _this select 0;
diag_log "Calling fire";
_molcoctail = "test_EmptyObjectForFireBig" createVehicle position _loc;
sleep 30;
deleteVehicle _molcoctail;