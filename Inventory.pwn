// 版权归属 Timothy_Joe(单恋 CN)
// Copyright attribution Timothy_Joe

// Not stored and read 没有读取和储存
// I think. I wrote the enumeration. Is it easy to read and store?

#include <a_samp>

#define MAX_SLOTS 15 // limit slot (Depends on how many TextDraws there are)

new PlayerText:INV_BACK[MAX_PLAYERS];
new PlayerText:INV_CHAR[MAX_PLAYERS];
new PlayerText:INV[15][MAX_PLAYERS];
new PlayerText:INV_BACK1[MAX_PLAYERS];
new PlayerText:INV_CARFT[MAX_PLAYERS];
new PlayerText:INV_SHOP[MAX_PLAYERS];
new PlayerText:INV_RAK[MAX_PLAYERS];
new PlayerText:INV_FACT[MAX_PLAYERS];
new PlayerText:INV_STATS[MAX_PLAYERS];
new PlayerText:INV_CLOSE[MAX_PLAYERS];
new PlayerText:INV_BACK2[MAX_PLAYERS];

new SelectSlot[MAX_PLAYERS]; // Player Select Slot

enum InvData
{
	InvID, // Item ID (物品ID)
	InvQ // Item Amount (物品数量)
};

new InvInfo[MAX_PLAYERS][MAX_SLOTS][InvData];

enum ItemData
{
	ItemID, // Item ID
	ItemName[64], // Name
	ItemDes[128], // Description
	ItemObj // Item Object ID
};

new ItemInfo[][ItemData] =
{
	{0, "None", "None", 1239},
	{1, "Pill", "+ 100HP\n One time", 1241},
	{2, "Body Armor", "+ 100AR\n One time", 1242}
};

main()
{
	print("\n----------------------------------");
	print(" Inventory by Timothy_Joe(单恋 Chinese)");
	print(" QQ: 2373252811");
	print(" WeChat: DillonJack");
	print("----------------------------------\n");
}

stock GiveItem(playerid, itemid, amount = 1)
{
	for(new i = 0; i < MAX_SLOTS; i ++)
	{
	    if(InvInfo[playerid][i][InvID] == 0)
	    {
		    InvInfo[playerid][i][InvID] = itemid;
		    InvInfo[playerid][i][InvQ] = amount;
		    return 1; //execution succeed
	    }
	}
	return 0; //execution failed
}

stock CreateInventoryTD(playerid)
{
    INV_BACK[playerid] = CreatePlayerTextDraw(playerid, 524.000000, 64.000000, "_");
	PlayerTextDrawFont(playerid, INV_BACK[playerid], 1);
	PlayerTextDrawLetterSize(playerid, INV_BACK[playerid], 0.600000, 31.850002);
	PlayerTextDrawTextSize(playerid, INV_BACK[playerid], 298.500000, 236.000000);
	PlayerTextDrawSetOutline(playerid, INV_BACK[playerid], 1);
	PlayerTextDrawSetShadow(playerid, INV_BACK[playerid], 0);
	PlayerTextDrawAlignment(playerid, INV_BACK[playerid], 2);
	PlayerTextDrawColor(playerid, INV_BACK[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV_BACK[playerid], 255);
	PlayerTextDrawBoxColor(playerid, INV_BACK[playerid], -741092353);
	PlayerTextDrawUseBox(playerid, INV_BACK[playerid], 1);
	PlayerTextDrawSetProportional(playerid, INV_BACK[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV_BACK[playerid], 0);

	INV_CHAR[playerid] = CreatePlayerTextDraw(playerid, 234.000000, 98.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV_CHAR[playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV_CHAR[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV_CHAR[playerid], 168.500000, 255.500000);
	PlayerTextDrawSetOutline(playerid, INV_CHAR[playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV_CHAR[playerid], 0);
	PlayerTextDrawAlignment(playerid, INV_CHAR[playerid], 1);
	PlayerTextDrawColor(playerid, INV_CHAR[playerid], -741092353);
	PlayerTextDrawBackgroundColor(playerid, INV_CHAR[playerid], -741092353);
	PlayerTextDrawBoxColor(playerid, INV_CHAR[playerid], -741092403);
	PlayerTextDrawUseBox(playerid, INV_CHAR[playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV_CHAR[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV_CHAR[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, INV_CHAR[playerid], 216);
	PlayerTextDrawSetPreviewRot(playerid, INV_CHAR[playerid], -10.000000, 0.000000, 6.000000, 1.009999);
	PlayerTextDrawSetPreviewVehCol(playerid, INV_CHAR[playerid], 1, 1);

	INV[0][playerid] = CreatePlayerTextDraw(playerid, 414.000000, 68.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[0][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[0][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[0][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[0][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[0][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[0][playerid], 1);
	PlayerTextDrawColor(playerid, INV[0][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[0][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[0][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[0][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[0][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[0][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[0][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[0][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[0][playerid], 1, 1);

	INV[2][playerid] = CreatePlayerTextDraw(playerid, 505.000000, 68.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[2][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[2][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[2][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[2][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[2][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[2][playerid], 1);
	PlayerTextDrawColor(playerid, INV[2][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[2][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[2][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[2][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[2][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[2][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[2][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[2][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[2][playerid], 1, 1);

	INV[1][playerid] = CreatePlayerTextDraw(playerid, 460.000000, 68.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[1][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[1][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[1][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[1][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[1][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[1][playerid], 1);
	PlayerTextDrawColor(playerid, INV[1][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[1][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[1][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[1][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[1][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[1][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[1][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[1][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[1][playerid], 1, 1);

	INV[3][playerid] = CreatePlayerTextDraw(playerid, 550.000000, 68.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[3][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[3][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[3][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[3][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[3][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[3][playerid], 1);
	PlayerTextDrawColor(playerid, INV[3][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[3][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[3][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[3][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[3][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[3][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[3][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[3][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[3][playerid], 1, 1);

	INV[4][playerid] = CreatePlayerTextDraw(playerid, 595.000000, 68.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[4][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[4][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[4][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[4][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[4][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[4][playerid], 1);
	PlayerTextDrawColor(playerid, INV[4][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[4][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[4][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[4][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[4][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[4][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[4][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[4][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[4][playerid], 1, 1);

	INV[5][playerid] = CreatePlayerTextDraw(playerid, 414.000000, 113.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[5][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[5][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[5][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[5][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[5][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[5][playerid], 1);
	PlayerTextDrawColor(playerid, INV[5][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[5][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[5][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[5][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[5][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[5][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[5][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[5][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[5][playerid], 1, 1);

	INV[6][playerid] = CreatePlayerTextDraw(playerid, 460.000000, 113.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[6][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[6][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[6][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[6][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[6][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[6][playerid], 1);
	PlayerTextDrawColor(playerid, INV[6][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[6][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[6][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[6][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[6][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[6][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[6][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[6][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[6][playerid], 1, 1);

	INV[7][playerid] = CreatePlayerTextDraw(playerid, 505.000000, 113.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[7][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[7][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[7][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[7][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[7][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[7][playerid], 1);
	PlayerTextDrawColor(playerid, INV[7][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[7][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[7][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[7][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[7][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[7][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[7][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[7][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[7][playerid], 1, 1);

	INV[8][playerid] = CreatePlayerTextDraw(playerid, 550.000000, 113.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[8][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[8][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[8][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[8][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[8][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[8][playerid], 1);
	PlayerTextDrawColor(playerid, INV[8][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[8][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[8][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[8][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[8][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[8][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[8][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[8][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[8][playerid], 1, 1);

	INV[9][playerid] = CreatePlayerTextDraw(playerid, 595.000000, 113.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[9][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[9][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[9][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[9][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[9][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[9][playerid], 1);
	PlayerTextDrawColor(playerid, INV[9][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[9][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[9][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[9][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[9][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[9][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[9][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[9][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[9][playerid], 1, 1);

	INV[10][playerid] = CreatePlayerTextDraw(playerid, 414.000000, 159.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[10][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[10][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[10][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[10][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[10][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[10][playerid], 1);
	PlayerTextDrawColor(playerid, INV[10][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[10][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[10][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[10][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[10][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[10][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[10][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[10][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[10][playerid], 1, 1);

	INV[11][playerid] = CreatePlayerTextDraw(playerid, 460.000000, 159.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[11][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[11][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[11][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[11][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[11][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[11][playerid], 1);
	PlayerTextDrawColor(playerid, INV[11][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[11][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[11][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[11][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[11][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[11][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[11][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[11][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[11][playerid], 1, 1);

	INV[12][playerid] = CreatePlayerTextDraw(playerid, 505.000000, 159.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[12][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[12][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[12][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[12][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[12][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[12][playerid], 1);
	PlayerTextDrawColor(playerid, INV[12][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[12][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[12][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[12][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[12][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[12][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[12][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[12][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[12][playerid], 1, 1);

	INV[13][playerid] = CreatePlayerTextDraw(playerid, 550.000000, 159.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[13][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[13][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[13][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[13][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[13][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[13][playerid], 1);
	PlayerTextDrawColor(playerid, INV[13][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[13][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[13][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[13][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[13][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[13][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[13][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[13][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[13][playerid], 1, 1);

	INV[14][playerid] = CreatePlayerTextDraw(playerid, 595.000000, 159.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, INV[14][playerid], 5);
	PlayerTextDrawLetterSize(playerid, INV[14][playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV[14][playerid], 42.000000, 39.500000);
	PlayerTextDrawSetOutline(playerid, INV[14][playerid], 0);
	PlayerTextDrawSetShadow(playerid, INV[14][playerid], 0);
	PlayerTextDrawAlignment(playerid, INV[14][playerid], 1);
	PlayerTextDrawColor(playerid, INV[14][playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV[14][playerid], 125);
	PlayerTextDrawBoxColor(playerid, INV[14][playerid], 255);
	PlayerTextDrawUseBox(playerid, INV[14][playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV[14][playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV[14][playerid], 1);
	PlayerTextDrawSetPreviewModel(playerid, INV[14][playerid], 1239);
	PlayerTextDrawSetPreviewRot(playerid, INV[14][playerid], 5.000000, -6.000000, -16.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, INV[14][playerid], 1, 1);

	INV_BACK1[playerid] = CreatePlayerTextDraw(playerid, 318.000000, 64.000000, "_");
	PlayerTextDrawFont(playerid, INV_BACK1[playerid], 1);
	PlayerTextDrawLetterSize(playerid, INV_BACK1[playerid], 0.600000, 3.549999);
	PlayerTextDrawTextSize(playerid, INV_BACK1[playerid], 298.500000, 163.500000);
	PlayerTextDrawSetOutline(playerid, INV_BACK1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, INV_BACK1[playerid], 0);
	PlayerTextDrawAlignment(playerid, INV_BACK1[playerid], 2);
	PlayerTextDrawColor(playerid, INV_BACK1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV_BACK1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, INV_BACK1[playerid], -1962934017);
	PlayerTextDrawUseBox(playerid, INV_BACK1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, INV_BACK1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV_BACK1[playerid], 0);

	INV_CARFT[playerid] = CreatePlayerTextDraw(playerid, 452.000000, 266.000000, "Carft");
	PlayerTextDrawFont(playerid, INV_CARFT[playerid], 2);
	PlayerTextDrawLetterSize(playerid, INV_CARFT[playerid], 0.574998, 1.750000);
	PlayerTextDrawTextSize(playerid, INV_CARFT[playerid], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, INV_CARFT[playerid], 1);
	PlayerTextDrawSetShadow(playerid, INV_CARFT[playerid], 0);
	PlayerTextDrawAlignment(playerid, INV_CARFT[playerid], 2);
	PlayerTextDrawColor(playerid, INV_CARFT[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV_CARFT[playerid], 255);
	PlayerTextDrawBoxColor(playerid, INV_CARFT[playerid], -1962934017);
	PlayerTextDrawUseBox(playerid, INV_CARFT[playerid], 1);
	PlayerTextDrawSetProportional(playerid, INV_CARFT[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV_CARFT[playerid], 1);

	INV_SHOP[playerid] = CreatePlayerTextDraw(playerid, 591.000000, 266.000000, "Shop");
	PlayerTextDrawFont(playerid, INV_SHOP[playerid], 2);
	PlayerTextDrawLetterSize(playerid, INV_SHOP[playerid], 0.574998, 1.750000);
	PlayerTextDrawTextSize(playerid, INV_SHOP[playerid], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, INV_SHOP[playerid], 1);
	PlayerTextDrawSetShadow(playerid, INV_SHOP[playerid], 0);
	PlayerTextDrawAlignment(playerid, INV_SHOP[playerid], 2);
	PlayerTextDrawColor(playerid, INV_SHOP[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV_SHOP[playerid], 255);
	PlayerTextDrawBoxColor(playerid, INV_SHOP[playerid], -1962934017);
	PlayerTextDrawUseBox(playerid, INV_SHOP[playerid], 1);
	PlayerTextDrawSetProportional(playerid, INV_SHOP[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV_SHOP[playerid], 1);

	INV_RAK[playerid] = CreatePlayerTextDraw(playerid, 234.000000, 64.000000, "Server ★ Name");
	PlayerTextDrawFont(playerid, INV_RAK[playerid], 2);
	PlayerTextDrawLetterSize(playerid, INV_RAK[playerid], 0.504166, 3.299998);
	PlayerTextDrawTextSize(playerid, INV_RAK[playerid], 615.500000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INV_RAK[playerid], 1);
	PlayerTextDrawSetShadow(playerid, INV_RAK[playerid], 0);
	PlayerTextDrawAlignment(playerid, INV_RAK[playerid], 1);
	PlayerTextDrawColor(playerid, INV_RAK[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV_RAK[playerid], 255);
	PlayerTextDrawBoxColor(playerid, INV_RAK[playerid], 50);
	PlayerTextDrawUseBox(playerid, INV_RAK[playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV_RAK[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV_RAK[playerid], 0);

	INV_FACT[playerid] = CreatePlayerTextDraw(playerid, 241.000000, 103.000000, "Faction Name - Rank");
	PlayerTextDrawFont(playerid, INV_FACT[playerid], 1);
	PlayerTextDrawLetterSize(playerid, INV_FACT[playerid], 0.316666, 1.899999);
	PlayerTextDrawTextSize(playerid, INV_FACT[playerid], 600.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, INV_FACT[playerid], 1);
	PlayerTextDrawSetShadow(playerid, INV_FACT[playerid], 0);
	PlayerTextDrawAlignment(playerid, INV_FACT[playerid], 1);
	PlayerTextDrawColor(playerid, INV_FACT[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV_FACT[playerid], 255);
	PlayerTextDrawBoxColor(playerid, INV_FACT[playerid], 50);
	PlayerTextDrawUseBox(playerid, INV_FACT[playerid], 0);
	PlayerTextDrawSetProportional(playerid, INV_FACT[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV_FACT[playerid], 0);

	INV_STATS[playerid] = CreatePlayerTextDraw(playerid, 521.000000, 213.000000, "Stats");
	PlayerTextDrawFont(playerid, INV_STATS[playerid], 2);
	PlayerTextDrawLetterSize(playerid, INV_STATS[playerid], 0.574998, 1.750000);
	PlayerTextDrawTextSize(playerid, INV_STATS[playerid], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, INV_STATS[playerid], 1);
	PlayerTextDrawSetShadow(playerid, INV_STATS[playerid], 0);
	PlayerTextDrawAlignment(playerid, INV_STATS[playerid], 2);
	PlayerTextDrawColor(playerid, INV_STATS[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV_STATS[playerid], 255);
	PlayerTextDrawBoxColor(playerid, INV_STATS[playerid], -1962934017);
	PlayerTextDrawUseBox(playerid, INV_STATS[playerid], 1);
	PlayerTextDrawSetProportional(playerid, INV_STATS[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV_STATS[playerid], 1);

	INV_CLOSE[playerid] = CreatePlayerTextDraw(playerid, 521.000000, 335.000000, "Close");
	PlayerTextDrawFont(playerid, INV_CLOSE[playerid], 2);
	PlayerTextDrawLetterSize(playerid, INV_CLOSE[playerid], 0.574998, 1.750000);
	PlayerTextDrawTextSize(playerid, INV_CLOSE[playerid], 16.500000, 90.500000);
	PlayerTextDrawSetOutline(playerid, INV_CLOSE[playerid], 1);
	PlayerTextDrawSetShadow(playerid, INV_CLOSE[playerid], 0);
	PlayerTextDrawAlignment(playerid, INV_CLOSE[playerid], 2);
	PlayerTextDrawColor(playerid, INV_CLOSE[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV_CLOSE[playerid], 255);
	PlayerTextDrawBoxColor(playerid, INV_CLOSE[playerid], -1962934017);
	PlayerTextDrawUseBox(playerid, INV_CLOSE[playerid], 1);
	PlayerTextDrawSetProportional(playerid, INV_CLOSE[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV_CLOSE[playerid], 1);

	INV_BACK2[playerid] = CreatePlayerTextDraw(playerid, 440.000000, 40.000000, "Inventory");
	PlayerTextDrawFont(playerid, INV_BACK2[playerid], 1);
	PlayerTextDrawLetterSize(playerid, INV_BACK2[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, INV_BACK2[playerid], 675.500000, 407.000000);
	PlayerTextDrawSetOutline(playerid, INV_BACK2[playerid], 1);
	PlayerTextDrawSetShadow(playerid, INV_BACK2[playerid], 0);
	PlayerTextDrawAlignment(playerid, INV_BACK2[playerid], 2);
	PlayerTextDrawColor(playerid, INV_BACK2[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, INV_BACK2[playerid], 255);
	PlayerTextDrawBoxColor(playerid, INV_BACK2[playerid], -1523963137);
	PlayerTextDrawUseBox(playerid, INV_BACK2[playerid], 1);
	PlayerTextDrawSetProportional(playerid, INV_BACK2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, INV_BACK2[playerid], 0);
	
	return 1;
}

stock ShowInv(playerid)
{
    UpdateInv(playerid);
    PlayerTextDrawShow(playerid, INV_BACK[playerid]);
    PlayerTextDrawShow(playerid, INV_CHAR[playerid]);
    PlayerTextDrawShow(playerid, INV[0][playerid]);
    PlayerTextDrawShow(playerid, INV[2][playerid]);
    PlayerTextDrawShow(playerid, INV[1][playerid]);
	PlayerTextDrawShow(playerid, INV[3][playerid]);
    PlayerTextDrawShow(playerid, INV[4][playerid]);
    PlayerTextDrawShow(playerid, INV[5][playerid]);
	PlayerTextDrawShow(playerid, INV[6][playerid]);
	PlayerTextDrawShow(playerid, INV[7][playerid]);
	PlayerTextDrawShow(playerid, INV[8][playerid]);
	PlayerTextDrawShow(playerid, INV[9][playerid]);
	PlayerTextDrawShow(playerid, INV[10][playerid]);
	PlayerTextDrawShow(playerid, INV[11][playerid]);
	PlayerTextDrawShow(playerid, INV[12][playerid]);
	PlayerTextDrawShow(playerid, INV[13][playerid]);
	PlayerTextDrawShow(playerid, INV[14][playerid]);
	PlayerTextDrawShow(playerid, INV_BACK1[playerid]);
	PlayerTextDrawShow(playerid, INV_CARFT[playerid]);
	PlayerTextDrawShow(playerid, INV_SHOP[playerid]);
	PlayerTextDrawShow(playerid, INV_RAK[playerid]);
	PlayerTextDrawShow(playerid, INV_FACT[playerid]);
	PlayerTextDrawShow(playerid, INV_STATS[playerid]);
	PlayerTextDrawShow(playerid, INV_CLOSE[playerid]);
	PlayerTextDrawShow(playerid, INV_BACK2[playerid]);
	SelectTextDraw(playerid, 0xFF0000FF);
	SendClientMessage(playerid, 0xFF0000FF, "Click 'Close' Close inv menu!");
	return 1;
}

stock UpdateInv(playerid)
{
	for(new i = 0; i < 15; i ++)
	{
	    PlayerTextDrawSetPreviewModel(playerid, INV[i][playerid], InvInfo[playerid][i][InvID]);
	}
	PlayerTextDrawSetPreviewModel(playerid, INV_CHAR[playerid], GetPlayerSkin(playerid));
	return 1;
}

stock HideInv(playerid)
{
    PlayerTextDrawHide(playerid, INV_BACK[playerid]);
    PlayerTextDrawHide(playerid, INV_CHAR[playerid]);
    PlayerTextDrawHide(playerid, INV[0][playerid]);
    PlayerTextDrawHide(playerid, INV[2][playerid]);
    PlayerTextDrawHide(playerid, INV[1][playerid]);
	PlayerTextDrawHide(playerid, INV[3][playerid]);
    PlayerTextDrawHide(playerid, INV[4][playerid]);
    PlayerTextDrawHide(playerid, INV[5][playerid]);
	PlayerTextDrawHide(playerid, INV[6][playerid]);
	PlayerTextDrawHide(playerid, INV[7][playerid]);
	PlayerTextDrawHide(playerid, INV[8][playerid]);
	PlayerTextDrawHide(playerid, INV[9][playerid]);
	PlayerTextDrawHide(playerid, INV[10][playerid]);
	PlayerTextDrawHide(playerid, INV[11][playerid]);
	PlayerTextDrawHide(playerid, INV[12][playerid]);
	PlayerTextDrawHide(playerid, INV[13][playerid]);
	PlayerTextDrawHide(playerid, INV[14][playerid]);
	PlayerTextDrawHide(playerid, INV_BACK1[playerid]);
	PlayerTextDrawHide(playerid, INV_CARFT[playerid]);
	PlayerTextDrawHide(playerid, INV_SHOP[playerid]);
	PlayerTextDrawHide(playerid, INV_RAK[playerid]);
	PlayerTextDrawHide(playerid, INV_FACT[playerid]);
	PlayerTextDrawHide(playerid, INV_STATS[playerid]);
	PlayerTextDrawHide(playerid, INV_CLOSE[playerid]);
	PlayerTextDrawHide(playerid, INV_BACK2[playerid]);
	CancelSelectTextDraw(playerid);
	return 1;
}

stock ResetInv(playerid)
{
	for(new i = 0; i < MAX_SLOTS; i ++)
	{
	    InvInfo[playerid][i][InvID] = 0;
	    InvInfo[playerid][i][InvQ] = 0;
	}
	return 1;
}

forward OnPlayerUseItem(playerid, itemid);
public OnPlayerUseItem(playerid, itemid)
{
	switch(itemid)
	{
		case 1:
		{
			SetPlayerHealth(playerid, 100.0);
			SendClientMessage(playerid, 0xFF0000FF, "+ 100HP Done!!!");
		}
		case 2:
		{
			SetPlayerArmour(playerid, 100.0);
			SendClientMessage(playerid, 0xFF0000FF, "+ 100AR Done!!!");
		}
	}
	return 1;
}

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
    CreateInventoryTD(playerid);
    ResetInv(playerid);
    SendClientMessage(playerid, 0xFF0000FF, " Press 'Y' or Type [/inv] Open inventory ");
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    PlayerTextDrawDestroy(playerid, INV_BACK[playerid]);
	PlayerTextDrawDestroy(playerid, INV_CHAR[playerid]);
	PlayerTextDrawDestroy(playerid, INV[0][playerid]);
	PlayerTextDrawDestroy(playerid, INV[2][playerid]);
	PlayerTextDrawDestroy(playerid, INV[1][playerid]);
	PlayerTextDrawDestroy(playerid, INV[3][playerid]);
	PlayerTextDrawDestroy(playerid, INV[4][playerid]);
	PlayerTextDrawDestroy(playerid, INV[5][playerid]);
	PlayerTextDrawDestroy(playerid, INV[6][playerid]);
	PlayerTextDrawDestroy(playerid, INV[7][playerid]);
	PlayerTextDrawDestroy(playerid, INV[8][playerid]);
	PlayerTextDrawDestroy(playerid, INV[9][playerid]);
	PlayerTextDrawDestroy(playerid, INV[10][playerid]);
	PlayerTextDrawDestroy(playerid, INV[11][playerid]);
	PlayerTextDrawDestroy(playerid, INV[12][playerid]);
	PlayerTextDrawDestroy(playerid, INV[13][playerid]);
	PlayerTextDrawDestroy(playerid, INV[14][playerid]);
	PlayerTextDrawDestroy(playerid, INV_BACK1[playerid]);
	PlayerTextDrawDestroy(playerid, INV_CARFT[playerid]);
	PlayerTextDrawDestroy(playerid, INV_SHOP[playerid]);
	PlayerTextDrawDestroy(playerid, INV_RAK[playerid]);
	PlayerTextDrawDestroy(playerid, INV_FACT[playerid]);
	PlayerTextDrawDestroy(playerid, INV_STATS[playerid]);
	PlayerTextDrawDestroy(playerid, INV_CLOSE[playerid]);
	PlayerTextDrawDestroy(playerid, INV_BACK2[playerid]);
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/inv", cmdtext, true, 10) == 0)
	{
		ShowInv(playerid);
		return 1;
	}
	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
		ShowInv(playerid);
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
    UpdateInv(playerid);
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(listitem)
	{
		case 1:
		{
			OnPlayerUseItem(playerid, InvInfo[playerid][SelectSlot[playerid]][InvID]);
			new msg[128];
			format(msg, sizeof(msg), "Successful use of %s", ItemInfo[InvInfo[playerid][SelectSlot[playerid]][InvID]][ItemName]);
			SendClientMessage(playerid, 0xFF0000FF, msg);
		}
	}
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	for(new i = 0; i < MAX_SLOTS; i ++)
	{
	    if(playertextid == INV[i][playerid])
	    {
	        if(InvInfo[playerid][i][InvID] != 0)
	        {
	            SelectSlot[playerid] = i;
	            ShowPlayerDialog(playerid, 1, DIALOG_STYLE_MSGBOX, ItemInfo[InvInfo[playerid][i][InvID]][ItemName], ItemInfo[InvInfo[playerid][i][InvID]][ItemDes], "Use", "Drop(In Dev)");
	            return 1;
	        }
	    }
	}
	if(playertextid == INV_CLOSE[playerid])
	{
	    HideInv(playerid);
	    return 1;
	}
	if(playertextid == INV_CARFT[playerid])
	{
	    SendClientMessage(playerid, 0xFF0000FF, "In Dev!");
	    return 1;
	}
	if(playertextid == INV_SHOP[playerid])
	{
	    SendClientMessage(playerid, 0xFF0000FF, "In Dev!");
	    return 1;
	}
	if(playertextid == INV_STATS[playerid])
	{
	    SendClientMessage(playerid, 0xFF0000FF, "In Dev!");
	    return 1;
	}
    return 0;
}
