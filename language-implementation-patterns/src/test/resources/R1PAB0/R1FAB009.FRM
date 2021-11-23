VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Begin VB.Form R1FAB009 
   Appearance      =   0  'Flat
   Caption         =   "Consulta à Apólice"
   ClientHeight    =   6330
   ClientLeft      =   1095
   ClientTop       =   1590
   ClientWidth     =   8610
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
   Icon            =   "R1FAB009.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6330
   ScaleWidth      =   8610
   Begin VB.CommandButton bu3d_altera 
      Caption         =   "Alterar Dados da Tela"
      Height          =   345
      Left            =   6420
      TabIndex        =   18
      Top             =   4530
      Visible         =   0   'False
      Width           =   2115
   End
   Begin Threed.SSFrame fr3d_dad_apo_ant 
      Height          =   2055
      Left            =   180
      TabIndex        =   6
      Top             =   1860
      Width           =   8370
      _Version        =   65536
      _ExtentX        =   14764
      _ExtentY        =   3625
      _StockProps     =   14
      Caption         =   "Dados da Apólice Anterior"
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
      Begin Threed.SSFrame fr3d_dad_apo_na 
         Height          =   750
         Left            =   75
         TabIndex        =   12
         Top             =   1110
         Width           =   8235
         _Version        =   65536
         _ExtentX        =   14526
         _ExtentY        =   1323
         _StockProps     =   14
         Caption         =   "Nova Arquitetura"
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
         Begin VB.TextBox tb_c_cia_ita_ant 
            Appearance      =   0  'Flat
            BackColor       =   &H8000000F&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   570
            MaxLength       =   2
            TabIndex        =   23
            Top             =   360
            Width           =   375
         End
         Begin VB.TextBox tb_u_apo_pnc_ant 
            Appearance      =   0  'Flat
            BackColor       =   &H8000000F&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   3270
            MaxLength       =   9
            TabIndex        =   21
            Top             =   360
            Width           =   1200
         End
         Begin VB.Label lb_c_cia_ita_ant 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Cia"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   180
            TabIndex        =   22
            Top             =   380
            Width           =   285
         End
         Begin VB.Label lb_dsc_u_apo_dpd_ant 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Apólice Dependente"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   4980
            TabIndex        =   4
            Top             =   380
            Width           =   1740
         End
         Begin VB.Label lb_u_apo_dpd_ant 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   6795
            TabIndex        =   5
            Top             =   360
            Width           =   1350
         End
         Begin VB.Label lb_dsc_c_rmo_ant 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Ramo"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   1320
            TabIndex        =   7
            Top             =   375
            Width           =   495
         End
         Begin VB.Label lb_c_rmo_ant 
            Alignment       =   1  'Right Justify
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   1890
            TabIndex        =   8
            Top             =   360
            Width           =   390
         End
         Begin VB.Label lb_dsc_u_apo_pnc_ant 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Apólice"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   2565
            TabIndex        =   13
            Top             =   375
            Width           =   645
         End
      End
      Begin Threed.SSFrame fr3d_dad_apo_mfr 
         Height          =   750
         Left            =   75
         TabIndex        =   9
         Top             =   270
         Width           =   8235
         _Version        =   65536
         _ExtentX        =   14526
         _ExtentY        =   1323
         _StockProps     =   14
         Caption         =   "Mainframe"
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
         Begin VB.TextBox tb_c_isg_apo_ori 
            Appearance      =   0  'Flat
            BackColor       =   &H8000000F&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   4710
            MaxLength       =   10
            TabIndex        =   24
            Top             =   330
            Width           =   1275
         End
         Begin VB.TextBox tb_u_apo_ori 
            Appearance      =   0  'Flat
            BackColor       =   &H8000000F&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   900
            MaxLength       =   10
            TabIndex        =   20
            Top             =   330
            Width           =   2535
         End
         Begin VB.Label lb_dsc_c_isg_apo_ori 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Item"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   4275
            TabIndex        =   11
            Top             =   345
            Width           =   375
         End
         Begin VB.Label lb_dsc_u_apo_ori 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            Caption         =   "Apólice"
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   200
            TabIndex        =   10
            Top             =   345
            Width           =   645
         End
      End
   End
   Begin Threed.SSPanel pa3d_status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   3
      Top             =   5985
      Width           =   8610
      _Version        =   65536
      _ExtentX        =   15187
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB009"
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
   Begin Threed.SSPanel PA3D_Topo 
      Align           =   1  'Align Top
      Height          =   730
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   8610
      _Version        =   65536
      _ExtentX        =   15187
      _ExtentY        =   1288
      _StockProps     =   15
      ForeColor       =   -2147483640
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
      Alignment       =   8
      Begin Threed.SSCommand bu3d_sai 
         Height          =   600
         Left            =   7935
         TabIndex        =   0
         Tag             =   "sai"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         AutoSize        =   2
         Picture         =   "R1FAB009.frx":030A
      End
      Begin Threed.SSCommand bu3d_volta 
         Height          =   600
         Left            =   7305
         TabIndex        =   1
         Tag             =   "sai"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB009.frx":0624
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB009.frx":093E
         Top             =   120
         Width           =   1365
      End
   End
   Begin Threed.SSFrame fr3d_dad_apo 
      Height          =   855
      Left            =   180
      TabIndex        =   14
      Top             =   900
      Width           =   8370
      _Version        =   65536
      _ExtentX        =   14764
      _ExtentY        =   1508
      _StockProps     =   14
      Caption         =   "Dados da Apólice "
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
      Begin VB.TextBox tb_d_ini_pri_apo 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   3510
         MaxLength       =   10
         TabIndex        =   19
         Top             =   450
         Width           =   1095
      End
      Begin VB.TextBox tb_u_vrs_ctr_hsu 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   6840
         MaxLength       =   20
         TabIndex        =   17
         Top             =   450
         Width           =   1305
      End
      Begin VB.Label lb_u_vrs_ctr_hsu 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Versão"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   6120
         TabIndex        =   16
         Top             =   465
         Width           =   600
      End
      Begin VB.Label lb_dsc_d_emi_pri_apo 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Vig. da 1ª Apólice"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   1890
         TabIndex        =   15
         Top             =   465
         Width           =   1545
      End
   End
End
Attribute VB_Name = "R1FAB009"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim liberado As Boolean

Private Sub bu3d_altera_Click()

    Screen.MousePointer = HOURGLASS

    If Trim(tb_d_ini_pri_apo.Text) <> "" Then
        If Not FU_IsDate(Trim(tb_d_ini_pri_apo.Text)) Then
            Screen.MousePointer = DEFAULT
            MsgBox "Data inválida", vbCritical, "ATENÇÃO"
            tb_d_ini_pri_apo.SetFocus
            Exit Sub
        End If
        If DateValue(tb_d_ini_pri_apo.Text) > DateValue(Date) Then
            Screen.MousePointer = DEFAULT
            MsgBox "Data maior que data atual", vbCritical, "ATENÇÃO"
            tb_d_ini_pri_apo.SetFocus
            Exit Sub
        End If
    End If

    If Trim(tb_c_cia_ita_ant.Text) = "" And Trim(tb_u_apo_pnc_ant.Text) <> "" Then
        Screen.MousePointer = DEFAULT
        MsgBox "Informar Cia", vbCritical, "ATENÇÃO"
        tb_c_cia_ita_ant.SetFocus
        Exit Sub
    End If
    If Trim(tb_c_cia_ita_ant.Text) <> "" And Trim(tb_u_apo_pnc_ant.Text) = "" Then
        Screen.MousePointer = DEFAULT
        MsgBox "Informar Apólice", vbCritical, "ATENÇÃO"
        tb_u_apo_pnc_ant.SetFocus
        Exit Sub
    End If
    If Trim(tb_u_apo_ori.Text) = "" And Trim(tb_c_isg_apo_ori.Text) <> "" Then
        Screen.MousePointer = DEFAULT
        MsgBox "Informar Apólice Mainframe", vbCritical, "ATENÇÃO"
        tb_u_apo_ori.SetFocus
        Exit Sub
    End If
    If Trim(tb_u_apo_ori.Text) <> "" And Trim(tb_c_isg_apo_ori.Text) = "" Then
        Screen.MousePointer = DEFAULT
        MsgBox "Informar Item Mainframe", vbCritical, "ATENÇÃO"
        tb_c_isg_apo_ori.SetFocus
        Exit Sub
    End If
   
    If Trim(tb_u_apo_pnc_ant.Text) <> "" And (tb_u_apo_pnc_ant.BackColor = &HFFFFFF Or tb_c_cia_ita_ant.BackColor = &HFFFFFF) Then
        If Not FU_VERIFICA_APO(Me) Then
            Screen.MousePointer = DEFAULT
            MsgBox "Apólice não encontrada !!!", vbCritical, "ATENÇÃO"
            tb_u_apo_pnc_ant.SetFocus
            Exit Sub
        End If
    End If
   
    If Not fu_alt_dados_apo(Me) Then
        Screen.MousePointer = DEFAULT
        MsgBox "Erro na Atualização", vbCritical, "ATENÇÃO"
        Exit Sub
    End If

    If Trim(tb_d_ini_pri_apo.Text) = "" Then
        sg_d_ini_pri_apo$ = "06/06/2079"
    Else
        sg_d_ini_pri_apo$ = tb_d_ini_pri_apo.Text
    End If
    
    sg_u_vrs_ctr_hsu$ = Trim(tb_u_vrs_ctr_hsu.Text)
    
    sg_u_apo_ori$ = tb_u_apo_ori.Text
    sg_c_isg_apo_ori$ = tb_c_isg_apo_ori.Text
    
    If Val(Trim(tb_u_apo_pnc_ant.Text)) > 0 Then
        sg_c_cia_ita_ant$ = tb_c_cia_ita_ant.Text
        sg_c_rmo_ant$ = lb_c_rmo_ant.Caption
        sg_u_apo_pnc_ant$ = tb_u_apo_pnc_ant.Text
        sg_u_apo_dpd_ant$ = lb_u_apo_dpd_ant.Caption
    End If
    
    bu3d_altera.Visible = False
    bu3d_volta.SetFocus
    DoEvents
    
    tb_d_ini_pri_apo.BackColor = &HC0C0C0
    tb_u_vrs_ctr_hsu.BackColor = &HC0C0C0
    tb_u_apo_ori.BackColor = &HC0C0C0
    tb_c_isg_apo_ori.BackColor = &HC0C0C0
    tb_c_cia_ita_ant.BackColor = &HC0C0C0
    tb_u_apo_pnc_ant.BackColor = &HC0C0C0
    
    Screen.MousePointer = DEFAULT
   
End Sub

Private Sub BU3d_Sai_Click()

    Screen.MousePointer = HOURGLASS

    SU_Saida

End Sub

Private Sub bu3d_sai_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB009 - Encerra a aplicação"

End Sub

Private Sub BU3D_Volta_Click()

    Screen.MousePointer = HOURGLASS

    'bg_voltando = True

    R1FAB002.Show
    Unload Me
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_Volta_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB009 - Retorna a tela principal de dados da apólice"

End Sub

Private Sub Form_Load()

    Screen.MousePointer = HOURGLASS

    liberado = True

    SU_Ajusta_Form Me, 4

    su_carrega_dados
    
    bu3d_altera.Visible = False
    
    Screen.MousePointer = DEFAULT

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB009"

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
        
        If bu3d_sai.Enabled = True Then
            BU3d_Sai_Click
        Else
            CANCEL = True
        End If
    
    End If

End Sub

Private Sub fr3d_dad_apo_ant_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB009"

End Sub

Private Sub fr3d_dad_apo_mfr_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB009"

End Sub

Private Sub fr3d_dad_apo_na_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB009"

End Sub

Private Sub IM_Itau_Seguros_DblClick()

    liberado = True

End Sub

Private Sub PA3D_Topo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB009"

End Sub

Private Sub su_carrega_dados()

    'Carrega os dados da tela
    '------------------------
    'Luciane - 21/05/1999 - Início
    'Se u_apo_ori da tb_apo for null, faz uma pesquisa na tb_apo_ant para
    'obter u_apo_ant, onde as 10 primeiras posições corresponde ao número
    'da apólice e as 10 últimas posições, ao item.
    If sg_u_apo_ori$ = "" Then
        If fu_sel_apo_ant() Then
            sg_u_apo_ori$ = Left(u_apo_ant$, 10)
            If Len(u_apo_ant$) > 10 Then
                sg_c_isg_apo_ori$ = Left(u_apo_ant$, 10)
            End If
        End If
    End If
    'Luciane - 21/05/1999 - Fim

    'Frame de Dados das apólice anterior
    tb_u_apo_ori.Text = sg_u_apo_ori$
    tb_c_isg_apo_ori.Text = sg_c_isg_apo_ori$
    
    If sg_d_ini_pri_apo$ = "06/06/2079" Then
        tb_d_ini_pri_apo.Text = ""
    Else
        tb_d_ini_pri_apo.Text = sg_d_ini_pri_apo$
    End If
    
    If Val(sg_u_apo_pnc_ant$) > 0 Then      '   PauloFLopes     13/08/2008
        tb_c_cia_ita_ant.Text = Format(sg_c_cia_ita_ant$, "00")
        lb_c_rmo_ant.Caption = Format(sg_c_rmo_ant$, "00")
        tb_u_apo_pnc_ant.Text = Format(sg_u_apo_pnc_ant$, "000000000")
        lb_u_apo_dpd_ant.Caption = Format(sg_u_apo_dpd_ant$, "00000")
    End If

    tb_u_vrs_ctr_hsu.Text = sg_u_vrs_ctr_hsu$
    
    'Carrega o título do formulário
    R1FAB009.Caption = R1FAB002.Caption

End Sub

Private Sub tb_c_cia_ita_ant_Change()
        
    If Not liberado Then Exit Sub
    
    bu3d_altera.Visible = True

End Sub

Private Sub tb_c_cia_ita_ant_GotFocus()

    If Not liberado Then
        bu3d_volta.SetFocus
        Exit Sub
    End If

    tb_c_cia_ita_ant.BackColor = &HFFFFFF

End Sub

Private Sub tb_c_cia_ita_ant_KeyPress(KeyAscii As Integer)

    If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    
    ElseIf KeyAscii = 13 And Trim(tb_u_apo_pnc_ant.Text) = "" Then
        tb_u_apo_pnc_ant.SetFocus
    ElseIf KeyAscii = 13 Then
        bu3d_altera_Click
    Else
        KeyAscii = 0
    End If

End Sub

Private Sub tb_c_cia_ita_ant_LostFocus()

    If Not liberado Then Exit Sub

    If bu3d_altera.Visible Then
        If Val(Trim(tb_c_cia_ita_ant.Text)) > 0 Then
            lb_c_rmo_ant.Caption = "87"
            lb_u_apo_dpd_ant.Caption = "0"
        Else
            lb_c_rmo_ant.Caption = ""
            lb_u_apo_dpd_ant.Caption = ""
        End If
    End If

End Sub

Private Sub tb_c_isg_apo_ori_Change()

    bu3d_altera.Visible = True

End Sub

Private Sub tb_c_isg_apo_ori_GotFocus()

    tb_c_isg_apo_ori.BackColor = &HFFFFFF

End Sub

Private Sub tb_c_isg_apo_ori_KeyPress(KeyAscii As Integer)

    If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    
    ElseIf KeyAscii = 13 Then
        bu3d_altera_Click
    Else
        KeyAscii = 0
    End If

End Sub

Private Sub tb_c_isg_apo_ori_LostFocus()

    If bu3d_altera.Visible Then
        If Trim(tb_c_isg_apo_ori.Text) <> "" Then
            tb_c_isg_apo_ori.Text = Format(tb_c_isg_apo_ori.Text, "0000000000")
        End If
    End If

End Sub

Private Sub tb_d_ini_pri_apo_Change()

    bu3d_altera.Visible = True

End Sub

Private Sub tb_d_ini_pri_apo_GotFocus()

    tb_d_ini_pri_apo.BackColor = &HFFFFFF

End Sub


Private Sub tb_d_ini_pri_apo_KeyPress(KeyAscii As Integer)

    If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = Asc("/") Or KeyAscii = KEY_BACK Then
    
    ElseIf KeyAscii = 13 Then
        bu3d_altera_Click
    Else
        KeyAscii = 0
    End If

End Sub

Private Sub tb_u_apo_ori_Change()

    bu3d_altera.Visible = True

End Sub


Private Sub tb_u_apo_ori_GotFocus()

    tb_u_apo_ori.BackColor = &HFFFFFF

End Sub


Private Sub tb_u_apo_ori_KeyPress(KeyAscii As Integer)

    If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    
    ElseIf KeyAscii = 13 Then
        bu3d_altera_Click
    Else
        KeyAscii = 0
    End If
End Sub

Private Sub tb_u_apo_ori_LostFocus()

    If bu3d_altera.Visible Then
        If Val(Trim(tb_u_apo_ori.Text)) > 0 Then
            tb_u_apo_ori.Text = Format(tb_u_apo_ori.Text, "0000000000")
            If Trim(tb_c_isg_apo_ori.Text) = "" Then
                tb_c_isg_apo_ori.Text = "0000000000"
            End If
        End If
    End If
    
End Sub

Private Sub tb_u_apo_pnc_ant_Change()

    If Not liberado Then Exit Sub
    
    bu3d_altera.Visible = True

End Sub


Private Sub tb_u_apo_pnc_ant_GotFocus()

    If Not liberado Then
        bu3d_volta.SetFocus
        Exit Sub
    End If
    
    tb_u_apo_pnc_ant.BackColor = &HFFFFFF

End Sub

Private Sub tb_u_apo_pnc_ant_KeyPress(KeyAscii As Integer)

    If KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = KEY_BACK Then
    
    ElseIf KeyAscii = 13 And Trim(tb_c_cia_ita_ant.Text) = "" Then
        tb_c_cia_ita_ant.SetFocus
    ElseIf KeyAscii = 13 Then
        bu3d_altera_Click
    Else
        KeyAscii = 0
    End If

End Sub

Private Sub tb_u_apo_pnc_ant_LostFocus()

    If Not liberado Then Exit Sub
    
    If bu3d_altera.Visible Then
        If Val(Trim(tb_u_apo_pnc_ant.Text)) > 0 Then
            lb_c_rmo_ant.Caption = "87"
            lb_u_apo_dpd_ant.Caption = "0"
        Else
            lb_c_rmo_ant.Caption = ""
            lb_u_apo_dpd_ant.Caption = ""
        End If
    End If
    
End Sub

Private Sub tb_u_vrs_ctr_hsu_Change()

    bu3d_altera.Visible = True
    
End Sub

Private Sub tb_u_vrs_ctr_hsu_GotFocus()

    tb_u_vrs_ctr_hsu.BackColor = &HFFFFFF

End Sub

Private Sub tb_u_vrs_ctr_hsu_KeyPress(KeyAscii As Integer)

    If KeyAscii = 13 Then
        bu3d_altera_Click
    End If
    
End Sub

