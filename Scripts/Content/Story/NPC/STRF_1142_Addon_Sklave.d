instance STRF_1142_Addon_Sklave(Npc_Default)
{
	// -------- NPC --------
	name							= NAME_Addon_Sklave;
	npctype							= NPCTYPE_BL_AMBIENT;
	guild							= GIL_STRF;
	flags							= 0;

	voice							= 3;
	id								= 1142;

	// -------- attributes --------
	B_SetAttributesToChapter(self, 1);

	// -------- visuals --------
	B_SetNpcVisual(self, MALE, "Hum_Head_Bald", Face_N_OldBald_Jeremiah, BodyTex_N, ITAR_Prisoner);
	Mdl_SetModelFatness(self, -1);
	Mdl_ApplyOverlayMDS(self, "Humans_Tired.mds");

	// -------- aivars --------
	aivar[AIV_NoFightParker]		= TRUE;
	aivar[AIV_IgnoresArmor]			= TRUE;

	// -------- fight tactic --------
	fight_tactic = FAI_HUMAN_COWARD;

	// -------- talents --------
	B_GiveNpcTalents(self);

	// -------- fighting skills --------
	B_SetFightSkills(self, 10);

	// -------- inventory --------
	// B_CreateAmbientInv (self);

	// -------- daily routine --------
	daily_routine = Rtn_Start_1142;
};

func void Rtn_Start_1142()
{
	TA_Stand_WP(08, 00, 23, 00, "BL_UP_PLACE_04_SIDE_02");
	TA_Stand_WP(23, 00, 08, 00, "BL_UP_PLACE_04_SIDE_02");
};
