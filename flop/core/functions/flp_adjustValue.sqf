	_qty = call compile (_this select 0);
	_price = call compile (_this select 1);

	    if (_qty < marketLow) then {
	    	_desc = marketLow - _qty;
			_frac = _desc / 100;
			_mult = _frac * marketMultiplier;
			_price = floor (_price * _mult);
	    };

	    if (_qty > marketHigh) then {
	    	_desc = _qty - marketHigh;
			_frac = _desc / 100;
			_mult = _frac / marketMultiplier;
			_price = floor (_price * _mult);
	    };
	     _price;
