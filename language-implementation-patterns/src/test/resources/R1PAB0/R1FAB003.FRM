VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MsFlxGrd.ocx"
Begin VB.Form R1FAB003 
   Appearance      =   0  'Flat
   Caption         =   "Consulta à Apolice - Número da Apólice"
   ClientHeight    =   6300
   ClientLeft      =   1065
   ClientTop       =   960
   ClientWidth     =   8580
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Icon            =   "R1FAB003.frx":0000
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6300
   ScaleWidth      =   8580
   Begin Threed.SSPanel PA3D_Topo 
      Align           =   1  'Align Top
      Height          =   705
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8580
      _Version        =   65536
      _ExtentX        =   15134
      _ExtentY        =   1244
      _StockProps     =   15
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderWidth     =   1
      BevelInner      =   1
      RoundedCorners  =   0   'False
      Alignment       =   8
      Begin Threed.SSCommand bu3d_imp_tla 
         Height          =   600
         Left            =   6900
         TabIndex        =   21
         Tag             =   "consulta"
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB003.frx":030A
      End
      Begin Threed.SSCommand bu3d_Volta 
         Height          =   600
         Left            =   7785
         TabIndex        =   1
         Tag             =   "sai"
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB003.frx":0624
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB003.frx":093E
         Top             =   120
         Width           =   1365
      End
   End
   Begin Threed.SSPanel pa3d_status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   2
      Top             =   5955
      Width           =   8580
      _Version        =   65536
      _ExtentX        =   15134
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB003"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.26
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BevelInner      =   1
      Alignment       =   1
      Autosize        =   1
   End
   Begin Threed.SSFrame fr3d_R1FAB003 
      Height          =   2430
      Left            =   200
      TabIndex        =   30
      Top             =   705
      Width           =   8175
      _Version        =   65536
      _ExtentX        =   14420
      _ExtentY        =   4286
      _StockProps     =   14
      Caption         =   "Endereço de Correspondência do Segurado"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Begin Threed.SSCommand bu3d_Cliente 
         Height          =   825
         Left            =   6690
         TabIndex        =   31
         Top             =   180
         Width           =   945
         _Version        =   65536
         _ExtentX        =   1667
         _ExtentY        =   1455
         _StockProps     =   78
         Caption         =   "Segurado"
         ForeColor       =   8388608
         Picture         =   "R1FAB003.frx":10B8
      End
      Begin VB.Label Label18 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "UF"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   7515
         TabIndex        =   49
         Top             =   1920
         Width           =   255
      End
      Begin VB.Label lb_s_uf 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   7500
         TabIndex        =   48
         Top             =   2115
         Width           =   525
      End
      Begin VB.Label Label16 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Estado"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   4275
         TabIndex        =   47
         Top             =   1920
         Width           =   600
      End
      Begin VB.Label Label15 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "CEP"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   135
         TabIndex        =   46
         Top             =   1920
         Width           =   375
      End
      Begin VB.Label Label14 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Cidade"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1215
         TabIndex        =   45
         Top             =   1920
         Width           =   600
      End
      Begin VB.Label lb_n_loc 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1215
         TabIndex        =   44
         Top             =   2115
         Width           =   2955
      End
      Begin VB.Label lb_c_cep 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   120
         TabIndex        =   43
         Top             =   2115
         Width           =   975
      End
      Begin VB.Label lb_n_uf 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   4275
         TabIndex        =   42
         Top             =   2115
         Width           =   3135
      End
      Begin VB.Label Label10 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   " Bairro"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   4245
         TabIndex        =   41
         Top             =   1380
         Width           =   570
      End
      Begin VB.Label Label9 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Número"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   135
         TabIndex        =   40
         Top             =   1380
         Width           =   660
      End
      Begin VB.Label Label8 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Complemento"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1185
         TabIndex        =   39
         Top             =   1380
         Width           =   1140
      End
      Begin VB.Label lb_n_cpl 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1200
         TabIndex        =   38
         Top             =   1605
         Width           =   2985
      End
      Begin VB.Label lb_u_lgd 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   135
         TabIndex        =   37
         Top             =   1605
         Width           =   975
      End
      Begin VB.Label lb_n_bai 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   4290
         TabIndex        =   36
         Top             =   1605
         Width           =   3735
      End
      Begin VB.Label lb_n_lgd 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   135
         TabIndex        =   35
         Top             =   1065
         Width           =   7905
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Logradouro"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   135
         TabIndex        =   34
         Top             =   840
         Width           =   975
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Nome"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   120
         TabIndex        =   33
         Top             =   300
         Width           =   495
      End
      Begin VB.Label lb_n_pes 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   120
         TabIndex        =   32
         Top             =   540
         Width           =   5895
      End
   End
   Begin Threed.SSFrame fr3d_dest_doc 
      Height          =   2685
      Left            =   200
      TabIndex        =   22
      Top             =   3180
      Width           =   8175
      _Version        =   65536
      _ExtentX        =   14420
      _ExtentY        =   4736
      _StockProps     =   14
      Caption         =   "Destino dos Documentos"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Begin Threed.SSCommand bu3d_Destino 
         Height          =   885
         Left            =   6660
         TabIndex        =   25
         Top             =   300
         Width           =   945
         _Version        =   65536
         _ExtentX        =   1667
         _ExtentY        =   1561
         _StockProps     =   78
         ForeColor       =   8388608
         Picture         =   "R1FAB003.frx":13D2
      End
      Begin VB.Label lb_destino 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   930
         TabIndex        =   23
         Top             =   300
         Width           =   5055
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Destino"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   90
         TabIndex        =   24
         Top             =   300
         Width           =   660
      End
      Begin VB.Label Label27 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "UF"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   7575
         TabIndex        =   3
         Top             =   2190
         Width           =   255
      End
      Begin VB.Label lb_s_uf_dest 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   7560
         TabIndex        =   4
         Top             =   2385
         Width           =   525
      End
      Begin VB.Label Label25 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Estado"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   4245
         TabIndex        =   5
         Top             =   2190
         Width           =   600
      End
      Begin VB.Label Label24 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "CEP"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   105
         TabIndex        =   6
         Top             =   2190
         Width           =   375
      End
      Begin VB.Label Label23 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Cidade"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1185
         TabIndex        =   7
         Top             =   2190
         Width           =   600
      End
      Begin VB.Label lb_n_loc_dest 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1185
         TabIndex        =   8
         Top             =   2385
         Width           =   2955
      End
      Begin VB.Label lb_c_cep_dest 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   90
         TabIndex        =   9
         Top             =   2385
         Width           =   975
      End
      Begin VB.Label lb_n_uf_dest 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   4245
         TabIndex        =   10
         Top             =   2385
         Width           =   3225
      End
      Begin VB.Label Label19 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   " Bairro"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   4245
         TabIndex        =   11
         Top             =   1650
         Width           =   570
      End
      Begin VB.Label Label17 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Número"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   105
         TabIndex        =   12
         Top             =   1650
         Width           =   660
      End
      Begin VB.Label Label13 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Complemento"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1155
         TabIndex        =   13
         Top             =   1650
         Width           =   1140
      End
      Begin VB.Label lb_n_cpl_dest 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1170
         TabIndex        =   14
         Top             =   1875
         Width           =   2985
      End
      Begin VB.Label lb_u_lgd_dest 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   105
         TabIndex        =   15
         Top             =   1875
         Width           =   975
      End
      Begin VB.Label lb_n_bai_dest 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   4260
         TabIndex        =   16
         Top             =   1875
         Width           =   3825
      End
      Begin VB.Label lb_n_lgd_dest 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   105
         TabIndex        =   17
         Top             =   1335
         Width           =   7965
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Logradouro"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   90
         TabIndex        =   18
         Top             =   1110
         Width           =   975
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Nome"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   90
         TabIndex        =   19
         Top             =   600
         Width           =   495
      End
      Begin VB.Label lb_nom_dest 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   90
         TabIndex        =   20
         Top             =   810
         Width           =   5925
      End
   End
   Begin Threed.SSFrame fr3d_dph_inf 
      Height          =   2685
      Left            =   200
      TabIndex        =   26
      Top             =   3150
      Visible         =   0   'False
      Width           =   8175
      _Version        =   65536
      _ExtentX        =   14420
      _ExtentY        =   4736
      _StockProps     =   14
      Caption         =   "Destino dos documentos"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Begin VB.TextBox txt_dph_inf 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H00800000&
         Height          =   1755
         Left            =   240
         MultiLine       =   1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   27
         Top             =   810
         Width           =   7755
      End
      Begin VB.Label Label7 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Destino"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   270
         TabIndex        =   29
         Top             =   390
         Width           =   660
      End
      Begin VB.Label lb_destino_inf 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1110
         TabIndex        =   28
         Top             =   420
         Width           =   5055
      End
   End
   Begin Threed.SSFrame fr3d_ema_apo 
      Height          =   5190
      Left            =   0
      TabIndex        =   50
      Top             =   705
      Visible         =   0   'False
      Width           =   8535
      _Version        =   65536
      _ExtentX        =   15055
      _ExtentY        =   9155
      _StockProps     =   14
      Caption         =   "E-Mails da apólice"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Begin MSFlexGridLib.MSFlexGrid Flx_ema_apo 
         Height          =   4725
         Left            =   45
         TabIndex        =   51
         Top             =   360
         Width           =   8400
         _ExtentX        =   14817
         _ExtentY        =   8334
         _Version        =   393216
         Cols            =   4
         FixedCols       =   0
         ForeColor       =   8388608
         ForeColorFixed  =   8388608
         GridColor       =   0
         FocusRect       =   0
         HighLight       =   0
         SelectionMode   =   1
         AllowUserResizing=   1
         Appearance      =   0
         FormatString    =   "^E-Mail                                                                        |^Ativo |^Incluído\Alterado |^Data           "
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
End
Attribute VB_Name = "R1FAB003"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ***************** Endereço para Correspondência ********************


Option Explicit

Dim c_idt_pes_aux As String
Dim c_idt_pes_pgd As String     'Pagador
Dim c_idt_pes_ncl As String     'Núcleo
Dim c_idt_pes_cor As String     'Corretor
Dim c_idt_ptc_pes As String      'Tomador/Garantido

Dim n_pes_dest  As String
Dim n_lgd_dest  As String
Dim u_lgd_dest  As String
Dim n_cpl_dest  As String
Dim n_bai_dest  As String
Dim c_cep_dest  As String
Dim n_loc_dest  As String
Dim n_uf_dest   As String
Dim s_uf_dest   As String

Dim n_linhas As Integer
Dim n_uog_i As String

Dim c_psl_i()
Dim i_psl_pnc_i()

Function FU_SEL_HIS_PTC_PES_S08676() As Integer

    ' seleciona nome do produto da apólice

Dim ret As Integer
Dim cod_err As Integer

    FU_SEL_HIS_PTC_PES_S08676 = False

    ' inicializa stored procedure
    ret% = SQLRPCInit%(SqlConn%, "dbnseg..pr_his_ptc_pes_s08676", 0)
    If ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcInit%, "FU_SEL_HIS_PTC_PES_S08676"
        Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", U_ADI$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_adi", U_VRS_ADI$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_idt_pes_ref", 0, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_pes", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_lgd", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@u_lgd", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@cod_err", 0, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@msg_err", "", SQLCHAR%) = FAIL% Then Exit Function
    
    If FU_Parametro_Ret(SqlConn, "@n_cpl", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_bai", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_loc", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_cep", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_cxp", 0, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@e_end", 0, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@s_uf", "", SQLCHAR%) = FAIL% Then Exit Function
    
    If FU_Parametro_Ret(SqlConn, "@c_loc", 0, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_uf", "", SQLCHAR%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_pas", 0, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_uf", 0, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@u_ocr_l_atu", 0, SQLINT2%) = FAIL% Then Exit Function
    
    ' envia comandos
    ret% = SQLRPCSend%(SqlConn%)
    If ret% = FAIL Then
        su_erro_st_proc ST_SqlRpcSend%, "FU_SEL_HIS_PTC_PES_S08676"
        Exit Function
    End If

    ' executa stored procedure
    ret% = SqlOk%(SqlConn%)
    If ret% = FAIL Then
        su_erro_st_proc ST_SqlOk%, "FU_SEL_HIS_PTC_PES_S08676"
        Exit Function
    End If

    ' verifica resultados
    ret% = SqlResults(SqlConn%)
    If ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "FU_SEL_HIS_PTC_PES_S08676"
        Exit Function
    End If

    ' processa resultados
    Do Until ret% = NOMORERESULTS% Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)
        
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            ret% = SqlNextRow%(SqlConn%)
        Loop

        ret% = SqlResults%(SqlConn%)
    Loop

    If ret% = FAIL Then
        su_erro_st_proc ST_SqlResults%, "FU_SEL_HIS_PTC_PES_S08676"
        Exit Function
    End If

    cod_err = Val(SqlRetData$(SqlConn%, 5))

    'O parâmetro OUTPUT da stored procedure indica ocorrência de erro.
    If cod_err = 10 Then
        Exit Function
    ElseIf cod_err <> 0 And cod_err <> 10 Then
        'Exibição da mensagem de erro ao usuário.
        MsgBox "Erro na dbnseg..pr_his_ptc_pes_s08676: parâmetro @error = " & Trim$(Trim$(SqlRetData$(SqlConn%, 6))) & ".", MB_ICONEXCLAMATION
        Exit Function
    End If

    c_idt_ptc_pes$ = Trim$(SqlRetData$(SqlConn%, 1))
    n_pes_dest$ = UCase$(Trim$(SqlRetData$(SqlConn%, 2)))
    n_lgd_dest$ = UCase$(Trim$(SqlRetData$(SqlConn%, 3)))
    u_lgd_dest$ = UCase$(Trim$(SqlRetData$(SqlConn%, 4)))
    n_cpl_dest$ = UCase$(Trim$(SqlRetData$(SqlConn%, 7)))
    n_bai_dest$ = UCase$(Trim$(SqlRetData$(SqlConn%, 8)))
    n_loc_dest$ = UCase$(Trim$(SqlRetData$(SqlConn%, 9)))
    c_cep_dest$ = UCase$(Trim$(SqlRetData$(SqlConn%, 10)))
    s_uf_dest$ = UCase$(Trim$(SqlRetData$(SqlConn%, 13)))
    n_uf_dest$ = UCase$(Trim$(SqlRetData$(SqlConn%, 15)))
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function
    
    FU_SEL_HIS_PTC_PES_S08676 = True

End Function

Private Sub bu3d_Cliente_Click()

' chamada ao projeto Cliente

' executável
Dim vl_ArqExec      As String

' área de transferência
Dim vl_TextoClipb   As String

' retorno da função
Dim iExecOk         As Integer

    'vl_ArqExec$ = "pepge001.exe R1" 'v60 Emilio 22/08/2006

    vl_TextoClipb$ = "R1#"
    vl_TextoClipb$ = vl_TextoClipb$ + Format$(Val(c_rmo$), "##") + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + Format$(Val(c_pro$), "###") + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + Format$(Val(c_idt_pes$), "########") + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + Format$(e_pes$, "#") + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + "0#"
    vl_TextoClipb$ = vl_TextoClipb$ + n_pes$ + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + "A#"
    vl_TextoClipb$ = vl_TextoClipb$ + "PE#"
    
    Clipboard.Clear
    Clipboard.SetText vl_TextoClipb$
    
    ' fecha conexão para a chamada de outro projeto
    su_fecha_conexao
    
    Refresh
    'Me.Hide
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '======================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        iExecOk% = FU_Monitora_Exec(Me, vl_ArqExec$ & " ")
'    Else
'        iExecOk% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + vl_ArqExec$ & " ", MinEnableFalse%)
'    End If
    vl_ArqExec$ = "PEPGE001.EXE"
    iExecOk% = FU_MonitoraExe(Me, "", vl_ArqExec$, "R1", , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not iExecOk% Then
        MsgBox "Não foi possível executar o projeto" & Chr(13) & vl_ArqExec$ & " - PROJETO DE CLIENTE", 48
    End If

    ' executa outro projeto
    'iExecOk% = FU_Monitora_Exec(Me, vl_ArqExec$ & " ")
    'If Not iExecOk% Then
    '    MsgBox "Opção ainda não disponível ('" & vl_ArqExec$ & "').", MB_ICONEXCLAMATION
    'End If

    'LUCIANE - 05/07/1999
    '======================================================================
    
    ' reestabelece conexão após a execução de outro projeto
    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
    
    Me.Show

    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_Cliente_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB003 - Dados do Cliente"

End Sub

Private Sub bu3d_Destino_Click()

' chamada ao projeto Cliente

' executável
Dim vl_ArqExec      As String

' área de transferência
Dim vl_TextoClipb   As String

' retorno da função
Dim iExecOk         As Integer

    'vl_ArqExec$ = "pepge001.exe R1" 'v60 Emilio 22/08/2006

    vl_TextoClipb$ = "R1#"
    vl_TextoClipb$ = vl_TextoClipb$ + Format$(Val(c_rmo$), "##") + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + Format$(Val(c_pro$), "###") + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + Format$(Val(c_idt_pes_aux$), "########") + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + Format$(e_pes$, "#") + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + "0#"
    vl_TextoClipb$ = vl_TextoClipb$ + n_pes$ + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + "#"
    vl_TextoClipb$ = vl_TextoClipb$ + "A#"
    vl_TextoClipb$ = vl_TextoClipb$ + "PE#"
    
    Clipboard.Clear
    Clipboard.SetText vl_TextoClipb$
    
    ' fecha conexão para a chamada de outro projeto
    su_fecha_conexao
    
    Refresh
    'Me.Hide
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '======================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        iExecOk% = FU_Monitora_Exec(Me, vl_ArqExec$ & " ")
'    Else
'        iExecOk% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + vl_ArqExec$ & " ", MinEnableFalse%)
'    End If
    vl_ArqExec$ = "PEPGE001.EXE"
    iExecOk% = FU_MonitoraExe(Me, "", vl_ArqExec$, "R1", , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not iExecOk% Then
        MsgBox "Não foi possível executar o projeto" & Chr(13) & vl_ArqExec$ & " - PROJETO DE CLIENTE", 48
    End If

    ' executa outro projeto
    'iExecOk% = FU_Monitora_Exec(Me, vl_ArqExec$ & " ")
    'If Not iExecOk% Then
    '    MsgBox "Opção ainda não disponível ('" & vl_ArqExec$ & "').", MB_ICONEXCLAMATION
    'End If

    'LUCIANE - 05/07/1999
    '======================================================================
    
    ' reestabelece conexão após a execução de outro projeto
    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
    
    Me.Show

    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_imp_tla_Click()

    ' impressão de tela
    su_imp_tla

End Sub

Private Sub bu3d_imp_tla_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB003 - Impressão de tela"

End Sub

Private Sub BU3D_Volta_Click()
    
    ' retorno para 2a. tela
    volta% = True

    R1FAB002.Show
    Me.Hide

End Sub

Private Sub bu3d_Volta_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB003 - Retorna à tela anterior"

End Sub

Private Sub Form_Activate()

' utilizado para preencher controles
Dim Texto   As String
Dim pos     As Integer

    Screen.MousePointer = HOURGLASS

    Texto$ = Format$(Val(c_cia_ita$), "##") + "."
    Texto$ = Texto$ + Format$(Val(c_rmo$), "##") + "."
    Texto$ = Texto$ + Format(Val(u_apo_pnc$), "000000000")
    
    Me.Caption = "Consulta à apólice - " & Texto$
    
    'SS 142183 RS 1549 - Renato Santos 17/08/2011
    fr3d_ema_apo.Visible = False
      
    lb_n_pes.Caption = " " & UCase(n_pes$)
    
    ' seleciona dados de correspondência
    If Not fu_sel_l() Then
        MsgBox "Não foi possível localizar os dados para Correspondência.", MB_ICONEXCLAMATION, "ATENÇÃO"
    End If

    fr3d_dest_doc.Visible = True
    
    'Fabio - 08/05/2000 - Selecionando dados de acordo com o Aditamento selecionado
    If R1FAB002.cb_u_adi.ListIndex = 0 Then
        pos% = UBound(dad_adi)
    Else
        pos% = R1FAB002.cb_u_adi.ListIndex - 1
    End If

    
    'Luciane - 19/07/1999 - Início
    'Mostra o destino dos documentos de apólice
    Select Case dad_adi(pos%).c_dph_doc_apo
        Case 1  'SEGURADO
            c_idt_pes_aux$ = c_idt_pes$
            bu3d_Destino.Caption = "Segurado"
            
        Case 2  'NUCLEO
            fr3d_dest_doc.Visible = False
            fr3d_dph_inf.Visible = True
            txt_dph_inf.Text = ""

            lb_destino_inf.Caption = "NÚCLEO"

        Case 3  'CORRETOR
            If Not fu_sel_corretor() Then
                MsgBox "Não foi possível localizar os dados para Correspondência - Corretor.", MB_ICONEXCLAMATION, "ATENÇÃO"
                Screen.MousePointer = DEFAULT
                Exit Sub
            End If

            c_idt_pes_aux$ = c_idt_pes_cor$
            bu3d_Destino.Caption = "Corretor"

        Case 4  'PAGADOR
            If Not fu_sel_pagador() Then
                MsgBox "Não foi possível localizar os dados para Correspondência - Pagador.", MB_ICONEXCLAMATION, "ATENÇÃO"
                Screen.MousePointer = DEFAULT
                Exit Sub
            End If

            c_idt_pes_aux$ = c_idt_pes_pgd$
            bu3d_Destino.Caption = "Pagador"

        Case 5, 9   'ÓRGÃO PRODUTOR (5)  INFORMADO (9)
            
            fr3d_dest_doc.Visible = False
            fr3d_dph_inf.Visible = True
            txt_dph_inf.Text = ""

            If dad_adi(pos%).c_dph_doc_apo = 5 Then

                'bu3d_Destino.Caption = "Órg. Prod."
                lb_destino_inf = "ÓRGÃO PRODUTOR"

                If Not fu_sel_org_prod() Then
                    MsgBox "Não foi possível localizar os dados para Correspondência - Órgão Produtor.", MB_ICONEXCLAMATION, "ATENÇÃO"
                    Screen.MousePointer = DEFAULT
                    Exit Sub
                End If
    
                su_fecha_conexao
                SqlConn% = FU_Conecta_Servidor(SERV_CONSAPO_ID)
                
                If fu_Pesq_Unid_Organiz() = False Then SU_Saida
                
                su_fecha_conexao
                
                SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
                
                txt_dph_inf.Text = n_uog_i$
              
            ElseIf dad_adi(pos%).c_dph_doc_apo = 9 Then

                lb_destino_inf = "INFORMADO"
                
                '-- v066 Renato 12/12/2007 - SSI 38728 - Inicio
                If Not FU_sel_dst_doc_apo() Then
                    MsgBox Mensagem$, MB_ICONEXCLAMATION, "ATENÇÃO"
                    Screen.MousePointer = DEFAULT
                    Exit Sub
                End If
            End If
        
        Case 6, 7, 8  'SUB-RESPONS. (6), CENTRO PAGADOR (7), RESP. NEGÓCIO (8)

            fr3d_dest_doc.Visible = False
            fr3d_dph_inf.Visible = True
            txt_dph_inf.Text = ""

            If dad_adi(pos%).c_dph_doc_apo = 6 Then
                lb_destino_inf.Caption = "SUB-RESPONSÁVEL DO NEGÓCIO"
            ElseIf dad_adi(pos%).c_dph_doc_apo = 7 Then
                lb_destino_inf.Caption = "CENTRO PAGADOR"
            ElseIf dad_adi(pos%).c_dph_doc_apo = 8 Then
                lb_destino_inf.Caption = "RESPONSÁVEL DO NEGÓCIO"
            End If
        Case 10  'TOMADOR/GARANTIDO
            If Val(e_ptc_pes$) = 2 Or Val(e_ptc_pes$) = 3 Then
                If Val(e_ptc_pes$) = 2 Then
                    bu3d_Destino.Caption = "Tomador"
                Else
                    bu3d_Destino.Caption = "Garantido"
                End If
            End If

            If Not FU_SEL_HIS_PTC_PES_S08676() Then
                MsgBox "Erro na função FU_SEL_HIS_PTC_PES_S08676", MB_ICONEXCLAMATION, "ATENÇÃO"
                Screen.MousePointer = DEFAULT
                Exit Sub
            End If

            c_idt_pes_aux$ = c_idt_ptc_pes$

            lb_n_lgd_dest.Caption = " " & n_lgd_dest$
            lb_n_cpl_dest.Caption = " " & n_cpl_dest$
            lb_u_lgd_dest.Caption = " " & u_lgd_dest$
            lb_n_bai_dest.Caption = " " & n_bai_dest$
            lb_c_cep_dest.Caption = " " & c_cep_dest$
            lb_n_loc_dest.Caption = " " & n_loc_dest$
            lb_n_uf_dest.Caption = " " & n_uf_dest$
            lb_s_uf_dest.Caption = " " & s_uf_dest$
            
        Case 11  'ELETRONICO
        
            fr3d_ema_apo.Visible = True
            fr3d_ema_apo.ZOrder (0)
            
            If Not FU_PR_EMA_APO_S19730(c_cia_ita$, c_rmo$, u_apo_pnc$, "0", Flx_ema_apo) Then
                MsgBox "Erro ao selecionar E-mails da apólice", MB_ICONEXCLAMATION, "ATENÇÃO"
                Screen.MousePointer = DEFAULT
                Exit Sub
            End If

    End Select

    lb_destino.Caption = UCase(bu3d_Destino.Caption)
    u_ocr_l_dest$ = u_ocr_l_crs$

    'Se c_dph_doc_apo = 1 (Segurado) ou c_dph_doc_apo = 3 (Corretor) ou c_dph_doc_apo = 4 (Pagador),
    'precisa acessar o nome e o endereço
    If dad_adi(pos%).c_dph_doc_apo = 1 Or dad_adi(pos%).c_dph_doc_apo = 3 Or dad_adi(pos%).c_dph_doc_apo = 4 Then
        If Not fu_acessa_pes_dest(c_idt_pes_aux$) Then
            MsgBox "Não foi possível acessar pessoa.", MB_ICONEXCLAMATION, "ATENÇÃO"
            Screen.MousePointer = DEFAULT
            Exit Sub
        End If
        
        'Se c_dph_doc_apo = 3 (corretor), obter U_OCR_L na tabela DBNPESSO..TB_PES_FIG_L
        If dad_adi(pos%).c_dph_doc_apo = 3 Then
            If Not PR_PES_FIG_L_S07567() Then
                MsgBox "Ocorreu um erro na função PR_PES_FIG_L_S07567.", MB_ICONEXCLAMATION, "ATENÇÃO"
                Screen.MousePointer = DEFAULT
                Exit Sub
            End If
        End If

        ' seleciona dados de correspondência
        If Not fu_sel_l_dest(c_idt_pes_aux) Then
            MsgBox "Não foi possível localizar os dados para Correspondência.", MB_ICONEXCLAMATION, "ATENÇÃO"
            Screen.MousePointer = DEFAULT
            Exit Sub
        End If
    End If

    lb_nom_dest.Caption = " " & UCase(n_pes_dest$)
    'Luciane - 19/07/1999 - Fim

    Screen.MousePointer = DEFAULT
End Sub

Function FU_sel_dst_doc_apo() As Integer

Dim c_err         As Integer
Dim n_linhas      As Integer

    'Habilitação da rotina de tratamento de erro.
    On Error GoTo TrataErroS16793

    'Inicialização da função com valor False.
    FU_sel_dst_doc_apo = False

    'Inicialização dos códigos de erro
    'da DBLibrary e do SQL Server.
    Err_Syb& = 0
    Msg_Syb& = 0

    'Inicialização da stored procedure.
    ret% = SQLRPCInit%(SqlConn%, "DBNPROD..PR_ADI_S16793", 0)

    If ret% = FAIL Then
        MsgBox "Não foi possível inicializar a stored procedure PR_ADI_S16793.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Parâmetro(s) da stored procedure.
    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", U_ADI$, SQLINT4%) = FAIL Then Exit Function
    
    If FU_Parametro_Ret(SqlConn, "@n_dst_doc_apo", "", SQLVARCHAR%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_err", 0, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT4%) = FAIL Then Exit Function

    'Envio da lista de parâmetros ao servidor para ser executada.
    ret% = SQLRPCSend%(SqlConn%)

    If ret% = FAIL Then
        MsgBox "Não foi possível enviar a lista de parâmetros da stored procedure PR_ADI_S16793 ao servidor.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Verificação da exatidão dos comandos no command buffer.
    ret% = SqlOk%(SqlConn%)

    If ret% = FAIL Then
        MsgBox "Não foi possível executar a stored procedure PR_ADI_S16793.", MB_ICONEXCLAMATION
        Exit Function
    End If

    ret% = SqlResults%(SqlConn%)

    'Processamento dos resultados da stored procedure.
    Do Until ret% = NOMORERESULTS Or ret% = FAIL

        ret% = SqlNextRow%(SqlConn%)

        'Recuperação e processamento dos dados em cada linha.
        Do Until ret% = NOMOREROWS Or ret% = FAIL

            ret% = SqlNextRow%(SqlConn%)

        Loop

        ret% = SqlResults%(SqlConn%)

    Loop

    If ret% = FAIL Then
        MsgBox "Não foi possível processar os resultados da stored procedure PR_ADI_S16793.", MB_ICONEXCLAMATION
        Exit Function
    End If

    'Erro da DBLibrary ou do SQL Server.
    If (Err_Syb& <> 0) Or (Msg_Syb& <> 0) Then Exit Function

    'Nome \ Area do destinatario dos documentos
    txt_dph_inf.Text = Trim(SqlRetData$(SqlConn%, 1))
    'Recuperação do código do erro na variável local.
    c_err% = Val(SqlRetData$(SqlConn%, 2))
    'Armazenamento do nº de linhas afetadas
    'pelo comando na variável local.
    n_linhas% = Val(SqlRetData$(SqlConn%, 3))

    'O parâmetro OUTPUT da stored procedure indica ocorrência de erro.
    If c_err% <> 0 Then
        'Exibição da mensagem de erro ao usuário.
        Mensagem$ = "Erro " & Trim$(Str$(c_err%)) & " - Não foi possível localizar os dados para Correspondência - Responsável pelo Negócio."
        Exit Function
    End If
    
    'A função retorna valor True.
    FU_sel_dst_doc_apo = True

    Exit Function

'Rotina de tratamento de erro.
TrataErroS16793:

    MsgBox "Erro na function FU_PR_ADI_S16793: #" & Err & " - " & error$(Err) & ".", MB_ICONEXCLAMATION
    Exit Function

End Function

Private Sub Form_DblClick()
    
    MsgBox sg_versao$, MB_ICONINFORMATION, "VERSÃO"

End Sub

Private Sub Form_Load()
    
    Show
    
    SU_Ajusta_Form Me, 4

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, Unloadmode As Integer)
    
    Ind_UnloadMode = Unloadmode
    Cancel = FU_Verifica_Saida(Unloadmode, Me)

End Sub

Private Sub Form_Unload(Cancel As Integer)

'20/11/1998 - Luciane/Hirata
'Comando IF foi colocado devido a conversão de VB3 para VB5, porque o VB5
'não permite que o botão minimizar apareça, sem que o control box esteja
'habilitado.
'Houve a necessidade controlar o fechamento do form via control box, para
'que conexões e bibliotecas não permanecessem abertas.

    If Ind_UnloadMode = 0 Then
        
        If BU3D_Volta.Enabled = True Then
            BU3D_Volta_Click
        Else
            Cancel = True
        End If
    
    End If

End Sub

Private Function fu_acessa_pes_dest(c_idt_pes As String) As Integer
    
    ' seleciona nome correspondente ao código da pessoa

Dim ret     As Integer

    fu_acessa_pes_dest = False
    
    ' inicializa stored procedure
    ret% = SQLRPCInit%(SqlConn%, "prod30.dbnpesso..pr_pes_s01056", 0)
    If ret% = FAIL Then
       su_erro_st_proc ST_SqlRpcInit%, "fu_acessa_pes_dest"
       Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_idt_pes", c_idt_pes$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_pes", "", SQLCHAR%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_rtn", "", SQLINT2%) = FAIL Then Exit Function
    
    ' envia comando
    ret% = SQLRPCSend%(SqlConn%)
    If ret% = FAIL% Then
       su_erro_st_proc ST_SqlRpcSend%, "fu_acessa_pes_dest"
       Exit Function
    End If
    
    ' executa stored procedure
    ret% = SqlOk%(SqlConn%)
    If ret% = FAIL% Then
       su_erro_st_proc ST_SqlOk%, "fu_acessa_pes_dest"
       Exit Function
    End If
    
    ' verifica resultados
    ret% = SqlResults%(SqlConn%)
    If ret% = FAIL% Then
       su_erro_st_proc ST_SqlResults%, "fu_acessa_pes_dest"
       Exit Function
    End If
    
    ' processa resultados
    Do Until ret% = NOMORERESULTS% Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            ret% = SqlNextRow%(SqlConn%)
        Loop
        ret% = SqlResults%(SqlConn%)
    Loop

    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_acessa_pes_dest"
        Exit Function
    End If
    
    n_pes_dest$ = Trim(SqlRetData$(SqlConn%, 1))

    If Val(SqlRetData$(SqlConn%, 2)) <> 0 Then
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function

    fu_acessa_pes_dest = True
    
End Function

Private Function fu_Pesq_Unid_Organiz()

Dim ret%
Dim i%

    fu_Pesq_Unid_Organiz = False
    
    Screen.MousePointer = HOURGLASS

    For i = 1 To n_linhas
        If i_psl_pnc_i(i%) = "S" Then

            If SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_UOG_S02489", 0) = FAIL% Then
                MsgBox "Não foi possivel iniciar a Stored Procedure DBNAPOIO..PR_UOG_S02489"
                Exit Function
            End If
        
            If FU_Parametro(SqlConn, "@c_psl", c_psl_i(i), SQLINT4%) = FAIL% Then Exit Function
            
            ret% = SQLRPCSend%(SqlConn%)
            If ret% = FAIL% Then
                MsgBox "Houve problemas no envio do comando: DBNAPOIO..PR_UOG_S02489.", 48, "ATENÇÃO"
                SU_Saida
            End If
            
            ret% = SqlOk%(SqlConn%)
            If ret% = FAIL% Then
                MsgBox "Houve problemas na execução da Stored Procedure: DBNAPOIO..PR_UOG_S02489.", 48, "ATENÇÃO"
                SU_Saida
            End If
            
            ret% = SqlResults%(SqlConn%)
    
            Do Until ret% = NOMORERESULTS% Or ret% = FAIL
                ret% = SqlNextRow%(SqlConn%)
                
                Do Until ret% = NOMOREROWS% Or ret% = FAIL
                    n_uog_i = SqlData$(SqlConn%, 2)
                    ret% = SqlNextRow%(SqlConn%)
                Loop
        
                ret% = SqlResults%(SqlConn%)
            Loop
        
            If ret% = FAIL Then
                MsgBox "Não foi possível colher resultados - DBNAPOIO..PR_UOG_S02489.", 48
                Exit Function
            End If
        End If
    Next i

    If ret% = NOMORERESULTS% Then fu_Pesq_Unid_Organiz = True
    Screen.MousePointer = DEFAULT

    'Verifica o status de erro.
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_Pesq_Unid_Organiz = False

End Function

Private Function fu_sel_corretor() As Integer

Dim ret     As Integer
Dim msg_err As String

    fu_sel_corretor = False
    
    ' inicializa stored procedure
    ret% = SQLRPCInit%(SqlConn%, "PROD30.DBNPESSO..PR_CVD_S00560", 0)
    If ret% = FAIL Then
       su_erro_st_proc ST_SqlRpcInit%, "fu_sel_corretor"
       Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@u_rgt_ssp", u_rgt_ssp_prp$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_dac_rgt_ssp", u_dco_rgt_ssp_prp$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_loc_pgt_cvd", c_loc_pgt_cvd_prp$, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@c_idt_pes", 0, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT2%) = FAIL Then Exit Function
    
    ' envia comando
    ret% = SQLRPCSend%(SqlConn%)
    If ret% = FAIL% Then
       su_erro_st_proc ST_SqlRpcSend%, "fu_sel_corretor"
       Exit Function
    End If
    
    ' executa stored procedure
    ret% = SqlOk%(SqlConn%)
    If ret% = FAIL% Then
       su_erro_st_proc ST_SqlOk%, "fu_sel_corretor"
       Exit Function
    End If
    
    ' verifica resultados
    ret% = SqlResults%(SqlConn%)
    If ret% = FAIL% Then
       su_erro_st_proc ST_SqlResults%, "fu_sel_corretor"
       Exit Function
    End If
    
    ' processa resultados
    Do Until ret% = NOMORERESULTS% Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            ret% = SqlNextRow%(SqlConn%)
        Loop
        ret% = SqlResults%(SqlConn%)
    Loop

    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_corretor"
        Exit Function
    End If
    
    c_idt_pes_cor$ = SqlRetData$(SqlConn%, 1)
    
    If Val(SqlRetData$(SqlConn%, 2)) = 0 Then
        Exit Function
    End If
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function

    fu_sel_corretor = True

End Function

Private Function fu_sel_org_prod() As Integer

Dim ret%
Dim Contador%

    fu_sel_org_prod = False

    Screen.MousePointer = HOURGLASS

    If SQLRPCInit%(SqlConn%, "DBNPROD..pr_his_ptc_uog_s07359", 0) = FAIL% Then
        MsgBox "Não foi possivel iniciar a Stored Procedure DBNPROD..pr_his_ptc_uog_s07359"
        Exit Function
    End If

    If FU_Parametro(SqlConn, "@c_cia_ita", c_cia_ita, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@c_rmo", c_rmo, SQLINT2%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_pnc", u_apo_pnc, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_apo_dpd", u_apo_dpd, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_adi", U_ADI, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro(SqlConn, "@u_vrs_adi", U_VRS_ADI, SQLINT4%) = FAIL% Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", 0, SQLINT2%) = FAIL% Then Exit Function

    ret% = SQLRPCSend%(SqlConn%)
    If ret% = FAIL% Then
        MsgBox "Houve problemas no envio do comando : DBNPROD..pr_his_ptc_uog_s07359.", 48, "ATENÇÃO"
        SU_Saida
    End If

    ret% = SqlOk%(SqlConn%)
    If ret% = FAIL% Then
        MsgBox "Houve problemas na execução da Stored Procedure : DBNPROD..pr_his_ptc_uog_s07359.", 48, "ATENÇÃO"
        End
    End If

    Contador% = 0
    ReDim c_psl_i(Contador%)
    ReDim o_ptc_psl_i(Contador%)
    ReDim i_psl_pnc_i(Contador%)

    Contador% = 1

    ret% = SqlResults%(SqlConn%)
    Do Until ret% = NOMORERESULTS% Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)

        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            ReDim Preserve c_psl_i(Contador%)
            ReDim Preserve o_ptc_psl_i(Contador%)
            ReDim Preserve i_psl_pnc_i(Contador%)

            c_psl_i(Contador%) = SqlData$(SqlConn%, 10)
            o_ptc_psl_i(Contador%) = SqlData$(SqlConn%, 15)
            i_psl_pnc_i(Contador%) = SqlData$(SqlConn%, 16)

            Contador% = Contador% + 1

            ret% = SqlNextRow%(SqlConn%)
        Loop

        ret% = SqlResults%(SqlConn%)
    Loop

    If ret% = FAIL Then
        MsgBox "Não foi possível colher resultados - fu_sel_org_prod.", 48
        Exit Function
    End If

    n_linhas = Val(SqlRetData$(SqlConn%, 1))

    If ret% = NOMORERESULTS% Then fu_sel_org_prod = True
    Screen.MousePointer = DEFAULT

    'Verifica o status de erro.
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then fu_sel_org_prod = False

End Function

Private Function fu_sel_pagador() As Integer

Dim ret     As Integer

    fu_sel_pagador = False
    
    ' inicializa stored procedure
    ret% = SQLRPCInit%(SqlConn%, "DBNPROD..PR_PGD_APO_S03373", 0)
    If ret% = FAIL Then
       su_erro_st_proc ST_SqlRpcInit%, "fu_sel_pagador"
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
       su_erro_st_proc ST_SqlRpcSend%, "fu_sel_pagador"
       Exit Function
    End If
    
    ' executa stored procedure
    ret% = SqlOk%(SqlConn%)
    If ret% = FAIL% Then
       su_erro_st_proc ST_SqlOk%, "fu_sel_pagador"
       Exit Function
    End If
    
    ' verifica resultados
    ret% = SqlResults%(SqlConn%)
    If ret% = FAIL% Then
       su_erro_st_proc ST_SqlResults%, "fu_sel_pagador"
       Exit Function
    End If
    
    'Adriana - 21/11/2001 - Consistência do c_idt_pes_pgd
    c_idt_pes_pgd = ""
    
    ' processa resultados
    Do Until ret% = NOMORERESULTS% Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            c_idt_pes_pgd = SqlData$(SqlConn%, 5)
            ret% = SqlNextRow%(SqlConn%)
        Loop
        ret% = SqlResults%(SqlConn%)
    Loop

    If ret% = FAIL% Or c_idt_pes_pgd = "" Then
        su_erro_st_proc ST_SqlResults%, "fu_sel_pagador"
        Exit Function
    End If
    
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function

    fu_sel_pagador = True

End Function

Private Function PR_PES_FIG_L_S07567()

' seleciona nome correspondente ao código da pessoa

Dim ret     As Integer
Dim msg_err As String

    PR_PES_FIG_L_S07567 = False
    
    ' inicializa stored procedure
    ret% = SQLRPCInit%(SqlConn%, "prod30.dbnpesso..PR_PES_FIG_L_S07567", 0)
    If ret% = FAIL Then
       su_erro_st_proc ST_SqlRpcInit%, "PR_PES_FIG_L_S07567"
       Exit Function
    End If
    
    ' passa parâmetros
    If FU_Parametro(SqlConn, "@c_idt_fig", "2", SQLINT2) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_idt_pes", c_idt_pes_aux$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@u_ocr_l", "", SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@n_linhas", "", SQLINT2%) = FAIL Then Exit Function
    
    ' envia comando
    ret% = SQLRPCSend%(SqlConn%)
    If ret% = FAIL% Then
       su_erro_st_proc ST_SqlRpcSend%, "PR_PES_FIG_L_S07567"
       Exit Function
    End If
    
    ' executa stored procedure
    ret% = SqlOk%(SqlConn%)
    If ret% = FAIL% Then
       su_erro_st_proc ST_SqlOk%, "PR_PES_FIG_L_S07567"
       Exit Function
    End If
    
    ' verifica resultados
    ret% = SqlResults%(SqlConn%)
    If ret% = FAIL% Then
       su_erro_st_proc ST_SqlResults%, "PR_PES_FIG_L_S07567"
       Exit Function
    End If
    
    ' processa resultados
    Do Until ret% = NOMORERESULTS% Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            ret% = SqlNextRow%(SqlConn%)
        Loop
        ret% = SqlResults%(SqlConn%)
    Loop

    If ret% = FAIL% Then
        su_erro_st_proc ST_SqlResults%, "PR_PES_FIG_L_S07567"
        Exit Function
    End If
    
    u_ocr_l_dest$ = Trim(SqlRetData$(SqlConn%, 1))

    If Val(SqlRetData$(SqlConn%, 2)) = 0 Then
        Exit Function
    End If

    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function

    PR_PES_FIG_L_S07567 = True

End Function

Private Sub SSFrame1_Click()

End Sub
