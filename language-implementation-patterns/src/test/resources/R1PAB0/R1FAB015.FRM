VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "THREED32.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form R1FAB015 
   Caption         =   "Dados do Marinheiro"
   ClientHeight    =   3990
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8580
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3990
   ScaleWidth      =   8580
   Begin Threed.SSPanel PA3D_Botoes 
      Align           =   1  'Align Top
      Height          =   735
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8580
      _Version        =   65536
      _ExtentX        =   15134
      _ExtentY        =   1296
      _StockProps     =   15
      ForeColor       =   0
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
      Alignment       =   1
      Begin Threed.SSCommand BU3D_Volta 
         Height          =   600
         Left            =   7320
         TabIndex        =   1
         Tag             =   "VOLTA"
         ToolTipText     =   "Sair"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   -2147483633
         Picture         =   "R1FAB015.frx":0000
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB015.frx":031A
         Top             =   120
         Width           =   1365
      End
   End
   Begin Threed.SSFrame fr3d_dados_lib 
      Height          =   3015
      Left            =   0
      TabIndex        =   2
      Top             =   660
      Width           =   8595
      _Version        =   65536
      _ExtentX        =   15161
      _ExtentY        =   5318
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
      Begin VB.TextBox tb_c_anr 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   4560
         MaxLength       =   15
         TabIndex        =   14
         Top             =   1860
         Width           =   1635
      End
      Begin VB.ComboBox cb_e_rlc_pes_pes 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   315
         Left            =   1560
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   1200
         Width           =   4545
      End
      Begin VB.TextBox tb_n_cge 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   1560
         MaxLength       =   15
         TabIndex        =   4
         Top             =   2460
         Width           =   3435
      End
      Begin VB.TextBox tb_c_mtc_mrh 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   1560
         MaxLength       =   30
         TabIndex        =   3
         Top             =   1860
         Width           =   2100
      End
      Begin MSMask.MaskEdBox tb_U_CPF_DCO 
         Height          =   285
         Left            =   3360
         TabIndex        =   10
         Top             =   495
         Width           =   345
         _ExtentX        =   609
         _ExtentY        =   503
         _Version        =   393216
         BackColor       =   16777215
         ForeColor       =   8388608
         PromptInclude   =   0   'False
         MaxLength       =   2
         Mask            =   "##"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox tb_U_CPF 
         Height          =   285
         Left            =   1560
         TabIndex        =   11
         Top             =   495
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   503
         _Version        =   393216
         BackColor       =   16777215
         ForeColor       =   8388608
         PromptInclude   =   0   'False
         MaxLength       =   9
         Mask            =   "#########"
         PromptChar      =   "_"
      End
      Begin VB.Label lb_c_anr 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Código do Agenciador"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   4560
         TabIndex        =   15
         Top             =   1605
         Width           =   1575
      End
      Begin VB.Label lb_u_cpf 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "C.P.F"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1560
         TabIndex        =   13
         Top             =   240
         Width           =   390
      End
      Begin VB.Label lb_u_cpf_dco 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "DAC"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   3360
         TabIndex        =   12
         Top             =   240
         Width           =   330
      End
      Begin VB.Label lb_e_rlc_pes_pes 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Tipo de Relacionamento com o Marinheiro:"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1575
         TabIndex        =   8
         Top             =   945
         Width           =   3045
      End
      Begin VB.Label lb_c_mtc_mrh 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "NIP"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1560
         TabIndex        =   7
         Top             =   1605
         Width           =   270
      End
      Begin VB.Label lb_c_cge 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Consignante"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1560
         TabIndex        =   6
         Top             =   2205
         Width           =   885
      End
   End
   Begin Threed.SSPanel PA3D_Status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   9
      Top             =   3645
      Width           =   8580
      _Version        =   65536
      _ExtentX        =   15134
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB015"
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
End
Attribute VB_Name = "R1FAB015"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub lb_t_cgo_fun_Click()

End Sub

Private Sub BU3D_Volta_Click()
    Screen.MousePointer = HOURGLASS
        
    R1FAB002.Show
    Unload Me
            
    Screen.MousePointer = DEFAULT

End Sub

Private Sub Form_Load()

    Dim C_RLC_PES_PES As String
    
    Call SU_Ajusta_Form(Me, 5)

    C_RLC_PES_PES$ = "7"
    
    'Carrega o tipo de relacionamento com o cliente
    If Not FU_PR_SPE_E_RLC_S10080(C_RLC_PES_PES$) Then
        MsgBox "Não foi possível carregar o tipo de relacionamento com o cliente.", MB_ICONSTOP
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If

    cb_e_rlc_pes_pes.Clear
    ret% = SqlResults%(SqlConn%)

    Do Until ret% = NOMORERESULTS Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            cb_e_rlc_pes_pes.AddItem Trim(SqlData$(SqlConn%, 3))
            cb_e_rlc_pes_pes.ItemData(cb_e_rlc_pes_pes.NewIndex) = Val(SqlData$(SqlConn%, 1))
            ret% = SqlNextRow%(SqlConn%)
        Loop
        ret% = SqlResults%(SqlConn%)
    Loop

    If ERRO_SQL% Then
        SU_LogOff
        MsgBox MSG_ERRO_SQL$, MB_ICONSTOP, Space$(30) & "Erro na Execução de SP" & Space$(55)
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If


    If Not FU_PR_AGR_PRO_S10840("M") Then
        MsgBox "Não foi possível carregar os dados do funcionário.", MB_ICONSTOP
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If
    
    ret% = SqlResults%(SqlConn%)

    Do Until ret% = NOMORERESULTS Or ret% = FAIL
        ret% = SqlNextRow%(SqlConn%)
        Do Until ret% = NOMOREROWS% Or ret% = FAIL
            TB_HIS_RSV.C_IDT_FUN_RSV$ = Val(SqlData$(SqlConn%, 1))
            TB_HIS_RSV.N_FUN_RSV$ = Trim(SqlData$(SqlConn%, 2))
            TB_HIS_RSV.T_CGO_FUN$ = Trim(SqlData$(SqlConn%, 3))
            TB_HIS_RSV.I_CLI_VIP$ = Trim(SqlData$(SqlConn%, 4))
            TB_HIS_RSV.U_CPF$ = Val(SqlData$(SqlConn%, 5))
            TB_HIS_RSV.U_CPF_DCO$ = Val(SqlData$(SqlConn%, 6))
            TB_HIS_RSV.E_RLC_PES_PES$ = Val(SqlData$(SqlConn%, 9))
            TB_HIS_RSV.C_RLC_PES_PES$ = Val(SqlData$(SqlConn%, 10))
            TB_HIS_RSV.N_CGE$ = SqlData$(SqlConn%, 11)
            TB_HIS_RSV.C_MTC_MRH$ = Val(SqlData$(SqlConn%, 12))
            TB_HIS_RSV.C_ANR$ = Val(SqlData$(SqlConn%, 13))
            ret% = SqlNextRow%(SqlConn%)
        Loop
        ret% = SqlResults%(SqlConn%)
    Loop

    If ERRO_SQL% Then
        SU_LogOff
        MsgBox MSG_ERRO_SQL$, MB_ICONSTOP, Space$(30) & "Erro na Execução de SP" & Space$(55)
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If
    
    SU_CARREGA_DADOS_FORM_015
    
    Screen.MousePointer = DEFAULT

End Sub

Sub SU_CARREGA_DADOS_FORM_015()

Dim CTD As Integer
Dim Achou As Integer

    Achou% = False
    For CTD% = 0 To cb_e_rlc_pes_pes.ListCount - 1
        If Trim(Str(cb_e_rlc_pes_pes.ItemData(CTD%))) = TB_HIS_RSV.E_RLC_PES_PES$ Then
            Achou% = True
            cb_e_rlc_pes_pes.ListIndex = CTD%
        End If
        If Achou% = False Then
            cb_e_rlc_pes_pes.ListIndex = -1
        End If
    Next CTD%
     
    tb_U_CPF.Text = Trim(TB_HIS_RSV.U_CPF$)
    tb_U_CPF_DCO.Text = Trim(TB_HIS_RSV.U_CPF_DCO$)
    
    tb_c_mtc_mrh.Text = Trim(TB_HIS_RSV.C_MTC_MRH)
    tb_c_anr.Text = Trim(TB_HIS_RSV.C_ANR)
    tb_n_cge.Text = Trim(TB_HIS_RSV.N_CGE)
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If Ind_UnloadMode = 0 Then
        
        If BU3D_Volta.Enabled = True Then
            BU3D_Volta_Click
        Else
            Cancel = True
        End If
    
    End If

End Sub
