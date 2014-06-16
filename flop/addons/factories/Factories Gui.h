/* #Sarota
$[
	1.063,
	["Factories",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1800,"",[2,"",["3 * GUI_GRID_W + GUI_GRID_X","5.5 * GUI_GRID_H + GUI_GRID_Y","34 * GUI_GRID_W","15.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1801,"Life_RscTitleBackground:Life_RscText",[2,"",["3 * GUI_GRID_W + GUI_GRID_X","4 * GUI_GRID_H + GUI_GRID_Y","34 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[0,0,0,20.7],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"Title : Life_RscTitle",[2,"Factory Title",["3.34 * GUI_GRID_W + GUI_GRID_X","4.24 * GUI_GRID_H + GUI_GRID_Y","14 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"",[2,"Weapons",["3.5 * GUI_GRID_W + GUI_GRID_X","6 * GUI_GRID_H + GUI_GRID_Y","4.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"",[2,"Mods",["8.5 * GUI_GRID_W + GUI_GRID_X","6 * GUI_GRID_H + GUI_GRID_Y","4.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"",[2,"Ammo",["13.5 * GUI_GRID_W + GUI_GRID_X","6 * GUI_GRID_H + GUI_GRID_Y","4.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"",[2,"",["3.5 * GUI_GRID_W + GUI_GRID_X","9 * GUI_GRID_H + GUI_GRID_Y","19.5 * GUI_GRID_W","11.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1603,"",[2,"Queue",["18.5 * GUI_GRID_W + GUI_GRID_X","6 * GUI_GRID_H + GUI_GRID_Y","4.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"",[2,"",["23.5 * GUI_GRID_W + GUI_GRID_X","6 * GUI_GRID_H + GUI_GRID_Y","8 * GUI_GRID_W","14.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1604,"",[2,"Remove",["32 * GUI_GRID_W + GUI_GRID_X","15 * GUI_GRID_H + GUI_GRID_Y","4.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1605,"",[2,"Add",["32 * GUI_GRID_W + GUI_GRID_X","12 * GUI_GRID_H + GUI_GRID_Y","4.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1606,"",[2,"Close",["32 * GUI_GRID_W + GUI_GRID_X","18 * GUI_GRID_H + GUI_GRID_Y","4.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1607,"",[2,"Export",["32 * GUI_GRID_W + GUI_GRID_X","9 * GUI_GRID_H + GUI_GRID_Y","4.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1608,"",[2,"Create",["32 * GUI_GRID_W + GUI_GRID_X","6 * GUI_GRID_H + GUI_GRID_Y","4.5 * GUI_GRID_W","2.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

*/

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Floppy Pancakes, v1.063, #Canuke)
////////////////////////////////////////////////////////
//--- Factories
#define IDC_FACTORIES_TITLE			4914
#define IDC_FACTORIES_RSCSTRUCTUREDTEXT_1100	5014
#define IDC_FACTORIES_RSCLISTBOX_1500		5414
#define IDC_FACTORIES_RSCBUTTON_1600		5514
#define IDC_FACTORIES_RSCBUTTON_1601		5515
#define IDC_FACTORIES_RSCBUTTON_1602		5516
#define IDC_FACTORIES_RSCBUTTON_1603		5517
#define IDC_FACTORIES_RSCBUTTON_1604		5518
#define IDC_FACTORIES_RSCBUTTON_1605		5519
#define IDC_FACTORIES_RSCBUTTON_1606		5520
#define IDC_FACTORIES_RSCBUTTON_1607		5521
#define IDC_FACTORIES_RSCBUTTON_1608		5522
#define IDC_FACTORIES_RSCFRAME_1800		5714
#define IDC_FACTORIES_LIFE_RSCTITLEBACKGROUND	5715


#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)


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
// GUI EDITOR OUTPUT START (by Floppy Pancakes, v1.063, #Nijiwo)
////////////////////////////////////////////////////////

class RscFrame_1800: RscFrame
{
	idc = 1800;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 5.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 34 * GUI_GRID_W;
	h = 15.5 * GUI_GRID_H;
};
class Life_RscTitleBackground:Life_RscText
{
	idc = 1801;
	x = 3 * GUI_GRID_W + GUI_GRID_X;
	y = 4 * GUI_GRID_H + GUI_GRID_Y;
	w = 33.5 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
	colorBackground[] = {0,0,0,20.7};
};
class Title : Life_RscTitle
{
	idc = 1000;
	text = "Factory Title"; //--- ToDo: Localize;
	x = 3.34 * GUI_GRID_W + GUI_GRID_X;
	y = 4.24 * GUI_GRID_H + GUI_GRID_Y;
	w = 14 * GUI_GRID_W;
	h = 1 * GUI_GRID_H;
};
class RscButton_1600: RscButton
{
	idc = 1600;
	text = "Weapons"; //--- ToDo: Localize;
	x = 3.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscButton_1601: RscButton
{
	idc = 1601;
	text = "Mods"; //--- ToDo: Localize;
	x = 8.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscButton_1602: RscButton
{
	idc = 1602;
	text = "Ammo"; //--- ToDo: Localize;
	x = 13.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscListbox_1500: RscListbox
{
	idc = 1500;
	x = 3.5 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 19.5 * GUI_GRID_W;
	h = 11.5 * GUI_GRID_H;
};
class RscButton_1603: RscButton
{
	idc = 1603;
	text = "Queue"; //--- ToDo: Localize;
	x = 18.5 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
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
	text = "Remove"; //--- ToDo: Localize;
	x = 32 * GUI_GRID_W + GUI_GRID_X;
	y = 15 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscButton_1605: RscButton
{
	idc = 1605;
	text = "Add"; //--- ToDo: Localize;
	x = 32 * GUI_GRID_W + GUI_GRID_X;
	y = 12 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscButton_1606: RscButton
{
	idc = 1606;
	text = "Close"; //--- ToDo: Localize;
	x = 32 * GUI_GRID_W + GUI_GRID_X;
	y = 18 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscButton_1607: RscButton
{
	idc = 1607;
	text = "Export"; //--- ToDo: Localize;
	x = 32 * GUI_GRID_W + GUI_GRID_X;
	y = 9 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
class RscButton_1608: RscButton
{
	idc = 1608;
	text = "Create"; //--- ToDo: Localize;
	x = 32 * GUI_GRID_W + GUI_GRID_X;
	y = 6 * GUI_GRID_H + GUI_GRID_Y;
	w = 4.5 * GUI_GRID_W;
	h = 2.5 * GUI_GRID_H;
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////


