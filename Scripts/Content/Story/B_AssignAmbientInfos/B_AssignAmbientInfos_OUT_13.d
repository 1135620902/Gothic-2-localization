// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_OUT_13_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_OUT_13_EXIT_Condition;
	information		= DIA_OUT_13_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_OUT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									STANDARD
// *************************************************************************
instance DIA_OUT_13_STANDARD(C_INFO)
{
	nr				= 2;
	condition		= DIA_OUT_13_STANDARD_Condition;
	information		= DIA_OUT_13_STANDARD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_OUT_13_STANDARD_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_OUT_13_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);

	if (randy == 0)
	{
		AI_Output(self, other, "DIA_OUT_1_STANDARD_13_00"); //Bisher konnten wir uns die Orks immer vom Hals halten. Aber in letzter Zeit werden es immer mehr.
	};

	if (randy == 1)
	{
		AI_Output(self, other, "DIA_OUT_1_STANDARD_13_01"); //Die Miliz kommt uns auch nicht zu Hilfe. Sie kommt nur aus der Stadt, um uns unsere Ernte und unser Vieh wegzunehmen.
	};

	if (randy == 2)
	{
		AI_Output(self, other, "DIA_OUT_1_STANDARD_13_02"); //Onar ist verrückt, sich mit der Stadt anzulegen, gerade jetzt, wo die Paladine da sind.
	};

	AI_StopProcessInfos(self);
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_OUT_13(var C_Npc slf)
{
	DIA_OUT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_OUT_13_STANDARD.npc = Hlp_GetInstanceID(slf);
};
