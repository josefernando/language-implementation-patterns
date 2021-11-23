VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Object = "{A8B3B723-0B5A-101B-B22E-00AA0037B2FC}#1.0#0"; "GRID32.OCX"
Begin VB.Form R1FAB004 
   Appearance      =   0  'Flat
   Caption         =   "Cláusulas"
   ClientHeight    =   6300
   ClientLeft      =   465
   ClientTop       =   2055
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
   ForeColor       =   &H00000000&
   Icon            =   "R1FAB004.frx":0000
   LinkTopic       =   "Form2"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6300
   ScaleMode       =   0  'User
   ScaleWidth      =   8580
   Tag             =   "0"
   Begin Threed.SSPanel pa3d_status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   11
      Top             =   5955
      Width           =   8580
      _Version        =   65536
      _ExtentX        =   15134
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB004"
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
      BevelInner      =   1
      Alignment       =   1
   End
   Begin Threed.SSPanel PA3D_Topo 
      Align           =   1  'Align Top
      Height          =   730
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8580
      _Version        =   65536
      _ExtentX        =   15134
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
      Alignment       =   8
      Begin Threed.SSCommand Bu3D_volta_ini 
         Height          =   600
         Left            =   2130
         TabIndex        =   20
         Tag             =   "Plano"
         Top             =   60
         Visible         =   0   'False
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   8388608
         AutoSize        =   1
         Picture         =   "R1FAB004.frx":030A
      End
      Begin Threed.SSCommand bu3D_avanca 
         Height          =   600
         Left            =   2730
         TabIndex        =   19
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
         Picture         =   "R1FAB004.frx":0624
      End
      Begin Threed.SSCommand bu3d_imp_tla 
         Height          =   600
         Left            =   5500
         TabIndex        =   12
         Tag             =   "consulta"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB004.frx":093E
      End
      Begin Threed.SSCommand BU3D_Volta 
         DragIcon        =   "R1FAB004.frx":0C58
         Height          =   600
         Left            =   7170
         TabIndex        =   1
         Tag             =   "sai"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         AutoSize        =   2
         Picture         =   "R1FAB004.frx":0F62
      End
      Begin Threed.SSCommand BU3D_Cancela 
         Height          =   600
         Left            =   7785
         TabIndex        =   2
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Enabled         =   0   'False
         BevelWidth      =   0
         Picture         =   "R1FAB004.frx":127C
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB004.frx":1596
         Top             =   90
         Width           =   1365
      End
   End
   Begin Threed.SSFrame fr3d_cla_ctd 
      Height          =   5055
      Left            =   120
      TabIndex        =   9
      Tag             =   "0"
      Top             =   780
      Width           =   8295
      _Version        =   65536
      _ExtentX        =   14631
      _ExtentY        =   8916
      _StockProps     =   14
      Caption         =   "Dados de Cláusulas"
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
      Begin Threed.SSCommand bu3d_txt 
         Height          =   840
         Left            =   120
         TabIndex        =   21
         Tag             =   "consulta"
         Top             =   2160
         Visible         =   0   'False
         Width           =   960
         _Version        =   65536
         _ExtentX        =   1693
         _ExtentY        =   1482
         _StockProps     =   78
         Caption         =   "Texto"
         ForeColor       =   -2147483640
         Picture         =   "R1FAB004.frx":1D10
      End
      Begin VB.ComboBox cb_isg 
         Appearance      =   0  'Flat
         ForeColor       =   &H00800000&
         Height          =   300
         Left            =   120
         Style           =   2  'Dropdown List
         TabIndex        =   13
         Top             =   960
         Width           =   8055
      End
      Begin VB.ComboBox cb_bnf 
         Appearance      =   0  'Flat
         ForeColor       =   &H00800000&
         Height          =   300
         Left            =   120
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Top             =   1680
         Visible         =   0   'False
         Width           =   8055
      End
      Begin VB.TextBox tb_cla 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   1150
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   16
         Top             =   2400
         Width           =   7995
      End
      Begin VB.TextBox tb_obj 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   1150
         Left            =   105
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   18
         Top             =   3780
         Width           =   7995
      End
      Begin MSGrid.Grid gr_cla_ctd 
         Height          =   2520
         Left            =   120
         TabIndex        =   10
         Tag             =   "0"
         Top             =   2400
         Visible         =   0   'False
         Width           =   7995
         _Version        =   65536
         _ExtentX        =   14102
         _ExtentY        =   4445
         _StockProps     =   77
         ForeColor       =   8388608
         BackColor       =   16777215
         Cols            =   8
         FixedCols       =   0
         HighLight       =   0   'False
         MouseIcon       =   "R1FAB004.frx":202A
      End
      Begin VB.Label lb_obj 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Objeto"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   120
         TabIndex        =   17
         Top             =   3600
         Visible         =   0   'False
         Width           =   570
      End
      Begin VB.Label lb_bnf 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Beneficiário"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   120
         TabIndex        =   3
         Top             =   1440
         Visible         =   0   'False
         Width           =   1020
      End
      Begin VB.Label lb_isg 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Item Segurado"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   120
         TabIndex        =   14
         Top             =   720
         Width           =   1245
      End
      Begin VB.Label lb_cla 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Claúsulas Contratadas"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   120
         TabIndex        =   4
         Top             =   2160
         Visible         =   0   'False
         Width           =   1905
      End
      Begin VB.Label lb_apo 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   1200
         TabIndex        =   7
         Top             =   345
         Width           =   3645
      End
      Begin VB.Label lb_prp 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Apólice:"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   150
         TabIndex        =   5
         Top             =   345
         Width           =   705
      End
      Begin VB.Label lb_n_pes1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Segurado:"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   150
         TabIndex        =   6
         Top             =   1000
         Visible         =   0   'False
         Width           =   885
      End
      Begin VB.Label lb_n_pes2 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   225
         Left            =   1170
         TabIndex        =   8
         Top             =   1000
         Visible         =   0   'False
         Width           =   5400
      End
   End
End
Attribute VB_Name = "R1FAB004"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ****************************** Cláusulas ******************************

Option Explicit

Dim c_pla_pro   As String
Dim c_gar       As String
Dim c_cla       As String

Private Sub bu3D_avanca_Click()
    
    'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Início
    Screen.MousePointer = HOURGLASS

    SU_Carrega_Grid

    If over_grid% = True Then
       su_atu_botoes_nav
    End If

    Screen.MousePointer = DEFAULT
    'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Fim

End Sub

Private Sub bu3D_avanca_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB004 - Exibe Próximos Itens"

End Sub

Private Sub bu3d_cancela_Click()
    
    cb_isg.ListIndex = -1
    cb_bnf.ListIndex = -1
    cb_isg.SetFocus

    If Val(c_agr_fam_pro$) = 5 Or Val(c_agr_fam_pro$) = 6 Then ' Diferenciado
        lb_bnf.Visible = False
        cb_bnf.Visible = False
        bu3d_txt.Visible = False
    End If

End Sub

Private Sub BU3D_Cancela_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB004 - Cancela operação"

End Sub

Private Sub bu3d_imp_tla_Click()

    ' impressão de tela
    su_imp_tla

End Sub

Private Sub bu3d_imp_tla_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB004 - Impressão de tela"

End Sub

Private Sub bu3d_txt_Click()

    Screen.MousePointer = HOURGLASS
  
    If Not fu_grava_parametro_clausula(c_gar$, c_pla_pro$, c_cla$, Trim(U_OCR_CLA%)) Then
    End If
   
    'Fecha conexão
    su_fecha_conexao
    
    ret% = FU_MonitoraExe(Me, "", "R1PTX001.EXE", "", , MinEnableFalse%)
    
    If Not ret% Then
        Screen.MousePointer = DEFAULT
        MsgBox "Não foi possível executar o projeto" & Chr(13) & "R1PTXT01 - PROJETO DO TEXTO", 48
        SqlConn% = FU_Conecta_Servidor(Servidor_Id%)
        Exit Sub
    End If

    'Estabelecer nova conecção com o servidor
    SqlConn% = FU_Conecta_Servidor(Servidor_Id%)
    
    Screen.MousePointer = DEFAULT

    R1FAB004.Show

End Sub

Private Sub BU3D_Volta_Click()

' linha atual no grid
Dim incl    As Integer

' número de linhas no grid
Dim wlinhas As Integer

    Screen.MousePointer = HOURGLASS

    If gr_cla_ctd.Rows > 2 Then
        ' remove linhas no grid
        wlinhas% = gr_cla_ctd.Rows - 2
        
        ' Mara (Origin) - alteração em 10/09/1998
        ' não estava removendo dados do caregamento anterior no grid
        'For incl% = wlinhas% To 1  'To wLinhas%
        For incl% = wlinhas% To 1 Step -1 'To wLinhas%
            gr_cla_ctd.Row = incl%
            gr_cla_ctd.RemoveItem (incl%)
        Next incl%
        
        gr_cla_ctd.AddItem " "
        gr_cla_ctd.RemoveItem (gr_cla_ctd.Rows - 2)
    Else
        gr_cla_ctd.AddItem " "
        gr_cla_ctd.RemoveItem (gr_cla_ctd.Rows - 2)
    End If
    
    ' retorno p/ a 2a tela
    volta% = True

    R1FAB002.Show
    Me.Hide

    Screen.MousePointer = DEFAULT

End Sub

Private Sub Bu3D_volta_ini_Click()

    'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Início
    Screen.MousePointer = HOURGLASS
    
    qtde_dad_cla_apo = UBound(dad_cla_apo)
    cont% = 0
    
    SU_Carrega_Grid

    su_atu_botoes_nav

    Screen.MousePointer = DEFAULT
    'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Fim

End Sub

Private Sub Bu3D_volta_ini_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
         
         PA3D_Status.Caption = "R1FAB004 - Exibe Itens Anteriores"

End Sub

Private Sub bu3d_Volta_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    PA3D_Status.Caption = "R1FAB004 - Retorna à tela anterior"

End Sub

Private Sub cb_bnf_Click()

Dim i           As Integer

    Screen.MousePointer = HOURGLASS

    If cb_bnf.ListIndex <> -1 Then
        U_OCR_CLA% = cb_bnf.ItemData(cb_bnf.ListIndex)
        
        For i% = 0 To UBound(dad_cla_apo)
            
            If Val(dad_cla_apo(i%).c_isg) = Val(c_isg$) Then
                
                '13/05/1998
                'If Val(dad_cla_apo(i%).u_adi) = Val(u_adi$) Then
                If dad_cla_apo(i%).U_OCR_CLA = U_OCR_CLA% Then
                    c_pro$ = dad_cla_apo(i%).c_pro
                    c_pla_pro$ = dad_cla_apo(i%).c_pla_pro
                    c_gar$ = dad_cla_apo(i%).c_gar
                    c_cla$ = dad_cla_apo(i%).c_cla
                    Exit For
                End If
                'End If
            
            End If

        Next i%

    End If

    tb_obj.Text = ""
    tb_cla.Text = ""

    'Parâmetro 3: Cláusula
    If fu_sel_txt_apo2(U_OCR_CLA%, 3) Then
    End If

    'Parâmetro 7: objeto da cláusula
    If fu_sel_txt_apo2(U_OCR_CLA%, 7) Then
    End If

   
    '15/05/1998
    'If existe_dad_t_lin_txt% Then
    
    '   For i% = 0 To UBound(dad_t_lin_txt)
    
    '      'If Val(dad_t_lin_txt(i%).u_adi) = Val(u_adi$) And Val(dad_t_lin_txt(i%).c_isg) = Val(c_isg$) And Val(dad_t_lin_txt(i%).c_pro) = Val(c_pro$) Then
    
    '      If Val(dad_t_lin_txt(i%).c_isg) = Val(c_isg$) And Val(dad_t_lin_txt(i%).c_pro) = Val(c_pro$) Then
    
    '         If Val(dad_t_lin_txt(i%).c_pla_pro) = Val(c_pla_pro$) And Val(dad_t_lin_txt(i%).c_gar) = Val(c_gar$) And Val(dad_t_lin_txt(i%).c_cla) = Val(c_cla$) Then
    
    '           '13/05/1998
    '            If dad_t_lin_txt(i%).u_ocr_cla = u_ocr_cla% Then 'And Val(u_adi$) >= Val(dad_t_lin_txt(i%).u_adi) Then
    
    '               If dad_t_lin_txt(i%).e_txt_apo = 3 Then
    '                  tb_obj.Text = tb_obj.Text & dad_t_lin_txt(i%).t_lin_txt
    '               ElseIf dad_t_lin_txt(i%).e_txt_apo = 7 Then
    '                  tb_cla.Text = tb_cla.Text & dad_t_lin_txt(i%).t_lin_txt
    '               End If
    
    '            End If
    
    '         End If
    
    '      End If
    
    '   Next i%
    
    'End If

    Screen.MousePointer = DEFAULT

End Sub

Private Sub cb_isg_Click()

    ' contador para array
    Dim i   As Integer

    ' indica se cláusula foi encontrada no array
    Dim found_cla   As Integer
    Dim aux_u_ocr_cla As Integer

    Screen.MousePointer = HOURGLASS

    found_cla% = False
    cb_bnf.ListIndex = -1
    tb_cla.Text = ""
    tb_obj.Text = ""

    If cb_isg.ListIndex <> -1 Then
        c_isg$ = cb_isg.ItemData(cb_isg.ListIndex)
        
        If Val(c_agr_fam_pro$) = 5 Or Val(c_agr_fam_pro$) = 6 Then ' Diferenciado
            lb_bnf.Visible = False
            cb_bnf.Visible = False
            bu3d_txt.Visible = True
        End If
       
        ' verifica se os dados já foram consultados
        'If existe_dad_cla_apo% Then
        
        '    For i% = 0 To UBound(dad_cla_apo)
        
        '        If dad_cla_apo(i%).c_isg = Trim$(c_isg$) Then
        
        '            'If dad_cla_apo(i%).u_adi = Trim$(u_adi$) Then
        '                found_cla% = True
        '            'End If
        
        '        End If
        '
        '    Next i%
        
        'End If
    
        ' cláusula não encontrada
        'If Not found_cla% Then
            ' seleciona cláusula
            If Not fu_sel_ocr_cla_apo() Then
                Screen.MousePointer = DEFAULT
                
                If Val(c_isg$) = 0 Then
                    MsgBox "Aditamento não possui Cláusulas.", , txt_msg$
                Else
                    MsgBox "Item Segurado não possui Cláusulas.", , txt_msg$
                End If
                
                cb_isg.ListIndex = -1
                Exit Sub
            End If
    
            ' seleciona texto da cláusula 15/05/1998
            If Not existe_dad_t_lin_txt% Then
            'For i% = 0 To UBound(dad_cla_apo)
                
                If Not fu_sel_txt_apo() Then
                    Screen.MousePointer = DEFAULT
                    MsgBox "Descrição das Cláusulas não encontrada.", , txt_msg$
                    cb_isg.ListIndex = -1
                    Exit Sub
                End If
            
            'Next i%
            
            End If
        
        'End If
        
        cb_bnf.Clear
            
        ' verifica se os dados já foram consultados
        If existe_dad_cla_apo% Then
            
            For i% = 0 To UBound(dad_cla_apo)
                
                If Val(dad_cla_apo(i%).c_isg) = Val(c_isg$) Then
                    
                    '13/05/1998
                    'If Val(dad_cla_apo(i%).u_adi) = Val(u_adi$) Then
                    If aux_u_ocr_cla <> dad_cla_apo(i%).U_OCR_CLA And Format(dad_cla_apo(i%).d_exc_cla, "dd/mm/yyyy") = "06/06/2079" Then
                        cb_bnf.AddItem dad_cla_apo(i%).n_ptc_cla
                        cb_bnf.ItemData(cb_bnf.NewIndex) = dad_cla_apo(i%).U_OCR_CLA
                    End If
                    
                    aux_u_ocr_cla = dad_cla_apo(i%).U_OCR_CLA
                    
                    'End If

                End If
            
            Next i%
        
        End If
    
        If cb_bnf.ListCount <> 0 Then
            lb_bnf.Visible = True
            cb_bnf.Visible = True
            cb_bnf.ListIndex = 0
            cb_bnf.SetFocus
        End If

        If Not bu3d_cancela.Enabled Then
            bu3d_cancela.Enabled = True
            bu3d_cancela.BevelWidth = 2
        End If

    Else
        
        If bu3d_cancela.Enabled Then
            bu3d_cancela.Enabled = False
            bu3d_cancela.BevelWidth = 0
        End If
        
    End If

    Screen.MousePointer = DEFAULT

End Sub

Private Sub Form_Activate()
    
   Screen.MousePointer = HOURGLASS

   'Ajusta Formulário
   SU_Ajusta_Form Me, 4

   If Val(c_agr_fam_pro$) = 5 Or Val(c_agr_fam_pro$) = 6 Then ' Diferenciado
      lb_isg.Caption = "Apólice e Item Segurado"
      R1FAB004.cb_isg.Clear
      su_insere_clausula R1FAB004.cb_isg, "R1FAB004"
      cb_bnf.Clear
      tb_cla.Text = ""
      tb_obj.Text = ""
      R1FAB004.cb_isg.SetFocus
      lb_cla.Visible = False
      tb_cla.Visible = False
      lb_obj.Visible = False
      tb_obj.Visible = False
   Else
      cb_bnf.Visible = False
      cb_isg.Visible = False
      'carrega grid de cláusulas
      su_car_cab_grid
   End If

   Screen.MousePointer = DEFAULT

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

Private Sub su_atu_botoes_nav()

    'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Início
    'Visualiza Botoes de Navegação (AVANCA)
    If qtde_dad_cla_apo >= max_dad_cla_apo% Or (qtde_dad_cla_apo <> 1 And qtde_dad_cla_apo > 0) Then   'Mara -04/12/1998
        bu3D_avanca.Visible = True
        Bu3D_volta_ini.Visible = False
    Else
        bu3D_avanca.Visible = False
        Bu3D_volta_ini.Visible = True
    End If
    'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Fim

End Sub

Private Sub su_car_cab_grid()


    ' contador para preenchimento do grid
    Dim i           As Integer

    ' texto das colunas do grid
    Dim Text        As String

    ' número de colunas do grid
    Dim colunas     As Integer

    ' largura das colunas
    Dim width_col   As Integer

    gr_cla_ctd.Row = 0
    
    ' Diferenciado
    If Val(c_agr_fam_pro$) = 5 Then
        gr_cla_ctd.Cols = 6
        colunas% = 6
    Else    ' outros (AUTO, VIDA, RPM)
        'gr_cla_ctd.Cols = 7
        'colunas% = 7
        ' Mara (Origin) - 24/08/1998
        gr_cla_ctd.Cols = 8
        colunas% = 8
    End If

    ' preenche 1a. linha do grid (cabeçalho)
    For i% = 0 To colunas% - 1
        
        Select Case i%
            
            Case 0
                Text$ = ""
            
            ' Mara (Origin) - 24/08/1998
            Case 1
                Text$ = "Item"
                width_col% = 550
            
            Case 2
                Text$ = "Adit."
                width_col% = 500
            
            Case 3
                Text$ = "Cláusula"
                width_col% = 3000
            
            Case 4
                Text$ = "Início Vigência"
                width_col% = 1400
            
            Case 5
                Text$ = "Fim Vigência"
                width_col% = 1400
            
            Case 6
                Text$ = "Nome"
                width_col% = 2000
            
            Case 7
                Text$ = "Texto"
                width_col% = 3000
        
        End Select

        ' preenche colunas do grid
        gr_cla_ctd.Col = i%
        gr_cla_ctd.ColAlignment(i%) = 0
        gr_cla_ctd.Text = Text$
        
        ' largura da coluna
        If i% = 0 Then
            width_col% = 1.1
        End If

        ' preenche colunas do grid
        gr_cla_ctd.FixedAlignment(i%) = 0
        gr_cla_ctd.ColWidth(i%) = width_col%

    Next i%

    'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Início
    qtde_dad_cla_apo = UBound(dad_cla_apo) + 1    'Mara - 04/12/1998
    cont% = 0
    
    Bu3D_volta_ini.Visible = False
    Bu3D_volta_ini.Visible = False
    
    bu3D_avanca_Click
    
    ' preenche c/ dados de cláusulas
    'su_carrega_grid
    'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Fim

End Sub

Private Sub SU_Carrega_Grid()
    
    'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Início
    ' contador do array de cláusulas
    Dim i           As Integer
    Dim grid_cla    As Integer
    Dim aux_grid    As Integer
    Dim j           As Integer

    j% = 0

    If qtde_dad_cla_apo = 0 Then
       Exit Sub
    Else
       
       If qtde_dad_cla_apo > max_dad_cla_apo Then
          c_cla_ult = max_dad_cla_apo - 1
          grid_cla% = c_cla_ult + 1
          aux_grid% = cont + (max_dad_cla_apo) - 1
          over_grid% = True
       Else
          grid_cla% = qtde_dad_cla_apo
          aux_grid% = UBound(dad_cla_apo)  'Mara -04/12/1998
          qtde_row_grid% = True
       End If

    End If

    'gr_cla_ctd.Rows = gr_cla_ctd.Rows + UBound(dad_cla_apo)
    gr_cla_ctd.Rows = grid_cla + 1
    
    'For i% = 0 To UBound(dad_cla_apo)
    For i% = cont% To (aux_grid%)
        'gr_cla_ctd.Row = i% + 1
        gr_cla_ctd.Row = j% + 1
        'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Fim

        If Val(c_agr_fam_pro$) <> 5 Then    ' não Diferenciado
            ' Mara (Origin) - 24/08/1998
            ' Número do Item do Aditamento
            gr_cla_ctd.Col = 1
            gr_cla_ctd.Text = Format$(dad_cla_apo(i%).c_isg, "000")
            gr_cla_ctd.RowHeight(gr_cla_ctd.Row) = 950

            ' Número Aditamento
            gr_cla_ctd.Col = 2
            gr_cla_ctd.Text = Format$(dad_cla_apo(i%).U_ADI, "000")
            gr_cla_ctd.RowHeight(gr_cla_ctd.Row) = 950
            
            ' Texto da Cláusula
            gr_cla_ctd.Col = 3
            gr_cla_ctd.Text = dad_cla_apo(i%).t_cla
    
            '  Data Início Vigência
            gr_cla_ctd.Col = 4
            gr_cla_ctd.Text = Trim$(dad_cla_apo(i%).d_ini_niv_cla)
            
            ' Data Fim de Vigência
            gr_cla_ctd.Col = 5
            gr_cla_ctd.Text = Trim$(dad_cla_apo(i%).d_fim_niv_cla)
            
            ' Nome do Participante da Cláusula
            ' se a coluna nome não estiver preenchida, não será necessário mostrá-la
            gr_cla_ctd.Col = 6
            If Trim$(dad_cla_apo(i%).n_ptc_cla) <> "" Then
                'Faz o controle de tamanho da célula atual com a anterior
                'Verifica se texto da célula atual é maior ou menor que a anterior
                'Se o texto da célula atual for maior atualiza o tamanho caso contrário mantem o tamanho da anterior
                gr_cla_ctd.Text = Trim$(dad_cla_apo(i%).n_ptc_cla)
            End If
            
            ' Texto Complementar
            gr_cla_ctd.Col = 7
            gr_cla_ctd.Text = Trim$(dad_cla_apo(i%).t_cpl_cla_niv)
            gr_cla_ctd.ColWidth(gr_cla_ctd.Col) = 6350
        Else
            '  Aditamento
            gr_cla_ctd.Col = 1
            gr_cla_ctd.Text = Format$(dad_cla_apo(i%).U_ADI, "000")
            gr_cla_ctd.RowHeight(gr_cla_ctd.Row) = 950

            ' Texto de Apólice
            gr_cla_ctd.Col = 2
            gr_cla_ctd.Text = dad_cla_apo(i%).t_lin_txt
    
            ' Data Início Vigência
            gr_cla_ctd.Col = 3
            gr_cla_ctd.Text = Trim$(dad_cla_apo(i%).d_ini_niv_cla)
        
            ' Data Fim de Vigência
            gr_cla_ctd.Col = 4
            gr_cla_ctd.Text = Trim$(dad_cla_apo(i%).d_fim_niv_cla)
        
            ' Nome Participante da Cláusula
            ' se a coluna nome não estiver preenchida, não será necessário mostrá-la
            gr_cla_ctd.Col = 5
            If Trim$(dad_cla_apo(i%).n_ptc_cla) <> "" Then
                'Faz o controle de tamanho da célula atual com a anterior
                'Verifica se texto da célula atual é maior ou menor que a anterior
                'Se o texto da célula atual for maior atualiza o tamanho caso contrário mantem o tamanho da anterior
                gr_cla_ctd.Text = Trim$(dad_cla_apo(i%).n_ptc_cla)
            End If
            
        End If
        
        j% = j% + 1
    
    Next i%
    
    'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Início
    qtde_dad_cla_apo = qtde_dad_cla_apo - max_dad_cla_apo
    cont% = cont% + (c_cla_ult + 1)
    'Mara (Origin) - 25/11/1998 - R1PAB020.MAK - Fim
    
End Sub

Private Sub tb_cla_KeyPress(KeyAscii As Integer)

   KeyAscii = 0

End Sub

Private Sub tb_obj_KeyPress(KeyAscii As Integer)

   KeyAscii = 0

End Sub

