// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_BDT_1_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_BDT_1_EXIT_Condition;
	information		= DIA_BDT_1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
instance DIA_BDT_1_STANDARD(C_INFO)
{
	nr				= 2;
	condition		= DIA_BDT_1_STANDARD_Condition;
	information		= DIA_BDT_1_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BDT_1_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);

	if (randy == 0)
	{
		AI_Output(self, other, "DIA_BDT_1_STANDARD_01_00"); //Geh mir aus den Augen!
	};

	if (randy == 1)
	{
		AI_Output(self, other, "DIA_BDT_1_STANDARD_01_01"); //Suchst du Ärger?
	};

	if (randy == 2)
	{
		AI_Output(self, other, "DIA_BDT_1_STANDARD_01_02"); //Geh, solange du noch kannst!
	};

	AI_StopProcessInfos(self);
};

//**************************************************************
// ----------------------------------------------------------------

func void B_AssignAmbientInfos_BDT_1(var C_Npc slf)
{
	DIA_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BDT_1_STANDARD.npc = Hlp_GetInstanceID(slf);
};
