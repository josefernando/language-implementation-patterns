Attribute VB_Name = "R1MAB002"
Option Explicit
'Global ret                          As Integer ' ZE incluido para testes de case sensitive

Global DirUser              As String       'Pereira 04/01/2004 Conversão Terminal Server.
Global sg_shell             As String
Global bg_click             As Integer
Global sg_versao            As String       ' versão do projeto
Global t_apo                As String       ' descrição da apólice
Global volta                As Integer      ' indica se retorno p/ 2a. tela
                                            ' da 1a. tela ou outros forms
Global c_reg_utl            As String       ' codigo do local de risco

Global n_pes                As String * 45  ' nome do segurado
Global c_idt_pes            As String       ' código de identificação do segurado
Global c_cia_ita            As String       ' código da Cia. Itaú
Global c_rmo                As String       ' código do ramo
Global u_apo_pnc            As String       ' número da apólice principal
Global u_apo_dpd            As String       ' número da apólice dependente
Global e_emi_ppl            As Integer      ' emissao de papel
Global Const e_emi_ppl_1    As String = "NORMAL - AUTOMÁTICA"               'v60 Emilio 22/08/2006
Global Const e_emi_ppl_5    As String = "ESPEC.PRÓPRIA,FRONT,ANEXOS E N.S"  'v60 Emilio 22/08/2006
Global c_cia_ita_ant        As String       ' código da companhia da ap. anterior
Global c_rmo_ant            As String       ' código do ramo da ap. anterior
Global u_apo_pnc_ant        As String       ' número da apólice principal anterior da nova arquitetura
Global u_apo_dpd_ant        As String       ' número da apólice dependente anterior
Global u_apo_ant            As String       ' número da apólice anterior da arquitetura velha
Global c_isg                As String       ' código do item segurado
Global n_isg                As String       ' nome do item segurado
Global d_ini_vig_apo        As String       ' data de início de vigência da ap.
Global d_fim_vig_apo        As String       ' data do fim de vigência da ap.
Global d_icl_apo            As String       ' data da emissao

Global d_can_apo            As String       ' data de cancelamento da apólice
Global c_sit_apo            As String       ' código da situação da apólice
Global t_sit_apo            As String * 50  ' texto da situação da apólice
Global d_dia_env_dem        As String       ' dia da remessa de demonstrativo de faturamento
Global e_cvd_prp            As String       ' tipo de canal de vendas
Global u_rgt_ssp_prp        As String       ' número registro SUSEP
Global u_dco_rgt_ssp_prp    As String       ' número documento registro SUSEP
Global c_loc_pgt_cvd_prp    As String       ' código local pagamento canal vendas
Global c_und_cvd_prp        As String       ' código unidade de canal de vendas
Global n_pes_cor            As String * 45  ' nome do corretor
Global c_pro                As String       ' código do produto
Global n_pro                As String * 40  ' descrição do produto
                                                               
Global u_chs_aut            As String * 20  ' número do chassis
Global u_plc_aut            As String * 10  ' número da placa
Global e_cmb                As String       ' tipo de combustível
Global t_coo_aut            As String * 15  ' cor do veículo
Global t_pin_aut            As String * 15  ' tipo de pintura do veículo
Global u_mtr_aut            As String * 15  ' número do motor
Global d_ano_fbr            As String       ' ano de fabricação
Global d_ano_mod            As String       ' ano do modelo
Global c_seg_reg            As String       ' código do seguro da região
Global t_isg                As String * 200 ' descrição do item segurado
Global u_lau                As String       ' número do laudo
Global e_vtd                As String       ' codigo do vistoriador
Global c_idt_vtd            As String       ' codigo do vistoriador
Global n_cls_bon            As String * 10  ' nome da classe de bônus
Global c_tab_bon            As String       ' código da tabela de bônus
Global d_sda_vei            As String       ' data de saída do veículo
Global i_zro_km             As String * 1   ' indicador de zero km
Global u_ocr_l_crs          As String       ' número de ocorrência logradouro
                                            ' correspondência
Global str_Fam_Pro          As String       ' Nome da Família de Produtos
Global q_moe_vba            As Currency     ' quantidade de moeda

Global e_fam_pro            As String       ' família
Global c_agr_fam_pro        As String       ' código do agrupamento da família
Global t_fam_pro            As String * 15  ' texto família/produto

Global c_fil_agf            As String
Global c_rmo_agf            As String
Global u_etl_agf            As String
Global u_sub_etl_agf        As String
Global u_apo_agf            As String
Global d_vig_prx_agf        As String
Global U_Opr_Cre            As String       '   Npúmero da Operação de crédito
Global u_ctr_etl_fmt        As String       '   Número da Operação de crédito operação migrada  SS 132490 - Kondor
Global u_ctr_etl_seq        As String       '   Número da Operação de crédito operação migrada  SS 132490 - Kondor
Global i_exi_sin_mis        As String       '   SS 132490 - Kondor
'v68 Emilio 22/05/2008 - início
'Migração Itauprev
Global c_pro_itp            As String
Global u_apo_itp            As String
'v68 Emilio 22/05/2008 - fim

'Global c_agr_fam_pro_input  As String       ' código do agrupamento da família passado como parâmetro

Global n_apl_chm            As String       ' nome da aplicação chamadora

'Migração Banerj
Global c_cia_ita_mfr        As String
Global c_rmo_bnj            As String
Global c_suc_bnj            As String
Global c_doc_bnj            As String
Global u_apo_mfr_opf        As String
Global u_ite_apo_mfr        As String
Global u_apo_mfr_bnj        As String

'Dilson - SS_129444 - Ini
Global PRODUT0_GARANTECH    As Integer
Global Motivo_Garantech     As String
'Dilson - SS_129444 - Fim
'****** VARIÁVEIS DE CONTROLE DA FONETIZAÇÃO POR NOME DE CLIENTE ************

' indica o tipo de pesquisa fonética que a St_proc irá realizar
'          indice%
'             1         ->     n_idc1
'             2         ->     n_idc2
'             3         ->     n_idc3
Global indice               As Integer


' indica qual índice fonético a ser passado para a StProc
'          tipo_fonet%      na StProc é pesquisado por
'              0        ->     n_idc$ = fonet_indice(0)
'              1        ->     n_idc$ = fonet_indice(1)
'              2        ->     n_idc$ = fonet_indice(2)
Global tipo_fonet           As Integer


' armazena o conteúdo do índice fonético passado p/ a StProc
Global n_idc                As String * 15

' indica o total de homônimos inseridos no array
Global n_tot_hmn            As Integer

' armazena a posição no array do primeiro homômino no listbox Li_Homonimo
Global pos_array_fonet        As Integer

' armazena todos os homônimos encontrados na seleção pelos demais índices
' (@n_idc1 e n_idc1), (@n_idc1 e n_idc2), (@n_idc1 e n_idc3),
' (@n_idc2 e n_idc1), (@n_idc2 e n_idc2), (@n_idc2 e n_idc3),
' (@n_idc3 e n_idc1), (@n_idc3 e n_idc2), (@n_idc3 e n_idc3)
Global array_fonet()

' indica se todos os índices já foram consultados na tabela
Global fim_fonet        As Integer

' Em uma pesquisa na tabela, indica se existem mais de 500 clientes
' Número máximo de linhas no listbox = 500.
' O listbox deverá ser atualizado mais de 1 vez
Global Tela             As Integer

' armazena a posição atual do foco no listbox
Global pos_foco_lst     As Integer


'************************* CONTROLE DE CONEXÕES *********************************
Global Servidor_Id      As Integer
Global E_Ope_Vda_Pro    As String * 1
Global txt_msg          As String


'***************************** CONSTANTES VB *******************************
'Mensagem de Erros do VBSQL.
Const CG_MENSAGEM_PADRAO = "Anote as mensagens a seguir, e contate a área de informática"


'Variaveis Globais Constantes usada pela função SU_ERRO_ST_PROC.
Global Const ST_SqlRpcInit% = 1
Global Const ST_sqlrpcparam% = 2
Global Const ST_SqlRpcSend% = 3
Global Const ST_SqlOk% = 4
Global Const ST_SqlResults% = 5

Global sg_c_cia_ita_ant$
Global sg_c_rmo_ant$
Global sg_u_apo_pnc_ant$
Global sg_u_apo_dpd_ant$
Global sg_u_apo_ori$
Global sg_c_isg_apo_ori$
Global sg_d_ini_pri_apo$
Global sg_u_vrs_ctr_hsu$

Global drive_imp_ant As String

'Variável para verificar se está executando em teste ou produção
Global CG_DIR_EXE1$

Global e_ptc_pes$
Global c_agr_imp$
Public d_ano_mes_ref    As String
Public gDataCorrente    As Date
Global c_isg_agf        As String

'Adriano - Inicio
'Tipo que armazena os dados da Tabela de Controle de Emissão de Proposta
Type TIPO_EMI_PRP
    c_pro           As String
    e_cvd_prp       As String
    u_rgt_ssp_prp   As String
    u_dco_ssp_prp   As String
    c_loc_pgt_prp   As String
    c_und_cvd_prp   As String
    u_prp           As String
    d_prt_cga       As String
    'Carla 29/06/2005 - guardar o número da pasta GED
    u_paa_doc_ged   As String
    u_ctc           As String   'v99 Emilio 23/05/2011 - SS_163237 - Tombamento Auto Frota UBB x ISa+r
End Type

Public VT_TIPO_EMI_PRP As TIPO_EMI_PRP

Public VG_u_idt_nwf$

'v56 Emilio 29/06/2006 - início
Global Wd               As Object   'Objeto do aplicativo Microsoft Word   'v57 Emilio 06/07/2006
Global objControlWord   As ControlWord  'Cria objeto apartir da classe  'v57 Emilio 06/07/2006
Global msgerro          As String
Global u_prc_ssp        As String   'Número do processo SUSEP

'Diego Ponciano - BRQ - 13/05/2013 - PR-2013-0001507
Global modalidade       As String   'Modalidade do processo SUSEP

'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'                           VARIÁVEIS DO CONTENT MANAGER
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Global i_conexao        As Boolean  'Indicador de conexão do Content Manager
Global ulRC             As Variant  'ReturnCode - retorno dos métodos do Content Manager
Global n_dir_tmp        As String   'Diretório temporário para exportação do arquivo Word
Global n_arq_esf_apo    As String   'Arquivo de especificação da apólice/aditamento

'Dados da chave do arquivo de especificação da apólice/aditamento
Type DAD_CMG_APO
    IY0_N_ARQ_ESF_APO   As String
    IY0_N_USR           As String
    IY0_D_HRA_ATU       As String
    IY0_GENERICO_1      As String
    IY0_GENERICO_2      As String
End Type
Global CMG_APO As DAD_CMG_APO
Global Const CLASSE_CMG_ANEXO As String = "IY0_ITAUSEG_ARQ_ANEXO_APOLICE"
'v56 Emilio 29/06/2006 - fim

Function fu_abre_servidor(Formulario As String) As Integer

    'Abre conexão com Servidor e verifica Acesso

    fu_abre_servidor = True

    Select Case E_Ope_Vda_Pro$
     
    'Case "D"    ' DIFERENCIADO
    '    SU_Conecta_Verifica SERV_DIFEREN_ID, Formulario
    '    servidor_id% = SERV_DIFEREN_ID
    Case "M"    ' MASSA
        SU_Conecta_Verifica SERV_MASCORP_ID, Formulario
        Servidor_Id% = SERV_MASCORP_ID
    Case Else
        MsgBox "Processamento de Apólice não Disponível para Aplicação.", 16
        fu_abre_servidor = False
        Exit Function
    End Select

End Function

Function fu_acessa_apo_escr(atual As Form) As Integer

Dim file_ini$, tipo_emissao$, sessao_ini$
    
    ' Chamada Apólice Escritural

    ' retorno da função
    Dim iExecOk  As Integer

    ' nome do executável
    Dim sArqExec As String

    ' armazena a posicao do aditamento no array dad_adi
    Dim pos As Integer

    atual.Refresh
    
    fu_acessa_apo_escr = True

    '**********************************************************************
    'Katsumi - 02/09/1999
    'If c_rmo = "11" And c_pro = "39" And e_emi_ppl = 5 Then
    'If c_agr_imp = "240" And e_emi_ppl = 5 Then   'Katsumi - 14/10/1999
    If e_emi_ppl = 5 And Val(c_agr_fam_pro$) <> 9 Then    'Valdemir - 02/06/2009
        'fazer chamada ao projeto R1PAAOO1.EXE para consulta da
        'apólice de Riscos Patrimoniais
        
        sArqExec$ = "R1PAA001.EXE"
        
        'gerar um arquivo C:\USER\R1PAA001.INI
        file_ini$ = DirUser & "R1PAA001.INI"
        sessao_ini$ = "APOLICE"
        
        'Gravar Valores no R1PAA001.INI
     
        su_wri_ini file_ini$, sessao_ini$, "C_CIA_ITA", c_cia_ita$
        su_wri_ini file_ini$, sessao_ini$, "C_RMO", c_rmo$
        su_wri_ini file_ini$, sessao_ini$, "C_PRO", c_pro$
        su_wri_ini file_ini$, sessao_ini$, "U_APO_PNC", Format$(Val(u_apo_pnc$), "000000000")
        su_wri_ini file_ini$, sessao_ini$, "U_APO_DPD", u_apo_dpd$
        su_wri_ini file_ini$, sessao_ini$, "U_ADI", u_adi$
        su_wri_ini file_ini$, sessao_ini$, "U_VRS_ADI", U_VRS_ADI$
    
    '**********************************************************************
    Else
        ' O combo tem a posicao consolidada duplicada (1o. e último elemento
        ' do combo).
        ' Se o 1o. elemento for escolhido, os dados do aditamento no array dad_adi
        ' se encontrarão na última posicão do array.
        '           no combo               no array
        '    5  (  POSICAO ATUAL  )
        '    1                                1
        '    2                                2
        '    3                                3
        '    5                                5
    
        ' aditamento 5 - corresponde somente ao último elemento do array
        
        sArqExec$ = "R1PAB501.EXE"
        
        If R1FAB001.ch3d_apo_escr.Value Then
            ' seleciona o elemento do array dad_adi() correspondente à
            ' proposta pesquisada
            pos% = -1
            
            ' se existir somente um aditamento para apólice, não é necessário
            ' incrementar o contador para posicionar o aditamento
            Do
                pos% = pos% + 1
                If Val(u_adi$) = Val(dad_adi(pos%).u_adi) Then
                  Exit Do
                End If
            Loop Until pos% = UBound(dad_adi)
            
        Else
            If R1FAB002.cb_u_adi.ListIndex = 0 Then
                pos% = UBound(dad_adi)
            Else
                pos% = R1FAB002.cb_u_adi.ListIndex - 1
            End If
        End If
    
        u_adi$ = dad_adi(pos%).u_adi
        
        ' seleciona os dados a serem gravados no arquivo
        ' utilizado no acesso de outro projeto
        If fu_trata_dados_arq() Then
          
            su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAB501"
    
            ' grava parâmetros utilizados por outro projeto (.INI)
            su_grava_arquivo pos%
            
        Else
            fu_acessa_apo_escr = False
            Exit Function
        End If
    End If
    
    
    ' fecha conexão para a chamada de outro projeto
    su_fecha_conexao
    
    'atual.Hide
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '======================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        iExecOk% = FU_Monitora_Exec(atual, sArqExec$ & " " & n_apl_chm$)
'    Else
'        iExecOk% = FU_Monitora_Exe(atual, CG_DIR_EXE1$ + sArqExec$ & " " & n_apl_chm$, MinEnableFalse%)
'    End If
    iExecOk% = FU_MonitoraExe(atual, "", sArqExec$, n_apl_chm$, , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not iExecOk% Then
        'MsgBox "Não foi possível executar o projeto" & Chr(13) & sArqExec$ & " - PROJETO DO TEXTO", 48
        MsgBox "Opção ainda não disponível ('" & sArqExec$ & "')."
        fu_acessa_apo_escr = False
    End If

    ' chamada de outro projeto
    'iExecOk% = FU_Monitora_Exec(atual, sArqExec$ & " " & n_apl_chm$)
    'If Not iExecOk% Then
    '    MsgBox "Opção ainda não disponível ('" & sArqExec$ & "')."
    '    fu_acessa_apo_escr = False
    'End If

    'LUCIANE - 05/07/1999
    '======================================================================

    ' reestabelece conexão após a execução de outro projeto
    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)

    'atual.Show

    Screen.MousePointer = DEFAULT

End Function

Function fu_carga_apo_32() As Integer
    
    'Carrega os dados da tabela de apólice
    ' retorno de funções
    Dim ret As Integer
    
    fu_carga_apo_32 = False
    
    ' inicializa stored procedure
    ret% = SQLRPCInit(SqlConn%, "DBNPROD..pr_apo_s02232", 0)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_carga_apo_32"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    ret% = SQLRPCSend%(SqlConn%)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_carga_apo_32"
        Exit Function
    End If
    
    ' executa stored procedure
    ret% = SqlOk%(SqlConn%)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_carga_apo_32"
        Exit Function
    End If
    
    ' verifica resultados
    ret% = SqlResults%(SqlConn%)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_carga_apo_32"
        Exit Function
    End If

   ' processa resultados
    Do Until ret% = NOMORERESULTS% Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)
        
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            'ig_c_cia_ita = Trim(SqlData$(Sqlconn%, 1))
            'ig_c_rmo = Trim(SqlData$(Sqlconn%, 2))
            'lg_u_apo_pnc = Trim(SqlData$(Sqlconn%, 3))
            'lg_u_apo_dpd = Trim(SqlData$(Sqlconn%, 4))
            sg_c_cia_ita_ant$ = Trim(SqlData$(SqlConn%, 5))
            sg_c_rmo_ant$ = Trim(SqlData$(SqlConn%, 6))
            sg_u_apo_pnc_ant$ = Trim(SqlData$(SqlConn%, 7))
            sg_u_apo_dpd_ant$ = Trim(SqlData$(SqlConn%, 8))
            sg_u_apo_ori$ = Trim(SqlData$(SqlConn%, 10))
            sg_c_isg_apo_ori$ = Trim(SqlData$(SqlConn%, 11))
            sg_d_ini_pri_apo$ = Format(SqlData$(SqlConn%, 12), "dd/mm/yyyy")
            
            sg_u_vrs_ctr_hsu$ = Trim(SqlData$(SqlConn%, 13))
            
            fu_carga_apo_32 = True

            ret% = SqlNextRow%(SqlConn%)
        Loop

        ret% = SqlResults%(SqlConn%)
    Loop

    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_carga_apo_32"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_carga_apo_32 = False

End Function

Function fu_carr_d_comp() As Integer

    ' para cada aditamento deve-se pesquisar a data de
    ' início e fim da apólice.

    ' array de aditamento
    Dim i As Integer

    fu_carr_d_comp = False
    
    For i% = 0 To UBound(dad_adi)
        u_adi$ = dad_adi(i%).u_adi
        U_VRS_ADI$ = dad_adi(i%).U_VRS_ADI  'Renato 05/12/2002
        If Val(dad_adi(i%).c_mot_alt) = 1500 Or Val(dad_adi(i%).c_mot_alt) = 1700 _
             Or Val(dad_adi(i%).c_mot_alt) = 7100 Then
             '1500 - Acerto de Prêmio Cobrança
             '1700 - Conta Mensal
             '7100 - Cancelamento da Conta Mensal
            ' seleciona a data de competencia da conta mensal
            ' dbntrans..tb_cme_cit
            If Not fu_seleciona_referencia_conta() Then
                Screen.MousePointer = DEFAULT
                MsgBox "Dados da conta mensal - Transportes.", , txt_msg$
                su_habilita_botao R1FAB001.bu3d_ok, True
                R1FAB001.li_aditamentos.Clear
                Exit Function
            End If
            
            If d_ano_mes_ref$ <> "0" Then
                dad_adi(i%).d_ano_mes_ref$ = d_ano_mes_ref$
            End If
            
        End If
        
    Next i%

    fu_carr_d_comp = True
    
End Function

Function fu_carr_d_adi() As Integer

    ' para cada aditamento deve-se pesquisar a data de
    ' início e fim da apólice.

    ' array de aditamento
    Dim i As Integer

    fu_carr_d_adi = False
    
    For i% = 0 To UBound(dad_adi)
        u_adi$ = dad_adi(i%).u_adi
        U_VRS_ADI$ = dad_adi(i%).U_VRS_ADI
    
        ' seleciona dados do técnicos da apólice na tabela
        ' dbnprod..tb_his_tco_apo
        If Not fu_sel_his_tco_apo() Then
            Screen.MousePointer = DEFAULT
            MsgBox "Dados Técnicos não encontrados.", , txt_msg$
            su_habilita_botao R1FAB001.bu3d_ok, True
            R1FAB001.li_aditamentos.Clear
            Exit Function
        End If
        
        dad_adi(i%).d_ini_vig_apo = d_ini_vig_apo$
        dad_adi(i%).d_fim_vig_apo = d_fim_vig_apo$
        dad_adi(i%).u_ocr_l_crs = u_ocr_l_crs$
        
    Next i%

    fu_carr_d_adi = True
    
End Function


Function fu_grava_parametro() As Integer

    'Grava as variaveis do arquivo de passagem de dados
    Dim file_ini$, tipo_emissao$, nivel$, Status%, sessao_ini$
    Dim param_rec$, Contador%, Inicio%, Fim%
    
    fu_grava_parametro = False

    file_ini$ = DirUser & "R1PTX001.INI"
    
    
    If Val(u_adi$) = 0 Then
         nivel$ = "APOLICE"
    Else
        nivel$ = "ADITAMENTO"
    End If

    'Gravar Valores no R1PTX001.INI
    ''status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "EMISSAO", tipo_emissao$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "NIVEL", nivel$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "BOTAO", "CONSULTA")
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "CLIENTE", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_RMO", c_rmo$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_PRO", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "E_CVD_PRP", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_RGT_SSP_PRP", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_DCO_SSP_PRP", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_LOC_PGT_PRP", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_PRP", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_CIA_ITA", c_cia_ita$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_APO_PNC", u_apo_pnc$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_APO_DPD", u_apo_dpd$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_ADI", u_adi$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_VRS_ADI", u_vrs_adi$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_OSG", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "E_OSG", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_VRS_OSG", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_ISG", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_GAR", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_CLA", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_OCR_CLA", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_PLA_PRO", empty)

    su_wri_ini file_ini$, "R1PTX001", "NIVEL", nivel$
    su_wri_ini file_ini$, "R1PTX001", "BOTAO", "CONSULTA"
    su_wri_ini file_ini$, "R1PTX001", "CLIENTE", Empty
    su_wri_ini file_ini$, "R1PTX001", "C_RMO", c_rmo$
    su_wri_ini file_ini$, "R1PTX001", "C_PRO", Empty
    su_wri_ini file_ini$, "R1PTX001", "E_CVD_PRP", Empty
    su_wri_ini file_ini$, "R1PTX001", "U_RGT_SSP_PRP", Empty
    su_wri_ini file_ini$, "R1PTX001", "U_DCO_SSP_PRP", Empty
    su_wri_ini file_ini$, "R1PTX001", "C_LOC_PGT_PRP", Empty
    su_wri_ini file_ini$, "R1PTX001", "U_PRP", Empty
    su_wri_ini file_ini$, "R1PTX001", "C_CIA_ITA", c_cia_ita$
    su_wri_ini file_ini$, "R1PTX001", "U_APO_PNC", Format$(Val(u_apo_pnc$), "000000000")
    su_wri_ini file_ini$, "R1PTX001", "U_APO_DPD", u_apo_dpd$
    su_wri_ini file_ini$, "R1PTX001", "U_ADI", u_adi$
    su_wri_ini file_ini$, "R1PTX001", "U_VRS_ADI", U_VRS_ADI$
    su_wri_ini file_ini$, "R1PTX001", "C_OSG", Empty
    su_wri_ini file_ini$, "R1PTX001", "E_OSG", Empty
    su_wri_ini file_ini$, "R1PTX001", "U_VRS_OSG", Empty
    su_wri_ini file_ini$, "R1PTX001", "C_ISG", Empty
    su_wri_ini file_ini$, "R1PTX001", "C_GAR", Empty
    su_wri_ini file_ini$, "R1PTX001", "C_CLA", Empty
    su_wri_ini file_ini$, "R1PTX001", "U_OCR_CLA", Empty
    su_wri_ini file_ini$, "R1PTX001", "C_PLA_PRO", Empty

    fu_grava_parametro = True

End Function

Function fu_grava_parametro_clausula(c_gar$, c_pla_pro$, c_cla$, U_OCR_CLA$) As Boolean
    'Grava as variaveis do arquivo de passagem de dados
    Dim file_ini$, tipo_emissao$, nivel$, Status%, sessao_ini$
    Dim param_rec$, Contador%, Inicio%, Fim%
    
    fu_grava_parametro_clausula = False

    file_ini$ = DirUser & "R1PTX001.INI"
    
     nivel$ = "CLAUSULA"

    'Gravar Valores no R1PTX001.INI
    ''status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "EMISSAO", tipo_emissao$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "NIVEL", nivel$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "BOTAO", "CONSULTA")
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "CLIENTE", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_RMO", c_rmo$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_PRO", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "E_CVD_PRP", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_RGT_SSP_PRP", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_DCO_SSP_PRP", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_LOC_PGT_PRP", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_PRP", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_CIA_ITA", c_cia_ita$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_APO_PNC", u_apo_pnc$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_APO_DPD", u_apo_dpd$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_ADI", u_adi$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_VRS_ADI", u_vrs_adi$)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_OSG", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "E_OSG", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_VRS_OSG", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_ISG", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_GAR", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_CLA", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "U_OCR_CLA", empty)
    'status% = FU_Escreve_String_Ini(file_ini$, "R1PTX001", "C_PLA_PRO", empty)

    su_wri_ini file_ini$, "R1PTX001", "NIVEL", nivel$
    su_wri_ini file_ini$, "R1PTX001", "BOTAO", "CONSULTA"
    su_wri_ini file_ini$, "R1PTX001", "CLIENTE", Empty
    su_wri_ini file_ini$, "R1PTX001", "C_RMO", c_rmo$
    su_wri_ini file_ini$, "R1PTX001", "C_PRO", c_pro$
    su_wri_ini file_ini$, "R1PTX001", "E_CVD_PRP", Empty
    su_wri_ini file_ini$, "R1PTX001", "U_RGT_SSP_PRP", Empty
    su_wri_ini file_ini$, "R1PTX001", "U_DCO_SSP_PRP", Empty
    su_wri_ini file_ini$, "R1PTX001", "C_LOC_PGT_PRP", Empty
    su_wri_ini file_ini$, "R1PTX001", "U_PRP", Empty
    su_wri_ini file_ini$, "R1PTX001", "C_CIA_ITA", c_cia_ita$
    su_wri_ini file_ini$, "R1PTX001", "U_APO_PNC", Format$(Val(u_apo_pnc$), "000000000")
    su_wri_ini file_ini$, "R1PTX001", "U_APO_DPD", u_apo_dpd$
    su_wri_ini file_ini$, "R1PTX001", "U_ADI", u_adi$
    su_wri_ini file_ini$, "R1PTX001", "U_VRS_ADI", U_VRS_ADI$
    su_wri_ini file_ini$, "R1PTX001", "C_OSG", Empty
    su_wri_ini file_ini$, "R1PTX001", "E_OSG", Empty
    su_wri_ini file_ini$, "R1PTX001", "U_VRS_OSG", Empty
    su_wri_ini file_ini$, "R1PTX001", "C_ISG", c_isg$
    su_wri_ini file_ini$, "R1PTX001", "C_GAR", c_gar$
    su_wri_ini file_ini$, "R1PTX001", "C_CLA", c_cla$
    su_wri_ini file_ini$, "R1PTX001", "U_OCR_CLA", U_OCR_CLA$
    su_wri_ini file_ini$, "R1PTX001", "C_PLA_PRO", c_pla_pro$

    fu_grava_parametro_clausula = True


End Function


'v60 Emilio 22/08/2006 - início
'Obs.: Migração XP para novo catalogador - Função descontinuada
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'Function FU_Monitora_Exec(Formulario As Form, ByVal Linha_Comando As String) As Integer
'
'    'Descrição : Function fu_monitora_exec(<Formulario>, <Linha_de_Comando>)
'    'Objetivo  : Não deixa continuar o programa enquanto o arquivo
'    '            especificado na linha de comando estiver em execução.
'    'Parâmetros: <Formulario> - Nome do formulário corrente (Me).
'    '            <Linha_de_Comando> - Nome completo do Arquivo a ser
'    '                monitorado mais os parametros.
'    'Retornos:   False - Linha de comando inválida.
'    '            True - Execução OK.
'    'Exemplo   :
'    '                   .
'    '                   .
'    '  If Not fu_monitora_exec(Me, "F:\PRODUCAO\VBDIF\EXEC\XXPGE000.EXE Arg1 Arg2") Then
'    '     MsgBox "Erro na execução do Arquivo."
'    '  End If
'    '                   .
'    '                   .
'    On Error Resume Next
'
'    Dim hInstance As Integer
'    Dim Y As Integer
'    Dim arquivo$
'    Dim CR_LF$
'    Const dir_producao$ = "f:\producao\vbdif\exec\"
'    Const dir_desenv$ = "f:\desenv\vbdif\exec\"
'
'    CR_LF$ = Chr$(10) + Chr$(13)
'    FU_Monitora_Exec = True
'
'    Err = 0
'
'    arquivo$ = dir_desenv$ + Linha_Comando
'
'    hInstance = FU_Shell(arquivo$, 5)
'
'    If hInstance = 0 Or Err <> 0 Then
'
'        arquivo$ = dir_producao$ + Linha_Comando
'
'        Err = 0
'
'        hInstance = FU_Shell(arquivo$, 5)
'
'        If hInstance = 0 Or Err <> 0 Then
'
'            FU_Monitora_Exec = False
'
'            Select Case Err
'            Case 7
'                MsgBox CG_MENSAGEM_PADRAO, MB_OK + MB_ICONSTOP, "Atenção"
'                MsgBox Str$(Err) & " - " & "Memória insuficiente para rodar este aplicativo." + CR_LF$ + "Feche algum programa e tente novamente.", MB_OK + MB_ICONSTOP, "Erro de execução"
'
'            Case Else
'                MsgBox CG_MENSAGEM_PADRAO, MB_OK + MB_ICONSTOP, "Atenção"
'                MsgBox Str$(Err) & " - " & Error$(Err) + CR_LF$ + "Contate o Analista Responsável.", MB_OK + MB_ICONSTOP, "Erro de execução"
'
'            End Select
'
'            Exit Function
'        End If
'
'    End If
'
'    Formulario.Hide
'
'    While FU_GetModuleUsage(hInstance) > 0
'        Y = DoEvents()
'    Wend
'
'    'Formulario.Show
'    'Formulario.Refresh
'
'End Function
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'v60 Emilio 22/08/2006 - fim

Function fu_pesquisa_apolice() As Integer

    'Seleciona data de início e fim de vigência das apólices
    
    'contador para arrays
    Dim i As Integer
    
    fu_pesquisa_apolice = False

    'seleciona dados técnicos da apólice
    For i% = 0 To UBound(dad_apo)
        c_cia_ita$ = dad_apo(i%).c_cia_ita
        c_rmo$ = dad_apo(i%).c_rmo
        u_apo_pnc$ = dad_apo(i%).u_apo_pnc
        u_apo_dpd$ = dad_apo(i%).u_apo_dpd
    
        If Not fu_sel_his_tco_apo() Then
            If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
               Screen.MousePointer = DEFAULT
               MsgBox "Dados Técnicos não encontrados.", , txt_msg$
               Exit Function
            End If
        End If
        dad_apo(i%).d_ini_vig_apo = d_ini_vig_apo$
        dad_apo(i%).d_fim_vig_apo = d_fim_vig_apo$
        dad_apo(i%).n_pro = n_pro$

        ' verifica agrupamento da família
        If dad_aut(i%).c_fbr_aut <> Empty Then
            c_fbr_aut = dad_aut(i%).c_fbr_aut
            If Not fu_sel_fbr_aut() Then
               Screen.MousePointer = DEFAULT
               MsgBox "Dados do Fabricante não encontrados.", , txt_msg$
               Exit Function
            End If
            dad_aut(i%).n_fbr_aut = n_fbr_aut$
        End If

        'seleciona linha do veículo
         If dad_aut(i%).e_pcd_aut <> Empty And dad_aut(i%).c_fbr_aut <> Empty And dad_aut(i%).c_lin_aut <> Empty Then

            e_pcd_aut$ = dad_aut(i%).e_pcd_aut
            c_fbr_aut$ = dad_aut(i%).c_fbr_aut
            c_lin_aut$ = dad_aut(i%).c_lin_aut
            
            If Not fu_sel_lin_aut() Then
               Screen.MousePointer = DEFAULT
               MsgBox "Dados da Linha do Auto não encontrados.", , txt_msg$
               Exit Function
            End If
            dad_aut(i%).n_lin_aut = n_lin_aut$
         End If

         ' seleciona modelo do veículo
         If dad_aut(i%).e_pcd_aut <> Empty And dad_aut(i%).c_fbr_aut <> Empty And dad_aut(i%).c_lin_aut <> Empty And dad_aut(i%).c_mod_aut <> Empty Then
            
            e_pcd_aut$ = dad_aut(i%).e_pcd_aut
            c_fbr_aut$ = dad_aut(i%).c_fbr_aut
            c_lin_aut$ = dad_aut(i%).c_lin_aut
            c_mod_aut$ = dad_aut(i%).c_mod_aut

            If Not fu_sel_mod_aut() Then
               Screen.MousePointer = DEFAULT
               MsgBox "Não encontrado Modelo do Auto", , txt_msg$
               Exit Function
            End If
            dad_aut(i%).n_mod_aut = n_mod_aut$
         End If

    Next i%
    
    fu_pesquisa_apolice = True

End Function

Function fu_pesquisa_demais_dados() As Integer

    ' seleciona demais dados da apólice após a escolha
    ' do aditamento. Estes dados são apresentados na 2a.
    ' tela do consulta (R1FAB102)

    Dim i   As Integer

    fu_pesquisa_demais_dados = False

    ' seleciona dados da apólice anterior
    If Not fu_sel_apo_ant() Then
    
    End If

    SU_TRATAMENTO_CLIENTE

    ' seleciona a situação da apólice.
    ' Caso a apólice esteja com situação "APOLICE VIGENTE" (c_sit_apo = 1),
    ' "APOLICE REABILITADA" (c_sit_apo = 5) ou "APOLICE VIGENCIA REDUZIDA"
    ' (c_sit_apo = 10), a data de fim de vigência deve ser verificada c/
    ' a data atual. Se for menor, a situação deve ser alterada "APOLICE
    ' VIGENCIA TERMINADA" (c_sit_apo = 7)
    If Not fu_sel_dad_tco_apo() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Situação da Apólice não encontrada.", , txt_msg$
        Exit Function
    End If

   'Verifica dados do Item Segurado de acordo com o aditamento escolhido
   For i% = 0 To UBound(dad_isg)
      If Val(dad_isg(i%).u_adi) = Val(u_adi) And Val(dad_isg(i%).U_VRS_ADI) = Val(U_VRS_ADI$) Then
         c_seg_reg$ = dad_isg(i%).c_seg_reg
         t_isg$ = dad_isg(i%).t_isg
         c_reg_utl$ = dad_isg(i%).c_reg_utl
         q_moe_vba@ = dad_isg(i%).q_moe_vba
         c_isg$ = dad_isg(i%).c_isg
         c_osg$ = dad_isg(i%).c_osg
         e_osg$ = dad_isg(i%).e_osg
         u_vrs_osg$ = dad_isg(i%).u_vrs_osg
         Exit For
      End If
   Next i%
   
   fu_pesquisa_demais_dados = True

End Function

Function fu_procura_cliente() As Integer

    ' realiza tratamento das pesquisas de nome por índice fonético

    ' número de pesquisas
    Dim loops As Integer

    fu_procura_cliente = False
    
    ' Realiza 4 pesquisas fonéticas seguidas ao cliente.
    ' Caso não encontre, permite cancelar ou prosseguir pesquisa.

    Do While loops% < 4

        If indice% < 3 Then
            indice% = indice% + 1
        Else
            If tipo_fonet% < 2 Then
                ' Se fonet_indices(1) = fonet_indices(2), não será
                ' necessário pesquisado fonet_indices(2)
                If Fonet_Indices(1) = Fonet_Indices(2) Then
                    ' verifica se fonet_indices(1) já foi pesquisado
                    If tipo_fonet% = 1 Then
                        fim_fonet% = True
                        Exit Do
                    
                    Else
                        tipo_fonet% = tipo_fonet% + 1
                    End If
                Else
                    tipo_fonet% = tipo_fonet% + 1
                End If
            End If
            indice% = 1
        End If

        Select Case tipo_fonet%
            Case 0
                n_idc$ = Fonet_Indices(0)   ' n_idc1$
            Case 1
                n_idc$ = Fonet_Indices(1)   ' n_idc2$
            Case 2
                n_idc$ = Fonet_Indices(2)   ' n_idc3$
        End Select
        
        ' se tipo_fonet = 2, seleciona linhas da tabela verificando n_idc3
        ' se indice     = 3, seleciona n_idc3 da fonetização do cliente
        '                    informado
        If indice% = 3 Then
            If tipo_fonet% = 2 Then
                fim_fonet% = True
                loops% = 4
            End If
        ElseIf indice% = 1 Then
            ' se tipo_fonet = 0, seleciona linhas da tabela verificando n_idc1
            ' se indice     = 3, seleciona n_idc1 da fonetização do cliente
            ' Se trata de clientes c/ nomes exatamente iguais ao informado
            If tipo_fonet% = 0 Then
                loops% = 4
            End If
        End If
        
        ' Após a fonetização, realiza a pesquisa do cliente através dos
        ' índices fonéticos encontrados.
        If Not fu_carrega_homonimo1() Then
            If Err_Syb <> 0 Or Msg_Syb <> 0 Then
                Screen.MousePointer = DEFAULT
                MsgBox "Não foi possível consultar Cliente.", , txt_msg$
                Exit Do
            End If
        Else
            fu_procura_cliente = True
            Exit Do
        End If
        
        loops% = loops% + 1
     
    Loop

End Function

Function fu_sel_osg_aut() As Integer

    ' seleciona dados do Objeto Segurado - Apólice Auto
    ' contador para array
    Dim i   As Integer

   fu_sel_osg_aut = False

    ' para cada proposta encontrada faz a pesquisa para
    ' obter outros dados que deverão compor o grid
    For i% = 0 To UBound(dad_apo)
        c_cia_ita$ = dad_apo(i%).c_cia_ita
        c_rmo$ = dad_apo(i%).c_rmo
        u_apo_pnc$ = dad_apo(i%).u_apo_pnc
        u_apo_dpd$ = dad_apo(i%).u_apo_dpd
        c_agr_fam_pro$ = dad_apo(i%).c_agr_fam_pro

        If dad_apo(i%).c_agr_fam_pro$ = "1" Then
            If acesso% <> 2 And acesso <> 3 Then     'Gabriela - 20/07/2001
                ' seleciona dados do objeto segurado para as apólices
                ' encontradas na tabela dbnprod..tb_osg_aut
                If Not fu_sel_osg_aut1(dad_apo(i%).c_isg) Then
                    Screen.MousePointer = DEFAULT
                    MsgBox "Dados do Objeto Segurado não encontrados.", , txt_msg$
                    'su_posiciona_foco R1FAB001.tb_u_prp
                    Exit Function
                End If
            End If  'Gabriela - 20/07/2001
        Else
            c_lin_aut$ = Empty
            c_mod_aut$ = Empty
            u_plc_aut$ = Empty
            c_fbr_aut$ = Empty
            e_pcd_aut$ = Empty
        End If
        
        If acesso% <> 2 And acesso <> 3 Then    'Gabriela - 20/07/2001
            ReDim Preserve dad_aut(0 To i%) As auto
            dad_aut(i%).c_lin_aut = c_lin_aut$
            dad_aut(i%).c_mod_aut = c_mod_aut$
            dad_aut(i%).u_plc_aut = u_plc_aut$
            dad_aut(i%).c_fbr_aut = c_fbr_aut$
            dad_aut(i%).e_pcd_aut = e_pcd_aut$
        End If  'Gabriela - 20/07/2001
    Next i%
    
    fu_sel_osg_aut = True

End Function

Function fu_sel_rmo_pro() As Integer

    ' seleciona nome do produto da apólice
    
    Dim ret As Integer
    
    On Error GoTo s00383
    
    fu_sel_rmo_pro = False

    ' inicializa stored procedure
    ret% = SQLRPCInit%(SqlConn%, "dbnapoio..pr_rmo_pro_s00383 ", 0)
    If ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_rmo_pro"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_pro", c_pro$, SQLINT2%) = FAIL Then Exit Function

    ' envia comandos
    ret% = SQLRPCSend%(SqlConn%)
    If ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_rmo_pro"
        Exit Function
    End If

    ' executa stored procedure
    ret% = SqlOk%(SqlConn%)
    If ret% = FAIL Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_rmo_pro"
        Exit Function
    End If

    ' verifica resultados
    ret% = SqlResults(SqlConn%)
    If ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_rmo_pro"
        Exit Function
    End If

    ' processa resultados
    Do Until ret% = NOMORERESULTS% Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)
        
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            n_pro$ = Trim$(SqlData(SqlConn%, 3))
            e_ptc_pes$ = Trim$(SqlData(SqlConn%, 48))
            c_agr_imp$ = Trim$(SqlData(SqlConn%, 49))
            e_fam_pro = Trim$(SqlData(SqlConn%, 27))
            fu_sel_rmo_pro = True
            ret% = SqlNextRow%(SqlConn%)
        Loop

        ret% = SqlResults%(SqlConn%)
    Loop

    If ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_rmo_pro"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_rmo_pro = False
    Exit Function

s00383:
    MsgBox "Erro na prs00383" 'Dilson 03/99
    Exit Function

End Function

Function fu_seleciona_corr_mot_ipd() As Integer

    ' seleciona dados necessários para exibir a 2a.tela (R1FAB002)
    ' e demais projetos chamados

    fu_seleciona_corr_mot_ipd = False
    
    ' verifica se retorno à 2a. tela (forms chamados) ou 1o. acesso (chamado
    ' pelo 1o. form - R1FAB001)
    If volta% = False Then
        
        ' seleciona dados do corretor
        'If Not fu_seleciona_cor() Then  02/03/1998
        If Not fu_seleciona_cvd_pnc() Then
            MsgBox "Não foi possível carregar os dados do Corretor.", , txt_msg$
            Exit Function
        
        ' seleciona nome do corretor
        ElseIf Not fu_sel_cvd() Then
            MsgBox "Não foi possível carregar o nome do Corretor.", , txt_msg$
            Exit Function
    
        ' seleciona motivo de impedimento do aditamento
        ElseIf Not fu_seleciona_motivo() Then
            MsgBox "Não foi possível carregar Motivo de Impedimento.", , txt_msg$
            Exit Function
        
        Else
            
            'Verifica se existe impedimento para aditamento da apolice
            Select Case c_mot_ipd_adi$
                Case Is = Empty
                    c_mot_ipd_adi$ = " NÃO HÁ IMPEDIMENTO"
                Case Is = "1"
                    c_mot_ipd_adi$ = " APÓLICE CANCELADA"
                Case Is = "2"
                    c_mot_ipd_adi$ = " ADITAMENTO PENDENTE"
                Case Is = "3"
                    c_mot_ipd_adi$ = " ATRASO DE PAGAMENTO"
                Case Is = "5"
                    c_mot_ipd_adi$ = " PRODUÇÃO NÃO BANCO"   'VERSÃO(64) - 25/09/2000 - LUCIMARA
            End Select
            
        End If

    End If

    fu_seleciona_corr_mot_ipd = True

End Function

Function fu_seleciona_cvd_pnc() As Integer

    ' retorno de funções
    Dim ret As Integer
    
    fu_seleciona_cvd_pnc = False

    ' inicializa stored procedure
    ret% = SQLRPCInit(SqlConn%, "dbnprod..pr_his_ptc_cvd_s07130", 0)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_seleciona_cvd_pnc"
        Exit Function
    End If
      
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    ret% = SQLRPCSend%(SqlConn%)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_seleciona_cvd_pnc"
        Exit Function
    End If
  
    ' executa stored procedure
    ret% = SqlOk%(SqlConn%)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_seleciona_cvd_pnc"
        Exit Function
    End If
  
    ' verifica resultados
    ret% = SqlResults%(SqlConn%)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_seleciona_cvd_pnc"
        Exit Function
    End If

    ' processa resultados
    Do Until ret% = NOMORERESULTS% Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            e_cvd_prp$ = SqlData(SqlConn%, 1)
            u_rgt_ssp_prp$ = SqlData(SqlConn%, 2)
            u_dco_rgt_ssp_prp$ = SqlData(SqlConn%, 3)
            c_loc_pgt_cvd_prp$ = SqlData(SqlConn%, 4)
            c_und_cvd_prp$ = SqlData(SqlConn%, 5) ''minitir - ss_199801 - 21/03/2012
            fu_seleciona_cvd_pnc = True
            ret% = SqlNextRow%(SqlConn%)
        Loop

        ret% = SqlResults%(SqlConn%)
    Loop

    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_seleciona_cvd_pnc"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_seleciona_cvd_pnc = False

End Function

Function fu_seleciona_e_rct_prp(Codigo As Integer, Codigo01 As Integer, c_cee_etd As String) As String
    ' Seleciona o texto a ser exibido na 2a. tela do consulta,
    ' correspondente ao campo Canal de Recepção
    
    fu_seleciona_e_rct_prp = FU_PR_CANAL_RECEPCAO_S13967(CStr(Codigo), CStr(Codigo01), c_cph, c_cee_etd)
        
    If c_cph$ <> Empty Then
       R1FAB002.bu3d_Campanha.Visible = True
       su_habilita_botao R1FAB002.bu3d_Campanha, True
    Else
       R1FAB002.bu3d_Campanha.Visible = False
       su_habilita_botao R1FAB002.bu3d_Campanha, False
    End If
    
    Exit Function

' FUNCAO ANTIGA
'''    Select Case Codigo% 'e_rct_prp
'''    'Alberto, inclusão dos canais 10 e 20 em 28/08/2000
'''        Case 10
'''            Texto$ = "Banco Internet"
'''        Case 11
'''            Texto$ = "Banco Estação Administrativa"
'''        Case 12
'''            Texto$ = "Banco On-Line"
'''        Case 13
'''            Texto$ = "Banco Renovação Automática Batch"
'''        Case 14
'''            Texto$ = "Banco Renovação On-Line"
'''        Case 15
'''            Texto$ = "Banco Renovação Automática - N.A."
'''        Case 16
'''            Texto$ = "Aditamento Automático - Banco"
'''        Case 17
'''            Texto$ = "Banco Renovação Automática - N.A."
'''        Case 19
'''            Texto$ = "Banco Digitação Externa"
'''        Case 20
'''            Texto$ = "Corretor Internet"
'''        Case 21
'''            Texto$ = "Corretor Kit-Batch"
'''        Case 22
'''            Texto$ = "Corretor On-Line"
'''        Case 23
'''            Texto$ = "Corretor Digitação Externa Batch"
'''        Case 24
'''            Texto$ = "Corretor Renovação Automática Batch"
'''        Case 25
'''            Texto$ = "Aditamento Automático - Corretor"
'''        Case 26
'''            Texto$ = "Kit-Emissão"
'''        Case 27
'''            Texto$ = "Corretor Renovação Automática - N.A."
'''        Case 31
'''            Texto$ = "Aditamento Automático"
'''    End Select
'''
'''    If Codigo01% = 2 Then   'e_mcl_vda
'''        Texto$ = Texto$ & "  /  Venda Direta"
'''    ElseIf Codigo01% = 3 Then
'''        Texto$ = Texto$ & "  /  Venda Itauseg"
'''    ElseIf Codigo01% = 4 Then
'''        Texto$ = "Venda Internet - ItauMotors"
'''    'Adriana - 14/09/2001 - Bankfone/Bankline - Início
'''    ElseIf Codigo01% = 5 Then
'''        Texto$ = Texto$ & " / Bankfone"
'''    ElseIf Codigo01% = 6 Then
'''        Texto$ = Texto$ & " / Bankline"
'''    'Adriana - 14/09/2001 - Bankfone/Bankline - Fim
'''
'''    ' Patrick - 17/06/2002
'''    ElseIf Codigo01% = 7 Then
'''        Texto$ = "Ação de Retenção Receptivo"
'''    ' Patrick - 02/05/2003
'''    ElseIf Codigo01% = 9 Then
'''        Texto$ = "Aditamento Call Center Clientes"
'''    ElseIf Codigo01% = 10 Then
'''        Texto$ = "ItauCred"
'''    ElseIf Codigo01% = 11 Then  'Stael 14/10/2003
'''        Texto$ = "Aditamento Call Center Corretores"
'''    End If
'''
'''
'''    'If dad_adi(0).E_Mcl_Vda = 2 Then
'''    '    texto$ = texto$ & "  /  Venda Direta"
'''    'ElseIf dad_adi(0).E_Mcl_Vda = 3 Then
'''    '    texto$ = texto$ & "  /  Venda Itauseg"
'''    'ElseIf dad_adi(0).E_Mcl_Vda = 4 Then
'''    '    texto$ = "Venda Internet - ItauMotors"
'''    ''Adriana - 14/09/2001 - Bankfone/Bankline - Início
'''    'ElseIf dad_adi(0).E_Mcl_Vda = 5 Then
'''    '    texto$ = texto$ & " / Bankfone"
'''    'ElseIf dad_adi(0).E_Mcl_Vda = 6 Then
'''    '    texto$ = texto$ & " / Bankline"
'''    ''Adriana - 14/09/2001 - Bankfone/Bankline - Fim
'''    'End If
'''
'''    If c_cph$ <> Empty Then
'''        If Codigo% < 20 Then ' É banco
'''            fu_seleciona_e_rct_prp = " Campanha - Banco"
'''        Else 'Corretor
'''            fu_seleciona_e_rct_prp = " Campanha - Corretor"
'''            'fu_seleciona_e_rct_prp = texto$ & "  /  Campanha "
'''        End If
'''
'''        R1FAB002.bu3d_Campanha.Visible = True
'''        su_habilita_botao R1FAB002.bu3d_Campanha, True
'''
''''        Su_Carrega_Campanha 'Carrega dados do grid no form11
'''
'''    Else
'''       fu_seleciona_e_rct_prp = Texto$
'''
'''       R1FAB002.bu3d_Campanha.Visible = False
'''       su_habilita_botao R1FAB002.bu3d_Campanha, False
'''
'''    End If
End Function

Function fu_seleciona_referencia_conta()
    
    Dim c_err         As Integer
    Dim n_linhas      As Integer

    'Habilitação da rotina de tratamento de erro.
    On Error GoTo TrataErroS11670

    'Inicialização da função com valor False.
    fu_seleciona_referencia_conta = False

    'Inicialização dos códigos de erro
    'da DBLibrary e do SQL Server.
    Err_Syb& = 0
    Msg_Syb& = 0
    d_ano_mes_ref$ = ""

    'Inicialização da stored procedure.
    ret% = SQLRPCInit%(SqlConn%, "DBNTRANS..PR_ADI_S11670", 0)

    If ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_ADI_S11670.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Parâmetro(s) da stored procedure.
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_adi", U_VRS_ADI$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@error", 0, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT4%) = FAIL Then Exit Function

    'Envio da lista de parâmetros ao servidor para ser executada.
    ret% = SQLRPCSend%(SqlConn%)

    If ret% = FAIL Then
        MsgBox "Não foi possível enviar a lista de parâmetros da stored procedure PR_ADI_S11670 ao servidor.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Verificação da exatidão dos comandos no command buffer.
    ret% = SqlOk%(SqlConn%)

    If ret% = FAIL Then
        MsgBox "Não foi possível executar a stored procedure PR_ADI_S11670.", MB_ICONEXCLAMATION
        Exit Function
    End If

    ret% = SqlResults%(SqlConn%)

    'Processamento dos resultados da stored procedure.
    Do Until ret% = NOMORERESULTS Or ret% = FAIL

        ret% = SqlNextRow%(SqlConn%)

        'Recuperação e processamento dos dados em cada linha.
        Do Until ret% = NOMOREROWS Or ret% = FAIL

            d_ano_mes_ref$ = Trim$(SqlData$(SqlConn%, 62))

            ret% = SqlNextRow%(SqlConn%)

        Loop

        ret% = SqlResults%(SqlConn%)

    Loop

    If ret% = FAIL Then
        MsgBox "Não foi possível processar os resultados da stored procedure PR_ADI_S11670.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Erro da DBLibrary ou do SQL Server.
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Then Exit Function

    'Recuperação do código do erro na variável local.
    c_err% = Val(SqlRetData$(SqlConn%, 1))

    'O parâmetro OUTPUT da stored procedure indica ocorrência de erro.
    If c_err% <> 0 Then
        'Exibição da mensagem de erro ao usuário.
        MsgBox "Erro na stored procedure PR_ADI_S11670: parâmetro @error = " & Trim$(Str$(c_err%)) & ".", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Armazenamento do nº de linhas afetadas
    'pelo comando na variável local.
    n_linhas% = Val(SqlRetData$(SqlConn%, 2))

    'O parâmetro OUTPUT da stored procedure indica
    'que nenhuma linha foi afetada pelo comando.
    If n_linhas% = 0 Then
        'Exibição da mensagem de erro ao usuário.
        MsgBox "A stored procedure PR_ADI_S11670 não afetou linhas.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'A função retorna valor True.
    fu_seleciona_referencia_conta = True

    Exit Function

'Rotina de tratamento de erro.
TrataErroS11670:

    MsgBox "Erro na function FU_PR_ADI_S11670: #" & Err & " - " & error$(Err) & ".", MB_ICONEXCLAMATION
    Exit Function
    
End Function

Function FU_VERIFICA_APO(Formulario As Form) As Integer
    
    'Carrega os dados da tabela de apólice
    ' retorno de funções
    Dim ret As Integer
    
    FU_VERIFICA_APO = False
    
    ' inicializa stored procedure
    ret% = SQLRPCInit(SqlConn%, "DBNPROD..pr_apo_s02232", 0)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "FU_VERIFICA_APO"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", Formulario.tb_c_cia_ita_ant.Text, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", Formulario.lb_c_rmo_ant.Caption, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", Formulario.tb_u_apo_pnc_ant.Text, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", Formulario.lb_u_apo_dpd_ant.Caption, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    ret% = SQLRPCSend%(SqlConn%)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "FU_VERIFICA_APO"
        Exit Function
    End If
    
    ' executa stored procedure
    ret% = SqlOk%(SqlConn%)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "FU_VERIFICA_APO"
        Exit Function
    End If
    
    ' verifica resultados
    ret% = SqlResults%(SqlConn%)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "FU_VERIFICA_APO"
        Exit Function
    End If

   ' processa resultados
    Do Until ret% = NOMORERESULTS% Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)
        
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            
            FU_VERIFICA_APO = True

            ret% = SqlNextRow%(SqlConn%)
        Loop

        ret% = SqlResults%(SqlConn%)
    Loop

    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "FU_VERIFICA_APO"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then FU_VERIFICA_APO = False

End Function

Sub Su_Carrega_Campanha()

    If Not FU_PR_CPH_MKT_S10221() Then
        MsgBox "Não foi possível carregar os dados da campanha.", MB_ICONEXCLAMATION
        Exit Sub
    End If
    
    'Formatar grid
    With R1FAB011.gr_fun_cph
        .Cols = 5
        .TextMatrix(0, 0) = "Figura"
        .TextMatrix(0, 1) = "Código"
        .TextMatrix(0, 2) = "Banco"
        .TextMatrix(0, 3) = "Agência"
        .TextMatrix(0, 4) = "Remuneração"
        .ColWidth(0) = 2350
        .ColWidth(1) = 1800
        .ColWidth(2) = 1200
        .ColWidth(3) = 1200
        .ColWidth(4) = 1250
        .ColAlignment(0) = 0
        .ColAlignment(1) = 1
        .ColAlignment(2) = 1
        .ColAlignment(3) = 1
        .ColAlignment(4) = 2
        .Rows = 1
    End With

    If Not FU_PR_ADI_FUN_S10438() Then
        R1FAB011.fr3d_fun_cph.Visible = False
    Else
        R1FAB011.fr3d_fun_cph.Visible = True
    End If
    
End Sub

Function fu_separa_param1(parametro As String) As Integer
    
    ' recebe parâmetros de outro projeto
    ' contador arrays
    Dim i       As Integer
    
    ' início da pesquisa de cada parâmetro
    Dim Inicio  As Integer

    ' indica fim de cada parâmetro
    Dim Fim     As Integer

    ' tipo de chamada do projeto
    Dim Tipo    As String

    'Coloca os parâmetros na área de transferência
    Clipboard.Clear
    Clipboard.SetText parametro$

    ' indica pesquisa de apólice Auto
    ModoPesquisa% = False

    Static param_ret(6)

    fu_separa_param1 = True
    
    Tipo$ = Mid$(parametro$, 2, 5)
   
    If Tipo$ = "/CLI:" Then
        ModoPesquisa% = 3
        c_agr_fam_pro$ = 1
        
        Inicio = InStr(1, parametro$, ",")
        
        R1FAB001.tb_n_pes.Text = Trim(Mid$(parametro$, 7, Inicio - 1))
        
        If Mid$(parametro$, Inicio + 1, 1) = "1" Then
            R1FAB001.op3d_e_pes.Value = True
            R1FAB001.op3d_e_pesj.Value = False
        Else
            R1FAB001.op3d_e_pes.Value = False
            R1FAB001.op3d_e_pesj.Value = True
        End If
    
    ElseIf Tipo$ = "/PRP:" Then
        ModoPesquisa% = 4
        c_agr_fam_pro$ = 1
        
        R1FAB001.tb_u_prp.Text = Trim(Mid$(parametro$, 7, Len(Trim(parametro$)) - 6))
    
    ElseIf Tipo$ = "/CHS:" Then
        ModoPesquisa% = 5
        c_agr_fam_pro$ = 1
        
        R1FAB001.tb_u_chs_aut.Text = Trim(Mid$(parametro$, 7, Len(Trim(parametro$)) - 6))
        
    ElseIf Tipo$ = "/PLC:" Then
        ModoPesquisa% = 6
        c_agr_fam_pro$ = 1
        
        R1FAB001.tb_u_plc_aut.Text = Trim(Mid$(parametro$, 7, Len(Trim(parametro$)) - 6))
        
    
    ElseIf Tipo$ = "/SEG:" Then
        ModoPesquisa% = 2
        n_pes$ = Mid$(parametro$, 6)
        
    ElseIf Tipo$ = "/APO:" Then
        ModoPesquisa% = 1
        parametro$ = Mid$(parametro$, 7)

        For i% = 0 To 7
            Inicio% = Fim% + 1
            Fim% = InStr(Inicio%, parametro$, ",")
            If Fim% = 0 Then
                Fim% = Len(parametro$) + 1
            End If
            If Fim% < Inicio% Then
                Exit For
            End If
            param_ret(i%) = Trim$(Mid$(parametro$, Inicio%, Fim% - Inicio%))
        Next i%

        For i% = 0 To 6
            If param_ret(i%) = Empty Then
               fu_separa_param1 = False
               Exit Function
            End If
        Next i%

        c_cia_ita$ = Trim$(param_ret(0))
        c_rmo$ = Trim$(param_ret(1))
        u_apo_pnc$ = Trim$(param_ret(2))
        u_apo_dpd$ = Trim$(param_ret(3))
        sg_shell$ = Trim$(param_ret(4))
        c_agr_fam_pro$ = Trim$(param_ret(5))
        e_fam_pro$ = Trim$(param_ret(6))
        
    ElseIf Tipo$ = "/CCK:" Then
        'Dilson - call center corretor - 30/12/2002
        ModoPesquisa% = 7
        parametro$ = Mid$(parametro$, 7)

        For i% = 0 To 2
            Inicio% = Fim% + 1
            Fim% = InStr(Inicio%, parametro$, ",")
            If Fim% = 0 Then
                Fim% = Len(parametro$) + 1
            End If
            If Fim% < Inicio% Then
                Exit For
            End If
            param_ret(i%) = Trim$(Mid$(parametro$, Inicio%, Fim% - Inicio%))
        Next i%

        For i% = 0 To 1
            If param_ret(i%) = Empty Then
               fu_separa_param1 = False
               Exit Function
            End If
        Next i%

        c_agr_fam_pro$ = Trim$(param_ret(0))
        R1FAB001.tb_u_prp.Text = Trim$(param_ret(1))
        cck_d_prt_cga$ = Trim$(param_ret(2))
        CALL_CENTER_CORRETOR = True
    
    ElseIf Tipo$ = "/ITEM" Then 'Call Center irá acessar tela de consulta de item/aditamento
    
        ModoPesquisa% = 8
        
        For i% = 0 To 5
            Inicio% = Fim% + 1
            Fim% = InStr(Inicio%, parametro$, ",")
            If Fim% = 0 Then
                Fim% = Len(parametro$) + 1
            End If
            If Fim% < Inicio% Then
                Exit For
            End If
            param_ret(i%) = Trim$(Mid$(parametro$, Inicio%, Fim% - Inicio%))
        Next i%

        For i% = 0 To 5
            If param_ret(i%) = Empty Then
               fu_separa_param1 = False
               Exit Function
            End If
        Next i%
        
        u_apo_pnc$ = Trim$(param_ret(1))
        u_apo_dpd$ = Trim$(param_ret(2))
        n_pes$ = Trim$(param_ret(3))
        c_cia_ita$ = Trim$(param_ret(4))
        c_rmo$ = Trim$(param_ret(5))
        
    Else
        ' recebe como parâmetro família e agrupamento
        For i% = 0 To 4
            Inicio% = Fim% + 1
            Fim% = InStr(Inicio%, parametro$, ",")
            If Fim% = 0 Then
                Fim% = Len(parametro$) + 1
            End If
            If Fim% < Inicio% Then
                Exit For
            End If
            param_ret(i%) = Trim$(Mid$(parametro$, Inicio%, Fim% - Inicio%))
        Next i%

        For i% = 0 To 2
            If param_ret(i%) = Empty Then
               fu_separa_param1 = False
               Exit Function
            End If
        Next i%

        c_agr_fam_pro$ = Trim$(param_ret(0))
        e_fam_pro$ = Trim$(param_ret(1))
        c_pro$ = Trim$(param_ret(2))
        n_apl_chm$ = Trim$(param_ret(3))
        str_Fam_Pro$ = Trim$(param_ret(3))
    End If

End Function

Function fu_trata_dados_arq() As Integer
    
    ' seleciona dados da apólice a serem gravados
    ' no arquivo
    
500    Dim i     As Integer
    
501    fu_trata_dados_arq = False

502    On Error GoTo ERRO_2
    
    ' Se flag = true -> os dados devem ser pesquisados novamente (foi
    '                   informado outro aditamento)
503    If Flag% Then
        ' AUTO
504        If Val(c_agr_fam_pro$) = 1 Then
            'Daniela - 05/06/98 - Inclusão do IF.
            'Cláudia - 11/11/98 - Inibido tratamento do form7 conforme conversa c/ Lina e Olindo
            'If FORM7_ATIVADO = False Then
                ' seleciona dados do item segurado da apólice para
                ' um determinado aditamento
505                If Not fu_sel_his_isg_apo2() Then
506                    Screen.MousePointer = DEFAULT
507                    MsgBox "Item Segurado não encontrado.", , txt_msg$
508                    Exit Function
509                End If
            
                ' seleciona dados do item segurado (aut) referente a
                ' um aditamento
510                If Not fu_sel_his_isg_aut() Then
511                    Screen.MousePointer = DEFAULT
512                    MsgBox "Problema ao consultar dados do Item Segurado.", , txt_msg$
513                    Exit Function
514                End If
            'Cláudia - 11/11/98 - Inibido tratamento do form7 conforme conversa c/ Lina e Olindo
            'Else
                'Daniela - 05/06/98 - Inclusão da chamada da stproc prs07462
            '    If Not fu_his_isg_s07462() Then
            '        Screen.MousePointer = DEFAULT
            '        MsgBox "Problema ao consultar dados do Item Segurado / STPROC PRS07462.", , txt_msg$
            '        Exit Function
            '    End If
            'End If
            
            ' Adriana 08/02/2001 - FIPE
            ' Se não existir origem/configuração, seleciona as descricões antigas do veículo
            ' senão seleciona a descrição da FIPE
            If c_ori_ctc$ = Empty And c_cfg$ = Empty Then
                            
                ' Pesquisa nome do Fabricante do Automóvel
515                If Not fu_sel_fbr_aut() Then
516                    MsgBox "Não foi possível pesquisar o Fabricante.", MB_ICONEXCLAMATION, "R1FAB101"
517                    SU_Saida
518                End If
                
                ' Pesquisa Linha do Automóvel
519                If Not fu_sel_lin_aut() Then
520                    MsgBox "Não foi possível pesquisar a Linha do Automóvel.", MB_ICONEXCLAMATION, "R1FAB101"
521                    SU_Saida
522                End If
                
                ' Pesquisa Modelo do Automóvel
523                If Not fu_sel_mod_aut() Then
524                    MsgBox "Não foi possível pesquisar o Modelo do Automóvel.", MB_ICONEXCLAMATION, "R1FAB101"
525                    SU_Saida
526                End If

                'Limpar a variável que armazena a descrição e o código da FIPE
527             T_Cfg_Ori_Ctc = Empty

528         Else
                
                ' Pesquisa a descrição FIPE do Automóvel
529             Su_Sel_Cfg      ' Busca Configuração do Veículo - Fipe
530             Fu_Prm_Aut_Pro  ' Busca Indicador de Referência - Fipe
                                
531         End If
            
532        End If
           
         ' verifica dados do Item Segurado de acordo com o aditamento
533         For i% = 0 To UBound(dad_isg)
534            If Val(dad_isg(i%).u_adi) = Val(u_adi$) And Val(dad_isg(i%).U_VRS_ADI) = Val(U_VRS_ADI$) Then
535                  c_seg_reg$ = dad_isg(i%).c_seg_reg
536                  t_isg$ = dad_isg(i%).t_isg
537                  c_reg_utl$ = dad_isg(i%).c_reg_utl
538                  q_moe_vba@ = dad_isg(i%).q_moe_vba
539                  c_isg$ = dad_isg(i%).c_isg
540                  c_osg$ = dad_isg(i%).c_osg
541                  e_osg$ = dad_isg(i%).e_osg
542                  u_vrs_osg$ = dad_isg(i%).u_vrs_osg
543                  Exit For
            
544            ElseIf Val(dad_isg(i%).u_adi) > Val(u_adi$) Or UBound(dad_isg) = i% Then
                'Suzuki 23/12/97
                ' seleciona dados do item segurado da apólice
545                If Not fu_sel_his_isg_apo4() Then
546                    MsgBox "Não foi possível carregar os dados do Item Segurado da Apólice.", , txt_msg$
547                    Exit Function
548                End If
549                Exit For
550            End If
         
551         Next i%
        
552        Flag% = False
553    End If
    
554    fu_trata_dados_arq = True

555   Exit Function

556 ERRO_2:
557    MsgBox Err & " " & error & " " & Erl
558    Screen.MousePointer = DEFAULT
559    Exit Function
    
End Function

Function FU_Verif_item_clausula(c_isg As String) As Integer
   
   Dim i As Integer

   FU_Verif_item_clausula = False
      
   For i% = 0 To UBound(dad_cla_apo)
      If dad_cla_apo(i%).c_isg = c_isg Then
         FU_Verif_item_clausula = True
      End If
   Next

End Function

Sub GetTwipsPerPixel()
    
    Dim NumPix As Integer
    
    ' Set a global variable with the Twips to Pixel ratio.
    R1FAB006.ScaleMode = 3
    NumPix = R1FAB006.ScaleHeight
    R1FAB006.ScaleMode = 1
    TwipsPerPixel = Printer.ScaleHeight / NumPix

End Sub

Sub GrabScreen()
    ' rotina disponível no
    ' Visual Basic Knowledge Base
    '  Seção Graphics
    '  Artigo "How to Copy Entire Screen into a Picture Box in VB for Windows"

    Dim winSize As lRECT
    
    Dim hwndSrc As Long
    Dim hSrcDC  As Long
    Dim xSrc    As Long
    Dim ySrc    As Long
    Dim nWidth   As Long
    Dim nHeight As Long
    Dim hDestDC%, X%, Y%
    Dim dwRop&, Suc%, Dmy%

    ' Assign information of the source bitmap.
    ' Note that BitBlt requires coordinates in pixels.

    hwndSrc = FU_GetDesktopWindow()
    hSrcDC = FU_GetDC((hwndSrc))
    xSrc = 0: ySrc = 0

    If FU_GetWindowRect((hwndSrc), winSize) = False Then
        MsgBox "Erro na função (Fu_GetWindowRect), favor entrar em contato com analista responsável.", 48
        ind_erro% = True
        Exit Sub
    End If

    nWidth = winSize.Right             ' Units in pixels.

    nHeight = winSize.Bottom           ' Units in pixels.

    ' Assign informate of the destination bitmap.
    hDestDC = R1FAB006.pi_imp_tla.hdc
    X% = 0: Y% = 0

    ' Set global variable TwipsPerPixel and use to set
    ' picture box to same size as screen being grabbed.
    ' If picture box not the same size as picture being
    ' BitBlt'ed to it, it will chop off all that does not
    ' fit in the picture box.
    GetTwipsPerPixel
    R1FAB006.pi_imp_tla.Top = 0
    R1FAB006.pi_imp_tla.Left = 0
    R1FAB006.pi_imp_tla.Width = (nWidth + 1) * TwipsPerPixel
    R1FAB006.pi_imp_tla.Height = (nHeight + 1) * TwipsPerPixel

    ' Assign the value of the constant SRCOPYY to the Raster operation.

    dwRop& = &HCC0020

    ' Note function call must be on one line:
    Suc% = FU_BitBlt((hDestDC%), (X%), (Y%), (nWidth), (nHeight), (hSrcDC), (xSrc), (ySrc), dwRop&)

    ' Release the DeskTopWindow's hDC to Windows.
    ' Windows may hang if this is not done.
    Dmy% = FU_ReleaseDC((hwndSrc), (hSrcDC))

    'Make the picture box visible.
    R1FAB006.pi_imp_tla.Visible = True

End Sub


Private Sub GrabScreen2()
' rotina disponível no
' Visual Basic Knowledge Base
'  Seção Graphics
'  Artigo "How to Copy Entire Screen into a Picture Box in VB for Windows"

    Dim winSize As lRECT
    Dim hwndSrc As Long
    Dim hSrcDC As Long
    Dim xSrc As Long
    Dim ySrc As Long
    Dim nWidth As Long
    Dim nHeight As Long
    Dim hDestDC As Long
    Dim X As Long
    Dim Y As Long
    Dim dwRop As Long
    Dim Suc As Long
    Dim Dmy As Long
    Dim ret As Long

    ' Assign information of the source bitmap.
    ' Note that FU_BitBlt requires coordinates in pixels.
    hwndSrc = FU_GetDesktopWindow()
    hSrcDC = FU_GetDC((hwndSrc))
    xSrc = 0
    ySrc = 0
    ret = FU_GetWindowRect((hwndSrc), winSize)
    nWidth = winSize.Right             ' Units in pixels.

    nHeight = winSize.Bottom           ' Units in pixels.

    ' Assign informate of the destination bitmap.
    hDestDC = R1FAB006.pi_imp_tla.hdc
    X = 0
    Y = 0

    ' Set global variable TwipsPerPixel and use to set
    ' picture box to same size as screen being grabbed.
    ' If picture box not the same size as picture being
    ' FU_BitBlt'ed to it, it will chop off all that does not
    ' fit in the picture box.
    GetTwipsPerPixel
    R1FAB006.pi_imp_tla.Top = 0
    R1FAB006.pi_imp_tla.Left = 0
    R1FAB006.pi_imp_tla.Width = (nWidth + 1) * TwipsPerPixel
    R1FAB006.pi_imp_tla.Height = (nHeight + 1) * TwipsPerPixel

    ' Assign the value of the constant SRCOPYY to the Raster operation.

    dwRop = &HCC0020
    'Pereira Homologação TS - Substituição da função para impressão de tela.
    FU_StretchBlt R1FAB006.pi_imp_tla.hdc, X, Y, nWidth, nHeight, hSrcDC, xSrc, ySrc, winSize.Right, winSize.Bottom, dwRop
    
    ' Note function call must be on one line:
    ''''Suc = FU_BitBlt((hDestDC), (x), (y), (nWidth), (nHeight), (hSrcDC), (xSrc), (ySrc), (dwRop))

    ' Release the DeskTopWindow's hDC to Windows.
    ' Windows may hang if this is not done.
    Dmy = FU_ReleaseDC((hwndSrc), (hSrcDC))

    'Make the picture box visible.
    R1FAB006.pi_imp_tla.Visible = True

End Sub


Sub su_carrega_apolice()
    
    ' carrega os dados da apólice no grid

    Dim i       As Integer
    Dim Status  As Integer

    R1FAB001.gr_apo.Row = 0
    
    ' verifica agrupamento da família
    'If Val(c_agr_fam_pro$) = 1 Then ' AUTO
      For i% = 0 To UBound(dad_apo)
          R1FAB001.fr3d_Segurado.Visible = False
          R1FAB001.fr3d_Homonimo.Visible = False
          R1FAB001.fr3d_Apolices.Visible = True
          R1FAB001.gr_apo.Enabled = True
          
          If i% >= 1 Then
              R1FAB001.gr_apo.Rows = R1FAB001.gr_apo.Rows + 1
          End If
          
          R1FAB001.gr_apo.Row = R1FAB001.gr_apo.Row + 1
          R1FAB001.gr_apo.Col = 0
          
          R1FAB001.gr_apo.Row = i% + 1
          
          '
          'PAULO - 15/12/2000 - GRALHA AZUL
          R1FAB001.gr_apo.Text = Format$(dad_apo(i%).c_cia_ita, "00") & "." & _
                    Format$(dad_apo(i%).c_rmo, "00") & "." & _
                    dad_apo(i%).u_apo_pnc & "." & _
                    Format$(dad_apo(i%).u_apo_dpd, "0") & "." & _
                    Format$(dad_apo(i%).c_isg, "0000000") & " / " & _
                    Trim$(dad_apo(i%).n_pro)
          
          R1FAB001.gr_apo.Col = 1   '5
          R1FAB001.gr_apo.Text = Format$(dad_apo(i%).d_ini_vig_apo, "dd/mm/yyyy") & " à " & Format$(dad_apo(i%).d_fim_vig_apo, "dd/mm/yyyy")

          If dad_apo(i%).c_agr_fam_pro = "1" Then
             R1FAB001.gr_apo.ColWidth(0) = 3350 'Volta a largura do grid para o tamanho original (pereira 18/08/2003)
             R1FAB001.gr_apo.Col = 2    '1
             R1FAB001.gr_apo.Text = Trim$(dad_aut(i%).n_fbr_aut)
             
             R1FAB001.gr_apo.Col = 3     '2
             R1FAB001.gr_apo.Text = Trim$(dad_aut(i%).n_lin_aut)
             
             R1FAB001.gr_apo.Col = 4
             R1FAB001.gr_apo.Text = Trim$(dad_aut(i%).n_mod_aut)
             
             R1FAB001.gr_apo.Col = 5
             R1FAB001.gr_apo.Text = Trim$(dad_aut(i%).u_plc_aut)
          
          Else
             R1FAB001.gr_apo.ColWidth(0) = 4300 'Aumenta a largura do grid para caber a descrição do produto (pereira 18/08/2003)
             
             R1FAB001.gr_apo.Col = 2
             R1FAB001.gr_apo.Text = Empty
             
             R1FAB001.gr_apo.Col = 3
             R1FAB001.gr_apo.Text = Empty
             
             R1FAB001.gr_apo.Col = 4
             R1FAB001.gr_apo.Text = Empty
             
             R1FAB001.gr_apo.Col = 5
             R1FAB001.gr_apo.Text = Empty

          End If
      Next i%

    R1FAB001.gr_apo.Row = 1
    R1FAB001.gr_apo.Col = 0
    
    If Trim$(R1FAB001.gr_apo.Text) = Empty Then
        Screen.MousePointer = DEFAULT
        MsgBox "Não possui Apólices."
    Else
        ' seleciona os campos que serão preenchidos acima do grid
        Select Case acesso%

            Case 1  ' pesquisa por nome do segurado
                ' campos exibidos se RPM
                R1FAB001.lb_gr_c_uf1.Visible = False
                R1FAB001.lb_gr_c_uf2.Visible = False
                R1FAB001.lb_gr_u_lgd1.Visible = False
                R1FAB001.lb_gr_u_lgd2.Visible = False
                R1FAB001.lb_gr_cep1.Visible = False
                R1FAB001.lb_gr_cep2.Visible = False
                
                R1FAB001.lb_por_familia1.Caption = "Segurado"
                R1FAB001.lb_por_familia2.Width = 5265
                R1FAB001.lb_por_familia2.Caption = " " & Trim$(n_pes$)
                
                
            Case 4  ' pesquisa por número de proposta
                ' campos exibidos se RPM
                R1FAB001.lb_gr_c_uf1.Visible = False
                R1FAB001.lb_gr_c_uf2.Visible = False
                R1FAB001.lb_gr_u_lgd1.Visible = False
                R1FAB001.lb_gr_u_lgd2.Visible = False
                R1FAB001.lb_gr_cep1.Visible = False
                R1FAB001.lb_gr_cep2.Visible = False
            
                ' 1 - AUTO    4 - VIDA
                'If Val(c_agr_fam_pro$) = 1 Or Val(c_agr_fam_pro$) = 4 Then
                    R1FAB001.lb_por_familia1.Caption = "Proposta"
                    R1FAB001.lb_por_familia2.Width = 1200
                    R1FAB001.lb_por_familia2.Caption = Trim$(u_prp$)

                'End If
                
            
            Case 5  ' pesquisa por Cidade + Estado + Cep + Logradouro
                ' campos exibidos se RPM
                R1FAB001.lb_gr_c_uf1.Visible = True
                R1FAB001.lb_gr_c_uf2.Visible = True
                R1FAB001.lb_gr_u_lgd1.Visible = True
                R1FAB001.lb_gr_u_lgd2.Visible = True
                R1FAB001.lb_gr_cep1.Visible = True
                R1FAB001.lb_gr_cep2.Visible = True
                
                ' 3 - RPM
                R1FAB001.lb_por_familia1.Caption = "Cidade"
                R1FAB001.lb_por_familia2.Caption = " " & Trim$(n_cdd$)
                R1FAB001.lb_por_familia2.Width = 5265
                R1FAB001.lb_gr_c_uf2.Caption = Trim$(n_uf$)
                R1FAB001.lb_gr_cep2.Caption = Mid$(c_cep$, 1, 5) & "-" & Mid$(c_cep$, 6, 8)
                R1FAB001.lb_gr_u_lgd2.Caption = u_lgd$
            
            Case 8  ' pesquisa por titulo
                ' campos exibidos se RPM
                R1FAB001.lb_gr_c_uf1.Visible = False
                R1FAB001.lb_gr_c_uf2.Visible = False
                R1FAB001.lb_gr_u_lgd1.Visible = False
                R1FAB001.lb_gr_u_lgd2.Visible = False
                R1FAB001.lb_gr_cep1.Visible = False
                R1FAB001.lb_gr_cep2.Visible = False
                
                R1FAB001.lb_por_familia1.Caption = "Nº do Sorteio"
                R1FAB001.lb_por_familia2.Width = 1200
                R1FAB001.lb_por_familia2.Caption = " " & Trim$(u_cbn_sor$)
                
             Case 9, 10 ' pesquisa por Sav
                ' campos exibidos se RPM
                R1FAB001.lb_gr_c_uf1.Visible = False
                R1FAB001.lb_gr_c_uf2.Visible = False
                R1FAB001.lb_gr_u_lgd1.Visible = False
                R1FAB001.lb_gr_u_lgd2.Visible = False
                R1FAB001.lb_gr_cep1.Visible = False
                R1FAB001.lb_gr_cep2.Visible = False
                
                R1FAB001.lb_por_familia1.Caption = "Nº do Sav"
                R1FAB001.lb_por_familia2.Width = 1800
                R1FAB001.lb_por_familia2.Caption = " " & Trim$(u_sav)
           
        End Select

    End If

    su_habilita_botao R1FAB001.bu3d_volta, True
    su_habilita_botao R1FAB001.bu3d_ok, False

End Sub

Sub su_conexao(servidor As Integer)
    
    SqlConn% = 0
    DBLIB_VERSION$ = SqlInit()   'Inicializa a DBLIB
    SqlConn% = FU_Conecta_Servidor(servidor)

End Sub

Sub su_erro_st_proc(tipo_msg As Integer, nome_funcao As String)
    
    Screen.MousePointer = 0

    Select Case tipo_msg%

    Case ST_SqlRpcInit%
         MsgBox "Não foi possível iniciar stored procedure." + Chr(13) + Chr(13) + "SUB-ROTINA: '" & nome_funcao & "'" + Chr(13) + "COMANDO SQL: 'sqlrpcinit%'.", 48
    Case ST_sqlrpcparam%
         MsgBox "Não foi possivel efetuar a passagem de parâmetros." + Chr(13) + Chr(13) + "SUB-ROTINA: '" & nome_funcao & "'" + Chr(13) + "COMANDO SQL: 'sqlrpcparam%'.", 48
    Case ST_SqlRpcSend%
         MsgBox "Não foi possivel enviar comandos." + Chr(13) + Chr(13) + "SUB-ROTINA: '" & nome_funcao & "'" + Chr(13) + "COMANDO SQL: 'sqlrpcsend%'.", 48
    Case ST_SqlOk%
         MsgBox "Não foi possível executar stored procedure." + Chr(13) + Chr(13) + "SUB-ROTINA: '" & nome_funcao & "'" + Chr(13) + "COMANDO SQL: 'sqlok%'.", 48
    Case ST_SqlResults%
         MsgBox "Não foi possível colher resultados." + Chr(13) + Chr(13) + "SUB-ROTINA: '" & nome_funcao & "'" + Chr(13) + "COMANDO SQL: 'sqlresults%'.", 48
    End Select

End Sub

Sub su_fecha_conexao()

    ' fecha conexão

    If SqlConn% <> 0 Then
        SqlClose (SqlConn%)
        SqlExit
    End If
    
    SqlConn% = 0
    
End Sub

Sub su_Fonetiza(Nome As String, Tipo As Integer)

    'v60 Emilio 22/08/2006 - início
'    ' fonetização por nome ou endereço
'    If Not FU_Fonet_Indices(Nome$, tipo%) Then End
    
    retFonetiza = clsFonetiza.obterIndiceFonetico(Nome, Tipo)
    If retFonetiza <> 0 Then
        MsgBox clsFonetiza.getcodigoErro & "-" & clsFonetiza.gettextoErro
        'TRATAR_ERRO
    End If
    
    retFonetiza = clsFonetiza.getcodigoErro
    If retFonetiza <> 0 Then
        MsgBox clsFonetiza.getcodigoErro & "-" & clsFonetiza.gettextoErro
        'TRATAR_ERRO
    End If
    
    Fonet_Indices(0) = clsFonetiza.getindiceFonetico(1)
    Fonet_Indices(1) = clsFonetiza.getindiceFonetico(2)
    Fonet_Indices(2) = clsFonetiza.getindiceFonetico(3)
    Fonet_Indices(3) = clsFonetiza.getindiceFonetico(4)
    Fonet_Indices(4) = clsFonetiza.getindiceFonetico(5)
    Fonet_Indices(5) = clsFonetiza.getindiceFonetico(6)
    'v60 Emilio 22/08/2006 - fim

End Sub

Sub su_formata_grid(gr As Control)

    ' formata grid passado como parâmetro

    Dim ListHwnd    As Long
    Dim ListaWidth  As Integer
    Dim X           As Integer
    
    'list apolices
    ListHwnd = gr.hwnd
    ListaWidth% = (gr.Width * 1.5) / Screen.TwipsPerPixelX
    X% = FU_SendMessage((ListHwnd), LB_SETHORIZONTALEXTENT, (ListaWidth), 0&)
    
   'Seta linhas e colunas do grid
   gr.Cols = 6
   gr.Row = 0
   
   gr.FixedAlignment(0) = 2 ' Set alignment of row numbers.
   gr.ColWidth(0) = 3350
   gr.Col = 0
   gr.Text = "Apólice / Item / Produto"
   
   gr.Col = 1    '5
   gr.FixedAlignment(1) = 2
   gr.ColWidth(1) = 2010
   gr.Text = "Vigência"
   
   gr.Col = 2    '1
   gr.FixedAlignment(2) = 2
   gr.ColWidth(2) = 1320
   gr.Text = "Fabricante"
                        
   gr.Col = 3     '2
   gr.FixedAlignment(3) = 2
   gr.ColWidth(3) = 2050
   gr.Text = "Linha"
   
   gr.Col = 4
   gr.FixedAlignment(4) = 2
   gr.ColWidth(4) = 1800
   gr.Text = "Modelo"
   
   gr.Col = 5
   gr.FixedAlignment(5) = 2
   gr.ColWidth(5) = 1035
   gr.Text = "Placa"

   'lista aditamento
   ListHwnd = R1FAB001.li_aditamentos.hwnd
   ListaWidth% = (R1FAB001.li_aditamentos.Width * 1.5) / Screen.TwipsPerPixelX
   X% = FU_SendMessage((ListHwnd), LB_SETHORIZONTALEXTENT, (ListaWidth), 0&)

End Sub

Sub su_grava_arquivo(pos As Integer)

    ' Grava todos os dados no arquivo C:\USER\ATENDIM.INI
    ' Utilizado por outros projetos
    
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "SHELL", "R1PAB001"
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_prj_ori", "R1PAB001"
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_cia_ita", Trim$(Str(Val(c_cia_ita$)))
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_rmo", c_rmo$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_apo_pnc", Format$(Val(u_apo_pnc$), "000000000")
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_apo_dpd", u_apo_dpd$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_adi", u_adi$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_vrs_adi", dad_adi(pos%).U_VRS_ADI
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_isg", c_isg$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_chs_aut", u_chs_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_fbr_aut", c_fbr_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "e_pcd_aut", e_pcd_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_lin_aut", c_lin_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_mod_aut", c_mod_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_plc_aut", u_plc_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "e_cmb", e_cmb$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "t_coo_aut", t_coo_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "t_pin_aut", t_pin_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_mtr_aut", u_mtr_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "d_ano_fbr", d_ano_fbr$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "d_ano_mod", d_ano_mod$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_seq_reg", c_seg_reg$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "t_isg", t_isg$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_lau", u_lau$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "e_vtd", e_vtd$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_idt_vtd", c_idt_vtd$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_idt_pes", c_idt_pes$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_cls_bon", n_cls_bon$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "i_zro_km", i_zro_km$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "d_sda_vei", Format$(d_sda_vei$, "dd/mm/yyyy")
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_pes", n_pes$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_reg_utl", c_reg_utl$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_pro", c_pro$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_pro", n_pro$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_ocr_l_crs", u_ocr_l_crs$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "t_apo", t_apo$
    If e_fam_pro_ok$ <> Empty Then
        su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "e_fam_pro", e_fam_pro_ok$
    Else
        su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "e_fam_pro", e_fam_pro$
    End If
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_agr_fam_pro", c_agr_fam_pro$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "q_moe_vba", Format$(q_moe_vba@, "###,###,###,##0.00")
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_osg", c_osg$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "e_osg", e_osg$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_vrs_osg", u_vrs_osg$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_ocr_l_crs", u_ocr_l_crs$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "d_ini_vig_apo", dad_adi(pos%).d_ini_vig_apo
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "d_fim_vig_apo", dad_adi(pos%).d_fim_vig_apo
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "e_cvd_prp", e_cvd_prp$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_rgt_ssp_prp", u_rgt_ssp_prp$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_dco_rgt_ssp_prp", u_dco_rgt_ssp_prp$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_loc_pgt_cvd_prp", c_loc_pgt_cvd_prp$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_pes_cvd", n_pes_cor$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "t_sit_apo", t_sit_apo$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_isg", n_isg$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "d_icl_adi", dad_adi(pos%).d_icl_adi
    'Adriana 09/02/2001 - FIPE
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_lin_mod_fbr_fipe", T_Cfg_Ori_Ctc$
        
    If I_Vlr_Ref$ = "S" Then
        su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_cfg_ori_ctc", C_Cfg_Ori_Ctc$
    Else
        C_Cfg_Ori_Ctc$ = Empty
        su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_cfg_ori_ctc", C_Cfg_Ori_Ctc$
    End If
    'Adriana 09/02/2001 - FIPE
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_lin_aut", n_lin_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_mod_aut", n_mod_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_fbr_aut", n_fbr_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "d_icl_apo", d_icl_apo$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "d_ini_vig_adi", dad_adi(pos%).d_ini_vig_adi
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "Ind_Item_Escolhido", Ind_Item_Escolhido$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_cls_bon_cfc", dad_adi(pos%).c_cls_bon_cfc
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "i_dsc_fam", dad_adi(pos%).i_dsc_fam
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "i_bon_cfc", dad_adi(pos%).i_bon_cfc
    
       

End Sub

Sub su_grava_arquivo_isg()

    ' Grava todos os dados no arquivo C:\USER\ATENDIM.INI
    ' Utilizado por outros projetos
    
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "SHELL", "R1PAB001"
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_prj_ori", "R1PAB101"
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_cia_ita", c_cia_ita$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_rmo", c_rmo$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_apo_pnc", Format$(Val(u_apo_pnc$), "000000000")
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_apo_dpd", u_apo_dpd$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_adi", u_adi$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_vrs_adi", U_VRS_ADI$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_isg", c_isg$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_chs_aut", u_chs_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_fbr_aut", c_fbr_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "e_pcd_aut", e_pcd_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_lin_aut", c_lin_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_mod_aut", c_mod_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_plc_aut", u_plc_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "e_cmb", e_cmb$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "t_coo_aut", t_coo_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "t_pin_aut", t_pin_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_mtr_aut", u_mtr_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "d_ano_fbr", d_ano_fbr$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "d_ano_mod", d_ano_mod$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "t_isg", t_isg$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_lau", u_lau$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "e_vtd", e_vtd$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_idt_vtd", c_idt_vtd$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_idt_pes", c_idt_pes$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_cls_bon", n_cls_bon$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "i_zro_km", i_zro_km$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "d_sda_vei", Format$(d_sda_vei$, "dd/mm/yyyy")
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_pes", n_pes$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_reg_utl", c_reg_utl$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_pro", c_pro$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_pro", n_pro$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_agr_fam_pro", c_agr_fam_pro$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_vrs_osg", u_vrs_osg$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_lin_aut", n_lin_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_mod_aut", n_mod_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "n_fbr_aut", n_fbr_aut$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form_ori", "R1FAB007"
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "c_isg_cons", c_isg$
    su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "u_adi_cons", u_adi$

End Sub

Sub su_habilita_botao(c As SSCommand, Status As Integer)
    
  ' habilita/desabilita botão
  ' status:   True  -> habilita
  '           False -> desabilita

    If c.Enabled <> Status% Then
        c.Enabled = Status%
        c.BevelWidth = IIf(Status%, 2, 0)
    End If

End Sub

Sub su_imp_tla()
 
 'Mara (Origin) - 04/02/1999 - Início
 On Error GoTo Trata_Erro_Impressao
  
    ' Carrega a tela para impressão.
    ' A imagem da tela (form atual) será carregada em uma picturebox de
    ' um outro form, para depois ser enviada para impressão
    Load R1FAB006
  
    DoEvents
  
    R1FAB006.Top = 0
    R1FAB006.Left = 0
    R1FAB006.Width = Screen.Width
    R1FAB006.Height = Screen.Height

    'impressão
    ind_erro% = False

                              
    Call GrabScreen2
    
    'Se ocorrer erro de impressão volta o driver HP default
    'e trata erro de impressão
    If ind_erro% Then
        GoTo Trata_Erro_Impressao
    End If


    R1FAB006.pi_imp_tla.Picture = R1FAB006.pi_imp_tla.Image

    R1FAB006.PrintForm

    Unload R1FAB006
    Exit Sub
  
' rotina de tratamento de erro de impressão
Trata_Erro_Impressao:
    MsgBox "Erro na impressão da tela", 48
    Unload R1FAB006
'Mara (Origin) - 04/02/1999 - Fim
    
End Sub

Sub su_inicializa_campos(Flag As Integer)
    
    ' limpa variáveis e controles

    ' parâmetro flag -> indica se o foco será posicionado no campo apólice
    '                   principal flag -> True. Caso não seja necessário
    '                   posicionar flag -> False.

    ' contador
    Dim i As Integer
    
    ' limpa listbox de homônimos, aditamentos e item segurado
    'R1FAB001.li_Homonimo.Clear
    R1FAB001.li_aditamentos.Clear
    R1FAB001.li_isg.Clear
    
    ' frames de homônimo, aditamento e item
    'R1FAB001.fr3d_Homonimo.Visible = False
    R1FAB001.fr3d_Aditamento.Visible = False
    R1FAB001.fr3d_isg.Visible = False
    
    ' verifica se o grid de apólice está preenchido
    ' (existe mais de uma apólice -> apolice% = 1)
    ' Na 2a. tela, o grid deverá ser exibido ao invés da
    ' 1a. tela
    If apolice% = 1 Then
        If acesso% = 7 Then
            R1FAB001.fra_Apolice.Visible = True
            R1FAB001.cb_c_cia_ita.ListIndex = 0
            'R1FAB001.tb_SubEstipulante = Empty: R1FAB001.tb_Certificado = Empty
        Else
            R1FAB001.fr3d_Apolices.Visible = True
            R1FAB001.fr3d_Segurado.Visible = False
        End If
        su_habilita_botao R1FAB001.bu3d_volta, True
        su_habilita_botao R1FAB001.bu3d_ok, True
    Else
        R1FAB001.fra_Apolice.Visible = False
    ' existe somente uma apólice

        ' limpa grid de apólices
        For i% = 1 To R1FAB001.gr_apo.Rows - 2
            R1FAB001.gr_apo.RemoveItem 1
        Next i%
        R1FAB001.gr_apo.Row = 1
        R1FAB001.gr_apo.HIGHLIGHT = False
        
         If R1FAB001.gr_apo.Cols = 5 Then
            For i% = 0 To 5
               R1FAB001.gr_apo.Col = i%
               R1FAB001.gr_apo.Text = Empty
            Next i%
         Else
           For i% = 0 To 1
              R1FAB001.gr_apo.Col = i%
              R1FAB001.gr_apo.Text = Empty
            Next i%
         End If

        ' O checkbox de apólice escritural não deve estar selecionado (padrão)
        R1FAB001.ch3d_apo_escr.Value = False
         
        'Valdemir - 22/01/2002
        'Call Su_LimparCampos(R1FAB001)
        'If R1FAB001.fr3d_Homonimo.Visible = True Then
        '    Call Su_LimparCampos(R1FAB001)
        '    R1FAB001.bu3d_prx_hmn.Enabled = False
        'End If
        
        R1FAB001.cb_c_cia_ita.ListIndex = 0
        
        
'        R1FAB001.tb_n_pes.Text = Empty
'        R1FAB001.tb_c_Cia_ita.Text = Empty
'        R1FAB001.tb_c_Rmo.Text = Empty
'        R1FAB001.tb_u_Apo_Pnc.Text = Empty
'        R1FAB001.tb_u_Apo_Dpd.Text = Empty
'        R1FAB001.tb_u_adi.Text = Empty
'        R1FAB001.lb_c_isg.Caption = Empty
'        R1FAB001.tb_u_plc_aut.Text = Empty
'        R1FAB001.tb_u_chs_aut.Text = Empty
'        R1FAB001.tb_u_prp.Text = Empty
'        R1FAB001.TB_C_T_NEG.Text = Empty
'        R1FAB001.TB_RMO_MFR.Text = Empty
'        R1FAB001.TB_U_APO_MFR.Text = Empty
'        R1FAB001.TB_ISG_MFR.Text = Empty
'        R1FAB001.tb_c_rmo_bnj.Text = Empty
'        R1FAB001.tb_c_suc_bnj.Text = Empty
'        R1FAB001.tb_e_doc_bnj.Text = Empty
        
'        R1FAB001.tb_Certificado = Empty
'        R1FAB001.tb_SubEstipulante = Empty

        ' label utilizado para informar número de apólice no momento
        ' em que for exibida a lista de aditamentos
        R1FAB001.lb_apolice1.Caption = Empty
        
        ' label utilizado para informar número de apólice no momento
        ' em que for exibida a lista de itens segurado
        R1FAB001.lb_apolice3.Caption = Empty
        
        '10/12/1997
         If R1FAB001.fr3d_Homonimo.Visible = True Or (acesso% <> 1 And acesso <> 5) Then
            
            'Valdemir - 22/01/2002
            Call Su_LimparCampos(R1FAB001)
            R1FAB001.lb_c_isg.Caption = Empty   'v69 Emilio 03/06/2008
            R1FAB001.bu3d_prx_hmn.Enabled = False
            R1FAB001.fr3d_Homonimo.Visible = False
            'su_habilita_botao R1FAB001.bu3d_cancela, False
            su_habilita_botao R1FAB001.bu3d_volta, False
            acesso% = 0
            e_pes$ = Empty
            R1FAB001.op3d_e_pes.Value = True
            R1FAB001.op3d_e_pesj.Value = False
            R1FAB001.tb_n_pes.Enabled = True
            
            R1FAB001.fr3d_Segurado.Visible = True
            'R1FAB001.tb_c_Cia_ita.Text = "1"
            R1FAB001.tb_c_Cia_ita.SetFocus
         Else
            'Valdemir - 22/01/2002
            R1FAB001.fr3d_Segurado.Visible = False
            
            R1FAB001.fr3d_Homonimo.Visible = True
            
            'Valdemir - 22/01/2002
            'R1FAB001.bu3d_prx_hmn.Enabled = False
            
            su_habilita_botao R1FAB001.bu3d_ok, True
            
            'Valdemir - 22/01/2002
            su_habilita_botao R1FAB001.bu3d_volta, True
            Exit Sub
         End If

        ' Se o evento cancela for acionado pelo botão volta do grid
        ' de apólices para a 1a. tela, os campos c_cia_ita e c_rmo
        ' devem vir preenchidos c/ "1" e "71". Caso contrário,
        ' eles devem mover vazio p/ estes campos
        If R1FAB001.fr3d_Apolices.Visible Then
            R1FAB001.fr3d_Apolices.Visible = False
        End If
        
        'Valdemir - 22/01/2002
        'R1FAB001.op3d_e_pes.Value = True
        'R1FAB001.op3d_e_pesj.Value = False
        'R1FAB001.tb_n_pes.Enabled = True

'Valdemir - 22/01/2002
'        'su_habilita_botao R1FAB001.bu3d_volta, False
'        su_habilita_botao R1FAB001.bu3d_volta, True

        R1FAB001.fr3d_Segurado.Enabled = True
        
        ' campos inicializados com os valores default (c_cia_ita = 1, c_rmo = 71)
        
        If Flag% Then
            'R1FAB001.tb_c_Rmo.SetFocus
        End If
        
        su_habilita_botao R1FAB001.bu3d_ok, False
        
        ' limpa array de aditamento
        Erase dad_adi
        ' limp array de apolice
        
        'PAULO 12/12
        'Erase dad_apo

' Se existir mais de uma apólice c/ o mesmo número de proposta, ao voltar da 2a. para a _
  1a. tela deve ser exibido o grid. _
  Neste caso, o número da proposta será necessário para posicionar o aditamento na proposta _
  correspondente. _
  O número da proposta só deverá ser desprezado caso seja cancelamento
        
        u_prp$ = Empty

        ' campos da apólice RPM
        R1FAB001.tb_n_cdd.Text = Empty
        R1FAB001.tb_uf.Text = Empty
        R1FAB001.me_cep.Mask = Empty
        R1FAB001.me_cep.Text = Empty
        R1FAB001.me_cep.Mask = "#####-###"
        R1FAB001.tb_u_lgd.Text = Empty
    
        ' seta controle de contratos como não selecionados
        contrato% = False

        'Suzuki 07/08/98
        'c_agr_fam_pro$ = empty
        
    End If

    apolice% = 0
    'homonimo% = False
    'aditamento% = False
    'item_segurado% = False

    ' fonetização
    N_IDC1$ = Empty
    N_IDC2$ = Empty
    N_IDC3$ = Empty
    
    'valdemir - 22/01/2002
    'e_pes$ = Empty
    
    c_idt_pes$ = Empty
    n_pes$ = Empty
    d_nas$ = Empty
    u_apo_pnc$ = Empty
    u_apo_dpd$ = Empty
    u_apo_ant$ = Empty
    c_isg$ = Empty
    c_osg$ = Empty
    u_vrs_osg$ = Empty
    u_adi$ = Empty
    U_VRS_ADI$ = Empty
    d_ini_vig_adi$ = Empty
    d_fim_vig_adi$ = Empty
    d_icl_adi$ = Empty
    c_lin_aut$ = Empty
    u_plc_aut$ = Empty
    u_chs_aut$ = Empty
    u_adi$ = Empty
    d_ini_vig_apo$ = Empty
    d_fim_vig_apo$ = Empty
    c_mod_aut$ = Empty
    Nome$ = Empty
    
    d_hra_atu_icl = Empty       ' Gisely 26/05/2011
    d_fim_cob_pcb = Empty       ' Gisely 26/06/2011
    
    'VARIÁVEIS MARCUS
    c_fbr_aut$ = Empty
    e_pcd_aut$ = Empty
    e_cmb$ = Empty
    t_coo_aut$ = Empty
    t_pin_aut$ = Empty
    u_mtr_aut$ = Empty
    d_ano_fbr$ = Empty
    d_ano_mod$ = Empty
    c_seg_reg$ = Empty
    t_isg$ = Empty

    ' campos da apólice RPM
    n_cdd$ = Empty
    c_uf$ = Empty
    c_cep$ = Empty
    u_lgd$ = Empty

    c_t_neg$ = Empty
    c_rmo_mfr$ = Empty
    u_apo_pnc_mfr$ = Empty
    u_isg_mfr$ = Empty

    ' indica se a 2a. tela foi chamada pela 1a. tela     -> (volta% = False)
    '                                       demais telas -> (volta% = True )
    volta% = False
    
    CONSULTA_POR_ITEM% = False

End Sub

Sub su_insere_clausula(controle As Control, nome_form As String)

   ' insere item segurado no listbox (R1FAB001) ou combo (R1FAB005)
   Dim i  As Integer
   Dim j  As Integer
   Dim aux_c_isg As String
   Dim aux_u_ocr_cla As Integer
   
   'Luciane - 10/09/1997
   controle.Clear
   controle.AddItem "  APÓLICE"
   controle.ItemData(controle.NewIndex) = 0
   
   If nome_form = "R1FAB004" Then
      ' insere item segurado no combobox
      For i% = 0 To UBound(dad_isg)
         For j% = 0 To UBound(dad_cla_apo)
            If aux_c_isg <> dad_cla_apo(j%).c_isg Then
               aux_c_isg = dad_cla_apo(j%).c_isg
               If dad_cla_apo(j%).c_isg = dad_isg(i).c_isg Then
                  If aux_u_ocr_cla <> dad_cla_apo(j%).U_OCR_CLA Then
                     controle.AddItem "  " & dad_isg(i).c_isg & " - " & dad_isg(i).n_isg
                     controle.ItemData(controle.NewIndex) = dad_isg(i).c_isg
                     aux_u_ocr_cla = dad_cla_apo(j%).U_OCR_CLA
                  End If
               End If
            End If
         Next j%
         aux_c_isg = Empty
         aux_u_ocr_cla = 0
      Next i%
   ElseIf nome_form = "R1FAB005" Then
      For i% = 0 To UBound(dad_isg)
         controle.AddItem "  " & dad_isg(i).c_isg & " - " & dad_isg(i).n_isg
         controle.ItemData(controle.NewIndex) = dad_isg(i).c_isg
      Next i%
   End If

End Sub

Sub su_insere_lista_isg(controle As Control)

   ' insere item segurado no listbox (R1FAB001) ou combo (R1FAB005)
   Dim i  As Integer
   Dim j  As Integer
   
   'Luciane - 10/09/1997
   controle.Clear
   
   ' insere item segurado no combobox
   For i% = 0 To UBound(dad_isg)
      controle.AddItem "  " & dad_isg(i).c_isg & " - " & dad_isg(i).n_isg
      controle.ItemData(controle.NewIndex) = dad_isg(i).c_isg
   Next i%
    
End Sub

Sub su_limpa_var_fonet()
    
    ' limpa variáveis utilizadas na fonetização de clientes
    R1FAB001.li_Homonimo.Clear
    
    ' indica qual indice fonético será utilizado para
    ' pesquisa na tabela (indice_fonet(0), indice_fonet(1),
    ' indice_fonet(2))
    tipo_fonet% = 0

    ' indica qual indice na tabela será utilizada na
    ' consulta ao índice
    indice% = 0

    ' indica se todas as pesquisas fonéticas foram
    ' realizadas ou não
    fim_fonet% = False

    ' comteúdo do índice fonético a ser passado para
    ' a stored procedure
    n_idc$ = Empty
    
    ' posição no array do 1o. elemento no listbox (lst_prp)
    pos_array_fonet% = 0

    ' total de clientes encontrados na fonetização
    n_tot_hmn% = 0

    ' verifica se a partir de uma pesquisa na tabela existem mais de
    ' uma tela do listbox a ser apresentada
    Tela% = False

    ' posiciona o cursor no cliente escolhido
    pos_foco_lst% = 0

End Sub

Sub su_posiciona_foco(controle As TextBox)
    
    ' Posiciona cursor no textbox informado (controle)
    ' Referente à 1a. tela do projeto
    If controle.Enabled And controle.Visible Then
        controle.SetFocus
        controle.SelStart = 0
        controle.SelLength = Len(controle.Text)
    End If

End Sub

Sub su_preenche_clausulas()
    
    ' Se ListIndex = 0 -> posição atual da apólice (último aditamento)
    If R1FAB002.cb_u_adi.ListIndex = 0 Then
        R1FAB004.lb_apo.Caption = Format$(c_cia_ita$, "00") & "." & _
                Format$(Val(c_rmo$), "00") + "." & _
                Format$(Val(u_apo_pnc$), "000000000") & "." & _
                Format$(Val(u_apo_dpd$), "0000000") & "/" & _
                dad_adi(UBound(dad_adi)).u_adi & "/" & _
                dad_adi(UBound(dad_adi)).U_VRS_ADI  '   PauloFLopes     29/10/2007
    Else
        R1FAB004.lb_apo.Caption = Format$(c_cia_ita$, "00") & "." & _
                Format$(Val(c_rmo$), "00") & "." & _
                Format$(Val(u_apo_pnc$), "000000000") & "." & _
                Format$(Val(u_apo_dpd$), "0000000") & "/" & _
                dad_adi(R1FAB002.cb_u_adi.ListIndex - 1).u_adi & "/" & _
                dad_adi(R1FAB002.cb_u_adi.ListIndex - 1).U_VRS_ADI  '   PauloFLopes     29/10/2007
    End If

    If Val(c_agr_fam_pro$) = 5 Or Val(c_agr_fam_pro$) = 6 Then ' Diferenciado
        R1FAB004.lb_isg.Visible = True
        R1FAB004.cb_isg.Visible = True
        R1FAB004.lb_cla.Caption = "Cláusula"
        R1FAB004.lb_cla.Visible = True
        R1FAB004.lb_obj.Visible = True
        R1FAB004.tb_cla.Visible = True
        R1FAB004.tb_obj.Visible = True
        'R1FAB004.lb_bnf.Visible = True
        'R1FAB004.cb_bnf.Visible = True

    Else
        R1FAB004.lb_n_pes1.Visible = True
        R1FAB004.lb_n_pes2.Caption = Trim$(n_pes$)
        R1FAB004.lb_n_pes2.Visible = True
        R1FAB004.lb_cla.Visible = True
        R1FAB004.gr_cla_ctd.Visible = True

        R1FAB004.lb_isg.Visible = False: R1FAB004.cb_isg.Visible = False
        R1FAB004.lb_obj.Visible = False: R1FAB004.tb_obj.Visible = False
        R1FAB004.tb_cla.Visible = False
        
    End If
End Sub

Sub su_preenche_lista_clientes(pos_array As Integer, Opcao As Integer)

    ' preenche listbox com todos os homônimos na fonetização

    ' contador para preencher listbox
    Dim i       As Integer
    
    ' variável para inserção de linhas no listbox
    Dim lst_aux As String

    ' foi escolhida a opção de telas anteriores (seta p/ cima)
    If Opcao% = 1 Then
        ' irá exibir na tela 500 clientes de cada vez
        ' se a partir da posição atual - 500 < 0
        '       indica que não existem mais de 500 clientes a serem exibidos
        ' Neste caso, o 1o. cliente a ser exibido na lista, pode ser
        ' o 1o. do array
        If pos_array% - 500 <= 0 Then
            pos_array% = 0
        Else
            ' ainda existem mais de 500 clientes no início do array que devem ser
            ' exibidos no listbox
            pos_array% = pos_array% - 500
        End If
        R1FAB001.li_Homonimo.Clear

    ' próxima lista de clientes (seta p/ baixo)
    ElseIf Opcao% = 2 Then
        
        If (n_tot_hmn% - pos_array%) \ 500 = 0 Then
            
            ' Verifica quantas linhas devem ser eliminadas para
            ' a inserção de outros clientes.
            ' Se o total de clientes pesquisados pela última vez é
            ' maior que a quantidade de linhas no listbox que faltam
            ' para completar 500 (máximo de linhas permitido)
            ' Neste caso, serão eliminadas as 1as. linhas para a inserção
            ' destas.
            If n_tot_hmn% - pos_array% > 500 - R1FAB001.li_Homonimo.ListCount Then
                
                ' se o número de elementos na lista for maior que o número
                ' de elementos a serem inseridos
                If R1FAB001.li_Homonimo.ListCount > n_tot_hmn% - pos_array% Then
                    ' Posiciona na linha do listbox que será a primeira, após
                    ' a inserção dos demais clientes
                    R1FAB001.li_Homonimo.ListIndex = n_tot_hmn% - pos_array%
                Else
                    R1FAB001.li_Homonimo.ListIndex = 0
                End If
                ' armazena a posição do 1o. cliente no array
                pos_array% = Val(Mid$(R1FAB001.li_Homonimo.List(R1FAB001.li_Homonimo.ListIndex), 81, 6))
                
                R1FAB001.li_Homonimo.Clear

            End If
            
        Else
            ' Existem mais de 500 clientes a serem listados
            R1FAB001.li_Homonimo.Clear
        End If

    End If

    ' A partir da posição do array a ser inserida na lista, verifica se
    ' existem mais de 500 clientes
    If pos_array% + 500 > n_tot_hmn% Then
        ' não existem mais de uma tela de cliente a ser apresentada
        Tela% = False
        ' Insere no listbox até o final do array
        For i% = pos_array% To n_tot_hmn% - 1
            
            ' monta a lista a partir da posição indicada no array
            lst_aux$ = Mid$(array_fonet(i%), 10, Len(array_fonet(i%)) - 9)  ' & Space$(5) & Mid$(array_fonet(i%), 1, 5)
            
            ' nome cliente
            R1FAB001.li_Homonimo.AddItem lst_aux$
            R1FAB001.li_Homonimo.ItemData(R1FAB001.li_Homonimo.NewIndex) = Val(Mid$(array_fonet(i%), 1, 8))
        Next i%
    Else
        ' Insere no listbox até 500 clientes (máximo permitido)
        For i% = pos_array% To pos_array% + 499   ' - 1
            ' monta a lista a partir da posição indicada no array
            lst_aux$ = Mid$(array_fonet(i%), 10, Len(array_fonet(i%)) - 9)   '& Space$(5)   '& Mid$(array_fonet(i%), 1, 5)

            ' nome cliente
            R1FAB001.li_Homonimo.AddItem lst_aux$
            R1FAB001.li_Homonimo.ItemData(R1FAB001.li_Homonimo.NewIndex) = Val(Mid$(array_fonet(i%), 1, 8))
        Next i%
        pos_array% = pos_array% + 500
        
        ' existem mais de 1 tela de clientes a ser exibida
        Tela% = True

    End If
    ' verifica se a posição do foco está entre as linhas que foram inseridas
    ' no listbox
    If pos_foco_lst% > Val(Mid$(R1FAB001.li_Homonimo.List(0), 81, 6)) And pos_foco_lst% <= Val(Mid$(R1FAB001.li_Homonimo.List(R1FAB001.li_Homonimo.ListCount - 1), 81, 6)) Then
        ' verifica a linha no listbox que deverá ser posicionado o foco
        For i% = 0 To R1FAB001.li_Homonimo.ListCount - 1
            If pos_foco_lst% = Val(Mid$(R1FAB001.li_Homonimo.List(i%), 81, 6)) Then
                Exit For
            End If
        Next i%
        R1FAB001.li_Homonimo.ListIndex = i%
        
    'Else
    '    R1FAB001.li_Homonimo.ListIndex = 0
    End If
            
End Sub

Sub SU_Saida()

    su_fecha_conexao
    SqlWinExit
    End

End Sub

Sub SU_TRATAMENTO_CLIENTE()

    ' seleciona código do cliente na dbnprod..tb_cli_apo
    If Not fu_sel_cli_apo() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Cliente não encontrado.", , txt_msg$
        Exit Sub
    End If
    
    ' verifica se o código do cliente se encontra na tabela
    ' dbnpesso..tb_pes_ref
    If Not fu_sel_pes_ref() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Cliente não encontrado.", , txt_msg$
        Exit Sub
    End If
    
    ' seleciona nome do cliente através do código na tabela
    ' dbnpesso..tb_pes
    If Not fu_sel_pes() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Cliente não encontrado.", , txt_msg$
        Exit Sub
    End If

End Sub

Sub su_wri_ini(Arquivo_Ini As String, Sessao As String, sl_item As String, sl_valor As String)
    
   ' grava dados em arquivo passagem de parâmetro que será utilizado por outro projeto

   Dim ret     As Integer

   ret% = FU_Escreve_String_Ini(Arquivo_Ini, Sessao, sl_item$, sl_valor$)

   If ret% = 0 Then
      If (GetAttr(Arquivo_Ini) And ATTR_READONLY) Then
         SetAttr Arquivo_Ini, ATTR_NORMAL
         
         ret% = FU_Escreve_String_Ini(Arquivo_Ini, Sessao, sl_item$, sl_valor$)
   
         If ret% = 0 Then
            MsgBox "Erro com o arquivo " & Arquivo_Ini
            SU_Saida
         End If
      End If
   End If
End Sub

'* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
'   Nome:       Fu_Apo_ItauPrev
'   Descricao:  Verifica se Apolice (agrupamento vida) pertence a CisaoItauPrev
'   Parametros: nenhum
'   Autor:      Marcelo Domingos 30/10/2002
'   Alteracao:  ?
'* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Function Fu_Apo_ItauPrev(LB_I_CSI As Label) As Boolean

    On Error GoTo TrataErro

    Dim strMsgErro      As String
    
    Screen.MousePointer = vbHourglass
    Fu_Apo_ItauPrev = False
       
    If SQLRPCInit%(SqlConn%, "DBNPROD..PR_APO_ITAUPREV_S11836", 0) = FAIL Then
       GoTo TrataErro
    End If
    
    If FU_Parametro(SqlConn, "@C_CIA_ITA", c_cia_ita, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@C_RMO", c_rmo, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@U_APO_PNC", u_apo_pnc, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@U_APO_DPD", u_apo_dpd, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@I_CSI", "", SQLCHAR%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@I_CO_CORRETAGEM", "", SQLCHAR%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@I_COSSEGURO", "", SQLCHAR%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@D_FIM_VIG_APO", "", SQLDATETIM4) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@C_ERR", 0, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@T_ERR", "", SQLVARCHAR%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@I_Mig_Orb", "", SQLCHAR%) = FAIL Then Exit Function
       
    If SQLRPCSend%(SqlConn%) = FAIL Then Exit Function
    
    ret = SqlResults(SqlConn%)
    
    If ERRO_SQL <> 0 Then GoTo TrataErro
    
    Do Until ret% = NOMORERESULTS%
        If ret% = FAIL Then GoTo TrataErro
        ret% = SqlNextRow%(SqlConn%)
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
                                                
            ret = SqlNextRow%(SqlConn%)
        Loop
        ret% = SqlResults%(SqlConn%)
    Loop

    If ERRO_SQL <> 0 Then GoTo TrataErro
    
    If Val(SqlRetData(SqlConn%, 5)) <> 0 Then
        strMsgErro = SqlRetData(SqlConn, 6)
        GoTo TrataErro
    End If
    
    If Trim(SqlRetData(SqlConn%, 1)) = "S" Then
        LB_I_CSI.Caption = "CISÃO ITAUPREV"
    Else
        LB_I_CSI.Caption = ""
    End If
    
    If Trim(SqlRetData(SqlConn%, 7)) = "S" Then
        MsgBox "Migração para Orbital", vbExclamation
        LB_I_CSI.Caption = "MIGRAÇÃO PARA ORBITAL"
    End If
    
    Fu_Apo_ItauPrev = True
    
    Screen.MousePointer = vbDefault
    
    Exit Function
    
TrataErro:
    
    MsgBox "Falha buscar Indicador de Cisão Itauprev." & vbCrLf & MSG_ERRO_SQL$, vbCritical + vbOKOnly, "Erro de Processamento"
    ERRO_SQL = 0
    MSG_ERRO_SQL$ = ""
    Screen.MousePointer = vbDefault

End Function
Function FU_PR_HIS_TCO_APO_G13172() As Integer

    Dim ret As Integer

    FU_PR_HIS_TCO_APO_G13172 = False

    ' inicializa stored procedure
    ret% = SQLRPCInit%(SqlConn%, "DBNPROD..PR_HIS_TCO_APO_G13172", 0)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "FU_PR_HIS_TCO_APO_G13172"
        GoTo ERRO_FU_PR_HIS_TCO_APO_G13172
    End If
 
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@i_cct_ita", "", SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@t_ben_crs", "", SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_err", 0, SQLINT4%) = FAIL% Then Exit Function   'Emilio 16/01/2003 - R1PAB169
    If FU_Parametro_Ret(SqlConn, "@t_err", "", SQLVARCHAR%) = FAIL% Then Exit Function   'Emilio 16/01/2003 - R1PAB169

    'Adelamg 13/08/2007
    If FU_Parametro(SqlConn, "@u_adi", u_adi, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_adi", U_VRS_ADI, SQLINT2%) = FAIL% Then Exit Function
    
    ' envia comando
    ret% = SQLRPCSend%(SqlConn%)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "FU_PR_HIS_TCO_APO_G13172"
        GoTo ERRO_FU_PR_HIS_TCO_APO_G13172
    End If

    ' executa a stored procedure
    ret% = SqlOk%(SqlConn%)
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "FU_PR_HIS_TCO_APO_G13172"
        GoTo ERRO_FU_PR_HIS_TCO_APO_G13172
    End If

    R1FAB002.lb_n_Pes.Width = 8040
    If Trim$(SqlRetData$(SqlConn%, 1)) = "S" Then
        R1FAB002.lb_n_Pes.Width = 6480
        R1FAB002.lb_cct_ita.Visible = True
    End If

    If Val(SqlRetData$(SqlConn%, 3)) <> 0 Then
        su_erro_st_proc ST_SqlResults%, Trim(SqlRetData$(SqlConn%, 4))
        GoTo ERRO_FU_PR_HIS_TCO_APO_G13172
    End If
    
    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "FU_PR_HIS_TCO_APO_G13172"
        GoTo ERRO_FU_PR_HIS_TCO_APO_G13172
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
        GoTo ERRO_FU_PR_HIS_TCO_APO_G13172
    End If

    FU_PR_HIS_TCO_APO_G13172 = True

    Exit Function

ERRO_FU_PR_HIS_TCO_APO_G13172:

  FU_PR_HIS_TCO_APO_G13172 = False
  ret% = SqlCancel(SqlConn%)

End Function

Public Sub SU_ConsItemExc()
    
    'Seleciona os itens
   ' If Not FU_PR_ISG_EXC_AUT_G07649() Then
   '     Screen.MousePointer = DEFAULT
   '     Exit Sub
   ' End If
    
    'Seleciona os dados de cobrança
   ' If Not FU_PR_CBR_EXC_AUT_G07658() Then
   '     Screen.MousePointer = DEFAULT
   '     Exit Sub
   ' End If

End Sub

Public Function FU_Traz_Arquivo_CMG()

'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'   Autor: Emilio Lacerda Conde
'   Data de criação: 28/06/2006
'   SSI: EV05/6124 - Solução Word para Diferenciado - Transportes
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

    Dim aItemList() As Variant  'Array de Código Interno do Content Manager para o arquivo
    Dim cmd_Query   As String   'Comando de Consulta do Arquivo no Content Manager
    Dim n_arq_exp   As String   'Nome do arquivo de exportação do Content Manager para Pasta Local
    
    On Error GoTo Trata_Erro

    'Inicia variáveis
    FU_Traz_Arquivo_CMG = False
    
    ReDim aItemList(-1 To -1)
    cmd_Query = ""
    n_arq_exp = ""
    msgerro = ""
    
    CMG_APO.IY0_N_ARQ_ESF_APO = UCase(n_arq_esf_apo)
    cmd_Query = "@IY0_N_ARQ_ESF_APO@ == " & Chr(34) & CMG_APO.IY0_N_ARQ_ESF_APO & Chr(34)
    
    'Busca o ID do arquivo de especificação da apólice/aditamento
    If VbVhlSearchItem(aItemList, CLASSE_CMG_ANEXO, cmd_Query) <> 0 Then
        If ulRC = 12003 Then    'No items found
            msgerro = "Não foi encontrado o arquivo no Content Manager." & vbCrLf & _
                      "Nome do arquivo : " & Chr(34) & Trim(UCase(n_arq_esf_apo)) & Chr(34)
            GoTo Trata_Erro
        End If
        
        msgerro = "Problema ao buscar o ID do arquivo no Content Manager." & vbCrLf & _
                  "Nome do arquivo: " & Trim(UCase(n_arq_esf_apo))
        GoTo Trata_Erro
    End If
    
    'Verifica se existe mais de um item para o nome de arquivo pesquisado
    If aItemList(0) > 1 Then    'Qtde. Itens (ID Content Manager do arquivo)
        msgerro = "Existem " & Trim(Str(aItemList(0))) & " itens para arquivo pesquisado." & vbCrLf & _
                  "IY0_N_ARQ_CPS_IMP = " & n_arq_esf_apo
        GoTo Trata_Erro
    End If
    
    'Exporta (Busca) do Content Manager
    If VbVhlExportDocObj(aItemList(1), n_dir_tmp & n_arq_esf_apo, 0) <> 0 Then
        msgerro = "Erro na exportação do arquivo " & n_arq_esf_apo & "."
        GoTo Trata_Erro
    End If
    
    If Dir(n_dir_tmp & n_arq_esf_apo) = "" Then
        msgerro = "Erro na exportação do arquivo. Não foi encontrado o arquivo." & vbCrLf & _
                  "Diretório: " & n_dir_tmp & vbCrLf & _
                  "Nome do arquivo: " & n_arq_esf_apo
        GoTo Trata_Erro
    End If
    
Fim:
    FU_Traz_Arquivo_CMG = True
    
    Exit Function
    
Trata_Erro:

    If Err.Number <> 0 Then msgerro = "Erro VB: " & Trim(Str(Err.Number)) & " - " & Err.Description
        
    If ulRC <> 0 Then
        If msgerro <> "" Then
            msgerro = msgerro & vbCrLf & vbCrLf & "Erro CMG: [" & ulRC & "] " & Trim(VhlErrorObj.ErrorMessage)
        Else
            msgerro = "Erro CMG: [" & ulRC & "] " & Trim(VhlErrorObj.ErrorMessage)
        End If
    End If
    
End Function

Public Function FU_TRATA_DIRETORIO(e_acao As String, diretorio As String) As Boolean
    
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'Autor  : Emilio Lacerda Conde
'Data   : 29/06/2006
'SSI    : EV05/6124 - Solução Word para Diferenciado - Transportes
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    
    'On Error GoTo Trata_Erro    'v58 Emilio 06/07/2006
    On Error Resume Next        'v58 Emilio 06/07/2006
    
    Dim atributo_dir    As Integer
    
    FU_TRATA_DIRETORIO = False
    
    If e_acao = "CRIAR" Or e_acao = "DELETAR" Then
        If Dir(diretorio, vbDirectory) <> "" Then   'Verifica se existe a pasta (diretório)
            
            atributo_dir = GetAttr(diretorio)   'Retorna o atributo do diretório
            If atributo_dir <> vbDirectory Then  'Se tiver outros atributos (SOMENTE LEITURA, OCULTO, SISTEMA) além do atributo DIRETÓRIO
10              SetAttr diretorio, vbDirectory
            End If
            
            If Dir(diretorio & "*.*") <> "" Then    'Verifica se existe arquivo dentro da pasta (diretório)
                'Apaga todos os arquivos
20              Kill diretorio & "*.*"
            End If
            
            If Dir(diretorio & "*.*") = "" Then    'Atualiza a pasta para indicar que está vazia
                'Apaga a pasta (diretório) somente se estiver vazia
30              RmDir diretorio
            End If
        End If
        
        If e_acao = "CRIAR" Then
            'Cria a pasta (diretório)
40          MkDir diretorio
        End If
    Else
        msgerro = "[FU_TRATA_DIRETORIO] Tipo de ação inválida = " & e_acao & "."
        Exit Function
    End If
    
    FU_TRATA_DIRETORIO = True
    
    Exit Function

'v58 Emilio 06/07/2006 - início
'Trata_Erro:
'
'    If Err.Number <> 0 Then
'        msgerro = "[FU_TRATA_DIRETORIO] Problema no diretório = " & Chr(34) & diretorio & Chr(34) & "."
'        msgerro = msgerro & "/Erro VB: " & Trim(Str(Err.Number)) & " - " & Err.Description
'    End If
'
'    If Erl <> 0 Then msgerro = msgerro & "/Linha de comando: " & Trim(Str(Erl))
'v58 Emilio 06/07/2006 - fim

End Function

Function FU_TRATA_WORD(e_acao As String)
    
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'Autor  : Emilio Lacerda Conde
'Data   : 29/06/2006
'SSI    : EV05/6124 - Solução Word para Diferenciado - Transportes
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

Dim ctd_doc As Integer
Dim qtd_doc As Integer

    On Error GoTo Trata_Erro

    FU_TRATA_WORD = False
    
    If e_acao <> "DESTRUIR" And e_acao <> "GERAR" Then msgerro = "[FU_TRATA_WORD] Tipo de ação inválida = " & e_acao 'ZEZE: Exit Function
    
    If e_acao = "DESTRUIR" Then
        MsgBox "Clique no botão OK para encerrar a consulta.", MB_ICONEXCLAMATION, "Gerenciamento do Aplicativo Word"
        On Error Resume Next
        Set Wd = GetObject(, "Word.Application")
        If Err.Number = 0 Then
            Wd.ActiveDocument.Close SaveChanges:=wdDoNotSaveChanges  'Sair do Word sem salvar
            Wd.Quit SaveChanges:=wdDoNotSaveChanges  'Sair do Word sem salvar
            DoEvents    'Atualizar para ocorrer erro na exclusão do arquivo
        End If
        Set Wd = Nothing                        'libera a variável objeto
    End If

'ZE erro de fonte    If e_acao = "GERAR" Then
        Set Wd = GetObject(, "Word.Application")
        qtd_doc = Wd.Documents.Count
        If qtd_doc > 0 Then
            msgerro = "ATENÇÃO ! Existe(m) " & Trim(Str(qtd_doc)) & " documento(s) aberto(s)." & vbCrLf & vbCrLf & _
                      "Por favor salve seu(s) documento(s) pois o sistema irá fechar o Word." & vbCrLf & vbCrLf & _
                      "Nome(s) do(s) arquivo(s)" & vbCrLf
        End If
        
        'Busca o(s) nome(s) do(s) arquivo(s) aberto(s)
        For ctd_doc = Wd.Documents.Count To 1 Step -1
            msgerro = msgerro & vbCrLf & Wd.Documents(ctd_doc).Path & "\" & Wd.Documents(ctd_doc).Name
        Next
        
        If qtd_doc > 0 Then MsgBox msgerro, MB_ICONEXCLAMATION, "R1FAB005 - Gerenciamento do Aplicativo Word"
        
        'Fecha todos os arquivos abertos sem salvar, se houver
        For ctd_doc = Wd.Documents.Count To 1 Step -1
            Wd.Documents(ctd_doc).Close SaveChanges:=wdSaveChanges
        Next
        
Abrir_Arquivo:

'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        Wd.Documents.Open 
'Autor  : Emilio Lacerda Conde
'Data   : 29/06/2006
'SSI    : EV05/6124 - Solução Word para Diferenciado - Transportes
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

    Dim ctd_conexao As Integer
    
'ZE    FU_TRATA_CONEXAO_CMG = False
    
    If e_acao <> "CONECTAR" And e_acao <> "DESCONECTAR" Then
        msgerro = "[FU_TRATA_CONEXAO_CMG] Tipo de ação inválida = " & e_acao
        Exit Function
    End If
    
Trata_Erro:
    
Tenta_Conexao:
    
    'Conectar no Content Manager
    If e_acao = "CONECTAR" Then
        If i_conexao = True Then GoTo Traz_Arquivo
        If FU_CMG_Logon = i_conexao Then
            If ctd_conexao = 5 Then
                'v57 Emilio - Obs.: Retirar comentário quando não existir mais FTP
                'msgerro = "Erro ao tentar conectar no Content Manager."
                'Exit Function
                R1FAB005.pa3d_status.Caption = "R1FAB005 - ATENÇÃO ! Erro ao conectar no Content Manager."
                GoTo Fim
            Else
                ctd_conexao = ctd_conexao + 1
                GoTo Tenta_Conexao
            End If
        Else
            i_conexao = True
        End If
Traz_Arquivo:
        'Exporta arquivo do Content Manager
        If Not FU_Traz_Arquivo_CMG() Then Exit Function
    End If

    'Desconectar do Content Manager
    If e_acao = "DESCONECTAR" Then
        If i_conexao = True Then
            If Not FU_CMG_Logoff Then
                msgerro = "Erro ao desconectar do Content Manager"
                Exit Function
            End If
            i_conexao = False
        End If
    End If
Fim:
'ZE    FU_TRATA_CONEXAO_CMG = True

End Function

Public Function FU_Form_Esp_Underwriter() As Boolean
'Obtém a Especificação do UnderWriter

    Dim n_arq_ori   As String
    Dim n_arq_dst   As String
    
    FU_Form_Esp_Underwriter = False
    
    On Error GoTo Trata_Erro
    
    n_arq_ori = "/APOLICES/ESPECIFICACOES/" & n_arq_esf_apo
    n_arq_dst = n_dir_tmp & n_arq_esf_apo
    
    If Dir(n_arq_dst) <> "" Then GoTo Fim
    
    With R1FAB005
'ZE        .itauFTP1.ftpAcao = Receber
        .itauFTP1.ftpServername = "intra01ftp"
        .itauFTP1.ftpErro
    End With
    
Fim:
    FU_Form_Esp_Underwriter = True
    
    Exit Function
    
Trata_Erro:
    msgerro$ = "Erro ao buscar o arquivo de Especificação da Apólice/Aditamento." & vbCrLf & _
               "Nome do arquivo: " & n_arq_ori
                   
    If Err.Number <> 0 Then msgerro = msgerro & vbCrLf & vbCrLf & "Erro VB: " & Trim(Str(Err.Number)) & " - " & Err.Description
End Function


