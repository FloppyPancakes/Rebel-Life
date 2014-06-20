class life_factories_menu {
	idd = 3900;
	name= "life_factories";
	movingEnable = false;
	enableSimulation = true;
	//onLoad = "//[] spawn life_fnc_adminMenu;";
controls[]=
{
	RscFrame_1800,
	Life_RscTitleBackground,
	Title ,
	RscButton_1600,
	RscButton_1601,
	RscButton_1602,
	RscListbox_1500,
	RscButton_1603,
	RscStructuredText_1100,
	RscButton_1604,
	RscButton_1605,
	RscButton_1606,
	RscButton_1607,
	RscButton_1608
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Floppy Pancakes, v1.063, #Sywafy)
////////////////////////////////////////////////////////

class RscFrame_1800: RscText
{
	idc = 1800;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 34 * GUI_GRID_W;
	h = 15.5 * GUI_GRID_H;
	colorBackground[] = {0,0.0,0.0,0.7};
};
class Life_RscTitleBackground : RscText
{
	idc = 1801;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 34 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.75};
};
class Title : Life_RscTitle
{
	idc = 1000;
	x = 3.34 * GUI_GRID_W + GUI_GRID_X;
	y = 4.24 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	x = 3.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscButton_1601: RscButton
{
	idc = 1601;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscButton_1602: RscButton
{
	idc = 1602;
	x = 13.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	size = 0.5;
	x = 3.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 19.5 * GUI_GRID_W;
	h = 11.5 * GUI_GRID_H;
	sizeEx = .70 * GUI_GRID_H;
	//colorBackground[] = {0,0.43,0.93,0.3};
	type = CT_LISTNBOX;
	drawSideArrows = 1;
	idcLeft = -1;
 	idcRight = -1;
	columns[] = {0.01,0.7};
};
class RscButton_1603: RscButton
{
	idc = 1603;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscStructuredText_1100: RscStructuredText
{
	idc = 1100;
	x = 23.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 8 * GUI_GRID_W;
	h = 14.5 * GUI_GRID_H;
};
class RscButton_1604: RscButton
{
	idc = 1604;
	x = 32 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscButton_1605: RscButton
{
	idc = 1605;
	x = 32 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscButton_1606: RscButton
{
	idc = 1606;
	onButtonClick = "closeDialog 0; flp_selectedInfo = nil;";
	x = 32 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscButton_1607: RscButton
{
	idc = 1607;
	x = 32 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscButton_1608: RscButton
{
	idc = 1608;
	x = 32 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
};