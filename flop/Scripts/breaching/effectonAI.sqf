_unit = _this select 0;
_unit disableAI "AUTOTARGET";
_unit switchmove "acts_CrouchingCoveringRifle01";
_alive = true;
_t=0;
while {_alive} do {
sleep 0.1;
_t = _t +0.1;

if (_t>7 or !(alive _unit)) then {_alive = false;};
};
_unit switchmove "";
_unit enableAI "AUTOTARGET";
