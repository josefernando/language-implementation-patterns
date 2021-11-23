VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.ocx"
Begin VB.Form R1FAB008 
   Appearance      =   0  'Flat
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Consulta dados da proposta excluída"
   ClientHeight    =   6165
   ClientLeft      =   750
   ClientTop       =   1455
   ClientWidth     =   8595
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
   Icon            =   "R1FAB008.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6165
   ScaleWidth      =   8595
   Begin Threed.SSPanel pa3d_consulta 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   5790
      Width           =   8595
      _Version        =   65536
      _ExtentX        =   15161
      _ExtentY        =   661
      _StockProps     =   15
      Caption         =   "R1FAB008"
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
      BorderWidth     =   2
      BevelInner      =   1
      Alignment       =   1
   End
   Begin Threed.SSPanel PA3D_Topo 
      Align           =   1  'Align Top
      Height          =   730
      Left            =   0
      TabIndex        =   37
      Top             =   0
      Width           =   8595
      _Version        =   65536
      _ExtentX        =   15161
      _ExtentY        =   1288
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
      Alignment       =   6
      Begin Threed.SSCommand bu3d_Volta 
         Height          =   600
         Left            =   7935
         TabIndex        =   38
         Tag             =   "sai"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB008.frx":030A
      End
      Begin Threed.SSCommand BU3D_Objeto 
         Height          =   600
         Left            =   4080
         TabIndex        =   57
         Top             =   60
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
         Picture         =   "R1FAB008.frx":0624
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB008.frx":093E
         Top             =   120
         Width           =   1365
      End
   End
   Begin Threed.SSFrame fr3d_Fundo 
      Height          =   4920
      Left            =   60
      TabIndex        =   0
      Top             =   810
      Width           =   8490
      _Version        =   65536
      _ExtentX        =   14975
      _ExtentY        =   8678
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
      Begin VB.ComboBox cmbProp 
         Appearance      =   0  'Flat
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
         Height          =   315
         Left            =   135
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   225
         Width           =   8295
      End
      Begin Threed.SSFrame frm_Prop 
         Height          =   4155
         Left            =   90
         TabIndex        =   17
         Top             =   630
         Visible         =   0   'False
         Width           =   8295
         _Version        =   65536
         _ExtentX        =   14631
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
         Enabled         =   0   'False
         Begin VB.ComboBox CB_D_EXC_PRP 
            ForeColor       =   &H00800000&
            Height          =   315
            ItemData        =   "R1FAB008.frx":10B8
            Left            =   1935
            List            =   "R1FAB008.frx":10BA
            Style           =   2  'Dropdown List
            TabIndex        =   66
            Top             =   3075
            Width           =   3075
         End
         Begin VB.TextBox msk_d_nas 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   6930
            TabIndex        =   65
            Top             =   600
            Width           =   1125
         End
         Begin VB.TextBox txt_n_abv_pla 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   5640
            TabIndex        =   63
            Top             =   2310
            Width           =   2600
         End
         Begin VB.TextBox txt_c_rmo 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   5640
            TabIndex        =   61
            Top             =   1500
            Width           =   2625
         End
         Begin VB.TextBox txt_d_ini_vig 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   5640
            TabIndex        =   58
            Top             =   1920
            Width           =   2600
         End
         Begin VB.TextBox txt_t_msg 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   510
            HideSelection   =   0   'False
            Left            =   810
            MultiLine       =   -1  'True
            TabIndex        =   18
            Top             =   3510
            Width           =   4770
         End
         Begin VB.TextBox txt_u_plc_aut 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   5640
            TabIndex        =   19
            Top             =   3120
            Width           =   1215
         End
         Begin VB.TextBox txt_u_chs_aut 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   5640
            TabIndex        =   20
            Top             =   2685
            Width           =   2600
         End
         Begin VB.TextBox txt_u_fcp 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   1020
            TabIndex        =   21
            Top             =   1065
            Width           =   2925
         End
         Begin VB.TextBox txt_c_loc_pgt_cvd 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   3810
            TabIndex        =   22
            Top             =   1500
            Width           =   375
         End
         Begin VB.TextBox txt_u_dco_rgt_ssp 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   3345
            TabIndex        =   23
            Top             =   1500
            Width           =   375
         End
         Begin VB.TextBox txt_u_rgt_ssp 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   2415
            TabIndex        =   24
            Top             =   1500
            Width           =   855
         End
         Begin VB.TextBox txt_e_cvd 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   1935
            TabIndex        =   25
            Top             =   1500
            Width           =   375
         End
         Begin VB.TextBox txt_n_cli 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   735
            TabIndex        =   26
            Top             =   630
            Width           =   5160
         End
         Begin VB.TextBox txt_d_rct_prp 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   1935
            TabIndex        =   27
            Top             =   2685
            Width           =   2800
         End
         Begin VB.TextBox txt_d_prp 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   1935
            TabIndex        =   28
            Top             =   1920
            Width           =   2800
         End
         Begin VB.TextBox txt_d_prt_cga 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   1935
            TabIndex        =   11
            Top             =   2310
            Width           =   2800
         End
         Begin VB.TextBox txt_u_prp_org 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   5175
            TabIndex        =   10
            Top             =   210
            Width           =   1335
         End
         Begin VB.TextBox txt_u_age 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   6015
            TabIndex        =   29
            Top             =   1065
            Width           =   540
         End
         Begin VB.TextBox txt_u_cc 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   6600
            TabIndex        =   30
            Top             =   1065
            Width           =   1155
         End
         Begin VB.TextBox txt_u_cc_dcu 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   7800
            TabIndex        =   31
            Top             =   1065
            Width           =   375
         End
         Begin VB.TextBox txt_n_usr 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   6480
            TabIndex        =   33
            Top             =   3510
            Width           =   1575
         End
         Begin VB.TextBox txt_u_prp 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   1770
            TabIndex        =   35
            Top             =   210
            Width           =   1335
         End
         Begin VB.TextBox txt_c_bco 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   5430
            TabIndex        =   39
            Top             =   1065
            Width           =   540
         End
         Begin VB.TextBox txt_c_pro 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   285
            HideSelection   =   0   'False
            Left            =   7425
            TabIndex        =   40
            Top             =   210
            Width           =   645
         End
         Begin Threed.SSPanel PnEndRisco 
            Height          =   2265
            Left            =   90
            TabIndex        =   41
            Top             =   1440
            Visible         =   0   'False
            Width           =   8175
            _Version        =   65536
            _ExtentX        =   14420
            _ExtentY        =   3995
            _StockProps     =   15
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BevelOuter      =   1
            Begin Threed.SSFrame FR3D_Local_Risco 
               Height          =   2100
               Left            =   0
               TabIndex        =   42
               Top             =   150
               Width           =   8150
               _Version        =   65536
               _ExtentX        =   14376
               _ExtentY        =   3704
               _StockProps     =   14
               Caption         =   "Endereço do Risco"
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
               Begin VB.TextBox Txt_N_LGD_RIS 
                  Appearance      =   0  'Flat
                  BackColor       =   &H00FFFFFF&
                  ForeColor       =   &H00800000&
                  Height          =   285
                  Left            =   105
                  MaxLength       =   50
                  TabIndex        =   48
                  Top             =   525
                  Width           =   6500
               End
               Begin VB.TextBox Txt_N_CPL_RIS 
                  Appearance      =   0  'Flat
                  BackColor       =   &H00FFFFFF&
                  ForeColor       =   &H00800000&
                  Height          =   285
                  Left            =   105
                  MaxLength       =   40
                  TabIndex        =   47
                  Top             =   1065
                  Width           =   5600
               End
               Begin VB.TextBox Txt_S_UF_RIS 
                  Appearance      =   0  'Flat
                  BackColor       =   &H00FFFFFF&
                  ForeColor       =   &H00800000&
                  Height          =   285
                  Left            =   6090
                  MaxLength       =   2
                  TabIndex        =   46
                  Top             =   1065
                  Width           =   500
               End
               Begin VB.TextBox Txt_N_BAI_RIS 
                  Appearance      =   0  'Flat
                  BackColor       =   &H00FFFFFF&
                  ForeColor       =   &H00800000&
                  Height          =   285
                  Left            =   105
                  MaxLength       =   30
                  TabIndex        =   45
                  Top             =   1620
                  Width           =   4200
               End
               Begin VB.TextBox Txt_N_CDD_RIS 
                  Appearance      =   0  'Flat
                  BackColor       =   &H00FFFFFF&
                  ForeColor       =   &H00800000&
                  Height          =   285
                  Left            =   4395
                  MaxLength       =   25
                  TabIndex        =   44
                  Top             =   1650
                  Width           =   3500
               End
               Begin VB.TextBox Txt_U_LGD_RIS 
                  Appearance      =   0  'Flat
                  BackColor       =   &H00FFFFFF&
                  ForeColor       =   &H00800000&
                  Height          =   285
                  Left            =   6800
                  MaxLength       =   5
                  TabIndex        =   43
                  Top             =   525
                  Width           =   1200
               End
               Begin MSMask.MaskEdBox ME_C_CEP_RIS 
                  Height          =   285
                  Left            =   6800
                  TabIndex        =   49
                  Top             =   1065
                  Width           =   1200
                  _ExtentX        =   2117
                  _ExtentY        =   503
                  _Version        =   393216
                  BackColor       =   16777215
                  ForeColor       =   8388608
                  PromptInclude   =   0   'False
                  PromptChar      =   "_"
               End
               Begin VB.Label LB_Nome_Cidade 
                  Appearance      =   0  'Flat
                  AutoSize        =   -1  'True
                  Caption         =   "Cidade"
                  ForeColor       =   &H00800000&
                  Height          =   195
                  Left            =   4380
                  TabIndex        =   56
                  Top             =   1440
                  Width           =   600
               End
               Begin VB.Label LB_Nome_Bairro 
                  Appearance      =   0  'Flat
                  AutoSize        =   -1  'True
                  Caption         =   "Bairro"
                  ForeColor       =   &H00800000&
                  Height          =   195
                  Left            =   105
                  TabIndex        =   55
                  Top             =   1410
                  Width           =   510
               End
               Begin VB.Label LB_Codigo_CEP 
                  Appearance      =   0  'Flat
                  AutoSize        =   -1  'True
                  Caption         =   "CEP"
                  ForeColor       =   &H00800000&
                  Height          =   195
                  Left            =   6800
                  TabIndex        =   54
                  Top             =   855
                  Width           =   375
               End
               Begin VB.Label LB_Sigla_UF 
                  Appearance      =   0  'Flat
                  AutoSize        =   -1  'True
                  Caption         =   "UF"
                  ForeColor       =   &H00800000&
                  Height          =   195
                  Left            =   6090
                  TabIndex        =   53
                  Top             =   855
                  Width           =   255
               End
               Begin VB.Label LB_Nome_Complemento 
                  Appearance      =   0  'Flat
                  AutoSize        =   -1  'True
                  Caption         =   "Complemento"
                  ForeColor       =   &H00800000&
                  Height          =   195
                  Left            =   105
                  TabIndex        =   52
                  Top             =   855
                  Width           =   1140
               End
               Begin VB.Label LB_Numero_Logradouro 
                  Appearance      =   0  'Flat
                  AutoSize        =   -1  'True
                  Caption         =   "Número"
                  ForeColor       =   &H00800000&
                  Height          =   195
                  Left            =   6800
                  TabIndex        =   51
                  Top             =   315
                  Width           =   660
               End
               Begin VB.Label LB_Nome_Logradouro 
                  Appearance      =   0  'Flat
                  AutoSize        =   -1  'True
                  Caption         =   "Logradouro"
                  ForeColor       =   &H00800000&
                  Height          =   195
                  Left            =   105
                  TabIndex        =   50
                  Top             =   315
                  Width           =   975
               End
            End
         End
         Begin VB.Label Label19 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Nascto:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   6120
            TabIndex        =   64
            Top             =   630
            Width           =   675
         End
         Begin VB.Label Label18 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Plano:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   4830
            TabIndex        =   62
            Top             =   2325
            Width           =   555
         End
         Begin VB.Label Label17 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Ramo:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   4800
            TabIndex        =   60
            Top             =   1530
            Width           =   555
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Vigência:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   4830
            TabIndex        =   59
            Top             =   1920
            Width           =   810
         End
         Begin VB.Label Label13 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Produto:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   6660
            TabIndex        =   13
            Top             =   240
            Width           =   735
         End
         Begin VB.Label Label11 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Nº Proposta Atual:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   120
            TabIndex        =   36
            Top             =   240
            Width           =   1590
         End
         Begin VB.Label Label10 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Usuário:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   5715
            TabIndex        =   34
            Top             =   3540
            Width           =   720
         End
         Begin VB.Label Label9 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Conta Corrente:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   4035
            TabIndex        =   32
            Top             =   1095
            Width           =   1350
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Nº Proposta Original:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   3345
            TabIndex        =   3
            Top             =   240
            Width           =   1800
         End
         Begin VB.Label Label3 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Data da Carga:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   120
            TabIndex        =   4
            Top             =   2325
            Width           =   1305
         End
         Begin VB.Label Label4 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Data da Proposta:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   120
            TabIndex        =   5
            Top             =   1920
            Width           =   1560
         End
         Begin VB.Label Label5 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Data da Recepção:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   120
            TabIndex        =   6
            Top             =   2745
            Width           =   1680
         End
         Begin VB.Label Label6 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Data da Exclusão:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   90
            TabIndex        =   7
            Top             =   3135
            Width           =   1575
         End
         Begin VB.Label Label7 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Nome:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   120
            TabIndex        =   8
            Top             =   675
            Width           =   555
         End
         Begin VB.Label Label8 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Canal de Vendas:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   120
            TabIndex        =   9
            Top             =   1530
            Width           =   1515
         End
         Begin VB.Label Label12 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Nº Ficha:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   150
            TabIndex        =   12
            Top             =   1110
            Width           =   810
         End
         Begin VB.Label Label14 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Chassi:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   4830
            TabIndex        =   14
            Top             =   2745
            Width           =   630
         End
         Begin VB.Label Label15 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Placa:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   4830
            TabIndex        =   15
            Top             =   3135
            Width           =   555
         End
         Begin VB.Label Label16 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Motivo:"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   90
            TabIndex        =   16
            Top             =   3480
            Width           =   645
         End
      End
   End
End
Attribute VB_Name = "R1FAB008"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub BU3D_Objeto_Click()
'+--------------------------------------------------------------------------+
'|               DISPONIBILIZA A TELA DE DADOS DO CLIENTE                   |
'+--------------------------------------------------------------------------+
    Screen.MousePointer = HOURGLASS
    With PnEndRisco
      .BevelOuter = 0
      .Top = 880
      .Left = 80
      If PnEndRisco.Visible = True Then
        .Visible = False
      Else
        .Visible = True
      End If
    End With
    Screen.MousePointer = DEFAULT
End Sub

Private Sub BU3D_Objeto_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB008 - Endereço de Risco"
End Sub

Private Sub BU3D_Volta_Click()
    
    'Dilson - call center corretor - 30/12/2002
    If CALL_CENTER_CORRETOR = True Then
        Volta_CALL_CENTER_CORRETOR = True
    Else
        Volta_CALL_CENTER_CORRETOR = False
    End If
    R1FAB001.Show
    su_inicializa_campos True

    Unload Me

End Sub

Private Sub bu3d_Volta_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Volta a tela anterior"
End Sub

Private Sub CB_D_EXC_PRP_Click()
    On Error GoTo TrataErro

Dim intIndex As Integer

    If CB_D_EXC_PRP.ListIndex = -1 Then Exit Sub
    
    intIndex = CB_D_EXC_PRP.ListIndex
    
    SU_PR_WAP_EXC_S11954    'Katsumi - 09/12/2002
    
    Exit Sub
    
TrataErro:
    
    MsgBox "Erro ao selecionar data em combo", vbCritical + vbOKOnly, "Erro Processamento"
    
End Sub

Private Sub cmbProp_Click()

    'Katsumi - R1PAB008 - 04/12/2002 - inicio
    If cmbProp.ListIndex = -1 Then Exit Sub

    axindex% = R1FAB008.cmbProp.ItemData(cmbProp.ListIndex)
    
    If (Index = axindex% And Index <> 0 And axindex% <> 0) Or (Index = 0 And axindex% = 0 And Prim_Sel = 1) Then
        Exit Sub
    End If

    SU_Dados_Proposta_Excluida axindex%
    
    'Guardar o conteúdo do index, para se houver uma próxima seleção e for o
    'mesmo, não carregar os campos novamente
    Index = axindex%
    
    'Armazenar 1, pois já foi feita a primeira seleção
    Prim_Sel = 1
    
    If CB_D_EXC_PRP.ListCount > 0 Then CB_D_EXC_PRP.ListIndex = 0
    'Katsumi - R1PAB008 - 04/12/2002 - fim
    
    If Me.Visible Then
        frm_Prop.Visible = True
        CB_D_EXC_PRP.Visible = True
        CB_D_EXC_PRP.Enabled = True
    End If
       
End Sub

Private Sub Form_Load()
    
    Select Case c_agr_fam_pro$
     Case 1  'AUTO
         BU3D_Objeto.Visible = False
         Label19.Visible = False
         msk_d_nas.Visible = False
     Case 3  'RPM
         BU3D_Objeto.Visible = True
         Label14.Visible = False
         txt_u_chs_aut.Visible = False
         Label15.Visible = False
         txt_u_plc_aut.Visible = False
         Label19.Visible = False
         msk_d_nas.Visible = False
     Case 4  'VIDA
         BU3D_Objeto.Visible = False
         Label19.Visible = True
         msk_d_nas.Visible = True
         Label2.Enabled = False
         txt_u_prp_org.Enabled = False
         Label14.Visible = False
         txt_u_chs_aut.Visible = False
         Label15.Visible = False
         txt_u_plc_aut.Visible = False
    End Select
    
    'Armazenar 0 para saber que está executando pela primeira vez
    Prim_Sel = 0
    
    Me.Caption = Me.Caption & " - " & str_Fam_Pro$
    SU_Ajusta_Form Me, 4
    
End Sub

Private Sub Form_QueryUnload(CANCEL As Integer, Unloadmode As Integer)
    Ind_UnloadMode = Unloadmode
    CANCEL = FU_Verifica_Saida(Unloadmode, Me)
End Sub

Private Sub Form_Unload(CANCEL As Integer)

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
            CANCEL = True
        End If
    End If
End Sub

Private Sub fr3d_Fundo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  pa3d_consulta.Caption = "R1FAB008 "
End Sub

Private Sub txt_c_loc_pgt_cvd_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Local do Pagamento do Canal de Vendas"
End Sub

Private Sub txt_c_pro_Change()
    pa3d_consulta.Caption = "R1FAB007 - Código do  Produto"
End Sub

Private Sub cb_d_exc_prp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Data de Exclusão da Proposta"
End Sub

Private Sub txt_d_prp_Change()
    pa3d_consulta.Caption = "R1FAB007 - Data da Proposta"
End Sub

Private Sub txt_d_prt_cga_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Data da Carga"
End Sub

Private Sub txt_d_rct_prp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Data Recebimento da Proposta"
End Sub

Private Sub txt_e_cvd_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Canal de Venda"
End Sub

Private Sub txt_n_cli_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Nome do Cliente"
End Sub

Private Sub txt_n_usr_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Motivo da Exclusão"
End Sub

Private Sub txt_u_chs_aut_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Nº do Chassi"
End Sub

Private Sub txt_u_dco_rgt_ssp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Nº Documento de Registro na SUSEP"
End Sub

Private Sub txt_u_fcp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Nº da Ficha de Compensação"
End Sub

Private Sub txt_u_plc_aut_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Placa do Veículo"
End Sub

Private Sub txt_u_prp_org_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Nº Proposta Org"
End Sub

Private Sub txt_u_rgt_ssp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    pa3d_consulta.Caption = "R1FAB007 - Código do Registro na SUSEP"
End Sub
