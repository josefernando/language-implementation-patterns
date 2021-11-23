Attribute VB_Name = "WNGWN005"
' ===================================================
' COMENTARIO SOX
' NOME    : WNGWN005.BAS
' VERSAO : 3
' ===================================================
'+-------------------------------------------------------------------------+
'| PROJETO     : WORKFLOW DO NEGÓCIO                                        |
'| MÓDULO      : WNGWN005                                                   |
'| AUTOR       : ADRIANO MARTINEZ                                           |
'| OBJETIVO    : FUNÇÕES GENÉRICAS DE MONTAGEM DOS PARÂMETROS PARA CHAMADA  |
'|               DO PROJETO WNPLOG01 (HISTÓRICO DO WORKFLOW)                |
'| DATA        : 09/10/2004                                                 |
'|-------------------------------------------------------------------------|
'|                             ALTERAÇÕES                                   |
'|-------------------------------------------------------------------------|
'|    DATA    |  AUTOR   | VRS |                MOTIVO                      |
'|------------+----------+-----+-------------------------------------------|
'| 04/10/2005 | JRLOPES  | 02  | WorkFlow do Frota (NO05/4115)              |
'+-------------------------------------------------------------------------+
'| 22/11/2006 | BMINITT  | 03  | Usar FU_Diretorio_Usuario ao invés de usar |
'|                             | "C:\USER\" fixo                            |
'+-------------------------------------------------------------------------+

Option Explicit

Private Const CG_PARAMETRO = "WORKFLOWNEGOCIO"

'+-------------------------------------------------------------------------+
'| Constante global que contém caminho do arquivo INI utilizado no workflow |
'| para versão de ambiente Windows 95                                       |
'+-------------------------------------------------------------------------+
'Private Const CG_PATH_ARQ_INI_NWF$ = "C:\USER\" '*** BMINITT - VERSÃO 3
 
 
'+-------------------------------------------------------------------------+
'| Variável utilizada para identificação do arquivo INI                     |
'+-------------------------------------------------------------------------+
Private VG_N_ARQ_INI As String

'+------------------------------------------------------------------------+
'| Declarações de API's                                                     |
'+-------------------------------------------------------------------------+
Private Declare Function WritePrivateProfileSection Lib "kernel32" Alias "WritePrivateProfileSectionA" (ByVal lpAppName As String, ByVal lpString As String, ByVal lpFileName As String) As Long
Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

'+-------------------------------------------------------------------------+
'| Constantes de leitura de arquivos                                        |
'+-------------------------------------------------------------------------+
Private Const CG_ATTR_NORMAL = 0
Private Const CG_ATTR_READONLY = 1
Private Const CG_ATTR_HIDDEN = 2
Private Const CG_ATTR_SYSTEM = 4
Private Const CG_ATTR_VOLUME = 8
Private Const CG_ATTR_DIRECTORY = 16
Private Const CG_ATTR_ARCHIVE = 32

Private VG_WNG_C_ERR$
Private VG_WNG_T_ERR$

'+-------------------------------------------------------------------------+
'| Tipo generico que contém as informações necessárias para montagem do     |
'| cabeçalho e utilização de dados em todos os projetos do workflow do neg. |
'+-------------------------------------------------------------------------+
Private Type TYPE_WN_INI

    u_idt_nwf               As String 'Número de identificação do negócio no Workflow
    e_nwf                   As String 'Tipo do negócio
    u_prp                   As String 'Número da proposta
    d_prt_cga               As String 'Data de processamento de carga
    d_hra_grc_lot           As String 'Data de geração do lote
    u_rgt_ssp_trm           As String 'transmissor
    u_lot_prt_ctr           As String 'número do lote
    u_sub_ctr               As String 'número do sub contrato
    c_isg                   As String 'código do item segurado
    c_pro                   As String 'Produto da proposta
    c_cia_ita               As String 'Código da Companhia Seguradora
    c_rmo                   As String 'Código do Ramo
    u_apo_pnc               As String 'Número da apólice principal
    u_apo_dpd               As String 'Número da apólice dependente
    c_msg_err               As String 'Código de mensagem de erro (referente a proposta)
    t_msg_err_emi           As String 'Texto de mensagem de erro de emissão  (referente a proposta)
    n_pes                   As String 'Nome do cliente
    e_pes                   As String 'Tipo da pessoa (Física ou Jurídica)
    e_cvd                   As String 'Tipo do canal de vendas
    u_rgt_ssp               As String 'Código do Corretor
    u_dco_rgt_ssp           As String 'Dac do código do corretor
    c_loc_pgt_cvd           As String 'Local de pagamento do corretor
    c_und_cvd               As String 'Código da unidade do corretor
    n_cvd                   As String 'Nome do Corretor
    c_idt_cor_ssp           As String 'Código de identificação do corretor na SUSEP
    c_ddd                   As String 'DDD de comunicação do corretor
    u_lin_cmn               As String 'Telefone de comunicação do corretor
    u_rml_lin_cmn           As String 'Ramal de comunicação do corretor
    c_ddd_fax               As String 'DDD do fax do corretor
    u_lin_cmn_fax           As String 'Linha do fax do corretor
    u_rml_lin_cmn_fax       As String 'Ramal do fax do corretor
    t_ema                   As String 'e-mail do corretor
    c_clf_cvd               As String 'classificação do corretor
    e_cat_cvd               As String 'categoria do corretor
    n_pes_agg               As String 'Nome do Corretor Agregador
    c_ddd_agg               As String 'DDD de comunicação do corretor agregador
    u_lin_cmn_agg           As String 'Telefone de comunicação do corretor agregador
    u_rml_lin_cmn_agg       As String 'Ramal de comunicação do corretor agregador
    e_cvd_agg               As String 'Tipo do canal de vendas agregador
    u_cvd_agg               As String 'Código do Corretor agregador
    u_dco_cvd_agg           As String 'Dac do código do corretor agregador
    c_loc_pgt_agg           As String 'Local de pagamento do corretor agregador
    c_ddd_fax_agg           As String 'DDD do fax do agregador
    u_lin_cmn_fax_agg       As String 'Linha do fax do agregador
    u_rml_lin_cmn_fax_agg   As String 'Ramal do fax do agregador
    t_ema_agg               As String 'e-mail do agregador
    c_clf_cvd_agg           As String 'classificação do agregador
    e_cat_cvd_agg           As String 'categoria do agregador
    i_agg                   As String 'indicador de agregador
    c_atv_nwf               As String 'Código de atividade no workflow
    n_atv_nwf               As String 'Nome da atividade no workflow
    e_atv_nwf               As String 'Tipo da atividade no workflow
    n_fla_nwf               As String 'Nome da fila no workflow
    n_usr_atc_nwf           As String 'Nome do usuário de atuação
    c_are_atc_nwf           As String 'Código da área de atuação
    c_are_prt               As String 'Código da área de processamento
    c_pfl_usr_nwf           As String 'Código do perfil do usuário
    d_hra_ini_atv           As String 'Data de inicio da atividade
    d_hra_his_icn           As String 'Data do histórico da inconsistência
    c_atv_ctt_nwf           As String 'código da atividade de contato
    c_psl_atd_cvd           As String 'código posicional atendimento canal de vendas
    c_psl_atd_cvd_agg       As String 'código posicional atendimento canal de vendas agregador
    t_idt_pfl_cvd           As String 'identificador perfil canal de vendas
    t_idt_pfl_cvd_agg       As String 'identificador perfil canal de vendas agregador
    t_canal                 As String 'texto de recepção da proposta
    e_rsv_atv_out           As String 'tipo do responavel da atividade
    t_rsv_atv_nwf           As String 'descrição do responsavel
    t_e_cvd                 As String 'descrição do tipo do canal de vendas
    t_e_cvd_agg             As String 'descrição do tipo do canal de vendas do agregador
    n_pgm_exe               As String 'nome do progama executável
    c_tla                   As String 'codigo da tela default do projeto WNPVIU01
    c_frm_vis_jnl           As String 'código do formulário para visualizar a janela
    c_e_agr                 As String 'Código do tipo de agrupamento
    c_agr                   As String 'Código do agrupamento
    
End Type

Private WN_INI As TYPE_WN_INI

Function FU_WNGWN005_Grava_Arquivo_Ini(Arquivo_Ini As String, nome_sessao As String, nome_campo As String, ByVal valor_campo As String) As Integer

'+-------------------------------------------------------------------------+
'| Grava em arquivo .INI os parâmetros que utilizados por outro projeto     |
'| Arquivo_Ini => Nome do arquivo .Ini                                      |
'| Sessão => Sessão que irá ser criado os dados                             |
'| nome_campo => Nome do campo dentro da nome_sessao                        |
'| valor_campo => Valor do campo dentro da nome_sessao                      |
'+-------------------------------------------------------------------------+
    On Error GoTo ERRO_GRAVA_ARQ_INI
    
    FU_WNGWN005_Grava_Arquivo_Ini = False
    
    Dim AUX_RET As Integer

    AUX_RET% = FU_WNGWN005_WNG_Escreve_String_Ini(Arquivo_Ini, nome_sessao$, nome_campo$, valor_campo$)

    If AUX_RET% = 0 Then
        If (GetAttr(Arquivo_Ini) And CG_ATTR_READONLY) Then
            SetAttr Arquivo_Ini, CG_ATTR_NORMAL

            AUX_RET% = FU_WNGWN005_WNG_Escreve_String_Ini(Arquivo_Ini, nome_sessao$, nome_campo$, valor_campo$)

            If AUX_RET% = 0 Then
                VG_WNG_C_ERR$ = "911"
                VG_WNG_T_ERR$ = "Erro com o arquivo de inicialização a ser gravado: " & Arquivo_Ini
                Exit Function
            End If
        End If
    End If
    
    FU_WNGWN005_Grava_Arquivo_Ini = True
    
    Exit Function
    
ERRO_GRAVA_ARQ_INI:

    VG_WNG_C_ERR$ = "911"
    VG_WNG_T_ERR$ = "Erro com o arquivo de inicialização a ser gravado: " & Trim(Str(Err)) & "-" & Error$
    
    Err = 0
    
    Exit Function

End Function

Function FU_WNGWN005_WNG_Escreve_String_Ini(ByVal Arquivo_Ini As String, ByVal Sessao As String, ByVal Item As String, ByVal texto As String) As Long
    
'+-------------------------------------------------------------------------+
'|  Esta função foi copiada do módulo do suporte GEMVBAPI.BAS               |
'+------------------------------------------------------------------------+
    Const Item_Nulo = 1
    Const Texto_Nulo = 2

    Dim retorno As Integer
    Dim QUAL As Integer

    QUAL = 0
    If Item = "" Then QUAL = Item_Nulo
    If texto = "" Then QUAL = QUAL + Texto_Nulo

    Select Case QUAL
        Case 0
            FU_WNGWN005_WNG_Escreve_String_Ini = WritePrivateProfileString(Sessao, Item, texto, Arquivo_Ini)
        Case Item_Nulo
            FU_WNGWN005_WNG_Escreve_String_Ini = WritePrivateProfileString(Sessao, 0&, texto, Arquivo_Ini)
        Case Texto_Nulo
            FU_WNGWN005_WNG_Escreve_String_Ini = WritePrivateProfileString(Sessao, Item, 0&, Arquivo_Ini)
        Case Else
            FU_WNGWN005_WNG_Escreve_String_Ini = WritePrivateProfileString(Sessao, 0&, 0&, Arquivo_Ini)
    End Select

End Function

Function FU_WNGWN005_Grava_INI(PRM_n_pgm_exe$, Optional PRM_N_PATH_ARQ_INI As String)

    Dim AUX_RET%
    
'+-------------------------------------------------------------------------+
'|          ROTINA QUE EFETUA A GRAVAÇÃO DO ARQUIVO INI PADRÃO              |
'+-------------------------------------------------------------------------+
    On Error GoTo ERRO_GRAVA_INI
    
    FU_WNGWN005_Grava_INI = False
    
'+-------------------------------------------------------------------------+
'|                      SETA O CAMINHO DO ARQUIVO INI                       |
'+-------------------------------------------------------------------------+
    If Trim(PRM_N_PATH_ARQ_INI$) = "" Then
        VG_N_ARQ_INI$ = FU_Diretorio_Usuario & "\"
    Else
        VG_N_ARQ_INI$ = PRM_N_PATH_ARQ_INI$
    End If
    
    VG_N_ARQ_INI$ = VG_N_ARQ_INI$ & PRM_n_pgm_exe$ & ".INI"
    
'+-------------------------------------------------------------------------+
'|              LIMPA A SESSÃO DO ARQUIVO INI A SER GRAVADO                 |
'+-------------------------------------------------------------------------+
    AUX_RET% = WritePrivateProfileSection(PRM_n_pgm_exe$, "", VG_N_ARQ_INI$)

'+-------------------------------------------------------------------------+
'| EFETUA A GRAVAÇÃO DO ARQUIVO PADRÃO WN.INI PARA UTILIZAÇÃO NOS PROJETOS  |
'+-------------------------------------------------------------------------+
    
    'Identificação do negócio
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_IDT_NWF", WN_INI.u_idt_nwf$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "E_NWF", WN_INI.e_nwf$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "D_HRA_INI_ATV", WN_INI.d_hra_ini_atv) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "D_HRA_HIS_ICN", WN_INI.d_hra_his_icn) Then Exit Function
    
    'Identificação do erro
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_MSG_ERR", WN_INI.c_msg_err$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "T_MSG_ERR_EMI", WN_INI.t_msg_err_emi$) Then Exit Function
    
    'Identificação da proposta
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_PRP", WN_INI.u_prp$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "D_PRT_CGA", WN_INI.d_prt_cga$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "D_HRA_GRC_LOT", WN_INI.d_hra_grc_lot) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_RGT_SSP_TRM", WN_INI.u_rgt_ssp_trm) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_LOT_PRT_CTR", WN_INI.u_lot_prt_ctr) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_SUB_CTR", WN_INI.u_sub_ctr) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_ARE_PRT", WN_INI.c_are_prt$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_ISG", WN_INI.c_isg$) Then Exit Function
       
    'Identificação do cliente
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "N_PES", WN_INI.n_pes$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "E_PES", WN_INI.e_pes$) Then Exit Function
    
    'Identificação do corretor principal
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "N_CVD", WN_INI.n_cvd$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "E_CVD", WN_INI.e_cvd$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_RGT_SSP", WN_INI.u_rgt_ssp$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_DCO_RGT_SSP", WN_INI.u_dco_rgt_ssp$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_LOC_PGT_CVD", WN_INI.c_loc_pgt_cvd$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_UND_CVD", WN_INI.c_und_cvd$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_DDD", WN_INI.c_ddd$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_LIN_CMN", WN_INI.u_lin_cmn$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_RML_LIN_CMN", WN_INI.u_rml_lin_cmn$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "I_AGG", WN_INI.i_agg$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_PSL_ATD_CVD", WN_INI.c_psl_atd_cvd$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "T_IDT_PFL_CVD", WN_INI.t_idt_pfl_cvd$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "T_CANAL", WN_INI.t_canal$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "E_RSV_ATV_OUT", WN_INI.e_rsv_atv_out$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "T_RSV_ATV_NWF", WN_INI.t_rsv_atv_nwf$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "T_E_CVD", WN_INI.t_e_cvd$) Then Exit Function

    'Identificação do corretor agregado
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "N_PES_AGG", WN_INI.n_pes_agg$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "E_CVD_AGG", WN_INI.e_cvd_agg$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_CVD_AGG", WN_INI.u_cvd_agg$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_DCO_CVD_AGG", WN_INI.u_dco_cvd_agg$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_LOC_PGT_AGG", WN_INI.c_loc_pgt_agg$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_DDD_AGG", WN_INI.c_ddd_agg$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_LIN_CMN_AGG", WN_INI.u_lin_cmn_agg$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_RML_LIN_CMN_AGG", WN_INI.u_rml_lin_cmn_agg$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_PSL_ATD_CVD_AGG", WN_INI.c_psl_atd_cvd_agg$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "T_IDT_PFL_CVD_AGG", WN_INI.t_idt_pfl_cvd_agg$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "T_E_CVD_AGG", WN_INI.t_e_cvd_agg$) Then Exit Function

    'Identificação da apólice atual (aditamento)
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_CIA_ITA", WN_INI.c_cia_ita$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_RMO", WN_INI.c_rmo$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_PRO", WN_INI.c_pro) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_APO_PNC", WN_INI.u_apo_pnc$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "U_APO_DPD", WN_INI.u_apo_dpd$) Then Exit Function
    
    'Identificação da atividade do FileNet
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_ATV_NWF", WN_INI.c_atv_nwf$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "N_ATV_NWF", WN_INI.n_atv_nwf$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "E_ATV_NWF", WN_INI.e_atv_nwf$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "N_FLA_NWF", WN_INI.n_fla_nwf$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_ATV_CTT_NWF", WN_INI.c_atv_ctt_nwf$) Then Exit Function
    
    'Identificação do usuário de atuação no negócio
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "N_USR_ATC_NWF", WN_INI.n_usr_atc_nwf$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_ARE_ATC_NWF", WN_INI.c_are_atc_nwf$) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_PFL_USR_NWF", WN_INI.c_pfl_usr_nwf) Then Exit Function
    
    'Tela default para o projeto WNPVIU01
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_TLA", WN_INI.c_tla) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_FRM_VIS_JNL", WN_INI.c_frm_vis_jnl) Then Exit Function
    
    'Identificação do tipo de WorkFlow
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_E_AGR", WN_INI.c_e_agr) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(VG_N_ARQ_INI$, PRM_n_pgm_exe$, "C_AGR", WN_INI.c_agr) Then Exit Function
    
'+-------------------------------------------------------------------------+
'|                      FIM DA GRAVAÇÃO DO ARQUIVO INI                      |
'+-------------------------------------------------------------------------+
    FU_WNGWN005_Grava_INI = True
    
    Exit Function

'+------------------------------------------------------------------------+
'|                      TRATAMENTO DE ERROS NA ROTINA                       |
'+-------------------------------------------------------------------------+
ERRO_GRAVA_INI:
    
    VG_WNG_C_ERR$ = "1658"
    
    VG_WNG_T_ERR$ = "FU_WNGWN005_Grava_INI. Erro VB: " & Err.Description
    
    Err.Clear
    
    Exit Function
    
End Function


Function FU_WNGWN005_GeraParametro_LOG(n_Prg As String) As String
    
    Dim sPar As String
    Dim fso_Temp As FileSystemObject
    Dim dta_Criacao As String
    
    Set fso_Temp = New FileSystemObject
    
    'Inicia a variável com o parâmetro fixo
    sPar$ = "#" & CG_PARAMETRO & "#"
    
    'Data de criação do arquivo ini
    dta_Criacao = fso_Temp.GetFile(FU_Diretorio_Usuario & "\" & n_Prg & ".ini").DateCreated
    Set fso_Temp = Nothing
    
    sPar$ = sPar$ & dta_Criacao & "##"
    
    'Identificador do workflow
    sPar$ = sPar$ & Left(Left(App.EXEName, 2) & "F" & Mid(App.EXEName, 4, 4) & "1", Len(Left(App.EXEName, 2) & "F" & Mid(App.EXEName, 4, 4) & "1") - 2) & "01#"
    
    FU_WNGWN005_GeraParametro_LOG = sPar$

End Function

Public Function FU_WNGWN005_Grava_INI_LOG(ByVal C_TLA_HIS As String, _
                                          ByVal u_idt_nwf As String, _
                                          Optional PRM_N_PATH_ARQ_INI As String, _
                                          Optional PRM_C_AGR As String) As Boolean

    On Error GoTo ERRO_GRAVA_ARQUIVO_INI_LOG
    
    Dim N_Arq_Ini$
    Dim VL_RET%
    
'+-------------------------------------------------------------------------+
'|          ROTINA QUE EFETUA A GRAVAÇÃO DO ARQUIVO INI PADRÃO              |
'+-------------------------------------------------------------------------+
    FU_WNGWN005_Grava_INI_LOG = False
    
'+-------------------------------------------------------------------------+
'|                      SETA O CAMINHO DO ARQUIVO INI                       |
'+------------------------------------------------------------------------+
    If Trim(PRM_N_PATH_ARQ_INI$) = "" Then
        N_Arq_Ini$ = FU_Diretorio_Usuario & "\"
    Else
        N_Arq_Ini$ = PRM_N_PATH_ARQ_INI$
    End If
    
    N_Arq_Ini$ = N_Arq_Ini$ & "WNPLOG01.INI"
    
'+-------------------------------------------------------------------------+
'|              LIMPA A SESSÃO DO ARQUIVO INI A SER GRAVADO                 |
'+-------------------------------------------------------------------------+
    VL_RET% = WritePrivateProfileSection("WNPLOG01", "", N_Arq_Ini$)

'+-------------------------------------------------------------------------+
'| EFETUA A GRAVAÇÃO DO ARQUIVO PADRÃO WN.INI PARA UTILIZAÇÃO NOS PROJETOS  |
'+------------------------------------------------------------------------+
    
    'Identificação do negócio
    If Not FU_WNGWN005_Grava_Arquivo_Ini(N_Arq_Ini$, "WNPLOG01", "C_TLA_HIS", C_TLA_HIS) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(N_Arq_Ini$, "WNPLOG01", "N_PGM_EXE", App.EXEName) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(N_Arq_Ini$, "WNPLOG01", "U_IDT_NWF", u_idt_nwf) Then Exit Function
    If Not FU_WNGWN005_Grava_Arquivo_Ini(N_Arq_Ini$, "WNPLOG01", "C_AGR", PRM_C_AGR) Then Exit Function
    
    FU_WNGWN005_Grava_INI_LOG = True
    
    Exit Function

ERRO_GRAVA_ARQUIVO_INI_LOG:

    MsgBox "Erro na leitura do arquivo de inicia��o do LOG. Erro: " & Trim(Str(Err)) & "-" & Error$, vbCritical, 5053
    Err = 0
    
    Exit Function

End Function


'*********************
'Origem: ONLINE
'*********************
