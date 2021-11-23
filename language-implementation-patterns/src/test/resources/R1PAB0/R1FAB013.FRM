VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "THREED32.OCX"
Begin VB.Form R1FAB013 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Titulo de Capitalização"
   ClientHeight    =   5940
   ClientLeft      =   1155
   ClientTop       =   3300
   ClientWidth     =   8865
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "R1FAB013.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5940
   ScaleWidth      =   8865
   Begin Threed.SSPanel PA3D_Botoes 
      Align           =   1  'Align Top
      Height          =   730
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8865
      _Version        =   65536
      _ExtentX        =   15637
      _ExtentY        =   1288
      _StockProps     =   15
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.2
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderWidth     =   1
      BevelInner      =   1
      RoundedCorners  =   0   'False
      Alignment       =   1
      Begin Threed.SSCommand BU3D_Volta 
         Height          =   600
         Left            =   7890
         TabIndex        =   1
         Tag             =   "VOLTA"
         ToolTipText     =   "Volta para a tela Anterior"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   -2147483633
         Picture         =   "R1FAB013.frx":08CA
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB013.frx":0BE4
         Top             =   120
         Width           =   1365
      End
   End
   Begin Threed.SSPanel PA3D_Status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   2
      Top             =   5595
      Width           =   8865
      _Version        =   65536
      _ExtentX        =   15637
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB013"
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.26
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderWidth     =   1
      BevelInner      =   1
      Alignment       =   2
      Autosize        =   1
   End
   Begin Threed.SSFrame fr3d_dados_titx ' ZE fr3d_dados_tit alterado para fr3d_dados_titx por erro
      Height          =   2775
      Index           =   0
      Left            =   0
      TabIndex        =   3
      Top             =   720
      Width           =   8805
      _Version        =   65536
      _ExtentX        =   15531
      _ExtentY        =   4895
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
      Begin VB.Frame fr3d_u_v_pmo_tcz_apo 
         Caption         =   "Valor da Premiação:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   795
         Index           =   0
         Left            =   60
         TabIndex        =   35
         Top             =   1920
         Width           =   8715
         Begin VB.TextBox tb_u_v_pmo_tcz_apo 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   420
            Index           =   0
            Left            =   180
            MaxLength       =   15
            TabIndex        =   36
            Text            =   "555555"
            Top             =   300
            Width           =   2955
         End
      End
      Begin VB.Frame fr3d_tit 
         Caption         =   "Título do Cliente:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   615
         Index           =   0
         Left            =   60
         TabIndex        =   6
         Top             =   180
         Width           =   8715
         Begin VB.TextBox tb_d_can 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   7440
            MaxLength       =   45
            TabIndex        =   31
            Top             =   225
            Width           =   1185
         End
         Begin VB.TextBox tb_d_ini_vig_tit 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   285
            Index           =   0
            Left            =   3840
            MaxLength       =   45
            TabIndex        =   9
            Top             =   225
            Width           =   1185
         End
         Begin VB.TextBox tb_tit_cpz 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   285
            Index           =   0
            Left            =   780
            MaxLength       =   20
            TabIndex        =   8
            Top             =   240
            Width           =   2200
         End
         Begin VB.TextBox tb_d_fim_vig_tit 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   285
            Index           =   0
            Left            =   5400
            MaxLength       =   45
            TabIndex        =   7
            Top             =   225
            Width           =   1185
         End
         Begin VB.Label lb_d_can 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Dt.Canc.:"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   6630
            TabIndex        =   32
            Top             =   285
            Width           =   825
         End
         Begin VB.Label lb_c_idt_fun_rsv 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Número:"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   195
            Index           =   0
            Left            =   60
            TabIndex        =   12
            Top             =   285
            Width           =   720
         End
         Begin VB.Label lb_n_fun_rsv 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Vig. de :"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   195
            Index           =   0
            Left            =   3080
            TabIndex        =   11
            Top             =   285
            Width           =   735
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Até"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   195
            Index           =   0
            Left            =   5060
            TabIndex        =   10
            Top             =   285
            Width           =   300
         End
      End
      Begin VB.Frame fr3d_u_sor 
         Caption         =   "Números para Sorteio do Cliente:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   795
         Index           =   0
         Left            =   60
         TabIndex        =   4
         Top             =   960
         Width           =   8715
         Begin VB.TextBox tb_u_cbn_sor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   420
            Index           =   5
            Left            =   7020
            MaxLength       =   15
            TabIndex        =   16
            Text            =   "123455"
            Top             =   300
            Width           =   1395
         End
         Begin VB.TextBox tb_u_cbn_sor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   420
            Index           =   4
            Left            =   5280
            MaxLength       =   15
            TabIndex        =   15
            Text            =   "123455"
            Top             =   300
            Width           =   1395
         End
         Begin VB.TextBox tb_u_cbn_sor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   420
            Index           =   3
            Left            =   3540
            MaxLength       =   15
            TabIndex        =   14
            Text            =   "123455"
            Top             =   300
            Width           =   1395
         End
         Begin VB.TextBox tb_u_cbn_sor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   420
            Index           =   2
            Left            =   1800
            MaxLength       =   15
            TabIndex        =   13
            Text            =   "123455"
            Top             =   300
            Width           =   1395
         End
         Begin VB.TextBox tb_u_cbn_sor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   420
            Index           =   1
            Left            =   180
            MaxLength       =   15
            TabIndex        =   5
            Text            =   "555555"
            Top             =   300
            Width           =   1395
         End
      End
   End
   Begin Threed.SSFrame fr3d_dados_tit 
      Height          =   1935
      Index           =   1
      Left            =   0
      TabIndex        =   17
      Top             =   3600
      Width           =   8805
      _Version        =   65536
      _ExtentX        =   15531
      _ExtentY        =   3413
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
      Begin VB.Frame fr3d_u_sor 
         Caption         =   "Números para Sorteio do Corretor:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   795
         Index           =   1
         Left            =   60
         TabIndex        =   25
         Top             =   960
         Width           =   8715
         Begin VB.TextBox tb_u_cbn_sor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   420
            Index           =   11
            Left            =   180
            MaxLength       =   15
            TabIndex        =   30
            Text            =   "555555"
            Top             =   300
            Width           =   1395
         End
         Begin VB.TextBox tb_u_cbn_sor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   420
            Index           =   12
            Left            =   1800
            MaxLength       =   15
            TabIndex        =   29
            Text            =   "123455"
            Top             =   300
            Width           =   1395
         End
         Begin VB.TextBox tb_u_cbn_sor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   420
            Index           =   13
            Left            =   3540
            MaxLength       =   15
            TabIndex        =   28
            Text            =   "123455"
            Top             =   300
            Width           =   1395
         End
         Begin VB.TextBox tb_u_cbn_sor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   420
            Index           =   14
            Left            =   5280
            MaxLength       =   15
            TabIndex        =   27
            Text            =   "123455"
            Top             =   300
            Width           =   1395
         End
         Begin VB.TextBox tb_u_cbn_sor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   18
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   420
            Index           =   15
            Left            =   7020
            MaxLength       =   15
            TabIndex        =   26
            Text            =   "123455"
            Top             =   300
            Width           =   1395
         End
      End
      Begin VB.Frame fr3d_tit 
         Caption         =   "Título do Corretor:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   615
         Index           =   1
         Left            =   60
         TabIndex        =   18
         Top             =   240
         Width           =   8715
         Begin VB.TextBox tb_d_can_cor 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   7440
            MaxLength       =   45
            TabIndex        =   33
            Top             =   225
            Width           =   1185
         End
         Begin VB.TextBox tb_d_fim_vig_tit 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   285
            Index           =   1
            Left            =   5325
            MaxLength       =   45
            TabIndex        =   21
            Top             =   225
            Width           =   1185
         End
         Begin VB.TextBox tb_tit_cpz 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   285
            Index           =   1
            Left            =   780
            MaxLength       =   15
            TabIndex        =   20
            Top             =   240
            Width           =   1680
         End
         Begin VB.TextBox tb_d_ini_vig_tit 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   285
            Index           =   1
            Left            =   3705
            MaxLength       =   45
            TabIndex        =   19
            Top             =   225
            Width           =   1185
         End
         Begin VB.Label lb_d_can_cor 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Dt.Canc.:"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   6540
            TabIndex        =   34
            Top             =   300
            Width           =   825
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Até"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   195
            Index           =   1
            Left            =   4965
            TabIndex        =   24
            Top             =   285
            Width           =   300
         End
         Begin VB.Label lb_n_fun_rsv 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            Caption         =   "Vigência de :"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   195
            Index           =   1
            Left            =   2580
            TabIndex        =   23
            Top             =   285
            Width           =   1140
         End
         Begin VB.Label lb_c_idt_fun_rsv 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Número:"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   195
            Index           =   1
            Left            =   60
            TabIndex        =   22
            Top             =   285
            Width           =   720
         End
      End
   End
End
Attribute VB_Name = "R1FAB013"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub BU3D_Volta_Click()

    Screen.MousePointer = HOURGLASS
        
    R1FAB002.Show
    Unload Me
            
    Screen.MousePointer = DEFAULT

End Sub

Private Sub Form_Load()

Dim FORMATO_NUM_SOR$

    Me.Caption = Me.Caption + " - " + R1FAB002.lb_apo.Caption
   
    u_cbn_sor$ = Empty
    u_cbn_sor_02$ = Empty
    u_cbn_sor_03$ = Empty
    u_cbn_sor_04$ = Empty
    u_cbn_sor_05$ = Empty
    
    u_cbn_sor_cor$ = Empty
    u_cbn_sor_02_cor$ = Empty
    u_cbn_sor_03_cor$ = Empty
    u_cbn_sor_04_cor$ = Empty
    u_cbn_sor_05_cor$ = Empty
    
    ' através do número da  seleciona dados da apólice
    ' na dbnprod..tb_tit_cpz
    If Not fu_sel_tit_cpz_titulo(0) Then
        Screen.MousePointer = DEFAULT
        MsgBox "Erro Título com os Números do Sorteio não Encontrado!", MB_ICONINFORMATION, txt_msg$
        Exit Sub
    End If
    
    tb_tit_cpz(0).Text = Format(u_pla_cpz$, "00") + u_pla_cpz_dco + Format(u_ser_tit_cpz, "000") + "." + Format(u_tit_cpz$, "000000") & "-" & u_tit_cpz_dco
    tb_d_ini_vig_tit(0).Text = d_ini_vig_tit$
    tb_d_fim_vig_tit(0).Text = d_fim_vig_tit$
    
    tb_tit_cpz(1).Text = Format(u_pla_cpz_cor$, "00") + u_pla_cpz_dco_cor + Format(u_ser_tit_cpz_cor, "000") + "." + Format(u_tit_cpz_cor$, "000000") & "-" & u_tit_cpz_dco_cor
    tb_d_ini_vig_tit(1).Text = d_ini_vig_tit_cor$
    tb_d_fim_vig_tit(1).Text = d_fim_vig_tit_cor$
    
    If Val(u_pla_cpz$) = 40 Then 'AUTO
        FORMATO_NUM_SOR$ = "000000"
        Me.Move 1695, 1560, 8985, 3315
        fr3d_tit(0).Caption = "Título:"
        fr3d_u_sor(0).Caption = "Números para Sorteio:"
    ElseIf Val(c_agr_fam_pro$) = 4 Then
        FORMATO_NUM_SOR$ = "00000"
        Me.Move 1695, 1560, 8985, 5310
'        Me.Move 1695, 1560, 8985, 6700
        fr3d_tit(0).Caption = "Primeiro Título do Cliente:"
        fr3d_tit(1).Caption = "Segundo Título do Cliente:"
        fr3d_u_sor(0).Caption = "Número para Sorteio do Cliente:"
        fr3d_u_sor(1).Caption = "Número para Sorteio do Cliente:"
        fr3d_u_v_pmo_tcz_apo(0).Caption = "Valor da Premiação:"  'Priscila de Sousa 20/07/2009 - R1PAB013

    Else 'RPM
        FORMATO_NUM_SOR$ = "00000"
        Me.Move 1695, 1560, 8985, 5310
        fr3d_tit(0).Caption = "Título do Cliente:"
        fr3d_tit(1).Caption = "Título do Corretor:"
        fr3d_u_sor(0).Caption = "Número para Sorteio do Cliente:"
        fr3d_u_sor(1).Caption = "Número para Sorteio do Corretor:"
    End If
       
    tb_u_cbn_sor(1).Text = Format(u_cbn_sor$, FORMATO_NUM_SOR$)
    tb_u_cbn_sor(2).Text = Format(u_cbn_sor_02$, FORMATO_NUM_SOR$)
    tb_u_cbn_sor(3).Text = Format(u_cbn_sor_03$, FORMATO_NUM_SOR$)
    tb_u_cbn_sor(4).Text = Format(u_cbn_sor_04$, FORMATO_NUM_SOR$)
    tb_u_cbn_sor(5).Text = Format(u_cbn_sor_05$, FORMATO_NUM_SOR$)
    
    tb_u_cbn_sor(11).Text = Format(u_cbn_sor_cor$, FORMATO_NUM_SOR$)
    tb_u_cbn_sor(12).Text = Format(u_cbn_sor_02_cor$, FORMATO_NUM_SOR$)
    tb_u_cbn_sor(13).Text = Format(u_cbn_sor_03_cor$, FORMATO_NUM_SOR$)
    tb_u_cbn_sor(14).Text = Format(u_cbn_sor_04_cor$, FORMATO_NUM_SOR$)
    tb_u_cbn_sor(15).Text = Format(u_cbn_sor_05_cor$, FORMATO_NUM_SOR$)
    
    tb_d_can.Text = d_can$          'Emilio L. Conde - 14/04/2003 - R1PAB017
    tb_d_can_cor.Text = d_can_cor$  'Emilio L. Conde - 14/04/2003 - R1PAB017
    
    tb_u_v_pmo_tcz_apo(0).Text = Replace(v_pmo_tcz_apo$, ".", ",")              'Priscila de Sousa - 20/07/2009 - R1PAB013
    tb_u_v_pmo_tcz_apo(0).Text = Format(tb_u_v_pmo_tcz_apo(0).Text, "Currency") 'Priscila de Sousa - 30/07/2009 - R1PAB013
          
    If Val(tb_u_cbn_sor(2).Text) = 0 Then tb_u_cbn_sor(2).Visible = False
    If Val(tb_u_cbn_sor(3).Text) = 0 Then tb_u_cbn_sor(3).Visible = False
    If Val(tb_u_cbn_sor(4).Text) = 0 Then tb_u_cbn_sor(4).Visible = False
    If Val(tb_u_cbn_sor(5).Text) = 0 Then tb_u_cbn_sor(5).Visible = False
    
    If Val(tb_u_cbn_sor(12).Text) = 0 Then tb_u_cbn_sor(12).Visible = False
    If Val(tb_u_cbn_sor(13).Text) = 0 Then tb_u_cbn_sor(13).Visible = False
    If Val(tb_u_cbn_sor(14).Text) = 0 Then tb_u_cbn_sor(14).Visible = False
    If Val(tb_u_cbn_sor(15).Text) = 0 Then tb_u_cbn_sor(15).Visible = False
    
    If Val(tb_d_can.Text) = 0 Then tb_d_can.Visible = False: lb_d_can.Visible = False               'Emilio L. Conde - 14/04/2003 - R1PAB017
    If Val(tb_d_can_cor.Text) = 0 Then tb_d_can_cor.Visible = False: lb_d_can_cor.Visible = False   'Emilio L. Conde - 14/04/2003 - R1PAB017
    
    'Priscila de Sousa - 20/07/2009 - R1PAB013
    If Trim(tb_u_v_pmo_tcz_apo(0).Text) = Null Or Trim(tb_u_v_pmo_tcz_apo(0).Text) = Empty Then
         tb_u_v_pmo_tcz_apo(0).Visible = False: fr3d_u_v_pmo_tcz_apo(0).Visible = False
         Me.Move 1695, 1560, 8985, 3315
     End If
              
    'sem numeros do corretor - Venda banco
    If Trim(tb_u_cbn_sor(11).Text) = Empty And Trim(tb_u_v_pmo_tcz_apo(0).Text) <> Null Or Trim(tb_u_v_pmo_tcz_apo(0).Text) <> Empty Then 'Priscila de Sousa - 20/07/2009 - R1PAB013
        'Me.Move 1695, 1560, 8985, 3315
         Me.Move 1695, 1560, 8985, 4300
    End If
    
End Sub

