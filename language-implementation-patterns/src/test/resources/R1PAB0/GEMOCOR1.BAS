Attribute VB_Name = "GEMOCOR1"
' =================================================== 
' COMENTARIO SOX 
' NOME : GEMOCOR1.BAS
' VERSAO : 1
' =================================================== 
Option Explicit
' ==================================================================
' Observações:
' ************
' Antigo GEMCORPO.BAS proveniente do WIN95/CONVERSOR
' 
' ------------------------------------------------------------------
' Dependencias: 
'	Componente:
'	Modulos: 
' ==================================================================



Const CG_MENSAGEM_PADRAO = "Anote as mensagens a seguir, e contate a área de informática"
Dim vfMessage As Integer
Global vgStatus As Integer

Sub Su_error(sqlconn As Integer, Severity As Integer, errornum As Integer, ErrorStr As String, RetCode As Integer)

    'EXINFO         1 - Information no error.
    'EXUSER         2 - User error.
    'EXNONFATAL     3 - Nonfatal error
    'EXCONVERSION   4 - Error in Visual Basic
    'EXSERVER       5 - Server return an error flag
    'EXTIME         6 - Timeout
    'EXPROGRAM      7 - Coding Error in user program
    'EXRESOURCE     8 - Running out of resources
    'EXCOMMM        9 - Fail in communication with sql server
    'EXFATAL       10 - Fatal Error
    'EXCONSISTENCY 11 - Internal software error

    If Not vfMessage Then
      MsgBox CG_MENSAGEM_PADRAO, MB_OK + MB_ICONSTOP, "Atenção"
      vfMessage = False
    End If

    MsgBox "DBLibrary Error :  " & Str$(errornum) & " " & ErrorStr

    Select Case errornum
        Case 20019      'Resultados pendentes
        Case 10003      'Se for erro na conexão
             SqlWinExit
             End
        Case Else       ' Erro 10007 é erro na execucao do comando sql
             If Severity >= 2 And Severity <= 11 Then  'errornum <> 10007 And
                SqlExit
                SqlWinExit
                End
             End If
    End Select

End Sub

Sub Su_message(sqlconn As Integer, message As Long, State As Integer, Severity As Integer, msgstr As String)  'Message (number As Long, message As String)

   '
   ' Only display the message if it's not a general msg or a change language message
   '
   vgStatus = True

   If message > 99899 Then
      vgStatus = False
      GoTo ExibeErro
   ElseIf message <> 5701 And message <> 5703 Then
      GoTo ExibeErro
   End If

   Exit Sub

ExibeErro:

   MsgBox CG_MENSAGEM_PADRAO, MB_OK + MB_ICONSTOP, "Atenção"
   vfMessage = True
   MsgBox "SQL Server Error: " + Str$(message) + " " + msgstr

End Sub

