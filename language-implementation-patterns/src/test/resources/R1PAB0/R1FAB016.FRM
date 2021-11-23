VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Begin VB.Form R1FAB016 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Tipo Formalização"
   ClientHeight    =   3795
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8580
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3795
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
         Picture         =   "R1FAB016.frx":0000
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB016.frx":031A
         Top             =   120
         Width           =   1365
      End
   End
   Begin Threed.SSFrame fr3d_dados_flr 
      Height          =   2655
      Left            =   0
      TabIndex        =   2
      Top             =   720
      Width           =   8595
      _Version        =   65536
      _ExtentX        =   15161
      _ExtentY        =   4683
      _StockProps     =   14
      Caption         =   "Dados da Formalização"
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
      Begin VB.TextBox txtComprovante 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   240
         MaxLength       =   30
         TabIndex        =   12
         Top             =   2055
         Width           =   8220
      End
      Begin VB.TextBox txtSituacao 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   3840
         MaxLength       =   30
         TabIndex        =   10
         Top             =   1335
         Width           =   4620
      End
      Begin VB.TextBox txtControleFormalizacao 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   240
         MaxLength       =   30
         TabIndex        =   8
         Top             =   1335
         Width           =   3180
      End
      Begin VB.TextBox txtDataHoraFormalizacao 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   3840
         MaxLength       =   30
         TabIndex        =   6
         Top             =   615
         Width           =   3540
      End
      Begin VB.TextBox txtTipoFormalizacao 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   240
         MaxLength       =   30
         TabIndex        =   4
         Top             =   615
         Width           =   3180
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Comprovante:"
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
         Left            =   240
         TabIndex        =   13
         Top             =   1800
         Width           =   1185
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Situação:"
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
         Left            =   3840
         TabIndex        =   11
         Top             =   1080
         Width           =   825
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Controle:"
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
         Left            =   240
         TabIndex        =   9
         Top             =   1080
         Width           =   780
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Data/Hora:"
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
         Left            =   3840
         TabIndex        =   7
         Top             =   360
         Width           =   975
      End
      Begin VB.Label lb_c_mtc_mrh 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Tipo Formalização:"
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
         Left            =   240
         TabIndex        =   5
         Top             =   360
         Width           =   1620
      End
   End
   Begin Threed.SSPanel PA3D_Status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   3
      Top             =   3450
      Width           =   8580
      _Version        =   65536
      _ExtentX        =   15134
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB016"
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
Attribute VB_Name = "R1FAB016"
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
    '***********************************************************
    ' Área reservada para definição de variáveis
    '***********************************************************
    Dim oDadosFormalizacao  As New R1CAB016
    Dim i_asn_eln           As String
    Dim u_ctc As String
    Dim e_ass As String
    '***********************************************************
    ' Área reservada para definição de configurações iniciais
    ' de tela.
    '***********************************************************
    Screen.MousePointer = HOURGLASS
    Call SU_Ajusta_Form(Me, 5)
    
    '***********************************************************
    ' BRQ IT - Rogerio Sotto - 19/09/2013
    ' Para o agrupamento 3 considerar FU_ConsultaTipoAssinaturaApoliceResidencial
    '***********************************************************
    If (Val(c_agr_fam_pro$) = 3) And e_fam_pro_ok = 4 Then
        '***********************************************************
        ' Executa a funcionalidade responsável pela recuperação
        ' dos dados de tipo de assinatura da apólice
        '***********************************************************
        i_asn_eln = UCase(Trim(FU_ConsultaTipoAssinaturaApoliceResidencial(c_rmo, c_cia_ita, u_apo_pnc, u_apo_dpd)))
        If UCase(Trim(i_asn_eln)) <> "B" Then
            i_asn_eln = aux_i_asn_eln
        End If
    ElseIf ((Val(c_agr_fam_pro$) = 3) Or (Val(c_agr_fam_pro$) = 4)) And (e_fam_pro_ok = 8 Or e_fam_pro_ok = 3 Or e_fam_pro_ok = 9 Or e_fam_pro_ok = 10) Then
        i_asn_eln = UCase(Trim(FU_ConsultaTipoAssinaturaApoliceFR(c_rmo, c_cia_ita, u_apo_pnc, u_apo_dpd)))
        If i_asn_eln = "" Then
            '***********************************************************
            ' Executa a funcionalidade responsável pela recuperação
            ' dos dados de tipo de assinatura da apólice
            '***********************************************************
            i_asn_eln = UCase(Trim(FU_ConsultaTipoAssinaturaApolice(c_rmo, c_cia_ita, u_apo_pnc, u_apo_dpd, u_adi)))
        End If
    End If
    '***********************************************************
    ' Executa a funcionalidade responsável pela recuperação
    ' dos dados de formalização.
    '***********************************************************
    If i_asn_eln = "B" Then
        If (Val(c_agr_fam_pro$) = 3) And e_fam_pro_ok = 4 Then
            If FU_ConsultaFormalizacaoApoliceResidencial(c_cia_ita, u_apo_pnc, u_apo_dpd, oDadosFormalizacao) = FAIL Then
                Exit Sub
            End If
        ElseIf ((Val(c_agr_fam_pro$) = 3) Or (Val(c_agr_fam_pro$) = 4)) And (e_fam_pro_ok = 8 Or e_fam_pro_ok = 3 Or e_fam_pro_ok = 9 Or e_fam_pro_ok = 10) Then
            u_ctc = FU_ConsultaCotacaoporApoliceFR(c_cia_ita, u_apo_pnc, u_apo_dpd)
            If FU_ConsultaFormalizacaoApoliceFR(u_ctc, oDadosFormalizacao, e_ass) = FAIL Then
                Exit Sub
            End If
            If e_ass = "" Then
                If FU_ConsultaFormalizacaoApolice(c_cia_ita, u_apo_pnc, u_apo_dpd, u_adi, oDadosFormalizacao) = FAIL Then
                    Exit Sub
                End If
            End If
'        Else
'            If FU_ConsultaFormalizacaoApolice(c_cia_ita, u_apo_pnc, u_apo_dpd, u_adi, oDadosFormalizacao) = FAIL Then
'                Exit Sub
'            End If
        End If
    End If
    '***********************************************************
    ' Preenche os objetos do formulário de acordo com o
    ' foi retornado da funcionalidade de recuperação dos
    ' dados de formalização remota.
    '***********************************************************
    txtTipoFormalizacao.Text = retornaDescricaoTipoFormalizacao(i_asn_eln, oDadosFormalizacao.n_cee_etd)
    If i_asn_eln = "B" Then
        txtControleFormalizacao.Text = oDadosFormalizacao.u_cfc_eln_prp
        txtDataHoraFormalizacao.Text = oDadosFormalizacao.d_hra_cfc_eln
        If (Val(c_agr_fam_pro$) = 3) And e_fam_pro_ok = 4 Then
            If oDadosFormalizacao.e_sit_cfc_eln <> "" Then
                txtSituacao.Text = retornaDescricaoSituacaoFLR(CInt(oDadosFormalizacao.e_sit_cfc_eln))
            End If
        Else
            txtSituacao.Text = oDadosFormalizacao.e_sit_cfc_eln
        End If
        txtComprovante.Text = oDadosFormalizacao.c_idt_trn_eln
    End If
    '***********************************************************
    ' Retorna o ponteiro do mouse para o padrão
    '***********************************************************
    Screen.MousePointer = DEFAULT
End Sub
Private Function retornaDescricaoSituacaoFLR(e_sit_cfc_eln As Integer) As String
        '*****************************************************************
        'Inicializa a  função
        '*****************************************************************
        retornaDescricaoSituacaoFLR = ""
        '*****************************************************************
        'Retorna a descrição de acordo com  o código de situação informado
        '*****************************************************************
        If e_sit_cfc_eln = 0 Then
            retornaDescricaoSituacaoFLR = "PENDENTE DE ASSINATURA DO CLIENTE"
            Exit Function
        End If
        If e_sit_cfc_eln = 1 Then
            retornaDescricaoSituacaoFLR = "APROVADA PELO CLIENTE"
            Exit Function
        End If
        If e_sit_cfc_eln = 2 Then
            retornaDescricaoSituacaoFLR = "APROVADA PELO OPERACIONAL"
            Exit Function
        End If
        If e_sit_cfc_eln = 3 Then
            retornaDescricaoSituacaoFLR = "RECUSADA PELO CLIENTE"
            Exit Function
        End If
        If e_sit_cfc_eln = 4 Then
            retornaDescricaoSituacaoFLR = "RECUSADA AUTOMATICAMENTE"
            Exit Function
        End If
        '*****************************************************************
        'Processamento realizado com sucesso. Finaliza funcionalidade
        '*****************************************************************
        Exit Function
End Function
Private Function retornaDescricaoTipoFormalizacao(e_tipo_formalizacao As String, n_cee_etd As String) As String
        '*****************************************************************
        'Inicializa a  função
        '*****************************************************************
        retornaDescricaoTipoFormalizacao = ""
        e_tipo_formalizacao = Trim(UCase(e_tipo_formalizacao))
        '*****************************************************************
        'Retorna a descrição do tipo de formalização de acordo
        'com o tipo de formalização informado.
        '*****************************************************************
        If e_tipo_formalizacao = "S" Then
            retornaDescricaoTipoFormalizacao = "Eletrônica PIN sem cartão"
            Exit Function
        ElseIf e_tipo_formalizacao = "C" Then
            retornaDescricaoTipoFormalizacao = "Eletrônica PIN com cartão"
            Exit Function
        ElseIf e_tipo_formalizacao = "B" Then
            retornaDescricaoTipoFormalizacao = "Remota (" & n_cee_etd & ")"
            Exit Function
        Else
            retornaDescricaoTipoFormalizacao = "Manual"
            Exit Function
        End If
        '*****************************************************************
        'Processamento realizado com sucesso. Finaliza funcionalidade
        '*****************************************************************
        Exit Function
End Function

