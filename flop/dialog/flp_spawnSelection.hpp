/* #Soroxe
$[
	1.063,
	["SpawnScreen",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"",[2,"*spawn selection*",["-5 * GUI_GRID_W + GUI_GRID_X","11 * GUI_GRID_H + GUI_GRID_Y","10.5833 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.7],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"",[2,"",["-5.04 * GUI_GRID_W + GUI_GRID_X","12.29 * GUI_GRID_H + GUI_GRID_Y","10.6665 * GUI_GRID_W","11.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1604,"",[2,"*spawnbtn*",["-4.5 * GUI_GRID_W + GUI_GRID_X","22 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0.43,0.93,0.7],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"",[2,"",["-4.5 * GUI_GRID_W + GUI_GRID_X","12.74 * GUI_GRID_H + GUI_GRID_Y","9.5 * GUI_GRID_W","8.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/


class life_spawn_selection {
	idd = 3900;
	name= "flp_spawnSelection";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";

controls[]=
{
	RscText_1000,
	RscText_1001,
	RscButton_1604,
	RscListbox_1500
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Floppy Pancakes, v1.063, #Soroxe)
////////////////////////////////////////////////////////

class RscText_1000: RscText
{
	idc = -1;
	text = "$STR_Spawn_Title";
	x = -5 * GUI_GRID_W + GUI_GRID_X;
	y = 11 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.5833 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
};
class RscText_1001: RscText
{
	idc = 1001;
	x = -5.04 * GUI_GRID_W + GUI_GRID_X;
	y = 12.29 * GUI_GRID_H + GUI_GRID_Y;
	w = 10.6665 * GUI_GRID_W;
	h = 11.5 * GUI_GRID_H;
};
class RscButton_1604: RscButton
{
	idc = 1604;
	text = "*spawnbtn*"; //--- ToDo: Localize;
	x = -4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0.43,0.93,0.7};
	onButtonClick = "[] call life_fnc_spawnConfirm";
};
class RscListbox_1500: RscListbox
{
	idc = 38510;
	x = -4.5 * GUI_GRID_W + GUI_GRID_X;
	y = 12.74 * GUI_GRID_H + GUI_GRID_Y;
	w = 9.5 * GUI_GRID_W;
	h = 8.5 * GUI_GRID_H;
	sizeEx = 0.041;
	type = CT_LISTNBOX;
	coloumns[] = {0,0,0.9};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
			onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


};