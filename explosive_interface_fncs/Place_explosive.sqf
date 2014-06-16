private ["_pos","_unit","_charge","_dir"];
//_array = _this select 3; // for use if used in add action;
_unit = _this select 0;
_charge = _this select 1;
_attachableBombs = ["DemoCharge_Remote_Ammo","SatchelCharge_Remote_Ammo"];

if (isnil ("fnc_finc_floor")) then
{
	fnc_find_floor = compile preProcessFilelineNumbers "explosive_interface_fncs\fnc_find_floor.sqf"
};

if (isnil ("fnc_drop_object")) then
{
	fnc_drop_object = compile preProcessFilelineNumbers "explosive_interface_fncs\fnc_drop_object.sqf"
};

if (!((typeOf _charge) in _attachableBombs)) exitwith 
{
	nul = [_charge,_unit] spawn fnc_drop_object;
};

if (isNil ("zor_Move_Charge")) then
{
	zor_Move_Charge =
	{
		private ["_charge","_posASL","_vectors","_dir"];
		_charge = _this select 0;
		_posASL = _this select 1; if (isNil ("_posASL")) then {_posASL = [0,0,0]};
		_vectors = _this select 2; if (isNil ("_vectors")) then {_vectors = [[0,0,0],[0,0,0]]};
		_dir = _this select 3; if (isNil ("_dir")) then {_dir = getDir _charge};
			
		if (isNull _charge) exitwith {};
		
		if ((_posASL distance [0,0,0]) >= 0.1) then
		{
			_charge setPosASL _posASL;
		};
			
		if (((_vectors select 0) distance [0,0,0]) >= 0.1) then
		{
			_charge setVectorDirandUp _vectors;
		}
		else
		{
			_charge setVectorUP (surfaceNormal _posASL);
			_charge setDir _dir;
		};
	};
};

if ((typename placeSurface) == "OBJECT") then
{
	if ((placeSurface iskindof "LandVehicle") or (placeSurface iskindof "Helicopter") or (placeSurface iskindof "Ship") or (placeSurface iskindof "Plane")) then
	{
		_pos =  placeSurface worldToModel (ASLtoATL placePos); // needs AGL.... use below intersect and position calculate to get offset.
		_dir = direction placeSurface;
		
		_cdV = VectorDir _charge;
		_cuV = Vectorup _charge;
		
		_sdV = VectorDir placeSurface;
		_suV = Vectorup placeSurface;
		
		_ndV = [0.001,0.001,0.001];
		_nuV = [0.001,0.001,0.001];
			
		for "_i" from 0 to 2 do
		{
			_ndV set [_i,((_cdV select _i) + (_sdV select _i))];

			_nuV set [_i,((_cuV select _i) + (_suV select _i))];
		};
		
		_charge attachTo [placeSurface,_pos];
		_charge setVectorDirandUP [_cdV,_cuV]; // this should really be nVectors as an accurate dot product of the sVectors and cVectors
		nul = [[_charge,nil,[_cdV,_cuV],nil],"zor_Move_Charge",true,false] spawn BIS_fnc_MP;
	}
	else
	{
		placeConfirm = true;
		movingExplosive = false;
	};
}
else
{
	nul = [_charge,_unit] spawn fnc_drop_object;
};
	
placeConfirm = true;
movingExplosive = false;

//_unit removeaction (_this select 2); // for use if used in add action;