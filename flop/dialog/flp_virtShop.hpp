/* #Misady
$[
	1.063,
	["flp_virtShops",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1800,"",[2,"",["4.58 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","28.9168 * GUI_GRID_W","1.20804 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.7],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"",[2,"*title*",["4.62 * GUI_GRID_W + GUI_GRID_X","5.1 * GUI_GRID_H + GUI_GRID_Y","9 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"",".8"],[]],
	[1801,"",[2,"",["4.5 * GUI_GRID_W + GUI_GRID_X","6.5 * GUI_GRID_H + GUI_GRID_Y","29 * GUI_GRID_W","15 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"",[2,"*buy*",["5 * GUI_GRID_W + GUI_GRID_X","7 * GUI_GRID_H + GUI_GRID_Y","9 * GUI_GRID_W","12.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.5],[-1,-1,-1,-1],"",".75"],[]],
	[1501,"",[2,"*sell*",["24 * GUI_GRID_W + GUI_GRID_X","7 * GUI_GRID_H + GUI_GRID_Y","9 * GUI_GRID_W","12.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.5],[-1,-1,-1,-1],"",".75"],[]],
	[1100,"",[2,"*descbox*",["14.5 * GUI_GRID_W + GUI_GRID_X","7 * GUI_GRID_H + GUI_GRID_Y","9 * GUI_GRID_W","8 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.2],[-1,-1,-1,-1],"",".8"],[]],
	[1400,"",[2,"*bqty*",["5 * GUI_GRID_W + GUI_GRID_X","20 * GUI_GRID_H + GUI_GRID_Y","9 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.5],[-1,-1,-1,-1],"",".75"],[]],
	[1401,"",[2,"*sqty*",["24 * GUI_GRID_W + GUI_GRID_X","20 * GUI_GRID_H + GUI_GRID_Y","9 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.5],[-1,-1,-1,-1],"",".75"],[]],
	[1600,"",[2,"*robbtn*",["14.5 * GUI_GRID_W + GUI_GRID_X","18.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.7],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"",[2,"*closebtn*",["19.5 * GUI_GRID_W + GUI_GRID_X","18.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.7],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"",[2,"*buybtn*",["14.5 * GUI_GRID_W + GUI_GRID_X","15.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.7],[-1,-1,-1,-1],"","-1"],[]],
	[1603,"",[2,"*sellbtn*",["19.5 * GUI_GRID_W + GUI_GRID_X","15.5 * GUI_GRID_H + GUI_GRID_Y","4 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.7],[-1,-1,-1,-1],"","-1"],[]]
]
*/
class flp_virtShops {
	idd = 3900;
	name= "flp_virtShops";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "uiNamespace setVariable ['flp_virtShops', _this select 0]";
	controls[]=
{
	RscFrame_1800,
	RscText_1000,
	RscFrame_1801,
	RscListbox_1500,
	RscListbox_1501,
	RscStructuredText_1100,
	RscEdit_1400,
	RscEdit_1401,
	RscButton_1600,
	RscButton_1601,
	RscButton_1602,
	RscButton_1603
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Floppy Pancakes, v1.063, #Misady)
////////////////////////////////////////////////////////

class RscFrame_1800: RscText
{
	idc = 1800;
	x = 4.58 * GUI_GRID_W + GUI_GRID_X;
	y = 5 * GUI_GRID_H + GUI_GRID_Y;
	w = 28.9168 * GUI_GRID_W;
	h = 1.20804 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscText_1000: RscText
{
	idc = 1000;
	text = "*title*"; //--- ToDo: Localize;
	x = 4.62 * GUI_GRID_W + GUI_GRID_X;
	y = 5.1 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	sizeEx = .8 * GUI_GRID_H;
};
class RscFrame_1801: RscText
{
	idc = 1801;
	x = 4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 29 * GUI_GRID_W;
	h = 15 * GUI_GRID_H;
	colorBackground[] = {0,0,0,0.7};
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	text = "*buy*"; //--- ToDo: Localize;
	x = 5 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 12.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.5};
	sizeEx = .70 * GUI_GRID_H;
	type = CT_LISTNBOX;
	drawSideArrows = 1;
	idcLeft = -1;
 	idcRight = -1;
	columns[] = {0.01,0.3};
};
class RscListbox_1501: RscListbox
{
	idc = 1501;
	text = "*sell*"; //--- ToDo: Localize;
	x = 24 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 12.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.5};
	sizeEx = .70 * GUI_GRID_H;
	type = CT_LISTNBOX;
	drawSideArrows = 1;
	idcLeft = -1;
 	idcRight = -1;
	columns[] = {0.01,0.3};
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	text = ""; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 7 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 8 * GUI_GRID_H;
	sizeEx = .8 * GUI_GRID_H;
};
class RscEdit_1400: RscEdit
{
	idc = 1400;
	text = "1"; //--- ToDo: Localize;
	x = 5 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.5};
	sizeEx = .75 * GUI_GRID_H;
};
class RscEdit_1401: RscEdit
{
	idc = 1401;
	text = "1"; //--- ToDo: Localize;
	x = 24 * GUI_GRID_W + GUI_GRID_X;
	y = 20 * GUI_GRID_H + GUI_GRID_Y;
	w = 9 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.5};
	sizeEx = .75 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "*robbtn*"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "*closebtn*"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
	onButtonClick = "closeDialog 0;";
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "*buybtn*"; //--- ToDo: Localize;
	x = 14.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "*sellbtn*"; //--- ToDo: Localize;
	x = 19.5 * GUI_GRID_W + GUI_GRID_X;
	y = 15.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 4 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};