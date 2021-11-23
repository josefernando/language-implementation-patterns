VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Begin VB.Form R1FAB014 
   Caption         =   "Consulta Detalhes da Liberação"
   ClientHeight    =   7185
   ClientLeft      =   255
   ClientTop       =   435
   ClientWidth     =   10365
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7185
   ScaleWidth      =   10365
   Begin Threed.SSPanel PA3D_Status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   1
      Top             =   6840
      Width           =   10365
      _Version        =   65536
      _ExtentX        =   18283
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB014"
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
   Begin Threed.SSPanel PA3D_Botoes 
      Align           =   1  'Align Top
      Height          =   730
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10365
      _Version        =   65536
      _ExtentX        =   18283
      _ExtentY        =   1288
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
         Left            =   9720
         TabIndex        =   27
         Tag             =   "sai"
         Top             =   45
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   -2147483640
         Picture         =   "R1FAB014.frx":0000
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB014.frx":031A
         Top             =   120
         Width           =   1365
      End
   End
   Begin Threed.SSFrame fr3d_dados_lib 
      Height          =   2595
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   10140
      _Version        =   65536
      _ExtentX        =   17886
      _ExtentY        =   4577
      _StockProps     =   14
      Caption         =   "Dados Principais"
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
      Begin VB.TextBox tb_t_cmt_atz 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H00800000&
         Height          =   570
         Left            =   120
         MaxLength       =   200
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   26
         Top             =   1920
         Width           =   9855
      End
      Begin VB.Label lb_lib_com 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   7920
         TabIndex        =   31
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lb_niv_lib 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   5880
         TabIndex        =   30
         Top             =   600
         Width           =   1575
      End
      Begin VB.Label lb_niv 
         Caption         =   "Nível"
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
         Left            =   5880
         TabIndex        =   29
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label lb_ind_lib_com 
         Caption         =   "Liberação Comercial"
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
         Left            =   7920
         TabIndex        =   28
         Top             =   360
         Width           =   1815
      End
      Begin VB.Label lb_d_lib 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   120
         TabIndex        =   4
         Top             =   600
         Width           =   2355
      End
      Begin VB.Label lb_usr_lib 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   3000
         TabIndex        =   6
         Top             =   600
         Width           =   2475
      End
      Begin VB.Label lb_dt_lib 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Data:"
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
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   480
      End
      Begin VB.Label lb_n_usr 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Usuário:"
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
         Left            =   3000
         TabIndex        =   5
         Top             =   360
         Width           =   720
      End
      Begin VB.Label lb_tip_lib 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   120
         TabIndex        =   10
         Top             =   1260
         Width           =   3030
      End
      Begin VB.Label lb_descr_lib 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   3480
         TabIndex        =   8
         Top             =   1260
         Width           =   6525
      End
      Begin VB.Label lb_n_ntz_lib 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Tipo de liberação:"
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
         Left            =   120
         TabIndex        =   9
         Top             =   1020
         Width           =   1560
      End
      Begin VB.Label lb_tipo_lib 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Descrição:"
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
         Height          =   255
         Left            =   3480
         TabIndex        =   7
         Top             =   1005
         Width           =   1005
      End
      Begin VB.Label lb_mot_lib 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Motivo:"
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
         Left            =   120
         TabIndex        =   11
         Top             =   1680
         Width           =   765
      End
   End
   Begin Threed.SSFrame fr3d_lib_com 
      Height          =   1635
      Left            =   120
      TabIndex        =   12
      Top             =   3360
      Width           =   10140
      _Version        =   65536
      _ExtentX        =   17886
      _ExtentY        =   2884
      _StockProps     =   14
      Caption         =   "Liberação Comercial"
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
      Begin VB.Label Lb_c_psl_princ 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   120
         TabIndex        =   14
         ToolTipText     =   "2087-7 GERENCIA COMERCIAL SÃO PAULO INTERIOR 1       "
         Top             =   600
         Width           =   5385
      End
      Begin VB.Label Lb_c_psl_sec 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   120
         TabIndex        =   16
         ToolTipText     =   " 7452-7 UNIDADE COMERCIAL DE RIBEIRÃO PRETO"
         Top             =   1200
         Width           =   5385
      End
      Begin VB.Label lb_n_uog 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   5760
         TabIndex        =   18
         Top             =   1200
         Width           =   4185
      End
      Begin VB.Label lb_nome_uog 
         Appearance      =   0  'Flat
         Caption         =   "Nome do Gestor:"
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
         Height          =   255
         Left            =   5775
         TabIndex        =   17
         Top             =   960
         Width           =   2415
      End
      Begin VB.Label lb_psl_princ 
         Appearance      =   0  'Flat
         Caption         =   "Gerência Comercial:"
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
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   360
         Width           =   2535
      End
      Begin VB.Label lb_psl_sec 
         Appearance      =   0  'Flat
         Caption         =   "Área do Gestor Responsável:"
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
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   960
         Width           =   4335
      End
   End
   Begin Threed.SSFrame fr3d_atz_lib 
      Height          =   1755
      Left            =   120
      TabIndex        =   19
      Top             =   5040
      Width           =   10125
      _Version        =   65536
      _ExtentX        =   17859
      _ExtentY        =   3096
      _StockProps     =   14
      Caption         =   "Autorização"
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
      Begin VB.TextBox tb_t_jus_act 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H00800000&
         Height          =   570
         Left            =   120
         MaxLength       =   200
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   25
         Top             =   1080
         Width           =   9795
      End
      Begin VB.Label lb_d_act 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   120
         TabIndex        =   21
         Top             =   480
         Width           =   2355
      End
      Begin VB.Label lb_usr_act 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   3000
         TabIndex        =   23
         Top             =   480
         Width           =   2355
      End
      Begin VB.Label lb_d_hra_act 
         Appearance      =   0  'Flat
         Caption         =   "Data:"
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
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lb_usr 
         Appearance      =   0  'Flat
         Caption         =   "Usuário:"
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
         Height          =   255
         Left            =   3015
         TabIndex        =   22
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lb_mot_lib_atz 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Justificativa:"
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
         Left            =   120
         TabIndex        =   24
         Top             =   840
         Width           =   1095
      End
   End
End
Attribute VB_Name = "R1FAB014"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub SU_Limpa_Tela()
    lb_usr_lib.Caption = ""
    lb_d_lib.Caption = ""
    tb_t_cmt_atz.Text = ""
    lb_descr_lib.Caption = ""
    lb_lib_com.Caption = "NÃO"
    Lb_c_psl_princ.Caption = ""
    Lb_c_psl_sec.Caption = ""
    lb_n_uog.Caption = ""
    lb_usr_act.Caption = ""
    lb_d_act.Caption = ""
    tb_t_jus_act.Text = ""
    lb_tip_lib.Caption = ""
End Sub

Private Sub BU3D_Volta_Click()
    R1FAB010.Show
    Me.Hide
End Sub
Private Sub Form_Activate()
    Screen.MousePointer = vbHourglass
    
    '+---------------------------------------------------+
    '| Centraliza o formulário na tela para visualização |
    '+---------------------------------------------------+
    Me.Top = (Screen.Height) / 2 - Me.Height / 2
    Me.Left = (Screen.Width) / 2 - Me.Width / 2
    
    '+--------------------------------------------------------------------------+
    '| Limpa Campos da Tela                                                     |
    '+--------------------------------------------------------------------------+
    Call SU_Limpa_Tela
    
    '+--------------------------------------------------------------------------+
    '| Recupera dados da Liberação                                              |
    '+--------------------------------------------------------------------------+
    lb_usr_lib.Caption = UCase(VT_TRT_LIB_APO(Lin_Lib_Sel).n_usr_azd$)
    
    lb_d_lib.Caption = VT_TRT_LIB_APO(Lin_Lib_Sel).d_hra_atz$
        
    If Val(VT_TRT_LIB_APO(Lin_Lib_Sel).c_isg) = 0 Then
        lb_niv_lib.Caption = "APÓLICE"
    Else
        lb_niv_lib.Caption = "ITEM: " + VT_TRT_LIB_APO(Lin_Lib_Sel).c_isg
        
        If Val(VT_TRT_LIB_APO(Lin_Lib_Sel).c_gar) > 0 Then
            lb_niv_lib.Caption = lb_niv_lib.Caption & " GAR: " & VT_TRT_LIB_APO(Lin_Lib_Sel).c_gar
        End If
    End If
        
    If VT_TRT_LIB_APO(Lin_Lib_Sel).n_ntz_lib_prp = "" Then
        lb_n_ntz_lib.Visible = False
        lb_tip_lib.Visible = False
        lb_tipo_lib.Left = 240
        lb_descr_lib.Left = 240
    Else
        lb_tipo_lib.Left = 3480
        lb_descr_lib.Left = 3480
        lb_n_ntz_lib.Visible = True
        lb_tip_lib.Visible = True
        lb_tip_lib.Caption = VT_TRT_LIB_APO(Lin_Lib_Sel).n_ntz_lib_prp
    End If
    
    lb_descr_lib.Caption = VT_TRT_LIB_APO(Lin_Lib_Sel).t_e_lib$
    
    tb_t_cmt_atz.Text = UCase(VT_TRT_LIB_APO(Lin_Lib_Sel).t_cmt_atz$)
    
    If Val(VT_TRT_LIB_APO(Lin_Lib_Sel).c_psl_slc_pnc$) <> 0 Then
        lb_lib_com.Caption = "SIM"
        If fu_pr_uog_s01650(VT_TRT_LIB_APO(Lin_Lib_Sel).c_psl_slc_pnc$) Then
                Lb_c_psl_princ.Caption = VT_TRT_LIB_APO(Lin_Lib_Sel).c_psl_slc_pnc$ & "-" & u_psl_dco$ & " " & n_uog$
        End If
        lb_n_uog.Caption = UCase(VT_TRT_LIB_APO(Lin_Lib_Sel).n_pes_slc$)
    End If
    
    If Val(VT_TRT_LIB_APO(Lin_Lib_Sel).c_psl_slc_scu$) <> 0 Then
        If fu_pr_uog_s01650(VT_TRT_LIB_APO(Lin_Lib_Sel).c_psl_slc_scu$) Then
            Lb_c_psl_sec.Caption = VT_TRT_LIB_APO(Lin_Lib_Sel).c_psl_slc_scu & "-" & u_psl_dco$ & " " & n_uog$
        End If
    End If
            
    lb_usr_act.Caption = UCase(VT_TRT_LIB_APO(Lin_Lib_Sel).n_usr_act$)
    lb_d_act.Caption = VT_TRT_LIB_APO(Lin_Lib_Sel).d_hra_act$
    tb_t_jus_act.Text = UCase(VT_TRT_LIB_APO(Lin_Lib_Sel).t_cmt_act$)
    
    
    Screen.MousePointer = vbDefault
End Sub

Private Sub tb_t_cmt_atz_KeyDown(KeyCode As Integer, Shift As Integer)
'+--------------------------------------------------------------------------------+
'| Não permite a digitação neste controle, pois sua finalidade é de visualização  |
'+--------------------------------------------------------------------------------+
    Select Case KeyCode

        Case KEY_UP, KEY_DOWN, KEY_LEFT, KEY_RIGHT, KEY_HOME, KEY_END, CG_KEY_PAGE_UP%, CG_KEY_PAGE_DOWN%
            'Digitação permitida

        Case Else
            KeyCode = 0
    End Select
End Sub
Private Sub tb_t_cmt_atz_KeyPress(KeyAscii As Integer)
'+--------------------------------------------------------------------------------+
'| Não permite a digitação neste controle, pois sua finalidade é de visualização  |
'+--------------------------------------------------------------------------------+
    KeyAscii = 0
End Sub

Private Sub tb_t_jus_act_KeyDown(KeyCode As Integer, Shift As Integer)
'+--------------------------------------------------------------------------------+
'| Não permite a digitação neste controle, pois sua finalidade é de visualização  |
'+--------------------------------------------------------------------------------+
    Select Case KeyCode

        Case KEY_UP, KEY_DOWN, KEY_LEFT, KEY_RIGHT, KEY_HOME, KEY_END, CG_KEY_PAGE_UP%, CG_KEY_PAGE_DOWN%
            'Digitação permitida
        Case Else
            KeyCode = 0
    End Select

End Sub

Private Sub tb_t_jus_act_KeyPress(KeyAscii As Integer)
'+--------------------------------------------------------------------------------+
'| Não permite a digitação neste controle, pois sua finalidade é de visualização  |
'+--------------------------------------------------------------------------------+
    KeyAscii = 0
End Sub
