_qty = call compile (_this select 0); //Qty of item.
_price = call compile (_this select 1);	//Price that needs to be adjusted.
_action = call compile (_this select 2); // 0 for buying, 1 for selling.

	    if (_qty < marketLow) then {
	    	_desc = marketLow - _qty;
			_frac = _desc / 100;
			_mult = _frac * marketMultiplier;
			_price = floor (_price * _mult);
	    };

	    if (_qty > marketHigh) then {
	  		hint "high called";
	    	_desc = _qty - marketHigh;
			_frac = _desc / 100;
			_mult = _frac / marketMultiplier;
			_price = floor (_price * _mult);
	    };
	     _price;