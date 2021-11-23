VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ControlWord"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
' Autor : Emilio
' Data  : 06/07/2006 às 21h25
' SSI   : EV05/6124 - Solução Word para Diferenciado - Transportes
' Descrição: Criação da classe para gerenciar o Word.
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
Option Explicit 'Força a declaração de todas as variáveis
Private WithEvents wApp As Word.Application     'Cria um objeto Word
Attribute wApp.VB_VarHelpID = -1

Private Sub Class_Initialize()
    
    Set wApp = New Word.Application

End Sub

Private Sub Class_Terminate()
    
    R1FAB005.Enabled = True
    
End Sub

Public Function FU_INICIA_WD() As Boolean

    FU_INICIA_WD = False

    On Error GoTo Trata_Erro

10  wApp.Documents.Open Filename:=n_dir_tmp & n_arq_esf_apo, ReadOnly:=True
    'Zoom = Largura da página
'ZE ERRO 20  wApp.ActiveWindow.ActivePane.View.Zoom.PageFit = wdPageFitBestFit 'v06 Emilio 16/05/2006
30  wApp.WindowState = wdWindowStateMaximize
40  wApp.Visible = True
    
    FU_INICIA_WD = True
    
    Exit Function
    
Trata_Erro:
    msgerro = "[FU_INICIA_WD] "
    If Err.Number <> 0 Then msgerro = msgerro & "/Erro VB: " & Trim(Str(Err.Number)) & " - " & Err.Description
    If Erl <> 0 Then msgerro = Trim$(msgerro) & "/Linha de Comando: " & Erl
End Function


Private Sub wApp_Quit()

    Set wApp = Nothing
    Set objControlWord = Nothing

End Sub

