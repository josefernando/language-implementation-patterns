VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "Msmask32.ocx"
Begin VB.Form R1FAB012 
   Caption         =   "Dados do Funcionário"
   ClientHeight    =   3975
   ClientLeft      =   1095
   ClientTop       =   3540
   ClientWidth     =   8595
   LinkTopic       =   "Form1"
   ScaleHeight     =   3975
   ScaleWidth      =   8595
   Begin Threed.SSPanel PA3D_Botoes 
      Align           =   1  'Align Top
      Height          =   735
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8595
      _Version        =   65536
      _ExtentX        =   15161
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
         Left            =   7890
         TabIndex        =   1
         Tag             =   "VOLTA"
         ToolTipText     =   "Volta para a tela de liberações"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   -2147483633
         Picture         =   "R1FAB012.frx":0000
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB012.frx":031A
         Top             =   120
         Width           =   1365
      End
   End
   Begin Threed.SSFrame fr3d_dados_lib 
      Height          =   2895
      Left            =   -225
      TabIndex        =   2
      Top             =   660
      Width           =   8805
      _Version        =   65536
      _ExtentX        =   15531
      _ExtentY        =   5106
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
      Begin VB.TextBox tb_n_fun_rsv 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   3000
         MaxLength       =   45
         TabIndex        =   9
         Top             =   600
         Width           =   5145
      End
      Begin VB.TextBox tb_t_cgo_fun 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   1080
         MaxLength       =   30
         TabIndex        =   8
         Top             =   1500
         Width           =   3660
      End
      Begin VB.TextBox tb_c_idt_fun_rsv 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   1080
         MaxLength       =   15
         TabIndex        =   7
         Text            =   ","
         Top             =   600
         Width           =   1515
      End
      Begin VB.ComboBox cb_e_rlc_pes_pes 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   315
         Left            =   1080
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   2400
         Width           =   3705
      End
      Begin VB.Frame Fr3d_Cli_Vip 
         Caption         =   "Cliente VIP?"
         ForeColor       =   &H00800000&
         Height          =   1140
         Left            =   5550
         TabIndex        =   3
         Top             =   930
         Width           =   1695
         Begin VB.OptionButton Op3d_Vip_Ninf 
            Caption         =   "Não &Informado"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   105
            TabIndex        =   19
            Top             =   765
            Width           =   1365
         End
         Begin VB.OptionButton Op3d_Vip_Sim 
            Caption         =   "&Sim"
            ForeColor       =   &H00800000&
            Height          =   255
            Left            =   120
            TabIndex        =   5
            Top             =   360
            Width           =   735
         End
         Begin VB.OptionButton Op3d_Vip_Nao 
            Caption         =   "&Não"
            ForeColor       =   &H00800000&
            Height          =   255
            Left            =   840
            TabIndex        =   4
            Top             =   360
            Width           =   735
         End
      End
      Begin MSMask.MaskEdBox ME_U_CPF_DCO 
         Height          =   285
         Left            =   6840
         TabIndex        =   10
         Top             =   2400
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
      Begin MSMask.MaskEdBox ME_U_CPF 
         Height          =   285
         Left            =   5520
         TabIndex        =   11
         Top             =   2400
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
      Begin VB.Label lb_c_idt_fun_rsv 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Código Identificação:"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1080
         TabIndex        =   17
         Top             =   350
         Width           =   1500
      End
      Begin VB.Label lb_n_fun_rsv 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Nome:"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   3000
         TabIndex        =   16
         Top             =   350
         Width           =   465
      End
      Begin VB.Label lb_t_cgo_fun 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Cargo:"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1080
         TabIndex        =   15
         Top             =   1245
         Width           =   465
      End
      Begin VB.Label lb_u_cpf 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "C.P.F"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   5520
         TabIndex        =   14
         Top             =   2145
         Width           =   390
      End
      Begin VB.Label lb_u_cpf_dco 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "DAC"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   6840
         TabIndex        =   13
         Top             =   2145
         Width           =   330
      End
      Begin VB.Label lb_e_rlc_pes_pes 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Tipo de Relacionamento com o Cliente:"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1095
         TabIndex        =   12
         Top             =   2145
         Width           =   2790
      End
   End
   Begin Threed.SSPanel PA3D_Status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   18
      Top             =   3630
      Width           =   8595
      _Version        =   65536
      _ExtentX        =   15161
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB012"
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
      Alignment       =   2
      Autosize        =   1
   End
End
Attribute VB_Name = "R1FAB012"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'+--------------------------------------------------------------------------+
'| Flag utilizado p/ indicar se o usuário fechou a aplicação via controlbox |
'+--------------------------------------------------------------------------+
Dim VF_END_R1FAB012 As Integer
Dim C_RLC_PES_PES As String

Sub SU_CARREGA_DADOS_FORM_012()

Dim CTD As Integer
Dim Achou As Integer

    tb_c_idt_fun_rsv.Text = Trim(TB_HIS_RSV.C_IDT_FUN_RSV$)
    tb_n_fun_rsv = Trim(TB_HIS_RSV.N_FUN_RSV$)
    tb_t_cgo_fun = Trim(TB_HIS_RSV.T_CGO_FUN$)
    
    If Trim(TB_HIS_RSV.I_CLI_VIP$) = "S" Then
        Op3d_Vip_Sim.Value = True
    Else
        If Trim(TB_HIS_RSV.I_CLI_VIP$) = "N" Then
            Op3d_Vip_Nao.Value = True
        Else
            Op3d_Vip_Ninf.Value = True
        End If
    End If
    
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
     
    ME_U_CPF.Text = Trim(TB_HIS_RSV.U_CPF$)
    ME_U_CPF_DCO.Text = Trim(TB_HIS_RSV.U_CPF_DCO$)

End Sub

Private Sub BU3D_Volta_Click()

    Screen.MousePointer = HOURGLASS
        
    R1FAB002.Show
    Unload Me
            
    Screen.MousePointer = DEFAULT
    
End Sub

Private Sub Form_Load()
    
    Screen.MousePointer = HOURGLASS
    
'+---------------------------------------------------+
'| Centraliza o formulário na tela para visualização |
'+---------------------------------------------------+
    Call SU_Ajusta_Form(Me, 5)
    
    C_RLC_PES_PES$ = "6"
    
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
    
    'Carrega os dados do funcionário
    If Not FU_PR_AGR_PRO_S10840() Then
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
    
    'CARREGA NA TELA OS DADOS QUE ESTÃO GRAVADOS NA TABELA
    SU_CARREGA_DADOS_FORM_012
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub Form_QueryUnload(CANCEL As Integer, Unloadmode As Integer)

'+--------------------------------------------------------------------------+
'|Não permite o término da sessão do Windows enquanto ñ encerrar a aplicação|
'+--------------------------------------------------------------------------+
    CANCEL = FU_Verifica_Saida(Unloadmode, Me)

'+--------------------------------------------------------------------------+
'|Verifica se a opção de fechar a aplicação foi solicitada pelo usuário     |
'+--------------------------------------------------------------------------+
    If Unloadmode = 0 Then
        BU3D_Volta_Click

        If VF_END_R1FAB012% = IDNO Then
            CANCEL = True
        End If
    End If

End Sub
