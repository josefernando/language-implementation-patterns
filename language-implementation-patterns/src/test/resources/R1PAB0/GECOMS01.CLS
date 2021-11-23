VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "gecoms01"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

WithEvents objEvento As GerenteConexoes
' Public objEventoZe As GerenteConexoes 

Attribute objEvento.VB_VarHelpID = -1

Private Sub Class_Initialize()
    
100 On Error GoTo Erro_Class_Initialize
200 Set objEvento = objCamada  'Instancia o objeto de conexão (declarado no GEMOGC0X.BAS)
    Exit Sub

Erro_Class_Initialize:
    Err.Raise Err.Number, "GECOMS01 Class_Initialize. Linha: " & CStr(Erl), Err.Description
    Exit Sub
End Sub

Private Sub Class_Terminate()
    
100 On Error GoTo Erro_Class_Terminate
200 Set objEvento = Nothing   'Desaloca o objeto que recebe eventos de erro e mensagem
    Exit Sub

Erro_Class_Terminate:
    Err.Raise Err.Number, "GECOMS01 Class_Terminate. Linha: " & CStr(Erl), Err.Description
    Exit Sub
End Sub

Private Sub objEvento_Erro(ByVal numeroConexao As Long, ByVal severidade As Long, ByVal Codigo As Long, ByVal nomeProcedure As String, ByVal Mensagem As String, ByVal estadoTransacao As Long, ByVal servidor As String, ByVal linhaProcedimento As Long, ByVal estado As Long)

100 On Error GoTo Erro_objEvento_Erro
200 If UCase(Mensagem) = "NO MORE RESULTS." Then Exit Sub
300 Forms(0).VBSQL1_Error CInt(numeroConexao), CInt(severidade), CInt(Codigo), Mensagem, CInt(estado)
    Exit Sub

Erro_objEvento_Erro:
    Select Case Err.Number
    Case 6
        Err.Clear
    Case 438
        MsgBox CG_MENSAGEM_PADRAO, vbCritical, "Aten��o"
        MsgBox "Erro provavelmente causado pela ausência da Sub VBSQL1_Error na Form principal."
    Case Else
        Err.Raise Err.Number, "GECOMS01 objEvento_Erro. Linha: " & CStr(Erl), Err.Description
    End Select
    Exit Sub
End Sub

Private Sub objEvento_Mensagem(ByVal numeroConexao As Long, ByVal severidade As Long, ByVal Codigo As Long, ByVal nomeProcedure As String, ByVal Mensagem As String, ByVal estadoTransacao As Long, ByVal servidor As String, ByVal linhaProcedimento As Long, ByVal estado As Long)

100 On Error GoTo Erro_objEvento_Mensagem
200 If Codigo = 5704 Then Exit Sub
300 Forms(0).VBSQL1_Message CInt(numeroConexao), Codigo, CInt(estado), CInt(severidade), Mensagem
    Exit Sub

Erro_objEvento_Mensagem:
    Select Case Err.Number
    Case 6
        Err.Clear
    Case 438
        MsgBox CG_MENSAGEM_PADRAO, vbCritical, "Atenção"
        MsgBox "Erro provavelmente causado pela ausência da Sub VBSQL1_Message na Form principal."
    Case Else
        Err.Raise Err.Number, "GECOMS01 objEvento_Mensagem. Linha: " & CStr(Erl), Err.Description
    End Select
    Exit Sub
End Sub
