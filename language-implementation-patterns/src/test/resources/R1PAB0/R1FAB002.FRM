VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Object = "{B16553C3-06DB-101B-85B2-0000C009BE81}#1.0#0"; "SPIN32.OCX"
Begin VB.Form R1FAB002 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   Caption         =   "Consulta à Apólice"
   ClientHeight    =   8145
   ClientLeft      =   4470
   ClientTop       =   4140
   ClientWidth     =   9660
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H8000000F&
   Icon            =   "R1FAB002.frx":0000
   KeyPreview      =   -1  'True
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   10532.54
   ScaleMode       =   0  'User
   ScaleWidth      =   10559.99
   Tag             =   "R1FAB002"
   Begin VB.Frame Fra_Apo_segundo_risco 
      ForeColor       =   &H00800000&
      Height          =   615
      Left            =   7215
      TabIndex        =   133
      Top             =   4950
      Width           =   2205
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Apólice 2º Risco"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   45
         TabIndex        =   135
         Top             =   240
         Width           =   1425
         WordWrap        =   -1  'True
      End
      Begin VB.Label lbl_s_n_apo_2_risco 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   1560
         TabIndex        =   134
         Top             =   225
         Width           =   540
      End
   End
   Begin Threed.SSFrame fr3d_dados 
      Height          =   1125
      Left            =   60
      TabIndex        =   43
      Top             =   6645
      Width           =   9360
      _Version        =   65536
      _ExtentX        =   16510
      _ExtentY        =   1984
      _StockProps     =   14
      Caption         =   "Dados . . ."
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
      Begin Threed.SSCommand bu3d_apo_ctr_rsv 
         Height          =   600
         Left            =   5540
         TabIndex        =   94
         Tag             =   "Dados técnicos"
         ToolTipText     =   "Contrato"
         Top             =   255
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   16711680
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":030A
      End
      Begin Threed.SSCommand bu3d_csg 
         Height          =   600
         Left            =   4770
         TabIndex        =   95
         Tag             =   "Cláusulas"
         ToolTipText     =   "Cosseguro"
         Top             =   255
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":0624
      End
      Begin Threed.SSCommand bu3d_apo_escr 
         Height          =   600
         Left            =   4000
         TabIndex        =   96
         Tag             =   "Cláusulas"
         ToolTipText     =   "Apólice Escritural"
         Top             =   255
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":093E
      End
      Begin Threed.SSCommand bu3d_cla 
         Height          =   600
         Left            =   3230
         TabIndex        =   97
         Tag             =   "Cláusulas"
         ToolTipText     =   "Cláusulas"
         Top             =   255
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":0C58
      End
      Begin Threed.SSCommand bu3d_tco 
         Height          =   600
         Left            =   2460
         TabIndex        =   98
         Tag             =   "Dados técnicos"
         ToolTipText     =   "Dados Técnicos"
         Top             =   255
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   16711680
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":0F72
      End
      Begin Threed.SSCommand bu3d_cbr 
         Height          =   600
         Left            =   1670
         TabIndex        =   99
         Tag             =   "Cobrança"
         ToolTipText     =   "Cobrança"
         Top             =   255
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   16711680
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":128C
      End
      Begin Threed.SSCommand bu3d_plano 
         Height          =   600
         Left            =   920
         TabIndex        =   100
         Tag             =   "Plano"
         ToolTipText     =   "Plano"
         Top             =   255
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":15A6
      End
      Begin Threed.SSCommand bu3d_isg 
         Height          =   600
         Left            =   150
         TabIndex        =   101
         Tag             =   "Isg"
         ToolTipText     =   "Item Segurado"
         Top             =   255
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":18C0
      End
      Begin Threed.SSCommand bu3d_dad_lib_esp 
         Height          =   600
         Left            =   6310
         TabIndex        =   102
         Tag             =   "Lib. Esp."
         ToolTipText     =   "Liberações Especiais"
         Top             =   240
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   16711680
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":1BDA
      End
      Begin Threed.SSCommand BU3D_Historico 
         Height          =   600
         Left            =   7080
         TabIndex        =   103
         Tag             =   "Histórico"
         ToolTipText     =   "Histórico"
         Top             =   240
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":1EF4
      End
      Begin Threed.SSCommand bu3d_his_wn 
         Height          =   600
         Left            =   7850
         TabIndex        =   104
         Tag             =   "Isg"
         ToolTipText     =   "Histórico do workflow do negócio"
         Top             =   240
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":220E
      End
      Begin Threed.SSCommand BU3D_Consulta_Pasta 
         Height          =   600
         Left            =   8625
         TabIndex        =   107
         Tag             =   "pasta GED"
         ToolTipText     =   "Consulta Pasta GED"
         Top             =   255
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   -2147483640
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         MouseIcon       =   "R1FAB002.frx":2528
         Picture         =   "R1FAB002.frx":2842
      End
      Begin VB.Label lb_tco_cpl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Técnicos"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   2400
         TabIndex        =   109
         Top             =   870
         Width           =   660
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "GED"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   8750
         TabIndex        =   108
         Top             =   870
         Width           =   345
      End
      Begin VB.Label lb_his_wn 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "WorkFlow"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   7790
         TabIndex        =   105
         Top             =   855
         Width           =   720
      End
      Begin VB.Label lb_Hist 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Histórico"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   7050
         TabIndex        =   93
         Top             =   855
         Width           =   615
      End
      Begin VB.Label lb_dad_lib_esp 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Lib. Esp."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   6300
         TabIndex        =   79
         Top             =   855
         Width           =   615
      End
      Begin VB.Label lb_ctr_rsv 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Contrato"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   5530
         TabIndex        =   70
         Top             =   870
         Width           =   600
      End
      Begin VB.Label lb_csg 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Cosseguro"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   4690
         TabIndex        =   67
         Top             =   870
         Width           =   750
      End
      Begin VB.Label lb_dad_grl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Apól.Escr."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   3950
         TabIndex        =   61
         Top             =   870
         Width           =   720
      End
      Begin VB.Label lb_cla 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Cláusulas"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   3200
         TabIndex        =   48
         Top             =   870
         Width           =   675
      End
      Begin VB.Label lb_cbr 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Cobrança"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1600
         TabIndex        =   47
         Top             =   870
         Width           =   690
      End
      Begin VB.Label lb_pla 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Plano"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   970
         TabIndex        =   46
         Top             =   870
         Width           =   405
      End
      Begin VB.Label lb_isg 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Item Seg."
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   120
         TabIndex        =   44
         Top             =   870
         Width           =   675
      End
   End
   Begin Threed.SSFrame SSFrame_Pri_Risco 
      Height          =   1095
      Left            =   45
      TabIndex        =   118
      Top             =   5568
      Width           =   9375
      _Version        =   65536
      _ExtentX        =   16536
      _ExtentY        =   1931
      _StockProps     =   14
      Caption         =   "Apólice de 1o Risco"
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
      Begin VB.Label lbl_fim_vig_pri_risco 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   5040
         TabIndex        =   126
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label lbl_t_fim_vig_1o_risco 
         Caption         =   "Fim de Vigência"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   3480
         TabIndex        =   125
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label lbl_ini_vig_pri_risco 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   1920
         TabIndex        =   124
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label lbl_t_ini_vig_1o_risco 
         Caption         =   "Início de Vigência"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   120
         TabIndex        =   123
         Top             =   720
         Width           =   1575
      End
      Begin VB.Label lbl_apo_pri_risco 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   7440
         TabIndex        =   122
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label lbl_t_apo_1o_risco 
         Caption         =   "Apólice"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   6600
         TabIndex        =   121
         Top             =   360
         Width           =   735
      End
      Begin VB.Label lbl_nome_cong_pri_risco 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   1200
         TabIndex        =   120
         Top             =   360
         Width           =   5295
      End
      Begin VB.Label lbl_t_cod_cong_2risco 
         Caption         =   "Congênere"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   120
         TabIndex        =   119
         Top             =   360
         Width           =   975
      End
   End
   Begin Threed.SSPanel pa3d_topo 
      Align           =   1  'Align Top
      Height          =   705
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9660
      _Version        =   65536
      _ExtentX        =   17039
      _ExtentY        =   1244
      _StockProps     =   15
      ForeColor       =   -2147483640
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
      Begin Threed.SSCommand bu3d_sys_irc 
         Height          =   600
         Left            =   2580
         TabIndex        =   136
         ToolTipText     =   "Inspeção de Risco"
         Top             =   45
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Picture         =   "R1FAB002.frx":2B5C
      End
      Begin Threed.SSCommand bu_Titulos 
         Height          =   600
         Left            =   2580
         TabIndex        =   91
         Tag             =   "consulta"
         ToolTipText     =   "Título de Capitalização"
         Top             =   45
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB002.frx":3C19
      End
      Begin Threed.SSCommand bu3d_txt 
         Height          =   600
         Left            =   2595
         TabIndex        =   76
         Tag             =   "consulta"
         Top             =   45
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB002.frx":44F3
      End
      Begin Threed.SSCommand bu3d_avanca 
         Height          =   600
         Left            =   8235
         TabIndex        =   75
         Tag             =   "sai"
         Top             =   30
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB002.frx":480D
      End
      Begin Threed.SSCommand bu3d_consulta_item 
         DragIcon        =   "R1FAB002.frx":4B27
         Height          =   600
         Left            =   3780
         TabIndex        =   74
         Tag             =   "botão X"
         Top             =   45
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":4E31
      End
      Begin Threed.SSCommand bu3d_t_apo 
         DragIcon        =   "R1FAB002.frx":514B
         Height          =   600
         Left            =   6180
         TabIndex        =   66
         Tag             =   "End_Corresp"
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":5455
      End
      Begin Threed.SSCommand bu3d_imp_tla 
         Height          =   600
         Left            =   6780
         TabIndex        =   59
         Tag             =   "consulta"
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB002.frx":576F
      End
      Begin Threed.SSCommand bu3d_X 
         DragIcon        =   "R1FAB002.frx":5A89
         Height          =   600
         Left            =   4380
         TabIndex        =   1
         Tag             =   "botão X"
         Top             =   45
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":5D93
      End
      Begin Threed.SSCommand bu3d_canais_venda 
         Height          =   600
         Left            =   4980
         TabIndex        =   2
         Tag             =   "Canais_de_Venda"
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":60AD
      End
      Begin Threed.SSCommand bu3d_dados_cli 
         Height          =   600
         Left            =   5580
         TabIndex        =   3
         Tag             =   "Dados_Cli"
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":63C7
      End
      Begin Threed.SSCommand bu3d_volta 
         Height          =   600
         Left            =   7620
         TabIndex        =   4
         Tag             =   "Volta"
         Top             =   30
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":66E1
      End
      Begin Threed.SSCommand bu3d_Fim 
         Height          =   600
         Left            =   8835
         TabIndex        =   5
         Tag             =   "Fim"
         Top             =   30
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":69FB
      End
      Begin Threed.SSCommand Bu3d_Func 
         Height          =   600
         Left            =   3240
         TabIndex        =   88
         ToolTipText     =   "Funcionário"
         Top             =   45
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB002.frx":6D15
      End
      Begin Threed.SSCommand Bu3d_Mar 
         Height          =   600
         Left            =   3240
         TabIndex        =   117
         Tag             =   "consulta"
         ToolTipText     =   "Dados Marinha"
         Top             =   45
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB002.frx":702F
      End
      Begin Threed.SSCommand BU3D_ConsultaProposta 
         Height          =   600
         Left            =   1995
         TabIndex        =   131
         Tag             =   "consulta"
         ToolTipText     =   "Consulta Proposta."
         Top             =   45
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB002.frx":7349
      End
      Begin Threed.SSCommand BU3D_ReimpPrp 
         Height          =   600
         Left            =   1365
         TabIndex        =   132
         Tag             =   "consulta"
         ToolTipText     =   "Execução da carga de reimpressão de proposta."
         Top             =   45
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB002.frx":7663
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB002.frx":7722
         Top             =   120
         Width           =   1365
      End
   End
   Begin Threed.SSFrame fr3d_cliente 
      Height          =   4155
      Left            =   45
      TabIndex        =   6
      Top             =   705
      Width           =   9375
      _Version        =   65536
      _ExtentX        =   16536
      _ExtentY        =   7329
      _StockProps     =   14
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
      Begin Threed.SSCommand bu3d_u_apo_pge 
         DragIcon        =   "R1FAB002.frx":7E9C
         Height          =   210
         Left            =   7680
         TabIndex        =   112
         Tag             =   "End_Corresp"
         Top             =   1680
         Visible         =   0   'False
         Width           =   735
         _Version        =   65536
         _ExtentX        =   1296
         _ExtentY        =   370
         _StockProps     =   78
         Caption         =   "Gênius"
         ForeColor       =   8388608
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":81A6
      End
      Begin Threed.SSCommand bu3d_u_prc_ssp 
         DragIcon        =   "R1FAB002.frx":81C2
         Height          =   210
         Left            =   8580
         TabIndex        =   111
         Tag             =   "End_Corresp"
         Top             =   1680
         Width           =   675
         _Version        =   65536
         _ExtentX        =   1191
         _ExtentY        =   370
         _StockProps     =   78
         Caption         =   "Susep"
         ForeColor       =   8388608
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":84CC
      End
      Begin VB.ComboBox cb_u_adi 
         Appearance      =   0  'Flat
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   330
         Left            =   1200
         Style           =   2  'Dropdown List
         TabIndex        =   23
         Top             =   2445
         Width           =   8070
      End
      Begin Threed.SSCommand bu3d_end_corresp 
         DragIcon        =   "R1FAB002.frx":84E8
         Height          =   540
         Left            =   8580
         TabIndex        =   77
         Tag             =   "End_Corresp"
         Top             =   3570
         Width           =   585
         _Version        =   65536
         _ExtentX        =   1032
         _ExtentY        =   953
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":87F2
      End
      Begin Spin.SpinButton sp_apo_mfr 
         Height          =   435
         Left            =   8520
         TabIndex        =   78
         Top             =   1500
         Visible         =   0   'False
         Width           =   195
         _Version        =   65536
         _ExtentX        =   344
         _ExtentY        =   767
         _StockProps     =   73
         TdThickness     =   1
      End
      Begin Threed.SSCommand bu3d_Campanha 
         DragIcon        =   "R1FAB002.frx":8B0C
         Height          =   540
         Left            =   5670
         TabIndex        =   81
         Tag             =   "End_Corresp"
         ToolTipText     =   "Dados da campanha"
         Top             =   3570
         Visible         =   0   'False
         Width           =   585
         _Version        =   65536
         _ExtentX        =   1032
         _ExtentY        =   953
         _StockProps     =   78
         ForeColor       =   8388608
         Enabled         =   0   'False
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":8E16
      End
      Begin VB.Frame fr3d_d_ano_mes_ref 
         Caption         =   "Competência"
         ForeColor       =   &H00800000&
         Height          =   500
         Left            =   7860
         TabIndex        =   89
         Top             =   3060
         Visible         =   0   'False
         Width           =   1410
         Begin VB.Label lb_d_ano_mes_ref 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            ForeColor       =   &H00800000&
            Height          =   225
            Left            =   260
            TabIndex        =   90
            Top             =   210
            Width           =   810
         End
      End
      Begin Threed.SSCommand bu3d_e_emi_ppl 
         DragIcon        =   "R1FAB002.frx":9130
         Height          =   270
         Left            =   8190
         TabIndex        =   110
         Tag             =   "End_Corresp"
         Top             =   3810
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   476
         _StockProps     =   78
         ForeColor       =   8388608
         BevelWidth      =   0
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":943A
      End
      Begin Threed.SSCommand bu3d_datas 
         Height          =   260
         Left            =   7485
         TabIndex        =   130
         Tag             =   "Emissões"
         ToolTipText     =   "Emissões"
         Top             =   3310
         Width           =   300
         _Version        =   65536
         _ExtentX        =   529
         _ExtentY        =   459
         _StockProps     =   78
         ForeColor       =   8388608
         BevelWidth      =   1
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":9D14
      End
      Begin Threed.SSCommand bu1_Cotacao 
         Height          =   255
         Left            =   7485
         TabIndex        =   137
         Tag             =   "Cotação"
         ToolTipText     =   "Cotação"
         Top             =   3050
         Width           =   300
         _Version        =   65536
         _ExtentX        =   529
         _ExtentY        =   450
         _StockProps     =   78
         ForeColor       =   8388608
         BevelWidth      =   1
         AutoSize        =   1
         Picture         =   "R1FAB002.frx":9D30
      End
      Begin VB.Label lb_mdd_aut_frt 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Modalidade Blanket com Gatilho"
         ForeColor       =   &H00000080&
         Height          =   195
         Left            =   6550
         TabIndex        =   129
         Top             =   960
         Visible         =   0   'False
         Width           =   2760
      End
      Begin VB.Label lblContrato 
         BackColor       =   &H8000000A&
         BackStyle       =   0  'Transparent
         Caption         =   "Contrato Financiamento"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   2400
         TabIndex        =   116
         Top             =   2040
         Visible         =   0   'False
         Width           =   2070
      End
      Begin VB.Label lblFinanciamento 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   4500
         TabIndex        =   115
         Top             =   2040
         Visible         =   0   'False
         Width           =   1500
      End
      Begin VB.Label lb_cct_ita 
         AutoSize        =   -1  'True
         Caption         =   "CORRENTISTA"
         ForeColor       =   &H00000080&
         Height          =   195
         Left            =   7800
         TabIndex        =   114
         Top             =   150
         Visible         =   0   'False
         Width           =   1335
      End
      Begin VB.Label lb_adi_pge_ixl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Gênius/Mig.XL"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   7560
         TabIndex        =   113
         Top             =   2220
         Visible         =   0   'False
         Width           =   1275
      End
      Begin VB.Label LB_I_CSI 
         Alignment       =   1  'Right Justify
         ForeColor       =   &H00000080&
         Height          =   240
         Left            =   5895
         TabIndex        =   92
         Top             =   2205
         Width           =   2475
      End
      Begin VB.Label lb_u_adi_ref_ppl 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   8190
         TabIndex        =   85
         Top             =   3075
         Width           =   450
      End
      Begin VB.Label lb_adit_ref 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Nº Adit.Ref."
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   7950
         TabIndex        =   84
         Top             =   3075
         Width           =   1035
      End
      Begin VB.Label lb_u_mcf_cpl 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   7920
         TabIndex        =   87
         Top             =   2820
         Width           =   1335
      End
      Begin VB.Label lb_mcf_cpl 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Microf.Compl."
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   6675
         TabIndex        =   86
         Top             =   2820
         Width           =   1170
      End
      Begin VB.Label lb_n_sgm_neg 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00000080&
         Height          =   225
         Left            =   5175
         TabIndex        =   83
         Top             =   1470
         Width           =   3270
      End
      Begin VB.Label lb_e_sgm_neg 
         AutoSize        =   -1  'True
         Caption         =   "Segmento"
         ForeColor       =   &H00000080&
         Height          =   195
         Left            =   4215
         TabIndex        =   82
         Top             =   1470
         Width           =   855
      End
      Begin VB.Label lb_u_sav 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   7635
         TabIndex        =   80
         Top             =   960
         Visible         =   0   'False
         Width           =   1605
      End
      Begin VB.Label lb_n_dph_doc 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   6315
         TabIndex        =   71
         Top             =   3840
         Width           =   1800
      End
      Begin VB.Label lb_c_dph_doc 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Dest. Doctos."
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   6315
         TabIndex        =   72
         Top             =   3600
         Width           =   1185
      End
      Begin VB.Label lb_d_dia_env_dem1 
         Appearance      =   0  'Flat
         Caption         =   "Dia Remessa Demonstr. Faturamento"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   69
         Top             =   1470
         Width           =   3195
      End
      Begin VB.Label lb_d_dia_env_dem2 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   3495
         TabIndex        =   68
         Top             =   1470
         Width           =   435
      End
      Begin VB.Label lb_c_pro 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   920
         TabIndex        =   65
         Top             =   960
         Width           =   375
      End
      Begin VB.Label lb_sav 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Nº SAV"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   6840
         TabIndex        =   64
         Top             =   990
         Visible         =   0   'False
         Width           =   645
      End
      Begin VB.Label lb_apo_ant 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Apólice Ant."
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   5490
         TabIndex        =   63
         Top             =   420
         Width           =   1050
      End
      Begin VB.Label lb_apo_ant1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   6585
         TabIndex        =   62
         Top             =   420
         Width           =   2685
      End
      Begin VB.Label lb_d_emi_adi 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Caption         =   "  /  /  "
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   6330
         TabIndex        =   60
         Top             =   3075
         Width           =   1110
      End
      Begin VB.Label lb_cnl_rpc1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1680
         TabIndex        =   58
         Top             =   3840
         Width           =   3915
      End
      Begin VB.Label lb_cnl_rpc 
         Appearance      =   0  'Flat
         Caption         =   "Canal Recepção"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   180
         TabIndex        =   57
         Top             =   3840
         Width           =   1815
      End
      Begin VB.Label lb_n_usr1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   3975
         TabIndex        =   56
         Top             =   3585
         Width           =   1620
      End
      Begin VB.Label lb_n_usr 
         Appearance      =   0  'Flat
         Caption         =   "Emissor"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   3240
         TabIndex        =   55
         Top             =   3585
         Width           =   855
      End
      Begin VB.Label lb_d_rct_prp1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Caption         =   "  /  /"
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1680
         TabIndex        =   54
         Top             =   3585
         Width           =   1155
      End
      Begin VB.Label lb_Data 
         Appearance      =   0  'Flat
         Caption         =   "Dt.Emissão Aditamento"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   4215
         TabIndex        =   53
         Top             =   3075
         Width           =   2325
      End
      Begin VB.Label lb_d_emi1 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Caption         =   "   /   /"
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   8175
         TabIndex        =   52
         Top             =   690
         Width           =   1095
      End
      Begin VB.Label lb_d_emi 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Data Emissão"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   6840
         TabIndex        =   51
         Top             =   720
         Width           =   1170
      End
      Begin VB.Label lb_Motivo_ipd 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Imped. p/ Adit."
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   45
         Top             =   1230
         Width           =   1290
      End
      Begin VB.Label lb_c_mot_ipd_adi 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1530
         TabIndex        =   50
         Top             =   1230
         Width           =   4965
      End
      Begin VB.Label lb_Dt_Tab_Venda 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Dt.Tab.de Vendas"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   4215
         TabIndex        =   34
         Top             =   3330
         Width           =   1560
      End
      Begin VB.Label lb_d_tab_vda_cmz 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Caption         =   "  /  /  "
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   6330
         TabIndex        =   35
         Top             =   3330
         Width           =   1110
      End
      Begin VB.Label lb_u_adi 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Aditamento"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   22
         Top             =   2475
         Width           =   960
      End
      Begin VB.Label lb_ini_vig_apo 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1560
         TabIndex        =   25
         Top             =   2820
         Width           =   1065
      End
      Begin VB.Label lb_vig_apo 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Vig. Apólice"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   24
         Top             =   2820
         Width           =   1035
      End
      Begin VB.Label lb_a 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "a"
         ForeColor       =   &H00800000&
         Height          =   195
         Index           =   0
         Left            =   2700
         TabIndex        =   26
         Top             =   2820
         Width           =   120
      End
      Begin VB.Label lb_fim_vig_apo 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   2910
         TabIndex        =   27
         Top             =   2820
         Width           =   1065
      End
      Begin VB.Label lb_fim_vig_adi 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   2910
         TabIndex        =   33
         Top             =   3075
         Width           =   1065
      End
      Begin VB.Label lb_a 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "a"
         ForeColor       =   &H00800000&
         Height          =   195
         Index           =   1
         Left            =   2700
         TabIndex        =   32
         Top             =   3075
         Width           =   120
      End
      Begin VB.Label lb_vig_adi 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Vig. Aditamento"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   30
         Top             =   3080
         Width           =   1350
      End
      Begin VB.Label lb_ini_vig_adi 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1560
         TabIndex        =   31
         Top             =   3075
         Width           =   1065
      End
      Begin VB.Label lb_u_mcf 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   5190
         TabIndex        =   29
         Top             =   2820
         Width           =   1260
      End
      Begin VB.Label lb_mcf 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Microfilme"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   4215
         TabIndex        =   28
         Top             =   2820
         Width           =   870
      End
      Begin VB.Label lb_n_adit 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Nº Adit."
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1200
         TabIndex        =   19
         Top             =   2220
         Width           =   675
      End
      Begin VB.Label lb_ver_adit 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Versão"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   2100
         TabIndex        =   20
         Top             =   2220
         Width           =   600
      End
      Begin VB.Label lb_Motivo 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Motivo"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   3120
         TabIndex        =   21
         Top             =   2220
         Width           =   585
      End
      Begin VB.Label lb_d_rct_prp 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Recepção Prop."
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   38
         Top             =   3585
         Width           =   1395
      End
      Begin VB.Label lb_d_prp 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Caption         =   "  /  /  "
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   2910
         TabIndex        =   39
         Top             =   3315
         Width           =   1065
      End
      Begin VB.Label lb_c_cvd 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   210
         TabIndex        =   41
         Top             =   1950
         Width           =   1905
      End
      Begin VB.Label lb_n_pes_cor 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   2370
         TabIndex        =   42
         Top             =   1950
         Width           =   6885
      End
      Begin VB.Label lb_cvd 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Código do Corretor"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   40
         Top             =   1740
         Width           =   1605
      End
      Begin VB.Label lb_prp 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Nº/Dt.Proposta"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   210
         TabIndex        =   36
         Top             =   3330
         Width           =   1320
      End
      Begin VB.Label lb_produto 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Produto"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   13
         Top             =   960
         Width           =   675
      End
      Begin VB.Label lb_n_pro 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1320
         TabIndex        =   14
         Top             =   960
         Width           =   5175
      End
      Begin VB.Label lb_u_prp 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1560
         TabIndex        =   37
         Top             =   3315
         Width           =   1155
      End
      Begin VB.Label lb_segurado 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Segurado"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   7
         Top             =   150
         Width           =   825
      End
      Begin VB.Label lb_n_Pes 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1170
         TabIndex        =   8
         Top             =   150
         Width           =   6480
      End
      Begin VB.Label lb_c_isg 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   4155
         TabIndex        =   12
         Top             =   420
         Width           =   1230
      End
      Begin VB.Label lb_item 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Item"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   3675
         TabIndex        =   11
         Top             =   420
         Width           =   375
      End
      Begin VB.Label lb_d_can_apo 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Caption         =   "   /   /"
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   8145
         TabIndex        =   18
         Top             =   1230
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.Label lb_t_sit_apo 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1320
         TabIndex        =   16
         Top             =   690
         Width           =   5175
      End
      Begin VB.Label lb_apo 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   885
         TabIndex        =   10
         Top             =   420
         Width           =   2700
      End
      Begin VB.Label lb_data_canc 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Cancelamento"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   6840
         TabIndex        =   17
         Top             =   1230
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.Label lb_sit_apo 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Sit. Apólice"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   15
         Top             =   690
         Width           =   990
      End
      Begin VB.Label lb_apolice 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Apólice"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   9
         Top             =   420
         Width           =   645
      End
      Begin VB.Label lb_i_ASN_ELN 
         Caption         =   "Proposta Assinada Eletronicamente"
         ForeColor       =   &H00000080&
         Height          =   435
         Left            =   6840
         TabIndex        =   106
         Top             =   990
         Visible         =   0   'False
         Width           =   2385
      End
      Begin VB.Label lb_texto_migracao 
         Appearance      =   0  'Flat
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "      Apólice Migrada do Mainframe           Número: 1.12.1234567.1234567890"
         ForeColor       =   &H00000080&
         Height          =   435
         Left            =   4995
         TabIndex        =   73
         Top             =   1500
         Visible         =   0   'False
         Width           =   3525
      End
   End
   Begin Threed.SSPanel pa3d_status 
      Align           =   2  'Align Bottom
      Height          =   300
      Left            =   0
      TabIndex        =   49
      Top             =   7845
      Width           =   9660
      _Version        =   65536
      _ExtentX        =   17039
      _ExtentY        =   529
      _StockProps     =   15
      Caption         =   "R1FAB002"
      ForeColor       =   8388608
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderWidth     =   1
      BevelInner      =   1
      Alignment       =   1
      Autosize        =   1
   End
   Begin VB.Frame Frame_Atividade_Empresa 
      Caption         =   "Atividade da Empresa"
      ForeColor       =   &H00800000&
      Height          =   615
      Left            =   82
      TabIndex        =   127
      Top             =   4949
      Width           =   7125
      Begin VB.Label lbl_ativ_emp_auto_frota 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   120
         TabIndex        =   128
         Top             =   240
         Width           =   6900
      End
   End
End
Attribute VB_Name = "R1FAB002"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' *************************** Dados da Apólice ************************************
Option Explicit
Option Compare Text

Function FU_VERIFICA_EMI_WN() As Boolean

    Dim PRM_u_adi$
    Dim PRM_u_vrs_adi$
    Dim PRM_n_linhas%
    Dim PRM_tip_wkf$

    
    FU_VERIFICA_EMI_WN = False
    
    Screen.MousePointer = vbHourglass
    
    VG_u_idt_nwf$ = Empty
    
    If cb_u_adi.ListIndex <> True Then
        PRM_u_adi$ = Mid(cb_u_adi.Text, 1, 3)
        PRM_u_vrs_adi$ = "1"
    End If
    
    bu1_Cotacao.Visible = False ' ** dosstos ** ** rafacds ** - 13/03/2013
    
    'Acessa a TB_CTL_EMI_PRP para buscar número da proposta
    If Not FU_PR_CTL_EMI_PRP_S08333(c_cia_ita$, _
                                    c_rmo$, _
                                    u_apo_pnc$, _
                                    u_apo_dpd$, _
                                    PRM_u_adi$, _
                                    PRM_u_vrs_adi$) Then
        Exit Function
    End If
    
    
    'Verifica se a proposta foi tratada pelo Workflow
    If Not FU_PR_NWF_S14226(VT_TIPO_EMI_PRP.u_prp$, _
                            VT_TIPO_EMI_PRP.d_prt_cga$, _
                            PRM_n_linhas%, _
                            PRM_tip_wkf$) Then

        Exit Function
    Else
        If PRM_n_linhas% <> 0 Then
            bu3d_his_wn.Tag = PRM_tip_wkf$ 'minitir - ss221940 - 01/11/2012

            'Apólice emitida via Workflow, habilitar botão de histórico
            su_habilita_botao bu3d_his_wn, True
        Else
            bu3d_his_wn.Tag = "" 'minitir - ss221940 - 01/11/2012

            'Apólice não emitida via Workflow, não habilitar botão de histórico
            su_habilita_botao bu3d_his_wn, False
        End If
    End If
    
    '********************************************************************************************
    '*** dosstos ** ** rafacds ** - 13/03/2013                                                ***
    '*** Inclusão do número de cotação no Consulta apólice                                    ***
    '*** A pedido da ASPC, a consulta ao nº de cotação será para todos os ramos/produtos      ***
    '********************************************************************************************
    If VT_TIPO_EMI_PRP.u_ctc$ <> "" And fr3d_d_ano_mes_ref.Visible = False Then
       bu1_Cotacao.Visible = True
    End If
    
    Screen.MousePointer = vbDefault
    
    FU_VERIFICA_EMI_WN = True
    
End Function


Private Sub bu_Titulos_Click()

'+--------------------------------------------------------------------------+
'|               DISPONIBILIZA A TELA DO TITULO DE CAPITALIZAÇÃO            |
'+--------------------------------------------------------------------------+
    Screen.MousePointer = HOURGLASS

    R1FAB013.Show

    Me.Hide
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu_Titulos_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB002 - Consulta Dados do Título de Capitalização"

End Sub

Private Sub bu1_Cotacao_Click()

    '********************************************************************************************
    '*** dosstos ** ** rafacds ** - 13/03/2013                                                ***
    '*** Inclusão do número de cotação no Consulta apólice                                    ***
    '*** A pedido da ASPC, a consulta ao nº de cotação será para todos os ramos/produtos      ***
    '********************************************************************************************
    If VT_TIPO_EMI_PRP.u_ctc$ <> "" Then
       MsgBox " Numero da Cotação  =  " & VT_TIPO_EMI_PRP.u_ctc$, MB_ICONINFORMATION, "Cotação"
    End If
    
End Sub

Private Sub bu3d_apo_ctr_rsv_Click()

' aplicação para consultar dados de contrato

' nome do executável
Dim sArqExec    As String

' armazena retorno da função que faz a chamada do executável
Dim iExecOk     As Integer

    Screen.MousePointer = HOURGLASS

    If Not contrato% Then
        ' seleciona contrato para a apólice
        If Not fu_sel_apo_ctr_rsv() Then
            Screen.MousePointer = DEFAULT
            MsgBox "Apólice não possui Contrato.", , txt_msg$
            Exit Sub
        End If
    
    End If

    sArqExec$ = "R1PCL501.EXE"
    
    Clipboard.Clear
    Clipboard.SetText "R1FAB001," & Trim$(u_ctr$) & "," & Trim$(u_sub_ctr$)
        
    ' fecha conexão para a chamada de outro projeto
    su_fecha_conexao
    
    'Me.Hide
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '======================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " R1FAB001," & Trim$(u_ctr$) & "," & Trim$(u_sub_ctr$))
'    Else
'        iExecOk% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + sArqExec$ & " R1FAB001," & Trim$(u_ctr$) & "," & Trim$(u_sub_ctr$), MinEnableFalse%)
'    End If
    iExecOk% = FU_MonitoraExe(Me, Empty, sArqExec$, _
                              "R1FAB001," & Trim$(u_ctr$) & "," & Trim$(u_sub_ctr$), , _
                              MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not iExecOk% Then
        MsgBox "Não foi possível executar o projeto" & Chr(13) & sArqExec$, 48
    End If

    ' chamada de outro projeto
    'iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " R1FAB001," & Trim$(u_ctr$) & "," & Trim$(u_sub_ctr$))
    '
    'If Not iExecOk% Then
    '    MsgBox "Opção ainda não disponível ('" & sArqExec$ & "')."
    'End If
    
    'LUCIANE - 05/07/1999
    '======================================================================

    ' reestabelece conexão após a execução de outro projeto
    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
    
    Me.Show

    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_apo_ctr_rsv_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Dados do Contrato"

End Sub

Private Sub bu3d_apo_escr_Click()

    Screen.MousePointer = HOURGLASS

    ' acesso a apólice escritural
    If Not fu_acessa_apo_escr(R1FAB002) Then
    End If
    
    Show

End Sub

Private Sub bu3d_apo_escr_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Apólice Escritural"

End Sub

Private Sub bu3D_avanca_Click()

    Screen.MousePointer = HOURGLASS
    
    R1FAB009.Show
    
    Me.Hide
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_Campanha_Click()

    R1FAB011.Show
    Hide

End Sub

Private Sub bu3d_Campanha_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_status.Caption = "R1FAB002 - Dados da campanha"
End Sub

Private Sub bu3d_canais_venda_Click()
    
    ' executável
    Dim sArqExec    As String

    ' retorno da função de chamada de outro projeto
    Dim iExecOk     As Integer
    
    ' armazena a posicao do aditamento no array dad_adi
    Dim POS As Integer

    sArqExec$ = "R1PAB401.EXE"
    
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

    If cb_u_adi.ListIndex = 0 Then
        POS% = UBound(dad_adi)
    Else
        POS% = cb_u_adi.ListIndex - 1
    End If

    u_adi$ = dad_adi(POS%).u_adi
    
    ' seleciona os dados a serem gravados no arquivo
    ' utilizado no acesso de outro projeto
    If fu_trata_dados_arq() Then
        su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAB402"

        ' grava dados no arquivo a ser utilizado por outro projeto
        '(passagem de parâmetros)
        su_grava_arquivo POS%
    Else
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If
    
    ' fecha conexão para a chamada de outro projeto
    su_fecha_conexao
    
    'Me.Hide
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '======================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " ")
'    Else
'        iExecOk% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + sArqExec$ & " ", MinEnableFalse%)
'    End If
    iExecOk% = FU_MonitoraExe(Me, Empty, sArqExec$, Empty, , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not iExecOk% Then
        MsgBox "Não foi possível executar o projeto" & Chr(13) & sArqExec$, 48
    End If

    ' chamada de outro projeto
    'iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " ")
    '
    'If Not iExecOk% Then
    '    MsgBox "Opção ainda não disponível ('" & sArqExec$ & "')."
    'End If

    'LUCIANE - 05/07/1999
    '======================================================================
  
    ' reestabelece conexão após a execução de outro projeto
    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
    
    Me.Show

    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_canais_venda_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Dados dos Canais de Venda"

End Sub

Private Sub bu3d_cbr_Click()

    ' nome do executável
300    Dim sArqExec    As String
301
302    ' armazena retorno da função que faz a chamada do executável
303    Dim iExecOk     As Integer
304
305    ' armazena a posicao do aditamento no array dad_adi
306    Dim POS As Integer
307
308    On Error GoTo ERRO_1
309
310    Refresh
311
312    Screen.MousePointer = HOURGLASS
313
314    sArqExec$ = "R1PAB301.EXE"
315
316    ' O combo tem a posicao consolidada duplicada (1o. e último elemento
317    ' do combo).
318    ' Se o 1o. elemento for escolhido, os dados do aditamento no array dad_adi
319    ' se encontrarão na última posicão do array.
320    '           no combo               no array
321    '    5  (  POSICAO ATUAL  )
322    '    1                                1
323    '    2                                2
324    '    3                                3
325    '    5                                5
326
327    ' aditamento 5 - corresponde somente ao último elemento do array
328
329    If cb_u_adi.ListIndex = 0 Then
330        POS% = UBound(dad_adi)
331    Else
332        POS% = cb_u_adi.ListIndex - 1
333    End If
334
335    u_adi$ = dad_adi(POS%).u_adi
336
337    ' seleciona os dados a serem gravados no arquivo
338    ' utilizado no acesso de outro projeto
339    If fu_trata_dados_arq() Then
340        su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAB301"
341        ' grava parâmetros a serem passados para outro projeto (.INI)
342        su_grava_arquivo POS%
343    Else
344        Screen.MousePointer = DEFAULT
345        Exit Sub
346    End If
347
348    ' fecha conexão para a chamada de outro projeto
349    su_fecha_conexao
350
351    'Me.Hide
352
        'v60 Emilio 22/08/2006 - início
        'Obs.: Migração XP para novo catalogador - Função descontinuada
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'        '======================================================================
'        'LUCIANE - 05/07/1999
'        If OSAmbiente = "Windows 3.11" Then
'            iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " " & n_apl_chm$)
'        Else
'            iExecOk% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + sArqExec$ & " " & n_apl_chm$, MinEnableFalse%)
'        End If
        iExecOk% = FU_MonitoraExe(Me, Empty, sArqExec$, n_apl_chm$, , MinEnableFalse%)
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        'v60 Emilio 22/08/2006 - fim

        If Not iExecOk% Then
            MsgBox "Não foi possível executar o projeto" & Chr(13) & sArqExec$ & "- PROJETO COBRANÇA", 48
        End If

'353    ' executa outro projeto
'354    iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " " & n_apl_chm$)
'355
'356    If Not iExecOk% Then
'357        MsgBox "Opção ainda não disponível ('" & sArqExec$ & "')."
'358    End If

        'LUCIANE - 05/07/1999
        '======================================================================

359
360    ' reestabelece conexão após a execução de outro projeto
361    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
362
363    Me.Show
364
365    Screen.MousePointer = DEFAULT
366    Exit Sub

367 ERRO_1:
368    MsgBox Err & " " & error & " " & Erl
369    Screen.MousePointer = DEFAULT
370    Exit Sub

End Sub

Private Sub bu3d_cbr_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Dados de Cobrança"

End Sub

Private Sub bu3d_cla_Click()

' armazena a posicao do aditamento no array dad_adi
Dim POS As Integer

' contador para array
Dim i   As Integer
    
    Screen.MousePointer = HOURGLASS

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

    If cb_u_adi.ListIndex = 0 Then
        POS% = UBound(dad_adi)
    Else
        POS% = cb_u_adi.ListIndex - 1
    End If

    u_adi$ = dad_adi(POS%).u_adi

    ' seleciona dados da cláusula do aditamento da apólice
    If Val(c_agr_fam_pro$) = 5 Or Val(c_agr_fam_pro$) = 6 Then
        ' seleciona cláusula
        If Not fu_sel_ocr_cla_apo() Then
            Screen.MousePointer = DEFAULT
            MsgBox "Aditamento não possui Cláusulas.", , txt_msg$
            Exit Sub
        End If

        If existe_dad_t_lin_txt% Then
            ' seleciona texto da cláusula
            For i% = 0 To UBound(dad_cla_apo)
                
                If Not fu_sel_txt_apo() Then
                    Screen.MousePointer = DEFAULT
                    MsgBox "Descrição das Cláusulas não encontrada.", , txt_msg$
                    Exit Sub
                End If

            Next i%

        End If
    Else
       ' seleciona cláusulas
        If Not fu_sel_cla_apo() Then
            Screen.MousePointer = DEFAULT
            MsgBox "Aditamento não possui Cláusulas.", , txt_msg$
            Exit Sub
        End If
    
    End If

    ' Preenche dados de cláusulas
    su_preenche_clausulas
    
    R1FAB004.Show
    
    Me.Hide
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_cla_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Cláusulas da Apólice"

End Sub

Private Sub bu3d_consulta_item_Click()

    'Daniela - 22/05/98 - Chamada do form R1FAB007.
    FORM7_ATIVADO = True
    
    Me.Hide
    
    Load R1FAB007

End Sub

Private Sub bu3d_consulta_item_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB002 - Consulta de Itens / Aditamentos"

End Sub

Private Sub BU3D_Consulta_Pasta_Click()

Dim Parametros As String
    Parametros = "3|" & VT_TIPO_EMI_PRP.u_paa_doc_ged & "|" & c_cia_ita & "." & c_rmo & "." & u_apo_pnc & "." & u_apo_dpd & " / " & u_adi
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    If Not FU_Monitora_Exe(Me, "RXPCS201.EXE " & Parametros, FormularioHide) Then
    If Not FU_MonitoraExe(Me, Empty, "RXPCS201.EXE", Parametros, , FormularioHide) Then
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
        MsgBox "Não foi possível executar a aplicação RXPCS201", vbExclamation
    End If
    

End Sub

Private Sub BU3D_Consulta_Pasta_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  pa3d_status.Caption = "R1FAB002 - Consulta à Pasta GED"
End Sub

'/** SS.177593 RS.1552 / IR3 - Reimpressão de Proposta Vida. **/'
Private Sub BU3D_ConsultaProposta_Click()
    Dim novoprocesso As New IX2DPDLVBC01.ProcessoDeploy

    Dim l_param As String
    Dim l_program As String
    'CHAVE DE PESQUISA POR APÓLICE
    l_param = "KEY:APOLICE"
    l_param = l_param & ",C_CIA_ITA:" & c_cia_ita
    l_param = l_param & ",C_RMO:" & c_rmo
    l_param = l_param & ",U_APO_PNC:" & u_apo_pnc
    l_param = l_param & ",U_APO_DPD:" & u_apo_dpd
    l_param = l_param & ",U_ADI:" & u_adi
    l_param = l_param & ",U_VRS_ADI:" & U_VRS_ADI
    l_param = l_param & ",U_PRP:" & VT_TIPO_EMI_PRP.u_prp


    
    Dim url As String
    Dim res As Long
    Dim saux_number As String
    Dim i       As Integer
    Dim endereco As String
    Dim apolice As String
   
    apolice = Format(c_cia_ita$, "00") & Format(c_rmo$, "00") & Format(c_pro$, "00") & Format(u_apo_pnc$, "000000000") & Format(u_apo_dpd, "0000000")
    
    If c_rmo$ = "77" And c_pro$ = "52" Then
      
       For i% = 1 To 22
        saux_number = Mid(CStr(Rnd() * 10), 1, 1)
        url = url & saux_number & Mid(apolice, i%, 1)
       Next i%
   
   
        'DESENVOLVIMENTO
        If FU_Get_Ambiente = "DES" Then
            endereco = "http://itausegportaisdesenv.itau/prestamista/ImpressaoPropostaCrediario?_p="
        'ACEITE
        ElseIf FU_Get_Ambiente = "ACT" Then
            endereco = "http://itausegportaisaceite.itau/prestamista/ImpressaoPropostaCrediario?_p="
        'PRODUÇÃO
        Else
            endereco = "http://portais.intranet.itauseguros/prestamista/ImpressaoPropostaCrediario?_p="
        End If
        
       url = endereco & url
     
       res = ShellExecute(0&, "open", url, vbNullString, vbNullString, vbNormalFocus)
   Else
    
           
        'Caso seja Residência (c_agr_fam_pro = "3") chama o executavel Rafason ss203852
        If c_agr_fam_pro = "3" Then
            l_program = "IP1EMPCTC01VBNV.exe"
        Else
            l_program = "IR3VIDCTC01VBNV.exe"
        End If
        
        
        Clipboard.Clear
        Clipboard.SetText l_param
        
        Dim retorno As Boolean
        retorno = novoprocesso.ExecutaDeployAssembly_2(l_program)
        If Not retorno Then
            MsgBox "Erro na execução da aplicação " & l_program & ".", MB_ICONEXCLAMATION, "Consulta Proposta."
            Exit Sub
        End If
        ' Inicio da Alteração marcep para produtos Vida Gallren 13/01/2014
        If c_agr_fam_pro <> "4" Then
            Me.Hide
            novoprocesso.aguardaTerminoPrograma
            Me.Show
        End If
        ' Fim da Alteração marcep para produtos Vida  Gallren 13/01/2014
  End If
End Sub
'/** SS.177593 RS.1552 / IR3 - Reimpressão de Proposta Vida. **/'

Private Sub bu3d_csg_Click()

' nome do executável
Dim sArqExec    As String

' armazena retorno da função que faz a chamada do executável
Dim iExecOk     As Integer

' armazena a posicao do aditamento no array dad_adi
Dim POS         As Integer
    
    Screen.MousePointer = HOURGLASS

    sArqExec$ = "CSPNG201.EXE"
    
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

    If cb_u_adi.ListIndex = 0 Then
        POS% = UBound(dad_adi)
    Else
        POS% = cb_u_adi.ListIndex - 1
    End If

    u_adi$ = dad_adi(POS%).u_adi
    
    ' seleciona os dados a serem gravados no arquivo
    ' utilizado no acesso de outro projeto
    If fu_trata_dados_arq() Then
        su_wri_ini DirUser & "CSPNG201.INI", "DADOS DO APOLICE", "c_apl", "R1"
        su_wri_ini DirUser & "CSPNG201.INI", "DADOS DO APOLICE", "c_cia_ita", c_cia_ita$
        su_wri_ini DirUser & "CSPNG201.INI", "DADOS DO APOLICE", "c_rmo", c_rmo$
        su_wri_ini DirUser & "CSPNG201.INI", "DADOS DO APOLICE", "u_apo_pnc", Format$(u_apo_pnc$, "000000000")
        su_wri_ini DirUser & "CSPNG201.INI", "DADOS DO APOLICE", "u_apo_dpd", Format$(u_apo_dpd$, "0000000")
        su_wri_ini DirUser & "CSPNG201.INI", "DADOS DO APOLICE", "u_adi", u_adi$
    Else
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If
    
    ' fecha conexão para a chamada de outro projeto
    su_fecha_conexao
    
    'Me.Hide
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '======================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " ")
'    Else
'        iExecOk% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + sArqExec$ & " ", MinEnableFalse%)
'    End If
    iExecOk% = FU_MonitoraExe(Me, Empty, sArqExec$, Empty, , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not iExecOk% Then
        MsgBox "Não foi possível executar o projeto" & Chr(13) & sArqExec$ & " - PROJETO DE COSSEGURO", 48
    End If
    
    ' chamada do outro projeto
    'iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " ")
    '
    'If Not iExecOk% Then
    '    MsgBox "Opção ainda não disponível ('" & sArqExec$ & "')."
    'End If

    'LUCIANE - 05/07/1999
    '======================================================================

    ' reestabelece conexão após a execução de outro projeto
    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
    
    Me.Show

    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_csg_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Dados do Cosseguro"

End Sub

Private Sub bu3d_dad_lib_esp_Click()

    Screen.MousePointer = HOURGLASS
        
    If Not fu_sel_trt_lib_apo() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Problemas na seleção dos dados das liberações especiais", vbOKCancel
        Exit Sub
    End If
    
    If UBound(VT_TRT_LIB_APO) = 0 Then
        Screen.MousePointer = DEFAULT
        MsgBox "Não existem liberações especiais cadastradas para esta apólice/aditamento", vbInformation
        Exit Sub
    End If

    R1FAB010.Show
    Me.Visible = False
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_dad_lib_esp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB002 - Dados de Liberações Especiais"

End Sub

Private Sub bu3d_dados_cli_Click()

    ' nome do executável
    Dim vl_ArqExec      As String

    ' parâmetros a serem passados para outro projeto
    Dim vl_TextoClipb   As String

    ' retorno da função que faz a chamada de outro projeto
    Dim Ret             As Integer
    
    'vl_ArqExec$ = "f:\producao\vbdif\exec\pepge001.exe R1"  'v60 Emilio 22/08/2006
    
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
    vl_TextoClipb$ = vl_TextoClipb$ + "C#"
    vl_TextoClipb$ = vl_TextoClipb$ + "PE#"
    
    Clipboard.Clear
    Clipboard.SetText vl_TextoClipb$
    
    Refresh
    Me.Hide
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    ' chamada de outro projeto
'    ret% = FU_Monitora_Exe(Me, vl_ArqExec$, MinEnableFalse%)
    vl_ArqExec$ = "PEPGE001.exe"  'v60 Emilio 22/08/2006
    Ret% = FU_MonitoraExe(Me, Empty, vl_ArqExec$, "R1", , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Ret% = FAIL Then
        MsgBox "Erro na execução da aplicação PEPGE001.", MB_ICONEXCLAMATION, "Atendimento"
    End If
    
    Me.Show

End Sub

Private Sub bu3d_dados_cli_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Dados do Cliente"

End Sub

Private Sub bu3d_datas_Click()
    If d_fim_cob_pcb <> "06/06/2079" Then
        MsgBox "Data fim de cobertura = " & d_fim_cob_pcb & Chr(13) & "Data/hora de emissão na fila = " & d_hra_atu_icl, MB_ICONINFORMATION, "Emissão"
    Else
        MsgBox "Data/hora de emissão na fila = " & d_hra_atu_icl, MB_ICONINFORMATION, "Emissão"
    End If
End Sub

Private Sub bu3d_e_emi_ppl_Click()

    'v60 Emilio 22/08/2006 - início
    Dim n_emi_ppl As String
    
    Select Case e_emi_ppl
        Case 1: n_emi_ppl = e_emi_ppl_1
        Case 5: n_emi_ppl = e_emi_ppl_5
        Case Else: n_emi_ppl = "[" & e_emi_ppl & "] - Tipo desconhecido"
    End Select
    
    n_emi_ppl = "Tipo de Emissão Papel: " & n_emi_ppl
    
    MsgBox n_emi_ppl, MB_ICONINFORMATION, "R1FAB002 - Consulta tipo de emissão de papel"
    'v60 Emilio 22/08/2006 - fim

End Sub

Private Sub bu3d_e_emi_ppl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    'v60 Emilio 22/08/2006 - início
    Dim n_emi_ppl As String
    
    Select Case e_emi_ppl
        Case 1: n_emi_ppl = e_emi_ppl_1
        Case 5: n_emi_ppl = e_emi_ppl_5
        Case Else: n_emi_ppl = "[" & e_emi_ppl & "] - Tipo desconhecido"
    End Select
    
    n_emi_ppl = "Tipo de Emissão Papel: " & n_emi_ppl
    
    pa3d_status.Caption = "R1FAB002 - " & n_emi_ppl
    bu3d_e_emi_ppl.ToolTipText = n_emi_ppl
    'v60 Emilio 22/08/2006 - fim

End Sub

Private Sub bu3d_end_corresp_Click()
    
    R1FAB003.Show
    Hide

End Sub

Private Sub bu3d_end_corresp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Endereço para Correspondência"

End Sub

Private Sub bu3d_Fim_Click()
    
    SU_Saida
    
End Sub

Private Sub bu3d_Fim_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Finaliza programa"

End Sub

Private Sub Bu3d_Func_Click()
'+--------------------------------------------------------------------------+
'|               DISPONIBILIZA A TELA DE FUNCIONARIO                        |
'+--------------------------------------------------------------------------+
    Screen.MousePointer = HOURGLASS

    R1FAB012.Show

    Me.Hide
    
    Screen.MousePointer = DEFAULT
End Sub

Private Sub Bu3d_Func_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB002 - Consulta Dados do Seguro Auto Funcionário"

End Sub

Private Sub bu3d_his_wn_Click()
    Dim sPar As String

    Dim processo_deploy As New IX2DPDLVBC01.ProcessoDeploy
    Dim novo_processo_deploy As New IW8AQTDPY01VBNX.GerenteDeploy
    
    '+--------------------------------------------------------------------------+
    '| Executa o projeto de histórico do workflow do negócio                    |
    '+--------------------------------------------------------------------------+
    Screen.MousePointer = vbHourglass
    
    ''minitir - ss221940 - 01/11/2012 - ini
    If InStr(1, bu3d_his_wn.Tag, "WE") > 0 Then
        sPar$ = ""
        
'ZE        If Not FU_TerminalServer() Then
'            Ret% = novo_processo_deploy.ExecutarDeployProcesso("IV0NWEHIS01VBNV.EXE", "u_prp=" & VT_TIPO_EMI_PRP.u_prp$ & "&d_prt_cga=" & FU_Converte_Data_Hora(VT_TIPO_EMI_PRP.d_prt_cga$), False)
'        Else
'            Ret% = processo_deploy.ExecutaDeployAssembly("IV0NWEHIS01VBNV.EXE", "u_prp=" & VT_TIPO_EMI_PRP.u_prp$ & "&d_prt_cga=" & FU_Converte_Data_Hora(VT_TIPO_EMI_PRP.d_prt_cga$))
'       End If
    
        If Not Ret% Then
            MsgBox "Não foi possível executar o projeto" & Chr(13) & "IV0NWEHIS01VBNV.EXE - Histórico do Workflow de Emissão", 48
        End If
        
        Set processo_deploy = Nothing
        Set novo_processo_deploy = Nothing
        Screen.MousePointer = vbDefault
        Exit Sub
    End If
    ''minitir - ss221940 - 01/11/2012 - fim
    If Not FU_WNGWN005_Grava_INI_LOG("6", VG_u_idt_nwf$) Then
        MsgBox "Erro na gravação do arquivo de iniciação do LOG", vbCritical
        SU_Saida
    End If
    
    'Cria o parametro para a chamada do programa
    sPar$ = FU_WNGWN005_GeraParametro_LOG("WNPLOG01")

    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    If OSAmbiente = "Windows 3.11" Then
'        ret% = FU_Monitora_Exec(Me, "WNPLOG01.EXE " & sPar$)
'    Else
'        ret% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + "WNPLOG01.EXE " & sPar$, MinEnableFalse%)
'    End If
    Ret% = FU_MonitoraExe(Me, Empty, "WNPLOG01.EXE", sPar$, , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not Ret% Then
        MsgBox "Não foi possível executar o projeto" & Chr(13) & "WNPLOG01.EXE - Histórico do Workflow do Negócio", 48
    End If
    
    Set processo_deploy = Nothing
    Set novo_processo_deploy = Nothing
    Screen.MousePointer = vbDefault

End Sub

Private Sub BU3D_Historico_Click()

Dim Ret       As Integer
Dim Comando   As String
Dim Separador As String

    Screen.MousePointer = 11
    
    Separador = "#"
        
    Comando$ = "2" & Separador  '1 - Proposta, 2 - Apolice
    Comando$ = Comando$ & c_cia_ita & Separador
    Comando$ = Comando$ & c_rmo$ & Separador
    Comando$ = Comando$ & u_apo_pnc & Separador
    Comando$ = Comando$ & u_apo_dpd & Separador
    Comando$ = Comando$ & u_adi & Separador
    Comando$ = Comando$ & c_idt_pes & Separador
    Comando$ = Comando$ & "0" & Separador     'Item segurado
    Comando$ = Comando$ & "0" & Separador     'Garantia
    
    'Apenas para gravar o command (Auxilio para testes)
    'Open DirUser & "parhistapo.txt" For Output As #33
    'Print #33, comando$
    'Close #33
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    'chamada de outro projeto
'    ret = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + "R1PCH001.EXE " & Comando, FormularioHide%)
    Ret = FU_MonitoraExe(Me, Empty, "R1PCH001.EXE", Comando, , FormularioHide%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Ret = 0 Then
        MsgBox "Não foi possível executar o Projeto Consulta Histórico de Alterações (R1PCH001) ", 16
    End If
    
    Screen.MousePointer = 0

End Sub

Private Sub BU3D_Historico_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB002 - Histórico de Alterações Automáticas"
    
End Sub

Private Sub bu3d_imp_tla_Click()

    ' impressão de tela
    su_imp_tla

End Sub

Private Sub bu3d_imp_tla_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Impressão de tela"

End Sub

Private Sub bu3d_isg_Click()
    
    ' nome do executável
1    Dim sArqExec    As String
2
3    ' armazena retorno da função que faz a chamada do executável
4    Dim iExecOk     As Integer
5
6    ' armazena a posicao do aditamento no array dad_adi
7    Dim POS As Integer
8
9    On Error GoTo ERRO
10
11    Screen.MousePointer = HOURGLASS
12
13    ' verifica a família para do Item Segurado
14    Select Case Val(c_agr_fam_pro$)

        Case 1, 8   ' AUTO, DPEM
            sArqExec$ = "R1PAB101.EXE"

        Case 2      ' SAUDE
            sArqExec$ = "R1PAA101.EXE"

        Case 3      ' RPM
            sArqExec$ = "R1PAB601.EXE"

        Case 4      ' VIDA
            sArqExec$ = "R1PAB701.EXE"

        Case 5, 6   ' DIFERENCIADO
            sArqExec$ = "R1PABF01.EXE"

        Case 7      ' DPVAT
            sArqExec$ = "R1POS401.EXE"

        'Case 8      ' DPEM
        '    sArqExec$ = "R1PAB901.EXE"
                    'STJ
        Case 9
            sArqExec$ = "R1POS401.EXE"

        '***
        Case Else
            MsgBox "Agrupamento Família/Produto inválido.", MB_ICONSTOP
            Screen.MousePointer = DEFAULT
            Exit Sub

    End Select

49    ' O combo tem a posicao consolidada duplicada (1o. e último elemento
50    ' do combo).
51    ' Se o 1o. elemento for escolhido, os dados do aditamento no array dad_adi
52    ' se encontrarão na última posicão do array.
53    '           no combo               no array
54    '    5  (  POSICAO ATUAL  )
55    '    1                                1
56    '    2                                2
57    '    3                                3
58    '    5                                5
59
60    ' aditamento 5 - corresponde somente ao último elemento do array
61
62    'Daniela - 05/06/98 - Inclusão do IF.
63    'Cláudia 11/11/98 - Inibido tratamento do form7 conforme conversa c/ Lina e Olindo
64    'If FORM7_ATIVADO = True Then
65    '    u_adi$ = U_ADI_FORM7
66    '    u_vrs_adi$ = U_VRS_ADI_FORM7
67    '    c_isg$ = C_ISG_FORM7
68    '    Ind_Item_Escolhido$ = "S"
69    'Else
70
71        Ind_Item_Escolhido$ = "N"
72
73        If cb_u_adi.ListIndex = 0 Then
74            POS% = UBound(dad_adi)
75        Else
76            POS% = cb_u_adi.ListIndex - 1
77        End If
78
79        u_adi$ = dad_adi(POS%).u_adi
80
81    'End If
82
83    ' seleciona os dados a serem gravados no arquivo
84    ' utilizado no acesso de outro projeto
85    If fu_trata_dados_arq() Then
86
87        ' verifica a família para do Item Segurado
        Select Case Val(c_agr_fam_pro$)

            Case 1      ' AUTO
                su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAB101"

            Case 2      ' SAUDE
                su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAA101"

            Case 3      ' RPM
                su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAB601"

            Case 4      ' VIDA
                su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAB701"

            Case 5, 6   ' DIFERENCIADO
                su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FABF01"

            Case 7      ' DPVAT
                Clipboard.Clear
                Clipboard.SetText "R1PAB001" & "#" & c_rmo$ & "#" & c_pro$ & "#" & n_pro$ & "#" & n_pes$ & "#" & "C" & "#" & c_osg$ & "#" & e_osg & "#" & u_vrs_osg$

            Case 8      ' DPEM
                su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAB901"

                        'STJ
            Case 9
                Clipboard.Clear
                Clipboard.SetText "R1PAB001" & "# " & c_rmo$ & "# " & c_pro$ & "# " & n_pro$ & "# " & n_pes$ & "# " & "C" & "# " & c_osg$ & "# " & e_osg & "# " & u_vrs_osg$
                su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FOS401"
            '***

        End Select
120
121      ' grava parâmentros a serem passados para outro projeto (.INI)
122      su_grava_arquivo POS%
123    Else
124        Screen.MousePointer = DEFAULT
125        Exit Sub
126    End If
127
128    ' fecha conexão para a chamada de outro projeto
129    su_fecha_conexao
130
131    'Me.Hide
132
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '======================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " ")
'    Else
'        iExecOk% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + sArqExec$ & " ", MinEnableFalse%)
'    End If
    iExecOk% = FU_MonitoraExe(Me, Empty, sArqExec$, Empty, , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not iExecOk% Then
        MsgBox "Não foi possível executar o projeto" & Chr(13) & sArqExec$ & " - PROJETO DE ITEM", 48
    End If
    
'133    ' chamada do executável
'134    If Not FU_Monitora_Exec(Me, sArqExec$ & " ") Then
'135        MsgBox "Não foi possível executar o programa ('" & sArqExec$ & "')."
'136    End If
   
    'LUCIANE - 05/07/1999
    '======================================================================

137
138    ' reestabelece conexão após a execução de outro projeto
139    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
140
141    If Trim$(c_agr_fam_pro$) <> "5" And Trim$(c_agr_fam_pro$) <> "6" Then
142        Me.Show
143    Else
144        'Inicializa as variáveis de controle do retorno do programa
145        Mudou_Item = False
146        Novo_Item = 1
147
148        'Pega os dados de retorno do programa
149        su_le_clip_board
150
151        If Mudou_Item Then
152            Unload Me
153            R1FAB001.Show
154        Else
155            Me.Show
156        End If
157
158    End If
159
160    Screen.MousePointer = DEFAULT
161    Exit Sub

162 ERRO:
163    MsgBox Err & " " & error & " " & Erl
164    Screen.MousePointer = DEFAULT
       Exit Sub
    Resume
End Sub

Private Sub bu3d_isg_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Dados do Item Segurado"

End Sub

Private Sub Bu3d_Mar_Click()
'+--------------------------------------------------------------------------+
'|               DISPONIBILIZA A TELA DO MARINHEIRO                        |
'+--------------------------------------------------------------------------+
    Screen.MousePointer = HOURGLASS

    R1FAB015.Show
    Me.Hide
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_plano_Click()
    
    ' nome do executável
    Dim sArqExec    As String
    
    ' armazena retorno da função que faz a chamada do executável
    Dim iExecOk     As Integer
    
    ' armazena a posicao do aditamento no array dad_adi
    Dim POS As Integer

    Screen.MousePointer = HOURGLASS

    Select Case c_agr_fam_pro$
        Case "2"
            sArqExec$ = "R1PAA201.EXE"
        Case Else
            sArqExec$ = "R1PAB201.EXE"
    End Select
    
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
    
    If cb_u_adi.ListIndex = 0 Then
        POS% = UBound(dad_adi)
    Else
        POS% = cb_u_adi.ListIndex - 1
    End If

    u_adi$ = dad_adi(POS%).u_adi

    ' seleciona os dados a serem gravados no arquivo
    ' utilizado no acesso de outro projeto
    If fu_trata_dados_arq() Then
    
        Select Case c_agr_fam_pro$
            
            Case "2"
                su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAA201"
            Case Else
                su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAB201"
        
        End Select
        
        ' grava parâmetros a serem passados para outro projeto (.INI)
        su_grava_arquivo POS%
        
        If cb_u_adi.ListIndex > 0 Then
            su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "pos_atual", "FALSE"
        Else
            su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "pos_atual", "TRUE"
        End If
        
    Else
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If
    
    ' fecha conexão para a chamada de outro projeto
    su_fecha_conexao
    
    'Me.Hide
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '======================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " " & n_apl_chm$)
'    Else
'        iExecOk% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + sArqExec$ & " " & n_apl_chm$, MinEnableFalse%)
'    End If
    iExecOk% = FU_MonitoraExe(Me, Empty, sArqExec$, n_apl_chm$, , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not iExecOk% Then
        MsgBox "Não foi possível executar o projeto" & Chr(13) & sArqExec$ & " - PROJETO DE PLANO GARANTIA", 48
    End If

    ' chamada de outro projeto
    'iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " " & n_apl_chm$)
    
    'If Not iExecOk% Then
    '    MsgBox "Opção ainda não disponível ('" & sArqExec$ & "')."
    'End If

    'LUCIANE - 05/07/1999
    '======================================================================
    
    ' reestabelece conexão após a execução de outro projeto
    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
    
    Me.Show

    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_plano_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Dados do Plano de Garantia"

End Sub

Private Sub BU3D_ReimpPrp_Click()

    Dim retorno As Boolean
    Dim l_program As String
    Dim novoprocesso As New IX2DPDLVBC01.ProcessoDeploy

    l_program = "IR3VIDCTC03VBNV.exe"
    
    retorno = novoprocesso.ExecutaDeployAssembly_2(l_program)
    If Not retorno Then
        MsgBox "Erro na execução da aplicação " & l_program & ".", MB_ICONEXCLAMATION, "Consulta Proposta."
        Exit Sub
    End If
    Me.Hide
    novoprocesso.aguardaTerminoPrograma
    Me.Show

    
End Sub

Private Sub bu3d_t_apo_Click()

' contador para o combo de tipo de textos
Dim i       As Integer

' percorre array de textos
Dim j       As Integer

' indica se existe ou não um determinado tipo de texto no array
Dim found   As Integer

    ' Apólice Diferenciado
    'STJ
    'If Val(c_agr_fam_pro$) = 2 Or Val(c_agr_fam_pro$) = 5 Or Val(c_agr_fam_pro$) = 6 Or Val(c_agr_fam_pro$) = 9 Then
    ' mostrar o texto da tb_adi - diferenciado
    If Val(c_agr_fam_pro$) = 2 Or Val(c_agr_fam_pro$) = 9 Then
    '***
        'Ini Gabriela - 17/09/2001 - R1PAB082 - problemas com o Diferenciado devido a versão do controle com papel
        'os valores que estavam anteriormente estão inibidos
        R1FAB005.fr_txt_apo.Top = 3315          '1935
        R1FAB005.fr_txt_apo.Height = 1575       '3100

        R1FAB005.tb_t_apo.Top = 240             '285
        R1FAB005.tb_t_apo.Height = 1215         '2475
        'Fim Gabriela - 17/09/2001 - R1PAB082
        
        'Ini Gabriela - 17/07/2001 - novo frame de controle de documento (somente Massa)
        R1FAB005.fr_ctl_doc.Visible = False
        'Fim Gabriela - 17/07/2001
                    
        If Not fu_sel_txt_apo() Then
            Screen.MousePointer = DEFAULT
            If e_emi_ppl = 5 Then ReDim dad_t_lin_txt(-1 To -1) 'ZEZE: GoTo Continua  'v56 Emilio 03/07/2006
            MsgBox "Apólice não possui Textos!", MB_ICONINFORMATION, txt_msg$
            Exit Sub
        End If
        
        ' não existem textos para a apólice (qualquer aditamento)
        'If Not existe_dad_t_lin_txt% Then
        '    Screen.MousePointer = DEFAULT
        '    MsgBox "Apólice não possui textos.", , txt_msg$
        '    Exit Sub
        'End If
    
Continua:
        ' verifica se o aditamento escolhido possui texto
        '10/06/1998
        For i% = 1 To 10
            found% = False
            
            For j% = 0 To UBound(dad_t_lin_txt)
                If dad_t_lin_txt(j%).U_OCR_CLA = 0 Then
                    'STJ
                    If dad_t_lin_txt(j%).e_txt_apo = i% Or Val(c_agr_fam_pro$) = 9 Then
                        found% = True
                        Exit For
                    End If
            
                End If
            
            Next j%
            
            ' não foram encontrados textos para o aditamento
            If found% Then
                Exit For
            End If

        Next i%
    Else
        R1FAB005.fr_txt_apo.Top = 1935
        R1FAB005.fr_txt_apo.Height = 2655

        R1FAB005.tb_t_apo.Top = 240
        R1FAB005.tb_t_apo.Height = 2295

        R1FAB005.lb_isg.Visible = False
        R1FAB005.cb_isg.Visible = False
        R1FAB005.lb_e_txt_apo.Visible = False
        R1FAB005.cb_txt_apo.Visible = False
                       
        'Ini Gabriela - 17/07/2001 - novo frame de controle de documento (somente Massa)
        R1FAB005.fr_ctl_doc.Visible = True
        R1FAB005.fr_ctl_doc.Top = 3960      '4080   ' cris - 04/01/2002 - conforme Lucia
        R1FAB005.fr_ctl_doc.Height = 1170   '975    ' cris - 04/01/2002 - conforme Lucia
        'Fim Gabriela - 17/07/2001

    End If

    R1FAB005.Show
    R1FAB002.Hide

End Sub

Private Sub bu3d_t_apo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Dados Complementares da Apólice"

End Sub

Private Sub bu3d_tco_Click()
    
    ' nome do executável
    Dim sArqExec    As String
    
    ' armazena retorno da função que faz a chamada do executável
    Dim iExecOk     As Integer
    
    ' armazena a posicao do aditamento no array dad_adi
    Dim POS As Integer

    Screen.MousePointer = HOURGLASS

    sArqExec$ = "R1PAB401.EXE"
    
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

    If cb_u_adi.ListIndex = 0 Then
        POS% = UBound(dad_adi)
    Else
        POS% = cb_u_adi.ListIndex - 1
    End If

    u_adi$ = dad_adi(POS%).u_adi
    
    ' seleciona os dados a serem gravados no arquivo
    ' utilizado no acesso de outro projeto
    If fu_trata_dados_arq() Then
        su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAB401"
        ' grava parâmetros para acesso a outro projeto
        su_grava_arquivo POS%
    Else
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If
    
    ' fecha conexão para a chamada de outro projeto
    su_fecha_conexao
    
    'Me.Hide
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '======================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " ")
'    Else
'        iExecOk% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + sArqExec$ & " ", MinEnableFalse%)
'    End If
    iExecOk% = FU_MonitoraExe(Me, Empty, sArqExec$, Empty, , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not iExecOk% Then
        MsgBox "Não foi possível executar o projeto" & Chr(13) & sArqExec$ & " - PROJETO DADOS TÉCNICOS ", 48
    End If
    
    ' chamada de outro projeto
    'iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " ")
    '
    'If Not iExecOk% Then
    '    MsgBox "Opção ainda não disponível ('" & sArqExec$ & "')."
    'End If

    'LUCIANE - 05/07/1999
    '======================================================================

    ' reestabelece conexão após a execução de outro projeto
    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
    
    Me.Show

    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_tco_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
        
    If Val(c_agr_fam_pro$) <> 5 Then
        pa3d_status.Caption = "R1FAB002 - Dados Técnicos"
    Else
        pa3d_status.Caption = "R1FAB002 - Dados Complementares"
    End If

End Sub

Private Sub bu3d_txt_Click()
    Screen.MousePointer = HOURGLASS
  
    If Not fu_grava_parametro() Then
    End If
   
    'Fecha conexão
    su_fecha_conexao
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '======================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        ret% = FU_Monitora_Exec(Me, "r1ptx001.exe ")
'    Else
'        ret% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + "R1PTX001.EXE ", MinEnableFalse%)
'    End If
    Ret% = FU_MonitoraExe(Me, Empty, "R1PTX001.EXE", Empty, , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not Ret% Then
        Screen.MousePointer = DEFAULT
        MsgBox "Não foi possível executar o projeto" & Chr(13) & "R1PTXT01 - PROJETO DO TEXTO", 48
        SqlConn% = FU_Conecta_Servidor(Servidor_Id%)
        Exit Sub
    End If

    'Executar o projeto de item do produto saúde
    'If Not FU_Monitora_Exec(Me, "r1ptx001.exe ") Then
    '    Screen.MousePointer = DEFAULT
    '    MsgBox "Não foi possível executar o projeto" & Chr(13) & "R1PTXT01 - PROJETO DO TEXTO", 48
    '    sqlconn% = fu_conecta_servidor(servidor_id%)
    '    Exit Sub
    'End If

    'LUCIANE - 05/07/1999
    '======================================================================
                               
    'Estabelecer nova conecção com o servidor
    SqlConn% = FU_Conecta_Servidor(Servidor_Id%)
    
    Screen.MousePointer = DEFAULT

    R1FAB002.Show

End Sub

Private Sub bu3d_u_apo_pge_Click()

    MsgBox "Apólice Gênius (País,Apólice,Ramo,Ano,Sequência): " & u_apo_genius$ & Chr(10) & " e " & t_apo_pgm_genius$, MB_ICONINFORMATION, "R1FAB002 - Consulta Número da Apólice Gênius"

End Sub

Private Sub bu3d_u_apo_pge_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "Apólice Gênius (País,Apólice,Ramo,Ano,Sequência): " & u_apo_genius$ & " e " & t_apo_pgm_genius$
    
    bu3d_u_apo_pge.ToolTipText = "Apólice Gênius (País,Apólice,Ramo,Ano,Sequência): " & u_apo_genius$ & " e " & t_apo_pgm_genius$

End Sub


Private Sub bu3d_u_prc_ssp_Click()

'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
' Autor: Emilio Lacerda Conde
' Data: 28/06/2006
' Objetivo: Buscar o número do processo SUSEP Singular na TB_DAD_TCO_APO
'           caso contrário buscar por ramo/produto na tabela TB_RMO_PRO_CPL.
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

    'Diego Ponciano - BRQ - 13/05/2013 - PR-2013-0001507
    'Mostra modalidade para processos Resid.
    Dim msg As String
    
    msg = "Número do processo SUSEP: " & Chr(10) & Chr(10) & u_prc_ssp
    If modalidade <> "" Then
        msg = msg & ". Modalidade " & modalidade
    End If
    
    MsgBox msg, MB_ICONINFORMATION, "R1FAB002 - Consulta número do processo SUSEP"
    

End Sub

Private Sub bu3d_u_prc_ssp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Número do processo SUSEP: " & u_prc_ssp
    bu3d_u_prc_ssp.ToolTipText = "Número do processo SUSEP: " & u_prc_ssp
    
End Sub

Private Sub BU3D_Volta_Click()
    
    R1FAB001.Show

    Unload Me
    
    ' limpa controles e variáveis
    su_inicializa_campos True
    'R1FAB001.tb_u_Apo_Pnc.SetFocus

    'Alimenta e_fam_pro, c_agr_fam_pro e c_pro com conteudo do command
    If Not fu_separa_param1(Command$) Then
        MsgBox "Erro na passagem de parâmetros.", 48
        End
    End If
    
End Sub

Private Sub bu3d_Volta_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Volta à tela anterior"

End Sub

Private Sub bu3d_X_Click()

    ' nome do executável
    Dim sArqExec    As String
    
    ' armazena retorno da função que faz a chamada do executável
    Dim iExecOk     As Integer
    
    ' armazena a posicao do aditamento no array dad_adi
    Dim POS As Integer

    Screen.MousePointer = HOURGLASS

    sArqExec$ = "R1PAB?01.EXE"
    
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

    If cb_u_adi.ListIndex = 0 Then
        POS% = UBound(dad_adi)
    Else
        POS% = cb_u_adi.ListIndex - 1
    End If

    u_adi$ = dad_adi(POS%).u_adi

    ' seleciona os dados a serem gravados no arquivo
    ' utilizado no acesso de outro projeto
    If fu_trata_dados_arq() Then

        su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAB?01"

        su_grava_arquivo POS%

    End If
    
    ' fecha conexão para a chamada de outro projeto
    su_fecha_conexao
    
    'Me.Hide
    
    'v60 Emilio 22/08/2006 - início
    'Obs.: Migração XP para novo catalogador - Função descontinuada
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'    '======================================================================
'    'LUCIANE - 05/07/1999
'    If OSAmbiente = "Windows 3.11" Then
'        iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " ")
'    Else
'        iExecOk% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + sArqExec$ & " ", MinEnableFalse%)
'    End If
    iExecOk% = FU_MonitoraExe(Me, Empty, sArqExec$, Empty, , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not iExecOk% Then
        MsgBox "Não foi possível executar o projeto" & Chr(13) & sArqExec$ & " - PROJETO DO TEXTO", 48
    End If

    'iExecOk% = FU_Monitora_Exec(Me, sArqExec$ & " ")
    'If Not iExecOk% Then
    '    MsgBox "Opção ainda não disponível ('" & sArqExec$ & "')."
    'End If

    'LUCIANE - 05/07/1999
    '======================================================================
    
    ' reestabelece conexão após a execução de outro projeto
    SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
    
    Me.Show

    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_X_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - X"

End Sub

Private Sub cb_u_adi_Click()
  
    ' armazena a posicao do aditamento no array dad_adi
    Dim POS As Integer
    
    ' O combo tem a posicao consolidada duplicada (1o. e último elemento
    ' do combo).
    ' Se o 1o. elemento for escolhido, os dados do aditamento no array dad_adi
    ' se encontrarão na última posicão do array.
    '           no combo               no array
    '    0-5  (  POSICAO ATUAL  )
    '    1-1                                1
    '    2-2                                2
    '    3-3                                3
    '    4-5                                5
    
    ' aditamento 5 - corresponde somente ao último elemento do array
    
    Screen.MousePointer = HOURGLASS
    
    If cb_u_adi.ListIndex = 0 Then
        POS% = UBound(dad_adi)
    Else
        POS% = cb_u_adi.ListIndex - 1
    End If
    
    u_adi$ = dad_adi(POS%).u_adi
    U_VRS_ADI$ = dad_adi(POS%).U_VRS_ADI
    
    C_E_MLD$ = dad_adi(POS%).C_E_MLD
    c_cph$ = dad_adi(POS%).c_cph
    c_oft_cph$ = dad_adi(POS%).c_oft_cph
    u_lot_oft$ = dad_adi(POS%).u_lot_oft
    e_emi_ppl% = dad_adi(POS%).e_emi_ppl
    c_agr_rmu$ = dad_adi(POS%).c_agr_rmu
    e_mig_adi = dad_adi(POS%).e_mig_adi 'v97 Emilio - 22/03/2011 - SS_163237 - Tombamento Auto ISa+r
    
    'v99 Emilio 23/05/2011 - SS_163237 - Tombamento Auto Frota UBB x ISa+r - início
    'Adriano - Inicio
    'Verificar se a apólice foi emitida via workflow
    If Not FU_VERIFICA_EMI_WN() Then
        MsgBox "Não foi possível verificar se a apólice foi emitida via workflow.", MB_ICONEXCLAMATION, "ATENÇÃO"
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If
    'Adriano - Fim
    'v99 Emilio 23/05/2011 - SS_163237 - Tombamento Auto Frota UBB x ISa+r - fim
    
    ' altera os dados da tela de acordo com o aditamento escolhido
    su_preenche_campos POS%
    
    u_ocr_l_crs$ = dad_adi(POS%).u_ocr_l_crs
    
    ' As tabelas dbnprod..tb_his_isg_apo e dbnprod..tb_osg_aut
    ' deverão ser consultadas novamente
    ' se for escolhido um outro aditamento no combo, os dados deverão
    ' ser consultados novamente
    Flag% = True
    
    ' Diego Ponciano - BRQ - 13/05/2013 - PR-2013-0001507 - INICIO
    '   Limpa variaveis de SUSEP para não mostrar no popup valores de pesquisas anteriores
    u_prc_ssp = ""
    modalidade = ""
    '   Circular 438 - Ramos 14 e 31, seleciona processo SUSEP
    ' pela data de vigência (PR_PRC_SSP_S21427).
    If (c_rmo = 31 Or c_rmo = 14) Then
        If Not FU_PR_PRC_SSP_S21427 Then
            Screen.MousePointer = DEFAULT
            Exit Sub
        End If
    Else
        '========================================================================
        '  VERSÃO 67  - SSTI 46341 (Alteração do número do processo SUSEP)
        '  Semíramis em 02/04/2008 - Mostra histórico do u_prc_ssp
        '------------------------------------------------------------------------
        '  A chamada desta STP estava no load do form R1FAB002. Foi transferida
        '  para atender a SSTI 46341.
        '========================================================================
        If Not FU_PR_DAD_TCO_APO_G07704 Then
            msgerro = msgerro & vbCrLf & vbCrLf & "Por favor contacte o analista responsável pelo sistema."
            Screen.MousePointer = DEFAULT
            MsgBox msgerro, MB_ICONSTOP
            Exit Sub
        End If
        '=================================
        '  VERSÃO 67  - SSTI 46341
        '  Fim da alteração - 02/04/2008
        '=================================
    End If
    ' Diego Ponciano - BRQ - 13/05/2013 - PR-2013-0001507 - FIM
    If fu_seleciona_cvd_pnc() Then
        
        If Not fu_sel_cvd() Then
            Screen.MousePointer = DEFAULT
            Exit Sub
        End If

    End If
        
    lb_n_pes_cor.Caption = " " & n_pes_cor$
    
    lb_c_cvd.Caption = " " & Trim$(Format$(e_cvd_prp$, "00") + ".")
    lb_c_cvd.Caption = lb_c_cvd.Caption & Trim$(Format$(u_rgt_ssp_prp$, "000000000")) & "."
    lb_c_cvd.Caption = lb_c_cvd.Caption & Trim$(Format$(u_dco_rgt_ssp_prp$, "0")) & "."
    lb_c_cvd.Caption = lb_c_cvd.Caption & Trim$(Format$(c_loc_pgt_cvd_prp$, "00"))
    ''minitir - ss_199801 - 21/03/2012 - INI
    If c_cia_ita = 33 And (c_rmo = 31 Or c_rmo = 14) Then
        lb_c_cvd.Caption = lb_c_cvd.Caption & "." & Trim$(Format$(IIf(Trim(c_und_cvd_prp$) = "", 0, c_und_cvd_prp$), "0000"))
    End If
    ''minitir - ss_199801 - 21/03/2012 - FIM
    
    d_ini_vig_adi$ = dad_adi(POS%).d_ini_vig_adi
    
    
    'Fumiko - 27/03/2009
    'Como na renovação pode pedir titulo, refaz consulta
    If Val(c_agr_fam_pro$) = 1 Or Val(e_fam_pro$) = 4 Or Val(c_agr_fam_pro$) = 4 Then 'Se auto, RPM e vida
        bu_Titulos.Visible = False
        ' através do número da apólice verifica se tem titulo
        ' na dbnprod..tb_tit_cpz
        If fu_sel_tit_cpz_titulo(1) Then
            bu_Titulos.Visible = True
        End If
    End If

    
    DoEvents
    
    SU_Item_Segurado
    
'v99 Emilio 23/05/2011 - SS_163237 - Tombamento Auto Frota UBB x ISa+r - início
'    'Adriano - Inicio
'    'Verificar se a apólice foi emitida via workflow
'    If Not FU_VERIFICA_EMI_WN() Then
'        MsgBox "Não foi possível verificar se a apólice foi emitida via workflow.", MB_ICONEXCLAMATION, "ATENÇÃO"
'        Screen.MousePointer = DEFAULT
'        Exit Sub
'    End If
'    'Adriano - Fim
'v99 Emilio 23/05/2011 - SS_163237 - Tombamento Auto Frota UBB x ISa+r - fim
    
    ' Carla 29/06/2005
    If VT_TIPO_EMI_PRP.u_paa_doc_ged$ <> "0" And VT_TIPO_EMI_PRP.u_paa_doc_ged$ <> Empty Then
        su_habilita_botao BU3D_Consulta_Pasta, True
    Else
         su_habilita_botao BU3D_Consulta_Pasta, False
    End If

    
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub Form_Activate()

    'Katsumi - 14/10/1999
    If Not fu_sel_rmo_pro() Then
        MsgBox "Erro na função fu_sel_rmo_pro.", MB_ICONEXCLAMATION, "ATENÇÃO"
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If
     
End Sub

Private Sub Form_DblClick()
    
    MsgBox sg_versao$, MB_ICONINFORMATION, "VERSÃO"

End Sub
Private Sub Form_Load()
    
    Dim Aux$          ' auxiliar para preenchimento de campos/controles
    Dim i As Integer  ' contador utilizado em loops
    Dim APOLICE_MAINFRAME As String
    Dim apolice_mainframe_bnj As String
    Dim existe_func As String
    Dim Aux_genius As String
    Dim adi_atual As Integer
    Dim bfu_sel_dados_marinha As Boolean
                               
    Screen.MousePointer = HOURGLASS
       
    SU_Ajusta_Form Me, 6
    '** dosstos ** ** rafacds ** - 13/03/2013
     bu1_Cotacao.Visible = False
    
    'Busca família de produto
    If Not fu_sel_fam_pro() Then
        MsgBox "Erro na seleção da Família/Produto.", 48, "Consulta Apólice"
        End
    End If
    
    'Verifica se é frota
    
    'Adriano - 16/08/2013 - inicio - PJotinha
    
    If fu_prp_aut_frt() = True Then
    
    'If FU_AGR_PRO_S18748() = True Then
        Frame_Atividade_Empresa.Visible = True
        SSFrame_Pri_Risco.Visible = True
        
        'Márcia Abreu - Inicio  - 05/01/2012 - Campo apo 2. risco (s/n)
        Fra_Apo_segundo_risco.Visible = True
        'Márcia Abreu - Final   - 05/01/2012 - Campo apo 2. risco (s/n)
        
        lb_mdd_aut_frt.Visible = True 'Adelamg SS 156649
        
        fr3d_dados.Top = 8600
        Me.Height = 8600
    Else
        Frame_Atividade_Empresa.Visible = False
        SSFrame_Pri_Risco.Visible = False
        
        'Márcia Abreu - Inicio  - 05/01/2012 - Campo apo 2. risco (s/n)
        Fra_Apo_segundo_risco.Visible = False
        'Márcia Abreu - Final   - 05/01/2012 - Campo apo 2. risco (s/n)
        
        lb_mdd_aut_frt.Visible = False 'Adelamg SS 156649
    
        fr3d_dados.Top = 6362
        Me.Height = 7000
    End If
    
    Me.BackColor = &H8000000F
    Me.Top = (Screen.Height) / 2 - Me.Height / 2 'centraliza o formulário
    Me.Left = (Screen.Width) / 2 - Me.Width / 2 'centraliza o formulário
    
    'Adelamg 05/04/2007
    'Verifica se o segurado é correntista
    If Not FU_PR_HIS_TCO_APO_G13172() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Erro ao executar a procedure: PR_HIS_TCO_APO_G13172", MB_ICONSTOP
        Exit Sub
    End If
    
    'Emilio 17/01/2001 início
    ' Mostra o nº SAV se for produto diferenciado
    ' (c_agr_fam_pro : 5,6,9); exceto Saúde.
    If c_agr_fam_pro$ = "5" Or c_agr_fam_pro$ = "6" Or c_agr_fam_pro$ = "9" Then
        If Not FU_PR_CTL_EMI_SAV_S10096() Then
            MsgBox "Erro no acesso ao número SAV. Entrar em contato com o analista responsável", vbCritical
        End If
        lb_u_sav.Caption = u_sav$
        lb_u_sav.Visible = True
        lb_sav.Visible = True
    End If
    
    'Dilson - SS_129444 - Ini
    'Verifica se o ramo/produto está cadastrado na tabela do produtar
    'Se positivo Indica que é uma Apólice do Produto Garantia Estendida Garantech
    If Not Fu_Agrup_Garantech() Then
        Screen.MousePointer = DEFAULT
        MsgBox "Erro no Acesso ao Tipo de Agrupamento Garantech, não cadastrado.", 48
    End If
    'Dilson - SS_129444 - Fim
    
    '===================================================================
    '  VERSÃO 67  - SSTI 46341
    '  Comentado por Semíramis em 02/04/2008
    '  Chamada da STP passou para o click do CB_U_ADI no form R1FAB002
    '===================================================================
    
    'v60 Emilio 22/08/2006 - início
    'If Not FU_PR_DAD_TCO_APO_G07704 Then
    '    msgerro = msgerro & vbCrLf & vbCrLf & "Por favor contacte o analista responsável pelo sistema."
    '    Screen.MousePointer = DEFAULT
    '    MsgBox msgerro, MB_ICONSTOP
    '    Exit Sub
    'End If
    'v60 Emilio 22/08/2006 - fim
    
    '==================================
    '  VERSÃO 67  - SSTI 46341
    '  Fim do comentário - 02/04/2008
    '==================================
    
    Show

    SU_Verifica_Duplicidade Me

    Refresh
    
    
    '/** SS.177593 RS.1552 / IR3 - Reimpressão de Proposta Vida. **/'
    'If c_agr_fam_pro = "4" Or c_agr_fam_pro = "3" Then   'VIDA OU RESIDÊNCIA.
    '/** SS205250 RS 1678 Incidente 7751965 - Novo Produto APC abertura conta - inibição proposta MARCEP
    If (c_agr_fam_pro = "4" And Not (c_rmo = 82 And c_pro = 214)) Or (c_agr_fam_pro = "3") Then   'VIDA (-82/214) OU RESIDÊNCIA.
        BU3D_ConsultaProposta.Visible = True
        'SS_133492 - Workflow Inspeção de Risco
        'Início
        If c_rmo$ = 18 And c_pro$ = 51 Then
            bu3d_sys_irc.Visible = True
        End If
        'Fim
    Else
        BU3D_ConsultaProposta.Visible = False
    End If
    '/** SS.177593 RS.1552 / IR3 - Reimpressão de Proposta Vida. **/'
    
    'Impressão de Proposta de Adesão ao Seguro Crediário PR-2012-0022015 - I
    If c_rmo = 77 And c_pro = 52 Then
         BU3D_ConsultaProposta.Visible = True
    End If
    'Fim
    
    ' Em caso de chamada ao Form que não seja o do R1FAB001 -> volta% = false
    ' Se a chamada for através do form R1FAB001             -> volta% = true
    If volta% = False Then
        Caption = "Consulta à Apólice - " & dad_apo(i%).t_fam_pro
            
        ' se diferenciado alterar Dados Técnicos p/ Dados Complementares
        If c_agr_fam_pro$ <> "5" And c_agr_fam_pro$ <> "6" Then
            lb_tco_cpl.Caption = "Técnicos"
            lb_tco_cpl.Left = 2400
        Else
            lb_tco_cpl.Caption = "Dados Cpl."
            lb_tco_cpl.Left = 2355
        End If
        
        SU_Limpa_Controles

        If Not fu_tb_apo() Then
            MsgBox "Erro ao Acessar a Apólice."
            BU3D_Volta_Click
        End If
        
        'Katsumi - 28/01/2002 - inicio
        'Produto Seguro Funcionário
        If Not FU_PR_AGR_PRO_S10840() Then
            MsgBox "Erro no acesso a PRS10840.", MB_ICONSTOP
            Screen.MousePointer = DEFAULT
            Exit Sub
        End If
    
    '+--------------------------------------------------------------------------+
    '| Carrega o resultado da leitura                                           |
    '+--------------------------------------------------------------------------+
        Ret% = SqlResults%(SqlConn%)
        
        Do Until Ret% = NOMORERESULTS Or Ret% = FAIL
            Ret% = SqlNextRow%(SqlConn%)
            
            Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
                existe_func$ = SqlData$(SqlConn%, 9)
                Ret% = SqlNextRow%(SqlConn%)
            Loop
            
            Ret% = SqlResults%(SqlConn%)
        Loop
        
        'Verifica erro
        If ERRO_SQL% Then
            SU_LogOff
            MsgBox MSG_ERRO_SQL$, MB_ICONSTOP, Space$(30) & "Erro na Execução de SP" & Space$(55)
            Screen.MousePointer = DEFAULT
            Exit Sub
        End If

        If existe_func$ <> "0" And existe_func$ <> Empty Then
            ind_produto_func = True
        Else
            ind_produto_func = False
        End If
        
        If ind_produto_func = True Then
            Bu3d_Func.Visible = True
        End If
        'Katsumi - 28/01/2002 - fim

        'Adelamg 18/10/2010
        'Recupera dados do seguro auto marinha
        
        bfu_sel_dados_marinha = False
        
        bfu_sel_dados_marinha = fu_sel_dados_marinha()
        
        If bfu_sel_dados_marinha Then
            Bu3d_Mar.Visible = True
            Bu3d_Mar.Left = 3180
        Else
            Bu3d_Mar.Visible = False
            Bu3d_Mar.Left = 3180
        End If
        
        ReDim dad_apo_pge(-1 To -1)
        
        If fu_sel_apo_genius() Then
            bu3d_u_apo_pge.Visible = True
        End If
        If UBound(dad_apo_pge) <> -1 Then
            lb_adi_pge_ixl.Caption = Space(12) & "Gênius"
            lb_adi_pge_ixl.Visible = True
            
            If dad_apo_pge(0).u_apo_pge = Empty Then
                u_apo_genius$ = "Não Informada"
            Else
                u_apo_genius$ = dad_apo_pge(0).c_pas_pge
                u_apo_genius$ = u_apo_genius$ & "." & dad_apo_pge(0).u_apo_pge
                u_apo_genius$ = u_apo_genius$ & "." & dad_apo_pge(0).c_rmo_pge
                u_apo_genius$ = u_apo_genius$ & "." & dad_apo_pge(0).c_ano_pge
                u_apo_genius$ = u_apo_genius$ & "." & dad_apo_pge(0).c_seq_pge
            End If
            
            If dad_apo_pge(0).i_apo_pge = "S" Then
                t_apo_pgm_genius$ = "é Apólice de Programa"
            Else
                t_apo_pgm_genius$ = "Não é Apólice de Programa"
            End If
        End If
        
        lb_texto_migracao.Visible = False
                
        If e_mig$ = "1" Then  'Apolice migrada (COM DE PARA)
            'Banerj
            If c_cia_ita$ = "7" Then
                
                If Not fu_sel_apo_mfr_ptn_velha_bnj(apolice_mainframe_bnj$) Then
                    MsgBox "Apólice da Nova Arquitetura não encontrada na Tabela de Migração do Mainframe.", 48
                    lb_texto_migracao.Caption = "       Apólice Migrada do Mainframe          "
                Else
                    lb_texto_migracao.Caption = " Apólice Migrada do Mainframe Banerj    " & apolice_mainframe_bnj$
                    
                    If UBound(dad_apo_mfr_bnj) > 0 Then
                        sp_apo_mfr.Visible = True
                    End If

                End If

            'Itaú
            Else

                If Not fu_sel_apo_mfr_ptn_velha(APOLICE_MAINFRAME$) Then
                    MsgBox "Apólice da Nova Arquitetura não encontrada na Tabela de Migração do Mainframe.", 48
                    lb_texto_migracao.Caption = "       Apólice Migrada do Mainframe          "
                Else
                    lb_texto_migracao.Caption = "    Apólice Migrada do Mainframe Itaú        " & APOLICE_MAINFRAME$
                    
                    If UBound(dad_apo_mfr) > 0 Then
                        sp_apo_mfr.Visible = True
                    End If
    
                End If
            
            End If

            lb_texto_migracao.Visible = True

        ElseIf e_mig$ = "2" Then  'Apolice migrada (TRANSPORTE)
            lb_texto_migracao.Caption = "       Apólice Migrada do Mainframe          "
            lb_texto_migracao.Visible = True
            
        'Dilson - SS_129444 - Ini
        ' = 14 - Migrada da Garantech
        ElseIf e_mig$ = "14" Then
            lb_texto_migracao.Caption = "       Apólice Migrada Garantech          "
            lb_texto_migracao.Visible = True
        'Dilson - SS_129444 - Fim

        ElseIf e_mig$ = "5" Or e_mig$ = "6" Then  'Apolice migrada (AGF)

            If Not FU_SEL_APO_MFR_PTN_VELHA_AGF(APOLICE_MAINFRAME$) Then
                MsgBox "Apólice da Nova Arquitetura não encontrada na Tabela de Migração do Mainframe (AGF).", 48
                lb_texto_migracao.Caption = " Apólice Migrada (AGF)"
            Else
                'Katsumi - 05/03/2004 - inicio
                If Not FU_SEL_APO_AGF(APOLICE_MAINFRAME$) Then
                    MsgBox "Dados da Apólice da Nova Arquitetura não encontrada na Tabela de Apólice (AGF).", 48
                    lb_texto_migracao.Caption = " Apólice Migrada (AGF)"
                End If
                'Katsumi - 05/03/2004 - fim
                
                lb_texto_migracao.Caption = "Apólice Migrada (AGF): " & APOLICE_MAINFRAME$ & Space(2) & "Vig. 1ª Fatura Itaú: " & d_vig_prx_agf$
            End If

            lb_texto_migracao.Visible = True
            
        ElseIf e_mig$ = "8" Then   'Apolice migrada (XL)
                lb_texto_migracao.Move 4380, 1500, 2205, 255
                lb_texto_migracao.Alignment = vbCenter
                lb_texto_migracao.Caption = "Apólice Migrada da XL "
                lb_texto_migracao.Visible = True
                lb_adi_pge_ixl.Caption = "Gênius/Mig.XL"
                lb_adi_pge_ixl.Visible = True
        
        'v68 Emilio 19/05/2008 - início
        'ElseIf e_mig$ = "10" Then   'Apólice Migrada Itauprev
        
        'e_mig = 10 - Apólice Migrada Itauprev
        'e_mig = 11 - Apólice com Sinistro Itauprev
        'e_mig = 12 - Reabilitação de Apólice Cancelada Itauprev
        ElseIf e_mig$ = "10" Or e_mig$ = "11" Or e_mig$ = "12" Then 'v73 Emilio 30/09/2008

            If Not FU_SEL_APO_MFR_PTN_VELHA_AGF(APOLICE_MAINFRAME$) Then
                MsgBox "Apólice da Nova Arquitetura não encontrada na Tabela de Migração do Mainframe (Itauprev).", 48
            End If
            
            lb_texto_migracao.Move 5175, 1710, 3270, 225
            lb_texto_migracao.Alignment = vbCenter
            lb_texto_migracao.BorderStyle = vbBSNone
            If e_mig$ = "10" Then
                lb_texto_migracao.Caption = "Apólice Migrada (Itauprev)"
            ElseIf e_mig$ = "11" Then
                lb_texto_migracao.Caption = "Apólice com Sinistro (Itauprev)"
            ElseIf e_mig$ = "12" Then
                lb_texto_migracao.Move 4175, 1710, 3970, 225
                lb_texto_migracao.Caption = "Reabilitação de Apólice Cancelada (Itauprev)"
            End If
            
            lb_texto_migracao.Visible = True
        'v68 Emilio 19/05/2008 - fim
        ElseIf e_mig$ = "20" Or e_mig$ = "21" Then 'Kondor - SS 132490
            If e_mig$ = "20" Then
                lb_texto_migracao.Caption = "Apólice Prestamista UBB"
            Else
                lb_texto_migracao.Caption = "Apólice Cancelada Prestamista UBB"
            End If
            
            If Not FU_PR_MVP_UBB_MIS_S19169() Then
                MsgBox "Apólice não encontrada na Tabela de Migração do Prestamista PU (UBB)", 48
            End If
            
            If i_exi_sin_mis = "S" Then
                lb_texto_migracao.Caption = lb_texto_migracao.Caption + " (com sinistro)"
            End If
            
            lb_texto_migracao.Move 4080, 1470, 4365, 225
            lb_texto_migracao.Visible = True
            
        'Daniel - SS_163237 - Ini
        ' = 18 - Migração Tombamento Residência UBB
        ElseIf e_mig$ = "18" Then
            lb_texto_migracao.Caption = "Apólice Migrada Tombamento Residência UBB"
            lb_texto_migracao.Visible = True
        'Daniel - SS_163237 - Fim
        
        End If

        'Alberto - 22/06/2001 - acessa descrição do segmento do negócio
        
        'If lb_texto_migracao.Visible = False And Trim(e_sgm_neg$) <> Empty Then   'v68 Emilio 21/05/2008
        'If (lb_texto_migracao.Visible = False Or e_mig$ = "10") And Trim(e_sgm_neg$) <> Empty Then   'v68 Emilio 21/05/2008
        If (lb_texto_migracao.Visible = False Or e_mig$ = "10" Or e_mig$ = "11" Or e_mig$ = "12") _
            And Trim(e_sgm_neg$) <> Empty Then   'v73 Emilio 30/09/2008
        
           If Not FU_PR_SAP_SGM_NEG_S10367() Then
              MsgBox "Não foi possível carregar o tipo de segmentação.", MB_ICONSTOP
              n_sgm_neg$ = "Segmento não encontrado"
           End If
           lb_n_sgm_neg.Visible = True
           lb_e_sgm_neg.Visible = True
           lb_n_sgm_neg.Caption = Trim(e_sgm_neg$) & " - " & Trim(n_sgm_neg$)
        Else
           lb_n_sgm_neg.Visible = False
           lb_e_sgm_neg.Visible = False
        End If
        
        'Alberto - fim

        ' seleciona dados do corretor e motivo de impedimento do aditamento
        If Not fu_seleciona_corr_mot_ipd() Then
            BU3D_Volta_Click
        Else
            ' preenche o combo de aditamentos
            cb_u_adi.Clear
            
            adi_atual% = R1FAB001.li_aditamentos.ListCount - 1
            
            Aux$ = dad_adi(adi_atual%).u_adi & "     "
            Aux$ = Aux$ & dad_adi(adi_atual%).U_VRS_ADI
            Aux$ = Aux$ & "  - (      SITUAÇÃO ATUAL      )"
            
            If UBound(dad_apo_pge) <> -1 And UBound(dad_apo_pge) >= adi_atual% Then
                Aux_genius$ = Empty
                Aux$ = Aux$ & Space(50)

                If Trim(dad_apo_pge(adi_atual%).u_adi_ixl) <> Empty Then
                    Aux_genius$ = "/" & Format(dad_apo_pge(adi_atual%).u_adi_ixl, "000000")
                End If
                If Trim(dad_apo_pge(adi_atual%).u_adi_pge) <> Empty Then
                    If Aux_genius$ = Empty Then
                        Aux_genius$ = Space(7) & Format(dad_apo_pge(adi_atual%).u_adi_pge, "000000")
                    Else
                        Aux_genius$ = Format(dad_apo_pge(adi_atual%).u_adi_pge, "000000") & Aux_genius$
                    End If
                Else
                    Aux_genius$ = Space(6) & Aux_genius$
                End If
                Aux$ = Mid(Aux$, 1, 60) & Aux_genius$
            End If
            
            cb_u_adi.AddItem Aux
                
            For i% = 0 To UBound(dad_adi)
                Aux$ = dad_adi(i%).u_adi & "     "
                Aux$ = Aux$ & dad_adi(i%).U_VRS_ADI & "  - "
                Aux$ = Aux$ & dad_adi(i%).t_mot_alt
                
                'Dilson - SS_129444 - Ini
                If PRODUT0_GARANTECH% = True Then
                    If Not Fu_Sel_Motivo_Garantech(CInt(dad_adi(i%).u_adi)) Then
                        Screen.MousePointer = DEFAULT
                    Else
                        Aux$ = RTrim(LTrim(Aux$)) & Motivo_Garantech$
                    End If
                End If
                'Dilson - SS_129444 - Fim
                
                If UBound(dad_apo_pge) <> -1 And UBound(dad_apo_pge) >= i% Then
                    Aux_genius$ = Empty
                    If Trim(dad_apo_pge(i%).u_adi_ixl) <> Empty Then
                        Aux_genius$ = "/" & Format(dad_apo_pge(i%).u_adi_ixl, "000000")
                    End If
                    If Trim(dad_apo_pge(i%).u_adi_pge) <> Empty Then
                        If Aux_genius$ = Empty Then
                            Aux_genius$ = Space(7) & Format(dad_apo_pge(i%).u_adi_pge, "000000")
                        Else
                            Aux_genius$ = Format(dad_apo_pge(i%).u_adi_pge, "000000") & Aux_genius$
                        End If
                    Else
                        Aux_genius$ = Space(6) & Aux_genius$
                    End If
                    Aux$ = Mid(Aux$, 1, 60) & Aux_genius$
                End If
                
                cb_u_adi.AddItem Aux
            Next i%
        
            ' preenche campos da tela
            Aux$ = Format$(Val(c_cia_ita$), "00") + "."
            Aux$ = Aux$ + Format$(Val(c_rmo$), "00") + "."
            Aux$ = Aux$ + Format(u_apo_pnc$, "000000000") + "."     '   PauloFlopes 06/08/2008
            Aux$ = Aux$ + Format$(Val(u_apo_dpd$), "0000000")
            
            lb_apo.Caption = Aux$
            lb_n_Pes.Caption = " " + n_pes$
        
            ' Em caso de consulta por nome, chassi ou placa, deve-se
            ' acessar a tabela dbnprod..tb_apo para selecionar dados da
            ' apólice anterior
            'Pereira 20/06/2003 (incluido tb a pesquisa por número de proposta)
            If acesso% = 1 Or acesso% = 2 Or acesso% = 3 Or acesso% = 4 Then
                ' seleciona apólice anterior
                If Not fu_sel_apo_objeto() Then
                    BU3D_Volta_Click
                Else
                    c_cia_ita_ant$ = dad_apo(0).c_cia_ita_ant
                    c_rmo_ant$ = dad_apo(0).c_rmo_ant
                    u_apo_pnc_ant$ = dad_apo(0).u_apo_pnc_ant
                    u_apo_dpd_ant$ = dad_apo(0).u_apo_dpd_ant
                    e_osg$ = dad_apo(0).e_osg
                    d_icl_apo$ = dad_apo(0).d_icl_apo
                End If

            End If
            
            ' preenche campo informando dados da apólice anterior
            If Val(u_apo_pnc_ant$) <> 0 Then
                Aux$ = Format$(Val(c_cia_ita_ant$), "00") + "."
                Aux$ = Aux$ + Format$(Val(c_rmo_ant$), "00") + "."
                Aux$ = Aux$ + Format(u_apo_pnc_ant$, "000000000") + "." '   PauloFLopes 06/08/2008
                Aux$ = Aux$ + Format$(Val(u_apo_dpd_ant$), "0000000")
                
                lb_apo_ant1.Caption = Aux$
            Else
            
                '24/03/10 - Ini - LuisEnc
                'Detectado que nos casos de apolice anterior Unibanco, quando havia zeros a esquerda
                'o format antigo estava desprezando, formatando um numero de u_apo_ant errado na tela
                If Len(u_apo_ant) = 20 Then
                    lb_apo_ant1.Caption = " " & u_apo_ant$
                Else
                '24/03/10 - Fim
                
                    lb_apo_ant1.Caption = " " & Format$(u_apo_ant$, "000000000")
                    'lb_apo_ant1.Caption = " " & u_apo_ant$
                End If
            End If
            
            'v75 Emilio 29/01/2009 - SS_42264_IR2_390 - início
            If c_cia_ita = "32" Then
                u_prp_itp = ""
                
                If Not FU_PR_RPC_APO_MVP_S17688() Then MsgBox msgerro, MB_ICONSTOP, "R1FAB002 - Busca número de proposta da Itauprev"
                
                If u_prp_itp <> "" Then lb_apo_ant1.Caption = Trim(lb_apo_ant1.Caption) & " - Prop.: " & u_prp_itp
                    
            End If
            'v75 Emilio 29/01/2009 - SS_42264_IR2_390 - fim
            
            lb_c_pro.Caption = Format(c_pro$, "000")
            lb_c_isg.Caption = Format$(Val(c_isg$), " 000000")
            lb_d_emi1.Caption = d_icl_adi$
            lb_c_mot_ipd_adi.Caption = c_mot_ipd_adi$
        
            ' verifica o código da situação da apólice:
            ' 2 - apólice cancelada a pedido do cliente
            ' 3 - apólice cancelada a pedido técnico
            ' 4 - apólice cancelada por falta de pagamento
            ' 8 - apólice cancelada por erro de emissão
            ' 9 - apólice cancelada por sinistro indenizado
            If c_sit_apo$ = "2" Or c_sit_apo$ = "3" Or c_sit_apo$ = "4" Or c_sit_apo$ = "8" Or c_sit_apo$ = "9" Then
                lb_d_can_apo.Caption = Trim$(d_can_apo$)
                lb_d_can_apo.Visible = True
                lb_data_canc.Visible = True
            Else
                lb_d_can_apo.Visible = False
                lb_data_canc.Visible = False
            End If
            
            lb_t_sit_apo.Caption = " " & t_sit_apo$
            lb_d_dia_env_dem2.Caption = d_dia_env_dem$
            
            '   PauloFLopes         30/10/2007
            If Trim(U_Opr_Cre) <> Empty Or Trim(u_ctr_etl_fmt) <> Empty Then
                lblFinanciamento.Visible = True: lblFinanciamento.Left = 3950: lblFinanciamento.Top = 1710
                If Trim(U_Opr_Cre) <> Empty Then
                    lblFinanciamento.Caption = U_Opr_Cre
                Else
                    lblFinanciamento.Caption = Trim(u_ctr_etl_fmt) + "/" + Trim(u_ctr_etl_seq)
                    lblFinanciamento.Width = 2300
                End If

                lblContrato.Visible = True: lblContrato.Left = 1900: lblContrato.Top = 1710
            End If
            
            lb_n_pro.Caption = " " & n_pro$
            lb_n_pes_cor.Caption = " " & n_pes_cor$
        
            
            ''minitir - ss_199801 - 21/03/2012 - INI
            If c_cia_ita = 33 And (c_rmo = 31 Or c_rmo = 14) Then
                lb_c_cvd.Width = 2250
                lb_n_pes_cor.Width = 6685
                lb_n_pes_cor.Left = 2570
            Else
                lb_c_cvd.Width = 1905
                lb_n_pes_cor.Width = 6885
                lb_n_pes_cor.Left = 2370
            End If
            ''minitir - ss_199801 - 21/03/2012 - FIM
            
            lb_c_cvd.Caption = " " & Trim$(Format$(e_cvd_prp$, "00") + ".")
            lb_c_cvd.Caption = lb_c_cvd.Caption & Trim$(Format$(u_rgt_ssp_prp$, "000000000")) & "."
            lb_c_cvd.Caption = lb_c_cvd.Caption & Trim$(Format$(u_dco_rgt_ssp_prp$, "0")) & "."
            lb_c_cvd.Caption = lb_c_cvd.Caption & Trim$(Format$(c_loc_pgt_cvd_prp$, "00"))
            ''minitir - ss_199801 - 21/03/2012 - INI
            If c_cia_ita = 33 And (c_rmo = 31 Or c_rmo = 14) Then
                lb_c_cvd.Caption = lb_c_cvd.Caption & "." & Trim$(Format$(IIf(c_und_cvd_prp$ = "", 0, c_und_cvd_prp$), "0000"))
            End If
            ''minitir - ss_199801 - 21/03/2012 - FIM
            
        
            lb_vig_apo.Visible = True
            lb_ini_vig_apo.Visible = True
            lb_fim_vig_apo.Visible = True
            lb_vig_adi.Visible = True
            lb_ini_vig_adi.Visible = True
            lb_fim_vig_adi.Visible = True
            lb_mcf.Visible = True
            lb_u_mcf.Visible = True
            lb_u_adi_ref_ppl.Visible = True
            lb_prp.Visible = True
            lb_u_prp.Visible = True
            lb_a(0).Visible = True
            lb_a(1).Visible = True
        
            ' habilita botões
            su_habilita_botao bu3d_Fim, True
            su_habilita_botao bu3d_volta, True
            su_habilita_botao bu3d_end_corresp, True
            su_habilita_botao bu3d_t_apo, True

            'Luciane - 11/06/1999 - R1PAB050
            If c_agr_fam_pro$ = "5" Or c_agr_fam_pro$ = "6" Then 'Or c_agr_fam_pro$ = "9" Then
                bu3d_txt.Top = 45
                bu3d_txt.Left = 4410 '5280 adriano
                bu3d_txt.Visible = True
            End If
            'Luciane - 11/06/1999 - R1PAB050

            If c_rmo$ = "31" Then
                bu3d_consulta_item.Visible = True
                su_habilita_botao bu3d_consulta_item, True
            End If
            
            su_habilita_botao bu3d_dados_cli, True
            su_habilita_botao bu3d_canais_venda, True
            su_habilita_botao bu3d_cla, True
            su_habilita_botao bu3d_tco, True
            su_habilita_botao bu3d_apo_escr, True
            su_habilita_botao bu3d_csg, True
            su_habilita_botao bu3d_apo_ctr_rsv, True
            su_habilita_botao bu3d_dad_lib_esp, True
            'Eduardo 23/05/2003
            su_habilita_botao BU3D_Historico, True
        
            ' se cobrança
            If sg_shell$ <> "CRPCP001" Then su_habilita_botao bu3d_cbr, True

            'Dilson - início - R1PAB084
            If c_agr_fam_pro$ = "4" Then
                'Verifica existência de contrato para a apólice
                If Not fu_sel_apo_ctr_rsv() Then
                    su_habilita_botao bu3d_isg, True
                Else
                    'Se existir contrato e Coletivas, não Habilitar botão
                    su_habilita_botao bu3d_isg, False
                End If

            Else
                su_habilita_botao bu3d_isg, True
            End If
            'Dilson - fim - R1PAB084

            'habilita botões
            su_habilita_botao bu3d_plano, True
            su_habilita_botao bu3d_isg, True
            
            cb_u_adi.Enabled = True
            
            If c_agr_fam_pro$ <> "5" And c_agr_fam_pro$ <> "6" Then
                ' posiciona o combo no aditamento desejado, caso seja informado
                'cb_u_adi.ListIndex = 0
                i% = 0
                Do While cb_u_adi.ListCount - 1 >= i%
                    
                    If Val(u_adi$) = Val(Left$(cb_u_adi.List(i%), 5)) Then
                    'If Val(Format$(u_adi$, "000")) = Val(Mid$(cb_u_adi.List(i%), 1, 3)) Then
                        cb_u_adi.ListIndex = i%
                        Exit Do
                    End If
                    
                    i% = i% + 1
                Loop

            Else
                cb_u_adi.ListIndex = 0
            End If
        
            'v99 Emilio 23/05/2011 - SS_163237 - Tombamento Auto Frota UBB x ISa+r - início
            'Adriano - Inicio
            'Verificar se a apólice foi emitida via workflow
            If Not FU_VERIFICA_EMI_WN() Then
                MsgBox "Não foi possível verificar se a apólice foi emitida via workflow.", MB_ICONEXCLAMATION, "ATENÇÃO"
                Screen.MousePointer = DEFAULT
                Exit Sub
            End If
            'Adriano - Fim
            'v99 Emilio 23/05/2011 - SS_163237 - Tombamento Auto Frota UBB x ISa+r - fim
        
            'O combo tem a posicao consolidada duplicada (1o. e último elemento
            'do combo).
            'Se o 1o. elemento for escolhido, os dados do aditamento no array dad_adi
            'se encontrarão na última posicão do array.
            '           no combo               no array
            '    5  (  POSICAO ATUAL  )
            '    1                                1
            '    2                                2
            '    3                                3
            '    5                                5
        
            'aditamento 5 - corresponde somente ao último elemento do array
            
            If cb_u_adi.ListIndex = 0 Then
                su_preenche_campos UBound(dad_adi)
            Else
                su_preenche_campos cb_u_adi.ListIndex - 1
            End If
            
            'controle utilizado para acesso às tabelas
            'dbnprod..tb_his_isg_apo e dbnprod..tb_osg_aut
            'se true  - realiza acesso para seleção de dados
            Flag% = True
          
            'seleciona e_fam_pro e c_agr_fam_pro na tabela pois os mesmos
            'podem não ter sido setados corretamente no menu (tela anterior)
            If Not fu_sel_fam_pro() Then
                MsgBox "Erro na seleção da Família/Produto.", 48, "Consulta Apólice"
                End
            End If

        End If
    
    End If
    
   'Luciane - 09/10/1998 - R1PAB015
    If c_agr_fam_pro$ = "2" Then  'Saúde
        su_habilita_botao bu3d_cla, False
        su_habilita_botao bu3d_apo_escr, False
        su_habilita_botao bu3d_csg, False
        'Eduardo 23/05/2003
        su_habilita_botao BU3D_Historico, False
        bu3d_avanca.Visible = True
        lb_cla.ForeColor = &H808080
        lb_dad_grl.ForeColor = &H808080
        lb_csg.ForeColor = &H808080
        
        If Not fu_carga_apo_32() Then
            Exit Sub
        End If
    End If
    'Luciane - 09/10/1998 - R1PAB015
    
   'Valdemir - 15/10/2002 - R1PAB003
    If Val(c_agr_fam_pro$) = 1 Or Val(e_fam_pro$) = 4 Or Val(c_agr_fam_pro$) = 4 Then 'Se auto, RPM e vida
        ' através do número da apólice verifica se tem titulo
        ' na dbnprod..tb_tit_cpz
        If fu_sel_tit_cpz_titulo(1) Then
            bu_Titulos.Visible = True
        End If
    End If
   'Valdemir - 15/10/2002 - R1PAB003
    
    'marcelo - 31/10/2002 - pegar data corrente
    gDataCorrente = CDate(fu_data_servidor(SqlConn, "DD/MM/YYYY"))
    Debug.Print gDataCorrente
    
    'Marcelo D. 30/10/2002
    Me.LB_I_CSI.Caption = Empty
    
   'se tipo de familia produto/é vida, verificar indicador CisaoItauPrev
   'e data corrente maior que 08/11/2002
    If (Val(e_fam_pro) = 4 Or Val(e_fam_pro) = 9 Or Val(e_fam_pro) = 10) And gDataCorrente > CDate("08/11/2002") Then
        If Not Fu_Apo_ItauPrev(Me.LB_I_CSI) Then
            MsgBox "Erro na função Fu_Apo_ItauPrev.", MB_ICONEXCLAMATION, "ATENÇÃO"
            Screen.MousePointer = DEFAULT
            Exit Sub
        End If
        e_fam_pro = Empty
    End If
       
    lbl_nome_cong_pri_risco.Caption = ""
    lbl_apo_pri_risco.Caption = ""
    lbl_ini_vig_pri_risco.Caption = ""
    lbl_fim_vig_pri_risco.Caption = ""
    'Márcia Abreu - Inicio - 05/01/2012 - Campo apo 2. risco (s/n)
    lbl_s_n_apo_2_risco.Caption = ""
    'Márcia Abreu - Final - 05/01/2012 - Campo apo 2. risco (s/n)
    
    'Verifica se é frota
    'Adriano - 06/08/2013 - PJotinha - inicio
    If fu_prp_aut_frt() = True Then
    'If FU_AGR_PRO_S18748() = True Then
    'Adriano - 06/08/2013 - PJotinha - termino
        
        If cb_u_adi.ListIndex = 0 Then
             If Not FU_RMO_PRO_PER_S21105(UBound(dad_adi)) Then
                 MsgBox "Não foi possível buscar a atividade empresa da apólice", vbInformation
             End If
         Else
             If Not FU_RMO_PRO_PER_S21105(cb_u_adi.ListIndex - 1) Then
                 MsgBox "Não foi possível buscar a atividade empresa da apólice", vbInformation
             End If
             
         End If
            
'''        If Not FU_RMO_PRO_PER_S21105() Then
'''            MsgBox "Não foi possível buscar a atividade empresa da apólice", vbInformation
'''        End If
        
        If fu_sel_his_tco_apo_S18686() Then
            lbl_ativ_emp_auto_frota.Caption = s_des_atv_emp_auto_frota
            
            If s_ind_apo_pri_risco = "S" Then
                lbl_nome_cong_pri_risco.Caption = s_nome_cong_pri_risco
                lbl_apo_pri_risco.Caption = s_num_apo_pri_risco
                lbl_ini_vig_pri_risco.Caption = Format(s_ini_vig_apo_pri_risco, "dd/mm/yyyy")
                lbl_fim_vig_pri_risco.Caption = Format(s_fim_vig_apo_pri_risco, "dd/mm/yyyy")
            End If
        End If
        'Márcia Abreu - Inicio - 05/01/2012 - Campo apo 2. risco (s/n)
        lbl_s_n_apo_2_risco.Caption = s_i_apo_sgn_ris
        'Márcia Abreu - Final - 05/01/2012 - Campo apo 2. risco (s/n)
    End If
    
    
    Me.Top = (Screen.Height) / 2 - Me.Height / 2 'centraliza o formulário
    Me.Left = (Screen.Width) / 2 - Me.Width / 2 'centraliza o formulário
    
    Show
    '** SS.177593 - RS.1552 / IR3 - Reimpressão de Proposta Vida **'
    '** SS.203852 / IR3 - Reimpressão de Proposta Patrimoniais RAFASON**'
    If UCase(Trim(fu_login_usuario())) = "PONCMAR" Or _
       UCase(Trim(fu_login_usuario())) = "MAOBSIM" Or _
       UCase(Trim(fu_login_usuario())) = "MSILVAE" Or _
       UCase(Trim(fu_login_usuario())) = "RAFASON" Or _
       UCase(Trim(fu_login_usuario())) = "JRJOSEA" Or _
       UCase(Trim(fu_login_usuario())) = "VITONUN" Or _
       UCase(Trim(fu_login_usuario())) = "DADILSO" Then
        BU3D_ReimpPrp.Visible = True
    End If
    '** SS.203852 / IR3 - Reimpressão de Proposta Patrimoniais RAFASON**'
    '** SS.177593 - RS.1552 / IR3 - Reimpressão de Proposta Vida **'
    
  
    Screen.MousePointer = DEFAULT
    bu3d_Fim.SetFocus
    
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
        
        If bu3d_Fim.Enabled = True Then
            bu3d_Fim_Click
        Else
            Cancel = True
        End If

    End If

End Sub

Private Sub fr3d_cliente_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB002"

End Sub

Private Sub fr3d_Dados_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002"

End Sub

Private Sub lb_apo_ant1_Click()

    MsgBox "Número da apólice anterior: " & vbCrLf & vbCrLf & lb_apo_ant1.Caption, MB_ICONINFORMATION, "R1FAB002 - Consulta número da apólice anterior" 'v75 Emilio 29/01/2009 - SS_42264_IR2_390

End Sub

Private Sub lb_apo_ant1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    'v75 Emilio 29/01/2009 - SS_42264_IR2_390 - início
    pa3d_status.Caption = "R1FAB002 - Número da apólice anterior: " & lb_apo_ant1.Caption
    lb_apo_ant1.ToolTipText = "Número da apólice anterior: " & lb_apo_ant1.Caption
    'v75 Emilio 29/01/2009 - SS_42264_IR2_390 - fim

End Sub

Private Sub lb_Apolice_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002 - Número da Apólice"

End Sub

Private Sub lb_i_ASN_ELN_Click()
  'BRQ IT - Rogerio Sotto- 19/09/2013 -  Confirmação Eletrônica de Proposta x Alteração no Call Center
  'Habilitar Tambêm para residencial(3)
  If (Val(c_agr_fam_pro$) = 4 Or Val(c_agr_fam_pro$) = 3) Then
        R1FAB016.Show
        Me.Hide
   End If
End Sub
Private Sub lb_i_ASN_ELN_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'BRQ IT - Rogerio Sotto- 19/09/2013 -  Confirmação Eletrônica de Proposta x Alteração no Call Center
'Habilitar Tambêm para residencial(3)
If (Val(c_agr_fam_pro$) = 4 Or Val(c_agr_fam_pro$) = 3) Then
    lb_i_ASN_ELN.MousePointer = vbArrowQuestion
End If
End Sub

Private Sub pa3d_status_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002"

End Sub

Private Sub PA3D_Topo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB002"

End Sub

Private Sub sp_apo_mfr_SpinDown()

    Dim APOLICE_MAINFRAME$
    Dim apolice_mainframe_bnj$
    
    'Banerj
    If c_cia_ita$ = "7" Then
        
        If UBound(dad_apo_mfr_bnj) <> posicao_dad_apo_mfr_bnj Then
            posicao_dad_apo_mfr_bnj = posicao_dad_apo_mfr_bnj + 1
                
            If InStr(lb_texto_migracao.Caption, "Item") = 0 Then
                apolice_mainframe_bnj$ = "  " & (posicao_dad_apo_mfr_bnj + 1) & "ª --> " & dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_rmo_bnj$ & "." & dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_suc_bnj$ & "." & dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_doc_bnj$ & "." & dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).u_apo_pnc_mfr$ & "." & dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).u_isg_mfr$
            Else
                apolice_mainframe_bnj$ = " Item " & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_isg$ & ":  " & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_rmo_bnj$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_suc_bnj$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_doc_bnj$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).u_apo_pnc_mfr$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).u_isg_mfr$
            End If
                                                                         
            lb_texto_migracao.Caption = " Apólice Migrada do Mainframe Banerj    " & _
                        apolice_mainframe_bnj$
       End If

    'Itaú
    Else
        
        If UBound(dad_apo_mfr) <> posicao_dad_apo_mfr Then
            posicao_dad_apo_mfr = posicao_dad_apo_mfr + 1
            
            If InStr(lb_texto_migracao.Caption, "Item") = 0 Then
                APOLICE_MAINFRAME$ = "  " & (posicao_dad_apo_mfr + 1) & "ª --> " & _
                        dad_apo_mfr(posicao_dad_apo_mfr).c_t_neg$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).c_rmo_mfr$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).u_apo_pnc_mfr$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).u_isg_mfr$
            Else
                APOLICE_MAINFRAME$ = " Item " & _
                        dad_apo_mfr(posicao_dad_apo_mfr).c_isg$ & ":  " & _
                        dad_apo_mfr(posicao_dad_apo_mfr).c_t_neg$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).c_rmo_mfr$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).u_apo_pnc_mfr$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).u_isg_mfr$
            End If
                
            lb_texto_migracao.Caption = "       Apólice Migrada do Mainframe          " & APOLICE_MAINFRAME$
       End If
    
    End If

End Sub

Private Sub sp_apo_mfr_SpinUp()

    Dim APOLICE_MAINFRAME$
    Dim apolice_mainframe_bnj$
    
    'Banerj
    If c_cia_ita$ = "7" Then

        If posicao_dad_apo_mfr_bnj <> 0 Then
            posicao_dad_apo_mfr_bnj = posicao_dad_apo_mfr_bnj - 1
            
            If InStr(lb_texto_migracao.Caption, "Item") = 0 Then
                apolice_mainframe_bnj$ = "  " & (posicao_dad_apo_mfr_bnj + 1) & "ª --> " & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_rmo_bnj$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_suc_bnj$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_doc_bnj$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).u_apo_pnc_mfr$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).u_isg_mfr$
            Else
                apolice_mainframe_bnj$ = " Item " & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_isg$ & ":  " & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_rmo_bnj$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_suc_bnj$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).c_doc_bnj$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).u_apo_pnc_mfr$ & "." & _
                        dad_apo_mfr_bnj(posicao_dad_apo_mfr_bnj).u_isg_mfr$
            End If
                                                                     
            lb_texto_migracao.Caption = " Apólice Migrada do Mainframe Banerj    " & _
                    apolice_mainframe_bnj$
       End If

    'Itaú
    Else

        If posicao_dad_apo_mfr <> 0 Then
            posicao_dad_apo_mfr = posicao_dad_apo_mfr - 1
            
            If InStr(lb_texto_migracao.Caption, "Item") = 0 Then
                APOLICE_MAINFRAME$ = "  " & (posicao_dad_apo_mfr + 1) & "ª --> " & _
                        dad_apo_mfr(posicao_dad_apo_mfr).c_t_neg$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).c_rmo_mfr$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).u_apo_pnc_mfr$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).u_isg_mfr$
            Else
                APOLICE_MAINFRAME$ = " Item " & _
                        dad_apo_mfr(posicao_dad_apo_mfr).c_isg$ & ":  " & _
                        dad_apo_mfr(posicao_dad_apo_mfr).c_t_neg$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).c_rmo_mfr$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).u_apo_pnc_mfr$ & "." & _
                        dad_apo_mfr(posicao_dad_apo_mfr).u_isg_mfr$
            End If
    
            lb_texto_migracao.Caption = "       Apólice Migrada do Mainframe          " & APOLICE_MAINFRAME$
        
        End If

    End If

End Sub

Private Sub su_le_clip_board()

Dim Contador As Integer, Fim As Integer
Dim s_entrada As String

    ReDim Parametro_Rec(1 To 9) As String
    
    'Pega os parâmetros do CLIPBOARD
    If Clipboard.GetFormat(CF_TEXT) Then
        'Pega os parâmtros do projeto
        s_entrada = UCase$(Trim$(Clipboard.GetText(CF_TEXT)))
    Else
        Exit Sub
    End If
    
    Contador = 0
    Do While Len(s_entrada) > 0
        Fim = InStr(s_entrada, "#")
        
        If Fim = 0 Then Fim = Len(s_entrada) + 1
    
        Contador = Contador + 1
        Parametro_Rec(Contador) = UCase$(Trim$(Left$(s_entrada, Fim - 1)))
        s_entrada = Mid$(s_entrada, Fim + 1)
    Loop
    
    '1- PROJETO
    '2- MUDOU_ITEM
    '3- NOVO_ITEM
    
    If Contador < 3 Then Exit Sub
    
    If Parametro_Rec(1) <> "R1PABF01" Then
        'NÃO É A RESPOSTA ESPERADA PARA ESTE PROJETO!
        Exit Sub
    Else
        'Deixa o ClipBoard limpo
        Clipboard.Clear
    End If
    
    If Parametro_Rec(2) <> "0" And Parametro_Rec(2) <> "-1" Then
        Exit Sub
    Else
        Mudou_Item = Val(Parametro_Rec(2))
    End If
    
    If Val(Parametro_Rec(3)) < 1 Then
        Exit Sub
    Else
        Novo_Item = Val(Parametro_Rec(3))
    End If

End Sub

Private Sub SU_Limpa_Controles()
    
    cb_u_adi.Clear
    lb_n_Pes.Caption = Empty
    lb_n_pes_cor.Caption = Empty
    lb_apo.Caption = Empty
    lb_t_sit_apo.Caption = Empty
    lb_d_can_apo.Caption = Empty
    lb_d_can_apo.Visible = False
    lb_data_canc.Visible = False
    lb_apo.Caption = Empty
    lb_c_pro.Caption = Empty
    lb_c_isg.Caption = Empty
    lb_ini_vig_apo.Caption = Empty
    lb_fim_vig_apo.Caption = Empty
    lb_n_pro.Caption = Empty
    lb_n_pes_cor.Caption = Empty
    lb_c_cvd.Caption = Empty
    lb_u_mcf.Caption = Empty
    lb_u_mcf_cpl.Caption = Empty       ' cris - 04/01/2002
    lb_u_adi_ref_ppl.Caption = Empty
    lb_u_prp.Caption = Empty
    lb_ini_vig_adi = Empty
    lb_fim_vig_adi = Empty

'   PauloFLopes     30/10/2007
    lblFinanciamento.Visible = False
    lblFinanciamento.Caption = Empty
    lblContrato.Visible = False

End Sub

Private Sub su_preenche_campos(ByVal POS As Integer)

    ' preenche os campos da 2a. tela de acordo com o
    ' indice informado

Dim t_sit_mcf   As String       ' cris - 15/01/2002
Dim i_asn_eln As String
Dim auxPos As Integer

    'INICIO - Leandro Fuccia 07/02/2012 - SS_213644
    'Para os ramos Auto e Residência, quando o motivo for Cancelamento de Apólice ou
    'Redução de Vigência, a exibição das datas de início e fim de vigência de apólice
    'e aditamento devem ser diferenciados
    If c_cia_ita = 33 And (c_rmo = 31 Or c_rmo = 14) And _
        (Val(dad_adi(POS%).c_mot_alt) = 1300 Or Val(dad_adi(POS%).c_mot_alt) = 5300) Then
        lb_ini_vig_apo.Caption = dad_adi(0).d_ini_vig_apo
        lb_fim_vig_apo.Caption = dad_adi(0).d_fim_vig_apo
        lb_ini_vig_adi.Caption = dad_adi(0).d_ini_vig_apo
        If Val(dad_adi(POS%).c_mot_alt) = 1300 Then
            lb_fim_vig_adi.Caption = Trim$(d_can_apo$)
        ElseIf Val(dad_adi(POS%).c_mot_alt) = 5300 Then
            lb_fim_vig_adi.Caption = dad_adi(POS%).d_fim_vig_apo
        End If
    Else
        lb_ini_vig_apo.Caption = dad_adi(POS%).d_ini_vig_apo
        lb_fim_vig_apo.Caption = dad_adi(POS%).d_fim_vig_apo
        lb_ini_vig_adi.Caption = dad_adi(POS%).d_ini_vig_adi
        lb_fim_vig_adi.Caption = lb_fim_vig_apo.Caption
    End If
    'FIM - Leandro Fuccia 07/02/2012 - SS_213644
    
    'David Stefano Manente 09/04/2012 - SS_204453 - Confirmação Eletrônica de Proposta x Alteração no Call Center
    'Apenas para Produtos de Vida
    
    'BRQ IT - Rogerio Sotto- 19/09/2013 - Confirmação Eletrônica de Proposta x Alteração no Call Center
    'Habilitar Tambêm para residencial(3)
    If (Val(c_agr_fam_pro$) = 4 Or Val(c_agr_fam_pro$) = 3) Then
    
        aux_i_asn_eln = ""
    
        If Val(c_agr_fam_pro$) = 3 And Val(e_fam_pro_ok) = 4 Then
        aux_i_asn_eln = FU_ConsultaTipoAssinaturaApoliceResidencial(c_rmo$, c_cia_ita$, u_apo_pnc$, u_apo_dpd$)
            auxPos = POS 'Para assinatura no residencial, vale apenas o adi de emissão igual a zero
            POS = 0
        Else
            aux_i_asn_eln = FU_ConsultaTipoAssinaturaApoliceFR(c_rmo$, c_cia_ita$, u_apo_pnc$, u_apo_dpd$)
            If aux_i_asn_eln = "" Then
                aux_i_asn_eln = FU_ConsultaTipoAssinaturaApolice(c_rmo, c_cia_ita, u_apo_pnc, u_apo_dpd, u_adi)
            End If
            auxPos = POS 'Para assinatura no residencial, vale apenas o adi de emissão igual a zero
            POS = 0
        End If
        
        If UCase(Trim(aux_i_asn_eln)) = "B" Then
            i_asn_eln = UCase(Trim(aux_i_asn_eln))
        Else
            i_asn_eln = dad_adi(POS%).i_asn_eln
            aux_i_asn_eln = dad_adi(POS%).i_asn_eln
        End If
        
        If (i_asn_eln = "S" Or i_asn_eln = "C") Then
            lb_i_ASN_ELN.Caption = "Assinatura Eletrônica PIN"
        ElseIf (i_asn_eln = "B") And Val(e_fam_pro_ok) = 4 Then
            lb_i_ASN_ELN.Caption = "Formalização Remota"
        ElseIf (i_asn_eln = "B") Then
            lb_i_ASN_ELN.Caption = "Tipo de Formalização"
        Else
            lb_i_ASN_ELN.Caption = "Assinatura Manual"
        End If
        
        If Val(c_agr_fam_pro$) = 3 Or Val(c_agr_fam_pro$) = 4 Then
            POS = auxPos 'Volta vlor original
        End If
        
        'David Stefano Manente 09/04/2012 - SS_204453 - Confirmação Eletrônica de Proposta x Alteração no Call Center
        'lb_i_ASN_ELN.Visible = (dad_adi(pos%).i_asn_eln = "S" Or dad_adi(pos%).i_asn_eln = "C" Or dad_adi(pos%).i_asn_eln = "B")
        lb_i_ASN_ELN.Visible = True
    Else
        lb_i_ASN_ELN.Caption = "Proposta Assinada Eletronicamente"
        lb_i_ASN_ELN.Visible = (dad_adi(POS%).i_asn_eln = "S" Or dad_adi(POS%).i_asn_eln = "C")
    End If
        
    'STJ
    If lb_fim_vig_apo = "06/06/2079" Then
        lb_fim_vig_apo.Visible = False
        lb_fim_vig_adi.Visible = False
        lb_a(0).Visible = False
        lb_a(1).Visible = False
    Else
        lb_fim_vig_apo.Visible = True
        lb_fim_vig_adi.Visible = True
        lb_a(0).Visible = True
        lb_a(1).Visible = True
    End If
    '***

    lb_u_prp.Caption = Format$(dad_adi(POS%).u_prp, "000000000")
    lb_d_prp.Caption = dad_adi(POS%).d_prp
    lb_d_rct_prp1.Caption = dad_adi(POS%).d_rct_prp
    lb_cnl_rpc1.Caption = fu_seleciona_e_rct_prp(Val(dad_adi(POS%).E_RCT_PRP), Val(dad_adi(POS%).e_mcl_vda), Val(dad_adi(POS%).c_cee_etd))
    lb_u_mcf.Caption = Format$(dad_adi(POS%).u_mcf, "0000000000")
    
    ' cris - 15/01/2002 - inicio
    Select Case dad_adi(POS%).c_sit_mcf
    Case 1
        t_sit_mcf = "Aguardando Microfilmagem"
    Case 2
        t_sit_mcf$ = "Microfilmado"
    Case 3
        t_sit_mcf$ = "Controle Dispensado"
    Case 4
        t_sit_mcf$ = "Pendente"
    Case 5
        t_sit_mcf$ = "Aguardando Microfilmagem Complementar"
    Case 6
        t_sit_mcf$ = "Microfilmagem Complementar Dispensado"
    Case Else
        t_sit_mcf$ = Empty
    End Select
    ' cris - 15/01/2002 - fim
    
    'Ini Gabriela - 23/11/2001 - R1PAB088
    If Val(dad_adi(POS%).u_mcf) <> 0 Then
        lb_u_mcf.ToolTipText = dad_adi(POS%).D_HRA_ATU
    Else
        lb_u_mcf.ToolTipText = Empty
        lb_u_mcf_cpl.ToolTipText = Empty               ' cris - 04/01/2002
    End If
    'Fim Gabriela - 23/11/2001 - R1PAB088
    
    ' cris - 15/01/2002 - inicio
    If Val(dad_adi(POS%).c_sit_mcf) <> 0 Then
        lb_u_mcf.ToolTipText = lb_u_mcf.ToolTipText + IIf(Val(dad_adi(POS%).u_mcf) <> 0, " - " + t_sit_mcf$, t_sit_mcf$) + IIf(Trim(dad_adi(POS%).t_mot_sit_mcf) <> Empty, " - " + dad_adi(POS%).t_mot_sit_mcf, Empty)
        lb_u_mcf_cpl.ToolTipText = lb_u_mcf.ToolTipText
    End If
    ' cris - 15/01/2002 - fim
    
    lb_u_mcf_cpl.Caption = Format$(dad_adi(POS%).u_mcf_cpl, "0000000000")   ' cris - 04/01/2002
    
    lb_d_emi_adi.Caption = dad_adi(POS%).d_icl_adi
    
    'Início ... Gisely - SS_163854 - 26/05/2011
    d_hra_atu_icl = dad_adi(POS%).d_hra_atu_icl
    d_fim_cob_pcb = dad_adi(POS%).d_fim_cob_pcb
    'Fim ...... Gisely - SS_163854 - 26/05/2011
    
    'Adriana - 12/10/2001 - Controle de Papel - Início
    If Trim(dad_adi(POS%).u_adi_ref_ppl) <> Empty Then
        lb_adit_ref.Visible = True
        lb_u_adi_ref_ppl.Visible = True
        lb_u_adi_ref_ppl.Caption = Format$(dad_adi(POS%).u_adi_ref_ppl, "000")
    Else
        lb_adit_ref.Visible = False
        lb_u_adi_ref_ppl.Visible = False
    End If
    'Adriana - 12/10/2001 - Controle de Papel - Fim
    
    'Renato Inclusão da familia transportes 06/08/2002 - Inicio
    'Visialização da referência da conta Mensal somente para transportes
    If c_agr_fam_pro$ = "9" Then
        If Trim(dad_adi(POS%).d_ano_mes_ref) <> Empty Then
            lb_adit_ref.Visible = False
            lb_u_adi_ref_ppl.Visible = False
            fr3d_d_ano_mes_ref.Visible = True
            lb_d_ano_mes_ref.Caption = Right(dad_adi(POS%).d_ano_mes_ref, 2) & "/" & Left(dad_adi(POS%).d_ano_mes_ref, 4)
        Else
            fr3d_d_ano_mes_ref.Visible = False
            lb_d_ano_mes_ref.Caption = Empty
        End If
    End If
    'Renato Inclusão da familia transportes 06/08/2002  - fim
    
    'Suzuki - 27/11/98
    'lb_d_tab_vda_cmz.Caption = dad_adi(pos%).d_tab_vda_cmz
    
    If dad_adi(POS%).D_Tab_Vda_Cmz = "06/06/2079" Then
       lb_d_tab_vda_cmz.Caption = "          "
    Else
       lb_d_tab_vda_cmz.Caption = dad_adi(POS%).D_Tab_Vda_Cmz
    End If
        
    'Início - Gisely 10/03/2009
    If dad_adi(POS%).c_idt_ful = "" Then
        lb_n_usr1.Caption = dad_adi(POS%).N_USR
    Else
        lb_n_usr1.Caption = dad_adi(POS%).c_idt_ful
    End If
    'Fim - Gisely 10/03/2009

    'Mostra o destino dos documentos de apólice
    Select Case dad_adi(POS%).c_dph_doc_apo
        Case 1
            lb_n_dph_doc.Caption = "SEGURADO"
        Case 2
            lb_n_dph_doc.Caption = "NUCLEO"
        Case 3
            lb_n_dph_doc.Caption = "CORRETOR"
        Case 4
            lb_n_dph_doc.Caption = "PAGADOR"
        'Daniela - 27/05/98 - Inclusão dos Cases de 5 a 8.
        Case 5
            lb_n_dph_doc.Caption = "ÓRGÃO PROD."
        Case 6
            lb_n_dph_doc.Caption = "SUB-RESPONS."
        Case 7
            lb_n_dph_doc.Caption = "CENTRO PAGADOR"
        Case 8
            lb_n_dph_doc.Caption = "RESP. NEGÓCIO"
        Case 9
            lb_n_dph_doc.Caption = "INFORMADO"
        Case 10
            lb_n_dph_doc.Caption = "TOMAD/GARANT"
        Case 11
            lb_n_dph_doc.Caption = "ELETRÔNICO"

    End Select
    
    lbl_nome_cong_pri_risco.Caption = ""
    lbl_apo_pri_risco.Caption = ""
    lbl_ini_vig_pri_risco.Caption = ""
    lbl_fim_vig_pri_risco.Caption = ""
    
    'Verifica se é frota
    lb_mdd_aut_frt.Caption = ""
    
    'Adriano - 06/08/2013 - PJotinha - inicio
    
    If fu_prp_aut_frt() = True Then
    ''If FU_AGR_PRO_S18748() = True Then
    'Adriano - 06/08/2013 - PJotinha - termino
    
        If Not FU_RMO_PRO_PER_S21105(POS%) Then
            MsgBox "Não foi possível buscar a atividade empresa da apólice", vbInformation
        End If
    
        If fu_sel_his_tco_apo_S18686() Then
            lbl_ativ_emp_auto_frota.Caption = s_des_atv_emp_auto_frota
            
            If s_ind_apo_pri_risco = "S" Then
                lbl_nome_cong_pri_risco.Caption = s_nome_cong_pri_risco
                lbl_apo_pri_risco.Caption = s_num_apo_pri_risco
                lbl_ini_vig_pri_risco.Caption = Format(s_ini_vig_apo_pri_risco, "dd/mm/yyyy")
                lbl_fim_vig_pri_risco.Caption = Format(s_fim_vig_apo_pri_risco, "dd/mm/yyyy")
            End If
        End If
        'Adelamg SS 156649
        T_MDD_AUT_FRT = ""
        If Trim(dad_adi(POS%).c_mdd_aut_frt) <> "" Then
            If Not FU_MDD_AUT_FRT_S18816(dad_adi(POS%).c_mdd_aut_frt) Then
                MsgBox "Não foi possível verificar o tipo de modalidade.", MB_ICONSTOP
                Exit Sub
            End If
        
            lb_mdd_aut_frt.Caption = "Modalidade " + IIf(Trim(T_MDD_AUT_FRT) = "", "Convencional", Trim(T_MDD_AUT_FRT))
        
        End If
        'Márcia Abreu - Inicio - 05/01/2012 - Campo apo 2. risco (s/n)
        lbl_s_n_apo_2_risco.Caption = s_i_apo_sgn_ris
        'Márcia Abreu - Final - 05/01/2012 - Campo apo 2. risco (s/n)
   End If
        
End Sub

Function Fu_PR_CPH_MKT_S09532()
'+--------------------------------------------------------------------------+
'| OBJETIVO...: CARREGA DADOS DA NOVA CAMPANHA                              |
'+--------------------------------------------------------------------------+
    Fu_PR_CPH_MKT_S09532 = False
    
    Ret% = SQLRPCInit%(SqlConn%, "DBNAPOIO..PR_CPH_MKT_S09532", 0)

    If FU_Parametro(SqlConn, "@c_cph_mkt", c_cph$, SQLINT4%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_oft_cph", c_oft_cph$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_lot_cph", u_lot_oft$, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@opcao", 4, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_tip_mov", 0, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro(SqlConn, "@c_agr_fam_pro", 0, SQLINT2%) = FAIL Then Exit Function
    If FU_Parametro_Ret(SqlConn, "@u_linhas", 0, SQLINT2) = FAIL Then Exit Function
    
    Ret% = SQLRPCSend%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlRpcSend%, "Fu_PR_CPH_MKT_S09532"
        Exit Function
    End If

    Ret% = SqlOk%(SqlConn%)
    If Ret% = FAIL% Then
        su_erro_st_proc ST_SqlOk%, "Fu_PR_CPH_MKT_S09532"
        Exit Function
    End If

'+--------------------------------------------------------------------------+
'|        VERIFICA SE OCORRERAM ERROS DE SYBASE DURANTE A EXECUÇÃO          |
'+--------------------------------------------------------------------------+
    Ret% = SqlResults%(SqlConn%)
    Do Until Ret% = NOMORERESULTS% Or Ret% = FAIL
        Ret% = SqlNextRow%(SqlConn%)
        
        Do Until Ret% = NOMOREROWS% Or Ret% = FAIL
            Bln_Cph_OK = True
            ctd_lfi% = ctd_lfi% + 1
            Ret% = SqlNextRow%(SqlConn%)
        Loop
       Ret% = SqlResults%(SqlConn%)
    Loop

    If Ret% = FAIL Then
       MsgBox "Não foi possível colher resultados - Fu_PR_CPH_MKT_S09532.", 48
      Exit Function
    End If

    'Verifica o status de erro.
    If (Err_Syb <> 0) Or (Msg_Syb <> 0) Then Exit Function
    
    Fu_PR_CPH_MKT_S09532 = True

End Function

'SS_133492 - Workflow Inspeção de Risco
'Início
Private Sub bu3d_sys_irc_Click()

    Dim caminho_home As String

    Screen.MousePointer = HOURGLASS

    'DESENVOLVIMENTO
    If FU_Get_Ambiente = "DES" Then
        caminho_home = "https://itausegportaisdesenv.itau/inspecaorisco/homeController.do?racf="
        caminho_home = caminho_home + Usuario
        caminho_home = caminho_home + "&numero_apolice=" + lb_apo.Caption
        ShellExecute hwnd, "open", caminho_home, vbNullString, vbNullString, SW_SHOWNORMAL
    'ACEITE
    ElseIf FU_Get_Ambiente = "ACT" Then
        caminho_home = "https://itausegportaisdesenv.itau/inspecaorisco/homeController.do?racf="
        caminho_home = caminho_home + Usuario
        caminho_home = caminho_home + "&numero_apolice=" + lb_apo.Caption
        ShellExecute hwnd, "open", caminho_home, vbNullString, vbNullString, SW_SHOWNORMAL
    'PRODUÇÃO
    Else
'        caminho_home = "http://portais.intranet.itauseguros/inspecaorisco/home.do?action=iniciar&racf="
        caminho_home = "http://portais.intranet.itauseguros/inspecaorisco/homeController.do?racf="
        caminho_home = caminho_home + Usuario
        caminho_home = caminho_home + "&numero_apolice=" + lb_apo.Caption
        ShellExecute hwnd, "open", caminho_home, vbNullString, vbNullString, SW_SHOWNORMAL
    End If

    Screen.MousePointer = DEFAULT
    
End Sub

Private Sub bu3d_sys_irc_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB002 - Inspeção de Risco referente à apólice: " & lb_apo.Caption

End Sub
'Fim
