VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "THREED32.OCX"
Object = "{A8B3B723-0B5A-101B-B22E-00AA0037B2FC}#1.0#0"; "GRID32.OCX"
Begin VB.Form R1FAB007 
   Appearance      =   0  'Flat
   Caption         =   "Consulta de Itens / Aditamentos"
   ClientHeight    =   5100
   ClientLeft      =   1590
   ClientTop       =   2115
   ClientWidth     =   8085
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
   Icon            =   "R1FAB007.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5100
   ScaleWidth      =   8085
   Tag             =   "R1FAB002"
   Begin Threed.SSPanel PA3D_Topo 
      Align           =   1  'Align Top
      Height          =   730
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8085
      _Version        =   65536
      _ExtentX        =   14261
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
      Begin Threed.SSCommand bu3d_ok 
         Height          =   600
         Left            =   7455
         TabIndex        =   3
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Enabled         =   0   'False
         BevelWidth      =   0
         Picture         =   "R1FAB007.frx":030A
      End
      Begin Threed.SSCommand bu3d_cancela 
         Height          =   600
         Left            =   6840
         TabIndex        =   2
         Tag             =   "Cancela"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB007.frx":0624
      End
      Begin Threed.SSCommand bu3d_volta 
         Height          =   600
         Left            =   6240
         TabIndex        =   1
         Tag             =   "sai"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         Picture         =   "R1FAB007.frx":093E
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB007.frx":0C58
         Top             =   120
         Width           =   1365
      End
   End
   Begin Threed.SSFrame fr3d_seg_apo 
      Height          =   1500
      Left            =   60
      TabIndex        =   5
      Top             =   720
      Width           =   7965
      _Version        =   65536
      _ExtentX        =   14049
      _ExtentY        =   2646
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
      Begin VB.Label lb_item_adi_lb 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Aditamento:"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   3780
         TabIndex        =   25
         Top             =   780
         Visible         =   0   'False
         Width           =   1020
      End
      Begin VB.Label lb_item_adi_label 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   3780
         TabIndex        =   24
         Top             =   990
         Visible         =   0   'False
         Width           =   4005
      End
      Begin VB.Label lb_segurado 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   180
         TabIndex        =   10
         Top             =   405
         Width           =   7620
      End
      Begin VB.Label lb_apolice 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   180
         TabIndex        =   9
         Top             =   990
         Width           =   2655
      End
      Begin VB.Label lb_seg 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Segurado:"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   165
         TabIndex        =   7
         Top             =   180
         Width           =   885
      End
      Begin VB.Label lb_apo 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Apólice:"
         ForeColor       =   &H00800000&
         Height          =   195
         Left            =   165
         TabIndex        =   6
         Top             =   780
         Width           =   705
      End
   End
   Begin Threed.SSPanel pa3d_status 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   4
      Top             =   4755
      Width           =   8085
      _Version        =   65536
      _ExtentX        =   14261
      _ExtentY        =   609
      _StockProps     =   15
      Caption         =   "R1FAB007"
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.26
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
   Begin Threed.SSFrame fr3d_grid 
      Height          =   2355
      Left            =   60
      TabIndex        =   20
      Top             =   2280
      Visible         =   0   'False
      Width           =   7950
      _Version        =   65536
      _ExtentX        =   14023
      _ExtentY        =   4154
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
      Begin MSGrid.Grid gr_item_adi 
         Height          =   2115
         Left            =   90
         TabIndex        =   21
         Top             =   180
         Width           =   7755
         _Version        =   65536
         _ExtentX        =   13679
         _ExtentY        =   3731
         _StockProps     =   77
         ForeColor       =   8388608
         BackColor       =   16777215
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Cols            =   4
         FixedCols       =   0
         MouseIcon       =   "R1FAB007.frx":13D2
      End
   End
   Begin Threed.SSFrame fr3d_opt 
      Height          =   2415
      Left            =   60
      TabIndex        =   8
      Top             =   2280
      Width           =   7950
      _Version        =   65536
      _ExtentX        =   14023
      _ExtentY        =   4260
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
      Begin Threed.SSFrame fr3d_item_adi 
         Height          =   1890
         Left            =   3360
         TabIndex        =   19
         Top             =   240
         Visible         =   0   'False
         Width           =   4215
         _Version        =   65536
         _ExtentX        =   7435
         _ExtentY        =   3334
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
         Begin VB.TextBox tb_item_adi 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            ForeColor       =   &H00800000&
            Height          =   285
            Left            =   900
            MaxLength       =   10
            TabIndex        =   22
            Top             =   495
            Visible         =   0   'False
            Width           =   2500
         End
         Begin VB.ComboBox cb_item_adi 
            Appearance      =   0  'Flat
            ForeColor       =   &H00800000&
            Height          =   315
            Left            =   900
            Style           =   2  'Dropdown List
            TabIndex        =   23
            Top             =   1155
            Visible         =   0   'False
            Width           =   2500
         End
         Begin VB.Label lb_item_adi_txt 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Aditamento: "
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   900
            TabIndex        =   11
            Top             =   240
            Visible         =   0   'False
            Width           =   1080
         End
         Begin VB.Label lb_item_adi_cb 
            Appearance      =   0  'Flat
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Aditamento: "
            ForeColor       =   &H00800000&
            Height          =   195
            Left            =   900
            TabIndex        =   13
            Top             =   900
            Visible         =   0   'False
            Width           =   1080
         End
      End
      Begin Threed.SSFrame fr3d_tipo_pesq 
         Height          =   855
         Left            =   240
         TabIndex        =   16
         Top             =   1260
         Visible         =   0   'False
         Width           =   2895
         _Version        =   65536
         _ExtentX        =   5106
         _ExtentY        =   1508
         _StockProps     =   14
         Caption         =   "Tipo de Pesquisa: "
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
         Begin Threed.SSOption op3d_generico 
            Height          =   495
            Left            =   240
            TabIndex        =   18
            Top             =   240
            Width           =   1095
            _Version        =   65536
            _ExtentX        =   1931
            _ExtentY        =   873
            _StockProps     =   78
            Caption         =   "Genérico"
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
         End
         Begin Threed.SSOption op3d_especifico 
            Height          =   495
            Left            =   1560
            TabIndex        =   17
            Top             =   240
            Width           =   1215
            _Version        =   65536
            _ExtentX        =   2143
            _ExtentY        =   873
            _StockProps     =   78
            Caption         =   "Específico"
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
         End
      End
      Begin Threed.SSFrame fr3d_tipo_consulta 
         Height          =   855
         Left            =   240
         TabIndex        =   12
         Top             =   240
         Width           =   2895
         _Version        =   65536
         _ExtentX        =   5106
         _ExtentY        =   1508
         _StockProps     =   14
         Caption         =   "Consultar por: "
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
         Begin Threed.SSOption op3d_adi 
            Height          =   495
            Left            =   1560
            TabIndex        =   15
            Top             =   240
            Width           =   1215
            _Version        =   65536
            _ExtentX        =   2143
            _ExtentY        =   873
            _StockProps     =   78
            Caption         =   "Aditamento"
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
         End
         Begin Threed.SSOption op3d_item 
            Height          =   495
            Left            =   240
            TabIndex        =   14
            Top             =   240
            Width           =   735
            _Version        =   65536
            _ExtentX        =   1296
            _ExtentY        =   873
            _StockProps     =   78
            Caption         =   "Item"
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
         End
      End
   End
End
Attribute VB_Name = "R1FAB007"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Sub su_monta_grid()

     With gr_item_adi
        .Cols = 6
    
        .Row = 0
    
        .Col = 0: .ColAlignment(0) = 2: .ColWidth(0) = 1100
    
        If flag_item = True Then
            .Text = " Aditamento"
        'Se for escolhido pesquisa por aditamento.
        ElseIf flag_adi = True Then
            .Text = "  Item"
        End If
    
        .Col = 1: .ColWidth(1) = 1400: .Text = " Data Ini.Vig."
        .Col = 2: .ColWidth(2) = 1100: .Text = "    Placa"
        .Col = 3: .ColAlignment(3) = 2: .ColWidth(3) = 2650: .Text = "              Chassis"
        .Col = 4: .ColWidth(4) = 9000: .Text = "        Descrição Motivo - Especificação" 'Lucimara - 22/03/2001
        .Col = 5: .ColWidth(5) = 1: .Text = " C_MOT_ALT"
    End With
End Sub

Function FU_Carrega_Grid()

Dim cont            As Integer
Dim u_chs_aut_gr    As String       'Cláudia    12/11/98
Dim u_plc_aut_gr    As String       'Cláudia    12/11/98

    FU_Carrega_Grid = False
    
    'Daniela - 01/07/98 - Chamada da Proc que faz acesso à tb_his_isg_apo.
    If Not fu_his_isg_apo_s07469(PAR_PESQ&) Then
        MsgBox "Não foi possível acessar dados do Item / Aditamento especificados.", MB_ICONEXCLAMATION
        Exit Function
    End If
    
    If n_linhas_7469$ = "0" Then
        flag_n_linhas = True
        MsgBox "Item / Aditamento não existente para número de Apólice informado.", MB_ICONEXCLAMATION
        Exit Function
    End If

    If fr3d_grid.Visible = False Then
        fr3d_grid.Visible = True
        gr_item_adi.Visible = True
    End If

    If fr3d_opt.Visible = True Then
        fr3d_opt.Visible = False
        cb_item_adi.Clear
        tb_item_adi.Text = ""
    End If

    'Chama sub que monta o grid.
    su_monta_grid

    'Dimensiona as linhas do grid.
    With gr_item_adi
        .Rows = qtde_ite_rec% + 1

    'Carrega o grid de movimentações.
        For cont% = 1 To qtde_ite_rec%
            .Row = cont%
            .Col = 0
            .ColAlignment(0) = 2
            'Se escolhido pesquisa por aditamento.
            If flag_adi = True Then
                .Text = vetor_item(cont%).c_isg$
                'c_isg$ = vetor_item(cont%).c_isg$
            'Se escolhida pesquisa por item.
            ElseIf flag_item = True Then
                .Text = vetor_item(cont%).u_adi$
            End If

            .Col = 1: .ColAlignment(1) = 2: .Text = vetor_item(cont%).d_ini_vig_dad$
            .Col = 2: .ColAlignment(2) = 2: .Text = vetor_item(cont%).u_plc_aut$
            .Col = 3: .ColAlignment(3) = 2: .Text = vetor_item(cont%).u_chs_aut$
            .Col = 4: .ColAlignment(4) = 0: .Text = " " + vetor_item(cont%).t_mot_alt$ + vetor_item(cont%).t_esf_mot   'Lucimara - 22/03/2001
    
            'VERSÃO 54 - INÍCIO
            .Col = 5: .ColAlignment(5) = 0: .Text = vetor_item(cont%).c_mot_alt$
            'VERSÃO 54 - FIM
        Next cont
        
        'Seta o 1o. segurado do grid como default.
        .Row = 1

        If t_mot_alt$ = "" Then
            .Col = 0
            'Se escolhido pesquisa por aditamento.
            If flag_adi = True Then
               u_adi$ = .Text   'Ze mudei de U_ADI para u_adi
            'Se escolhida pesquisa por item.
            ElseIf flag_item = True Then
            '   c_isg$ = .Text
            End If

            .Col = 2
            u_plc_aut_gr$ = vetor_item(qtde_ite_rec%).u_plc_aut       'Cláudia 12/11/98
        
            .Col = 3
            u_chs_aut_gr$ = vetor_item(qtde_ite_rec%).u_chs_aut       'Cláudia 12/11/98
        
            .Col = 4: .ColAlignment(4) = 0
            t_mot_alt$ = .Text

            If flag_adi = True Then
                lb_item_adi_label.Caption = " " & PARAMETRO_PESQUISA$ & " - " & t_mot_alt$
            ElseIf flag_item = True Then
                lb_item_adi_label.Caption = " " & PARAMETRO_PESQUISA$ & " - " & Trim(u_plc_aut_gr$) & " / " & Trim(u_chs_aut_gr$)  'Cláudia 12/11/98
            End If

            t_mot_alt$ = Empty
            t_esf_mot$ = Empty       'Lucimara - 22/03/2001
        
            'VERSÃO 54 - INÍCIO
            .Col = 5
            .ColAlignment(5) = 0
            c_mot_alt_aux$ = Trim(.Text)
            'VERSÃO 54 - FIM
        Else
            lb_item_adi_label.Caption = " " & PARAMETRO_PESQUISA$ & " " & t_mot_alt$
            t_mot_alt$ = Empty
            t_esf_mot$ = Empty     'Lucimara - 22/03/2001
        End If
    End With

    FU_Carrega_Grid = True
End Function

Private Sub bu3d_cancela_Click()

    If gr_item_adi.Visible = True Then
        gr_item_adi.Visible = False
        fr3d_grid.Visible = False
    End If

    If lb_item_adi_lb.Visible = True Then
        lb_item_adi_lb.Visible = False
        lb_item_adi_label.Caption = ""
        lb_item_adi_label.Visible = False
    End If

    If fr3d_opt.Visible = True Then
        fr3d_opt.Enabled = True
    ElseIf fr3d_opt.Visible = False Then
        fr3d_opt.Visible = True
        fr3d_opt.Enabled = True
    End If

    If fr3d_tipo_consulta.Visible = True Then
        fr3d_tipo_consulta.Enabled = True
        op3d_item.Value = False
        op3d_adi.Value = False
        op3d_item.Enabled = True
        op3d_adi.Enabled = True
    End If

    If fr3d_item_adi.Visible = True Then
        
        If tb_item_adi.Visible = True Then
            tb_item_adi.Text = ""
        ElseIf cb_item_adi.Visible = True Then
            cb_item_adi.Clear
        End If

        fr3d_item_adi.Visible = False
    End If

    If fr3d_tipo_pesq.Visible = True Then
        fr3d_tipo_pesq.Visible = False
    End If

    flag_adi = False
    flag_item = False
    
    fr3d_tipo_consulta.Enabled = True
    op3d_item.Enabled = True
    op3d_adi.Enabled = True
    
End Sub

Private Sub bu3d_ok_click()

'Início - 09/12/1998 - r1pab028

'Variáveis para realizar a chamada do projeto de item segurado - Celina
'Nome do executável
Dim sArqExec    As String

'Variáveis utilizadas para obter o cód. do item e adit. corrente
Dim aux1            As String
Dim aux2            As String
Dim AUX_C_MOT_ALT   As String       'VERSÃO 54

    'Término - 09/12/1998 - r1pab028

    Screen.MousePointer = 11

    'Início - 09/12/1998 - r1pab028

    'Verifica se foi escolhido item/adit para preencher o grid
    'de adit/item - Celina
    If Not fr3d_grid.Visible Then
        'Habilita labels no frame principal.
        lb_item_adi_lb.Visible = True
        lb_item_adi_lb.Enabled = True
        lb_item_adi_label.Visible = True
        lb_item_adi_label.Enabled = True
    
        'Se foi escolhido pesquisa por item.
        If op3d_item.Value = True Then
            lb_item_adi_txt.Caption = "Item: "
        'Se for escolhido pesquisa por aditamento.
        ElseIf op3d_adi.Value = True Then
            lb_item_adi_txt.Caption = "Aditamento: "
        End If
    
        'Se text de pesquisa específico estiver visível / habilitado.
        If tb_item_adi.Visible = True Then
            
            If IND_CHAMADA_PLACA_CHASSIS% = True Then
                tb_item_adi.Text = C_ISG_PLACA_CHASSI$
            End If

            'Se text estiver em branco.
             If tb_item_adi.Text = "" Then
                If tb_item_adi.Enabled = True Then
                    tb_item_adi.SetFocus
                End If
                Screen.MousePointer = 0
                Exit Sub
            Else
                'Captura nº do item ou aditamento informado no textbox.
                PAR_PESQ& = CLng(Trim(tb_item_adi.Text))
                PARAMETRO_PESQUISA$ = Trim(tb_item_adi.Text)
                'lb_item_adi_label.Caption = " " & PARAMETRO_PESQUISA$
            End If
        
        'Se combo de pesquisa genérico estiver visível / habilitado.
        ElseIf cb_item_adi.Visible = True Then
            
            'Se combo estiver vazio.
            If cb_item_adi.ListIndex = -1 Then
                If op3d_item.Enabled = True Then
                    op3d_item.SetFocus
                End If
                Screen.MousePointer = 0
                Exit Sub
            Else
                'Captura nº do item ou aditamento informado no combo.
                PARAMETRO_PESQUISA$ = cb_item_adi.Text
                'lb_item_adi_label.Caption = PARAMETRO_PESQUISA$
            End If

        End If
        
        'Se frame consulta visível e opção item.
        If fr3d_tipo_consulta.Visible = True And op3d_item.Value = True Then
            lb_item_adi_lb.Caption = "Item: "
        'Se frame consulta visível e opção aditamento.
        ElseIf fr3d_tipo_consulta.Visible = True And op3d_adi.Value = True Then
            lb_item_adi_lb.Caption = "Aditamento: "
        End If
    
        'Chama proc que busca dados pro grid.
        If Not FU_Carrega_Grid() Then
            
            If flag_n_linhas = False Then
                MsgBox "Não foi possível buscar dados do Item / Aditamento pesquisados.", MB_ICONEXCLAMATION
            End If
            
            'Unload Me
            'R1FAB002.Show
            
            If n_linhas_7469$ = "0" Then
                tb_item_adi.Text = ""
                lb_item_adi_txt.Visible = False
                tb_item_adi.Visible = False
                lb_item_adi_label.Caption = ""
                lb_item_adi_label.Visible = False
                lb_item_adi_lb.Visible = False
                fr3d_item_adi.Visible = False
                op3d_generico.Value = False
                op3d_especifico.Value = False
                fr3d_tipo_pesq.Visible = False
                op3d_item.Value = False
                op3d_adi.Value = False
                fr3d_tipo_consulta.Enabled = True
            End If
            
            flag_adi = False
            flag_item = False
            Screen.MousePointer = 0
            Exit Sub
        End If
            
        'desabilita frame de opção de pesquisa.
        fr3d_opt.Enabled = False
        fr3d_opt.Visible = False
        'habilita frame do grid com os resultados da pesquisa.
        fr3d_grid.Visible = True
        fr3d_grid.Enabled = True
    'Início - 09/12/1998 - r1pab028
    Else
        'Detalha o item segurado escolhido no grid item/adit
        sArqExec$ = "R1PAB101.EXE"
        
        ' seleciona os dados a serem gravados no arquivo
        ' utilizado no acesso do projeto de item segurado
        su_wri_ini DirUser & "ATENDIM.INI", "CONSULTA_APOLICE", "form", "R1FAB101"
    
        'Seta parâmetros com o nome do form da Consulta Item / Adit,
        'cód. do item e nro. do adit. para a aplicação de item segurado
        aux1$ = Trim$(Left(lb_item_adi_label.Caption, InStr(lb_item_adi_label.Caption, "-") - 1))
        gr_item_adi.Col = 0
        aux2$ = Trim$(gr_item_adi.Text)
        
        If Opcao$ = "1" Then
            c_isg$ = aux1$
            U_ADI$ = aux2$
        Else
            c_isg$ = aux2$
            U_ADI$ = aux1$
        End If

        'VERSÃO 54 - INÍCIO
        gr_item_adi.Col = 5
        AUX_C_MOT_ALT = Trim$(gr_item_adi.Text)
        If AUX_C_MOT_ALT$ = "2200" Then
            MsgBox "Item foi excluído no aditamento consultado", 16, "R1PAB001"
            Screen.MousePointer = 0
            Exit Sub
        End If
        'VERSÃO 54 - FIM
        
        ' seleciona os dados a serem gravados no arquivo
        ' utilizado no acesso do projeto de item segurado
        su_grava_arquivo_isg

        ' fecha conexão para a chamada de outro projeto
        su_fecha_conexao
    
        'Me.Hide
        
        'v60 Emilio 22/08/2006 - início
        'Obs.: Migração XP para novo catalogador - Função descontinuada
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'        '======================================================================
'        'LUCIANE - 05/07/1999
'        If OSAmbiente = "Windows 3.11" Then
'            ret% = FU_Monitora_Exec(Me, sArqExec$ & " ")
'        Else
'            ret% = FU_Monitora_Exe(Me, CG_DIR_EXE1$ + sArqExec$ & " ", MinEnableFalse%)
'        End If
        ret% = FU_MonitoraExe(Me, "", sArqExec$, "", , MinEnableFalse%)
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        'v60 Emilio 22/08/2006 - fim
        
        If Not ret% Then
            MsgBox "Não foi possível executar o projeto" & Chr(13) & sArqExec$, 48
        End If
        
        ' chamada do executável
        'If Not FU_Monitora_Exec(Me, sArqExec$ & " ") Then
        '    MsgBox "Não foi possível executar o programa ('" & sArqExec$ & "')"
        'End If
        'LUCIANE - 05/07/1999
        '======================================================================
        
        ' reestabelece conexão após a execução de outro projeto
        SqlConn% = FU_Conecta_Servidor(SERV_MASCORP_ID)
        
        Me.Show

    End If
    
    'Término - 09/12/1998 - r1pab028

    Screen.MousePointer = 0

End Sub

Private Sub BU3D_Volta_Click()

    Unload Me

    If IND_CHAMADA_PLACA_CHASSIS% = True Then
        R1FAB001.Show
    Else
        If CONSULTA_ITEM_CALL_CENTER = True Then
            
            R1FAB001.BU3D_Sai.DoClick
            
        Else
            R1FAB002.Show
        End If
    End If

End Sub

Private Sub cb_item_adi_Click()

    If cb_item_adi.ListIndex <> -1 Then
        PAR_PESQ& = Val(cb_item_adi.Text)
    End If

End Sub

Private Sub Form_Activate()

    If IND_CHAMADA_PLACA_CHASSIS% = True Then
        op3d_item.Value = True
        op3d_especifico = True
        bu3d_ok_click
    End If

End Sub

Private Sub Form_Load()

    Screen.MousePointer = HOURGLASS
    
    SU_Ajusta_Form Me, 1
    
   '***************************************************
   '    Alterado por Opus em 02/02/1999.              *
   '    Motivo: erro no VB5.                          *
   '                                                  *
   '    Solução: Su_Conecta_Verifica comentada        *
   '***************************************************
    'su_conecta_verifica 2, "R1FAB002"
    
    SU_Verifica_Duplicidade Me
    
    Me.Show
    Me.Refresh
    
    'lb_segurado.caption = variável com o nome do segurado vinda do form chamador (R1FAB002).
    lb_segurado.Caption = " " & UCase(n_pes$)
    'lb_apolice.caption = variável com o número da apólice vinda do form chamador (R1FAB002).
    
    lb_apolice.Caption = Format$(c_cia_ita$, "00") & "." & Format$(c_rmo$, "00") & "." & _
                 Format$(u_apo_pnc$, "000000000") & "." & Format$(u_apo_dpd$, "0000000") '   PauloFLopes     29/10/2007

    'Habilita frame com options de consulta.
    fr3d_opt.Visible = True
    fr3d_opt.Enabled = True
    fr3d_tipo_consulta.Visible = True
    fr3d_tipo_consulta.Enabled = True
    op3d_item.Visible = True
    op3d_item.Enabled = True
    op3d_adi.Visible = True
    op3d_adi.Enabled = True

    'Habilita botões cancela e volta.
    BU3D_Cancela.Visible = True
    BU3D_Cancela.Enabled = True
    bu3d_volta.Visible = True
    bu3d_volta.Enabled = True
    bu3d_ok.Visible = True
    bu3d_ok.Enabled = False
    bu3d_ok.BevelWidth = 0

    Screen.MousePointer = DEFAULT

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

Private Sub gr_item_adi_DblClick()
    
    bu3d_ok_click

End Sub

Private Sub op3d_adi_Click(Value As Integer)

    'flag de escolha do option_buttom
    flag_adi = True
    flag_item = False       'Cláudia 11/11/98

    Opcao$ = "2"
    
    'Habilita frame de tipo de pesquisa e botão OK.
    fr3d_tipo_pesq.Visible = True
    fr3d_tipo_pesq.Enabled = True
    fr3d_tipo_consulta.Enabled = False
    fr3d_item_adi.Visible = False
    op3d_generico.Visible = True
    op3d_generico.Enabled = True
    op3d_generico.Value = False
    op3d_especifico.Visible = True
    op3d_especifico.Enabled = True
    op3d_especifico.Value = False

    If lb_item_adi_txt.Visible = True Then
        lb_item_adi_txt.Caption = "Aditamento: "
    ElseIf lb_item_adi_cb.Visible = True Then
        lb_item_adi_cb.Caption = "Aditamento: "
    End If
    
    bu3d_ok.Enabled = True
    bu3d_ok.BevelWidth = 2

End Sub

Private Sub op3d_especifico_Click(Value As Integer)
    
    'Habilita frame de resultado de pesquisa.
    fr3d_item_adi.Visible = True
    fr3d_item_adi.Enabled = True
    
    If lb_item_adi_cb.Visible = True Then
        lb_item_adi_cb.Visible = False
        cb_item_adi.Clear
        cb_item_adi.Visible = False
    End If

    lb_item_adi_txt.Visible = True
    tb_item_adi.Visible = True

    If op3d_item.Value = True Then
        lb_item_adi_txt.Caption = "Item: "
    ElseIf op3d_adi.Value = True Then
        lb_item_adi_txt.Caption = "Aditamento: "
    End If
    
    tb_item_adi.Visible = True
    tb_item_adi.Enabled = True
    tb_item_adi.SetFocus

End Sub

Private Sub op3d_generico_Click(Value As Integer)

    Screen.MousePointer = HOURGLASS

    'Habilita frame de resultado de pesquisa.
    fr3d_item_adi.Visible = True
    fr3d_item_adi.Enabled = True
    
    If lb_item_adi_txt.Visible = True Then
        lb_item_adi_txt.Visible = False
        tb_item_adi.Text = ""
        tb_item_adi.Visible = False
    End If

    lb_item_adi_cb.Visible = True
    cb_item_adi.Visible = True

    If op3d_item.Value = True Then
        Opcao$ = "1"
        lb_item_adi_txt.Caption = "Item: "
        lb_item_adi_cb.Caption = "Item: "
    ElseIf op3d_adi.Value = True Then
        Opcao$ = "2"
        lb_item_adi_txt.Caption = "Aditamento: "
        lb_item_adi_cb.Caption = "Aditamento: "
    End If
    
    cb_item_adi.Visible = True
    cb_item_adi.Enabled = True

    'Chamada da stproc que carrega combo box.
    If Not fu_his_isg_apo_s07465() Then
        MsgBox "Não foi possível efetuar pesquisa por Item / Aditamento." & Value , MB_ICONSTOP
        FORM7_ATIVADO = False
        
        'Se foi escolhido pesquisa por item.
        If op3d_item.Value = True Then
            If op3d_adi.Enabled = True Then
                op3d_adi.SetFocus
            End If
        'Se foi escolhido pesquisa por aditamento.
        ElseIf op3d_adi.Value = True Then
            If op3d_item.Enabled = True Then
                op3d_item.SetFocus
            End If
        End If
        
        Screen.MousePointer = DEFAULT
        Exit Sub
    End If

    Screen.MousePointer = DEFAULT

End Sub

Private Sub op3d_item_click(Value As Integer)

    'flag de escolha do option_buttom
    flag_item = True
    flag_adi = False    'Cláudia 11/11/98
    
    Opcao$ = "1"

    'Habilita frame de tipo de pesquisa e botão OK.
    fr3d_tipo_pesq.Visible = True
    fr3d_tipo_pesq.Enabled = True
    fr3d_tipo_consulta.Enabled = False
    fr3d_item_adi.Visible = False
    op3d_generico.Visible = True
    op3d_generico.Enabled = True
    op3d_generico.Value = False
    op3d_especifico.Visible = True
    op3d_especifico.Enabled = True
    op3d_especifico.Value = False

    If lb_item_adi_txt.Visible = True Then
        lb_item_adi_txt.Caption = "Aditamento: "
    ElseIf lb_item_adi_cb.Visible = True Then
        lb_item_adi_cb.Caption = "Aditamento: "
    End If
    
    bu3d_ok.Enabled = True
    bu3d_ok.BevelWidth = 2

End Sub

Private Sub tb_item_adi_Change()

    If Trim(tb_item_adi.Text) <> "" Then
        bu3d_ok.Enabled = True
        bu3d_ok.BevelWidth = 2
    End If

End Sub

Private Sub tb_item_adi_KeyPress(KeyAscii As Integer)

    'Permite apenas a digitação de números.
    If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
        KeyAscii = 0
    End If

End Sub

