VERSION 5.00
Object = "{0BA686C6-F7D3-101A-993E-0000C0EF6F5E}#1.0#0"; "threed32.ocx"
Object = "{A8B3B723-0B5A-101B-B22E-00AA0037B2FC}#1.0#0"; "GRID32.OCX"
Begin VB.Form R1FAB010 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Consulta à Apólice - Liberações Especiais"
   ClientHeight    =   6300
   ClientLeft      =   615
   ClientTop       =   615
   ClientWidth     =   8580
   Icon            =   "R1FAB010.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6300
   ScaleWidth      =   8580
   Begin MSGrid.Grid gr_dad_lib 
      Height          =   4785
      Left            =   180
      TabIndex        =   3
      Top             =   945
      Width           =   8235
      _Version        =   65536
      _ExtentX        =   14526
      _ExtentY        =   8440
      _StockProps     =   77
      ForeColor       =   8388608
      BackColor       =   16777215
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin Threed.SSPanel pa3d_status 
      Align           =   2  'Align Bottom
      Height          =   300
      Left            =   0
      TabIndex        =   0
      Top             =   6000
      Width           =   8580
      _Version        =   65536
      _ExtentX        =   15134
      _ExtentY        =   529
      _StockProps     =   15
      Caption         =   "R1FAB010"
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
      BorderWidth     =   1
      BevelInner      =   1
      Alignment       =   1
      Autosize        =   1
   End
   Begin Threed.SSPanel PA3D_Topo 
      Align           =   1  'Align Top
      Height          =   730
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   8580
      _Version        =   65536
      _ExtentX        =   15134
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
      Begin Threed.SSCommand bu3d_Volta 
         Height          =   600
         Left            =   7830
         TabIndex        =   2
         Tag             =   "sai"
         Top             =   60
         Width           =   600
         _Version        =   65536
         _ExtentX        =   1058
         _ExtentY        =   1058
         _StockProps     =   78
         ForeColor       =   -2147483640
         Picture         =   "R1FAB010.frx":030A
      End
      Begin VB.Image IM_Itau_Seguros 
         Appearance      =   0  'Flat
         Height          =   480
         Left            =   0
         Picture         =   "R1FAB010.frx":0624
         Top             =   120
         Width           =   1365
      End
   End
End
Attribute VB_Name = "R1FAB010"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Sub su_carrega_grid_liberacoes()

'Rotina que carrega na tela as informações das liberações especiais
'cadastradas durante a liberação da proposta.

Dim IDX As Integer

    'Formata grid para receber os dados da seleção
    With gr_dad_lib
        .Cols = 5
        .Rows = UBound(VT_TRT_LIB_APO) + 1
        .FixedCols = 0
        .FixedRows = 1
    
        .Row = 0: .Col = 0: .ColWidth(.Col) = 1600: .Text = "Nível": .FixedAlignment(.Col) = 2
        .Col = 1: .Text = "Tipo": .ColWidth(.Col) = 3500: .FixedAlignment(.Col) = 2
        .Col = 2: .Text = "Usuário": .ColWidth(.Col) = 900: .FixedAlignment(.Col) = 2
        .Col = 3: .Text = "Data": .ColWidth(.Col) = 2200: .FixedAlignment(.Col) = 2
        .Col = 4: .Text = "Motivo": .ColWidth(.Col) = 8000: .FixedAlignment(.Col) = 2

        For IDX% = 1 To UBound(VT_TRT_LIB_APO)
    
            'Posiciona a linha da grid a ser carregada
            .Row = IDX%
                            
            'Carrega o dado de nível da liberação
            .Col = 0: .ColAlignment(.Col) = 0
            
            If Val(VT_TRT_LIB_APO.c_isg) = 0 Then
                .Text = "Apólice"
            Else
                .Text = "Item: " + VT_TRT_LIB_APO(IDX%).c_isg
                
                If Val(VT_TRT_LIB_APO.c_gar) > 0 Then
                
                    .Text = .Text + " Gar: " + VT_TRT_LIB_APO(IDX%).c_gar
                End If
            End If

            'Carrega o dado de tipo de liberação
            .Col = 1: .ColAlignment(.Col) = 0: .Text = VT_TRT_LIB_APO(IDX%).t_e_lib

            'valdemir - 21/10/2003
            If Val(VT_TRT_LIB_APO(IDX%).c_frm_lib_coc$) = 1 Then
                .Text = Trim(.Text) & " - WEB"
            End If

            'Carrega o dado de usuário
            .Col = 2: .ColAlignment(.Col) = 0: .Text = VT_TRT_LIB_APO(IDX%).n_usr_azd

            'Carrega o dado de data de autorização
            .Col = 3: .ColAlignment(.Col) = 0: .Text = FU_Converte_Data((VT_TRT_LIB_APO(IDX%).d_hra_atz), "BR", True)

            'Carrega o dado de motivo
            .Col = 4: .ColAlignment(.Col) = 0: .Text = VT_TRT_LIB_APO(IDX%).t_cmt_atz
        
        Next IDX%

        .Row = 0: .Col = 0: .SelStartCol = 0: .SelEndCol = .Cols - 1
    End With
End Sub


Private Sub BU3D_Volta_Click()

    Screen.MousePointer = HOURGLASS
        
    R1FAB002.Show
    Unload Me
            
    Screen.MousePointer = DEFAULT

End Sub

Private Sub bu3d_Volta_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    PA3D_Status.Caption = "R1FAB010 - Retorna a tela principal"

End Sub


Private Sub Form_Load()

    SU_Ajusta_Form Me, 4

    su_carrega_grid_liberacoes

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    PA3D_Status.Caption = "R1FAB010"

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


Private Sub gr_dad_lib_Click()

    gr_dad_lib.SelStartCol = 0
    gr_dad_lib.SelEndCol = gr_dad_lib.Cols - 1
    
End Sub

Private Sub gr_dad_lib_DblClick()
    Lin_Lib_Sel = gr_dad_lib.Row
    R1FAB014.Show
    Me.Hide

End Sub

Private Sub gr_dad_lib_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    PA3D_Status.Caption = "R1FAB010 - De duplo clique na liberação desejada para acesso aos detalhes da liberação."

End Sub

Private Sub PA3D_Topo_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    PA3D_Status.Caption = "R1FAB010"
    
End Sub


