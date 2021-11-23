VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Object = "{B6AE6BAA-DF9C-4C9F-980D-9874D6C3200B}#1.0#0"; "IX2CGFTP001.OCX"
Begin VB.Form R1FAB005 
   Appearance      =   0  'Flat
   Caption         =   "Consulta à Apolice - Dados Complementares da Apólice"
   ClientHeight    =   6315
   ClientLeft      =   5415
   ClientTop       =   2355
   ClientWidth     =   8460
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
   Icon            =   "R1FAB005.frx":0000
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   6315
   ScaleWidth      =   8460
   Visible         =   0   'False
   Begin IX2CGFTP001.itauFTP itauFTP1 
      Left            =   1410
      Top             =   90
      _ExtentX        =   926
      _ExtentY        =   926
   End
   Begin Threed.SSPanel PA3D_Topo 
      Align           =   1  'Align Top
      Height          =   735
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8460
      _Version        =   65536
      _ExtentX        =   14922
      _ExtentY        =   1288
      _StockProps     =   15
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
      Begin Threed.SSCommand bu3d_txt 
         Height          =   600
         Left            =   4980
         TabIndex        =   16
         Tag             =   "consulta"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB005.frx":030A
      End
      Begin Threed.SSCommand bu3d_imp_tla 
         Height          =   600
         Left            =   7080
         TabIndex        =   3
         Tag             =   "consulta"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB005.frx":0624
      End
      Begin Threed.SSCommand bu3d_Volta 
         Height          =   600
         Left            =   7710
         TabIndex        =   1
         Tag             =   "sai"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB005.frx":093E
      End
      Begin Threed.SSCommand bu3d_word 
         Height          =   630
         Left            =   3930
         TabIndex        =   26
         ToolTipText     =   "Consultar especificação da apólice/aditamento"
         Top             =   30
         Width           =   630
         _Version        =   65536
         _ExtentX        =   1111
         _ExtentY        =   1111
         _StockProps     =   78
         AutoSize        =   2
         MouseIcon       =   "R1FAB005.frx":0C58
         Picture         =   "R1FAB005.frx":0F72
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB005.frx":1069
         Top             =   90
         Width           =   1365
      End
   End
   Begin Threed.SSPanel pa3d_status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   2
      Top             =   5970
      Width           =   8460
      _Version        =   65536
      _ExtentX        =   14923
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB005"
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
   Begin Threed.SSFrame fr_txt_apo 
      Height          =   2760
      Left            =   240
      TabIndex        =   13
      Top             =   1850
      Width           =   7935
      _Version        =   65536
      _ExtentX        =   13996
      _ExtentY        =   4868
      _StockProps     =   14
      Caption         =   "Texto"
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
      Begin VB.TextBox tb_t_apo 
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
         Height          =   2355
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   14
         Top             =   285
         Width           =   7710
      End
   End
   Begin Threed.SSFrame fr3d_t_apo 
      Height          =   5205
      Left            =   120
      TabIndex        =   4
      Top             =   720
      Width           =   8190
      _Version        =   65536
      _ExtentX        =   14446
      _ExtentY        =   9181
      _StockProps     =   14
      Caption         =   "Texto da Apólice"
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
      Begin VB.ComboBox cb_isg 
         Appearance      =   0  'Flat
         ForeColor       =   &H00800000&
         Height          =   315
         Left            =   195
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   1485
         Width           =   7860
      End
      Begin VB.ComboBox cb_txt_apo 
         Appearance      =   0  'Flat
         ForeColor       =   &H00800000&
         Height          =   315
         Left            =   180
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   2190
         Width           =   3615
      End
      Begin VB.Frame fr_ctl_doc 
         Caption         =   "Controle de Documento"
         ForeColor       =   &H00800000&
         Height          =   1170
         Left            =   120
         TabIndex        =   17
         Top             =   3960
         Width           =   7935
         Begin VB.Label lb_t_esf_mot 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            ForeColor       =   &H80000002&
            Height          =   255
            Left            =   1900
            TabIndex        =   25
            Top             =   285
            Width           =   5850
         End
         Begin VB.Label lb_esf_mot 
            Caption         =   "Especificação:"
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   270
            TabIndex        =   24
            Top             =   285
            Width           =   1530
         End
         Begin VB.Label lb_situacao 
            Caption         =   "Situação:"
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   270
            TabIndex        =   23
            Top             =   550
            Width           =   1530
         End
         Begin VB.Label lb_data 
            Caption         =   "Data:"
            ForeColor       =   &H00800000&
            Height          =   210
            Left            =   270
            TabIndex        =   22
            Top             =   820
            Width           =   1485
         End
         Begin VB.Label lb_responsavel 
            Caption         =   "Responsável:"
            ForeColor       =   &H00800000&
            Height          =   225
            Left            =   4770
            TabIndex        =   21
            Top             =   820
            Width           =   1215
         End
         Begin VB.Label lb_sit_ctl_ppl 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            ForeColor       =   &H80000002&
            Height          =   255
            Left            =   1900
            TabIndex        =   20
            Top             =   550
            Width           =   5850
         End
         Begin VB.Label lb_d_atu_ctl_ppl 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            ForeColor       =   &H80000002&
            Height          =   255
            Left            =   1900
            TabIndex        =   19
            Top             =   820
            Width           =   2730
         End
         Begin VB.Label lb_usr_ctl_ppl 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            ForeColor       =   &H80000002&
            Height          =   255
            Left            =   5985
            TabIndex        =   18
            Top             =   820
            Width           =   1770
         End
      End
      Begin VB.Label lb_txt_apo 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Texto"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   240
         TabIndex        =   15
         Top             =   3120
         Width           =   495
      End
      Begin VB.Label label2 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Segurado"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   195
         TabIndex        =   12
         Top             =   390
         Width           =   825
      End
      Begin VB.Label lb_segurado 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   1260
         TabIndex        =   11
         Top             =   360
         Width           =   6750
      End
      Begin VB.Label label1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Nº Apólice "
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   10
         Top             =   825
         Width           =   975
      End
      Begin VB.Label lb_nro_apolice 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   1260
         TabIndex        =   9
         Top             =   795
         Width           =   6765
      End
      Begin VB.Label lb_e_txt_apo 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Tipos de Texto"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   180
         TabIndex        =   8
         Top             =   1950
         Width           =   1290
      End
      Begin VB.Label lb_isg 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         Caption         =   "Apólice e Item Segurado"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   210
         TabIndex        =   7
         Top             =   1245
         Width           =   2100
      End
   End
End
Attribute VB_Name = "R1FAB005"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ************************** Texto da Apólice **************************

Option Explicit

Dim e_txt_apo        As Integer      ' tipo de texto da apólice

Private Sub bu3d_imp_tla_Click()

    ' impressão de tela
    su_imp_tla

End Sub

Private Sub bu3d_imp_tla_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB005 - Impressão de tela"

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
'        ret% = FU_Monitora_Exec(Me, "R1PTX001.EXE ")
'    Else
'        ret% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + "R1PTX001.EXE ", MinEnableFalse%)
'    End If
    Ret% = FU_MonitoraExe(Me, "", "R1PTX001.EXE", "", , MinEnableFalse%)
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'v60 Emilio 22/08/2006 - fim
    
    If Not Ret% Then
        Screen.MousePointer = DEFAULT
        MsgBox "Não foi possível executar o projeto" & Chr(13) & "R1PTXT01 - PROJETO DO TEXTO", 48
        SqlConn% = FU_Conecta_Servidor(Servidor_Id%)
        Exit Sub
    End If

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

    R1FAB005.Show

End Sub

Private Sub bu3d_txt_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB005 - Consulta texto da apólice/aditamento"

End Sub

Private Sub BU3D_Volta_Click()
    
    'v57 Emilio 06/07/2006 - início
    If Not FU_TRATA_DIRETORIO("DELETAR", n_dir_tmp) Then
        MsgBox msgerro & vbCrLf & vbCrLf & "Por favor contacte o analista responsável pelo sistema.", _
               MB_ICONSTOP, "R1FAB005 - Erro ao consultar a especificação da apólice/aditamento"
    End If
    'v57 Emilio 06/07/2006 - fim
    
    ' retorno à 2a. tela
    volta% = True

    R1FAB002.Show
    
    Me.Hide

End Sub

Private Sub bu3d_Volta_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB005 - Retorna à tela anterior"

End Sub

Private Sub cb_isg_Click()
        
    Dim i       As Integer    'contador para o combo de tipo de textos
    Dim j       As Integer    'percorre array de textos
    Dim Texto   As String     'armazena texto dos itens do combo
    Dim found   As Integer    'indica se existe ou não um determinado tipo de texto no array
    Dim combo_vazio As Integer 'indica se o combo com tipo de texto está vazio ou não
    'STJ
    'Contador para o combo Tipos de texto (form R1FAB0005)
    Dim c       As Integer
    ' indica se existe ou não um determinado tipo de texto no acombo
    Dim found2   As Integer
    '***

    cb_txt_apo.Clear
    
    combo_vazio% = True
    
    If cb_isg.ListIndex <> -1 Then
        ' altera cor do label
        'lb_e_txt_apo.Enabled = False
        cb_txt_apo.Enabled = False
        
        ' altera cor do label
        'lb_txt_apo.Enabled = False
        tb_t_apo.Text = ""

        c_isg$ = cb_isg.ItemData(cb_isg.ListIndex)

        cb_txt_apo.Clear

        'STJ
        If Val(c_agr_fam_pro$) = 9 Then
            su_fecha_conexao
            SqlConn% = FU_Conecta_Servidor(SERV_MANUAPO_ID)

            For j% = 0 To UBound(dad_t_lin_txt)
                found2% = False
                
                For c% = 0 To R1FAB005.cb_txt_apo.ListCount - 1
                    If R1FAB005.cb_txt_apo.ItemData(c%) = dad_t_lin_txt(j%).e_txt_apo Then found2% = True
                Next c%

                If found2% = False Then
                    e_asu% = dad_t_lin_txt(j%).e_txt_apo
                    
                    If Not fu_sel_asu() Then Exit Sub
                    
                    combo_vazio% = False
                End If

            Next j%

            su_fecha_conexao
            
            SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
        Else
        '***
            ' preenche combo com tipos de textos
            For i% = 1 To 10
                found% = False
                
                For j% = 0 To UBound(dad_t_lin_txt)
                    
                    If Val(dad_t_lin_txt(j%).c_isg) = Val(c_isg$) Then
                        
                        '10/06/1998
            '            If Val(dad_t_lin_txt(j%).u_adi) = Val(u_adi$) Then
                            
                            If dad_t_lin_txt(j%).U_OCR_CLA = 0 Then
                                
                                'STJ
                                If dad_t_lin_txt(j%).e_txt_apo = i% Or Val(c_agr_fam_pro$) = 9 Then
                                '***
                                    found% = True
                                    Exit For
                                End If
                            
                            End If
             
             '           End If
                   
                   End If
               
               Next j%


               ' serão incluídos no combo somente os textos cadastrados
               If found% Then
                   Select Case i%
                       
                       Case 1
                           Texto$ = "Condições Especiais"
                       
                       Case 2
                           Texto$ = "Condições Particulares"
                       
                       Case 3
                           Texto$ = "Objetos da Cláusula de Beneficiário"
                       
                       Case 4
                           Texto$ = "Franquia"
                       
                       Case 5
                           Texto$ = "Objeto Segurado"
                       
                       Case 6
                           Texto$ = "Outros Seguros"
                       
                       'Luciane - 10/09/1997
                       Case 7
                           Texto$ = "Cláusula"
                       
                       Case 8
                           Texto$ = "Aditamento"
                       
                       Case 9
                           Texto$ = "Apólice"
                       
                       Case 10
                           Texto$ = "Comentários"
                   
                   End Select
                   
                   R1FAB005.cb_txt_apo.AddItem Texto$
                   R1FAB005.cb_txt_apo.ItemData(R1FAB005.cb_txt_apo.NewIndex) = i%
                   combo_vazio% = False
               
               End If
               
           Next i%
        
        End If

        If combo_vazio% Then
            Screen.MousePointer = DEFAULT
            
            If Val(c_isg$) <> 0 Then
                MsgBox "Item Segurado não possui Textos.", MB_ICONINFORMATION, txt_msg$
            Else
                MsgBox "Apólice não possui Textos.", MB_ICONINFORMATION, txt_msg$
            End If
            
            Exit Sub
        Else
            lb_e_txt_apo.Enabled = True
            cb_txt_apo.Enabled = True
            cb_txt_apo.SetFocus
        End If
    
    End If

End Sub

Private Sub cb_txt_apo_Click()
    
    ' contador para o array de textos da apólice (dad_t_lin_txt)
    Dim i       As Integer
    Dim Texto   As String

    ' limpa textbox
    tb_t_apo.Text = ""

    ' se for escolhido um item no combo
    If cb_txt_apo.ListIndex <> -1 Then
        
        ' verifica se existe texto para o aditamento escolhido
        If existe_dad_t_lin_txt% Then
            
            For i% = 0 To UBound(dad_t_lin_txt)
                '18/06/1998
                
                If dad_t_lin_txt(i%).u_adi = u_adi$ Then
                    
                    ' verifica tipo do texto
                    If dad_t_lin_txt(i%).e_txt_apo = cb_txt_apo.ItemData(cb_txt_apo.ListIndex) Then
                        e_txt_apo% = dad_t_lin_txt(i%).e_txt_apo
                        '' preenche com texto da apólice
                        'su_preenche_texto
                        Texto$ = Texto$ & dad_t_lin_txt(i%).t_lin_txt
                        ' altera cor do label
                        lb_txt_apo.Enabled = True
                    End If
                
                End If
            
            Next i%

            If Texto$ <> "" Then
                ' preenche com texto da apólice
                'su_preenche_texto texto$
                'STJ
                If Val(c_agr_fam_pro$) = 9 Then
                  tb_t_apo.FontSize = 7.5
                Else
                  tb_t_apo.FontSize = 8.25
                End If
                '***
                tb_t_apo.Text = Texto$
            Else
                'v56 Emilio 03/07/2006 - início
                If Val(c_isg$) <> 0 Then
                    MsgBox "Item Segurado não possui Textos.", MB_ICONINFORMATION, txt_msg$ & " - Aditamento: " & u_adi
                Else
                    MsgBox "Apólice não possui Textos.", MB_ICONINFORMATION, txt_msg$ & " - Aditamento: " & u_adi
                End If
                'v56 Emilio 03/07/2006 - fim
            End If

        End If

    End If

End Sub

Private Sub Form_Activate()

' armazena a posicao do aditamento no array dad_adi
Dim POS     As Integer
Dim i       As Integer
Dim j       As Integer
Dim found   As Integer
Dim Texto   As String
Dim c_sit_ctl_ppl As String     'Código da situação controle papel - Gabriela - 17/07/2001
Dim n_sit_ctl_ppl As String     'Descrição da situação controle papel - Gabriela - 17/07/2001
Dim t_esf_mot_aux   As String   ' cris - 04/01/2002 - conforme Lucia

    lb_segurado.Caption = n_pes$
    lb_nro_apolice.Caption = c_cia_ita$ & "." & Format$(c_rmo$, "00") & "." & _
                Format(u_apo_pnc$, "000000000") & "." & _
                Format$(u_apo_dpd$, "0000000") & "/" & _
                Format$(u_adi$, "000")      '   PauloFLopes     29/10/2007

    'Saúde
    If Val(c_agr_fam_pro$) = 2 Then
        tb_t_apo.Text = ""
        lb_isg.Visible = False
        cb_isg.Visible = False
        cb_isg.ListIndex = -1

        lb_e_txt_apo.Visible = True
        cb_txt_apo.Clear
        cb_txt_apo.Visible = True
        cb_txt_apo.ListIndex = -1
        
        ' preenche combo com tipos de textos
        For i% = 1 To 10
            found% = False

            For j% = 0 To UBound(dad_t_lin_txt)
                '10/06/1998
                If Val(dad_t_lin_txt(j%).u_adi) = Val(u_adi$) Then
                    If Val(dad_t_lin_txt(j%).U_VRS_ADI) = Val(U_VRS_ADI$) Then
                        'STJ
                        If dad_t_lin_txt(j%).e_txt_apo = i% Or Val(c_agr_fam_pro$) = 9 Then
                            found% = True
                            Exit For
                        End If
                    End If
                End If
            Next j%

            ' serão incluídos no combo somente os textos cadastrados
            If found% Then
                
                Select Case i%
                    
                    Case 1
                        Texto$ = "Condições Especiais"
                    
                    Case 2
                        Texto$ = "Condições Particulares"
                    
                    Case 3
                        Texto$ = "Objetos da Cláusula de Beneficiário"
                    
                    Case 4
                        Texto$ = "Franquia"
                    
                    Case 5
                        Texto$ = "Objeto Segurado"
                    
                    Case 6
                        Texto$ = "Outros Seguros"
                    
                    'Luciane - 10/09/1997
                    Case 7
                        Texto$ = "Cláusula"
                    
                    Case 8
                        Texto$ = "Aditamento"
                    
                    Case 9
                        Texto$ = "Apólice"
                    
                    Case 10
                        Texto$ = "Comentários"
                
                End Select
                
                cb_txt_apo.AddItem Texto$
                cb_txt_apo.ItemData(R1FAB005.cb_txt_apo.NewIndex) = i%
                'combo_vazio% = False
            End If
            
        Next i%

    ' Apólice Diferenciado
    'ElseIf Val(c_agr_fam_pro$) = 5 Or Val(c_agr_fam_pro$) = 6 Or Val(c_agr_fam_pro$) = 9 Then
    ' mostrar o texto da tb_adi - diferenciado
    ElseIf Val(c_agr_fam_pro$) = 9 Then
        R1FAB005.cb_isg.Clear
        
        su_insere_clausula R1FAB005.cb_isg, "R1FAB005"
        cb_isg.ListIndex = -1
        cb_txt_apo.Visible = True
        
        ' desabilita combo com tipos de texto
        cb_txt_apo.ListIndex = -1
        cb_txt_apo.Enabled = False
        
        lb_isg.Visible = True
        cb_isg.Visible = True
        lb_e_txt_apo.Visible = True
    Else
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
    
        If R1FAB002.cb_u_adi.ListIndex = 0 Then
            POS% = UBound(dad_adi)
            R1FAB005.tb_t_apo.Text = dad_adi(POS%).t_adi
        Else
            
            If R1FAB002.cb_u_adi.ListIndex <> -1 Then
                POS% = R1FAB002.cb_u_adi.ListIndex - 1
            End If
            
            R1FAB005.tb_t_apo.Text = dad_adi(POS%).t_adi
        End If
        
        cb_txt_apo.Visible = False
        
        'Ini Gabriela - 17/07/2001 - novo frame de controle de documento (somente Massa)
        c_sit_ctl_ppl = dad_adi(POS%).c_sit_ctl_ppl
        If Trim$(c_sit_ctl_ppl) = "1" Then
            n_sit_ctl_ppl = "Papel não Recepcionado"
        ElseIf Trim$(c_sit_ctl_ppl) = "2" Then
            n_sit_ctl_ppl = "Papel Recepcionado"
        ElseIf Trim$(c_sit_ctl_ppl) = "3" Then
            n_sit_ctl_ppl = "Dispensa Automatica Sistema"
        ElseIf Trim$(c_sit_ctl_ppl) = "4" Then
            n_sit_ctl_ppl = "Dispensa Automatica Canal de Vendas"
        ElseIf Trim$(c_sit_ctl_ppl) = "5" Then
            n_sit_ctl_ppl = "Papel Recepcionado com Alt.Análise de Risco"
        'Adriana - 19/10/2001 - Início
        ElseIf Trim$(c_sit_ctl_ppl) = "6" Then
            n_sit_ctl_ppl = "Papel Recepcionado com irregularidade"
        'Adriana - 19/10/2001 - Fim
        
        ElseIf Trim$(c_sit_ctl_ppl) = "7" Then
            n_sit_ctl_ppl = "Dispensa Automatica Banco - Papel não Recepcionado"
        ElseIf Trim$(c_sit_ctl_ppl) = "8" Then
            n_sit_ctl_ppl = "Dispensa Autom. Banco - Papel Recepcionado com Irregularidade"
        End If

        ' cris - 04/01/2002 - conforme Lucia - inicio
        t_esf_mot_aux$ = ""
        For i% = 0 To UBound(dad_isg)
            If Val(dad_isg(i%).u_adi) = Val(dad_adi(POS%).u_adi) Then
                t_esf_mot_aux$ = IIf((dad_isg(i%).c_esf_mot) <> 0, dad_isg(i%).t_esf_mot, "")
                Exit For
            End If
        Next i%
        lb_esf_mot.Visible = True
        lb_t_esf_mot.Visible = True
        lb_t_esf_mot.Caption = UCase$(t_esf_mot_aux$)
        ' cris - 04/01/2002 - conforme Lucia - fim
        
        'Adriana - 12/10/2001 - Controle de Papel - Início
        If dad_adi(POS%).c_sit_ctl_ppl = "" Or dad_adi(POS%).c_sit_ctl_ppl = "0" Then
            lb_sit_ctl_ppl.Caption = "INEXISTENTE"
            lb_Data.Visible = False
            lb_responsavel.Visible = False
            lb_d_atu_ctl_ppl.Visible = False
            lb_usr_ctl_ppl.Visible = False
        ElseIf dad_adi(POS%).c_sit_ctl_ppl = "1" Then
            lb_sit_ctl_ppl.Caption = Trim(n_sit_ctl_ppl)
            lb_Data.Visible = False
            lb_d_atu_ctl_ppl.Visible = False
            lb_usr_ctl_ppl.Visible = False
            lb_responsavel.Visible = False
        Else
            lb_Data.Visible = True
            lb_d_atu_ctl_ppl.Visible = True
            lb_usr_ctl_ppl.Visible = True
            lb_responsavel.Visible = True
            lb_sit_ctl_ppl.Caption = Trim(n_sit_ctl_ppl)
            lb_d_atu_ctl_ppl.Caption = dad_adi(POS%).d_atu_ctl_ppl
            lb_usr_ctl_ppl.Caption = dad_adi(POS%).n_usr_ctl_ppl
        End If
        'Adriana - 12/10/2001 - Controle de Papel - Fim
        
        'Fim Gabriela - 17/07/2001
        
        If Val(c_agr_fam_pro$) = 5 Or Val(c_agr_fam_pro$) = 6 Then
            fr_ctl_doc.Visible = False
        End If
        
    End If

    Show

    SU_Ajusta_Form Me, 4
    
    Screen.MousePointer = DEFAULT
    
End Sub

Private Sub Form_DblClick()
    
    MsgBox sg_versao$, MB_ICONINFORMATION, "VERSÃO"

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
        
        If bu3d_volta.Enabled = True Then
            BU3D_Volta_Click
        Else
            Cancel = True
        End If

    End If

End Sub

Private Sub fr3d_t_apo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB005 - Texto da Apólice/Item Segurado"

End Sub

Private Sub lb_e_txt_apo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB005 - Tipo de Texto"

End Sub

Private Sub lb_isg_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB005 - Item Segurado"

End Sub

Private Sub lb_txt_apo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB005 - Texto da Apólice/Item Segurado"

End Sub

Private Sub tb_t_apo_KeyPress(KeyAscii As Integer)

   KeyAscii = 0

End Sub

Private Sub tb_t_apo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    pa3d_status.Caption = "R1FAB005 - Texto da Apólice/Item Segurado"

End Sub

Private Sub bu3d_word_Click()

'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
' Autor     : Emilio Lacerda Conde
' Data      : 29/06/2006
' SSI       : EV05/6124 - Solução Word - Diferenciado Transportes
' Objetivo  : Consultar o arquivo de especificação da apólice/aditamento.
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

    On Error GoTo Trata_Erro
    
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    '                           DOMÍNIOS
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    'TB_AGR_PRO.c_agr (where c_e_agr = 1 -> IMPRESSÃO PÓS-VENDA)
    '   230 = TRANSPORTES
    '   240 = DE - DIFERENCIADO ESPECIAL
    '
    'E_EMI_PPL - tipo de emissão de papel
    '   5  = ESPEC.PRÓPRIA,FRONT,ANEXOS E N.S
    
'    If c_agr_imp <> 230 And c_agr_imp <> 240 Then
'        MsgBox "A consulta de arquivo de especificação está liberada somente para" & vbCrLf & vbCrLf & _
'               "Impressão Pós-Venda: DIFERENCIADO ESPECIAL e TRANSPORTES" & vbCrLf & vbCrLf & _
'               "Em caso de dúvidas, entrar com o responsável pelo produto.", _
'               MB_ICONEXCLAMATION, "R1FAB005 - Consulta Restrita": Exit Sub
'    End If
    
    If e_emi_ppl <> 5 Then
        MsgBox "Apólice não possui arquivo de especificação da apólice/aditamento anexado.", _
                MB_ICONEXCLAMATION, "R1FAB005 - Consulta do Arquivo de Especificação": Exit Sub
    End If
    
    'v60 Emilio 22/08/2006 - início
    If Not FU_PR_ADI_RDF_S16022() Then MsgBox msgerro, MB_ICONSTOP, "R1FAB005 - Busca do nome do arquivo de especificação"
        
    If e_emi_ppl = 5 And n_arq_esf_apo = "" Then
        MsgBox "Não foi anexado nenhum arquivo de especificação para esta apólice/aditamento.", MB_ICONEXCLAMATION, _
               "R1FAB005 - Consistência do arquivo de especificação anexo": Exit Sub
    End If
    'v60 Emilio 22/08/2006 - fim
    
    'v57 Emilio 06/07/2006 - início
    If d_icl_adi = Date Then
        MsgBox "ATENÇÃO ! A consulta da especificação da apólice/aditamento" & vbCrLf & _
               "estará disponível 1 dia após sua data de emissão " & d_icl_adi & ".", MB_ICONEXCLAMATION, _
               "R1FAB005 - Consulta do Arquivo de Especificação": Exit Sub
    End If
    'v57 Emilio 06/07/2006 - fim
    
    Screen.MousePointer = HOURGLASS
    
    'Inicia variáveis
    msgerro = ""
    i_conexao = False   'v57 Emilio 06/07/2006
    R1FAB005.Enabled = False
    n_dir_tmp = Environ("TEMP") & "\R1FAB005\"
    'v60 Emilio 22/08/2006 - início
'    n_arq_esf_apo = c_cia_ita & "-" & c_rmo & "-" & u_apo_pnc & "-" & _
'                u_apo_dpd & "-" & Trim(Str(U_ADI)) & "-" & Trim(Str(U_VRS_ADI)) & ".doc"
    n_arq_esf_apo = Trim(Str(c_cia_ita)) & "-" & Trim(Str(c_rmo)) & "-" & _
                    Trim(Str(u_apo_pnc)) & "-" & Trim(Str(u_apo_dpd)) & "-" & _
                    Trim(Str(u_adi)) & "-" & Trim(Str(U_VRS_ADI)) & ".doc"
    'v60 Emilio 22/08/2006 - fim
    
    If Not FU_TRATA_DIRETORIO("CRIAR", n_dir_tmp) Then GoTo Trata_Erro
    
    'If Not FU_TRATA_CONEXAO_CM84("CONECTAR") Then GoTo Trata_Erro
    If Not FU_Traz_Arquivo_CM84(n_dir_tmp) Then GoTo Trata_Erro
    
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    ' Esta função é usada somente para os usuários que não
    ' possuem Content Manager, ou seja, que tem Windows95.
    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    If Not FU_Form_Esp_Underwriter() Then GoTo Trata_Erro   'Exporta arquivo do Servidor INTRA01FTP
    
    'If Not FU_TRATA_CONEXAO_CM84("DESCONECTAR") Then GoTo Trata_Erro

'v57 Emilio 06/07/2006 - início
'    If Not FU_TRATA_WORD("GERAR") Then GoTo Trata_Erro
'
'Fim:
'    If Not FU_TRATA_WORD("DESTRUIR") Then GoTo Trata_Erro
'    If Not FU_TRATA_DIRETORIO("DELETAR", n_dir_tmp) Then GoTo Trata_Erro
    
    Set objControlWord = New ControlWord
    
    If Not objControlWord.FU_INICIA_WD() Then GoTo Trata_Erro
'v57 Emilio 06/07/2006 - fim

    Screen.MousePointer = DEFAULT
    
    Exit Sub
    
Trata_Erro:
    
    Screen.MousePointer = DEFAULT
    
    If Err.Number <> 0 Then msgerro = "Erro VB: " & Trim(Str(Err.Number)) & " - " & Err.Description
    
    MsgBox msgerro & vbCrLf & vbCrLf & "Por favor contacte o analista responsável pelo sistema.", _
           MB_ICONSTOP, "R1FAB005 - Erro ao consultar a especificação da apólice/aditamento"
    
    'If Not FU_TRATA_CONEXAO_CM84("DESCONECTAR") Then GoTo Trata_Erro
    
    'v57 Emilio 06/07/2006 - início
    'GoTo Fim
    R1FAB005.Enabled = True
    Exit Sub
    'v57 Emilio 06/07/2006 - fim
    
End Sub

Private Sub bu3d_word_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    pa3d_status.Caption = "R1FAB005 - Consulta Arquivo de Especificação da Apólice/Aditamento"  'v56 Emilio 29/06/2006

End Sub


