instance Pal_222_Schiffswache(Npc_Default)
{
	// -------- NPC --------
	name							= NAME_Schiffswache;
	npctype							= NpcType_Main;
	guild							= GIL_PAL;
	flags							= NPC_FLAG_IMMORTAL;

	voice							= 12;
	id								= 222;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 5);

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart09, BodyTex_N, ITAR_PAL_M);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMDS(self, "Humans_Militia.mds");

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_MASTER;

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 80);

	// -------- inventory --------
	B_CreateAmbientInv(self);

	// -------- equipped weapons --------
	EquipItem(self, ItMw_1H_Pal_Sword);

	// -------- daily routine --------
	daily_routine = Rtn_Start_222;
};

func void Rtn_Start_222()
{
	TA_Stand_Guarding(08, 00, 23, 00, "SHIP_DECK_26");
	TA_Stand_Guarding(23, 00, 08, 00, "SHIP_DECK_26");
};

func void Rtn_ShipFree_222()
{
	TA_Stand_WP(08, 00, 23, 00, "NW_CITY_UPTOWNPARADE_03");
	TA_Stand_WP(23, 00, 08, 00, "NW_CITY_UPTOWNPARADE_03");
};
