Attribute VB_Name = "R1MAB001"
Option Explicit

'+----------------------------------------------------------------------------+
'|                          VARIAVEIS GENÉRICAS                               |
'+----------------------------------------------------------------------------+

Global Const CG_KEY_PAGE_UP% = 33
Global Const CG_KEY_PAGE_DOWN% = 34

'v68 Emilio 21/05/2008 - início
Global Const CG_KEY_BACKSPACE% = 8
Global Const CG_KEY_ENTER% = 13
Global Const CG_KEY_VIRGULA% = 44
Global Const CG_KEY_ZERO% = 48
Global Const CG_KEY_NOVE% = 57
Global Const CG_KEY_PONTO% = 46
'v68 Emilio 21/05/2008 - fim

Global Bln_Cph_OK                   As Boolean

Global Ret                          As Integer
Global Mensagem                     As String
Global ctd_lfi                      As Integer
Global u_prp_atu                    As String
Global u_prp_orn                    As String
Global d_prt_cga                    As String
Global d_rct_prp                    As String
Global D_EXC_PRP                    As String
Global n_cli                        As String
Global e_cvd                        As String
Global u_rgt_ssp                    As String
Global u_dco_rgt_ssp                As String
Global c_loc_pgt_cvd                As String
Global u_fcp                        As String
Global N_USR                        As String
Global c_bco                        As String
Global u_age                        As String
Global u_cc                         As String
Global u_cc_dcu                     As String
Global c_msg                        As String
Global n_lgd_ris                    As String
Global u_lgd_ris                    As String
Global n_cpl_ris                    As String
Global n_bai_ris                    As String
Global c_cep_ris                    As String
Global n_cdd_ris                    As String
Global s_uf_ris                     As String
Global d_ini_vig                    As String
Global n_abv_pla                    As String
Global C_E_MLD                      As String
Global c_cph                        As String
Global c_oft_cph                    As String
Global u_lot_oft                    As String
Global c_agr_rmu                    As String

Global u_psl_dco                    As String
Global n_uog                        As String

Global c_mot_alt_aux                As String       'VERSÃO 54
Global msg_mig_itp                  As String   'Fumiko - 25/03/2009

Global aditamento           As Integer      ' variável que indica se o aditamento
                                            ' foi escolhido pelo click no lista
                                            ' de aditamentos (listbox) -> TRUE

Global acesso               As Integer      ' Indica o tipo de acesso feita para consultar
                                            ' a apólice.
                                            '       0 - número de apólice
                                            '       1 - nome do segurado
                                            '       2 - placa no veículo
                                            '       3 - chassi, chassi + placa, chassi + placa + proposta
                                            '       4 - número de proposta

Global Mudou_Aditamento     As Integer      ' Indica que foi escolhido outro aditamento na  Tela 02

Global Novo_Item            As Integer      ' Para ser usado em conjunto com a var Mudou_Item
Global Mudou_Item           As Integer      ' Indica que foi mudado o Item durante a execução do pro-
                                            ' grama de consulta aos dados do item.

Global homonimo             As Integer      ' Indica a existência de mais de um homô-
                                            ' nimo para o nome do segurado informado

Global apolice              As Integer      ' indica ter encontrado mais de uma apólice,
                                            ' preenchendo o grid de apólices

Global N_IDC1               As String * 15  ' índices utilizados para a fonetização
Global N_IDC2               As String * 15  ' do nome do segurado
Global N_IDC3               As String * 15

Global e_pes                As String * 1   ' tipo de pessoa a ser pesquisado (física ou jurídica)

Global e_psc_prp            As String * 1   ' posiçao da proposta, caso não tenha
                                            ' sido emitida. 2 - Proposta pendente

Global d_nas                As String       ' data de nascimento do segurado

Global c_osg                As String       ' código do Objeto Segurado

Global e_osg                As String * 3   ' tipo de Objeto Segurado

Global u_vrs_osg            As String       ' número da versão do Obj.Segurado

Global u_adi                As String       ' número do aditamento
Global e_mig_adi            As String       ' tipo de migração do aditamento    'v97 Emilio - 22/03/2011 - SS_163237 - Tombamento Auto ISa+r
Global U_VRS_ADI            As String       ' número da versão do aditamento

Global d_ini_vig_adi        As String       ' data de início de vigência do aditamento
Global d_fim_vig_adi        As String       ' data de fim de vigência do aditamento
Global d_icl_adi            As String       ' data de inclusão do aditamento
Global i_asn_eln            As String       ' Indicador de propostas assinada eletronicamente.

Global t_msg_err            As String       ' texto de mensagem de erro     'v75 Emilio 29/01/2009 - SS_42264_IR2_390
Global u_prp_itp            As String       ' número da proposta Itauprev   'v75 Emilio 29/01/2009 - SS_42264_IR2_390
Global u_prp                As String       ' número da proposta
Global d_prp                As String       ' data da proposta
Global D_Tab_Vda_Cmz        As String       ' data da tabela de vendas da comercialização

Global Nome                 As String * 45  ' nome do segurado informado
Global Tipo                 As Integer      ' tipo de pessoa física (1), jurídica (2)
                                            ' este conteúdo deve ser passado para a
                                            ' rotina de fonetização

Global e_pcd_aut            As String       ' tipo de procedência do veículo

Global c_lin_aut            As String       ' código da linha do veículo
Global n_lin_aut            As String * 20  ' nome da linha do veículo

Global c_mod_aut            As String       ' código do modelo do veículo
Global n_mod_aut            As String * 30  ' nome do modelo do veículo

Global c_fbr_aut            As String       ' código do fabricante do veículo
Global n_fbr_aut            As String * 20  ' nome do fabricante do veículo

Global c_mot_ipd_adi        As String       ' código do motivo de impedimento do aditamento

Global c_ori_ctc            As String       ' Origem do veículo - Adriana 08/02/2001 FIPE
Global c_cfg                As String       ' Configuração do veículo - Adriana 08/02/2001 FIPE

Global T_Cfg_Ori_Ctc        As String       ' Descrição da configuração para a origem da Cotação - Adriana 08/02/2001 Fipe
Global T_Cfg_Aut_Mod        As String       ' Adriana 08/02/2001 Fipe
Global C_Cfg_Ori_Ctc        As String       ' Código da configuração para a origem da Cotação - Adriana 08/02/2001 Fipe
Global N_Ori_Ctc            As String       ' Adriana 08/02/2001 Fipe
Global I_Vlr_Ref            As String       ' Adriana 08/02/2001 Fipe

Global Lin_Lib_Sel          As Integer      ' Linha do Grid (Liberação Selecionada)

Global d_fim_cob_pcb        As String       ' Data fim de cobertura - Gisely 26/05/2011
Global d_hra_atu_icl        As String       ' Data/hora de emissão na fila - Gisely 26/05/2011

'Dilson - call center corretor - 30/12/2002
Global CALL_CENTER_CORRETOR As Boolean
Global Volta_CALL_CENTER_CORRETOR As Boolean

'Katsumi - 06/03/2003
Global Achou%
Global AUX_u_prp As Double
Global cck_d_prt_cga As String

'+-------------------------------------------------------------------------+
'| armazena todos os dados da primeira tela referentes à apólice            |
'| de acordo c/ o aditamento escolhido. Dados que se alteram de             |
'| acordo com o aditamento                                                  |
'+-------------------------------------------------------------------------+

Type aditamento
    u_adi                   As String       ' número do aditamento
    U_VRS_ADI               As String       ' número da versão do aditamento
    u_mcf                   As String       ' número do microfilme
    d_ini_vig_apo           As String       ' data de início de vigência da apólice
    d_fim_vig_apo           As String       ' data de fim de vigência da apólice
    d_ini_vig_adi           As String       ' data de início de vigência do aditamento
    d_fim_vig_adi           As String       ' data de fim de vigência do aditamento
    D_Tab_Vda_Cmz           As String       ' data da tabela de vendas de comercialização
    d_icl_adi               As String       ' data da inclusão do aditamento
    u_prp                   As String       ' número da proposta
    d_prp                   As String       ' data da proposta
    c_cvd                   As String       ' código do canal de vendas
    t_mot_alt               As String * 200 ' texto de motivo de alteração
    u_ocr_l_crs             As String       ' número da ocorrência do local de correspondência
    N_USR                   As String * 8   ' nome do usuário
    E_RCT_PRP               As String       ' tipo de recebimento da proposta
    d_rct_prp               As String       ' data de recebimento da proposta
    t_adi                   As String * 200 ' texto do aditamento
    c_dph_doc_apo           As Integer      ' Código de Despcaho de Documento de Apólice
    c_cls_bon_cfc           As String       ' Código da classe de bônus anterior confirmado
    i_dsc_fam               As String       ' Desconto familiar
    i_bon_cfc               As String       ' Indicador de bônus
    C_E_MLD                 As String       ' Campanha
    c_cph                   As String       ' Campanha
    c_oft_cph               As String       ' Campanha
    u_lot_oft               As String       ' Campanha
    e_emi_ppl               As Integer      ' Emissão de papel
    e_mcl_vda               As Integer      ' Tipo Mercadologico de Vendas
    c_agr_rmu               As Integer      ' Codigo do agrupamento de remuneração
    
    c_sit_ctl_ppl           As String       ' Código situação controle papel - Gabriela - 17/07/2001
    d_atu_ctl_ppl           As String       ' Data Atualização controle papel - Gabriela - 17/07/2001
    n_usr_ctl_ppl           As String       ' Usuário responsábel pelo controle papel - Gabriela - 17/07/2001
    u_adi_ref_ppl           As String       ' Número do Aditamento Referência do Doc.Físico - Adriana - 12/10/2001
    
    D_HRA_ATU               As String
    u_mcf_cpl               As String       ' número do microfilme complementar - cris - 04/01/2002
    c_sit_mcf               As String       ' código situação do microfilme                 - cris - 15/01/2002 - inicio
    c_mot_sit_mcf           As String       ' código do motivo da situação do microfilme
    t_mot_sit_mcf           As String       ' texto do motivo da situação do microfilme     - cris - 15/01/2002  fim
    c_mot_alt               As Integer      ' Codigo do motivo de alteração - Renato 06/08/2002
    d_ano_mes_ref           As String       ' Ano e mes da conta Mensal - Renato 06/08/2002
    i_asn_eln               As String       ' Indicador de assinatura eletronica - Pereira 09/11/2004
    c_idt_ful               As String       'Gisely 10/03/2009
    c_cee_etd               As String       'Seguro crediário 132575
    c_mdd_aut_frt           As String       'Adelamg SS 156649
    c_esf_mot               As Integer      'Sidirlei SS 156649
    e_mig_adi               As String       'v97 Emilio - 21/03/2011 - SS_163237 - Tombamento Auto ISa+r
    d_hra_atu_icl           As String       'Data/hora de emissão na fila - Gisely 26/05/2011
    d_fim_cob_pcb           As String       'Data fim de cobertura  - Gisely 26/05/2011
End Type

Global dad_adi()            As aditamento

' cris - 15/01/2002 - inicio
Type type_dados_sit_mcf
    c_mot_sit_mcf           As String
    t_mot_sit_mcf           As String
End Type
Global dad_sit_mcf()        As type_dados_sit_mcf
' cris - 15/01/2002 - fim

'+------------------------------------------------------------------------+
'|array armazena os textos da apólice/aditamento se Diferenciado            |
'|(c_agr_fam_pro=5)                                                         |
'+------------------------------------------------------------------------+
Type texto_aditamento
    u_adi                   As String       ' número do aditamento
    e_txt_apo               As Integer      ' tipo de texto da apólice
    t_lin_txt               As String       ' texto do aditamento

    U_VRS_ADI               As String       ' número da versão do aditamento
    c_isg                   As String       ' código do Item Segurado
    c_cla                   As String       ' código da cláusula
    U_OCR_CLA               As Integer      ' número da ocorrência da cláusula
    u_ocr_lin_txt           As Integer      ' número da ocorrência da linha de texto
    c_pro                   As String       ' código do produto
    c_pla_pro               As String       ' código do plano
    c_gar                   As String       ' código da garantia
End Type

Global dad_t_lin_txt()      As texto_aditamento

' indica se o array de textos foi inicializado ou não
Global existe_dad_t_lin_txt As Integer


'+-------------------------------------------------------------------------+
'| armazena dados de apólice. Dados utilizados para carregar o grid         |
'| de apólices                                                              |
'+-------------------------------------------------------------------------+

Type apolice
    c_cia_ita               As String       ' código da companhia
    c_rmo                   As String       ' código do ramo
    u_apo_pnc               As String       ' número da apólice principal
    u_apo_dpd               As String       ' número da apólice dependente
    c_isg                   As String       ' código do item segurado
    c_cia_ita_ant           As String       ' código da companhia da ap. anterior
    c_rmo_ant               As String       ' código do ramo da ap. anterior
    u_apo_pnc_ant           As String       ' número da apólice principal anterior
    u_apo_dpd_ant           As String       ' número da apólcie dependente anterior
    c_pro                   As String       ' código do produto
    n_pro                   As String * 40  ' nome do produto
    d_ini_vig_apo           As String       ' data de início de vigência da apólice
    d_fim_vig_apo           As String       ' data de fim de vigência da apólice
    e_osg                   As String       ' tipo de objeto segurado
    d_icl_apo               As String       ' data da emissao
    e_fam_pro               As String       ' Tipo de família e produto
    c_agr_fam_pro           As String       ' Código do Agrupamento família e produto
    t_fam_pro               As String       ' Texto da família/produto
    
End Type

Global dad_apo()            As apolice

'+-------------------------------------------------------------------------+
'| Dados Auto                                                               |
'+-------------------------------------------------------------------------+

Type auto
    c_lin_aut               As String       ' código da linha do veículo
    c_mod_aut               As String       ' código do modelo do veículo
    u_chs_aut               As String * 20  ' número do chassi
    u_plc_aut               As String * 10  ' número da placa
    c_fbr_aut               As String       ' código do fabricante
    e_pcd_aut               As String       ' tipo de procedência do veículo
    n_fbr_aut               As String * 20  ' nome do fabricante do veículo
    n_lin_aut               As String * 20  ' nome da linha do veículo
    n_mod_aut               As String * 30  ' nome do modelo do veículo

    e_cmb                   As String       ' tipo de combustível
    t_coo_aut               As String       ' texto de cor
    t_pin_aut               As String       ' texto da pintura
    u_mtr_aut               As String       ' número do motor
    d_ano_fbr               As String       ' ano de fabricação
    d_ano_mod               As String       ' ano do modelo
    u_vrs_osg               As String       ' número da versão do Objeto Segurado
    u_pta_aut               As String       ' número da porta do Auto
End Type

Global dad_aut()            As auto


'+-------------------------------------------------------------------------+
'| Cláusulas                                                                |
'+-------------------------------------------------------------------------+

Type clausulas
'Mara (Origin) - 25/11/1998 - Definição de tamanhos fixos para os campos do type
    c_isg                   As String        ' código do item segurado
    c_cla                   As String * 5    ' código da cláusula
    U_OCR_CLA               As Integer       ' número da ocorrência da cláusula
    t_cla                   As String * 30  ' texto da cláusula
    d_ini_niv_cla           As String * 40     ' data de início
    d_fim_niv_cla           As String * 40     ' data final
    n_ptc_cla               As String * 45  ' nome do participante da cláusula
    t_cpl_cla_niv           As String * 200 ' texto complementar
    u_adi                   As String * 10  ' número do aditamento
    U_VRS_ADI               As String * 10  ' número da versão do aditamento
    t_lin_txt               As String * 255 ' texto da linha

    c_pro                   As String * 5   ' código do produto
    c_pla_pro               As String * 5   ' código do plano do produto
    c_gar                   As String * 10  ' código da garantia
    d_exc_cla               As String * 40  ' data de exclusão da cláusula

End Type

Global dad_cla_apo()        As clausulas

' indica se o array de cláusulas já foi inicializado
Global existe_dad_cla_apo   As Integer

Global U_OCR_CLA            As Integer

'+-------------------------------------------------------------------------+
'| controle criado para acesso às tabelas                                   |
'| dbnprod..tb_his_isg_apo, dbnprod..tb_osg_aut                             |
'| se true -> as tabelas já foram consultadas                               |
'| se false -> as tabelas deverão ser consultadas novamente                 |
'+-------------------------------------------------------------------------+

Global Flag                 As Integer

'+-------------------------------------------------------------------------+
'| indica se consulta apólice Auto                                          |
'+-------------------------------------------------------------------------+
Global ModoPesquisa         As Integer
'APO = 1 'Consulta apólice via nº de apólice
'SEG = 2 'Consulta apólice via nome do segurado
'CLI = 3 'Consulta apólice via nome do cliente
'PRP = 4 'Consulta apólice via nº de proposta
'CHS = 5 'Consulta apólice via código de chassis
'PLC = 6 'Consulta apólice via placa


'+-------------------------------------------------------------------------+
'| Apólice RPM                                                              |
'+-------------------------------------------------------------------------+

Global n_cdd                As String * 40  ' cidade
Global c_uf                 As String       ' código da Unidade Federal
Global n_uf                 As String * 2   ' nome da Unidade Federal
Global c_cep                As String * 9   ' código CEP
Global u_lgd                As String * 5   ' número logradouro
Global c_loc                As Integer      ' código do local
Global n_loc                As String       ' nome do local

'+-------------------------------------------------------------------------+
'| armazena todos os endereços fonetizados em caso de pesquisa por endereço |
'+-------------------------------------------------------------------------+

Type endereco_fonetizado
    c_loc                   As Integer      ' código do local
    n_loc                   As String * 40  ' nome do local
    c_uf                    As String * 2   ' código da Unidade Federal

End Type

Global loc_fonet()          As endereco_fonetizado


'+-------------------------------------------------------------------------+
'| armazena dados dos endereços                                             |
'+-------------------------------------------------------------------------+

Global Type endereco
    c_osg                   As String       ' código do Objeto Segurado
    e_osg                   As String * 3   ' tipo de Objeto Segurado
    u_vrs_osg               As String       ' número da versão do Objeto
    n_loc                   As String * 40  ' nome do local
    c_uf                    As String * 2   ' código da Unidade da Federação
    n_uf                    As String * 2   ' nome da Unidade da Federação
End Type

Global dad_loc()            As endereco

'+-------------------------------------------------------------------------+
'| Dados Diferenciado                                                       |
'+-------------------------------------------------------------------------+

Type item_segurado
    c_isg                   As String       ' código do Item Segurado
    c_osg                   As String       ' código do Objeto Segurado
    e_osg                   As String       ' tipo de Objeto Segurado
    u_vrs_osg               As String       ' número da versão do Obj.Segurado
    n_isg                   As String       ' Contém o nome do item segurado
    c_seg_reg               As String       ' código de seguro da região
    t_isg                   As String       ' Texto do Item Segurado
    c_reg_utl               As String       ' código da região utilizada
    q_moe_vba               As Currency     ' valor base do seguro
    u_adi                   As String       ' número do aditamento
    U_VRS_ADI               As String       ' número da versão do aditamento
    c_esf_mot               As String       ' codigo da especificação - cris - 04/01/2002 - conforme Lucia
    t_esf_mot               As String       ' texto da especificação  - cris - 04/01/2002  conforme Lucia
End Type

Global dad_isg()            As item_segurado

'+-------------------------------------------------------------------------+
'| Dados de liberações especiais                                            |
'+-------------------------------------------------------------------------+

Type TYPE_TRT_LIB_APO

    U_VRS_ADI       As String
    c_isg           As String
    c_pro           As String
    c_pla_pro       As String
    c_gar           As String
    c_cla           As String
    c_e_lib         As String
    e_isg           As String
    n_usr_azd       As String
    d_hra_atz       As String
    c_nng_rdt       As String
    t_cmt_atz       As String
    t_e_lib         As String
    c_frm_lib_coc   As String
    c_ntz_lib_prp   As String
    c_psl_slc_pnc   As String
    c_psl_slc_scu   As String
    n_pes_slc       As String
    n_usr_act       As String
    d_hra_act       As String
    t_cmt_act       As String
    n_ntz_lib_prp   As String
End Type

Global VT_TRT_LIB_APO()     As TYPE_TRT_LIB_APO

Global item_segurado        As Integer      ' indica a existência de mais de 1
                                            ' item segurado para a apólice.
                                            ' Neste caso deverão ser mostrados em listbox
                                            ' no retorno da 2a. tela

'+-------------------------------------------------------------------------+
'|indica se a pesquisa será feita por Ramo e Produto                        |
'+-------------------------------------------------------------------------+

Global i_e_osg         As String * 1

'+-------------------------------------------------------------------------+
'| STJ                                                                      |
'+-------------------------------------------------------------------------+
Global e_asu%

'+------------------------------------------------------------------------+
'| Dados do Contrato da Apólice                                             |
'+-------------------------------------------------------------------------+

Global contrato             As Integer      ' indica se contratos já foram
                                            ' selecionados p/ apólice

Global u_ctr                As String       ' número do contrato
Global u_sub_ctr            As String       ' número do sub-contrato

Global e_fam_pro_ok         As String

Global c_t_neg              As String
Global c_rmo_mfr            As String
Global u_apo_pnc_mfr        As String
Global u_isg_mfr            As String
Global e_mig                As String

Global c_suc_ubb            As String       'Gisely - SS_113265 - 12/11/2009
Global c_rmo_ubb            As String       'Gisely - SS_113265 - 12/11/2009
Global u_apo_pnc_ubb        As String       'Gisely - SS_113265 - 12/11/2009
Global sgr_ubb              As String       'Gisely - SS_113265 - 12/11/2009

Global e_sgm_neg            As String       ' tipo segmento do negócio - Alberto
Global n_sgm_neg            As String       ' nome segmento do negócio - Alberto

Type APOLICE_MAINFRAME
   c_t_neg        As String * 1
   c_rmo_mfr      As String * 2
   u_apo_pnc_mfr  As String * 7
   u_isg_mfr      As String * 10
   c_isg          As String
End Type

'Migração Banerj
Type apolice_mainframe_bnj
   c_rmo_bnj      As String * 2
   c_suc_bnj      As String * 2
   c_doc_bnj      As String * 1
   u_apo_pnc_mfr  As String * 7
   u_isg_mfr      As String * 10
   c_isg          As String
End Type

Global dad_apo_mfr()  As APOLICE_MAINFRAME
Global dad_apo_mfr_bnj()  As apolice_mainframe_bnj

Global posicao_dad_apo_mfr As Integer
Global posicao_dad_apo_mfr_bnj As Integer

Global Ind_UnloadMode As Integer

'+-------------------------------------------------------------------------+
'| Variáveis referentes ao form R1FAB007.                                   |
'+-------------------------------------------------------------------------+

Global FORM7_ATIVADO        As Integer
Global Ind_Item_Escolhido   As String
Global Opcao                As String
Global PAR_PESQ             As Long
Global PARAMETRO_PESQUISA   As String
Global flag_adi             As Integer
Global flag_item            As Integer
Global flag_n_linhas        As Integer
Global c_mot_alt            As String
Global t_mot_alt            As String
Global c_esf_mot            As String   ' Lucimara - 22/03/2001
Global t_esf_mot            As String   ' Lucimara - 22/03/2001
Global U_ADI_FORM7
Global U_VRS_ADI_FORM7
Global C_ISG_FORM7

Type type_item

    u_adi           As String
    c_isg           As String
    c_mot_alt       As String
    u_chs_aut       As String
    u_plc_aut       As String
    t_mot_alt       As String
    D_INI_VIG_DAD   As String
    c_esf_mot       As String   'Lucimara - 22/03/2001
    t_esf_mot       As String   'Lucimara - 22/03/2001
    

End Type

Global vetor_item()         As type_item
Global qtde_ite_rec         As Integer

Global flag_R1FAB002        As Integer

Global n_linhas_7469        As String

'Suzuki 07/08/98
'Vetor com os dados da tb_pes_ref
Type pes_ref
     c_idt_pes_ref  As String
End Type
Global Reg_pes()    As pes_ref

Global Conta_pes    As Integer

'Mara (Origin) - 25/11/1998 - Início
Global qtde_dad_cla_apo   As Integer
Global c_cla_ult          As Long

Global Const max_dad_cla_apo = 50

Global cont               As Integer
Global over_grid          As Integer
Global qtde_row_grid      As Integer
'Mara (Origin) - 25/11/1998 - Fim

Global ind_erro As Integer

Global IND_CHAMADA_PLACA_CHASSIS As Integer
Global C_ISG_PLACA_CHASSI As String
Global CONSULTA_POR_ITEM As Integer

Global CONSULTA_ITEM_CALL_CENTER As Integer
Global volta_item As Boolean

Global u_ocr_l_dest As String

'+-------------------------------------------------------------------------+
'|      VARIAVEIS DA TELA DE CONSULTA PROPOSTAS EXCLUÍDAS (R1FAB008)        |
'+-------------------------------------------------------------------------+

Type TYPE_PRP_EXC
    u_prp_atu           As String
    u_prp_orn           As String
    d_prt_cga           As String
    d_prp               As String
    d_rct_prp           As String
    D_EXC_PRP           As String
    n_cli               As String * 45
    e_cvd               As String
    u_rgt_ssp           As String
    u_dco_rgt_ssp       As String
    c_loc_pgt_cvd       As String
    u_fcp               As String
    c_pro               As String
    u_chs_aut           As String
    u_plc_aut           As String
    N_USR               As String
    c_bco               As String
    u_age               As String
    u_cc                As String
    u_cc_dcu            As String
    c_msg               As String
    n_lgd_ris           As String   '/* Marcos */
    u_lgd_ris           As String   '/* Marcos */
    n_cpl_ris           As String   '/* Marcos */
    n_bai_ris           As String   '/* Marcos */
    c_cep_ris           As String   '/* Marcos */
    n_cdd_ris           As String   '/* Marcos */
    s_uf_ris            As String   '/* Marcos */
    d_nas               As String   '/* Marcos */
    d_ini_vig           As String   '/* Marcos */
    n_abv_pla           As String   '/* Marcos */
    c_rmo               As String   '/* Marcos */
    u_prp               As String
End Type

Global VT_PRP_EXC()     As TYPE_PRP_EXC

' Emilio 17/01/2001
Global u_sav As String
Global u_niu As String

'Paulo

Global Const gstrApolice = "0110097000011"          '   Super Vida
Global gLinhasApolice   As Long
Global i                As Integer     'indice do array de apólice (dad_apo)
Global gstrN_Abv_Pro()  As String
Global gstrNome()       As String

'+-------------------------------------------------------------------------+
'| Lay-Out da tabela TB_WRA_PRP                                             |
'+-------------------------------------------------------------------------+
Type TYPE_TB_WRA_PRP

    u_rgt_ssp_trm       As String
    u_lot_prt_ctr       As String
    d_hra_grc_lot       As String
    u_sub_ctr           As String
    u_prp               As String
    c_isg               As String
    c_rmo               As String
    c_pro               As String
    c_cia_ita           As String
    u_loc_dsc           As String
    d_prp               As String
    d_tab_vda           As String
    c_cia_ita_ant       As String
    c_rmo_ant           As String
    u_apo_pnc_ant       As String
    u_apo_dpd_ant       As String
    c_cia_irb_ant       As String
    u_apo_ant           As String
    c_dph_doc_apo       As String
    d_ini_vig_apo       As String
    o_agv_dsc           As String
    o_plb_etl           As String
    d_prt_cga           As String
    D_HRA_ATU           As String
    N_USR               As String
    C_SIT_PRT           As String
    E_RCT_PRP           As String
    c_cpg_clv           As String
    e_etd_dad_ftm       As String
    d_dia_env_dem       As String
    e_fch_ftm           As String
    i_emi_ctf           As String
    e_nom_ctf           As String
    e_nom_ctf_cpg       As String
    e_eve_emi_ctf       As String
    d_fim_vig_apo       As String
    q_cvd_prp           As String
    q_cla_prp           As String
    q_isg_prp           As String
    c_bco_vdd           As String
    c_fun_vdd           As String
    u_age_vdd           As String
    u_age_vdd_dcu       As String
    e_cli               As String
    d_rct_prp           As String
    e_prz_vig           As String
    q_prz_vig           As String
    c_psl_pdr_inf       As String
    e_mcl_vda           As String
    c_cph               As String
    c_oft_cph           As String
    u_lot_oft           As String
    c_agr_rmu           As String
    q_fun_prp           As String
    e_sgm_neg           As String
    c_are_prt           As String
    c_sit_ctl_ppl       As String
    d_atu_ctl_ppl       As String
    n_usr_ctl_ppl       As String
    u_adi_ref_ppl       As String
    o_cms_ori           As String
    C_IDT_FUN_RSV       As String
    N_FUN_RSV           As String
    T_CGO_FUN           As String
    I_CLI_VIP           As String
    E_RLC_PES_PES       As String
    C_RLC_PES_PES       As String
    U_CPF               As String
    U_CPF_DCO           As String

End Type

Global TB_WRA_PRP As TYPE_TB_WRA_PRP


'+-------------------------------------------------------------------------+
'| Lay-Out parcial da tabela TB_WAP_PES                                     |
'+-------------------------------------------------------------------------+
Type TYPE_TB_WRA_PES

    n_pes               As String
    N_IDC1              As String
    N_IDC2              As String
    N_IDC3              As String

End Type

Global TB_WRA_PES As TYPE_TB_WRA_PES

'+-------------------------------------------------------------------------+
'| Lay-Out da tabela TB_HIS_RSV_COC                                         |
'+-------------------------------------------------------------------------+
Type TYPE_TB_HIS_RSV
    c_cia_ita           As String
    c_rmo               As String
    u_apo_pnc           As String
    u_apo_dpd           As String
    C_IDT_PES_CLI       As String
    u_adi               As String
    U_VRS_ADI           As String
    c_mot_alt           As String
    U_SEQ_OCR           As String
    c_esf_mot           As String
    D_INI_VIG_DAD       As String
    D_FIM_VIG_DAD       As String
    I_RTT               As String
    C_IDT_FUN_RSV       As String
    N_FUN_RSV           As String
    T_CGO_FUN           As String
    I_CLI_VIP           As String
    E_RLC_PES_PES       As String
    C_RLC_PES_PES       As String
    U_CPF               As String
    U_CPF_DCO           As String
    D_HRA_ATU           As String
    N_USR               As String
    N_CGE               As String           'Adelamg  14/05/2010
    C_MTC_MRH           As String
    C_ANR               As String
End Type

Global TB_HIS_RSV As TYPE_TB_HIS_RSV

Global ind_produto_func As Integer

Global ERRO_SQL%, MSG_ERRO_SQL$

Global u_tit_cpz$
Global u_tit_cpz_dco$
Global d_ini_vig_tit$
Global d_fim_vig_tit$
Global u_cbn_sor$
Global u_cbn_sor_02$
Global u_cbn_sor_03$
Global u_cbn_sor_04$
Global u_cbn_sor_05$

''Marcelo Domingos 17/12/2002
Global u_pla_cpz_dco    As String
Global u_pla_cpz        As String
Global u_ser_tit_cpz    As String

Global u_tit_cpz_cor$
Global u_tit_cpz_dco_cor$
Global d_ini_vig_tit_cor$
Global d_fim_vig_tit_cor$
Global u_cbn_sor_cor$
Global u_cbn_sor_02_cor$
Global u_cbn_sor_03_cor$
Global u_cbn_sor_04_cor$
Global u_cbn_sor_05_cor$

''Marcelo Domingos 17/12/2002
Global u_pla_cpz_dco_cor    As String
Global u_pla_cpz_cor        As String
Global u_ser_tit_cpz_cor    As String

Global d_can                As String   'Emilio L. Conde - 14/04/2003 - R1PAB017
Global d_can_cor            As String   'Emilio L. Conde - 14/04/2003 - R1PAB017

Global v_pmo_tcz_apo        As String   'Priscila de Sousa - 15/07/2009 - R1PAB013

Global tot_titulo#
Global axindex  As Integer   'Katsumi - 04/12/2002
Global Index    As Integer   'Katsumi - 04/12/2002
Global Prim_Sel As Integer   'Katsumi - 04/12/2002
Global C_MOT_EXC_PRP As String
Global N_MOT_EXC_PRP As String
Global T_MSG As String
Global T_AP_EXC As String

Type TP_MSG_ERRO
    D_EXC_PRP       As String
    T_MSG           As String
    T_AP_EXC        As String
    N_USR           As String
    C_MOT_EXC_PRP   As String
    N_MOT_EXC_PRP   As String
End Type

Global VT_MSG_ERRO() As TP_MSG_ERRO

'v60 Emilio 22/08/2006 - início
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'Declaração das variáveis da Fonetização
Public Fonet_Indices(0 To 5)   As String * 15
Public clsFonetiza              As PEGFNZ01
Public retFonetiza              As Integer
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'v60 Emilio 22/08/2006 - fim

Type APOLICE_GENIUS
   c_pas_pge      As String
   u_apo_pge      As String
   c_rmo_pge      As String
   c_ano_pge      As String
   c_seq_pge      As String
   u_adi_pge      As String
   u_adi_ixl      As String
   i_apo_pge      As String
End Type

Global dad_apo_pge()  As APOLICE_GENIUS
 
Global u_apo_genius$
Global t_apo_pgm_genius$

'Antonio 28/07/2010
Global s_ind_apo_pri_risco As String
Global s_nome_cong_pri_risco As String
Global s_num_apo_pri_risco As String
Global s_ini_vig_apo_pri_risco As String
Global s_fim_vig_apo_pri_risco As String
Global s_cod_atv_emp_auto_frota As String
Global s_des_atv_emp_auto_frota As String
'Antonio 28/07/2010

'Márcia Abreu - Inicio  - 05/01/2012 - Campo apo 2. risco (s/n)
Global s_i_apo_sgn_ris As String
'Márcia Abreu - Final   - 05/01/2012 - Campo apo 2. risco (s/n)

Global T_MDD_AUT_FRT As String 'Adelamg SS 156649

Global aux_i_asn_eln As String

Global VG_c_tab_atv_emp As Integer
Global VG_C_AGR_AUT_FRT As Integer
Public Function FU_RMO_PRO_PER_S21105(ByVal POS%) As Boolean

On Error GoTo Trata_Erro

    'Zera Variaveis do Sybase
    'Su_Zera_Var_Err_Syb
    
    FU_RMO_PRO_PER_S21105 = False
    
    'Inicialização dos códigos de erro da DBLibrary e do SQL Server.
    Err_Syb = 0
    Msg_Syb = 0
    
    'Inicializa a Procedure
    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_RMO_PRO_PER_S21105", 0)
    
    If Ret% = FAIL Then
        GoTo Trata_Erro
    End If
    
    'Configura os Parâmetros da Procedure
    If SQLRPCParam(SqlConn, "@c_rmo", Not SQLRPCRETURN, SQLINT2%, 0, 0, c_rmo) = FAIL Then GoTo Trata_Erro
    If SQLRPCParam(SqlConn, "@c_pro", Not SQLRPCRETURN, SQLINT2%, 0, 0, c_pro$) = FAIL Then GoTo Trata_Erro
    'GUHENRI - 29/01/2013  Projeto PJotinha - PR-2012-0005787
    If SQLRPCParam(SqlConn, "@d_tab_vda", Not SQLRPCRETURN, SQLDATETIME, 0, 0, Format(Trim(dad_adi(POS%).D_Tab_Vda_Cmz), "MM/DD/YYYY")) = FAIL Then GoTo Trata_Erro
    If SQLRPCParam(SqlConn, "@c_tab_atv_emp", SQLRPCRETURN, SQLINT2%, 0, 0, 0) = FAIL Then GoTo Trata_Erro
    If SQLRPCParam(SqlConn, "@c_err", SQLRPCRETURN, SQLINT4%, 0, 0, 0) = FAIL Then GoTo Trata_Erro
    If SQLRPCParam(SqlConn, "@t_err", SQLRPCRETURN, SQLCHAR%, 0, 0, 0) = FAIL Then GoTo Trata_Erro
    
    Ret% = SQLRPCSend%(SqlConn%)
    
    If Ret% = FAIL Then
        GoTo Trata_Erro
    End If
    
    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop
    
'+-------------------------------------------------------------------------+
'|        VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO          |
'+-------------------------------------------------------------------------+
    'Erro da DBLibrary ou do SQL Server.
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Or (Ret% = FAIL) Then
        Ret = SqlCancel(SqlConn%)
        GoTo Trata_Erro
    End If
    
    'Aqui retorno dos parametros de OUTPUT Stored Procedure
    VG_c_tab_atv_emp = SqlRetData(SqlConn%, 1)
    Err_Syb& = SqlRetData(SqlConn%, 2)
    ErrStr_Syb = SqlRetData(SqlConn%, 3)
    
    'Consiste os se não houve erro na procedure
    If Err_Syb& <> 0 Then
        Err.Raise 514, "", Err_Syb& & " - " & ErrStr_Syb & " - "
    End If
    
    FU_RMO_PRO_PER_S21105 = True

Exit Function
Trata_Erro:
    MsgBox "FU_RMO_PRO_PER_S21105()", Err
    
End Function


Function fu_prp_aut_frt() As Integer
'Antonio 06/08/2010


Dim Ret As Integer
Dim n_linhas As String

    fu_prp_aut_frt = False

    VG_C_AGR_AUT_FRT = 0

    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_PRP_AUT_FRT_S18685", 0)
    If Ret% = FAIL% Then
        MsgBox "Erro na função: fu_prp_aut_frt"
        Exit Function
    End If
    
    'Passa parametros para Store Procedure
    If SQLRPCParam(SqlConn, "@c_rmo", Not SQLRPCRETURN, SQLINT2, 0, 0, c_rmo) = FAIL% Then Exit Function
    If SQLRPCParam(SqlConn, "@c_pro", Not SQLRPCRETURN, SQLINT4%, 0, 0, c_pro) = FAIL% Then Exit Function
    If SQLRPCParam(SqlConn, "@C_PRP_AUT_FRT", SQLRPCRETURN, SQLINT4%, 0, 0, "") = FAIL% Then Exit Function
    If SQLRPCParam(SqlConn, "@LINHAS_RET", SQLRPCRETURN, SQLINT4%, 0, 0, "") = FAIL% Then Exit Function
    If SQLRPCParam(SqlConn, "@C_AGR", SQLRPCRETURN, SQLINT4%, 0, 0, "") = FAIL% Then Exit Function      'YAMADAP - PJOTINHA - 27/05/2013
    
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        MsgBox "Erro na função: fu_prp_aut_frt"
        Exit Function
    End If

    ' executa stored procedure
'    Ret% = SqlOk%(SqlConn%)
'    If Ret% = FAIL% Then
'        MsgBox "Erro na função: fu_prp_aut_frt"
'        Exit Function
'    End If
    
    Dim c_agr_aut_frota As String
    
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL%
        Do Until SqlNextRow(SqlConn%) = NOMOREROWS%
        
            c_agr_aut_frota = SqlData(SqlConn%, 1)
           
        Loop
        Ret% = SqlResults(SqlConn%)
        If Ret% = FAIL% Then
            MsgBox "Erro na função: fu_prp_aut_frt"
            Exit Function
        End If
    Loop
    
    
    n_linhas$ = SqlRetData(SqlConn%, 2)
    'dosstos - 18/07/2013 - inclusão de tratamento Val
    VG_C_AGR_AUT_FRT = Val(SqlRetData(SqlConn%, 3))

    If c_agr_aut_frota = "S" Then fu_prp_aut_frt = True
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_prp_aut_frt = False

End Function


Function Fu_Agrup_Garantech() As Boolean

    Fu_Agrup_Garantech = False

    'Inicializar Stored Procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnapoio..pr_agr_pro_S01267", 0)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcInit%, "Fu_Pr_Agr_Pro_Garantech"
        Exit Function
    End If
    
    ' Parâmetros da Stored Procedure
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_pro", c_pro$, SQLINT2%) = FAIL Then Exit Function
    
    If c_pro$ = 1 Then
        If FU_Parametro(SqlConn, "@c_e_agr", 103, SQLINT2%) = FAIL Then Exit Function
    Else
        If FU_Parametro(SqlConn, "@c_e_agr", 122, SQLINT2%) = FAIL Then Exit Function
    End If
        
    If FU_Parametro_Ret(SqlConn, "@c_ret", 0, SQLINT2%) = FAIL Then Exit Function

    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcSend%, "Fu_Pr_Agr_Pro_Garantech"
        Exit Function
    End If

    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlOk%, "Fu_Pr_Agr_Pro_Garantech"
        Exit Function
    End If
    
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "Fu_Pr_Agr_Pro_Garantech"
        Exit Function
    End If

    PRODUT0_GARANTECH% = False
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)

        Do Until Ret% = NOMOREROWS
            
            PRODUT0_GARANTECH% = True
            
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "Fu_Pr_Agr_Pro_Garantech"
        Exit Function
    End If

    Fu_Agrup_Garantech = True
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Fu_Agrup_Garantech = False

End Function

Function FU_PR_MVP_UBB_MIS_S19169()
'Kondor - SS 132490

    ' retorno de funções
    Dim Ret As Integer
    Dim AUX_c_err       As Integer
    Dim AUX_n_linhas    As Integer

    FU_PR_MVP_UBB_MIS_S19169 = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnmigvd..PR_MVP_UBB_MIS_S19169", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "FU_PR_MVP_UBB_MIS_S19169"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@e_psq", "4", SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_cpf", "", SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_cpf_dco", "", SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@d_vig", "", SQLDATETIM4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_err", "", SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "FU_PR_MVP_UBB_MIS_S19169"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "FU_PR_MVP_UBB_MIS_S19169"
        Exit Function
    End If


    'Processamento dos resultados da stored procedure
    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        'Recuperação e processamento dos dados em cada linha.
        Do Until Ret% = NOMOREROWS Or Ret% = FAIL
            'retorno do select
            '1-u_ctr_etl_fmt,
            '2-u_ctr_etl_seq,
            '3-c_pro_ubb    ,
            '4-c_sit_prt    ,
            '5-c_rmo_ubb    ,
            '6-d_prp_ubb    ,
            '7-u_prp        ,
            '8-c_cia_ita    ,
            '9-c_rmo        ,
            '10-u_apo_pnc    ,
            '11-u_apo_dpd    ,
            '12-c_pro        ,
            '13-c_pla_pro    ,
            '14-i_exi_sin    ,
            i_exi_sin_mis = Trim$(SqlData(SqlConn%, 14))
            '15-i_sit_emi    ,
            '16-i_sit_apo    ,
            '17-n_pes        ,
            '18-d_nas        ,
            '19-d_ini_vig_apo,
            '20-d_fim_vig_apo
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "FU_PR_MVP_UBB_MIS_S19169"
        Exit Function
    End If
    
    ' parâmetros de retorno
    AUX_n_linhas = Trim$(SqlRetData(SqlConn%, 1))
    AUX_c_err = Trim$(SqlRetData(SqlConn%, 2))
    
    If AUX_n_linhas <> 1 Or AUX_c_err <> 0 Then
        Exit Function
    End If
    
    FU_PR_MVP_UBB_MIS_S19169 = True
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then FU_PR_MVP_UBB_MIS_S19169 = False

End Function

Function FU_PR_NWF_S14226(ByVal PRM_u_prp$, _
                          ByVal PRM_d_prt_cga$, _
                          ByRef PRM_n_linhas%, _
                          ByRef PRM_tip_wkf$) As Boolean
    
'+-------------------------------------------------------------------------+
'|   Executa procedure de seleção dos dados básicos do workflow do negócio  |
'+-------------------------------------------------------------------------+
    On Error GoTo Trata_Erro_S14226

    Dim AUX_RET         As Integer
    Dim AUX_c_err       As Integer
    Dim AUX_t_err       As String

    FU_PR_NWF_S14226 = False

    Err_Syb& = 0
    Msg_Syb& = 0

    'Inicializa procedure
    AUX_RET = SQLRPCInit%(SqlConn%, "DBNCORP..PR_NWF_S14226", 0)

    If AUX_RET = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_NWF_S14226.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Envia parâmetro para procedure
    If FU_Parametro_Ret(SqlConn, "@u_linhas", 0, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_err", 0, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@t_err", "", SQLVARCHAR%) = FAIL Then Exit Function
    
    If FU_Parametro(SqlConn, "@u_prp", PRM_u_prp$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@d_prt_cga", PRM_d_prt_cga$, SQLDATETIME%) = FAIL Then Exit Function

    If FU_Parametro_Ret(SqlConn, "@tip_wkf", "", SQLVARCHAR%) = FAIL Then Exit Function '' minitir - ss221940 - 01/11/2012

    AUX_RET = SQLRPCSend%(SqlConn%)

    If AUX_RET = FAIL Then
        MsgBox "Não foi possível enviar a lista de parâmetros da stored procedure PR_NWF_S14226 ao servidor.", MB_ICONEXCLAMATION
        Exit Function
    End If

    AUX_RET = SqlOk%(SqlConn%)

    If AUX_RET = FAIL Then
        MsgBox "Não foi possível executar a stored procedure PR_NWF_S14226.", MB_ICONEXCLAMATION
        Exit Function
    End If

'+-------------------------------------------------------------------------+
'|              Armazena o retorno dos parâmetros em vetor                  |
'+-------------------------------------------------------------------------+
    AUX_RET = SqlResults%(SqlConn%)
    Do Until AUX_RET = NOMORERESULTS Or AUX_RET = FAIL
        AUX_RET = SqlNextRow%(SqlConn%)
        Do Until AUX_RET = NOMOREROWS Or AUX_RET = FAIL
            
            VG_u_idt_nwf$ = Trim(SqlData$(SqlConn%, 1))
        
            AUX_RET = SqlNextRow%(SqlConn%)
        Loop
        AUX_RET = SqlResults%(SqlConn%)
    Loop

    If AUX_RET = FAIL Then
        MsgBox "Não foi possível processar os resultados da stored procedure PR_NWF_S14226.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Erro da DBLibrary ou do SQL Server.
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Then
        MsgBox "Não foi possível processar os resultados da stored procedure PR_NWF_S14226. Erro Sybase: " & Trim(Str(Err_Syb&)), MB_ICONEXCLAMATION
        Exit Function
    End If
    
    PRM_n_linhas% = Val(Trim(SqlRetData$(SqlConn%, 1)))
    AUX_c_err% = Val(Trim(SqlRetData$(SqlConn%, 2)))
    AUX_t_err$ = Trim(SqlRetData$(SqlConn%, 3))
    PRM_tip_wkf$ = Trim(Trim(SqlRetData$(SqlConn%, 4))) '' minitir - ss221940 - 01/11/2012
   
    If AUX_c_err% <> 0 Then
        MsgBox "Erro ao verificar se a proposta foi emitida pelo Workflow. Proposta: " & PRM_u_prp$, vbCritical
        Exit Function
    End If
    
    FU_PR_NWF_S14226 = True

    Exit Function

'+-------------------------------------------------------------------------+
'|                      Rotina de tratamento de erro                        |
'+-------------------------------------------------------------------------+
Trata_Erro_S14226:

    MsgBox "Erro na function PR_NWF_S14226: " & Err & " - " & error$(Err) & ".", vbCritical

    Err = 0
    
    Exit Function
    
    FU_PR_NWF_S14226 = True

End Function

Function FU_PR_CTL_EMI_PRP_S08333(ByVal PRM_c_cia_ita$, _
                                  ByVal PRM_c_rmo$, _
                                  ByVal PRM_u_apo_pnc$, _
                                  ByVal PRM_u_apo_dpd$, _
                                  ByVal PRM_u_adi$, _
                                  ByVal PRM_u_vrs_adi$) As Boolean

    FU_PR_CTL_EMI_PRP_S08333 = False

'+------------------------------------------------------------------------+
'|   Executa procedure de seleção dos dados básicos do workflow do negócio  |
'+-------------------------------------------------------------------------+
    On Error GoTo Trata_Erro_S08333

    Dim AUX_RET         As Integer
    Dim AUX_n_linhas    As Integer
    Dim AUX_c_err       As Integer

    FU_PR_CTL_EMI_PRP_S08333 = False

    Err_Syb& = 0
    Msg_Syb& = 0

    'Inicializa procedure
    AUX_RET = SQLRPCInit%(SqlConn%, "DBNPROD..PR_CTL_EMI_PRP_S08333", 0)

    If AUX_RET = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_CTL_EMI_PRP_S08333.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Envia parâmetro para procedure
    If FU_Parametro(SqlConn, "@c_cia_ita", PRM_c_cia_ita$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", PRM_c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", PRM_u_apo_pnc$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", PRM_u_apo_dpd$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", PRM_u_adi$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_adi", PRM_u_vrs_adi$, SQLINT4%) = FAIL Then Exit Function
    
    If FU_Parametro_Ret(SqlConn, "@error", 0, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT4%) = FAIL Then Exit Function

    AUX_RET = SQLRPCSend%(SqlConn%)

    If AUX_RET = FAIL Then
        MsgBox "Não foi possível enviar a lista de parâmetros da stored procedure PR_CTL_EMI_PRP_S08333 ao servidor.", MB_ICONEXCLAMATION
        Exit Function
    End If

    AUX_RET = SqlOk%(SqlConn%)

    If AUX_RET = FAIL Then
        MsgBox "Não foi possível executar a stored procedure PR_CTL_EMI_PRP_S08333.", MB_ICONEXCLAMATION
        Exit Function
    End If
    
    'Carla 29/06/2005 (evitar que fique sujeita na variável)
    VT_TIPO_EMI_PRP.u_paa_doc_ged$ = ""


'+-------------------------------------------------------------------------+
'|              Armazena o retorno dos parâmetros em vetor                  |
'+-------------------------------------------------------------------------+
    AUX_RET = SqlResults%(SqlConn%)
    Do Until AUX_RET = NOMORERESULTS Or AUX_RET = FAIL
        AUX_RET = SqlNextRow%(SqlConn%)
        Do Until AUX_RET = NOMOREROWS Or AUX_RET = FAIL
            
            VT_TIPO_EMI_PRP.c_pro$ = Trim(SqlData$(SqlConn%, 1))
            VT_TIPO_EMI_PRP.e_cvd_prp$ = Trim(SqlData$(SqlConn%, 2))
            VT_TIPO_EMI_PRP.u_rgt_ssp_prp$ = Trim(SqlData$(SqlConn%, 3))
            VT_TIPO_EMI_PRP.u_dco_ssp_prp$ = Trim(SqlData$(SqlConn%, 4))
            VT_TIPO_EMI_PRP.c_loc_pgt_prp$ = Trim(SqlData$(SqlConn%, 5))
            VT_TIPO_EMI_PRP.u_prp$ = Trim(SqlData$(SqlConn%, 6))
            VT_TIPO_EMI_PRP.d_prt_cga$ = Trim(SqlData$(SqlConn%, 7))
            'Carla 29/06/2005
            VT_TIPO_EMI_PRP.u_paa_doc_ged$ = Trim(SqlData$(SqlConn%, 8))
            VT_TIPO_EMI_PRP.u_ctc = Trim(SqlData$(SqlConn%, 9)) 'v99 Emilio 23/05/2011 - SS_163237 - Tombamento Auto Frota UBB x ISa+r
        
            AUX_RET = SqlNextRow%(SqlConn%)
        Loop
        AUX_RET = SqlResults%(SqlConn%)
    Loop

    If AUX_RET = FAIL Then
        MsgBox "Não foi possível processar os resultados da stored procedure PR_CTL_EMI_PRP_S08333.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Erro da DBLibrary ou do SQL Server.
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Then
        MsgBox "Não foi possível processar os resultados da stored procedure PR_CTL_EMI_PRP_S08333. Erro Sybase: " & Trim(Str(Err_Syb&)), MB_ICONEXCLAMATION
        Exit Function
    End If
    
    AUX_c_err% = Val(Trim(SqlRetData$(SqlConn%, 1)))
    AUX_n_linhas% = Val(Trim(SqlRetData$(SqlConn%, 2)))
   
    If AUX_c_err% <> 0 Then
        MsgBox "Erro ao selecionar os dados da apólice: " & PRM_c_cia_ita$ & "." & PRM_c_rmo & "." & PRM_u_apo_pnc$ & "." & PRM_u_apo_dpd$ & "." & PRM_u_adi$
        Exit Function
    End If
    
    If AUX_n_linhas% = 0 Then
        MsgBox "Não encontrado dados para a apólice: " & PRM_c_cia_ita$ & "." & PRM_c_rmo & "." & PRM_u_apo_pnc$ & "." & PRM_u_apo_dpd$ & "." & PRM_u_adi
        Exit Function
    End If
    
    FU_PR_CTL_EMI_PRP_S08333 = True

    Exit Function

'+-------------------------------------------------------------------------+
'|                      Rotina de tratamento de erro                        |
'+------------------------------------------------------------------------+
Trata_Erro_S08333:

    MsgBox "Erro na function PR_CTL_EMI_PRP_S08333: " & Err & " - " & error$(Err) & ".", vbCritical

    Err = 0
    
    Exit Function
    
    FU_PR_CTL_EMI_PRP_S08333 = True
    
End Function
Function fu_sel_dados_marinha() As Boolean

    Dim existe_mar As String
    
    fu_sel_dados_marinha = False
    
    If Not FU_PR_AGR_PRO_S10840("M") Then        'Adelamg 18/10/2010
        MsgBox "Erro no acesso a PRS10840.", MB_ICONSTOP
        Screen.MousePointer = DEFAULT
        Exit Function
    End If
    
    '+-------------------------------------------------------------------------+
    '| Carrega o resultado da leitura                                           |
    '+-------------------------------------------------------------------------+
    Ret% = SqlResults%(SqlConn%)
    
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            existe_mar$ = SqlData$(SqlConn%, 9)
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        
        Ret% = SqlResults%(SqlConn%)
    Loop
        
    'Verifica erro
    If ERRO_SQL% Then
        SU_LogOff
        MsgBox MSG_ERRO_SQL$, MB_ICONSTOP, Space$(30) & "Erro na Execução da PRS10840" & Space$(55)
        Screen.MousePointer = DEFAULT
        Exit Function
    End If

    If (existe_mar$ <> "0" And existe_mar$ <> Empty) Then
        fu_sel_dados_marinha = True
    Else
        fu_sel_dados_marinha = False
    End If
        

End Function
Function fu_sel_apo_genius() As Boolean
    ' seleciona o número da Apolice da nova Arquitetura

    ' retorno de funções
    Dim Ret As Integer
    
    fu_sel_apo_genius = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_adi_ref_pge_s15972", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_apo_genius"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_apo_genius"
        Exit Function
    End If

    ' executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_apo_genius"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_genius"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
        
            If UBound(dad_apo_pge) = -1 Then
                ReDim dad_apo_pge(0)
            Else
                ReDim Preserve dad_apo_pge(UBound(dad_apo_pge) + 1)
            End If

            dad_apo_pge(UBound(dad_apo_pge)).c_pas_pge = Trim$(SqlData$(SqlConn%, 3))
            dad_apo_pge(UBound(dad_apo_pge)).u_apo_pge = Trim$(SqlData$(SqlConn%, 4))
            dad_apo_pge(UBound(dad_apo_pge)).c_rmo_pge = Trim$(SqlData$(SqlConn%, 5))
            dad_apo_pge(UBound(dad_apo_pge)).c_ano_pge = Trim$(SqlData$(SqlConn%, 6))
            dad_apo_pge(UBound(dad_apo_pge)).c_seq_pge = Trim$(SqlData$(SqlConn%, 7))

            dad_apo_pge(UBound(dad_apo_pge)).u_adi_pge = Trim$(SqlData$(SqlConn%, 8))
            dad_apo_pge(UBound(dad_apo_pge)).u_adi_ixl = Trim$(SqlData$(SqlConn%, 16))

            dad_apo_pge(UBound(dad_apo_pge)).i_apo_pge = Trim$(SqlData$(SqlConn%, 28))


            fu_sel_apo_genius = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_genius"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_apo_genius = False
    
End Function

Function FU_SEL_LGN_USR(Lsr_N_USR As String) As String

    FU_SEL_LGN_USR = ""

    Ret% = SQLRPCInit%(SqlConn%, "DBNLOGIN..PR_LGN_USR_S01746", 0)
    If Ret% = FAIL Then
       su_erro_st_proc ST_SqlRpcInit%, "FU_SEL_LGN_USR"
       Exit Function
    End If

    Ret% = FU_Parametro(SqlConn, "@N_USR", Usuario$, SQLCHAR%)
    Ret% = FU_Parametro_Ret(SqlConn, "@C_PSL", "", SQLINT4%)
    Ret% = FU_Parametro_Ret(SqlConn, "@RETORNO", "", SQLINT2%)
    Ret% = FU_Parametro_Ret(SqlConn, "@n_ets_usr", "", SQLCHAR%)
    

    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
       su_erro_st_proc ST_SqlRpcSend%, "FU_SEL_LGN_USR"
       Exit Function
    End If

    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
       su_erro_st_proc ST_SqlOk%, "FU_SEL_LGN_USR"
       Exit Function
    End If

    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL Then
       su_erro_st_proc ST_SqlResults%, "FU_SEL_LGN_USR"
       Exit Function
    End If

    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
        If Ret% = FAIL Then
            su_erro_st_proc ST_SqlResults%, "FU_SEL_LGN_USR"
            Exit Function
        End If
    Loop

    If SqlRetData$(SqlConn%, 2) = "0" Then
        FU_SEL_LGN_USR = SqlRetData$(SqlConn%, 3)
    End If

End Function

Function fu_pr_uog_s01650(Ac_psl_pdr_inf As String)

'---------------------------------------------------------------------------
'          Verifica o Orgão Produtor
'---------------------------------------------------------------------------
    
    fu_pr_uog_s01650 = False
    
    Ret% = SQLRPCInit%(SqlConn%, "dbnapoio..PR_UOG_S01650", 0)
    If Ret% = FAIL Then
       'su_erro_st_proc ST_sqlrpcinit%, "PR_UOG_S01650"
       Exit Function
    End If

    Ret% = FU_Parametro(SqlConn, "@c_psl", Ac_psl_pdr_inf$, SQLINT4%)
    Ret% = FU_Parametro_Ret(SqlConn, "@u_psl_dco", 0, SQLINT2%)
    Ret% = FU_Parametro_Ret(SqlConn, "@n_uog", "", SQLCHAR%)
    
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
       'su_erro_st_proc ST_sqlrpcsend%, "PR_UOG_S01650"
       Exit Function
    End If

    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
       'su_erro_st_proc ST_sqlok%, "PR_UOG_S01650"
       Exit Function
    End If

    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL Then
       'su_erro_st_proc ST_sqlresults%, "PR_UOG_S01650"
       Exit Function
    End If

    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
       Do Until SqlNextRow%(SqlConn%) = NOMOREROWS
       
       Loop
       Ret% = SqlResults%(SqlConn%)
       If Ret% = FAIL Then
          'su_erro_st_proc ST_sqlresults%, "PR_UOG_S01650"
          Exit Function
       End If
    Loop

    u_psl_dco$ = SqlRetData(SqlConn%, 1)
    n_uog$ = SqlRetData(SqlConn%, 2)

    fu_pr_uog_s01650 = True
    

End Function
Function FU_SEL_APO_MFR_PTN_VELHA_AGF(APOLICE_MAINFRAME$) As Integer

    ' retorno de funções
    Dim Ret As Integer

    FU_SEL_APO_MFR_PTN_VELHA_AGF = False
    APOLICE_MAINFRAME$ = ""

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_apo_mfr_ptn_s08420", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "FU_SEL_APO_MFR_PTN_VELHA_AGF"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "FU_SEL_APO_MFR_PTN_VELHA_AGF"
        Exit Function
    End If

    ' executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "FU_SEL_APO_MFR_PTN_VELHA_AGF"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "FU_SEL_APO_MFR_PTN_VELHA_AGF"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            APOLICE_MAINFRAME$ = Trim$(SqlData$(SqlConn%, 6))

            FU_SEL_APO_MFR_PTN_VELHA_AGF = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "FU_SEL_APO_MFR_PTN_VELHA_AGF"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then FU_SEL_APO_MFR_PTN_VELHA_AGF = False

End Function

Function FU_SEL_APO_AGF(APOLICE_MAINFRAME$) As Integer

    ' retorno de funções
    Dim Ret As Integer

    FU_SEL_APO_AGF = False
    
    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnapomf..pr_apo_agf_s13477", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "FU_SEL_APO_AGF"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_pro", c_pro$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_agf", APOLICE_MAINFRAME$, SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "FU_SEL_APO_AGF"
        Exit Function
    End If

    ' executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "FU_SEL_APO_AGF"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "FU_SEL_APO_AGF"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            c_fil_agf$ = Trim$(SqlData$(SqlConn%, 1))
            c_rmo_agf$ = Trim$(SqlData$(SqlConn%, 2))
            c_pro$ = Trim$(SqlData$(SqlConn%, 3))
            u_etl_agf$ = Trim$(SqlData$(SqlConn%, 4))
            u_sub_etl_agf$ = Trim$(SqlData$(SqlConn%, 5))
            u_apo_agf$ = Trim$(SqlData$(SqlConn%, 6))
            d_vig_prx_agf$ = Format(Trim$(SqlData$(SqlConn%, 7)), "dd/mm/yyyy")
            
            FU_SEL_APO_AGF = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "FU_SEL_APO_AGF"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then FU_SEL_APO_AGF = False

End Function

Function Fu_Sel_Motivo_Garantech(u_adi_aux As Integer)

    'Carrega o Nome do Motivo de Aditamento mas com caracteristicas Garantech
    
    Fu_Sel_Motivo_Garantech = False
            
    'Inicializa a procedure de seleção de dados
    Ret% = SQLRPCInit(SqlConn%, "DBNPROD..PR_MOTIVO_GARANTECH_S18158", 0)
    
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "Fu_Pr_Sel_Motivo_Garantech"
        Exit Function
    End If
      
    ' passa parâmetros
    If FU_Parametro_Ret(SqlConn, "@c_err", 0, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@t_err", "", SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", u_adi_aux%, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "Fu_Pr_Sel_Motivo_Garantech"
        Exit Function
    End If
  
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "Fu_Pr_Sel_Motivo_Garantech"
        Exit Function
    End If
  
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "Fu_Pr_Sel_Motivo_Garantech"
        Exit Function
    End If
    
    Motivo_Garantech$ = ""
    'processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
        
            Motivo_Garantech$ = RTrim(LTrim(SqlData(SqlConn%, 1)))
            
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "Fu_Pr_Sel_Motivo_Garantech"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
        Fu_Sel_Motivo_Garantech = False
        Exit Function
    End If
        
    Fu_Sel_Motivo_Garantech = True

End Function

Function Fu_Sel_NomeCliente(i As Integer) As Boolean

Dim C_IDT_PES_CLI           As Long

    C_IDT_PES_CLI = Empty
    Fu_Sel_NomeCliente = False

    Ret% = SQLRPCInit%(SqlConn%, "DBNPROD..PR_CLI_APO_S00612", 0)
    
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "Fu_Sel_NomeCliente"
        Exit Function
    End If
    
    ' passa parametros
    
    If FU_Parametro_Ret(SqlConn, "@c_err", 0, SQLINT4) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_stp_err", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_cia_ita", dad_apo(i).c_cia_ita, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", dad_apo(i).c_rmo, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", dad_apo(i).u_apo_pnc, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", dad_apo(i).u_apo_dpd, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_idt_pes_cli", 0, SQLINT4%) = FAIL% Then Exit Function
  
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "Fu_Sel_NomeCliente"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "Fu_Sel_NomeCliente"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "Fu_Sel_NomeCliente"
        Exit Function
    End If
    
   ' processa os resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "Fu_Sel_NomeCliente"
        Exit Function
    End If
    
    C_IDT_PES_CLI = Trim(SqlRetData$(SqlConn%, 3))
    
    Ret% = SQLRPCInit%(SqlConn%, "DBNPESSO..Pr_Pes_S01056", 0)
    
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "Fu_Sel_NomeCliente"
        Exit Function
    End If
    
    
    ' passa parametros
    If FU_Parametro(SqlConn, "@c_idt_pes", C_IDT_PES_CLI, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_pes", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_rtn", 0, SQLINT2%) = FAIL% Then Exit Function
  
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "Fu_Sel_NomeCliente"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "Fu_Sel_NomeCliente"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "Fu_Sel_NomeCliente"
        Exit Function
    End If
    
   ' processa os resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "Fu_Sel_NomeCliente"
        Exit Function
    End If
    
    Fu_Sel_NomeCliente = True
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Fu_Sel_NomeCliente = False
End Function

Function Fu_Sel_Niu_Apolice() As Integer

   Dim Ret As Integer     'retorno de funções
   Dim i   As Integer     'array de apólice
   Dim Contador As Integer
    
   Fu_Sel_Niu_Apolice = False

   ' inicializa stored procedure
   Ret% = SQLRPCInit%(SqlConn%, "dbnprod..PR_CTL_EMI_SAV_S12193", 0)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlRpcInit%, "Fu_Sel_Niu_Apolice"
      Exit Function
      
   End If
   
   ' passa parâmetros
   If FU_Parametro(SqlConn, "@U_SAV", u_sav$, SQLCHAR%) = FAIL% Then Exit Function
   If FU_Parametro_Ret(SqlConn, "@N_linhas", 0, SQLINT2%) = FAIL% Then Exit Function
   If FU_Parametro(SqlConn, "@U_NIU", u_niu$, SQLCHAR%) = FAIL% Then Exit Function

   ' envia comando
   Ret% = SQLRPCSend%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlRpcSend%, "Fu_Sel_Niu_Apolice"
      Exit Function
   End If

   ' executa stored procedure
   Ret% = SqlOk%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlOk%, "Fu_Sel_Niu_Apolice"
      Exit Function
   End If

   ' verifica resultados
   Ret% = SqlResults%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlResults%, "Fu_Sel_Niu_Apolice"
      Exit Function
   End If
   
   ' processa resultados
     Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
         Ret% = SqlNextRow%(SqlConn%)
         
         Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
         
                ReDim Preserve dad_apo(0 To i%) As apolice
                
                dad_apo(i%).c_cia_ita = Trim$(SqlData$(SqlConn%, 1))
                dad_apo(i%).c_rmo = Trim$(SqlData$(SqlConn%, 2))
                dad_apo(i%).u_apo_pnc = Trim$(SqlData$(SqlConn%, 3))
                dad_apo(i%).u_apo_dpd = Trim$(SqlData$(SqlConn%, 4))
                dad_apo(i%).e_osg = e_osg$
                
                dad_apo(i%).e_fam_pro$ = Trim$(SqlData$(SqlConn%, 5))
                dad_apo(i%).c_agr_fam_pro$ = Trim$(SqlData$(SqlConn%, 6))
                dad_apo(i%).t_fam_pro = Trim$(SqlData$(SqlConn%, 7))
                
                i% = i% + 1
                
                Fu_Sel_Niu_Apolice = True
                
                Ret% = SqlNextRow%(SqlConn%)
         Loop
 
         Ret% = SqlResults%(SqlConn%)
     Loop
 
     If Ret% = FAIL% Then
         su_erro_st_proc ST_SqlResults%, "Fu_Sel_Niu_Apolice"
         Exit Function
     End If
 
     If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
         Fu_Sel_Niu_Apolice = False
         Exit Function
     End If
    
End Function

Function fu_sel_sav_apolice() As Integer

   Dim Ret As Integer     'retorno de funções
   Dim i   As Integer     'array de apólice
   Dim Contador As Integer
    
   fu_sel_sav_apolice = False

   ' inicializa stored procedure
   Ret% = SQLRPCInit%(SqlConn%, "dbnprod..PR_CTL_EMI_SAV_S12193", 0)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlRpcInit%, "fu_sel_sav_apolice"
      Exit Function
      
   End If
   
   ' passa parâmetros
   If FU_Parametro(SqlConn, "@U_SAV", u_sav$, SQLCHAR%) = FAIL% Then Exit Function
   If FU_Parametro_Ret(SqlConn, "@N_linhas", 0, SQLINT2%) = FAIL% Then Exit Function

   ' envia comando
   Ret% = SQLRPCSend%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlRpcSend%, "fu_sel_sav_apolice"
      Exit Function
   End If

   ' executa stored procedure
   Ret% = SqlOk%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlOk%, "fu_sel_sav_apolice"
      Exit Function
   End If

   ' verifica resultados
   Ret% = SqlResults%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlResults%, "fu_sel_sav_apolice"
      Exit Function
   End If
   
   ' processa resultados
     Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
         Ret% = SqlNextRow%(SqlConn%)
         
         Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
         
                ReDim Preserve dad_apo(0 To i%) As apolice
                
                dad_apo(i%).c_cia_ita = Trim$(SqlData$(SqlConn%, 1))
                dad_apo(i%).c_rmo = Trim$(SqlData$(SqlConn%, 2))
                dad_apo(i%).u_apo_pnc = Trim$(SqlData$(SqlConn%, 3))
                dad_apo(i%).u_apo_dpd = Trim$(SqlData$(SqlConn%, 4))
                dad_apo(i%).e_osg = e_osg$
                
                dad_apo(i%).e_fam_pro$ = Trim$(SqlData$(SqlConn%, 5))
                dad_apo(i%).c_agr_fam_pro$ = Trim$(SqlData$(SqlConn%, 6))
                dad_apo(i%).t_fam_pro = Trim$(SqlData$(SqlConn%, 7))
                
                i% = i% + 1
                
                fu_sel_sav_apolice = True
                
                Ret% = SqlNextRow%(SqlConn%)
         Loop
 
         Ret% = SqlResults%(SqlConn%)
     Loop
 
     If Ret% = FAIL% Then
         su_erro_st_proc ST_SqlResults%, "fu_sel_sav_apolice"
         Exit Function
     End If
 
     If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
         fu_sel_sav_apolice = False
         Exit Function
     End If
    


End Function

Function fu_sel_tot_tit() As Integer
Dim Ret                 As Integer     'retorno de funções
    
    fu_sel_tot_tit = False
    tot_titulo# = 0
    
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..PR_NMR_SOL_CPZ_S11826", 0)
    
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_tot_tit"
        Exit Function
    End If
    
    If FU_Parametro(SqlConn, "@e_osg", e_osg$, SQLCHAR%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_tot_tit"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_tot_tit"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_tot_tit"
        Exit Function
    End If
    
   ' processa os resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            
            tot_titulo# = Val(SqlData$(SqlConn%, 1))
    
            fu_sel_tot_tit = True
        
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_tot_tit"
        Exit Function
    End If
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_tot_tit = False
        
End Function

Function Fu_Sel_Produto(i As Integer) As Boolean

    Fu_Sel_Produto = False

    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..Pr_Rmo_Pro_S00554", 0)
    
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "Fu_Sel_Produto"
        Exit Function
    End If
    
    ' passa parametros
    If FU_Parametro(SqlConn, "@C_Rmo", dad_apo(i).c_rmo, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@C_Pro", dad_apo(i).c_pro, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@N_ABV_PRO", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@Q_DIA_PMN", 0, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@E_VDA_PRO", 0, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@T_CBR_BNR_PRO_1", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@T_CBR_BNR_PRO_2", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@T_CBR_BNR_PRO_3", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@T_CBR_BNR_ATD", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@E_DIA_PMN_CBR", 0, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@E_D_RGA_OCR", 0, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@N_LINHAS", 0, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@E_FAM_PRO", 0, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@I_RCS_TRA_PGD", "", SQLCHAR%) = FAIL% Then Exit Function
  
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "Fu_Sel_Produto"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "Fu_Sel_Produto"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "Fu_Sel_Produto"
        Exit Function
    End If
    
   ' processa os resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "Fu_Sel_Produto"
        Exit Function
    End If
    
    Fu_Sel_Produto = True
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Fu_Sel_Produto = False
End Function


Function FU_PR_SAP_SGM_NEG_S10367() As Integer

'+-------------------------------------------------------------------------+
'| Alberto - 22/06/2001                                                     |
'| OBJETIVO...: Mostrar descrição da segmentação                            |
'+-------------------------------------------------------------------------+
    
    FU_PR_SAP_SGM_NEG_S10367 = False
    
    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_SAP_SGM_NEG_S10367", 0)

    If FU_Parametro_Ret(SqlConn, "@PRM_S10367_u_lin", 0, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_S10367_e_sgm_neg", e_sgm_neg$, SQLINT2%) = FAIL% Then Exit Function

    Ret% = SQLRPCSend%(SqlConn%)
    Ret% = SqlOk%(SqlConn%)

'+-------------------------------------------------------------------------+
'|        VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO          |
'+-------------------------------------------------------------------------+
    If MsgSev_Syb% > 1 Then Exit Function

    Ret% = SqlResults%(SqlConn%)
    
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
       Ret% = SqlNextRow%(SqlConn%)
       Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
          n_sgm_neg$ = Trim(SqlData$(SqlConn%, 2))
          Ret% = SqlNextRow%(SqlConn%)
       Loop
       Ret% = SqlResults%(SqlConn%)
    Loop
    
    If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlResults%, "FU_PR_SAP_SGM_NEG_S10367"
      Exit Function
    End If

    If CInt(SqlRetData(SqlConn%, 1)) = 0 Then Exit Function

    FU_PR_SAP_SGM_NEG_S10367 = True

End Function

Function fu_sel_tit_cpz_apolice() As Integer
   Dim Ret As Integer     'retorno de funções
   Dim i   As Integer     'array de apólice
   Dim Contador As Integer
    
   fu_sel_tit_cpz_apolice = False

   ' inicializa stored procedure
   Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_tit_cpz_S11745", 0)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlRpcInit%, "fu_sel_tit_cpz_apolice"
      Exit Function
      
   End If
   
   ' passa parâmetros
   If FU_Parametro(SqlConn, "@U_CBN_SOR", u_cbn_sor$, SQLINT4%) = FAIL% Then Exit Function
   If FU_Parametro_Ret(SqlConn, "@N_linhas", 0, SQLINT2) = FAIL% Then Exit Function

   ' envia comando
   Ret% = SQLRPCSend%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlRpcSend%, "fu_sel_tit_cpz_apolice"
      Exit Function
   End If

   ' executa stored procedure
   Ret% = SqlOk%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlOk%, "fu_sel_tit_cpz_apolice"
      Exit Function
   End If

   ' verifica resultados
   Ret% = SqlResults%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlResults%, "fu_sel_tit_cpz_apolice"
      Exit Function
   End If
   
   ' processa resultados
     Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
         Ret% = SqlNextRow%(SqlConn%)
         
         Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
         
             If (e_osg$ = "AUT" And Val(SqlData$(SqlConn%, 6)) = 1) Or (e_osg$ = "IMV" And Val(SqlData$(SqlConn%, 5)) = 4) Or (e_osg$ = "PES" And Val(SqlData$(SqlConn%, 6)) = 4) Then
                ReDim Preserve dad_apo(0 To i%) As apolice
                
                dad_apo(i%).c_cia_ita = Trim$(SqlData$(SqlConn%, 1))
                dad_apo(i%).c_rmo = Trim$(SqlData$(SqlConn%, 2))
                dad_apo(i%).u_apo_pnc = Trim$(SqlData$(SqlConn%, 3))
                dad_apo(i%).u_apo_dpd = Trim$(SqlData$(SqlConn%, 4))
                dad_apo(i%).e_osg = e_osg$
                
                dad_apo(i%).e_fam_pro$ = Trim$(SqlData$(SqlConn%, 5))
                dad_apo(i%).c_agr_fam_pro$ = Trim$(SqlData$(SqlConn%, 6))
                dad_apo(i%).t_fam_pro = Trim$(SqlData$(SqlConn%, 7))
                
                i% = i% + 1
             
                fu_sel_tit_cpz_apolice = True
             End If

             Ret% = SqlNextRow%(SqlConn%)
         Loop
 
         Ret% = SqlResults%(SqlConn%)
     Loop
 
     If Ret% = FAIL% Then
         su_erro_st_proc ST_SqlResults%, "fu_sel_tit_cpz_apolice"
         Exit Function
     End If
 
     If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
         fu_sel_tit_cpz_apolice = False
         Exit Function
     End If
    

End Function

Function fu_sel_tit_cpz_titulo(verifica) As Integer
    Dim Ret As Integer     'retorno de funções
    Dim i   As Integer     'array de apólice
    Dim Contador As Integer
    Dim e_bnf_tit_cpz As String
    
    fu_sel_tit_cpz_titulo = False
    Contador% = 0

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..PR_TIT_CPZ_S11794", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_tit_cpz_titulo"
        Exit Function
    End If
   
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@C_CIA_ITA", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@C_RMO", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@U_APO_PNC", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@U_APO_DPD", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@VERIFICA_EXISTENCIA", verifica, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@N_LINHAS", 0, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL% Then Exit Function

    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_tit_cpz_titulo"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_tit_cpz_titulo"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_tit_cpz_titulo"
        Exit Function
    End If
   
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
         
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
         
            Contador% = Contador% + 1
            
            e_bnf_tit_cpz$ = SqlData$(SqlConn%, 13)
             
            If Val(e_bnf_tit_cpz$) = 1 And Contador% = 1 Then 'se segurado
                u_tit_cpz$ = Trim$(SqlData$(SqlConn%, 1))
                u_tit_cpz_dco$ = Trim$(SqlData$(SqlConn%, 2))
                d_ini_vig_tit$ = Format(SqlData$(SqlConn%, 3), "dd/mm/yyyy")
                d_fim_vig_tit$ = Format(SqlData$(SqlConn%, 4), "dd/mm/yyyy")
                u_cbn_sor$ = Trim$(SqlData$(SqlConn%, 5))
                u_cbn_sor_02$ = Trim$(SqlData$(SqlConn%, 6))
                u_cbn_sor_03$ = Trim$(SqlData$(SqlConn%, 7))
                u_cbn_sor_04$ = Trim$(SqlData$(SqlConn%, 8))
                u_cbn_sor_05$ = Trim$(SqlData$(SqlConn%, 9))
                
                u_pla_cpz$ = Trim$(SqlData$(SqlConn%, 10))
                u_pla_cpz_dco$ = Trim$(SqlData$(SqlConn%, 11))
                u_ser_tit_cpz$ = Trim$(SqlData$(SqlConn%, 12))
                d_can$ = Format(SqlData$(SqlConn%, 14), "dd/mm/yyyy")   'Emilio L. Conde - 14/04/2003 - R1PAB017
                v_pmo_tcz_apo$ = Trim$(SqlData$(SqlConn%, 15))          'Priscila de Sousa - 16/07/2009 - R1PAB013
            Else
                u_tit_cpz_cor$ = Trim$(SqlData$(SqlConn%, 1))
                u_tit_cpz_dco_cor$ = Trim$(SqlData$(SqlConn%, 2))
                d_ini_vig_tit_cor$ = Format(SqlData$(SqlConn%, 3), "dd/mm/yyyy")
                d_fim_vig_tit_cor$ = Format(SqlData$(SqlConn%, 4), "dd/mm/yyyy")
                u_cbn_sor_cor$ = Trim$(SqlData$(SqlConn%, 5))
                u_cbn_sor_02_cor$ = Trim$(SqlData$(SqlConn%, 6))
                u_cbn_sor_03_cor$ = Trim$(SqlData$(SqlConn%, 7))
                u_cbn_sor_04_cor$ = Trim$(SqlData$(SqlConn%, 8))
                u_cbn_sor_05_cor$ = Trim$(SqlData$(SqlConn%, 9))
                
                u_pla_cpz_cor$ = Trim$(SqlData$(SqlConn%, 10))
                u_pla_cpz_dco_cor$ = Trim$(SqlData$(SqlConn%, 11))
                u_ser_tit_cpz_cor$ = Trim$(SqlData$(SqlConn%, 12))
                d_can_cor$ = Format(SqlData$(SqlConn%, 14), "dd/mm/yyyy")  'Emilio L. Conde - 14/04/2003 - R1PAB017
                
            End If
             
            fu_sel_tit_cpz_titulo = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop
 
        Ret% = SqlResults%(SqlConn%)
     Loop
 
     If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_tit_cpz_titulo"
        Exit Function
     End If
 
     If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
        fu_sel_tit_cpz_titulo = False
        Exit Function
     End If
     
     If verifica = 1 And Val(SqlRetData$(SqlConn%, 1)) <> 0 Then
        fu_sel_tit_cpz_titulo = True
     End If
     
End Function


Function fu_sel_trt_lib_apo()

    'Carrega todas as liberações existentes a nivel
    'de apólice/item segurado.
    
    Dim IDX As Integer
    
    fu_sel_trt_lib_apo = False
            
    'Inicializa a procedure de seleção de dados
    Ret% = SQLRPCInit(SqlConn%, "dbnprod..PR_TRT_LIB_APO_S09353", 0)
    
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_trt_lib_apo"
        Exit Function
    End If
      
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@u_linhas", 0, SQLINT2%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_trt_lib_apo"
        Exit Function
    End If
  
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_trt_lib_apo"
        Exit Function
    End If
  
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_trt_lib_apo"
        Exit Function
    End If
    
    ReDim VT_TRT_LIB_APO(0)
    
    'processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
        
            IDX% = UBound(VT_TRT_LIB_APO) + 1
            
            ReDim Preserve VT_TRT_LIB_APO(IDX%)
        
            VT_TRT_LIB_APO(IDX%).U_VRS_ADI$ = SqlData(SqlConn%, 1)
            VT_TRT_LIB_APO(IDX%).c_isg$ = SqlData(SqlConn%, 2)
            VT_TRT_LIB_APO(IDX%).c_pro$ = SqlData(SqlConn%, 3)
            VT_TRT_LIB_APO(IDX%).c_pla_pro$ = SqlData(SqlConn%, 4)
            VT_TRT_LIB_APO(IDX%).c_gar$ = SqlData(SqlConn%, 5)
            VT_TRT_LIB_APO(IDX%).c_cla$ = SqlData(SqlConn%, 6)
            VT_TRT_LIB_APO(IDX%).c_e_lib$ = SqlData(SqlConn%, 7)
            VT_TRT_LIB_APO(IDX%).e_isg$ = SqlData(SqlConn%, 8)
            VT_TRT_LIB_APO(IDX%).n_usr_azd$ = SqlData(SqlConn%, 9)
            VT_TRT_LIB_APO(IDX%).d_hra_atz$ = SqlData(SqlConn%, 10)
            VT_TRT_LIB_APO(IDX%).c_nng_rdt$ = SqlData(SqlConn%, 11)
            VT_TRT_LIB_APO(IDX%).t_cmt_atz$ = SqlData(SqlConn%, 12)
            VT_TRT_LIB_APO(IDX%).t_e_lib$ = SqlData(SqlConn%, 13)
            VT_TRT_LIB_APO(IDX%).c_frm_lib_coc$ = SqlData(SqlConn%, 14)
            VT_TRT_LIB_APO(IDX%).c_ntz_lib_prp$ = SqlData(SqlConn%, 15)
            VT_TRT_LIB_APO(IDX%).c_psl_slc_pnc$ = SqlData(SqlConn%, 16)
            VT_TRT_LIB_APO(IDX%).c_psl_slc_scu$ = SqlData(SqlConn%, 17)
            VT_TRT_LIB_APO(IDX%).n_pes_slc$ = SqlData(SqlConn%, 18)
            VT_TRT_LIB_APO(IDX%).n_usr_act$ = SqlData(SqlConn%, 19)
            VT_TRT_LIB_APO(IDX%).d_hra_act$ = SqlData(SqlConn%, 20)
            VT_TRT_LIB_APO(IDX%).t_cmt_act$ = SqlData(SqlConn%, 21)
            VT_TRT_LIB_APO(IDX%).n_ntz_lib_prp = SqlData(SqlConn%, 22)
            
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_trt_lib_apo"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
        fu_sel_trt_lib_apo = False
        Exit Function
    End If
        
    fu_sel_trt_lib_apo = True

End Function

Function fu_alt_dados_apo(Formulario As Form) As Integer
    ' seleciona apólice anterior

    ' retorno de funções
    Dim Ret As Integer
    Dim n_linhas$
    Dim c_isg_apo_ori$, u_apo_dpd_ant$, c_rmo_ant$

    fu_alt_dados_apo = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_apo_u02614", 0)
    If Ret% = FAIL% Then
        MsgBox "ErroZE: 0 linhas", vbCritical
        su_erro_st_proc ST_SqlRpcInit%, "fu_alt_dados_apo"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_ctr_hsu", Trim(Formulario.tb_u_vrs_ctr_hsu.Text), SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4%) = FAIL% Then Exit Function
    
    If Trim(Formulario.tb_d_ini_pri_apo.Text) = "" Then
        MsgBox "ErroZE: 0 linhas", vbCritical
        If FU_Parametro(SqlConn, "@d_ini_pri_apo", "06/06/2079", SQLDATETIM4) = FAIL% Then Exit Function
    Else
        MsgBox "ErroZE: 0 linhas", vbCritical
        If FU_Parametro(SqlConn, "@d_ini_pri_apo", Format(Trim(Formulario.tb_d_ini_pri_apo.Text), "mm/dd/yyyy"), SQLDATETIME%) = FAIL% Then Exit Function
    End If
    
    If FU_Parametro(SqlConn, "@u_apo_ori", Trim(Formulario.tb_u_apo_ori.Text), SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_isg_apo_ori", Trim(Formulario.tb_c_isg_apo_ori.Text), SQLCHAR%) = FAIL% Then Exit Function
    
    If FU_Parametro(SqlConn, "@c_cia_ita_ant", Trim(Formulario.tb_c_cia_ita_ant.Text), SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo_ant", Trim(Formulario.lb_c_rmo_ant.Caption), SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc_ant", Trim(Formulario.tb_u_apo_pnc_ant.Text), SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd_ant", Trim(Formulario.lb_u_apo_dpd_ant.Caption), SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        MsgBox "ErroZE: 0 linhas", vbCritical
        su_erro_st_proc ST_SqlRpcSend%, "fu_alt_dados_apo"
        Exit Function
    End If

    ' executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        MsgBox "ErroZE: 0 linhas", vbCritical
        su_erro_st_proc ST_SqlOk%, "fu_alt_dados_apo"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        MsgBox "ErroZE: 0 linhas", vbCritical
        su_erro_st_proc ST_SqlResults%, "fu_alt_dados_apo"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_alt_dados_apo"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_alt_dados_apo = False

    n_linhas$ = Trim(SqlRetData(SqlConn%, 1))
    If Val(n_linhas$) = 0 Then
        MsgBox "Erro: 0 linhas", vbCritical
        Exit Function
    End If
    
    fu_alt_dados_apo = True

End Function

Sub Su_LimparCampos(Tela As Form)
Dim Controles        As Control

    For Each Controles In Tela.Controls
        If TypeOf Controles Is TextBox Then
            Controles = Empty
        ElseIf TypeOf Controles Is ComboBox Then
            If Controles.Style = 2 Then
                Controles.ListIndex = 1
            Else
                Controles = Empty
            End If
        ElseIf TypeOf Controles Is ListBox Then
            Controles.Clear
        ElseIf TypeOf Controles Is MaskEdBox Then
            Controles.PromptInclude = False
            Controles.Text = Empty
            Controles.PromptInclude = True
        End If
    Next
End Sub



Function fu_carrega_homonimo1() As Integer

    ' Pesquisa nomes de clientes através da fonetização
    ' por índices

    ' Data de Nascimento
    Dim Aux_Data_Nascimento As String

    ' nome do segurado
    Dim Aux_Nome_Pessoa     As String
    
    ' retorno de funções
    Dim Ret                 As Integer
    
    fu_carrega_homonimo1 = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnproc..pp_trata_cliente_s04167", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_carrega_homonimo1"
        Exit Function
    End If

    ' passa parâmetros
    If FU_Parametro(SqlConn, "@n_idc", n_idc$, SQLCHAR) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@e_pes", e_pes$, SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@indice", indice%, SQLINT4) = FAIL% Then Exit Function
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_carrega_homonimo1"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_carrega_homonimo1"
        Exit Function
    End If
    
    On Error GoTo Trata_Erro_Leitura1
    
    ' verifica se não existem mais de uma tela de cliente a ser apresentada
    If Not Tela% Then
        pos_array_fonet% = n_tot_hmn%   ' total de homônimos encontrados na
                                        ' pesquisa fonética
    End If

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            
            ReDim Preserve array_fonet(0 To n_tot_hmn%)
            If UCase$(e_pes$) = "F" Then
                If Format$(SqlData$(SqlConn%, 3), "DD/MM/YYYY") = "01/01/2079" Then
                    Aux_Data_Nascimento$ = "    -     "
                Else
                    Aux_Data_Nascimento$ = Format$(SqlData$(SqlConn%, 3), "DD/MM/YYYY")
                End If
                
                ' nome cliente
                array_fonet(n_tot_hmn%) = Format$(SqlData$(SqlConn%, 1), "00000000") & " " & Trim$(SqlData$(SqlConn%, 2)) + Space$(((SqlCollen(SqlConn%, 2)) - Len(Trim$(SqlData$(SqlConn%, 2)))) + 1) + Space$(1) + " " + "Nasc.: " + Aux_Data_Nascimento$ & Space(15) & Format$(Str$(n_tot_hmn%), "00000")
            Else
                Aux_Nome_Pessoa$ = Trim$(SqlData$(SqlConn%, 2)) + Space$(((SqlCollen(SqlConn%, 2)) - Len(Trim$(SqlData$(SqlConn%, 2)))) + 1) + " " + "CGC: " + Format$((SqlData$(SqlConn%, 3)), "000,000,000") + "/" + Format$((SqlData$(SqlConn%, 4)), "0000") + "-" + Format$((SqlData$(SqlConn%, 5)), "00")
                
                array_fonet(n_tot_hmn%) = Format$(SqlData$(SqlConn%, 1), "00000000") & " " & Trim$(SqlData$(SqlConn%, 2)) + Space$(((SqlCollen(SqlConn%, 2)) - Len(Trim$(SqlData$(SqlConn%, 2)))) + 1) + " " + "CGC: " + Format$((SqlData$(SqlConn%, 3)), "000,000,000") + "/" + Format$((SqlData$(SqlConn%, 4)), "0000") + "-" + Format$((SqlData$(SqlConn%, 5)), "00") & Space(9) & Format$(Str$(n_tot_hmn%), "00000")
            End If
             
            ' total de homônimos encontrados na pesquisa fonética
            n_tot_hmn% = n_tot_hmn% + 1
            
            fu_carrega_homonimo1 = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_carrega_homonimo1"
        Exit Function
    End If

    On Error GoTo 0

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_carrega_homonimo1 = False

    Exit Function

' cancela comando em caso de erro
Trata_Erro_Leitura1:

    On Error GoTo 0
    Ret% = SqlCancel(SqlConn%)
    fu_carrega_homonimo1 = False
    Exit Function
   
End Function

Function fu_carrega_homonimo2() As Integer

    ' Pesquisa nomes de endereço através da fonetização
    ' por índices (Cidade + Estado)

    ' fonet_indices(0)  -> n_idc1$
    ' fonet_indices(1)  -> n_idc2$
    ' fonet_indices(2)  -> n_idc3$
    
    ' array de fonetização
    Dim i   As Integer

    ' retorno de funções
    Dim Ret As Integer

    fu_carrega_homonimo2 = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnproc..pp_loc_s05097", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_carrega_homonimo2"
        Exit Function
    End If

    ' passa parâmetros
    If FU_Parametro(SqlConn, "@n_idc1", Fonet_Indices(0), SQLCHAR) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@n_idc2", Fonet_Indices(1), SQLCHAR) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@n_idc3", Fonet_Indices(2), SQLCHAR) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_carrega_homonimo2"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_carrega_homonimo2"
        Exit Function
    End If
    
    On Error GoTo Trata_Erro_Leitura2

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            ReDim Preserve loc_fonet(0 To i%) As endereco_fonetizado

            loc_fonet(i%).c_loc = Val(Trim$(SqlData(SqlConn%, 1)))
            loc_fonet(i%).n_loc = Trim$(SqlData(SqlConn%, 2))
            loc_fonet(i%).c_uf = Trim$(SqlData(SqlConn%, 3))

            i% = i% + 1
            
            fu_carrega_homonimo2 = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_carrega_homonimo2"
        Exit Function
    End If

    On Error GoTo 0

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_carrega_homonimo2 = False

    Exit Function

' cancela comando em caso de erro
Trata_Erro_Leitura2:

    On Error GoTo 0
    Ret% = SqlCancel(SqlConn%)
    fu_carrega_homonimo2 = False
    Exit Function
   
End Function

Function FU_Formata_Data(Data_a_Formatar As String)

    'Formata a data do padrão americano para brasileiro.

    On Error GoTo erro_formata_data
    
    FU_Formata_Data = Format(Left(Data_a_Formatar$, 12), "dd/mm/yyyy") & Space(1) & Mid(Data_a_Formatar$, 13, 15)
        
    Exit Function

erro_formata_data:

    Err = 0
    FU_Formata_Data = Data_a_Formatar$
    Exit Function

End Function

Function Formata_Zeros(ByVal strDados As String, ByVal intTamanho As Integer) As String
    
    'Gisely - SS_113265 - 12/11/2009
    
    Formata_Zeros = Right(String(intTamanho, "0") & Trim(strDados), intTamanho)
End Function

Public Function FU_Converte_Data_Hora(ByVal data As String) As String

    Dim DataConvertida As String
    Dim HoraConvertida As Integer
    Dim Milisegundos As String
    Dim d As Date
    
    DataConvertida = FU_Converte_Data(data, "BR", True)
    
    If UCase(Right(DataConvertida, 2)) = "PM" Then
        If Len(DataConvertida) = 24 Then
            HoraConvertida = CInt(Mid(DataConvertida, 12, 1)) + 12
            DataConvertida = Mid(DataConvertida, 1, 11) & CStr(HoraConvertida) & Mid(DataConvertida, 13, 10)
        Else
            If CInt(Mid(DataConvertida, 12, 2)) <> 12 Then ' marcia abreu ss_221940 acerto quando a hora for 12 não somar
                HoraConvertida = CInt(Mid(DataConvertida, 12, 2)) + 12
                DataConvertida = Mid(DataConvertida, 1, 11) & CStr(HoraConvertida) & Mid(DataConvertida, 14, 10)
            Else
                HoraConvertida = CInt(Mid(DataConvertida, 12, 2))
                DataConvertida = Mid(DataConvertida, 1, 11) & CStr(HoraConvertida) & Mid(DataConvertida, 14, 10)
            End If
        End If
    Else
        If Mid(DataConvertida, 12, 2) = "12" Then
            DataConvertida = Left(DataConvertida, 11) & "00" & Right(DataConvertida, Len(DataConvertida) - 13)
        End If
    
        If Len(DataConvertida) = 25 Then
            DataConvertida = Mid(DataConvertida, 1, 23)
        Else
            DataConvertida = Mid(DataConvertida, 1, 22)
        End If
    End If
    
    If Len(DataConvertida) = 23 Then
        Milisegundos = "." & Mid(DataConvertida, 21, 3)
        d = Mid(DataConvertida, 1, 19)
    Else
        Milisegundos = "." & Mid(DataConvertida, 20, 3)
        d = Mid(DataConvertida, 1, 18)
    End If
    
    DataConvertida = Format(d, "yyyy-MM-dd hh:mm:ss")
    DataConvertida = DataConvertida & Milisegundos

    
    FU_Converte_Data_Hora = (DataConvertida)
    
End Function

Function fu_his_isg_apo_s07465()

    Dim Ret As Integer
    
    fu_his_isg_apo_s07465 = False
    
    If SQLRPCInit%(SqlConn%, "DBNPROD..PR_HIS_ISG_APO_S07465", 0) = FAIL Then Exit Function

    If FU_Parametro(SqlConn, "@opcao", Opcao$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT4%) = FAIL Then Exit Function

    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_his_isg_apo_s07465"
        Exit Function
    End If

    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_his_isg_apo_s07465"
        Exit Function
    End If
    
    'Carrega o resultado da leitura.
    R1FAB007.cb_item_adi.Clear

    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            R1FAB007.cb_item_adi.AddItem Trim(SqlData$(SqlConn%, 1))
            R1FAB007.cb_item_adi.ItemData(R1FAB007.cb_item_adi.NewIndex) = SqlData$(SqlConn%, 1)
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then
        MsgBox "Não foi possível colher resultados - PR_HIS_ISG_APO_S07465.", 48
        Exit Function
    End If

    'Verifica o status de erro.
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function
    
    fu_his_isg_apo_s07465 = True

End Function

Function fu_his_isg_apo_s07469(PAR_PESQ&)

    Dim Ret         As Integer
    Dim cont        As Integer
    Dim ind         As Integer
    Dim n_linhas    As String
    Dim grid_cla    As Integer

    On Error GoTo erro_pr_his_isg_apo_s07469

    fu_his_isg_apo_s07469 = False

    'Inicializa stored procedure.
    If SQLRPCInit%(SqlConn%, "dbnprod..pr_his_isg_apo_s07469", 0) = FAIL% Then GoTo erro_pr_his_isg_apo_s07469

    If FU_Parametro(SqlConn, "@opcao", Opcao$, SQLINT2%) = FAIL% Then GoTo erro_pr_his_isg_apo_s07469
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then GoTo erro_pr_his_isg_apo_s07469
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then GoTo erro_pr_his_isg_apo_s07469
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then GoTo erro_pr_his_isg_apo_s07469
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then GoTo erro_pr_his_isg_apo_s07469
    If FU_Parametro(SqlConn, "@param_pesq", PAR_PESQ&, SQLINT4%) = FAIL% Then GoTo erro_pr_his_isg_apo_s07469
    
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT4%) = FAIL Then GoTo erro_pr_his_isg_apo_s07469
    
    'Envia comando.
    If SQLRPCSend%(SqlConn%) = FAIL% Then GoTo erro_pr_his_isg_apo_s07469
    
    'Executa stored procedure.
    If SqlOk%(SqlConn%) = FAIL% Then GoTo erro_pr_his_isg_apo_s07469
    
    ind% = 0
    ReDim vetor_item(0 To 0)

    'Verifica resultados.
    Ret% = SqlResults%(SqlConn%)

    'Armazena na posição zero do vetor os dados escolhidos
    'Processamento dos resultados da stored procedure.
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)

        'Recuperação e processamento dos dados em cada linha.
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            ind% = ind% + 1

            ReDim Preserve vetor_item(0 To ind%)
    
            'Se escolhido pesquisa por aditamento.
            'If flag_adi = True Then
                vetor_item(ind).u_adi$ = Trim$(SqlData(SqlConn%, 1)) 'Núm.Aditamento
            'Se escolhida pesquisa por item.
            'ElseIf flag_item = True Then
                vetor_item(ind).c_isg$ = Trim$(SqlData(SqlConn%, 3)) 'Código Item
            'End If

            vetor_item(ind).c_mot_alt$ = Trim$(SqlData(SqlConn%, 2)) 'Cód.Motivo Alteração
            vetor_item(ind).u_chs_aut$ = Trim$(SqlData(SqlConn%, 4)) 'Chassis do Automóvel.
            vetor_item(ind).u_plc_aut$ = Trim$(SqlData(SqlConn%, 5)) 'Adiciona Placa do Aut.
            vetor_item(ind).t_mot_alt$ = Trim$(SqlData(SqlConn%, 6)) 'Adiciona Descrição Motivo
            vetor_item(ind).D_INI_VIG_DAD$ = Format(Trim$(SqlData(SqlConn%, 7)), "dd/mm/yyyy") 'Data início de vigência do Item do Aditamento
            
            'Lucimara - 22/03/2001 - inicio
            vetor_item(ind).c_esf_mot$ = Trim$(SqlData(SqlConn%, 8)) 'Cód.Especificação do Motivo
            vetor_item(ind).t_esf_mot$ = IIf(Val(SqlData(SqlConn%, 8)) <> 0, " - " & Trim$(SqlData(SqlConn%, 9)), "") 'Adiciona Descrição da Especificação
            'Lucimara - 22/03/2001 - Fim
            
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then
        MsgBox "Não foi possível colher resultados - pr_his_isg_apo_s07469.", 48
        Exit Function
    End If
    
    'Seta variável com a qtde total de movimentações recuperadas.
    qtde_ite_rec% = ind%
    n_linhas_7469$ = ""

    'Armazenamento do nº de linhas afetadas
    'pelo comando na variável local.
    n_linhas_7469$ = SqlRetData$(SqlConn%, 1)
    
    'Verifica o status de erro.
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function

    fu_his_isg_apo_s07469 = True

    Exit Function

erro_pr_his_isg_apo_s07469:

        MsgBox "Erro na carga do grid (chamada da Stored Procedure pr_his_isg_apo_s07469).", 48, "R1FAB007"

End Function

Function FU_Converte_Data(ByVal VL_DATA_A_FORMATAR As String, VL_PADRAO As String, VL_EXIBIR_HORA As Integer) As String

'+-------------------------------------------------------------------------+
'|  CONVERTE A DATA/HORA RECEBIDA PARA OS PADRÕES:                          |
'|  BRASILEIRO (BR) - DD/MM/YYYY                                            |
'|  AMERICANO  (US) - MM/DD/YYYY                                            |
'+-------------------------------------------------------------------------+
    Dim VL_DOIS_PONTOS  As Integer
    Dim VL_DATA         As String
    Dim VL_HORA         As String
    Dim VL_DIA          As String
    Dim VL_MES          As String
    Dim VL_ANO          As String
    Dim VL_BRANCO       As Integer
    
    On Error GoTo ERRO_CONVERSAO_DATA

'+------------------------------------------------------------------------+
'| Verifica se a data fornecida possui hora e efetua a separação das duas   |
'+-------------------------------------------------------------------------+
    VL_DOIS_PONTOS% = InStr(1, VL_DATA_A_FORMATAR$, ":")

    If VL_DOIS_PONTOS% = 0 Then
        VL_DATA$ = Trim(VL_DATA_A_FORMATAR$)
        VL_HORA$ = ""
    Else
        VL_BRANCO% = VL_DOIS_PONTOS%
        
        Do While VL_BRANCO% >= 0
            VL_BRANCO% = VL_BRANCO% - 1
        
            If Mid(VL_DATA_A_FORMATAR, VL_BRANCO%, 1) = Space(1) Then
                Exit Do
            End If
        Loop
               
        If VL_BRANCO% > 0 Then
            VL_DATA$ = Trim(Mid(VL_DATA_A_FORMATAR, 1, VL_BRANCO%))
            VL_HORA$ = Space(1) + Trim(Mid(VL_DATA_A_FORMATAR, VL_BRANCO%, Len(VL_DATA_A_FORMATAR$)))
        Else
            VL_DATA$ = Trim(VL_DATA_A_FORMATAR$)
            VL_HORA$ = ""
        End If
    End If

'+-------------------------------------------------------------------------+
'| Verifica qual o padrão da data fornecida: BR ou US                       |
'+-------------------------------------------------------------------------+
    If IsDate(VL_DATA$) Then
        VL_DATA$ = CVDate(VL_DATA$)
    Else
        VL_DATA$ = Mid(VL_DATA$, 4, 2) + "/" + Mid(VL_DATA$, 1, 2) + "/" + Mid(VL_DATA$, 7, 4)
    End If

    VL_DIA$ = Format(DatePart("d", VL_DATA$), "00")
    VL_MES$ = Format(DatePart("m", VL_DATA$), "00")
    VL_ANO$ = DatePart("yyyy", VL_DATA$)

    If UCase(VL_PADRAO$) = "BR" Then
        VL_DATA$ = VL_DIA$ + "/" + VL_MES$ + "/" + VL_ANO$
    Else
        VL_DATA$ = VL_MES$ + "/" + VL_DIA$ + "/" + VL_ANO$
    End If

'+------------------------------------------------------------------------+
'| Retorna a data convertida                                                |
'+-------------------------------------------------------------------------+
    If VL_EXIBIR_HORA% = True Then
        FU_Converte_Data = VL_DATA$ + VL_HORA$
    Else
        FU_Converte_Data = VL_DATA$
    End If

    Exit Function

'+-------------------------------------------------------------------------+
'| Data fornecida com formado inválido, não será efetuada a sua conversão   |
'+-------------------------------------------------------------------------+
ERRO_CONVERSAO_DATA:

    FU_Converte_Data = ""
    
    Err = 0

    Exit Function

End Function

Function fu_his_isg_s07462()

    Dim Ret As Integer

    fu_his_isg_s07462 = False
    
    If SQLRPCInit%(SqlConn%, "DBNPROD..PR_HIS_ISG_S07462", 0) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_adi", U_VRS_ADI$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_isg", c_isg$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT4%) = FAIL Then Exit Function

    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_his_isg_s07462"
        Exit Function
    End If

    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_his_isg_s07462"
        Exit Function
    End If

    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            t_isg$ = Trim(SqlData$(SqlConn%, 1))
            c_reg_utl$ = Trim(SqlData$(SqlConn%, 2))
            u_lau$ = Trim(SqlData$(SqlConn%, 3))
            i_zro_km$ = Trim(SqlData$(SqlConn%, 4))
            d_sda_vei$ = Trim(SqlData$(SqlConn%, 5))
            c_idt_vtd$ = Trim(SqlData$(SqlConn%, 6))
            e_vtd$ = Trim(SqlData$(SqlConn%, 7))
            c_tab_bon$ = Trim(SqlData$(SqlConn%, 8))
            c_lin_aut$ = Trim(SqlData$(SqlConn%, 10))
            c_mod_aut$ = Trim(SqlData$(SqlConn%, 11))
            u_plc_aut$ = Trim(SqlData$(SqlConn%, 12))
            u_chs_aut$ = Trim(SqlData$(SqlConn%, 13))
            c_fbr_aut$ = Trim(SqlData$(SqlConn%, 14))
            e_pcd_aut$ = Trim(SqlData$(SqlConn%, 15))
            e_cmb$ = Trim(SqlData$(SqlConn%, 16))
            t_coo_aut$ = Trim(SqlData$(SqlConn%, 17))
            t_pin_aut$ = Trim(SqlData$(SqlConn%, 18))
            u_mtr_aut$ = Trim(SqlData$(SqlConn%, 19))
            d_ano_fbr$ = Trim(SqlData$(SqlConn%, 20))
            d_ano_mod$ = Trim(SqlData$(SqlConn%, 21))

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then
        MsgBox "Não foi possível colher resultados - PR_HIS_ISG_S07462.", 48
        Exit Function
    End If

    'Verifica o status de erro.
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function
    
    fu_his_isg_s07462 = True

End Function

Function FU_PR_MLD_CPH_S08131()

'+-------------------------------------------------------------------------+
'| OBJETIVO...: CARREGA DADOS DA CAMPANHA                                 |
'+-------------------------------------------------------------------------+
'Moisés

    FU_PR_MLD_CPH_S08131 = False
    
    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_MLD_CPH_S08131", 0)

    If FU_Parametro_Ret(SqlConn, "@error", 0, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_e_mld", C_E_MLD$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_cph", c_cph$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_oft_cph", c_oft_cph$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_lot_oft", u_lot_oft$, SQLINT2%) = FAIL Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "FU_PR_MLD_CPH_S08131"
        Exit Function
    End If

    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "FU_PR_MLD_CPH_S08131"
        Exit Function
    End If

'+-------------------------------------------------------------------------+
'|        VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO          |
'+-------------------------------------------------------------------------+
    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
'            R1FAB005.lbl_Camp.Caption = (SqlData$(SqlConn%, 1))
'            R1FAB005.lbl_oferta.Caption = (SqlData$(SqlConn%, 2))
'            R1FAB005.lbl_lote.Caption = (SqlData$(SqlConn%, 3))
            ctd_lfi% = ctd_lfi% + 1

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then
        MsgBox "Não foi possível colher resultados - PR_MLD_CPH_S08131.", 48
        Exit Function
    End If

    'Verifica o status de erro.
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function
    
    FU_PR_MLD_CPH_S08131 = True

End Function

Function FU_PR_WAP_G09010()
    
    'Seleciona dados da proposta excluída

    FU_PR_WAP_G09010 = False
    
    Ret% = SQLRPCInit%(SqlConn%, "DBNWORK..PR_WAP_G09010 ", 0)
                                            
    If Ret% = FAIL Then
       Mensagem$ = "Erro_04 Não foi possível iniciar a stored procedure (DBNWORK..PR_WAP_G09010)."
       SU_MENSAGEM Mensagem$, MB_ICONSTOP + MB_OK
       Screen.MousePointer = 0
       Exit Function
    End If
     
    If FU_Parametro(SqlConn, "@u_prp", R1FAB001.tb_u_prp, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_rmo", c_agr_fam_pro$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4%) = FAIL Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
        Mensagem$ = "Erro_05 Não foi possível enviar comando (DBNWORK..PR_WAP_G09010)."
        SU_MENSAGEM Mensagem$, MB_ICONSTOP + MB_OK
        Screen.MousePointer = 0
       Exit Function
    End If
    
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
        Mensagem$ = "Erro_06 Não foi possível executar a Procedure DBNWORK..PR_WAP_G09010"
        SU_MENSAGEM Mensagem$, MB_ICONSTOP + MB_OK
        Screen.MousePointer = 0
        Exit Function
    End If

    ctd_lfi% = 0
    ReDim VT_PRP_EXC(ctd_lfi%)
    R1FAB008.cmbProp.Clear

    Ret% = SqlResults%(SqlConn%)

    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL

            u_prp_atu$ = (SqlData$(SqlConn%, 1))
            u_prp_orn$ = (SqlData$(SqlConn%, 2))
            d_prt_cga$ = (SqlData$(SqlConn%, 3))
            d_prp$ = (SqlData$(SqlConn%, 4))
            d_rct_prp$ = (SqlData$(SqlConn%, 5))
            D_EXC_PRP$ = (SqlData$(SqlConn%, 6))
            n_cli$ = (SqlData$(SqlConn%, 7))
            e_cvd$ = (SqlData$(SqlConn%, 8))
            u_rgt_ssp = (SqlData$(SqlConn%, 9))
            u_dco_rgt_ssp = (SqlData$(SqlConn%, 10))
            c_loc_pgt_cvd = (SqlData$(SqlConn%, 11))
            u_fcp$ = (SqlData$(SqlConn%, 12))
            c_pro$ = (SqlData$(SqlConn%, 13))
            u_chs_aut$ = (SqlData$(SqlConn%, 14))
            u_plc_aut$ = (SqlData$(SqlConn%, 15))
            N_USR$ = (SqlData$(SqlConn%, 16))
            c_bco$ = (SqlData$(SqlConn%, 17))
            u_age$ = (SqlData$(SqlConn%, 18))
            u_cc$ = (SqlData$(SqlConn%, 19))
            u_cc_dcu$ = (SqlData$(SqlConn%, 20))
            c_msg$ = (SqlData$(SqlConn%, 21))
            n_lgd_ris$ = (SqlData$(SqlConn%, 22))
            u_lgd_ris$ = (SqlData$(SqlConn%, 23))
            n_cpl_ris$ = (SqlData$(SqlConn%, 24))
            n_bai_ris$ = (SqlData$(SqlConn%, 25))
            c_cep_ris$ = (SqlData$(SqlConn%, 26))
            n_cdd_ris$ = (SqlData$(SqlConn%, 27))
            s_uf_ris$ = (SqlData$(SqlConn%, 28))
            d_nas$ = (SqlData$(SqlConn%, 29))
            d_ini_vig$ = (SqlData$(SqlConn%, 30))
            n_abv_pla$ = (SqlData$(SqlConn%, 31))
            c_rmo$ = (SqlData$(SqlConn%, 32))
            
            R1FAB008.cmbProp.AddItem "CVD: " & Format(Val(e_cvd$), "00") & "." & Format(Val(u_rgt_ssp$), "0000000") & "." & Format(Val(u_dco_rgt_ssp$), "00") & "." & Format(Val(c_loc_pgt_cvd$), "00") & " - CLI: " & Trim(n_cli$) & " - DATA: " & FU_Formata_Data(d_prt_cga$), ctd_lfi%
            R1FAB008.cmbProp.ItemData(R1FAB008.cmbProp.NewIndex) = ctd_lfi%
                        
            ReDim Preserve VT_PRP_EXC(ctd_lfi%)

            VT_PRP_EXC(ctd_lfi%).u_prp_atu$ = u_prp_atu$
            VT_PRP_EXC(ctd_lfi%).u_prp_orn$ = u_prp_orn$
            VT_PRP_EXC(ctd_lfi%).d_prt_cga$ = d_prt_cga$
            VT_PRP_EXC(ctd_lfi%).d_prp$ = d_prp$
            VT_PRP_EXC(ctd_lfi%).d_rct_prp$ = d_rct_prp$
            VT_PRP_EXC(ctd_lfi%).D_EXC_PRP$ = D_EXC_PRP$
            VT_PRP_EXC(ctd_lfi%).n_cli$ = n_cli$
            VT_PRP_EXC(ctd_lfi%).e_cvd$ = e_cvd$
            VT_PRP_EXC(ctd_lfi%).u_rgt_ssp$ = u_rgt_ssp$
            VT_PRP_EXC(ctd_lfi%).u_dco_rgt_ssp$ = u_dco_rgt_ssp$
            VT_PRP_EXC(ctd_lfi%).c_loc_pgt_cvd$ = c_loc_pgt_cvd$
            VT_PRP_EXC(ctd_lfi%).u_fcp$ = u_fcp$
            VT_PRP_EXC(ctd_lfi%).c_pro$ = c_pro$
            VT_PRP_EXC(ctd_lfi%).u_chs_aut$ = u_chs_aut$
            VT_PRP_EXC(ctd_lfi%).u_plc_aut$ = u_plc_aut$
            VT_PRP_EXC(ctd_lfi%).N_USR$ = N_USR$
            VT_PRP_EXC(ctd_lfi%).c_bco$ = c_bco$
            VT_PRP_EXC(ctd_lfi%).u_age$ = u_age$
            VT_PRP_EXC(ctd_lfi%).u_cc$ = u_cc$
            VT_PRP_EXC(ctd_lfi%).u_cc_dcu$ = u_cc_dcu$
            VT_PRP_EXC(ctd_lfi%).c_msg$ = c_msg$
            VT_PRP_EXC(ctd_lfi%).n_lgd_ris$ = n_lgd_ris$
            VT_PRP_EXC(ctd_lfi%).u_lgd_ris$ = u_lgd_ris$
            VT_PRP_EXC(ctd_lfi%).n_cpl_ris$ = n_cpl_ris$
            VT_PRP_EXC(ctd_lfi%).n_bai_ris$ = n_bai_ris$
            VT_PRP_EXC(ctd_lfi%).c_cep_ris$ = c_cep_ris$
            VT_PRP_EXC(ctd_lfi%).n_cdd_ris$ = n_cdd_ris$
            VT_PRP_EXC(ctd_lfi%).s_uf_ris$ = s_uf_ris$
            VT_PRP_EXC(ctd_lfi%).d_nas$ = d_nas$
            
            VT_PRP_EXC(ctd_lfi%).d_ini_vig$ = d_ini_vig$
            VT_PRP_EXC(ctd_lfi%).n_abv_pla$ = n_abv_pla$
            VT_PRP_EXC(ctd_lfi%).c_rmo$ = c_rmo$
            
            ctd_lfi% = ctd_lfi% + 1

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop
            
    If Ret% = FAIL Then
        MsgBox "Não foi possível colher resultados - PR_WAP_G09010.", 48
        Exit Function
    End If

    'Verifica o status de erro.
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function
    
    FU_PR_WAP_G09010 = True

End Function

Function fu_sel_adi() As Integer
    
    ' seleciona dados do aditamento da apólice
    
    'retorno de funções
    Dim Ret     As Integer
    ' variável auxiliar para preenchimento do listbox de aditamentos
    Dim aux_li  As String
    ' contador utilizado para controlar o array dad_adi()
    Dim i       As Integer
    
    fu_sel_adi = False
    
    ' inicializa stored procedure
    If SQLRPCInit%(SqlConn%, "dbnprod..pr_adi_s04213", 0) = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_adi"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    If SQLRPCSend%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_adi"
        Exit Function
    End If
    
    ' executa stored procedure
    If SqlOk%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_adi"
        Exit Function
    End If
    
    Erase dad_adi
    R1FAB001.li_aditamentos.Clear
    
    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_adi"
        Exit Function
    End If
    
  ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            ' Número do aditamento
            aux_li$ = "ADIT.: " & Format$(Trim$(SqlData$(SqlConn%, 1)), "000")
            ' Data de início de vigência do aditamento
            aux_li$ = aux_li$ & "  " + "VIGÊNCIA: " & Format$(Trim$(SqlData$(SqlConn%, 3)), "dd/mm/yyyy")  '2
            
            ' Data de fim de vigência do aditamento
            If Format$(Trim$(SqlData$(SqlConn%, 4)), "dd/mm/yyyy") <> "06/06/2079" Then
            aux_li$ = aux_li$ + "  " + Format$(Trim$(SqlData$(SqlConn%, 4)), "dd/mm/yyyy") '3
            Else
            aux_li$ = aux_li$ + "  " + "  /  /    "
            End If
            
            ' Data de inclusão do aditamento
            aux_li$ = aux_li$ + "  " + "INCL.: " + Format$(Trim$(SqlData$(SqlConn%, 5)), "dd/mm/yyyy") '4
            ' tipo de aditamento
            aux_li$ = aux_li$ + "  " + "TIPO: " + Trim$(SqlData$(SqlConn%, 12)) '7
            
            R1FAB001.li_aditamentos.AddItem aux_li$
            
            ' Carrega dados da primeira tela em uma array
            'ReDim Preserve dad_adi(0 To i%)  As aditamento
            ReDim Preserve dad_adi(0 To i%)
            
            dad_adi(i%).u_adi = Format$(Trim$(SqlData$(SqlConn%, 1)), "000")
            dad_adi(i%).U_VRS_ADI = Format$(SqlData$(SqlConn%, 2), "000000") '  - ")
            dad_adi(i%).d_ini_vig_adi = Format$(Trim$(SqlData$(SqlConn%, 3)), "dd/mm/yyyy")
            dad_adi(i%).d_fim_vig_adi = Format$(Trim$(SqlData$(SqlConn%, 4)), "dd/mm/yyyy")
            dad_adi(i%).d_icl_adi = Format$(Trim$(SqlData$(SqlConn%, 5)), "dd/mm/yyyy")
            dad_adi(i%).d_prp = Format$(Trim$(SqlData$(SqlConn%, 6)), "dd/mm/yyyy")
            dad_adi(i%).D_Tab_Vda_Cmz = Format$(Trim$(SqlData(SqlConn%, 7)), "dd/mm/yyyy")
            dad_adi(i%).d_rct_prp = Format$(Trim$(SqlData(SqlConn%, 8)), "dd/mm/yyyy")
            dad_adi(i%).N_USR = Trim$(SqlData(SqlConn%, 9))
            dad_adi(i%).E_RCT_PRP = Trim$(SqlData(SqlConn%, 10))
            dad_adi(i%).t_mot_alt = UCase$(Trim$(SqlData$(SqlConn%, 12)))
            dad_adi(i%).u_prp = Trim$(SqlData$(SqlConn%, 13))
            dad_adi(i%).u_mcf = Trim$(SqlData$(SqlConn%, 14))
            dad_adi(i%).c_cls_bon_cfc = Trim$(SqlData$(SqlConn%, 18))
            dad_adi(i%).i_dsc_fam = Trim$(SqlData$(SqlConn%, 19))
            dad_adi(i%).i_bon_cfc = Trim$(SqlData$(SqlConn%, 20))
            
            'Moises
            dad_adi(i%).C_E_MLD = Trim$(SqlData$(SqlConn%, 21))
            dad_adi(i%).c_cph = Trim$(SqlData$(SqlConn%, 22))
            dad_adi(i%).c_oft_cph = Trim$(SqlData$(SqlConn%, 23))
            dad_adi(i%).u_lot_oft = Trim$(SqlData$(SqlConn%, 24))
            dad_adi(i%).e_mcl_vda = Val(SqlData$(SqlConn%, 25))
            'Samuel - 28/05/2001 - Multicampanha
            dad_adi(i%).c_agr_rmu = Val(SqlData$(SqlConn%, 27))
            
                       
            'Ini Gabriela - 17/07/2001 - controle emissão com papel
            dad_adi(i%).c_sit_ctl_ppl = Trim$(SqlData$(SqlConn%, 28))
            dad_adi(i%).d_atu_ctl_ppl = FU_Formata_Data(SqlData$(SqlConn%, 29))
            dad_adi(i%).n_usr_ctl_ppl = Trim$(SqlData$(SqlConn%, 30))
            'Fim Gabriela - 17/07/2001
            
            'Adriana - 12/10/2001 - Controle de Papel - Início
            dad_adi(i%).u_adi_ref_ppl = Format$(Trim$(SqlData$(SqlConn%, 31)), "000")
            'Adriana - 12/10/2001 - Controle de Papel - Fim
            
            'Ini Gabriela - 23/11/2001 - R1PAB088
            dad_adi(i%).D_HRA_ATU = FU_Formata_Data(SqlData$(SqlConn%, 32))
            'Fim Gabriela - 23/11/2001 - R1PAB088
            
            dad_adi(i%).u_mcf_cpl = IIf(Trim$(SqlData$(SqlConn%, 33)) <> "", Trim$(SqlData$(SqlConn%, 33)), "0") ' cris - 04/01/2002
            
            ' cris - 15/01/2002 - inicio
            dad_adi(i%).c_sit_mcf = Trim$(SqlData$(SqlConn%, 34))
            dad_adi(i%).c_mot_sit_mcf = Trim$(SqlData$(SqlConn%, 35))
            ' cris - 15/01/2002 - fim
            
            ' se Diferenciado, o texto deverá ser selecionado na tabela
            ' dbnprod..tb_txt_apo
            ' mostrar o texto da tb_adi - diferenciado
            'If Trim$(c_agr_fam_pro$) <> "5" And Trim$(c_agr_fam_pro$) <> "6" Then
                dad_adi(i%).t_adi = Trim$(SqlData$(SqlConn%, 15))
            'End If
            
            dad_adi(i%).c_dph_doc_apo = Val(SqlData$(SqlConn%, 16))
            dad_adi(i%).e_emi_ppl = Val(SqlData$(SqlConn%, 17))
            'Renato 06/08/2002 - Inicio
            dad_adi(i%).c_mot_alt = Val(SqlData(SqlConn%, 11))
            'Renato 06/08/2002 - Fim
            
            'Pereira 09/11/2004
            dad_adi(i%).i_asn_eln = SqlData(SqlConn%, 36)
            
            dad_adi(i%).c_idt_ful = Trim(SqlData(SqlConn%, 37))   'Gisely 10/03/2009
            dad_adi(i%).c_cee_etd = Trim(SqlData(SqlConn%, 38))   'Seguro crediario 132575
            
            'Adelamg SS 156649
            dad_adi(i%).c_mdd_aut_frt = Trim(SqlData(SqlConn%, 39))
            
            'Sidirlei SS 156649
            dad_adi(i%).c_esf_mot = Val(SqlData(SqlConn%, 40))
            
            'Início ... Gisely - SS_163854 - 26/05/2011
            dad_adi(i%).d_hra_atu_icl = FU_Formata_Data(SqlData$(SqlConn%, 32))
            dad_adi(i%).d_fim_cob_pcb = Format(SqlData$(SqlConn%, 42), "dd/mm/yyyy")
            'Fim ...... Gisely - SS_163854 - 26/05/2011
            
            ' Sidirlei - 156649 - 25/02/2011
            If dad_adi(i%).c_esf_mot = 55 Then
               dad_adi(i%).t_mot_alt = Trim(dad_adi(i%).t_mot_alt) & " - BLANKET "
            ElseIf dad_adi(i%).c_esf_mot = 56 Then
               dad_adi(i%).t_mot_alt = Trim(dad_adi(i%).t_mot_alt) & " - GATILHO "
            End If
            ' Sidirlei - 156649 - 25/02/2011
            
            dad_adi(i%).e_mig_adi = Val(SqlData(SqlConn%, 41))  'v97 Emilio - 21/03/2011 - SS_163237 - Tombamento Auto ISa+r
            
            i% = i% + 1
                                   
            ' a data da inclusão do aditamento deverá ser referente ao
            ' aditamento 0
            ' e versão 1 -- valdemir 11/10/2000
            If Val(SqlData(SqlConn%, 1)) = 0 And Val(SqlData(SqlConn%, 2)) = 1 Then
                d_icl_adi$ = Format$(Trim$(SqlData$(SqlConn%, 5)), "dd/mm/yyyy")
                d_hra_atu_icl = Format$(Trim$(SqlData$(SqlConn%, 32)), "dd/mm/yyyy")
                d_fim_cob_pcb = Format$(Trim$(SqlData$(SqlConn%, 42)), "dd/mm/yyyy")
            End If
            
            fu_sel_adi = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlResults%, "fu_sel_adi"
      Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_adi = False

End Function

Function fu_sel_apo_ant() As Integer

    ' seleciona apólice anterior

    ' retorno de funções
    Dim Ret As Integer

    fu_sel_apo_ant = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_apo_ant_s04724", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_apo_ant"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_apo_ant"
        Exit Function
    End If

    ' executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_apo_ant"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_ant"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            u_apo_ant$ = Trim$(SqlData(SqlConn%, 1))
            fu_sel_apo_ant = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_ant"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_apo_ant = False

End Function

Function fu_sel_apo_ctr_rsv() As Integer
    
    ' verifica se existe contrato para a apólice
    
    ' retorno de funções
    Dim Ret         As Integer
    
    fu_sel_apo_ctr_rsv = False
    
    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_apo_ctr_rsv_s06641", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_apo_ctr_rsv"
        Exit Function
    End If
    
    ' passa parametros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_apo_ctr_rsv"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_apo_ctr_rsv"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_ctr_rsv"
        Exit Function
    End If
    
    ' processa os resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            u_ctr$ = Trim$(SqlData$(SqlConn%, 1))
            u_sub_ctr$ = Trim$(SqlData$(SqlConn%, 2))
            
            contrato% = True
            fu_sel_apo_ctr_rsv = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_ctr_rsv"
        Exit Function
    End If

    'Verifica o status de erro.
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_apo_ctr_rsv = False

End Function

Function fu_sel_apo_mfr_ptn_bnj()
    
    'seleciona o número da Apólice Banerj da nova Arquitetura

    Dim Ret As Integer

    fu_sel_apo_mfr_ptn_bnj = False

    'inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_apo_mfr_ptn_s00693", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_apo_mfr_ptn_bnj"
        Exit Function
    End If
    
    'passa parâmetros
    If FU_Parametro(SqlConn, "@u_apo_mfr_opf", u_apo_mfr_opf$, SQLVARCHAR) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_ite_apo_mfr", u_ite_apo_mfr$, SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_cia_ita_mfr", c_cia_ita_mfr$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4) = FAIL% Then Exit Function
    
    'envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_apo_mfr_ptn_bnj"
        Exit Function
    End If

    'executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_apo_mfr_ptn_bnj"
        Exit Function
    End If
    
    'verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_mfr_ptn_bnj"
        Exit Function
    End If
    
    'processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            c_cia_ita$ = Trim$(SqlData$(SqlConn%, 1))
            c_rmo$ = Trim$(SqlData$(SqlConn%, 2))
            u_apo_pnc$ = Trim$(SqlData$(SqlConn%, 3))
            u_apo_dpd$ = Trim$(SqlData$(SqlConn%, 4))
            c_isg$ = Trim$(SqlData$(SqlConn%, 5))

            fu_sel_apo_mfr_ptn_bnj = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_mfr_ptn_bnj"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_apo_mfr_ptn_bnj = False

End Function

Function fu_sel_apo_mfr_ptn_nova() As Integer

    ' seleciona o número da Apólice da nova Arquitetura

    ' retorno de funções
    Dim Ret         As Integer
    Dim u_apo_opf   As String
    

    fu_sel_apo_mfr_ptn_nova = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_apo_mfr_ptn_s07566", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_apo_mfr_ptn_nova"
        Exit Function
    End If
  
    If c_cia_ita_mfr$ = "1" Or c_cia_ita_mfr$ = "33" Then   'Adelamg 21/10/2009
        ' passa parâmetros
        If FU_Parametro(SqlConn, "@c_e_neg", c_t_neg$, SQLINT2%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@c_rmo_mfr", c_rmo_mfr$, SQLINT2%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_apo_mfr", u_apo_pnc_mfr$, SQLINT4%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_ite_apo_mfr", Format(u_isg_mfr$, "0000000000"), SQLCHAR%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_apo_mfr_opf", "", SQLCHAR%) = FAIL% Then Exit Function
        If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4) = FAIL% Then Exit Function
    'v68 Emilio 22/05/2008 - início
    ElseIf c_cia_ita_mfr$ = "32" Then
        ' passa parâmetros
        If FU_Parametro(SqlConn, "@c_e_neg", 0, SQLINT2%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@c_rmo_mfr", 0, SQLINT2%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_apo_mfr", 0, SQLINT4%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_ite_apo_mfr", 0, SQLCHAR%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_apo_mfr_opf", c_pro_itp & Format(u_apo_itp, "0000000"), SQLCHAR%) = FAIL% Then Exit Function
        If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4) = FAIL% Then Exit Function
    'v68 Emilio 22/05/2008 - fim
   'Início .. Gisely - SS_113265 - 12/11/2009
    ElseIf c_cia_ita_mfr$ = "99" Then
        If Val(R1FAB001.TB_SGR_UBB.Text) = 0 Then
            sgr_ubb = "       "
        Else
            sgr_ubb = Format(R1FAB001.TB_SGR_UBB.Text, "0000000")
        End If
        
        ' passa parâmetros
        If c_rmo_ubb = 82 Then
            u_apo_opf$ = "5983" & c_suc_ubb & c_rmo_ubb & "30" & u_apo_pnc_ubb & sgr_ubb
        Else
            u_apo_opf$ = "5983" & c_suc_ubb & c_rmo_ubb & "00" & u_apo_pnc_ubb & sgr_ubb
        End If
        
        If FU_Parametro(SqlConn, "@c_e_neg", 0, SQLINT2%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@c_rmo_mfr", 0, SQLINT2%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_apo_mfr", 0, SQLINT4%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_ite_apo_mfr", 0, SQLCHAR%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_apo_mfr_opf", u_apo_opf$, SQLCHAR%) = FAIL% Then Exit Function
        If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4) = FAIL% Then Exit Function
    'Fim ..... Gisely  SS_113265 - 12/11/2009
    Else
        ' passa parâmetros
        If FU_Parametro(SqlConn, "@c_e_neg", 0, SQLINT2%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@c_rmo_mfr", 0, SQLINT2%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_apo_mfr", 0, SQLINT4%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_ite_apo_mfr", "", SQLCHAR%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_apo_mfr_opf", u_apo_agf, SQLCHAR%) = FAIL% Then Exit Function
        If c_isg_agf <> "" Then If FU_Parametro(SqlConn, "@c_isg", c_isg_agf, SQLINT2%) = FAIL% Then Exit Function
        If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4) = FAIL% Then Exit Function
    End If
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_apo_mfr_ptn_nova"
        Exit Function
    End If

    ' executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_apo_mfr_ptn_nova"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_mfr_ptn_nova"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            c_cia_ita$ = Trim$(SqlData$(SqlConn%, 1))
            c_rmo$ = Trim$(SqlData$(SqlConn%, 2))
            u_apo_pnc$ = Trim$(SqlData$(SqlConn%, 3))
            u_apo_dpd$ = Trim$(SqlData$(SqlConn%, 4))
            c_isg$ = Trim$(SqlData$(SqlConn%, 5))

            fu_sel_apo_mfr_ptn_nova = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_mfr_ptn_nova"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_apo_mfr_ptn_nova = False

End Function

Function fu_sel_apo_mfr_ptn_velha(APOLICE_MAINFRAME$) As Integer

    ' seleciona o número da Apolice da nova Arquitetura

    ' retorno de funções
    Dim Ret As Integer
    Dim c_isg_nova As String

    fu_sel_apo_mfr_ptn_velha = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_apo_mfr_ptn_s07712", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_apo_mfr_ptn_velha"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_apo_mfr_ptn_velha"
        Exit Function
    End If

    ' executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_apo_mfr_ptn_velha"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_mfr_ptn_velha"
        Exit Function
    End If
    
    APOLICE_MAINFRAME$ = ""
    posicao_dad_apo_mfr% = 0

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            c_t_neg$ = Trim$(SqlData$(SqlConn%, 1))
            c_rmo_mfr$ = Trim$(SqlData$(SqlConn%, 2))
            u_apo_pnc_mfr$ = Trim$(SqlData$(SqlConn%, 3))
            u_isg_mfr$ = Trim$(SqlData$(SqlConn%, 4))
            c_isg_nova$ = Trim$(SqlData$(SqlConn%, 5))

            If APOLICE_MAINFRAME$ = "" Then
                APOLICE_MAINFRAME$ = " Número: " & c_t_neg$ & "." & c_rmo_mfr$ & "." & u_apo_pnc_mfr$ & "." & u_isg_mfr$
                
                ReDim dad_apo_mfr(0)
                dad_apo_mfr(UBound(dad_apo_mfr)).c_t_neg$ = c_t_neg$
                dad_apo_mfr(UBound(dad_apo_mfr)).c_rmo_mfr$ = c_rmo_mfr$
                dad_apo_mfr(UBound(dad_apo_mfr)).u_apo_pnc_mfr$ = u_apo_pnc_mfr$
                dad_apo_mfr(UBound(dad_apo_mfr)).u_isg_mfr$ = u_isg_mfr$
                dad_apo_mfr(UBound(dad_apo_mfr)).c_isg$ = c_isg_nova$
            Else
                'apolice_mainframe$ = "Ver o Número no Item"
                If dad_apo_mfr(UBound(dad_apo_mfr)).c_isg$ = c_isg_nova$ Then
                    APOLICE_MAINFRAME$ = "  " & (posicao_dad_apo_mfr + 1) & "ª --> " & dad_apo_mfr(0).c_t_neg$ & "." & dad_apo_mfr(0).c_rmo_mfr$ & "." & dad_apo_mfr(0).u_apo_pnc_mfr$ & "." & dad_apo_mfr(0).u_isg_mfr$
                Else
                    APOLICE_MAINFRAME$ = " Item " & dad_apo_mfr(0).c_isg$ & ":  " & dad_apo_mfr(0).c_t_neg$ & "." & dad_apo_mfr(0).c_rmo_mfr$ & "." & dad_apo_mfr(0).u_apo_pnc_mfr$ & "." & dad_apo_mfr(0).u_isg_mfr$
                End If
                ReDim Preserve dad_apo_mfr(UBound(dad_apo_mfr) + 1)
                ReDim Preserve dad_apo_mfr(UBound(dad_apo_mfr))
                dad_apo_mfr(UBound(dad_apo_mfr)).c_t_neg$ = c_t_neg$
                dad_apo_mfr(UBound(dad_apo_mfr)).c_rmo_mfr$ = c_rmo_mfr$
                dad_apo_mfr(UBound(dad_apo_mfr)).u_apo_pnc_mfr$ = u_apo_pnc_mfr$
                dad_apo_mfr(UBound(dad_apo_mfr)).u_isg_mfr$ = u_isg_mfr$
                dad_apo_mfr(UBound(dad_apo_mfr)).c_isg$ = c_isg_nova$
            End If

            fu_sel_apo_mfr_ptn_velha = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_mfr_ptn_velha"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_apo_mfr_ptn_velha = False
    
End Function

Function fu_sel_apo_mfr_ptn_velha_bnj(apolice_mainframe_bnj$)

    ' seleciona o número da Apolice da nova Arquitetura

    ' retorno de funções
    Dim Ret As Integer
    Dim c_isg_nova As String

    fu_sel_apo_mfr_ptn_velha_bnj = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_apo_mfr_ptn_s08420", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_apo_mfr_ptn_velha_bnj"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_apo_mfr_ptn_velha_bnj"
        Exit Function
    End If

    ' executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_apo_mfr_ptn_velha_bnj"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_mfr_ptn_velha_bnj"
        Exit Function
    End If
    
    apolice_mainframe_bnj$ = ""
    posicao_dad_apo_mfr_bnj% = 0

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            u_isg_mfr$ = Trim$(SqlData$(SqlConn%, 4))
            c_isg_nova$ = Trim$(SqlData$(SqlConn%, 5))
            u_apo_mfr_bnj$ = Trim$(SqlData$(SqlConn%, 6))

            c_rmo_bnj$ = Left$(u_apo_mfr_bnj$, 2)
            c_suc_bnj$ = Mid$(u_apo_mfr_bnj$, 3, 2)
            c_doc_bnj$ = Mid$(u_apo_mfr_bnj$, 5, 1)
            u_apo_pnc_mfr$ = Mid$(u_apo_mfr_bnj$, 6, 7)

            If apolice_mainframe_bnj$ = "" Then
                apolice_mainframe_bnj$ = " Número: " & c_rmo_bnj$ & "." & c_suc_bnj$ & "." & c_doc_bnj$ & "." & u_apo_pnc_mfr$ & "." & u_isg_mfr$
                
                ReDim dad_apo_mfr_bnj(0)
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_rmo_bnj$ = c_rmo_bnj$
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_suc_bnj$ = c_suc_bnj$
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_doc_bnj$ = c_doc_bnj$
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).u_apo_pnc_mfr$ = u_apo_pnc_mfr$
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).u_isg_mfr$ = u_isg_mfr$
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_isg$ = c_isg_nova$
            Else
                'apolice_mainframe_bnj$ = "Ver o Número no Item"
                If dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_isg$ = c_isg_nova$ Then
                    apolice_mainframe_bnj$ = "  " & (posicao_dad_apo_mfr_bnj + 1) & "ª -> " & dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_rmo_bnj$ & "." & dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_suc_bnj$ & "." & dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_doc_bnj$ & "." & dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).u_apo_pnc_mfr$ & "." & dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).u_isg_mfr$
                Else
                    apolice_mainframe_bnj$ = " Item " & dad_apo_mfr_bnj(0).c_isg$ & ":  " & dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_rmo_bnj$ & "." & dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_suc_bnj$ & "." & dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_doc_bnj$ & "." & dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).u_apo_pnc_mfr$ & "." & dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).u_isg_mfr$
                End If
                
                ReDim Preserve dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj) + 1)
                ReDim Preserve dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj))
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_rmo_bnj$ = c_rmo_bnj$
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_suc_bnj$ = c_suc_bnj$
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_doc_bnj$ = c_doc_bnj$
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).u_apo_pnc_mfr$ = u_apo_pnc_mfr$
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).u_isg_mfr$ = u_isg_mfr$
                dad_apo_mfr_bnj(UBound(dad_apo_mfr_bnj)).c_isg$ = c_isg_nova$
            End If

            fu_sel_apo_mfr_ptn_velha_bnj = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_mfr_ptn_velha_bnj"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_apo_mfr_ptn_velha_bnj = False

End Function

'
'x*x* Luciane  18.08.1997 x*x*
'
Function fu_sel_apo_nroapolice(Optional aditamento As Boolean)

    'Verifica se existe a apólice na tabela dbnprod..tb_apo, cuja restrição
    'é o número da apólice
    
    Dim Ret As Integer     'retorno de funções
    Dim i   As Integer     'array de apólice (dad_apo)
    Dim acessos As Integer 'número de chamadas a serem feitas p/ seleção dos dados
    
    ' utilizados p/ controlar 2 acessos que deverão ser feitos se apólice
    ' Vida (Individual -> e_osg = "PES"  Grupo -> e_osg = "GRP")
    ' Diferenciado ( valores de e_osg -> "LRS", "ARS", "PLT", "MRS", "DVS")
    Dim Contador    As Integer
    
    fu_sel_apo_nroapolice = False
    
    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..PR_APO_S06435", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_apo_nroapolice"
        Exit Function
    End If
    
    ' passa parametros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    
    If aditamento = True Then
        If FU_Parametro(SqlConn, "@u_adi", R1FAB001.tb_u_adi.Text, SQLINT4%) = FAIL% Then Exit Function
    End If
    
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_apo_nroapolice"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_apo_nroapolice"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_nroapolice"
        Exit Function
    End If
   
   ' processa os resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            
            If aditamento = True Then
                fu_sel_apo_nroapolice = True
                Exit Function
            End If
            'Carrega vetor de claúsulas contratadas
            ReDim Preserve dad_apo(0 To i%) As apolice
            
            dad_apo(i%).c_cia_ita = Trim$(SqlData$(SqlConn%, 1))
            dad_apo(i%).c_rmo = Trim$(SqlData$(SqlConn%, 2))
            dad_apo(i%).u_apo_pnc = Trim$(SqlData$(SqlConn%, 3))
            dad_apo(i%).u_apo_dpd = Trim$(SqlData$(SqlConn%, 4))
            dad_apo(i%).c_cia_ita_ant = Trim$(SqlData$(SqlConn%, 5))
            dad_apo(i%).c_rmo_ant = Trim$(SqlData$(SqlConn%, 6))
            dad_apo(i%).u_apo_pnc_ant = Trim$(SqlData$(SqlConn%, 7))
            dad_apo(i%).u_apo_dpd_ant = Trim$(SqlData$(SqlConn%, 8))
            dad_apo(i%).d_icl_apo = Trim$(SqlData$(SqlConn%, 9))
            
            'x*x* Luciane  19.08.1997 x*x*
            dad_apo(i%).c_pro = Trim$(SqlData$(SqlConn%, 10))
            dad_apo(i%).e_fam_pro = Trim$(SqlData$(SqlConn%, 11))
            dad_apo(i%).c_agr_fam_pro = Trim$(SqlData$(SqlConn%, 12))
            dad_apo(i%).t_fam_pro = Trim$(SqlData$(SqlConn%, 13))
    
            i% = i% + 1
    
            fu_sel_apo_nroapolice = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_nroapolice"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_apo_nroapolice = False
        
End Function

Function fu_sel_Certificado() As Boolean

Dim Ret                 As Integer     'retorno de funções
    
Dim Contador    As Integer
    
    fu_sel_Certificado = False
    gLinhasApolice = 0
    
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_Consulta_Certificado_S10995", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_Certificado"
        Exit Function
    End If
    
    ' passa parametros
    If FU_Parametro(SqlConn, "@Apolice", gstrApolice, SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@Estipulante", R1FAB001.tb_SubEstipulante, SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@Certificado", R1FAB001.tb_Certificado, SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@TipoSel", R1FAB001.pintTipoSelecao, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@Codigo_Err", "0", SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@Erro_Syb", "0", SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@Linhas", "0", SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@MsgErr", "", SQLVARCHAR%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_Certificado"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_Certificado"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_Certificado"
        Exit Function
    End If
    
    Erase dad_apo
    i% = 0
   ' processa os resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            'Carrega vetor de claúsulas contratadas
            ReDim Preserve dad_apo(0 To i%) As apolice
            
            dad_apo(i%).c_cia_ita = Trim$(SqlData$(SqlConn%, 1))
            dad_apo(i%).c_rmo = Trim$(SqlData$(SqlConn%, 2))
            dad_apo(i%).u_apo_pnc = Trim$(SqlData$(SqlConn%, 3))
            dad_apo(i%).u_apo_dpd = Trim$(SqlData$(SqlConn%, 4))
            dad_apo(i%).c_cia_ita_ant = Trim$(SqlData$(SqlConn%, 5))
            dad_apo(i%).c_rmo_ant = Trim$(SqlData$(SqlConn%, 6))
            dad_apo(i%).u_apo_pnc_ant = Trim$(SqlData$(SqlConn%, 7))
            dad_apo(i%).u_apo_dpd_ant = Trim$(SqlData$(SqlConn%, 8))
            dad_apo(i%).c_isg = Trim$(SqlData$(SqlConn%, 10))
            dad_apo(i%).c_pro = Trim$(SqlData$(SqlConn%, 11))
            
'Colocar a chamada da PRS00554
                
            i% = i% + 1
    
            fu_sel_Certificado = True
        
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_Certificado"
        Exit Function
    End If
    
    gLinhasApolice = Val(SqlRetData$(SqlConn%, 3))

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_Certificado = False
        
End Function

Function fu_sel_apo_nroapolice_bd_rgd() As Integer

   'Verifica se existe a apólice na tabela dbnprod..tb_pes_apo_rgd,
   'cuja restrição é o número da apólice
   
   Dim Ret As Integer     'retorno de funções
   Dim i   As Integer     'array de apólice (dad_apo)
   Dim acessos As Integer 'número de chamadas a serem feitas p/ seleção dos dados
   
   Dim Contador    As Integer
  
   fu_sel_apo_nroapolice_bd_rgd = False

   ' inicializa stored procedure
   Ret% = SQLRPCInit%(SqlConn%, "dbnprod..PR_PES_APO_RGD_S07217", 0)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlRpcInit%, "fu_sel_apo_nroapolice_bd_rgd"
      Exit Function
   End If

   ' passa parametros
   If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
   If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
   If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
   If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4%) = FAIL% Then Exit Function
   
   ' envia comando
   Ret% = SQLRPCSend%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlRpcSend%, "fu_sel_apo_nroapolice_bd_rgd"
      Exit Function
   End If

   ' executa stored procedure
   Ret% = SqlOk%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlOk%, "fu_sel_apo_nroapolice_bd_rgd"
      Exit Function
   End If
   
   ' verifica resultados
   Ret% = SqlResults%(SqlConn%)
   If Ret% = FAIL% Then
      su_erro_st_proc ST_SqlResults%, "fu_sel_apo_nroapolice_bd_rgd"
      Exit Function
   End If
   
   ' processa os resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop
      
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_apo_nroapolice_bd_rgd"
        Exit Function
    End If
   
    If Val(SqlRetData(SqlConn%, 1)) <> 0 Then
        fu_sel_apo_nroapolice_bd_rgd = True
    End If

   If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_apo_nroapolice_bd_rgd = False

End Function

Function fu_sel_apo_objeto() As Integer

    'Verifica se existe a apólice na tabela dbnprod..tb_apo, cuja restrição
    'é o tipo de objeto
    
    Dim Ret As Integer      'retorno de funções
    Dim i   As Integer      'array de apólice (dad_apo)
    ' utilizados p/ controlar 2 acessos que deverão ser feitos se apólice
    ' Vida (Individual -> e_osg = "PES"  Grupo -> e_osg = "GRP")
    ' Diferenciado ( valores de e_osg -> "LRS", "ARS", "PLT", "MRS", "DVS")
    Dim Contador    As Integer
    Dim acessos     As Integer ' número de chamadas a serem feitas p/ seleção dos dados
    
    Dim msg As String
    
    fu_sel_apo_objeto = False
    Contador% = 0
        
    ' determina o número de acessos a serem realizados
    If Val(c_agr_fam_pro$) = 4 Then ' VIDA
        acessos% = 1
        ' inicialmente serão pesquisados apólices Individual
        e_osg = "PES"
    ElseIf Val(c_agr_fam_pro$) = 5 Then ' Diferenciado
        acessos% = 3
        ' inicialmente serão pesquisadas apólices com e_osg = "LRS"
        e_osg$ = "LRS"
    End If
    
    'limpa array c/ dados da apólice
    'Erase dad_apo
    
    For Contador% = 0 To acessos%
      
        ' inicializa stored procedure
        Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_apo_s05167  ", 0)
        If Ret% = FAIL% Then
            su_erro_st_proc ST_SqlRpcInit%, "fu_sel_apo_objeto"
            Exit Function
        End If
   
        ' passa parametros
        If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@e_osg", e_osg$, SQLCHAR%) = FAIL% Then Exit Function
        If FU_Parametro(SqlConn, "@i_e_osg", i_e_osg$, SQLCHAR%) = FAIL% Then Exit Function
        
        ' envia comando
        Ret% = SQLRPCSend%(SqlConn%)
        If Ret% = FAIL% Then
            su_erro_st_proc ST_SqlRpcSend%, "fu_sel_apo_objeto"
            Exit Function
        End If
    
        ' executa stored procedure
        Ret% = SqlOk%(SqlConn%)
        If Ret% = FAIL% Then
            su_erro_st_proc ST_SqlOk%, "fu_sel_apo_objeto"
            Exit Function
        End If
        
        ' verifica resultados
        Ret% = SqlResults%(SqlConn%)
        If Ret% = FAIL% Then
            su_erro_st_proc ST_SqlResults%, "fu_sel_apo_objeto"
            Exit Function
        End If
      
        ' processa os resultados
        Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
            
            Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
                'Carrega vetor de claúsulas contratadas
                ReDim Preserve dad_apo(0 To i%) As apolice
                
                dad_apo(i%).c_cia_ita = Trim$(SqlData$(SqlConn%, 1))
                dad_apo(i%).c_rmo = Trim$(SqlData$(SqlConn%, 2))
                dad_apo(i%).u_apo_pnc = Trim$(SqlData$(SqlConn%, 3))
                dad_apo(i%).u_apo_dpd = Trim$(SqlData$(SqlConn%, 4))
                dad_apo(i%).c_cia_ita_ant = Trim$(SqlData$(SqlConn%, 5))
                dad_apo(i%).c_rmo_ant = Trim$(SqlData$(SqlConn%, 6))
                dad_apo(i%).u_apo_pnc_ant = Trim$(SqlData$(SqlConn%, 7))
                dad_apo(i%).u_apo_dpd_ant = Trim$(SqlData$(SqlConn%, 8))
                dad_apo(i%).d_icl_apo = Trim$(SqlData$(SqlConn%, 9))
                
                dad_apo(i%).e_osg = e_osg$
                
                i% = i% + 1
                
                fu_sel_apo_objeto = True
    
                Ret% = SqlNextRow%(SqlConn%)
            Loop
    
            Ret% = SqlResults%(SqlConn%)
        Loop
    
        If Ret% = FAIL% Then
            su_erro_st_proc ST_SqlResults%, "fu_sel_apo_objeto"
            Exit Function
        End If
        
        Select Case Val(c_agr_fam_pro$)
    
            'Apólice Saúde
            Case 2
                e_osg$ = "PES"
        
            'Apólice VIDA
            Case 4
                ' pesquisa de apólice GRUPO
                e_osg$ = "GRP"
                
            'Apólice Diferenciado
            Case 5
                Select Case Contador%
                    Case 1
                        e_osg$ = "ARS"
                    Case 2
                        e_osg$ = "PLT"
                    Case 3
                        e_osg$ = "MRS"
                End Select
            
            'Apólice Diferenciado - Diversos
            Case 6
                e_osg$ = "DVS"
    
        End Select
        
        If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
            fu_sel_apo_objeto = False
            Exit Function
        End If
        
        'contador% = contador% + 1

    Next Contador%

End Function

'STJ
Function fu_sel_asu() As Integer
    
    Dim i   As Integer
    ' retorno de funções
    Dim Ret As Integer

    fu_sel_asu = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnapoio..pr_asu_s06653", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_asu"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@e_asu", e_asu%, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@erro", 0, SQLINT4%) = FAIL% Then Exit Function
    
    'envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_asu"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_asu"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_asu"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            R1FAB005.cb_txt_apo.AddItem Trim$(SqlData$(SqlConn%, 1))
            R1FAB005.cb_txt_apo.ItemData(R1FAB005.cb_txt_apo.NewIndex) = e_asu%
            fu_sel_asu = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_asu"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_asu = False

End Function

Function fu_sel_cla_apo() As Integer

' ==========================================================================+++++'
'                          A L T E R A Ç Ã O                                     '
' _______________________________________________________________________________'
' AUTOR     : Mara (Origin)                                                      '
' DATA      : 10/09/1998                                                         '
' Objetivo  : Substituir a PRS04424 pela PRS07890, a fim de trazer para consulta '
'             os dados da clúsula que sofreu alteração no aditamento mais atual  '
'             classificadas por item: Apólice/Item da Apólice (0/1)              '
' STP       : DBNPROD.. PR_CLA_APO_S07890                                        '
' ============================================================================+++'
 
    ' consulta cláusulas da apólice

    ' array de cláusulas
    Dim i   As Integer

    ' retorno de funções
    Dim Ret As Integer
    
    fu_sel_cla_apo = False

    ' inicializa stored procedure
    'ret% = sqlrpcinit%(sqlconn%, "dbnprod..pr_cla_apo_s04424", 0)
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_cla_apo_s07890", 0)
    
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_cla_apo"
        Exit Function
    End If
    
    ' passagem de parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_pro", c_pro, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT4%) = FAIL% Then Exit Function
    
    'envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_cla_apo"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_cla_apo"
        Exit Function
    End If

    Erase dad_cla_apo
    existe_dad_cla_apo% = False

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_cla_apo"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            'Carrega vetor de claúsulas contratadas
            ReDim Preserve dad_cla_apo(0 To i%) As clausulas
            
            'dad_cla_apo(I%).d_ini_niv_cla = Trim$(Format$(sqldata$(sqlconn%, 1), "dd/mm/yyyy"))
            'dad_cla_apo(I%).d_fim_niv_cla = Trim$(Format$(sqldata$(sqlconn%, 2), "dd/mm/yyyy"))
            'dad_cla_apo(I%).n_ptc_cla = Trim$(sqldata$(sqlconn%, 3))
            'dad_cla_apo(I%).t_cpl_cla_niv = Trim$(sqldata$(sqlconn%, 4))
            'dad_cla_apo(I%).t_cla = Trim$(sqldata$(sqlconn%, 5))
            'dad_cla_apo(I%).u_adi = Trim$(sqldata$(sqlconn%, 6))

            dad_cla_apo(i%).c_isg = Trim$(SqlData$(SqlConn%, 1))
            dad_cla_apo(i%).u_adi = Trim$(SqlData$(SqlConn%, 3))
            dad_cla_apo(i%).d_ini_niv_cla = Trim$(Format$(SqlData$(SqlConn%, 4), "dd/mm/yyyy"))
            dad_cla_apo(i%).d_fim_niv_cla = Trim$(Format$(SqlData$(SqlConn%, 5), "dd/mm/yyyy"))
            dad_cla_apo(i%).n_ptc_cla = Trim$(SqlData$(SqlConn%, 6))
            dad_cla_apo(i%).t_cpl_cla_niv = Trim$(SqlData$(SqlConn%, 7))
            dad_cla_apo(i%).t_cla = Trim$(SqlData$(SqlConn%, 8))
            
            existe_dad_cla_apo% = True

            i% = i% + 1
            fu_sel_cla_apo = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_cla_apo"
        Exit Function
    End If

    ' Linhas retornadas
    If Val(SqlRetData(SqlConn%, 1)) = 0 Then
        fu_sel_cla_apo = False
    End If
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_cla_apo = False

End Function

Function fu_sel_cli_apo() As Integer

    ' seleciona o código do cliente na tabela dbnprod..tb_cli_apo

    ' retorno de funções
    Dim Ret As Integer

    fu_sel_cli_apo = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_cli_apo_s02264", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_cli_apo"
        Exit Function
    End If
    
    ' passa os parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_cli_apo"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_cli_apo"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_cli_apo"
        Exit Function
    End If
    
    ' processa os resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            c_idt_pes$ = Trim$(SqlData$(SqlConn%, 1))
            fu_sel_cli_apo = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_cli_apo"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_cli_apo = False

End Function

Function fu_sel_cli_apo2() As Integer
    
    ' seleciona dados da apólice através do código do cliente
    ' na tabela dbnprod..tb_cli_apo

    ' array de apólice
    Dim i   As Integer
    ' retorno de funções
    Dim Ret As Integer

    ' utilizados p/ controlar 2 acessos que deverão ser feitos se apólice
    ' Vida (Individual -> e_osg = "PES"  Grupo -> e_osg = "GRP")
    Dim Contador    As Integer
    Dim acessos     As Integer
    
    fu_sel_cli_apo2 = False

    'Suzuki 07/08/98
    If Not fu_sel_pes_ref_s07838() Then
       su_erro_st_proc ST_SqlResults%, "fu_sel_pes_ref_s07838"
       Exit Function
    End If

    ' determina o número de acessos a serem realizados
    If Val(c_agr_fam_pro$) = 4 And R1FAB001.ch3d_Ramo_Prod.Value = True Then  ' VIDA
        acessos% = 1
        ' inicialmente serão pesquisados apólices Individual
        e_osg = "PES"
    End If

    'limpa array c/ dados da apólice
    'Erase dad_apo
    
    For Contador% = 0 To acessos%
    
        'Suzuki 07/08/98
        Dim Conta   As Integer
        Conta% = 0
        Do Until Conta% = Conta_pes%
        '
            ' inicializa stored procedure
            Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_cli_apo_s04803", 0)
            If Ret% = FAIL% Then
                su_erro_st_proc ST_SqlRpcInit%, "fu_sel_cli_apo2"
                Exit Function
            End If
            
            ' passa parâmetro
            'Suzuki 07/08/98
            'If FU_PARAMETRO("@c_idt_pes", c_idt_pes$, SQLINT4%) = FAIL% Then Exit Function
            If FU_Parametro(SqlConn, "@c_idt_pes", Reg_pes(Conta%).c_idt_pes_ref, SQLINT4%) = FAIL% Then Exit Function
            '
            If FU_Parametro(SqlConn, "@e_osg", e_osg$, SQLCHAR%) = FAIL% Then Exit Function
            ' Apólice VIDA
            ' Tanto para apólices VIDA e SAÚDE, e_osg = "PES".
            ' Para diferenciá-los, verifica-se c_rmo$:
            '                                           SAÚDE -> 87
            If FU_Parametro(SqlConn, "@c_rmo", "", SQLINT4%) = FAIL% Then Exit Function
            If FU_Parametro(SqlConn, "@i_e_osg", i_e_osg, SQLCHAR%) = FAIL% Then Exit Function
    
            ' envia comando
            Ret% = SQLRPCSend%(SqlConn%)
            If Ret% = FAIL% Then
                su_erro_st_proc ST_SqlRpcSend%, "fu_sel_cli_apo2"
                Exit Function
            End If
            
            ' executa stored procedure
            Ret% = SqlOk%(SqlConn%)
            If Ret% = FAIL% Then
                su_erro_st_proc ST_SqlOk%, "fu_sel_cli_apo2"
                Exit Function
            End If
        
            ' verifica resultado
            Ret% = SqlResults%(SqlConn%)
            If Ret% = FAIL% Then
                su_erro_st_proc ST_SqlResults%, "fu_sel_cli_apo2"
                Exit Function
            End If
            
            Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
                Ret% = SqlNextRow%(SqlConn%)
                
                Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
                    ReDim Preserve dad_apo(0 To i%) As apolice
                    
                    dad_apo(i%).c_cia_ita = Trim$(SqlData$(SqlConn%, 1))
                    dad_apo(i%).c_rmo = Trim$(SqlData$(SqlConn%, 2))
                    dad_apo(i%).u_apo_pnc = Trim$(SqlData$(SqlConn%, 3))
                    dad_apo(i%).u_apo_dpd = Trim$(SqlData$(SqlConn%, 4))
                    dad_apo(i%).e_fam_pro = Trim$(SqlData$(SqlConn%, 5))
                    dad_apo(i%).c_agr_fam_pro = Trim$(SqlData$(SqlConn%, 6))
                    dad_apo(i%).t_fam_pro = Trim$(SqlData$(SqlConn%, 7))
                    dad_apo(i%).e_osg = e_osg$
                    
                    i% = i% + 1
                    fu_sel_cli_apo2 = True

                    Ret% = SqlNextRow%(SqlConn%)
                Loop
            
                Ret% = SqlResults%(SqlConn%)
            Loop

            If Ret% = FAIL% Then
                su_erro_st_proc ST_SqlResults%, "fu_sel_cli_apo2"
                Exit Function
            End If

            If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
                fu_sel_cli_apo2 = False
                Exit Function
            End If

            'Suzuki 07/08/98
            Conta% = Conta% + 1
        Loop
            '
        ' apólice VIDA
        If Val(c_agr_fam_pro$) = 4 And R1FAB001.ch3d_Ramo_Prod.Value = True Then
            ' pesquisa de apólice GRUPO
            e_osg$ = "GRP"
        End If

    Next Contador%

End Function

'OBJETIVO:  Seleciona dados da apólice através do número da proposta na
'           tabela dbnprod..tb_ctl_emi_prp
'
Function fu_sel_ctl_emi_prp1() As Integer
   
   Dim Ret As Integer     'retorno de funções
   Dim i   As Integer     'array de apólice
   Dim acessos As Integer 'número de chamadas para selecionar dados
   ' utilizados p/ controlar 2 acessos que deverão ser feitos se apólice
   ' Vida (Individual -> e_osg = "PES"  Grupo -> e_osg = "GRP")
   Dim Contador As Integer
    
   fu_sel_ctl_emi_prp1 = False

   ' determina o número de acessos a serem realizados
   If Val(c_agr_fam_pro$) = 4 Then ' VIDA
    ' Marcos 27/09/2000
    ' Estava acessando o banco 2x duplicando o Nº de registros quando o retorno era 1
    ' acessos% = 1
      acessos% = 0
      ' inicialmente serão pesquisados apólices Individual
      e_osg$ = "PES"
   End If

   ' limpa array c/ dados da apólice
   ' Erase dad_apo
   For Contador% = 0 To acessos%
      
      ' inicializa stored procedure
      Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_ctl_emi_prp_s04231", 0)
      If Ret% = FAIL% Then
         su_erro_st_proc ST_SqlRpcInit%, "fu_sel_ctl_emi_prp1"
         Exit Function
         
      End If
      
      ' passa parâmetros
      If FU_Parametro(SqlConn, "@u_prp", u_prp$, SQLINT4%) = FAIL% Then Exit Function
      If FU_Parametro(SqlConn, "@e_osg", e_osg$, SQLCHAR%) = FAIL% Then Exit Function
      If FU_Parametro(SqlConn, "@c_rmo", "0", SQLINT2) = FAIL% Then Exit Function
      If FU_Parametro(SqlConn, "@i_e_osg", i_e_osg, SQLCHAR%) = FAIL% Then Exit Function
   
      ' envia comando
      Ret% = SQLRPCSend%(SqlConn%)
      If Ret% = FAIL% Then
         su_erro_st_proc ST_SqlRpcSend%, "fu_sel_ctl_emi_prp1"
         Exit Function
      End If
   
      ' executa stored procedure
      Ret% = SqlOk%(SqlConn%)
      If Ret% = FAIL% Then
         su_erro_st_proc ST_SqlOk%, "fu_sel_ctl_emi_prp1"
         Exit Function
      End If
   
      ' verifica resultados
      Ret% = SqlResults%(SqlConn%)
      If Ret% = FAIL% Then
         su_erro_st_proc ST_SqlResults%, "fu_sel_ctl_emi_prp1"
         Exit Function
      End If
      
      ' processa resultados
        Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
            
            Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
                ReDim Preserve dad_apo(0 To i%) As apolice
                
                dad_apo(i%).c_cia_ita = Trim$(SqlData$(SqlConn%, 1))
                dad_apo(i%).c_rmo = Trim$(SqlData$(SqlConn%, 2))
                dad_apo(i%).u_apo_pnc = Trim$(SqlData$(SqlConn%, 3))
                dad_apo(i%).u_apo_dpd = Trim$(SqlData$(SqlConn%, 4))
                dad_apo(i%).e_osg = e_osg$
                
                'x*x* Luciane  19.08.1997 x*x*
                dad_apo(i%).e_fam_pro$ = Trim$(SqlData$(SqlConn%, 5))
                dad_apo(i%).c_agr_fam_pro$ = Trim$(SqlData$(SqlConn%, 6))
                dad_apo(i%).t_fam_pro = Trim$(SqlData$(SqlConn%, 7))
                
                i% = i% + 1
                
                fu_sel_ctl_emi_prp1 = True

                Ret% = SqlNextRow%(SqlConn%)
            Loop
    
            Ret% = SqlResults%(SqlConn%)
        Loop
    
        If Ret% = FAIL% Then
            su_erro_st_proc ST_SqlResults%, "fu_sel_ctl_emi_prp1"
            Exit Function
        End If
    
        If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then
            fu_sel_ctl_emi_prp1 = False
            Exit Function
        End If
    
        ' apólice VIDA
        If Val(c_agr_fam_pro$) = 4 Then
            ' pesquisa de apólice GRUPO
            e_osg$ = "GRP"
        End If

   Next Contador%
        
End Function

Function fu_sel_ctl_emi_prp2() As Integer

    ' seleciona o número da proposta correspondente à apólice

    ' retorno de funções
    Dim Ret As Integer

    fu_sel_ctl_emi_prp2 = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_ctl_emi_prp_s02488", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_ctl_emi_prp2"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_ctl_emi_prp2"
        Exit Function
    End If

    ' executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_ctl_emi_prp2"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_ctl_emi_prp2"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            If Val(R1FAB001.tb_u_prp.Text) = Val(SqlData$(SqlConn%, 1)) Then
                u_prp$ = Trim$(SqlData$(SqlConn%, 1))
                fu_sel_ctl_emi_prp2 = True
            End If

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_ctl_emi_prp2"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_ctl_emi_prp2 = False

End Function

Function fu_sel_cvd() As Integer
    
    ' Seleciona nome do corretor

    ' retorno de funções
    Dim Ret         As Integer
    Dim il_first    As Integer
    
    fu_sel_cvd = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit(SqlConn%, "dbnproc..pp_cvd_s02265", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_cvd"
        Exit Function
    End If
        
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@u_rgt_ssp", u_rgt_ssp_prp$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_dco_rgt_ssp", u_dco_rgt_ssp_prp$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_loc_pgt_cvd", c_loc_pgt_cvd_prp$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@e_cvd", e_cvd_prp$, SQLINT2%) = FAIL% Then Exit Function
                                   
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_cvd"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_cvd"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_cvd"
        Exit Function
    End If

    ' processa resultados
    il_first = True
    
    n_pes_cor$ = "DESCONHECIDO"
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            If il_first Then
                il_first = False
                n_pes_cor$ = UCase$(Trim$(SqlData$(SqlConn%, 1)))
            End If
            fu_sel_cvd = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_cvd"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_cvd = False

End Function

Function fu_sel_dad_tco_apo() As Integer

    ' Seleciona texto de situação da apólice.
    ' Se c_sit_apo = 1 (Apolice Vigente), c_sit_apo = 5
    ' Apolice Reabilitada) ou c_sit_apo = 10 (Apolice Vigência Reduzida),
    ' verificar a data de fim de vigência e compará-la com a data atual.
    ' Se data menor
    '           c_sit_apo = 7 (Apolice Vigencia Terminada)

    ' retorno de funções
    Dim Ret As Integer

    fu_sel_dad_tco_apo = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_dad_tco_apo_s04293", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_dad_tco_apo"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    
    If FU_Parametro_Ret(SqlConn, "@c_sit_apo", "0", SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@t_sit_apo", "", SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@d_dia_env_dem", "0", SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4%) = FAIL% Then Exit Function
    
    
    If FU_Parametro_Ret(SqlConn, "@Q_Dia_Fim_Vig", "", SQLFLT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@D_Ini_Vig_Apo", "", SQLDATETIM4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@U_Opr_Cre", "", SQLFLT8%) = FAIL% Then Exit Function
    'Kondor - SS 132490 - Tombamento Prestamista PU
    If FU_Parametro_Ret(SqlConn, "@u_ctr_etl_fmt", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@u_ctr_etl_seq", "", SQLCHAR%) = FAIL% Then Exit Function

    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_dad_tco_apo"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_dad_tco_apo"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_dad_tco_apo"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_dad_tco_apo"
        Exit Function
    End If
    
    ' parâmetros de retorno
    If Val(SqlRetData(SqlConn%, 4)) <> 0 Then
        c_sit_apo$ = Trim$(SqlRetData(SqlConn%, 1))
        t_sit_apo$ = Trim$(SqlRetData(SqlConn%, 2))
        d_dia_env_dem$ = Trim$(SqlRetData(SqlConn%, 3))
        U_Opr_Cre = Trim$(SqlRetData(SqlConn%, 6))
        u_ctr_etl_fmt = Trim$(SqlRetData(SqlConn%, 7))
        u_ctr_etl_seq = Trim$(SqlRetData(SqlConn%, 8))
        
        fu_sel_dad_tco_apo = True
    End If
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_dad_tco_apo = False

End Function

Function fu_sel_fam_pro() As Integer
  
    ' seleciona e_fam_pro e c_agr_fam_pro
    
    'retorno de funções
    Dim Ret     As Integer
    
    fu_sel_fam_pro = False

    ' inicializa stored procedure
    If SQLRPCInit%(SqlConn%, "dbnapoio..pr_fam_pro_s07445", 0) = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_fam_pro"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_pro", c_pro$, SQLINT2%) = FAIL% Then Exit Function
    
    ' envia comando
    If SQLRPCSend%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_fam_pro"
        Exit Function
    End If

    ' executa stored procedure
    If SqlOk%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_fam_pro"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_fam_pro"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            e_fam_pro_ok$ = SqlData$(SqlConn%, 1)
            fu_sel_fam_pro = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_fam_pro"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_fam_pro = False

End Function

Function Fu_Prm_Aut_Pro() As Integer

    'Adriana - 12/02/2001
    'Objetivo :  Seleciona a ano limite
    Dim Ret As Integer
   
    Screen.MousePointer = 11
    Fu_Prm_Aut_Pro = False
    
    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_PRM_AUT_PRO_S01848", 0)
    If Ret% = FAIL Then
       Screen.MousePointer = DEFAULT
       MsgBox "Não foi possível inicializar a stored procedure DBNAPOIO..PR_PRM_AUT_PRO_S01848", 48
       Exit Function
    End If

    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_pro", c_pro$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@d_prp", Format(D_Tab_Vda_Cmz$, "MM/DD/YYYY"), SQLDATETIM4) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@codret", 0, SQLINT4%) = FAIL Then Exit Function
 
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
       Screen.MousePointer = DEFAULT
       MsgBox "Não foi possível enviar comando da stored procedure DBNAPOIO..PR_PRM_AUT_PRO_S01848", 48
       Exit Function
    End If

    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
        Screen.MousePointer = DEFAULT
        MsgBox "Não foi possível executar Stored Procedure DBNAPOIO..PR_PRM_AUT_PRO_S01848", 48
        Exit Function
    End If

    'Verifica Resultados.
    If Ret% = SUCCEED Then
        Ret% = SqlResults%(SqlConn%)
        Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
            Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
                I_Vlr_Ref$ = SqlData(SqlConn%, 13)
                Ret% = SqlNextRow%(SqlConn%)
            Loop
            Ret% = SqlResults%(SqlConn%)
        Loop
    End If

    Screen.MousePointer = DEFAULT
    
    If SqlHasRetStat(SqlConn%) = FAIL Then
       MsgBox "Erro no acesso - PR_PRM_AUT_PRO_S01848", 48
       Exit Function
    End If
    Fu_Prm_Aut_Pro = True
End Function

Sub Su_Sel_Cfg()

   Dim Ret      As Integer
   Dim n_linhas As Integer
   Dim Pos_1_20 As String
   Dim Pos_21_40 As String
   Dim Pos_41_70 As String
   
    ' Adriana 08/02/2001 - FIPE
    'Objetivo : Selecionar a configuração do veículo
    
    Ret% = SQLRPCInit%(SqlConn%, "dbnapoio..Pr_Sel_Cfg_S10075", 0)
    If Ret% = FAIL Then
       MsgBox "Não foi possível inicializar a stored procedure dbnapoio..Pr_Sel_Cfg_S10075", 48
       Exit Sub
    End If

    If FU_Parametro(SqlConn, "@Tipo", 1, SQLINT4%) = FAIL% Then Exit Sub
    If FU_Parametro(SqlConn, "@e_pcd_aut", e_pcd_aut$, SQLINT2%) = FAIL Then Exit Sub
    If FU_Parametro(SqlConn, "@c_fbr_aut", c_fbr_aut$, SQLINT2%) = FAIL Then Exit Sub
    If FU_Parametro(SqlConn, "@c_lin_aut", c_lin_aut$, SQLINT2%) = FAIL Then Exit Sub
    If FU_Parametro(SqlConn, "@c_mod_aut", c_mod_aut$, SQLINT2%) = FAIL Then Exit Sub
    If FU_Parametro(SqlConn, "@D_Tab_Vda", D_Tab_Vda_Cmz$, SQLDATETIM4%) = FAIL Then Exit Sub
    If FU_Parametro(SqlConn, "@C_Ori_Ctc", c_ori_ctc$, SQLINT1%) = FAIL Then Exit Sub
    If FU_Parametro_Ret(SqlConn, "@N_linhas", "0", SQLINT4%) = FAIL% Then Exit Sub
    If FU_Parametro(SqlConn, "@C_Cfg_Aut", c_cfg, SQLINT2%) = FAIL Then Exit Sub

    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
       MsgBox "Não foi possível enviar comando da stored procedure dbnapoio..Pr_Sel_Cfg_S10075", 48
       Exit Sub
    End If

    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
        MsgBox "Não foi possível executar Stored Procedure dbnapoio..Pr_Sel_Cfg_S10075", 48
        Exit Sub
    End If

    'Verifica Resultados.
    If Ret% = SUCCEED Then
        Ret% = SqlResults%(SqlConn%)
        Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
            Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
              Pos_1_20 = Mid$(SqlData(SqlConn%, 5), 1, 20)
              Pos_21_40 = Mid$(SqlData(SqlConn%, 5), 21, 20)
              Pos_41_70 = Mid$(SqlData(SqlConn%, 5), 41, 30)
             
              T_Cfg_Ori_Ctc$ = Trim(Pos_1_20) & " " & _
                               Trim(Pos_21_40) & " " & _
                               Trim(Pos_41_70)
              T_Cfg_Aut_Mod$ = Trim(SqlData(SqlConn%, 2))
              C_Cfg_Ori_Ctc$ = Trim(SqlData(SqlConn%, 3))
              Ret% = SqlNextRow%(SqlConn%)
            Loop
            Ret% = SqlResults%(SqlConn%)
        Loop
    End If
 
    'Verifica a Quantidade de linhas retornadas
    n_linhas% = CInt(SqlRetData(SqlConn%, 1))
    
    If SqlHasRetStat(SqlConn%) = FAIL Then
       MsgBox "Erro no acesso - Pr_Sel_Cfg_S10075 ", 48
    End If
    
End Sub

Function fu_sel_fbr_aut() As Integer
    
    ' seleciona nome do fabricante, através de seu código

    ' retorno de funções
    Dim Ret As Integer

    fu_sel_fbr_aut = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnapoio..pr_fbr_aut_s02333", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_fbr_aut"
        Exit Function
    End If

    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_fbr_aut", c_fbr_aut$, SQLINT2%) = FAIL% Then Exit Function

    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_fbr_aut"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_fbr_aut"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_fbr_aut"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            n_fbr_aut$ = Trim$(SqlData$(SqlConn%, 1))
            fu_sel_fbr_aut = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_fbr_aut"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_fbr_aut = False

End Function

Function fu_sel_his_isg_apo1() As Integer
     
    Dim Ret As Integer
    Dim i   As Integer
    'Dilson - 06/98 - inicio - R1PAB095
    'Dim aux_c_isg   As Integer    ' armazena codigo do item segurado anterior
    Dim aux_c_isg As String
    'Dilson - 06/98 - fim - R1PAB095

    ' Seleciona dados da apólice de acordo c/ o aditamento
    ' informado
    
    fu_sel_his_isg_apo1 = False
    aux_c_isg$ = "0"

    ' inicializa stored procedure
    If SQLRPCInit%(SqlConn%, "dbnprod..pr_his_isg_apo_s04227", 0) = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_his_isg_apo1"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", Val(c_cia_ita$), SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", Val(c_rmo$), SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", Val(u_apo_pnc$), SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", Val(u_apo_dpd$), SQLINT4%) = FAIL% Then Exit Function
    ' Diferenciado ou Produtos Diversos
    ' cris - 04/01/2002 - conforme Lucia - Auto
    If Val(c_agr_fam_pro$) = 1 Or Val(c_agr_fam_pro$) = 5 Or Val(c_agr_fam_pro$) = 6 Then
      If FU_Parametro(SqlConn, "@u_adi", Val(u_adi$), SQLINT4%) = FAIL% Then Exit Function
      'If fu_parametro("@d_ini_vig_adi", Format(d_ini_vig_adi$, "mm/dd/yyyy"), SQLDATETIME%) = fail% Then Exit Function
    End If

    ' envia comandos
    If SQLRPCSend%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_his_isg_apo1"
        Exit Function
    End If
    
    ' executa stored procedure
    If SqlOk%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_his_isg_apo1"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_his_isg_apo1"
        Exit Function
    End If
    
    'i% = 0
    'ReDim dad_isg(0)
    Erase dad_isg
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            If aux_c_isg$ <> Trim$(SqlData$(SqlConn%, 5)) Then
                
                aux_c_isg$ = Trim$(SqlData$(SqlConn%, 5))

                'Se a garantia não está excluida
                If Format(SqlData$(SqlConn%, 15), "dd/mm/yyyy") = "06/06/2079" Then

                    ReDim Preserve dad_isg(i%)
   
                    dad_isg(i%).c_seg_reg = Trim$(SqlData$(SqlConn%, 1))
                    dad_isg(i%).t_isg = Trim$(SqlData$(SqlConn%, 2))
                    dad_isg(i%).c_reg_utl = Trim$(SqlData(SqlConn%, 3))
                    dad_isg(i%).q_moe_vba = Val(SqlData(SqlConn%, 4))
                    dad_isg(i%).c_isg = Trim$(SqlData(SqlConn%, 5))
                    dad_isg(i%).c_osg = Trim$(SqlData(SqlConn%, 6))
                    dad_isg(i%).e_osg = Trim$(SqlData(SqlConn%, 7))
                    dad_isg(i%).u_vrs_osg = Trim$(SqlData$(SqlConn%, 8))
                    dad_isg(i%).u_adi = Trim$(SqlData(SqlConn%, 13))
                    dad_isg(i%).U_VRS_ADI = Trim$(SqlData$(SqlConn%, 14))
                    dad_isg(i%).c_esf_mot = Trim$(SqlData$(SqlConn%, 16))   ' cris - 04/01/2002 - conforme Lucia
                    dad_isg(i%).t_esf_mot = Trim$(SqlData$(SqlConn%, 17))   ' cris - 04/01/2002 - conforme Lucia
            
                    i% = i% + 1

                    fu_sel_his_isg_apo1 = True
                  
                End If
            End If

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    ' verifica resultados
    If Ret% = FAIL% Then su_erro_st_proc ST_SqlResults%, "fu_sel_his_isg_apo1"

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Or (Ret% = FAIL%) Then fu_sel_his_isg_apo1 = False
    
End Function

Function fu_sel_his_isg_apo2() As Integer
    
    ' seleciona dados do item segurado da apólice

    ' retorno de funções
    Dim Ret As Integer
    
    fu_sel_his_isg_apo2 = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_his_isg_apo_s04198", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_his_isg_apo2"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_his_isg_apo2"
        Exit Function
    End If

    ' executa a stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_his_isg_apo2"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_his_isg_apo2"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            c_lin_aut$ = Trim$(SqlData$(SqlConn%, 9))
            c_mod_aut$ = Trim$(SqlData$(SqlConn%, 10))
            u_plc_aut$ = Trim$(SqlData$(SqlConn%, 11))
            u_chs_aut$ = Trim$(SqlData$(SqlConn%, 12))
            c_fbr_aut$ = Trim$(SqlData$(SqlConn%, 13))
            e_pcd_aut$ = Trim$(SqlData$(SqlConn%, 14))
            e_cmb$ = Trim$(SqlData$(SqlConn%, 15))
            t_pin_aut$ = Trim$(SqlData$(SqlConn%, 17))
            d_ano_fbr$ = Trim$(SqlData$(SqlConn%, 19))
            d_ano_mod$ = Trim$(SqlData$(SqlConn%, 20))
            c_ori_ctc$ = Trim$(SqlData$(SqlConn%, 23))
            c_cfg$ = Trim$(SqlData$(SqlConn%, 24))
            D_Tab_Vda_Cmz = Trim$(SqlData$(SqlConn%, 25))
            
            fu_sel_his_isg_apo2 = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_his_isg_apo2"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_his_isg_apo2 = False

End Function

Function fu_sel_his_isg_apo3() As Integer

    ' seleciona dados do item segurado da apólice
    
    ' retorno de funções
    Dim Ret As Integer
    
    ' array dos dados da apólice
    Dim i   As Integer
    
    fu_sel_his_isg_apo3 = False
    
    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_his_isg_apo_s05109", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_his_isg_apo3"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_osg", c_osg$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@e_osg", e_osg$, SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_osg", u_vrs_osg$, SQLINT2%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_his_isg_apo3"
        Exit Function
    End If
    
    ' executa a stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_his_isg_apo3"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_his_isg_apo3"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            ReDim Preserve dad_apo(0 To i%) As apolice
            
            dad_apo(i%).c_cia_ita = Trim$(SqlData$(SqlConn%, 1))
            dad_apo(i%).c_rmo = Trim$(SqlData$(SqlConn%, 2))
            dad_apo(i%).u_apo_pnc = Trim$(SqlData$(SqlConn%, 3))
            dad_apo(i%).u_apo_dpd = Trim$(SqlData$(SqlConn%, 4))
            dad_apo(i%).d_ini_vig_apo = Format(SqlData$(SqlConn%, 5), "DD/MM/YYYY")
            dad_apo(i%).d_fim_vig_apo = Format(SqlData$(SqlConn%, 6), "DD/MM/YYYY")
            dad_apo(i%).c_pro = Trim$(SqlData$(SqlConn%, 7))
            dad_apo(i%).c_isg = Trim$(SqlData$(SqlConn%, 8))
            dad_apo(i%).n_pro = Trim$(SqlData$(SqlConn%, 9))
            dad_apo(i%).e_osg = e_osg$
            i% = i% + 1
            fu_sel_his_isg_apo3 = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_his_isg_apo3"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Or (Ret% = FAIL%) Then
        fu_sel_his_isg_apo3 = False
    End If

End Function

Function fu_sel_his_isg_apo4() As Integer

' Seleciona dados do item segurado de acordo c/ o aditamento
' informado

   Dim Ret As Integer
   fu_sel_his_isg_apo4 = False

601  On Error GoTo ERRO_3

' inicializa stored procedure
   If SQLRPCInit%(SqlConn%, "dbnprod..pr_his_isg_apo_s02270", 0) = FAIL% Then
       su_erro_st_proc ST_SqlRpcInit%, "fu_sel_his_isg_apo4"
       Exit Function
   End If
   
   ' passa parâmetros
   If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
   If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
   If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
   If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
   If FU_Parametro(SqlConn, "@u_adi", Val(u_adi$), SQLINT4%) = FAIL% Then Exit Function
   
   ' envia comandos
   If SQLRPCSend%(SqlConn%) = FAIL% Then
       su_erro_st_proc ST_SqlRpcSend%, "fu_sel_his_isg_apo4"
       Exit Function
   End If
   
   ' executa stored procedure
   If SqlOk%(SqlConn%) = FAIL% Then
       su_erro_st_proc ST_SqlOk%, "fu_sel_his_isg_apo4"
       Exit Function
   End If
   
   ' verifica resultados
   Ret% = SqlResults(SqlConn%)
   If Ret% = FAIL% Then
       su_erro_st_proc ST_SqlResults%, "fu_sel_his_isg_apo4"
       Exit Function
   End If
   
   ' processa resultados
602    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
603        Ret% = SqlNextRow%(SqlConn%)
604
605        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
606            c_seg_reg$ = Trim$(SqlData$(SqlConn%, 1))
607            t_isg$ = Trim$(SqlData$(SqlConn%, 2))
608            c_reg_utl$ = Trim$(SqlData(SqlConn%, 3))
609            q_moe_vba@ = Val(SqlData(SqlConn%, 4))
610            c_isg$ = Trim$(SqlData(SqlConn%, 5))
611            c_osg$ = Trim$(SqlData(SqlConn%, 6))
612            e_osg$ = Trim$(SqlData(SqlConn%, 7))
613            u_vrs_osg$ = Trim$(SqlData$(SqlConn%, 8))
614            fu_sel_his_isg_apo4 = True

615            Ret% = SqlNextRow%(SqlConn%)
616        Loop

617        Ret% = SqlResults%(SqlConn%)
618    Loop

    If Ret% = FAIL% Then
         su_erro_st_proc ST_SqlResults%, "fu_sel_his_isg_apo4 "
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_his_isg_apo4 = False

619 Exit Function

620 ERRO_3:
621 MsgBox Err & " " & error & " " & Erl
622 Screen.MousePointer = DEFAULT
623 Exit Function

End Function

Function fu_sel_his_isg_aut() As Integer

    ' Seleciona dados da apólice de acordo c/ o aditamento informado
    
    ' retorno de funções
801    Dim Ret As Integer

802    On Error GoTo ERRO_4


803    fu_sel_his_isg_aut = False

    ' inicializa stored procedure
804    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_his_isg_aut_s04225", 0)
805    If Ret% = FAIL% Then
806        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_his_isg_aut"
807        Exit Function
808    End If
    
    ' passa parâmetros
809    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
810    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
811    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
812    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
813    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL% Then Exit Function

814    If FU_Parametro_Ret(SqlConn, "@u_lau", 0, SQLINT4%) = FAIL% Then Exit Function
815    If FU_Parametro_Ret(SqlConn, "@i_zro_km", "", SQLCHAR%) = FAIL% Then Exit Function
816    If FU_Parametro_Ret(SqlConn, "@d_sda_vei", "", SQLDATETIM4%) = FAIL% Then Exit Function
817    If FU_Parametro_Ret(SqlConn, "@c_idt_vtd", 0, SQLINT4%) = FAIL% Then Exit Function
818    If FU_Parametro_Ret(SqlConn, "@e_vtd", 0, SQLINT2%) = FAIL% Then Exit Function
819    If FU_Parametro_Ret(SqlConn, "@n_cls_bon", "", SQLCHAR%) = FAIL% Then Exit Function
820    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT4%) = FAIL% Then Exit Function

    ' envia comandos
821    Ret% = SQLRPCSend%(SqlConn%)
822    If Ret% = FAIL% Then
823        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_his_isg_aut"
824        Exit Function
825    End If

    ' executa stored procedure
826    Ret% = SqlOk%(SqlConn%)
827    If Ret% = FAIL% Then
828        su_erro_st_proc ST_SqlOk%, "fu_sel_his_isg_aut"
829        Exit Function
830    End If

    ' verifica resultados
831    Ret% = SqlResults(SqlConn%)
832    If Ret% = FAIL% Then
833        su_erro_st_proc ST_SqlResults%, "fu_sel_his_isg_aut"
834        Exit Function
835    End If

    ' processa resultados
836    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
837        Ret% = SqlNextRow%(SqlConn%)

838        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
839            Ret% = SqlNextRow%(SqlConn%)
840        Loop

841        Ret% = SqlResults%(SqlConn%)
842    Loop
       
843    If Ret% = FAIL% Then
844        su_erro_st_proc ST_SqlResults%, "fu_sel_his_isg_aut"
845        Exit Function
846    End If

    ' verifica parâmetros de retorno
847    If Val(SqlRetData(SqlConn%, 7)) <> 0 Then
848        u_lau$ = Trim$(SqlRetData$(SqlConn%, 1))
849        i_zro_km$ = Trim$(SqlRetData(SqlConn%, 2))
850        d_sda_vei$ = CVDate(SqlRetData(SqlConn%, 3))
851        c_idt_vtd$ = Trim$(SqlRetData(SqlConn%, 4))
852        e_vtd$ = Trim$(SqlRetData(SqlConn%, 5))
853        fu_sel_his_isg_aut = True
854    End If
    
    ' caso a classe não seja encontrada, não é necessário exibir erro
855    n_cls_bon$ = SqlRetData(SqlConn%, 6)
    
856    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_his_isg_aut = False

857   Exit Function

858 ERRO_4:
859    MsgBox Err & " " & error & " " & Erl
860    Screen.MousePointer = DEFAULT
861    Exit Function

End Function

Function fu_sel_his_tco_apo() As Integer
  
    Dim s_aux     As String
    Dim msg_err   As String
    Dim Ret       As Integer
    
    fu_sel_his_tco_apo = False
    
    ' inicializa stored procedure
    'If SqlRpcInit%(Sqlconn%, "dbnprod..pr_his_tco_apo_s04206", 0) = FAIL% Then
    If SQLRPCInit%(SqlConn%, "dbnprod..pr_his_tco_apo_s06324", 0) = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_his_tco_apo"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", Val(c_cia_ita$), SQLINT2%) = FAIL% Then Exit Function
    s_aux$ = c_cia_ita$ + ", "
    If FU_Parametro(SqlConn, "@c_rmo", Val(c_rmo$), SQLINT2%) = FAIL% Then Exit Function
    s_aux$ = s_aux$ + c_rmo$ + ", "
    If FU_Parametro(SqlConn, "@u_apo_pnc", Val(u_apo_pnc$), SQLINT4%) = FAIL% Then Exit Function
    s_aux$ = s_aux$ + u_apo_pnc$ + ", "
    If FU_Parametro(SqlConn, "@u_apo_dpd", Val(u_apo_dpd$), SQLINT4%) = FAIL% Then Exit Function
    s_aux$ = s_aux$ + u_apo_dpd$ + ", "
    If FU_Parametro(SqlConn, "@u_adi", Val(u_adi$), SQLINT4%) = FAIL% Then Exit Function
    s_aux$ = s_aux$ + u_adi$ + ", "
    If FU_Parametro(SqlConn, "@u_vrs_adi", Val(U_VRS_ADI$), SQLINT4%) = FAIL% Then Exit Function
    s_aux$ = s_aux$ + U_VRS_ADI$
    
    'Elson 02/12/99 - Linha substituida.
    'If Val(u_adi$) And Val(u_vrs_adi$) = 0 Then
    If Val(u_adi$) = 0 And Val(U_VRS_ADI$) = 0 Then
        If FU_Parametro(SqlConn, "@tipo_pesquisa", 1, SQLINT2%) = FAIL% Then Exit Function
    Else
        If FU_Parametro(SqlConn, "@tipo_pesquisa", 2, SQLINT2%) = FAIL% Then Exit Function
    End If
    
    If FU_Parametro_Ret(SqlConn, "@d_ini_vig_apo", "", SQLDATETIM4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@d_fim_vig_apo", "", SQLDATETIM4) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@t_apo", "", SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@u_ocr_l_crs", 0, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@d_can_apo", "", SQLDATETIM4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_pro", 0, SQLINT2) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_pro", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@msg_err", "", SQLVARCHAR%) = FAIL% Then Exit Function
    
    Clipboard.SetText s_aux$
    
    ' envia comando
    If SQLRPCSend%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_his_tco_apo"
        Exit Function
    End If
    
    ' executa stored procedure
    If SqlOk%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_his_tco_apo"
        Exit Function
    End If
    
    'Busca os resultados
    Ret = SqlResults(SqlConn%)
    If Ret = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_his_tco_apo"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop
    
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_his_tco_apo"
        Exit Function
    End If
    
    ' parâmetros de retorno
    
    d_ini_vig_apo$ = Format$(SqlRetData$(SqlConn%, 1), "dd/mm/yyyy")
    d_fim_vig_apo$ = Format$(SqlRetData$(SqlConn%, 2), "dd/mm/yyyy")
    t_apo$ = Trim$(SqlRetData$(SqlConn%, 3))
    u_ocr_l_crs$ = Trim$(SqlRetData$(SqlConn%, 4))
    d_can_apo$ = Format$(SqlRetData$(SqlConn%, 5), "dd/mm/yyyy")
    c_pro$ = SqlRetData$(SqlConn%, 6)
    n_pro$ = Trim$(SqlRetData(SqlConn%, 7))
    msg_err$ = Trim$(SqlRetData(SqlConn%, 8))
    
    fu_sel_his_tco_apo = True
    
    If msg_err$ <> "" Then
        fu_sel_his_tco_apo = False
        MsgBox msg_err$
        Exit Function
    End If
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_his_tco_apo = False

End Function

Function fu_sel_l() As Integer

    ' seleciona endereço para correspondência

    Dim il_conta    As Integer
    Dim Ret         As Integer

    fu_sel_l = False
    
    'Inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "prod30.dbnpesso..pr_l_s01687", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_l"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro_Ret(SqlConn, "@linhas_ret", "0", SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_idt_pes", c_idt_pes$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_ocr_l", u_ocr_l_crs$, SQLINT2%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_l"
        Exit Function
    End If
      
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_l"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_l"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            il_conta = il_conta + 1
            If il_conta = 1 Then
                R1FAB003.lb_n_lgd.Caption = " " & UCase$(Trim$(SqlData$(SqlConn%, 1)))
                R1FAB003.lb_n_cpl.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 3)))
                R1FAB003.lb_u_lgd.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 2)))
                R1FAB003.lb_n_bai.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 4)))
                R1FAB003.lb_c_cep.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 9)))
                R1FAB003.lb_n_loc.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 5)))
                R1FAB003.lb_n_uf.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 13)))
                R1FAB003.lb_s_uf.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 6)))
            End If
            fu_sel_l = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop
    
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_l"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_l = False
  
End Function


Function FU_PR_EMA_APO_S19730(cia$, rmo$, apo$, dpd$, Flex_Ema As MSFlexGrid) As Integer

    Dim c_err         As Integer
    Dim q_lin         As Integer

    'Habilitação da rotina de tratamento de erro.
    On Error GoTo TrataErroS19730

    'Inicialização da função com valor False.
    FU_PR_EMA_APO_S19730 = False

    'Inicialização dos códigos de erro
    'da DBLibrary e do SQL Server.
    Err_Syb& = 0
    Msg_Syb& = 0
    Flex_Ema.Rows = 1

    'Inicialização da stored procedure.
    Ret% = SQLRPCInit%(SqlConn%, "DBNPROD..PR_EMA_APO_S19730", 0)

    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_EMA_APO_S19730.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Parâmetro(s) da stored procedure.
    If FU_Parametro(SqlConn, "@c_cia_ita", cia$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", apo$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", dpd$, SQLINT4%) = FAIL Then Exit Function

    If FU_Parametro_Ret(SqlConn, "@c_err", 0, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@q_lin", 0, SQLINT4%) = FAIL Then Exit Function

    'Envio da lista de parâmetros ao servidor para ser executada.
    Ret% = SQLRPCSend%(SqlConn%)

    If Ret% = FAIL Then
        MsgBox "Não foi possível enviar a lista de parâmetros da stored procedure PR_EMA_APO_S19730 ao servidor.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Verificação da exatidão dos comandos no command buffer.
    Ret% = SqlOk%(SqlConn%)

    If Ret% = FAIL Then
        MsgBox "Não foi possível executar a stored procedure PR_EMA_APO_S19730.", MB_ICONEXCLAMATION
        Exit Function
    End If

    Ret% = SqlResults%(SqlConn%)

    'Processamento dos resultados da stored procedure.
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL

        Ret% = SqlNextRow%(SqlConn%)

        'Recuperação e processamento dos dados em cada linha.
        Do Until Ret% = NOMOREROWS Or Ret% = FAIL
      
            With Flex_Ema
                .Rows = .Rows + 1
                .Row = .Rows - 1
                
                'endereço de e-mail
                .Col = 0
                .Text = SqlData$(SqlConn%, 6)
                .CellAlignment = 1
                
                'Ativo (Sim/Não)
                .Col = 1
                If Trim(SqlData$(SqlConn%, 7)) = "S" Then
                    .Text = "SIM"
                Else
                    .Text = "NÃO"
                End If
                .CellAlignment = 4
                
                'Alterado \ Incluido
                .Col = 2
                .Text = SqlData$(SqlConn%, 9)
                .CellAlignment = 4
                
                'Data de alteração
                .Col = 3
                .Text = Format(SqlData$(SqlConn%, 8), "DD/MM/YYYY")
                .CellAlignment = 4

            End With

            Ret% = SqlNextRow%(SqlConn%)

        Loop

        Ret% = SqlResults%(SqlConn%)

    Loop

    If Ret% = FAIL Then
        MsgBox "Não foi possível processar os resultados da stored procedure PR_EMA_APO_S19730.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Erro da DBLibrary ou do SQL Server.
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Then Exit Function

    'Recuperação do código do erro na variável local.
    c_err% = Val(SqlRetData$(SqlConn%, 1))

    'O parâmetro OUTPUT da stored procedure indica ocorrência de erro.
    If c_err% <> 0 Then
        'Exibição da mensagem de erro ao usuário.
        MsgBox "Erro na stored procedure PR_EMA_APO_S19730: parâmetro @c_err = " & Trim$(Str$(c_err%)) & ".", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Armazenamento do nº de linhas afetadas
    'pelo comando na variável local.
    q_lin% = Val(SqlRetData$(SqlConn%, 2))

    'A função retorna valor True.
    FU_PR_EMA_APO_S19730 = True

    Exit Function

'Rotina de tratamento de erro.
TrataErroS19730:

    MsgBox "Erro na function FU_PR_EMA_APO_S19730: #" & Err & " - " & error$(Err) & ".", MB_ICONEXCLAMATION
    Exit Function

End Function



Function fu_sel_l_dest(c_idt_pes_aux) As Integer

    ' seleciona endereço para correspondência

    Dim il_conta    As Integer
    Dim Ret         As Integer

    fu_sel_l_dest = False
    
    'Inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "prod30.dbnpesso..pr_l_s01687", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_l_dest"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro_Ret(SqlConn, "@linhas_ret", "0", SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_idt_pes", c_idt_pes_aux, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_ocr_l", u_ocr_l_dest$, SQLINT2%) = FAIL% Then Exit Function
    
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_l_dest"
        Exit Function
    End If
      
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_l_dest"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_l_dest"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            il_conta = il_conta + 1
            If il_conta = 1 Then
                R1FAB003.lb_n_lgd_dest.Caption = " " & UCase$(Trim$(SqlData$(SqlConn%, 1)))
                R1FAB003.lb_n_cpl_dest.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 3)))
                R1FAB003.lb_u_lgd_dest.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 2)))
                R1FAB003.lb_n_bai_dest.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 4)))
                R1FAB003.lb_c_cep_dest.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 9)))
                R1FAB003.lb_n_loc_dest.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 5)))
                R1FAB003.lb_n_uf_dest.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 13)))
                R1FAB003.lb_s_uf_dest.Caption = " " & UCase(Trim$(SqlData$(SqlConn%, 6)))
            End If
            fu_sel_l_dest = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop
    
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_l_dest"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_l_dest = False


End Function

Function fu_sel_lin_aut() As Integer

    ' seleciona dados de linha do auto

    Dim Ret As Integer

    fu_sel_lin_aut = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnapoio..pr_lin_aut_s02335", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_lin_aut"
        Exit Function
    End If

    ' passa parâmetros
    If FU_Parametro(SqlConn, "@e_pcd_aut", e_pcd_aut$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_fbr_aut", c_fbr_aut$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_lin_aut", c_lin_aut$, SQLINT2%) = FAIL% Then Exit Function

    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_lin_aut"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_lin_aut"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_lin_aut"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            n_lin_aut$ = Trim$(SqlData$(SqlConn%, 1))
            fu_sel_lin_aut = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_lin_aut"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_lin_aut = False

End Function

Function fu_sel_mod_aut() As Integer

    ' seleciona dados do modelo do auto

    Dim Ret As Integer
    
    fu_sel_mod_aut = False

    ' inicializa store procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnapoio..pr_mod_aut_s02340", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_mod_aut"
        Exit Function
    End If

    ' passa parâmetros
    If FU_Parametro(SqlConn, "@e_pcd_aut", e_pcd_aut$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_fbr_aut", c_fbr_aut$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_lin_aut", c_lin_aut$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_mod_aut", c_mod_aut$, SQLINT2%) = FAIL% Then Exit Function

    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_mod_aut"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_mod_aut"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_mod_aut"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            n_mod_aut$ = Trim$(SqlData$(SqlConn%, 1))
            fu_sel_mod_aut = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_mod_aut"
        Exit Function
    End If
  
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_mod_aut = False

End Function

Function fu_sel_ocr_cla_apo() As Integer
                                                                                            
    ' consulta cláusulas da apólice (Diferenciado)

    ' contador para array de cláusulas da apólice
    Dim i   As Integer
    ' retorno de funções
    Dim Ret As Integer

    fu_sel_ocr_cla_apo = False

    ' inicializa stored procedure
    'ret% = SqlRpcInit%(Sqlconn%, "dbnprod..pr_his_ocr_cla_s06039", 0)
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_his_ocr_cla_s07407", 0)
    
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_ocr_cla_apo"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd, SQLINT4%) = FAIL% Then Exit Function
    'If fu_parametro("@c_isg", c_isg$, SQLINT4%) = fail% Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_ocr_cla_apo"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_ocr_cla_apo"
        Exit Function
    End If

    ' remove linhas do array
    Erase dad_cla_apo
    existe_dad_cla_apo% = False

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_ocr_cla_apo"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            ReDim Preserve dad_cla_apo(0 To i%) As clausulas
            dad_cla_apo(i%).u_adi = Trim$(SqlData$(SqlConn%, 1))
            dad_cla_apo(i%).U_VRS_ADI = Trim$(SqlData$(SqlConn%, 2))
            dad_cla_apo(i%).c_pro = Trim$(SqlData$(SqlConn%, 3))
            dad_cla_apo(i%).c_pla_pro = Trim$(SqlData$(SqlConn%, 4))
            dad_cla_apo(i%).c_gar = Trim$(SqlData$(SqlConn%, 5))
            dad_cla_apo(i%).c_cla = Trim$(SqlData(SqlConn%, 6))
            dad_cla_apo(i%).U_OCR_CLA = Val(SqlData(SqlConn%, 7))
            dad_cla_apo(i%).d_ini_niv_cla = Trim$(Format$(SqlData$(SqlConn%, 8), "dd/mm/yyyy"))
            dad_cla_apo(i%).d_fim_niv_cla = Trim$(Format$(SqlData$(SqlConn%, 9), "dd/mm/yyyy"))
            dad_cla_apo(i%).n_ptc_cla = Trim$(SqlData$(SqlConn%, 10))
            'dad_cla_apo(i%).c_isg = c_isg$ - 29/04/1998
            dad_cla_apo(i%).c_isg = Trim$(SqlData$(SqlConn%, 11))
            dad_cla_apo(i%).d_exc_cla = Trim$(SqlData$(SqlConn%, 12))
            
            existe_dad_cla_apo% = True
            
            i% = i% + 1
            
            fu_sel_ocr_cla_apo = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_ocr_cla_apo"
        Exit Function
    End If
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_ocr_cla_apo = False

End Function

Function fu_sel_osg_ars_plt(i As Integer) As Integer
                                                                                          
  ' seleciona dados do objeto segurado se e_osg = "ARS"

    Dim Ret As Integer
    
    fu_sel_osg_ars_plt = False
    
    ' inicializa stored procedure
    If SQLRPCInit%(SqlConn%, "dbnprod..pr_osg_ars_plt_s05234", 0) = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_osg_ars_plt"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_osg", dad_isg(i%).c_osg, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@e_osg", dad_isg(i%).e_osg, SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_osg", dad_isg(i%).u_vrs_osg, SQLINT2%) = FAIL% Then Exit Function
    
    'envia comando
    If SQLRPCSend%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_osg_ars_plt"
        Exit Function
    End If
    
    ' executa stored procedure
    If SqlOk%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_osg_ars_plt"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_ars_plt"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            dad_isg(i%).n_isg = UCase$(Trim$(SqlData$(SqlConn%, 1)))
            fu_sel_osg_ars_plt = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_ars_plt"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_osg_ars_plt = False

End Function

Function fu_sel_osg_aut1(c_isg_aux$) As Integer

    ' seleciona dados do objeto segurado

    Dim Ret As Integer
    
    fu_sel_osg_aut1 = False
    
    ' inicializa store procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_osg_aut_s02659", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit, "fu_sel_osg_aut1"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function

    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_osg_aut1"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_osg_aut1"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_aut1"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            If (Trim$(c_isg_aux$) <> "" And Val(SqlData$(SqlConn%, 1)) = Val(c_isg_aux$)) Or (c_isg_aux$) = "" Then
                u_chs_aut$ = Trim$(SqlData$(SqlConn%, 5))
                u_plc_aut$ = Trim$(SqlData$(SqlConn%, 6))
                u_mtr_aut$ = Trim$(SqlData$(SqlConn%, 7))
                t_pin_aut$ = Trim$(SqlData$(SqlConn%, 8))
                e_pcd_aut$ = Trim$(SqlData$(SqlConn%, 9))
                c_fbr_aut$ = Trim$(SqlData$(SqlConn%, 10))
                c_lin_aut$ = Trim$(SqlData$(SqlConn%, 11))
                c_mod_aut$ = Trim$(SqlData$(SqlConn%, 12))
                d_ano_fbr$ = Trim$(SqlData$(SqlConn%, 13))
                d_ano_mod$ = Trim$(SqlData$(SqlConn%, 14))
                e_cmb$ = Trim$(SqlData$(SqlConn%, 15))
                t_coo_aut$ = Trim$(SqlData$(SqlConn%, 16))
                
                fu_sel_osg_aut1 = True
            End If

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_aut1"
        Exit Function
    End If
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_osg_aut1 = False

End Function

Function fu_sel_osg_aut2() As Integer

    ' seleciona dados do objeto segurado através do chassi

    Dim Ret As Integer

    ' dados da apólice e auto
    Dim i   As Integer
    
    fu_sel_osg_aut2 = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_osg_aut_s04229", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_osg_aut2"
        Exit Function
    End If
    
     ' passa parâmetros
    If FU_Parametro(SqlConn, "@u_chs_aut", u_chs_aut$, SQLCHAR%) = FAIL% Then Exit Function

    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_osg_aut2"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_osg_aut2"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_aut2"
        Exit Function
    End If

    ' limpa conteúdo do array
    Erase dad_apo

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            ' se a placa for informada, deve ser conferida
            ' com a selecionada na tabela
            If (Trim$(R1FAB001.tb_u_plc_aut.Text) <> "" And Trim$(R1FAB001.tb_u_plc_aut.Text) = Trim$(SqlData$(SqlConn%, 6))) Or (R1FAB001.tb_u_plc_aut.Text = "") Then
                
                ReDim Preserve dad_apo(0 To i%) As apolice
                ReDim Preserve dad_aut(0 To i%) As auto

                dad_aut(i%).u_chs_aut = u_chs_aut$
                dad_apo(i%).c_cia_ita = Trim$(SqlData$(SqlConn%, 1))
                dad_apo(i%).c_rmo = Trim$(SqlData$(SqlConn%, 2))
                dad_apo(i%).u_apo_pnc = Trim$(SqlData$(SqlConn%, 3))
                dad_apo(i%).u_apo_dpd = Trim$(SqlData$(SqlConn%, 4))
                dad_apo(i%).c_isg = Trim$(SqlData$(SqlConn%, 5))
                dad_aut(i%).u_plc_aut = Trim$(SqlData$(SqlConn%, 6))
                dad_aut(i%).c_lin_aut = Trim$(SqlData$(SqlConn%, 7))
                dad_aut(i%).c_mod_aut = Trim$(SqlData$(SqlConn%, 8))
                dad_aut(i%).c_fbr_aut = Trim$(SqlData$(SqlConn%, 9))
                dad_aut(i%).e_pcd_aut = Trim$(SqlData$(SqlConn%, 10))
                dad_apo(i%).e_osg = e_osg$
                dad_apo(i%).c_agr_fam_pro = "1"
                
                i% = i% + 1
                
                fu_sel_osg_aut2 = True
            End If

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_aut2"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_osg_aut2 = False

End Function

Function fu_sel_osg_aut3() As Integer
    
    ' seleciona dados do objeto segurado através do número de placa
    ' dados auto e apólice

    ' contador para array de apólice e auto
    Dim i       As Integer

    Dim Ret     As Integer

    fu_sel_osg_aut3 = False

    ' inicializa store procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_osg_aut_s04230", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_osg_aut3"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@u_plc_aut", u_plc_aut$, SQLCHAR%) = FAIL% Then Exit Function

    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_osg_aut3"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_osg_aut3"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_aut3"
        Exit Function
    End If
    
    ' limpa conteúdo do array
    Erase dad_apo

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            ReDim Preserve dad_aut(0 To i%) As auto
            ReDim Preserve dad_apo(0 To i%) As apolice

            dad_aut(i%).u_plc_aut = u_plc_aut$
            dad_apo(i%).c_cia_ita = Trim$(SqlData$(SqlConn%, 1))
            dad_apo(i%).c_rmo = Trim$(SqlData$(SqlConn%, 2))
            dad_apo(i%).u_apo_pnc = Trim$(SqlData$(SqlConn%, 3))
            dad_apo(i%).u_apo_dpd = Trim$(SqlData$(SqlConn%, 4))
            dad_apo(i%).c_isg = Trim$(SqlData$(SqlConn%, 5))
            dad_aut(i%).c_lin_aut = Trim$(SqlData$(SqlConn%, 6))
            dad_aut(i%).c_mod_aut = Trim$(SqlData$(SqlConn%, 7))
            dad_aut(i%).u_chs_aut = Trim$(SqlData$(SqlConn%, 8))
            dad_aut(i%).c_fbr_aut = Trim$(SqlData$(SqlConn%, 9))
            dad_aut(i%).e_pcd_aut = Trim$(SqlData$(SqlConn%, 10))
            dad_apo(i%).e_osg = e_osg$
            dad_apo(i%).c_agr_fam_pro = "1"
            
            i% = i% + 1

            fu_sel_osg_aut3 = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_aut3"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_osg_aut3 = False

End Function

Function fu_sel_osg_dvs(i As Integer) As Integer
    ' seleciona dados do Objeto Segurado se e_osg = "DVS"
    Dim Ret As Integer
    
    fu_sel_osg_dvs = False
    
    ' inicializa stored procedure
    If SQLRPCInit%(SqlConn%, "dbnprod..pr_osg_dvs_s05986", 0) = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_osg_dvs"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_osg", dad_isg(i%).c_osg, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@e_osg", "DVS", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_osg", dad_isg(i%).u_vrs_osg, SQLINT4) = FAIL% Then Exit Function
    
    ' envia comando
    If SQLRPCSend%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_osg_dvs"
        Exit Function
    End If
    
    ' executa stored procedure
    If SqlOk%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_osg_dvs"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_dvs"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            dad_isg(i%).n_isg = UCase$(Trim$(SqlData$(SqlConn%, 2)))
            fu_sel_osg_dvs = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then su_erro_st_proc ST_SqlResults%, "fu_sel_osg_dvs"

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Or (Ret% = FAIL%) Then fu_sel_osg_dvs = False

End Function

Function fu_sel_osg_imv(POS As Integer) As Integer

    ' Pesquisa nomes de clientes através da fonetização
    ' por índices
    
    ' dados de endereço
    Dim i   As Integer
    Dim Ret As Integer

    fu_sel_osg_imv = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_osg_imv_s05100", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_osg_imv"
        Exit Function
    End If

    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_loc", c_loc%, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_cep", Trim$(c_cep$), SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_lgd", u_lgd$, SQLCHAR%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_osg_imv"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_osg_imv"
        Exit Function
    End If
    
    On Error GoTo Trata_Erro_Leitura3

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_imv"
        Exit Function
    End If

    If POS% <> 0 Then
      i% = UBound(dad_loc) + 1
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            ReDim Preserve dad_loc(0 To i%) As endereco

            ' nome cliente
            R1FAB001.li_Homonimo.AddItem " " & Trim$(n_loc$) & _
                Space(40 - Len(Trim$(n_loc$))) & " " & n_uf$ & " " & _
                Format$(Trim$(SqlData$(SqlConn%, 2)), "00000-000") & " " & _
                Trim$(SqlData$(SqlConn%, 3)) & " " & Trim$(SqlData(SqlConn%, 4))
            
            dad_loc(i%).c_osg = Trim$(SqlData(SqlConn%, 5))
            dad_loc(i%).e_osg = Trim$(SqlData(SqlConn%, 6))
            dad_loc(i%).u_vrs_osg = Trim$(SqlData(SqlConn%, 7))
            dad_loc(i%).n_loc = Trim$(n_loc$)
            dad_loc(i%).c_uf = c_uf$
            dad_loc(i%).n_uf = n_uf$

            i% = i% + 1
            
            fu_sel_osg_imv = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop
    
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_imv"
        Exit Function
    End If
       
    On Error GoTo 0

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_osg_imv = False

    Exit Function

' cancela em caso de erro
Trata_Erro_Leitura3:
    On Error GoTo 0
    Ret% = SqlCancel(SqlConn%)
    fu_sel_osg_imv = False
    Exit Function
    
End Function

Function fu_sel_osg_lrs(i As Integer) As Integer
                                                                                            
    ' seleciona dados do Objeto Segurado se e_osg = "LRS"
    
    Dim Ret As Integer
    
    fu_sel_osg_lrs = False
    
    ' inicializa stored procedure
    If SQLRPCInit%(SqlConn%, "dbnprod..pr_osg_lrs_s05192", 0) = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_osg_lrs"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_osg", dad_isg(i).c_osg, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@e_osg", dad_isg(i).e_osg, SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_osg", dad_isg(i).u_vrs_osg, SQLINT2%) = FAIL% Then Exit Function
    
    ' envia comando
    If SQLRPCSend%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_osg_lrs"
        Exit Function
    End If
    
    ' executa stored procedure
    If SqlOk%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_osg_lrs"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_lrs"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            dad_isg(i).n_isg = UCase$(Trim$(SqlData$(SqlConn%, 1))) & ", " & Trim$(SqlData$(SqlConn%, 2)) & " - " & UCase$(Trim$(SqlData(SqlConn%, 3)))
            fu_sel_osg_lrs = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_lrs"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_osg_lrs = False

End Function

Function fu_sel_osg_mrs(i As Integer) As Integer

    ' seleciona dados do Objeto Segurado se e_osg = "MRS"
    
    Dim Ret As Integer
    
    fu_sel_osg_mrs = False
    
    ' inicializa stored procedure
    If SQLRPCInit%(SqlConn%, "dbnprod..pr_osg_mrs_s05235", 0) = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_osg_mrs"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_osg", dad_isg(i%).c_osg, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@e_osg", "MRS", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_osg", dad_isg(i%).u_vrs_osg, SQLINT2%) = FAIL% Then Exit Function
    
    ' envia comando
    If SQLRPCSend%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_osg_mrs"
        Exit Function
    End If
    
    ' executa stored procedure
    If SqlOk%(SqlConn%) = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_osg_mrs"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_mrs"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            dad_isg(i%).n_isg = UCase$(Trim$(SqlData$(SqlConn%, 1)))
            fu_sel_osg_mrs = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_osg_mrs"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_osg_mrs = False

End Function

Function fu_sel_pes() As Integer

    ' seleciona nome do cliente através de seu código
    Dim Ret As Integer
    
    fu_sel_pes = False
    
    ' inicializa a stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "prod30.dbnpesso..pr_pes_s01159", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_pes"
        Exit Function
    End If
    ' passa parâmetros de retorno
    If FU_Parametro(SqlConn, "@n_linhas", 0, SQLINT4%) = FAIL% Then Exit Function
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_idt_pes", c_idt_pes$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comandos
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_pes"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_pes"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_pes"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            n_pes$ = UCase$(Trim$(SqlData$(SqlConn%, 1)))
            If Trim$(UCase$(SqlData$(SqlConn%, 2))) = "F" Then
                R1FAB001.op3d_e_pes.Value = True
            Else
                R1FAB001.op3d_e_pesj.Value = True
            End If
            fu_sel_pes = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_pes"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_pes = False
    
End Function

Function fu_sel_pes_ref() As Integer

    ' verifica se o código do cliente se encontra na tabela
    ' dbnpesso..tb_ref_pes

    Dim Ret As Integer
    
    fu_sel_pes_ref = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "prod30.dbnpesso..pr_pes_ref_s01802", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_pes_ref"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@idt_pes", c_idt_pes$, SQLINT4%) = FAIL% Then Exit Function

    ' envia comandos
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_pes_ref"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_pes_ref"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_pes_ref"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            fu_sel_pes_ref = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_pes_ref"
        Exit Function
    End If
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_pes_ref = False

End Function

Function FU_PR_CPH_MKT_S10221()

    FU_PR_CPH_MKT_S10221 = False
   
    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_CPH_MKT_S10221", 0)
    
    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_cph_mkt_S10221.", MB_ICONEXCLAMATION
        Exit Function
    End If

    If FU_Parametro(SqlConn, "@C_CPH", c_cph, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@C_OFT_CPH", c_oft_cph, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@U_LOT_OFT", u_lot_oft, SQLINT2%) = FAIL% Then Exit Function
    
    If FU_Parametro_Ret(SqlConn, "@T_AGR", "", SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@N_CPH", "", SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@N_OFT", "", SQLVARCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@N_LOT", "", SQLVARCHAR%) = FAIL% Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_cph_mkt_S10221.", MB_ICONEXCLAMATION
        Exit Function
    End If
       
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_cph_mkt_S10221.", MB_ICONEXCLAMATION
        Exit Function
    End If
    
    'VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO
    If MsgSev_Syb% > 1 Then Exit Function
    
    Ret% = SqlResults%(SqlConn%)

    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL

        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop
    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_cph_mkt_S10221.", MB_ICONEXCLAMATION
        Exit Function
    End If
   
    'WILLIAM - 21/11/02 - Mostrar os Dados da campanha completos
    R1FAB011.lb_t_agr.Caption = SqlRetData$(SqlConn%, 1)
    R1FAB011.lb_t_agr.ToolTipText = SqlRetData$(SqlConn%, 1)
    R1FAB011.LB_CPH.Caption = " [" + c_cph + "] - " + SqlRetData$(SqlConn%, 2)
    R1FAB011.LB_CPH.ToolTipText = " [" + c_cph + "] - " + SqlRetData$(SqlConn%, 2)
    R1FAB011.LB_OFT.Caption = " [" + c_oft_cph + "] - " + SqlRetData$(SqlConn%, 3)
    R1FAB011.LB_OFT.ToolTipText = " [" + c_oft_cph + "] - " + SqlRetData$(SqlConn%, 3)
    R1FAB011.LB_LOT.Caption = " [" + u_lot_oft + "] - " + SqlRetData$(SqlConn%, 4)
    R1FAB011.LB_LOT.ToolTipText = " [" + u_lot_oft + "] - " + SqlRetData$(SqlConn%, 4)
    R1FAB011.lb_agr_rmu.Caption = c_agr_rmu
    
    FU_PR_CPH_MKT_S10221 = True
   

End Function

Function FU_PR_ADI_FUN_S10438() As Integer

    Dim c_err         As Integer
    Dim n_linhas      As Integer
    Dim Figura        As String
    Dim Linha         As String
    Dim Rmu_Var       As String
    
    'Habilitação da rotina de tratamento de erro.
    On Error GoTo TrataErroS10438

    'Inicialização da função com valor False.
    FU_PR_ADI_FUN_S10438 = False

    'Inicialização dos códigos de erro
    'da DBLibrary e do SQL Server.
    Err_Syb& = 0
    Msg_Syb& = 0

    'Inicialização da stored procedure.
    Ret% = SQLRPCInit%(SqlConn%, "DBNSEG..PR_ADI_FUN_S10438", 0)

    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_ADI_FUN_S10438.", MB_ICONEXCLAMATION
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
    Ret% = SQLRPCSend%(SqlConn%)

    If Ret% = FAIL Then
        MsgBox "Não foi possível enviar a lista de parâmetros da stored procedure PR_ADI_FUN_S10438 ao servidor.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Verificação da exatidão dos comandos no command buffer.
    Ret% = SqlOk%(SqlConn%)

    If Ret% = FAIL Then
        MsgBox "Não foi possível executar a stored procedure PR_ADI_FUN_S10438.", MB_ICONEXCLAMATION
        Exit Function
    End If

    Ret% = SqlResults%(SqlConn%)

    'Processamento dos resultados da stored procedure.
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        'Recuperação e processamento dos dados em cada linha.
        Do Until Ret% = NOMOREROWS Or Ret% = FAIL
            Figura = ""
            Select Case Val(SqlData$(SqlConn%, 1))
                Case 1
                    Figura = "Funcionário ItauSeg [1]"
                Case 2
                    Figura = "Supervisor ItauSeg [2]"
                Case 3
                    Figura = "Gerente Banco [3]"
            End Select
            
            Rmu_Var = ""
            Select Case Trim(SqlData$(SqlConn%, 7))
                Case "S"
                    Rmu_Var = " SIM "
                Case "N"
                    Rmu_Var = " NÃO "
            End Select
                                  
            Linha$ = Figura & Chr(9) & Trim$(SqlData$(SqlConn%, 2)) & Chr(9) & Trim$(SqlData$(SqlConn%, 3)) & Chr(9) _
                     & Trim$(SqlData$(SqlConn%, 4)) & IIf(Trim$(SqlData$(SqlConn%, 5)) <> "", "-" & Trim$(SqlData$(SqlConn%, 5)), "") _
                     & IIf(Trim$(SqlData$(SqlConn%, 6)) <> "", "-" & Trim$(SqlData$(SqlConn%, 6)), "") & Chr(9) & Rmu_Var

            R1FAB011.gr_fun_cph.AddItem Linha$
                
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then
        MsgBox "Não foi possível processar os resultados da stored procedure PR_ADI_FUN_S10438.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Todos os resultados da stored procedure foram processados.
    If Ret% = NOMORERESULTS Then
        'Recuperação do código do erro na variável local.
        c_err% = Val(SqlRetData$(SqlConn%, 1))
        n_linhas% = Val(SqlRetData$(SqlConn%, 2))
        'O parâmetro OUTPUT da stored procedure indica ocorrência de erro.
        If c_err% <> 0 Then
            'Exibição da mensagem de erro ao usuário.
            MsgBox "Erro na stored procedure PR_ADI_FUN_S10438: parâmetro @error = " & Trim$(Str$(c_err%)) & ".", MB_ICONEXCLAMATION
            Exit Function
        ElseIf n_linhas% = 0 Then
            'Sai da function
            Exit Function
        End If
    End If

    'Erro da DBLibrary ou do SQL Server.
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Then Exit Function

    'A função retorna valor True.
    FU_PR_ADI_FUN_S10438 = True

    Exit Function

'Rotina de tratamento de erro.
TrataErroS10438:

    MsgBox "Erro na function FU_PR_ADI_FUN_S10438: #" & Err & " - " & error$(Err) & ".", MB_ICONEXCLAMATION
    Exit Function

End Function

Function fu_sel_pes_ref_s07838() As Integer

    Dim Ret%
    
    fu_sel_pes_ref_s07838 = False

    Ret% = SQLRPCInit%(SqlConn%, "DBNPROC..pp_pes_ref_s07838", 0)
    If Ret% = FAIL Then
       Screen.MousePointer = DEFAULT
       MsgBox "Não foi possível iniciar a stored procedure.", 16, "R1PKT301"
       Screen.MousePointer = HOURGLASS
       Exit Function
    End If
    
    If FU_Parametro(SqlConn, "@c_idt_pes_ref", c_idt_pes$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT4) = FAIL Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
       Screen.MousePointer = DEFAULT
       MsgBox "Não foi possível enviar comando.", 16, "R1PKT301"
       Screen.MousePointer = HOURGLASS
       Exit Function
    End If
    
    Ret% = SqlOk(SqlConn%)
    If Ret% = FAIL Then
        Screen.MousePointer = DEFAULT
        MsgBox "Não foi possível executar a Stored Procedure.", 16, "R1PKT301"
        Screen.MousePointer = HOURGLASS
        Exit Function
    End If

    Conta_pes% = 0

    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            ReDim Preserve Reg_pes(Conta_pes%)
            Reg_pes(Conta_pes%).c_idt_pes_ref = SqlData(SqlConn, 1)
                
            Conta_pes% = Conta_pes% + 1

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then
        MsgBox "Não foi possível colher resultados - pp_pes_ref_s07838.", 48
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function
     
    fu_sel_pes_ref_s07838 = True
'ZEZE    Exit Function

fu_sel_pes_ref_s07838: 'ZEZE dead code pelo exit function acima

    Screen.MousePointer = DEFAULT
    MsgBox "Não foi possível efetuar a passagem de parâmetros.", 16, "R1PAB001"
    Screen.MousePointer = HOURGLASS

End Function

Function fu_sel_prp() As Integer

    ' seleciona o status da proposta

    Dim Ret As Integer

    fu_sel_prp = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprop..pr_prp_s04163", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_prp"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@u_prp", u_prp$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comandos
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_prp"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_prp"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_prp"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            e_psc_prp$ = SqlData$(SqlConn%, 1)
            fu_sel_prp = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_prp"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_prp = False

End Function

Function fu_sel_spr_fam_pro() As Integer

    ' seleciona texto da família/produto
    Dim Ret As Integer

    fu_sel_spr_fam_pro = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnapoio..pr_spr_fam_pro_s02842", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_spr_fam_pro"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@e_fam_pro", e_fam_pro$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@t_fam_pro", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@u_lin", "0", SQLINT2%) = FAIL% Then Exit Function
    
    ' envia comandos
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_spr_fam_pro"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_spr_fam_pro"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_spr_fam_pro"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_spr_fam_pro"
        Exit Function
    End If

    If Val(SqlRetData(SqlConn%, 2)) <> 0 Then
        t_fam_pro$ = Trim$(SqlRetData(SqlConn%, 1))
        fu_sel_spr_fam_pro = True
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_spr_fam_pro = False

End Function

Function fu_sel_txt_apo() As Integer
    
    ' seleciona descrição das cláusulas da apólice (Diferenciado)
    ' i      -> posição no array de cláusulas
    ' status -> indica se texto é de cláusulas ou se somente texto da apólice

    ' retorno de funções
    Dim Ret As Integer

    ' contador para array de textos
    Dim j   As Integer

    fu_sel_txt_apo = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_txt_apo_s05713", 0)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_txt_apo"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL Then Exit Function

    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_txt_apo"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_txt_apo"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_txt_apo"
        Exit Function
    End If

    j% = 0  'v56 Emilio 03/07/2006
    ReDim dad_t_lin_txt(0 To 0) 'v56 Emilio 03/07/2006
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            ReDim Preserve dad_t_lin_txt(0 To j%) As texto_aditamento
            dad_t_lin_txt(j%).u_adi = Format$(Trim$(SqlData(SqlConn%, 1)), "000")
            dad_t_lin_txt(j%).U_VRS_ADI = Trim$(SqlData(SqlConn%, 2))
            dad_t_lin_txt(j%).c_isg = Trim$(SqlData(SqlConn%, 3))
            dad_t_lin_txt(j%).c_pro = Trim$(SqlData(SqlConn%, 4))
            dad_t_lin_txt(j%).c_pla_pro = Trim$(SqlData(SqlConn%, 5))
            dad_t_lin_txt(j%).c_gar = Trim$(SqlData(SqlConn%, 6))
            dad_t_lin_txt(j%).c_cla = Trim$(SqlData(SqlConn%, 7))
            dad_t_lin_txt(j%).U_OCR_CLA = Val(SqlData(SqlConn%, 8))
            dad_t_lin_txt(j%).e_txt_apo = Val(SqlData(SqlConn%, 9))
            dad_t_lin_txt(j%).u_ocr_lin_txt = Val(SqlData(SqlConn%, 10))
            'STJ
            dad_t_lin_txt(j%).t_lin_txt = Trim$(SqlData(SqlConn%, 11))
            '***

            j% = j% + 1
            
            existe_dad_t_lin_txt% = True

            fu_sel_txt_apo = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop
    
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_txt_apo"
        Exit Function
    End If
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_txt_apo = False

End Function

Function fu_sel_txt_apo2(U_OCR_CLA%, e_txt_apo%) As Integer

    ' seleciona descrição das cláusulas da apólice (Diferenciado)
    ' i      -> posição no array de cláusulas
    ' status -> indica se texto é de cláusulas ou se somente texto da apólice

    ' retorno de funções
    Dim Ret As Integer

    ' contador para array de textos
    Dim j   As Integer

    fu_sel_txt_apo2 = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..pr_txt_apo_s07481", 0)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_txt_apo2"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL Then Exit Function

    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_isg", c_isg$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_ocr_cla", U_OCR_CLA%, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@e_txt_apo", e_txt_apo%, SQLINT2%) = FAIL Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_txt_apo2"
        Exit Function
    End If
    
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_txt_apo2"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_txt_apo2"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            If e_txt_apo% = 3 Then
               R1FAB004.tb_obj.Text = R1FAB004.tb_obj.Text & Trim$(SqlData(SqlConn%, 1))
            ElseIf e_txt_apo% = 7 Then
               R1FAB004.tb_cla.Text = R1FAB004.tb_cla.Text & Trim$(SqlData(SqlConn%, 1))
            End If

            fu_sel_txt_apo2 = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_txt_apo2"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_txt_apo2 = False

End Function

Function fu_sel_uf() As Integer

    ' seleciona Unidade Federal de acordo c/ seu código

    ' retorno das funções
    Dim Ret As Integer

    fu_sel_uf = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnproc..pp_uf_s02305", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_uf"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "0", SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_uf", c_uf$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comandos
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_uf"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_uf"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_uf"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            n_uf$ = SqlData$(SqlConn%, 1)
            fu_sel_uf = True

            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_uf"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_uf = False

End Function

Function fu_seleciona_cor() As Integer
    
    ' seleciona dados do corretor

    ' retorno de funções
    Dim Ret As Integer
    
    fu_seleciona_cor = False
    
    ' inicializa stored procedure
    Ret% = SQLRPCInit(SqlConn%, "dbnprod..pr_ctl_emi_prp_s04311", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_seleciona_cor"
        Exit Function
    End If
      
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_seleciona_cor"
        Exit Function
    End If
  
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_seleciona_cor"
        Exit Function
    End If
  
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_seleciona_cor"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            e_cvd_prp$ = SqlData(SqlConn%, 1)
            u_rgt_ssp_prp$ = SqlData(SqlConn%, 2)
            u_dco_rgt_ssp_prp$ = SqlData(SqlConn%, 3)
            c_loc_pgt_cvd_prp$ = SqlData(SqlConn%, 4)
            fu_seleciona_cor = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_seleciona_cor"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_seleciona_cor = False
    
End Function





Function fu_sel_Apo_ita(U_Apo_UBB As String) As Integer
 
    ' retorno de funções
    Dim Ret As Integer
    Dim Tc_cia_ita As String
    Dim Tc_rmo As String
    Dim Tu_apo_pnc As String
    Dim Tc_pro As String
    Dim TstatusTombamento As String
   
    fu_sel_Apo_ita = False
    
    ' inicializa stored procedure
    Ret% = SQLRPCInit(SqlConn%, "DBNMIGVD..PR_DEA_APO_UBB_ITA_S19159", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_Apo_ita"
        Exit Function
    End If
      
    ' passa parâmetros
    
    If FU_Parametro(SqlConn, "@u_apo_ubb", U_Apo_UBB, SQLCHAR) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_cia_ita", 0, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", 0, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", 0, SQLINT4%) = FAIL% Then Exit Function
    
    If FU_Parametro(SqlConn, "@c_pro", 0, SQLINT4) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@statusTombamento", TstatusTombamento, SQLCHAR) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@error", 0, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@n_linhas", 0, SQLINT4%) = FAIL% Then Exit Function

 ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_Apo_ita"
        Exit Function
    End If

    ' executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_Apo_ita"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_seleciona_motivo"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
              
            Tc_cia_ita = SqlRetData$(SqlConn%, 1)
            Tc_rmo = SqlRetData$(SqlConn%, 2)
            Tu_apo_pnc = SqlRetData$(SqlConn%, 3)
            Tc_pro = SqlRetData$(SqlConn%, 4)
            TstatusTombamento = SqlRetData$(SqlConn%, 5)
        
            fu_sel_Apo_ita = True
          
      
        Ret% = SqlResults%(SqlConn%)
    Loop
 
        
    c_cia_ita$ = Tc_cia_ita
    c_rmo$ = Tc_rmo
    u_apo_pnc$ = Tu_apo_pnc
    c_pro$ = Tc_pro
    u_apo_dpd$ = 0
        
   fu_sel_Apo_ita = Tu_apo_pnc > 0
  
   Ret% = SqlResults%(SqlConn%)
  

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_Apo_ita"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_Apo_ita = False
    
End Function
Function fu_seleciona_motivo() As Integer
    
    ' seleciona o motivo de impedimento do aditamento

    ' retorno de funções
    Dim Ret As Integer
    
    fu_seleciona_motivo = False
    
    ' inicializa stored procedure
    Ret% = SQLRPCInit(SqlConn%, "dbnprod..pr_apo_s03368", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_seleciona_motivo"
        Exit Function
    End If
      
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function

    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_seleciona_motivo"
        Exit Function
    End If
  
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_seleciona_motivo"
        Exit Function
    End If
  
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_seleciona_motivo"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            c_mot_ipd_adi$ = Format$(SqlData$(SqlConn%, 1))
            fu_seleciona_motivo = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_seleciona_motivo"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_seleciona_motivo = False

End Function

Function fu_tb_apo() As Integer

    ' seleciona dbnprod..tb_apo

    ' retorno de funções
    Dim Ret As Integer
    
    fu_tb_apo = False
    
    ' inicializa stored procedure
    Ret% = SQLRPCInit(SqlConn%, "dbnprod..pr_apo_s00811", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_tb_apo"
        Exit Function
    End If
      
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL% Then Exit Function

    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_tb_apo"
        Exit Function
    End If
  
    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_tb_apo"
        Exit Function
    End If
  
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_tb_apo"
        Exit Function
    End If

    e_mig$ = ""
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            e_mig$ = SqlData$(SqlConn%, 7)
            
            'Alberto - 22/06/2001
            e_sgm_neg$ = SqlData$(SqlConn%, 8)
            
            fu_tb_apo = True
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_tb_apo"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_tb_apo = False

End Function

Function fu_verifica_isg() As Integer
   'FOI TRAZIDA DO MODULO R1MAB002 - MARIO
      
   ' pesquisa item segurado para apólices Diferenciado
   
   'contador para loop
   Dim i As Integer
   
   fu_verifica_isg = True

   If Not fu_sel_his_isg_apo1() Then
      Screen.MousePointer = DEFAULT
      MsgBox "Nenhum Item Segurado foi encontrado!", , txt_msg$
      fu_verifica_isg = False
      Exit Function
   End If
   
   ' seleciona dados do endereço (Objeto Segurado)

   For i% = 0 To UBound(dad_isg)
      Select Case dad_isg(i%).e_osg
      Case "LRS"
         If Not fu_sel_osg_lrs(i%) Then
            Screen.MousePointer = DEFAULT
            MsgBox "Item Segurado não encontrado.", 16
            SU_Saida
            Exit Function
         End If
   
      Case "ARS", "PLT"
         If Not fu_sel_osg_ars_plt(i%) Then
            Screen.MousePointer = DEFAULT
            MsgBox "Item Segurado não encontrado.", 16
            SU_Saida
            Exit Function
         End If
   
      Case "MRS"
         If Not fu_sel_osg_mrs(i%) Then
            Screen.MousePointer = DEFAULT
            MsgBox "Item Segurado não encontrado.", 16
            SU_Saida
            Exit Function
         End If
      
      Case "DVS"
         If Not fu_sel_osg_dvs(i%) Then
            Screen.MousePointer = DEFAULT
            MsgBox "Item Segurado não encontrado.", 16
            SU_Saida
            Exit Function
         End If
   
      End Select
   Next i%
   
   R1FAB001.li_isg.Clear
   If Not fu_sel_ocr_cla_apo() Then
   End If

   su_insere_lista_isg R1FAB001.li_isg

   c_seg_reg$ = Trim$(dad_isg(0).c_seg_reg)
   t_isg$ = Trim$(dad_isg(0).t_isg)
   c_reg_utl$ = Trim$(dad_isg(0).c_reg_utl)
   q_moe_vba@ = dad_isg(0).q_moe_vba
   c_isg$ = Trim$(dad_isg(0).c_isg)
   c_osg$ = Trim$(dad_isg(0).c_osg)
   e_osg$ = Trim$(dad_isg(0).e_osg)
   u_vrs_osg$ = Trim$(dad_isg(0).u_vrs_osg)

   Screen.MousePointer = DEFAULT

End Function

Sub SU_Dados_Proposta_Excluida(idx_prp_exc As Integer)

    Dim Aux$
    
    'Carrega na tela os dados da proposta excluída desejada
    
    R1FAB008.txt_u_prp.Text = Trim(VT_PRP_EXC(idx_prp_exc%).u_prp_atu$)
    R1FAB008.txt_u_prp_org.Text = Trim(VT_PRP_EXC(idx_prp_exc%).u_prp_orn$)
    R1FAB008.txt_c_pro.Text = Trim(VT_PRP_EXC(idx_prp_exc%).c_pro$)
    R1FAB008.txt_n_cli.Text = Trim(VT_PRP_EXC(idx_prp_exc%).n_cli$)
    R1FAB008.txt_u_fcp.Text = IIf(Len(VT_PRP_EXC(idx_prp_exc%).u_fcp$) = 5, "", VT_PRP_EXC(idx_prp_exc%).u_fcp$)
    R1FAB008.txt_c_bco.Text = VT_PRP_EXC(idx_prp_exc%).c_bco$
    R1FAB008.txt_u_age.Text = VT_PRP_EXC(idx_prp_exc%).u_age$
    R1FAB008.txt_u_cc.Text = VT_PRP_EXC(idx_prp_exc%).u_cc$
    R1FAB008.txt_u_cc_dcu.Text = VT_PRP_EXC(idx_prp_exc%).u_cc_dcu$
    R1FAB008.txt_d_prt_cga.Text = FU_Formata_Data(VT_PRP_EXC(idx_prp_exc%).d_prt_cga)
    R1FAB008.txt_d_prp.Text = FU_Formata_Data(VT_PRP_EXC(idx_prp_exc%).d_prp$)
    R1FAB008.txt_d_rct_prp.Text = FU_Formata_Data(VT_PRP_EXC(idx_prp_exc%).d_rct_prp$)
    
    'R1FAB008.txt_d_exc_prp.Text = FU_Formata_Data(VT_PRP_EXC(idx_prp_exc%).D_EXC_PRP$)
    'R1FAB008.CB_D_EXC_PRP.AddItem FU_Formata_Data(VT_PRP_EXC(idx_prp_exc%).D_EXC_PRP$)
    R1FAB008.txt_e_cvd.Text = VT_PRP_EXC(idx_prp_exc%).e_cvd$
    R1FAB008.txt_u_rgt_ssp.Text = VT_PRP_EXC(idx_prp_exc%).u_rgt_ssp$
    R1FAB008.txt_u_dco_rgt_ssp.Text = VT_PRP_EXC(idx_prp_exc%).u_dco_rgt_ssp$
    R1FAB008.txt_c_loc_pgt_cvd.Text = VT_PRP_EXC(idx_prp_exc%).c_loc_pgt_cvd$
    R1FAB008.txt_u_chs_aut.Text = VT_PRP_EXC(idx_prp_exc%).u_chs_aut$
    R1FAB008.txt_u_plc_aut.Text = VT_PRP_EXC(idx_prp_exc%).u_plc_aut$
    R1FAB008.txt_n_usr.Text = Trim(VT_PRP_EXC(idx_prp_exc%).N_USR$)
    
    R1FAB008.txt_t_msg.Text = VT_PRP_EXC(idx_prp_exc%).c_msg$

    R1FAB008.Txt_N_LGD_RIS.Text = VT_PRP_EXC(idx_prp_exc%).n_lgd_ris$
    R1FAB008.Txt_U_LGD_RIS.Text = VT_PRP_EXC(idx_prp_exc%).u_lgd_ris$
    R1FAB008.Txt_N_CPL_RIS.Text = VT_PRP_EXC(idx_prp_exc%).n_cpl_ris$
    R1FAB008.Txt_N_BAI_RIS.Text = VT_PRP_EXC(idx_prp_exc%).n_bai_ris$
    R1FAB008.ME_C_CEP_RIS.Text = VT_PRP_EXC(idx_prp_exc%).c_cep_ris$
    R1FAB008.Txt_N_CDD_RIS.Text = VT_PRP_EXC(idx_prp_exc%).n_cdd_ris$
    R1FAB008.Txt_S_UF_RIS.Text = VT_PRP_EXC(idx_prp_exc%).s_uf_ris$
    R1FAB008.msk_d_nas.Text = FU_Formata_Data(VT_PRP_EXC(idx_prp_exc%).d_nas$)
    R1FAB008.txt_d_ini_vig.Text = FU_Formata_Data(VT_PRP_EXC(idx_prp_exc%).d_ini_vig$)
    R1FAB008.txt_n_abv_pla.Text = VT_PRP_EXC(idx_prp_exc%).n_abv_pla$
    R1FAB008.txt_c_rmo.Text = VT_PRP_EXC(idx_prp_exc%).c_rmo$
    
    'Katsumi - 04/12/2002 - inicio
    SU_PR_WAP_EXC_S11946
    
    'Armazenar a data da exclusão, número da proposta e data da carga nestas variáveis
    'para selecionar os itens e os dados da cobrança
    'u_prp = Trim(VT_PRP_EXC(idx_prp_exc%).u_prp$)
    d_prt_cga = Trim(VT_PRP_EXC(idx_prp_exc%).d_prt_cga$)
    c_pro = Trim(VT_PRP_EXC(idx_prp_exc%).c_pro$)
    
    'Katsumi - 04/12/2002 - fim
    
End Sub

Sub SU_Item_Segurado()
                    
   If fu_verifica_isg() Then
      If UBound(dad_isg) >= 0 Then
         If Not fu_pesquisa_demais_dados() Then
            Screen.MousePointer = DEFAULT
            'su_habilita_botao Formulario.bu3d_ok, True
            R1FAB001.li_aditamentos.Clear
            Exit Sub
         End If
      End If
      su_verif_apo_escr
   End If
   
End Sub

Sub SU_MENSAGEM(Mensagem As String, ICONE As Integer)

    '+-------------------------------------------------+
    '|     Envia todas as mensagens para o sistema      |
    '+-------------------------------------------------+

    Dim MousePointer    As Integer

    MousePointer% = Screen.MousePointer

    Screen.MousePointer = DEFAULT
    
    MsgBox Mensagem$, ICONE%, "Mensagem"

    Screen.MousePointer = MousePointer%
    
End Sub


Sub su_verif_apo_escr()
   
   'FOI TRAZIDA DO MODULO R1MAB002 - MARIO
   Dim sArqExec$
   Dim iExecOk%
   ' Verifica se a pesquisa ira mostrar diretamente a tela
   ' de Apólice Escritural ou não.
   ' Na 1a. tela, se o checkbon Apól. Escritural estiver
   ' selecionado, o projeto Apólice Escritural será
   ' chamado (R1PAB501)
   
   ' verifica se realiza acesso direto à Apólice Escritural
   If R1FAB001.ch3d_apo_escr.Value Then
      ' seleciona dados do corretor, motivo de
      ' impedimento do aditamento
      If Not fu_seleciona_corr_mot_ipd() Then
         Screen.MousePointer = DEFAULT
         Exit Sub
      End If
      
      ' chamada Apólice Escritural
      If Not fu_acessa_apo_escr(R1FAB001) Then
         Screen.MousePointer = DEFAULT
         Exit Sub
      End If
   
      R1FAB001.Show
      
      su_inicializa_campos False
      
      volta% = True
      
      R1FAB001.Show
      If Not R1FAB001.fr3d_Apolices.Enabled Then
      End If
   Else
      'If Val(c_agr_fam_pro$) = 2 Then     'c_rmo = "87"  Saude
      '
      '   sArqExec$ = "R1PAA001.EXE"
      '
      '   clipboard.Clear
      '   clipboard.SetText "R1FAA001," & "R/APO:" & Trim$(c_cia_ita$) & "," & Trim$(c_rmo$) & "," & Trim$(u_apo_pnc$) & "," & Trim$(u_apo_dpd$) & ","
      '
      '   'fecha conexão para a chamada de outro projeto
      '   su_fecha_conexao
      '
      '   R1FAB001.Hide
      '
      '   ' chamada de outro projeto
      '   iExecOk% = fu_monitora_exec(R1FAB001, sArqExec$ & " R/APO:" & Trim$(c_cia_ita$) & "," & Trim$(c_rmo$) & "," & Trim$(u_apo_pnc$) & "," & Trim$(u_apo_dpd$) & ",")
      '   If Not iExecOk% Then
      '      MsgBox "Opção ainda não disponível ('" & sArqExec$ & "')."
      '   End If
      '
      '   ' reestabelece conexão após a execução de outro projeto
      '   sqlconn% = fu_conecta_servidor(serv_mascorp_id)
      '
      '   R1FAB001.Show
      '
      'Else
         R1FAB002.Show
         R1FAB001.Hide

      'End If
   End If
   
   Flag% = True
    
End Sub
Public Function FU_PR_CTL_EMI_SAV_S10096()

    ' Autor    : Emilio
    ' Analista : Valdemir
    ' Data     : 17/01/2001
    ' Objetivo : Seleciona o nº SAV
    
    Dim Ret As Integer
       
    On Error GoTo S10096
    
    FU_PR_CTL_EMI_SAV_S10096 = False
    
    ' Inicializa variável
    u_sav$ = ""


    ' Inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "DBNPROD..PR_CTL_EMI_SAV_S10096", 0)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcInit%, "FU_PR_CTL_EMI_SAV_S10096"
        Exit Function
    End If

    ' Passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_adi", U_VRS_ADI$, SQLINT4%) = FAIL Then Exit Function
    
    ' Envia comandos
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcSend%, "FU_PR_CTL_EMI_SAV_S1009"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlOk%, "FU_PR_CTL_EMI_SAV_S1009"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "FU_PR_CTL_EMI_SAV_S1009"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            u_sav$ = Trim$(SqlData(SqlConn%, 1))
            
            If IsNumeric(u_sav$) Then
                R1FAB002.lb_sav.Caption = "Nº Nius"
            Else
                R1FAB002.lb_sav.Caption = "Nº SAV"
            End If
            
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults(SqlConn%)
    Loop
    
          
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "FU_PR_CTL_EMI_SAV_S1009"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function
    
    FU_PR_CTL_EMI_SAV_S10096 = True
    
    
    Exit Function

    
    
S10096:
    MsgBox "Erro na FU_PR_CTL_EMI_SAV_S1009", vbCritical
    Exit Function
    
End Function
' cris - 15/01/2002
Function FU_PR_SAP_SIT_MCF_S10234() As Integer
    
    ' Seleciona da tabela de apoio os motivos das situações do microfilme de propostas
    Dim CTD As Integer
    
    FU_PR_SAP_SIT_MCF_S10234 = False
   
    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_SAP_SIT_MCF_S10234", 0)
    
    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_SAP_SIT_MCF_S10234.", MB_ICONEXCLAMATION
        Exit Function
    End If
    
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_SAP_SIT_MCF_S10234.", MB_ICONEXCLAMATION
        Exit Function
    End If
       
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_SAP_SIT_MCF_S10234.", MB_ICONEXCLAMATION
        Exit Function
    End If
    
    'VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO
    If MsgSev_Syb% > 1 Then Exit Function
    
    Ret% = SqlResults%(SqlConn%)
    
    CTD% = 0
    ReDim dad_sit_mcf(CTD%)

    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL

        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            CTD% = CTD% + 1
            ReDim Preserve dad_sit_mcf(CTD%) As type_dados_sit_mcf
            dad_sit_mcf(CTD%).c_mot_sit_mcf = Trim$(SqlData(SqlConn%, 1))
            dad_sit_mcf(CTD%).t_mot_sit_mcf = IIf(Val(dad_sit_mcf(CTD%).c_mot_sit_mcf) <> 0, Trim$(SqlData(SqlConn%, 2)), "")
            
            Ret% = SqlNextRow%(SqlConn%)
        Loop

        Ret% = SqlResults%(SqlConn%)
    Loop
    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_SAP_SIT_MCF_S10234.", MB_ICONEXCLAMATION
        Exit Function
    End If
   
    FU_PR_SAP_SIT_MCF_S10234 = True

End Function

Function FU_WRA_PRP_U02794(C_IDT_FUN_RSV As String, N_FUN_RSV As String, T_CGO_FUN As String, I_CLI_VIP As String, E_RLC_PES_PES As String, C_RLC_PES_PES As String, U_CPF As String, U_CPF_DCO As String)

'+-------------------------------------------------------------------------+
'| OBJETIVO...: ALTERA ANOTAÇÕES DA PROPOSTA                                |
'| ACESSADO EM: R1FAB012                                                    |
'+------------------------------------------------------------------------+
    FU_WRA_PRP_U02794 = False
    
    Ret% = SQLRPCInit%(SqlConn%, "DBNWORK..PR_WRA_PRP_U02794", 0)

    If FU_Parametro(SqlConn, "@PRM_U02794_u_prp", TB_WRA_PRP.u_prp$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_d_hra_grc_lot", TB_WRA_PRP.d_hra_grc_lot$, SQLDATETIME%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_u_rgt_ssp_trm", TB_WRA_PRP.u_rgt_ssp_trm$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_u_lot_prt_ctr", TB_WRA_PRP.u_lot_prt_ctr$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_u_sub_ctr", TB_WRA_PRP.u_sub_ctr$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_n_usr", Usuario$, SQLCHAR%) = FAIL Then Exit Function
    
    If FU_Parametro(SqlConn, "@PRM_U02794_c_idt_fun_rsv", C_IDT_FUN_RSV$, SQLCHAR%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_n_fun_rsv", N_FUN_RSV$, SQLCHAR%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_t_cgo_fun", T_CGO_FUN$, SQLCHAR%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_i_cli_vip", I_CLI_VIP$, SQLCHAR%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_e_rlc_pes_pes", E_RLC_PES_PES$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_c_rlc_pes_pes", C_RLC_PES_PES$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_u_cpf", U_CPF$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@PRM_U02794_u_cpf_dco", U_CPF_DCO$, SQLINT2%) = FAIL Then Exit Function
    
    If FU_Parametro_Ret(SqlConn, "@PRM_U02794_u_linhas", 0, SQLINT4%) = FAIL Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)
    Ret% = SqlOk%(SqlConn%)

'+-------------------------------------------------------------------------+
'|        VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO          |
'+-------------------------------------------------------------------------+
    If MsgSev_Syb% > 1 Then Exit Function

    FU_WRA_PRP_U02794 = True

End Function

Function FU_PR_SPE_E_RLC_S10080(C_RLC_PES_PES As String)

'+-------------------------------------------------------------------------+
'| OBJETIVO...: CARREGA TIPOS DE SEGMENTAÇÃO DISPONÍVEIS                    |
'| ACESSADO EM: R1FRP102                                                    |
'+-------------------------------------------------------------------------+
    FU_PR_SPE_E_RLC_S10080 = False
    
    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_SPE_E_RLC_S10080", 0)

    If FU_Parametro(SqlConn, "@c_rlc_pes_pes", C_RLC_PES_PES$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@linhas_ret", 0, SQLINT2%) = FAIL Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)
    Ret% = SqlOk%(SqlConn%)

'+-------------------------------------------------------------------------+
'|        VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO          |
'+-------------------------------------------------------------------------+
    If MsgSev_Syb% > 1 Then Exit Function

    FU_PR_SPE_E_RLC_S10080 = True

End Function

Function FU_PR_AGR_PRO_S10840(Optional I_E_AGR As String)

'+------------------------------------------------------------------------+
'| OBJETIVO...: CARREGA OS DADOS DO FUNCIONÁRIO                         |
'| ACESSADO EM: R1FAB012                                                    |
'+------------------------------------------------------------------------+
    FU_PR_AGR_PRO_S10840 = False
    
    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_AGR_PRO_S10840", 0)

    If FU_Parametro(SqlConn, "@C_CIA_ITA", c_cia_ita$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@C_RMO", c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@U_APO_PNC", u_apo_pnc$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@U_APO_DPD", u_apo_dpd$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@U_ADI", u_adi$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@C_PRO", c_pro$, SQLINT4%) = FAIL Then Exit Function
    
    'Adelamg 14/05/2010
    If FU_Parametro(SqlConn, "@I_E_AGR", I_E_AGR, SQLCHAR%) = FAIL Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)
    Ret% = SqlOk%(SqlConn%)

'+-------------------------------------------------------------------------+
'|        VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO          |
'+-------------------------------------------------------------------------+
    If MsgSev_Syb% > 1 Then Exit Function

    FU_PR_AGR_PRO_S10840 = True

End Function

Function FU_WRA_PRP_S09816()
'+------------------------------------------------------------------------+
'| OBJETIVO...: CARREGA DADOS DA(S) PROPOSTA(S) DESEJADA ATRAVÉS DO NÚMERO  |
'|              DA PROPOSTA INFORMADO PELO SISTEMA                          |
'| ACESSADO EM: r1fab002                                                    |
'+-------------------------------------------------------------------------+
    FU_WRA_PRP_S09816 = False
                     
    Ret% = SQLRPCInit%(SqlConn%, "DBNWORK..PR_WRA_PRP_S09816", 0)

    If FU_Parametro(SqlConn, "@u_prp", TB_WRA_PRP.u_prp$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@D_PRT_CGA", TB_WRA_PRP.d_prt_cga$, SQLDATETIME%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_idt_fig", "1", SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@u_linhas", 0, SQLINT4%) = FAIL Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)
    Ret% = SqlOk%(SqlConn%)

'+-------------------------------------------------------------------------+
'|        VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO          |
'+-------------------------------------------------------------------------+
    If MsgSev_Syb% > 1 Then Exit Function
    
    FU_WRA_PRP_S09816 = True

End Function

'   Descrição:  Seleciona para a codigo de proposta e data, os erros
'               relacionados a proposta

Sub SU_PR_WAP_EXC_S11946()
        
    On Error GoTo TrataErro
    
    Dim intIndex As Integer
    
    Screen.MousePointer = vbHourglass
        
    ReDim VT_MSG_ERRO(0)
    R1FAB008.CB_D_EXC_PRP.Clear
    intIndex = 0
       
    'Inicialização dos códigos de erro Sybase
    Err_Syb& = 0
    Msg_Syb& = 0

    'Inicialização da stored procedure.
    Ret% = SQLRPCInit%(SqlConn%, "DBNWORK..PR_WAP_EXC_S11946", 0)
    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure DBNWORK..PR_WAP_EXC_S11946.", MB_ICONEXCLAMATION
        GoTo TrataErro
    End If

    'If FU_Parametro("@U_PRP", VT_PRP_EXC(axindex%).u_prp, SQLINT4%) = FAIL Then Exit Sub
    If FU_Parametro(SqlConn, "@U_PRP", R1FAB001.tb_u_prp.Text, SQLINT4%) = FAIL Then Exit Sub
    If FU_Parametro(SqlConn, "@D_PRT_CGA", VT_PRP_EXC(axindex%).d_prt_cga, SQLDATETIME%) = FAIL Then Exit Sub
    If FU_Parametro(SqlConn, "@u_rmo", c_agr_fam_pro$, SQLINT4%) = FAIL Then Exit Sub
    
    Ret% = SQLRPCSend%(SqlConn%)

    If Ret% = FAIL Then
        MsgBox "Não foi possível enviar a lista de parâmetros da stored procedure DBNWORK..PR_WAP_EXC_S11946 ao servidor.", MB_ICONEXCLAMATION
        GoTo TrataErro
    End If

    If Ret% = FAIL Then
        MsgBox "Não foi possível executar a stored procedure DBNWORK..PR_WAP_EXC_S11946.", MB_ICONEXCLAMATION
        GoTo TrataErro
    End If

    Ret% = SqlResults%(SqlConn%)

    'Processamento dos resultados da stored procedure.
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        'Recuperação e processamento dos dados em cada linha.
        Do Until Ret% = NOMOREROWS Or Ret% = FAIL
            
            ReDim Preserve VT_MSG_ERRO(intIndex)
            
            VT_MSG_ERRO(intIndex).D_EXC_PRP = Trim(SqlData(SqlConn%, 1))
            VT_MSG_ERRO(intIndex).N_USR = Trim(SqlData(SqlConn%, 2))
            VT_MSG_ERRO(intIndex).N_MOT_EXC_PRP = Trim(SqlData(SqlConn%, 3))
            
            R1FAB008.CB_D_EXC_PRP.AddItem Format(VT_MSG_ERRO(intIndex).D_EXC_PRP, "DD/MM/YYYY hh:mm:ss")
            
            intIndex = intIndex + 1
            
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then
        MsgBox "Não foi possível processar os resultados da stored procedure DBNWORK..PR_WRA_PRP_EXC_S11894.", MB_ICONEXCLAMATION
        GoTo TrataErro
    End If

    'Erro da DBLibrary ou do SQL Server.
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Then GoTo TrataErro
        
    Screen.MousePointer = vbDefault
    
    Exit Sub
    
TrataErro:
    Screen.MousePointer = vbDefault
    MsgBox "Falha ao carregar Datas de Exclusão (SU_PR_WAP_EXC_S11946)", vbCritical + vbOKOnly, "Erro de Processamento"
    SU_Saida
    
End Sub

Sub SU_PR_WAP_EXC_S11954()
        
    On Error GoTo TrataErro
    
    Dim intIndex As Integer
    
    Screen.MousePointer = vbHourglass
        
    ReDim VT_MSG_ERRO(0)
    'R1FAB008.CB_D_EXC_PRP.Clear
    'intIndex = 0
       
    'Inicialização dos códigos de erro Sybase
    Err_Syb& = 0
    Msg_Syb& = 0

    'Inicialização da stored procedure.
    Ret% = SQLRPCInit%(SqlConn%, "DBNWORK..PR_WAP_EXC_S11954", 0)
    If Ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure DBNWORK..PR_WAP_EXC_S11954.", MB_ICONEXCLAMATION
        GoTo TrataErro
    End If

    If FU_Parametro(SqlConn, "@U_PRP", R1FAB001.tb_u_prp.Text, SQLINT4%) = FAIL Then Exit Sub
    If FU_Parametro(SqlConn, "@D_PRT_CGA", VT_PRP_EXC(axindex%).d_prt_cga, SQLDATETIME%) = FAIL Then Exit Sub
    'If FU_Parametro("@D_EXC_PRP", VT_PRP_EXC(axindex%).D_EXC_PRP, SQLDATETIM4%) = FAIL Then Exit Sub
    If FU_Parametro(SqlConn, "@D_EXC_PRP", Format(R1FAB008.CB_D_EXC_PRP, "MM/DD/YYYY HH:MM:SS"), SQLDATETIME%) = FAIL Then Exit Sub
    If FU_Parametro(SqlConn, "@u_rmo", c_agr_fam_pro$, SQLINT4%) = FAIL Then Exit Sub
    
    Ret% = SQLRPCSend%(SqlConn%)

    If Ret% = FAIL Then
        MsgBox "Não foi possível enviar a lista de parâmetros da stored procedure DBNWORK..PR_WAP_EXC_S11954 ao servidor.", MB_ICONEXCLAMATION
        GoTo TrataErro
    End If

    If Ret% = FAIL Then
        MsgBox "Não foi possível executar a stored procedure DBNWORK..PR_WAP_EXC_S11954.", MB_ICONEXCLAMATION
        GoTo TrataErro
    End If

    Ret% = SqlResults%(SqlConn%)

    'Processamento dos resultados da stored procedure.
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        'Recuperação e processamento dos dados em cada linha.
        Do Until Ret% = NOMOREROWS Or Ret% = FAIL
            R1FAB008.txt_n_usr.Text = Trim(SqlData(SqlConn%, 1))
            R1FAB008.txt_t_msg.Text = Trim(SqlData(SqlConn%, 2))
            
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop
    
    If Ret% = FAIL Then
        MsgBox "Não foi possível processar os resultados da stored procedure DBNWORK..PR_WRA_PRP_EXC_S11954.", MB_ICONEXCLAMATION
        GoTo TrataErro
    End If

    'Erro da DBLibrary ou do SQL Server.
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Then GoTo TrataErro
        
    Screen.MousePointer = vbDefault
    
    Exit Sub
    
TrataErro:
    Screen.MousePointer = vbDefault
    MsgBox "Falha ao carregar Datas de Exclusão (SU_PR_WAP_EXC_S11954)", vbCritical + vbOKOnly, "Erro de Processamento"
    SU_Saida
    
End Sub

Public Function FU_PR_CANAL_RECEPCAO_S13967(prm_e_rct_prp As String, prm_e_mcl_vda As String, prm_c_cph As String, c_cee_etd As String) As String
    'Seleciona a descrição do Canal de Recepção
    Dim Ret As Integer
       
    On Error GoTo S13967
    
    FU_PR_CANAL_RECEPCAO_S13967 = ""
    
    ' Inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "DBNCORP..PR_CANAL_RECEPCAO_S13967", 0)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcInit%, "FU_PR_CANAL_RECEPCAO_S13967"
        Exit Function
    End If

    ' Passa parâmetros
    If FU_Parametro(SqlConn, "@E_RCT_PRP", prm_e_rct_prp, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@E_MCL_VDA", prm_e_mcl_vda, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@C_CPH", prm_c_cph, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@T_CANAL", "", SQLVARCHAR) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then Exit Function  'v91 Emilio 18/02/2011 - SS_156649 - Melhorias no Simulador Blanket e Gatilho
    'Guilherme Langoni - Novo Produto APC na abertura de conta
    If FU_Parametro(SqlConn, "@c_pro", c_pro$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@C_CEE_ETD", c_cee_etd, SQLINT2%) = FAIL Then Exit Function 'Seguro crediário 132575
    If FU_Parametro(SqlConn, "@u_adi", u_adi, SQLINT4%) = FAIL Then Exit Function   'v91 Emilio 09/02/2011 - SS_156649 - Melhorias no Simulador Blanket e Gatilho
    'If FU_Parametro(SqlConn, "@e_mig", e_mig, SQLINT2%) = FAIL Then Exit Function   'v96 Emilio 18/03/2011 - SS_163237 - Tombamento Auto ISa+r
    If FU_Parametro(SqlConn, "@e_mig", e_mig_adi, SQLINT2%) = FAIL Then Exit Function   'v97 Emilio - 21/03/2011 - SS_163237 - Tombamento Auto ISa+r
    If FU_Parametro(SqlConn, "@u_ctc", VT_TIPO_EMI_PRP.u_ctc, SQLINT4%) = FAIL Then Exit Function   'v99 Emilio 23/05/2011 - SS_163237 - Tombamento Auto Frota UBB x ISa+r

    ' Envia comandos
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcSend%, "FU_PR_CANAL_RECEPCAO_S13967"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlOk%, "FU_PR_CANAL_RECEPCAO_S13967"
        Exit Function
    End If

    ' verifica resultados
    Ret% = SqlResults(SqlConn%)
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "FU_PR_CANAL_RECEPCAO_S13967"
        Exit Function
    End If

    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults(SqlConn%)
    Loop
    
    If Ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "FU_PR_CANAL_RECEPCAO_S13967"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function
    
    FU_PR_CANAL_RECEPCAO_S13967 = Trim(SqlRetData(SqlConn, 1))
    
    Exit Function
    
S13967:
    MsgBox "Erro na FU_PR_CANAL_RECEPCAO_S13967", vbCritical
    Exit Function
End Function

Function FU_PR_DAD_TCO_APO_G07704() As Integer

    Dim n_linhas As String
    Dim c_err    As String
    
    On Error GoTo Trata_Erro

    FU_PR_DAD_TCO_APO_G07704 = False

    'Inicialização dos códigos de erro
    'da DBLibrary e do SQL Server.
    Err_Syb& = 0
    Msg_Syb& = 0

    u_prc_ssp$ = ""

    Ret% = SQLRPCInit%(SqlConn%, "DBNTRANS..PR_DAD_TCO_APO_G07704", 0)
    If Ret% = FAIL Then msgerro = "Não foi possível inicializar a stored procedure.": GoTo Trata_Erro

    msgerro = "Erro no envio dos parâmetros."
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@c_pro", c_pro$, SQLINT2%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro_Ret(SqlConn, "@u_prc_ssp", "", SQLVARCHAR%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro_Ret(SqlConn, "@c_err", 0, SQLINT2%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro_Ret(SqlConn, "@t_err", "", SQLVARCHAR%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT4%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@u_adi", u_adi, SQLINT2%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@i_ver_apo", "S", SQLCHAR%) = FAIL Then GoTo Trata_Erro
    msgerro = ""
    
    'Envio da lista de parâmetros ao servidor para ser executada
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then msgerro = "Não foi possível enviar a lista de parâmetros da stored procedure": GoTo Trata_Erro

    'Verificação da exatidão dos comandos no command buffer
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then msgerro = "Não foi possível executar a stored procedure.": GoTo Trata_Erro

    'Processamento dos resultados da stored procedure
    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        'Recuperação e processamento dos dados em cada linha.
        Do Until Ret% = NOMOREROWS Or Ret% = FAIL
        
            If u_prc_ssp$ = "" Then
                u_prc_ssp$ = Trim(SqlData$(SqlConn%, 1))
            Else
                u_prc_ssp$ = u_prc_ssp$ & "  " & Trim(SqlData$(SqlConn%, 1))
            End If
        
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then msgerro = "Não foi possível processar os resultados da stored procedure.": GoTo Trata_Erro

    'Erro da DBLibrary ou do SQL Server
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Then GoTo Trata_Erro

    If u_prc_ssp$ = "" Then
        u_prc_ssp$ = Trim(SqlRetData$(SqlConn%, 1))
    End If

    c_err = SqlRetData$(SqlConn%, 2)
    If Val(c_err) <> 0 Then
        msgerro = "Erro da STP: " & Trim(c_err) & " - " & Trim(SqlRetData(SqlConn%, 3))
        GoTo Trata_Erro
    End If

    n_linhas = Trim$(SqlRetData$(SqlConn%, 4))
    
    If Val(n_linhas) < 1 Then
        msgerro = "Não foi encontrado o número do processo SUSEP."
    End If
    
    FU_PR_DAD_TCO_APO_G07704 = True

    Exit Function

Trata_Erro:

    msgerro = "[FU_PR_DAD_TCO_APO_G07704] " & msgerro
    
    If Err.Number <> 0 Then msgerro = msgerro & vbCrLf & "Erro VB: " & Trim(Str(Err.Number)) & " - " & Err.Description
    If Err_Syb <> 0 Or Msg_Syb <> 0 Then msgerro = msgerro & vbCrLf & "Erro Sybase: " & Trim(Str(Err_Syb)) & "/" & Trim(Str(Msg_Syb)) & " - " & MsgStr_Syb

End Function

'Diego Ponciano - BRQ - 13/05/2013 - PR-2013-0001507
Function FU_PR_PRC_SSP_S21427() As Integer

    Dim n_linhas As String
    Dim c_err    As String
    Dim t_err    As String
    
    On Error GoTo Trata_Erro

    FU_PR_PRC_SSP_S21427 = False

    'Inicialização dos códigos de erro
    'da DBLibrary e do SQL Server.
    Err_Syb = 0
    Msg_Syb = 0

    u_prc_ssp = ""

    Ret = SQLRPCInit(SqlConn, "DBNAPOIO..PR_PRC_SSP_S21427", 0)
    If Ret = FAIL Then msgerro = "Não foi possível inicializar a stored procedure.": GoTo Trata_Erro

    msgerro = "Erro no envio dos parâmetros."
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo, SQLINT2) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@c_pro", c_pro, SQLINT2) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@d_tab_vda", Format(d_ini_vig_apo, "MM/DD/YYYY"), SQLDATETIM4) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_err", 0, SQLINT4) = FAIL Then GoTo Trata_Erro
    If FU_Parametro_Ret(SqlConn, "@t_err", "", SQLVARCHAR) = FAIL Then GoTo Trata_Erro
    If FU_Parametro_Ret(SqlConn, "@q_lin", 0, SQLINT2) = FAIL Then GoTo Trata_Erro
    If FU_Parametro_Ret(SqlConn, "@u_prc_ssp", "", SQLVARCHAR) = FAIL Then GoTo Trata_Erro
    If FU_Parametro_Ret(SqlConn, "@modalidade", "", SQLVARCHAR) = FAIL Then GoTo Trata_Erro
    msgerro = ""
    
    'Envio da lista de parâmetros ao servidor para ser executada
    Ret = SQLRPCSend(SqlConn)
    If Ret = FAIL Then msgerro = "Não foi possível enviar a lista de parâmetros da stored procedure": GoTo Trata_Erro
    
    'Verificação da exatidão dos comandos no command buffer
    Ret = SqlOk(SqlConn)
    If Ret = FAIL Then msgerro = "Não foi possível executar a stored procedure.": GoTo Trata_Erro
    
    'Processamento dos resultados da stored procedure
    Ret = SqlResults(SqlConn)

    If Ret = FAIL Then msgerro = "Não foi possível processar os resultados da stored procedure.": GoTo Trata_Erro
    
    'Erro da DBLibrary ou do SQL Server
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then GoTo Trata_Erro
    
    u_prc_ssp = Trim(SqlRetData(SqlConn, 4))
    modalidade = Trim(SqlRetData(SqlConn, 5))
    
    c_err = SqlRetData(SqlConn, 1)
    If Val(c_err) <> 0 Then
        t_err = Trim(SqlRetData(SqlConn, 2))
        msgerro = "Erro da STP: " & Trim(c_err) & " - " & t_err
        GoTo Trata_Erro
    End If
    
    n_linhas = Trim(SqlRetData(SqlConn, 3))
    
    If Val(n_linhas) < 1 Then
        msgerro = "Não foi encontrado o número do processo SUSEP."
    End If
    
    FU_PR_PRC_SSP_S21427 = True
    
    Exit Function

Trata_Erro:

    msgerro = "[FU_PR_PRC_SSP_S21427] " & msgerro
    
    If Err.Number <> 0 Then msgerro = msgerro & vbCrLf & "Erro VB: " & Trim(Str(Err.Number)) & " - " & Err.Description
    If Err_Syb <> 0 Or Msg_Syb <> 0 Then msgerro = msgerro & vbCrLf & "Erro Sybase: " & Trim(Str(Err_Syb)) & "/" & Trim(Str(Msg_Syb)) & " - " & MsgStr_Syb

    If Val(c_err) = 10 Or Val(c_err) = 20 Then
        MsgBox msgerro, MB_ICONEXCLAMATION
    Else
        msgerro = msgerro & vbCrLf & vbCrLf & "Por favor contate o analista responsável pelo sistema."
        MsgBox msgerro, MB_ICONSTOP
    End If

End Function

Function FU_PR_ADI_RDF_S16022()

    Dim c_err   As Integer
    
    On Error GoTo Trata_Erro
    
    FU_PR_ADI_RDF_S16022 = False
    
    'Inicialização dos códigos de erro
    'da DBLibrary e do SQL Server.
    Err_Syb& = 0
    Msg_Syb& = 0

    Ret% = SQLRPCInit%(SqlConn%, "DBNPROD..PR_ADI_RDF_S16022", 0)
    If Ret% = FAIL Then msgerro = "Não foi possível inicializar a stored procedure.": GoTo Trata_Erro

    msgerro = "Erro no envio dos parâmetros."
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@u_adi", u_adi$, SQLINT4%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro(SqlConn, "@u_vrs_adi", U_VRS_ADI$, SQLINT4%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro_Ret(SqlConn, "@n_arq_esf_apo", "", SQLCHAR%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro_Ret(SqlConn, "@c_err", 0, SQLINT2%) = FAIL Then GoTo Trata_Erro
    If FU_Parametro_Ret(SqlConn, "@t_err", "", SQLVARCHAR%) = FAIL Then GoTo Trata_Erro
    msgerro = ""
    
    'Envio da lista de parâmetros ao servidor para ser executada
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then msgerro = "Não foi possível enviar a lista de parâmetros da stored procedure": GoTo Trata_Erro

    'Verificação da exatidão dos comandos no command buffer
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then msgerro = "Não foi possível executar a stored procedure.": GoTo Trata_Erro

    'Processamento dos resultados da stored procedure
    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        'Recuperação e processamento dos dados em cada linha.
        Do Until Ret% = NOMOREROWS Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then msgerro = "Não foi possível processar os resultados da stored procedure.": GoTo Trata_Erro

    'Erro da DBLibrary ou do SQL Server
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Then GoTo Trata_Erro

    n_arq_esf_apo = Trim(SqlRetData$(SqlConn%, 1))

    c_err = SqlRetData$(SqlConn%, 2)
    If Val(c_err) <> 0 Then
        msgerro = "Erro da STP: " & Trim(c_err) & " - " & Trim(SqlRetData(SqlConn%, 3))
        GoTo Trata_Erro
    End If
    
    FU_PR_ADI_RDF_S16022 = True
    
    Exit Function

Trata_Erro:

    msgerro = "[FU_PR_ADI_RDF_S16022] " & msgerro
    
    If Err.Number <> 0 Then msgerro = msgerro & vbCrLf & "Erro VB: " & Trim(Str(Err.Number)) & " - " & Err.Description
    If Err_Syb <> 0 Or Msg_Syb <> 0 Then msgerro = msgerro & vbCrLf & "Erro Sybase: " & Trim(Str(Err_Syb)) & "/" & Trim(Str(Msg_Syb)) & " - " & MsgStr_Syb
    
End Function

Public Function FU_PR_RPC_APO_MVP_S17688() As Boolean

    Dim Ret         As Integer
    Dim n_fnc       As String
    Dim c_err       As Integer
    Dim t_err       As String
    
    On Error GoTo Trata_Erro
    
    FU_PR_RPC_APO_MVP_S17688 = False
    
    n_fnc = "FU_PR_RPC_APO_MVP_S17688"
    
    Ret% = SQLRPCInit%(SqlConn%, "DBNMIGVD..PR_RPC_APO_MVP_S17688", 0)
    If Ret% = FAIL Then msgerro = "Não foi possível inicializar a stored procedure.": GoTo Trata_Erro
    
    msgerro = "Erro no envio dos parâmetros."
    If FU_Parametro_Ret(SqlConn, "@c_err", 0, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@t_err", "", SQLVARCHAR%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_pro_itp", Left(u_apo_ant, 4), SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_itp", Mid(u_apo_ant, 5), SQLINT4%) = FAIL Then Exit Function
    
    msgerro = ""
    
    'Envio da lista de parâmetros ao servidor para ser executada
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL Then msgerro = "Não foi possível enviar a lista de parâmetros da stored procedure": GoTo Trata_Erro

    'Verificação da exatidão dos comandos no command buffer
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL Then msgerro = "Não foi possível executar a stored procedure.": GoTo Trata_Erro

    'Processamento dos resultados da stored procedure
    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        'Recuperação e processamento dos dados em cada linha.
        Do Until Ret% = NOMOREROWS Or Ret% = FAIL
            u_prp_itp = SqlData(SqlConn%, 1)
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then msgerro = "Não foi possível processar os resultados da stored procedure.": GoTo Trata_Erro

    'Erro da DBLibrary ou do SQL Server
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Then GoTo Trata_Erro
    
    c_err% = Val(SqlRetData$(SqlConn%, 1))
    t_err = SqlRetData$(SqlConn%, 2)
    
    If c_err <> 0 Then
        msgerro = "Erro da STP: " & Trim(Str(c_err)) & " - " & t_err
        GoTo Trata_Erro
    End If
    
    FU_PR_RPC_APO_MVP_S17688 = True
    
    Exit Function
    
Trata_Erro:
    
    msgerro = "[FU_PR_RPC_APO_MVP_S17688] " & msgerro
    
    If Err.Number <> 0 Then msgerro = msgerro & vbCrLf & "Erro VB: " & Trim(Str(Err.Number)) & " - " & Err.Description
    If Err_Syb <> 0 Or Msg_Syb <> 0 Then msgerro = msgerro & vbCrLf & "Erro Sybase: " & Trim(Str(Err_Syb)) & "/" & Trim(Str(Msg_Syb)) & " - " & MsgStr_Syb

End Function
Function fu_ctl_mvp_g14545() As Integer

    ' verifica se apolice Itauprev está no processo de migração

    ' retorno de funções
    Dim Ret As Integer

    fu_ctl_mvp_g14545 = False

    ' inicializa stored procedure
    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..PR_CTL_MVP_G14545", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_ctl_mvp_g14545"
        Exit Function
    End If
  
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_pro_itp", c_pro_itp, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_itp", u_apo_itp, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@t_msg_prt", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_err_prt", "0", SQLINT4%) = FAIL% Then Exit Function
    
    ' envia comando
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_ctl_mvp_g14545"
        Exit Function
    End If

    ' executa comando
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_ctl_mvp_g14545"
        Exit Function
    End If
    
    ' verifica resultados
    Ret% = SqlResults%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_ctl_mvp_g14545"
        Exit Function
    End If
    
    ' processa resultados
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_ctl_mvp_g14545"
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_ctl_mvp_g14545 = False
    
    msg_mig_itp = SqlRetData$(SqlConn%, 1)
    
    fu_ctl_mvp_g14545 = True

End Function

Function FU_MDD_AUT_FRT_S18816(c_mdd_aut As String)
'Adelamg SS 156649

    Dim AUX_RET         As Integer
    
    FU_MDD_AUT_FRT_S18816 = False
    
    T_MDD_AUT_FRT = ""
    
    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_MDD_AUT_FRT_S18816", 0)

    If FU_Parametro(SqlConn, "@C_MDD_AUT_FRT", c_mdd_aut, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@C_Err", 0, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@T_ERR", 0, SQLINT4%) = FAIL Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)

'+-------------------------------------------------------------------------+
'|        VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO          |
'+-------------------------------------------------------------------------+
    If MsgSev_Syb% > 1 Then Exit Function

    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "PR_MDD_AUT_FRT_S18816"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "PR_MDD_AUT_FRT_S18816"
        Exit Function
    End If

    '+-------------------------------------------------------------------------+
    '| Carrega o resultado da leitura                                           |
    '+------------------------------------------------------------------------+
    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            T_MDD_AUT_FRT = SqlData(SqlConn, 2)
            Ret% = SqlNextRow%(SqlConn%)
        Loop
        Ret% = SqlResults%(SqlConn%)
    Loop
    
    'Retorno erro sybase
    If Val(SqlRetData(SqlConn, 1)) > 0 Then
        Exit Function
    End If
                
    
    FU_MDD_AUT_FRT_S18816 = True

End Function



Function fu_sel_his_tco_apo_S18686() As Integer
'Antonio 28/07/2010

Dim Ret As Integer
Dim n_linhas As String

    fu_sel_his_tco_apo_S18686 = False

    Ret% = SQLRPCInit%(SqlConn%, "dbnprod..PR_HIS_TCO_APO_S18686", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "fu_sel_his_tco_apo_S18686"
        Exit Function
    End If
    
    'Passa parametros para Store Procedure
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", u_adi, SQLINT4%) = FAIL% Then Exit Function
    'If FU_Parametro(SqlConn, "@c_tab_atv_emp", 16, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_tab_atv_emp", VG_c_tab_atv_emp, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@e_pes", e_pes$, SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@linhas_ret", "", SQLINT4%) = FAIL% Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "fu_sel_his_tco_apo_S18686"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "fu_sel_his_tco_apo_S18686"
        Exit Function
    End If
    
      ' 1 APO.C_CIA_ITA,
      ' 2 APO.C_RMO,
      ' 3 APO.U_APO_PNC,
      ' 4 APO.U_APO_DPD,
      ' 5 APO.I_APO_SGN_RIS,
      ' 6 APO.C_CNG_PRI_RIS,
      ' 7 APO.U_APO_PRI_RIS,
      ' 8 APO.D_INI_PRI_RIS,
      ' 9 APO.D_FIM_PRI_RIS,
      ' 10 APO.C_ATV_EMP_AUT,
      ' 11 TAB.C_ATV_EMP,
      ' 12 EMP.N_ATV_EMP,
      ' 13 PES.N_PES
    
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL%
        Do Until SqlNextRow(SqlConn%) = NOMOREROWS%
        
            s_ind_apo_pri_risco = SqlData(SqlConn%, 5)
            s_nome_cong_pri_risco = SqlData(SqlConn%, 13)
            s_num_apo_pri_risco = SqlData(SqlConn%, 7)
            s_ini_vig_apo_pri_risco = SqlData(SqlConn%, 8)
            s_fim_vig_apo_pri_risco = SqlData(SqlConn%, 9)
            s_cod_atv_emp_auto_frota = SqlData(SqlConn%, 10)
            s_des_atv_emp_auto_frota = SqlData(SqlConn%, 12)
            
            'Márcia Abreu - 05/01/2012 - Início - Campo apo 2. risco (s/n)
            s_i_apo_sgn_ris = SqlData(SqlConn%, 5)
            If Trim(UCase(s_i_apo_sgn_ris)) = "S" Then
                s_i_apo_sgn_ris = "Sim"
            ElseIf Trim(UCase(s_i_apo_sgn_ris)) = "N" Then
                s_i_apo_sgn_ris = "Não"
            Else
                s_i_apo_sgn_ris = "Não"
            End If
            'Márcia Abreu - 05/01/2012 - Final - Campo apo 2. risco (s/n)
            
        Loop
        Ret% = SqlResults(SqlConn%)
        If Ret% = FAIL% Then
            su_erro_st_proc ST_SqlResults%, "fu_sel_his_tco_apo_S18686"
            Exit Function
        End If
    Loop
    
    
    n_linhas$ = SqlRetData(SqlConn%, 1)

    If Val(n_linhas) > 0 Then fu_sel_his_tco_apo_S18686 = True
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_his_tco_apo_S18686 = False

End Function


Function FU_AGR_PRO_S18748()
' Carla SS122101 - Inclusão de tratamento de garantia para apólice de segundo risco Auto Frota
Dim u_linhas As Integer
Dim VG_RET As Integer

    FU_AGR_PRO_S18748 = False
    u_linhas = 0
    
    VG_RET = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_AGR_PRO_S18748", 0)

    If SQLRPCParam(SqlConn, "@c_rmo", Not SQLRPCRETURN, SQLINT2%, 0, 0, c_rmo$) = FAIL% Then Exit Function
    If SQLRPCParam(SqlConn, "@c_pro", Not SQLRPCRETURN, SQLINT2%, 0, 0, c_pro$) = FAIL% Then Exit Function
    If SQLRPCParam(SqlConn, "@c_e_agr", Not SQLRPCRETURN, SQLINT2%, 0, 0, 116) = FAIL% Then Exit Function
    If SQLRPCParam(SqlConn, "@c_agr", Not SQLRPCRETURN, SQLINT4%, 0, 0, 1) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", SQLRPCRETURN, SQLINT2%, 0, 0, u_linhas) = FAIL% Then Exit Function

    VG_RET = SQLRPCSend%(SqlConn%)

'+-------------------------------------------------------------------------+
'|        VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO          |
'+-------------------------------------------------------------------------+
    If VG_RET = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_AGR_PRO_S18748.", MB_ICONEXCLAMATION
        Exit Function
    End If
    
    If MsgSev_Syb% > 1 Then Exit Function
    
    u_linhas% = Trim(SqlRetData(SqlConn%, 1))
    
    If u_linhas > 0 Then
        FU_AGR_PRO_S18748 = True
    Else
        FU_AGR_PRO_S18748 = False
    End If
End Function
'************************************************************
' SMG_IR3_0003  ( Formalização Remota  )
' Recupera os dados referentes a formalização / assinatura
' de propostas.
' Autor :  Marco Sotto  / BRQ IT Service
'************************************************************
Public Function FU_ConsultaFormalizacaoApolice(c_cia_ita As String, u_apo_pnc As String, u_apo_dpd As String, u_adi As String, ByRef oR1CAB016 As R1CAB016) As Integer
    '************************************************************
    ' Área reservada para definição de direcionamento de trata-
    ' mento de erro
    '************************************************************
    On Error GoTo Trata_Erro
    '************************************************************
    ' Área reservada para definição de variáveis e objetos.
    '************************************************************
    Dim retexec As Integer
    Dim cmdstr As String
    '************************************************************
    ' Inicializa a função.
    '************************************************************
    FU_ConsultaFormalizacaoApolice = FAIL
    '************************************************************
    ' Prepara a consulta  que deverá retornar as informações
    ' de formalização.
    '************************************************************
    cmdstr = " select "
    cmdstr = cmdstr & "  d_hra_cfc_eln = convert(varchar,tCFC.d_hra_cfc_eln,103)  +   ' '     +  convert(varchar,tCFC.d_hra_cfc_eln,108)   "
    cmdstr = cmdstr & " ,tCFC.u_cfc_eln_prp "
    cmdstr = cmdstr & " ,tCFC.c_idt_trn_eln "
    cmdstr = cmdstr & " ,tCEE.n_cee_etd "
    cmdstr = cmdstr & " ,tCFC.e_sit_cfc_eln "
    cmdstr = cmdstr & " from "
    cmdstr = cmdstr & "          DBNCORP..TB_CFC_ELN_PRP    tCFC,dbnapoio..tb_cee_etd tcee  "
    cmdstr = cmdstr & " where  "
    cmdstr = cmdstr & " tCFC.u_apo_pnc       =    " + u_apo_pnc
    cmdstr = cmdstr & " and tCFC.c_cia_ita   =    " + c_cia_ita
    cmdstr = cmdstr & " and tCFC.u_apo_dpd   =    " + u_apo_dpd
    cmdstr = cmdstr & " and tCFC.u_adi       =    " + u_adi
    cmdstr = cmdstr & " and tCFC.c_cee_cfc   =    tcee.c_cee_etd "
    '************************************************************
    ' Prepara a execução  e valida retorno
    '************************************************************
    If SqlCmd(SqlConn, cmdstr) = FAIL Then Exit Function
    If SqlExec(SqlConn) = FAIL Then Exit Function
    retexec = SqlResults%(SqlConn%)
    Do Until retexec = NOMORERESULTS%
        If retexec = FAIL Then
            Exit Function
        End If
        While SqlNextRow(SqlConn%) <> NOMOREROWS
            '************************************************************
            ' Popula o retorno
            '************************************************************
            oR1CAB016.d_hra_cfc_eln = SqlData(SqlConn%, 1)
            oR1CAB016.u_cfc_eln_prp = SqlData(SqlConn%, 2)
            oR1CAB016.c_idt_trn_eln = SqlData(SqlConn%, 3)
            oR1CAB016.n_cee_etd = SqlData(SqlConn%, 4)
            oR1CAB016.e_sit_cfc_eln = SqlData(SqlConn%, 5)
        Wend
        retexec = SqlResults%(SqlConn%)
    Loop
    '************************************************************
    ' Processamento realizado com sucesso.
    '************************************************************
    FU_ConsultaFormalizacaoApolice = SUCCEED
    Exit Function
    '************************************************************
    ' Área reservada para definição de tratamento de
    ' erros que podem ocorrer durante a execução.
    '************************************************************
Trata_Erro:
    MsgBox "Erro ao carregar dados de formalização: " & Err & " - " & error$(Err) & ".", vbCritical
    FU_ConsultaFormalizacaoApolice = FAIL
    Exit Function
End Function
'************************************************************
' SMG_IR2_????  ( Formalização Remota  Residencial)
' Recupera os dados referentes a formalização / assinatura(Residencial)
' de propostas.
' Autor :  BRQ IT - Rogerio Sotto- 19/09/2013
'************************************************************
Public Function FU_ConsultaFormalizacaoApoliceResidencial(c_cia_ita As String, u_apo_pnc As String, u_apo_dpd As String, ByRef oR1CAB016 As R1CAB016) As Integer
    '************************************************************
    ' Área reservada para definição de direcionamento de trata-
    ' mento de erro
    '************************************************************
    On Error GoTo Trata_Erro
    '************************************************************
    ' Área reservada para definição de variáveis e objetos.
    '************************************************************
    Dim retexec As Integer
    Dim cmdstr As String
    
    'UTILIZAR SEMPRE WEB10 PARA ESTA PESQUISA
    SqlConn% = FU_Conecta_Servidor(ID_WEB10)
    
    '************************************************************
    ' Inicializa a função.
    '************************************************************
    FU_ConsultaFormalizacaoApoliceResidencial = FAIL
    '************************************************************
    ' Prepara a consulta  que deverá retornar as informações
    ' de formalização.
    '************************************************************
    
    cmdstr = " select "
    cmdstr = cmdstr & "   d_hra_cfc_eln = convert(varchar,fp.d_hra_cfc_eln,103)  +   ' '     +  convert(varchar,fp.d_hra_cfc_eln,108)  "
    cmdstr = cmdstr & "  ,fp.u_cfc_eln_prp "
    cmdstr = cmdstr & "  ,fp.c_idt_trn_eln "
    cmdstr = cmdstr & "  ,tcee.n_cee_etd "
    cmdstr = cmdstr & "  ,fp.e_sit_cfc_eln "
    cmdstr = cmdstr & "  from dbnprod..tb_ctl_emi_prp ep "
    cmdstr = cmdstr & "  inner join dbncorp..tb_flr_prp fp on ep.u_prp = fp.u_prp "
    cmdstr = cmdstr & "     and ep.u_prp = fp.u_prp "
    cmdstr = cmdstr & "     and ep.c_rmo = fp.c_rmo "
    cmdstr = cmdstr & "     and ep.c_pro = fp.c_pro "
    cmdstr = cmdstr & "     and ep.d_prp = fp.d_prp "
    cmdstr = cmdstr & "  inner join dbnapoio..tb_cee_etd tcee on  fp.c_cee_cfc   =    tcee.c_cee_etd "
    cmdstr = cmdstr & "  Where ep.u_apo_pnc = " + u_apo_pnc
    cmdstr = cmdstr & "  and ep.c_cia_ita = " + c_cia_ita
    cmdstr = cmdstr & "  and ep.u_apo_dpd = " + u_apo_dpd
    cmdstr = cmdstr & "  and ep.c_rmo = " + c_rmo
    cmdstr = cmdstr & "  and ep.u_adi = 0 "
    cmdstr = cmdstr & "  and ep.u_vrs_adi = 1 "

    
    
    '************************************************************
    ' Prepara a execução  e valida retorno
    '************************************************************
    If SqlCmd(SqlConn, cmdstr) = FAIL Then Exit Function
    If SqlExec(SqlConn) = FAIL Then Exit Function
    retexec = SqlResults%(SqlConn%)
    Do Until retexec = NOMORERESULTS%
        If retexec = FAIL Then
            Exit Function
        End If
        While SqlNextRow(SqlConn%) <> NOMOREROWS
            '************************************************************
            ' Popula o retorno
            '************************************************************
            oR1CAB016.d_hra_cfc_eln = SqlData(SqlConn%, 1)
            oR1CAB016.u_cfc_eln_prp = SqlData(SqlConn%, 2)
            oR1CAB016.c_idt_trn_eln = SqlData(SqlConn%, 3)
            oR1CAB016.n_cee_etd = SqlData(SqlConn%, 4)
            oR1CAB016.e_sit_cfc_eln = SqlData(SqlConn%, 5)
        Wend
        retexec = SqlResults%(SqlConn%)
    Loop
    '************************************************************
    ' Processamento realizado com sucesso.
    '************************************************************
    FU_ConsultaFormalizacaoApoliceResidencial = SUCCEED
    
    su_fecha_conexao
                
    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
    Exit Function
    '************************************************************
    ' Área reservada para definição de tratamento de
    ' erros que podem ocorrer durante a execução.
    '************************************************************
Trata_Erro:
    MsgBox "Erro ao carregar dados de formalização: " & Err & " - " & error$(Err) & ".", vbCritical
    FU_ConsultaFormalizacaoApoliceResidencial = FAIL
    Exit Function
End Function

'************************************************************
' SMG_IR3_0003  ( Formalização Remota  )
' Recupera o tipo de assinatura de confirmação de uma
' apólice informada.
' Autor :  Marco Sotto  / BRQ IT Service
'************************************************************
Public Function FU_ConsultaTipoAssinaturaApolice(c_rmo As String, c_cia_ita As String, u_apo_pnc As String, u_apo_dpd As String, u_adi As String) As String
    '************************************************************
    ' Área reservada para definição de direcionamento de trata-
    ' mento de erro
    '************************************************************
    On Error GoTo Trata_Erro
    '************************************************************
    ' Área reservada para definição de variáveis e objetos.
    '************************************************************
    Dim retexec As Integer
    Dim cmdstr As String
    '************************************************************
    ' Inicializa a função.
    '************************************************************
    FU_ConsultaTipoAssinaturaApolice = ""
    '************************************************************
    ' Prepara a consulta  que deverá retornar as informações
    ' de formalização.
    '************************************************************
    cmdstr = " SELECT  I_ASN_ELN  FROM DBNPROD..TB_ADI  TADI"
    cmdstr = cmdstr & " where  "
    cmdstr = cmdstr & "     TADI.u_apo_pnc       =    " + u_apo_pnc
    cmdstr = cmdstr & " and TADI.c_cia_ita       =    " + c_cia_ita
    cmdstr = cmdstr & " and TADI.u_apo_dpd       =    " + u_apo_dpd
    cmdstr = cmdstr & " and TADI.u_adi           =    " + u_adi
    cmdstr = cmdstr & " and TADI.c_rmo           =    " + c_rmo
    '************************************************************
    ' Prepara a execução  e valida retorno
    '************************************************************
    If SqlCmd(SqlConn, cmdstr) = FAIL Then Exit Function
    If SqlExec(SqlConn) = FAIL Then Exit Function
    retexec = SqlResults%(SqlConn%)
    Do Until retexec = NOMORERESULTS%
        If retexec = FAIL Then
            Exit Function
        End If
        While SqlNextRow(SqlConn%) <> NOMOREROWS
            '************************************************************
            ' Popula o retorno
            '************************************************************
            FU_ConsultaTipoAssinaturaApolice = SqlData(SqlConn%, 1)
            Exit Function
        Wend
        retexec = SqlResults%(SqlConn%)
    Loop
    '************************************************************
    ' Processamento realizado com sucesso.
    '************************************************************
    Exit Function
    '************************************************************
    ' Área reservada para definição de tratamento de
    ' erros que podem ocorrer durante a execução.
    '************************************************************
Trata_Erro:
    MsgBox "Erro ao carregar dados de formalização(Tipo Assinatura): " & Err & " - " & error$(Err) & ".", vbCritical
    FU_ConsultaTipoAssinaturaApolice = ""
    Exit Function
End Function
'************************************************************
' SMG_IR2_???? ( Formalização Remota  )
' Recupera o tipo de assinatura de confirmação de uma
' apólice informada.
' Autor :  BRQ IT - Rogerio Sotto- 19/09/2013
'************************************************************
Public Function FU_ConsultaTipoAssinaturaApoliceResidencial(c_rmo As String, c_cia_ita As String, u_apo_pnc As String, u_apo_dpd As String) As String
    '************************************************************
    ' Área reservada para definição de direcionamento de trata-
    ' mento de erro
    '************************************************************
    On Error GoTo Trata_Erro
    '************************************************************
    ' Área reservada para definição de variáveis e objetos.
    '************************************************************
    Dim oDadosFormalizacao  As New R1CAB016
    
    '************************************************************
    ' Inicializa a função.
    '************************************************************
    FU_ConsultaTipoAssinaturaApoliceResidencial = ""
    '************************************************************
    ' Consulta os dados de formalizacao caso seja nulo quer dizer que não é formalização
    '************************************************************
    If FU_ConsultaFormalizacaoApoliceResidencial(c_cia_ita, u_apo_pnc, u_apo_dpd, oDadosFormalizacao) = FAIL Then
        Exit Function
    End If
    
    If oDadosFormalizacao.d_hra_cfc_eln <> "" Then
        FU_ConsultaTipoAssinaturaApoliceResidencial = "B"
    End If
    
    '************************************************************
    ' Processamento realizado com sucesso.
    '************************************************************
    Exit Function
    '************************************************************
    ' Área reservada para definição de tratamento de
    ' erros que podem ocorrer durante a execução.
    '************************************************************
Trata_Erro:
    MsgBox "Erro ao carregar dados de formalização(Tipo Assinatura): " & Err & " - " & error$(Err) & ".", vbCritical
    FU_ConsultaTipoAssinaturaApoliceResidencial = ""
    Exit Function
End Function

Public Function FU_ConsultaTipoAssinaturaApoliceFR(c_rmo As String, c_cia_ita As String, u_apo_pnc As String, u_apo_dpd As String) As String
    '************************************************************
    ' Área reservada para definição de direcionamento de trata-
    ' mento de erro
    '************************************************************
    On Error GoTo Trata_Erro
    '************************************************************
    ' Área reservada para definição de variáveis e objetos.
    '************************************************************
    Dim oDadosFormalizacao  As New R1CAB016
    Dim u_ctc  As String
    Dim e_ass As String
    '************************************************************
    ' Inicializa a função.
    '************************************************************
    FU_ConsultaTipoAssinaturaApoliceFR = ""
    '************************************************************
    ' Consulta os dados de formalizacao caso seja nulo quer dizer que não é formalização
    '************************************************************
    u_ctc = FU_ConsultaCotacaoporApoliceFR(c_cia_ita, u_apo_pnc, u_apo_dpd)
    If FU_ConsultaFormalizacaoApoliceFR(u_ctc, oDadosFormalizacao, e_ass) = FAIL Then
        Exit Function
    End If
    
    FU_ConsultaTipoAssinaturaApoliceFR = e_ass
    '************************************************************
    ' Processamento realizado com sucesso.
    '************************************************************
    Exit Function
    '************************************************************
    ' Área reservada para definição de tratamento de
    ' erros que podem ocorrer durante a execução.
    '************************************************************
Trata_Erro:
    MsgBox "Erro ao carregar dados de formalização(Tipo Assinatura): " & Err & " - " & error$(Err) & ".", vbCritical
    FU_ConsultaTipoAssinaturaApoliceFR = ""
    Exit Function
End Function

Public Function FU_ConsultaCotacaoporApoliceFR(c_cia_ita As String, u_apo_pnc As String, u_apo_dpd As String) As String
    '************************************************************
    ' Área reservada para definição de direcionamento de trata-
    ' mento de erro
    '************************************************************
    On Error GoTo Trata_Erro
    '************************************************************
    ' Área reservada para definição de variáveis e objetos.
    '************************************************************
    Dim retexec As Integer
    Dim cmdstr As String
    'UTILIZAR SEMPRE WEB10 PARA ESTA PESQUISA
'    SqlConn% = FU_Conecta_Servidor(ID_PROD10)
    '************************************************************
    ' Inicializa a função.
    '************************************************************
    FU_ConsultaCotacaoporApoliceFR = ""
    '************************************************************
    ' Prepara a consulta  que deverá retornar as informações
    ' de formalização.
    '************************************************************
    cmdstr = " select "
    cmdstr = cmdstr & "  ep.u_ctc "
    cmdstr = cmdstr & "  from dbnprod..tb_ctl_emi_prp ep "
    cmdstr = cmdstr & "  Where ep.u_apo_pnc = " + u_apo_pnc
    cmdstr = cmdstr & "  and ep.c_cia_ita = " + c_cia_ita
    cmdstr = cmdstr & "  and ep.u_apo_dpd = " + u_apo_dpd
    cmdstr = cmdstr & "  and ep.c_rmo = " + c_rmo
    cmdstr = cmdstr & "  and ep.u_adi = 0 "
    cmdstr = cmdstr & "  and ep.u_vrs_adi = 1 "
    '************************************************************
    ' Prepara a execução  e valida retorno
    '************************************************************
    If SqlCmd(SqlConn, cmdstr) = FAIL Then Exit Function
    If SqlExec(SqlConn) = FAIL Then Exit Function
    retexec = SqlResults%(SqlConn%)
    Do Until retexec = NOMORERESULTS%
        If retexec = FAIL Then
            Exit Function
        End If
        While SqlNextRow(SqlConn%) <> NOMOREROWS
            '************************************************************
            ' Popula o retorno
            '************************************************************
            FU_ConsultaCotacaoporApoliceFR = SqlData(SqlConn%, 1)
        Wend
        retexec = SqlResults%(SqlConn%)
    Loop
    '************************************************************
    ' Processamento realizado com sucesso.
    '************************************************************
'    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
    Exit Function
    '************************************************************
    ' Área reservada para definição de tratamento de
    ' erros que podem ocorrer durante a execução.
    '************************************************************
Trata_Erro:
    MsgBox "Erro ao consultar número da cotação por apólice: " & Err & " - " & error$(Err) & ".", vbCritical
    FU_ConsultaCotacaoporApoliceFR = FAIL
    Exit Function
End Function

Public Function FU_ConsultaFormalizacaoApoliceFR(u_ctc As String, ByRef oR1CAB916 As R1CAB016, e_ass As String) As Integer
    '************************************************************
    ' Área reservada para definição de direcionamento de trata-
    ' mento de erro
    '************************************************************
    On Error GoTo Trata_Erro
    '************************************************************
    ' Área reservada para definição de variáveis e objetos.
    '************************************************************
    Dim retexec As Integer
    Dim cmdstr As String
    Dim n_linhas  As Integer
    'UTILIZAR SEMPRE WEB40 PARA ESTA PESQUISA
    SU_LogOff
    SqlConn% = FU_Conecta_Servidor(ID_WEB40)
    'Verificar essa conexão
    '************************************************************
    ' Inicializa a função.
    '************************************************************
    FU_ConsultaFormalizacaoApoliceFR = FAIL
    '************************************************************
    ' Prepara a procedure que deverá ser executada
    '************************************************************
    Ret% = SQLRPCInit%(SqlConn%, "DBNPROP..PR_FLR_SIT_S22440", 0)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcInit%, "PR_FLR_SIT_S22440"
        Exit Function
    End If
    '************************************************************
    ' Prepara os parâmetros da stored procedure
    '************************************************************
    'Passa parametros para Store Procedure
    If FU_Parametro(SqlConn, "@U_CTC", u_ctc, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@N_LINHAS", "", SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@C_ERR", "", SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@M_ERR", "", SQLVARCHAR) = FAIL% Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "FU_ConsultaFormalizacaoApoliceFR"
        Exit Function
    End If

    ' executa stored procedure
    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "FU_ConsultaFormalizacaoApoliceFR"
        Exit Function
    End If
    
    
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL%
        Do Until SqlNextRow(SqlConn%) = NOMOREROWS%
            oR1CAB916.d_hra_cfc_eln = SqlData(SqlConn%, 7)
            oR1CAB916.u_cfc_eln_prp = SqlData(SqlConn%, 1)
            oR1CAB916.c_idt_trn_eln = SqlData(SqlConn%, 10)
            oR1CAB916.n_cee_etd = SqlData(SqlConn%, 18)
            oR1CAB916.e_sit_cfc_eln = SqlData(SqlConn%, 17)
            e_ass = SqlData(SqlConn%, 24)
        Loop
        Ret% = SqlResults(SqlConn%)
        If Ret% = FAIL% Then
            su_erro_st_proc ST_SqlResults%, "FU_ConsultaFormalizacaoApoliceFR"
            Exit Function
        End If
    Loop
    n_linhas = SqlRetData(SqlConn%, 1)
    If Val(n_linhas) > 0 Then FU_ConsultaFormalizacaoApoliceFR = SUCCEED
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then FU_ConsultaFormalizacaoApoliceFR = FAIL
    '************************************************************
    ' Processamento realizado com sucesso.
    '************************************************************
    FU_ConsultaFormalizacaoApoliceFR = SUCCEED
    SU_LogOff
    su_fecha_conexao
    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
    Exit Function
    '************************************************************
    ' Área reservada para definição de tratamento de
    ' erros que podem ocorrer durante a execução.
    '************************************************************
Trata_Erro:
    MsgBox "Erro ao carregar dados de formalização: " & Err & " - " & error$(Err) & ".", vbCritical
    FU_ConsultaFormalizacaoApoliceFR = FAIL
    Exit Function
End Function
