Attribute VB_Name = "GEMOEX01"
Option Explicit

'************************** Variáveis ************************************
Private objProcesso As GECOEX01
'*************************************************************************

'************************** Constantes ***********************************
Private Const MinEnableFalse% = 1
Private Const NormalEnableFalse% = 2
Private Const FormularioHide% = 3
Private Const INFINITE = &HFFFF      'timeout infinito

Private Const CAMINHO_EXE = 0
Private Const NOME_EXE = 1
'*************************************************************************

'***************************** Declare ***********************************
' Incluido para dar suporte a sub de gravação na LOG
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
                  
Private Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
                  
'Api´s utilizadas para forçar a aplicação a executar em primeiro plano
Private Declare Function BringWindowToTop Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetForegroundWindow Lib "user32" () As Long
Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Private Declare Function AttachThreadInput Lib "user32" (ByVal idAttach As Long, ByVal idAttachTo As Long, ByVal fAttach As Long) As Long
Private Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
                                    
'*************************************************************************

Public Function FU_MonitoraExe(Formulario As Form, _
                               sCaminho As String, _
                               nomeLogicoPrograma As String, _
                               sParametros As String, _
                      Optional intervaloTimeOut As Long = INFINITE, _
                      Optional FormState As Integer = 0, _
                      Optional Deploy As Boolean = True) As Boolean
                      
        'Objetivo: Lança o executável, efetua tratamento no form do
        '          projeto chamador, aguarda o término da execução e
        '          libera os recursos alocados.
        'Retorno: true se o programa executar com sucesso,
        '                            caso contrário false.
        'Manutenção: Eley(Opus) - 27/07/2005
        'Inclusão do parâmetro opcional que indica se haverá deploy da aplicação
            
        Dim DadosFisicos()       As String
        Dim WindowStateOriginal  As Long
        Dim EnabledOriginal      As Long
        Dim StrAux               As String
        Dim CodAux               As Long
        Dim flagHIDE             As Boolean
    
10      FU_MonitoraExe = False
    
20      On Error GoTo TrataErro
    
        'Armazena o estado do original do form, para posterior restauração
30      SU_GravaEstadoForm Formulario, WindowStateOriginal, EnabledOriginal
  
        'Desabilita o formulário chamador
40      If Not (Formulario Is Nothing) Then
50        Formulario.Enabled = False
60      End If
    
70        If Deploy Then
80           StrAux = FU_GerenteDeploy(nomeLogicoPrograma)
90           If Trim(StrAux) = "" Then
100              MsgBox "Falha no Deploy do arquivo: " & UCase(nomeLogicoPrograma), _
                   vbOKOnly + vbExclamation, "FU_MonitoraExe"
110              GoTo Saida_2        'Exit Function120
120          End If
130          DadosFisicos() = Split(StrAux, "/")
140       Else
150         ReDim DadosFisicos(2)
160         DadosFisicos(CAMINHO_EXE) = sCaminho
170         DadosFisicos(NOME_EXE) = nomeLogicoPrograma
180       End If


190     On Error Resume Next
200     If UBound(DadosFisicos) < 1 Then
210          MsgBox "Falha no Deploy do arquivo: " & UCase(nomeLogicoPrograma), _
                    vbOKOnly + vbExclamation, "FU_MonitoraExe"
220          GoTo Saida_2       'Exit Function
230     End If

240     On Error GoTo TrataErro

        'Inicializa o objeto que criará o processo
250     Set objProcesso = New GECOEX01
    
        'Cria o processo
260     If Not objProcesso.Processo(DadosFisicos(CAMINHO_EXE), _
                                    DadosFisicos(NOME_EXE), _
                                    sParametros, _
                                    intervaloTimeOut) Then
270          MsgBox "Falha na inicialização do programa: " & UCase(nomeLogicoPrograma), _
                    vbOKOnly + vbExclamation, "FU_MonitoraExe"
280          GoTo Saida_1       'Exit Function
290     End If
    
        'Aguarda a Carga
300     If Not objProcesso.aguardaCargaPrograma(intervaloTimeOut) Then
310         MsgBox "Falha na Carga do programa: " & UCase(nomeLogicoPrograma), _
                    vbOKOnly + vbExclamation, "FU_MonitoraExe"
320         GoTo Saida_1
330     End If
    
340     flagHIDE = False
    
        'Define a operação a ser realizada no formulário
350     Select Case FormState
            Case FormularioHide
360             If Not (Formulario Is Nothing) Then
370                 Formulario.Hide
380                 flagHIDE = True
390             End If
            
400         Case NormalEnableFalse
410             If Not (Formulario Is Nothing) Then _
                        Formulario.Enabled = NormalEnableFalse
                       'Formulario.WindowState = NormalEnableFalse
            
420         Case Else
430             If Not (Formulario Is Nothing) Then _
                        Formulario.WindowState = MinEnableFalse
440     End Select
    
450     DoEvents
    
        'Aguarda o término do Programa
460     If Not objProcesso.aguardaTerminoPrograma(intervaloTimeOut) Then
470         MsgBox "Falha na Execução do programa: " & UCase(nomeLogicoPrograma), _
                    vbOKOnly + vbExclamation, "FU_MonitoraExe"
                    
480         FU_MonitoraExe = False
490     Else
500         FU_MonitoraExe = True
510     End If
    
Saida_1:
        'Destroi o objeto do processo
520     Set objProcesso = Nothing
    
Saida_2:
        'Retorna o form ao seu estado original
530     SU_RetornaEstadoForm Formulario, _
                             WindowStateOriginal, _
                             EnabledOriginal, _
                             flagHIDE
    
540     Exit Function
    
TrataErro:
550     StrAux = Err.Description & " (Linha: " & Erl & ") " & "Origem: " & Err.Source: _
                 CodAux = Err.Number
    
560     MsgBox "Erro: " & StrAux, _
               vbOKOnly + vbExclamation, _
               "FU_MonitoraExe - " & UCase(nomeLogicoPrograma)
        
        Resume Saida_1
End Function

Private Function FU_GerenteDeploy(ByVal NomeProg As String) As String
    Dim StrAux                As String
    Dim StrMsg                As String
'   Dim iTentativa            As Integer
    Dim objGerente            As IX2CGGED001.GerenteDeploy
        
470     On Error GoTo TrataErros
    
480     FU_GerenteDeploy = ""
    
'490    iTentativa = 1
    
        'Instanciar componente gerente_executável
'500     Set objGerente = CreateObject("IX2CGGED001.GerenteDeploy")
500      Set objGerente = New IX2CGGED001.GerenteDeploy

'TentaOutraVez:
'510     Select Case iTentativa
'            Case 1
'530             Set objGerente = New IX2CGGED001.GerenteDeploy
'
'540         Case 2
'550             Set objGerente = New IX2CGGED002.GerenteDeploy
'
'560         Case 3
'570             Set objGerente = New IX2CGGED003.GerenteDeploy
'
'580         Case 4
'590             Set objGerente = New IX2CGGED004.GerenteDeploy
'
'600         Case 5
'610             Set objGerente = New IX2CGGED005.GerenteDeploy
'620     End Select
    
        'Altera o TimeOut de espera de resposta do comonente
630     App.OleRequestPendingTimeout = 2147483647
    
        'Chama o Gerente de Deploy
640     StrAux = objGerente.Executa(NomeProg)
    
        'Retorna o TimeOut de espera de resposta do comonente ao default
650     App.OleRequestPendingTimeout = 5000
    
660     Set objGerente = Nothing
    
670     FU_GerenteDeploy = StrAux
    
Saida:
680     On Error GoTo 0
690     Exit Function
    
TrataErros:
'700     StrMsg = "Tentativa: " & iTentativa &
700     StrMsg = " [" & Trim(Err.Description) & _
                 " / Cod: " & Err.Number & _
                 " / Linha: " & Erl & _
                 " / Origem: " & Err.Source & "]"
    
        'Grava a descrição do erro na log.
710     GravaLog StrMsg
    
720     Set objGerente = Nothing
     
'730     If iTentativa < 5 Then
'740         iTentativa = iTentativa + 1
'750         DoEvents
'760         Resume TentaOutraVez
'770     Else
780         Resume Saida
'790     End If
End Function

Public Function FU_IniciaExecucao(caminho As String, _
                                  nomeLogicoPrograma As String, _
                                  auxParm As String, _
                         Optional intervaloTimeOut As Long = INFINITE) As Boolean
                         
    'Objetivo: Lança um programa executável
    'Retorno: True caso o programa tenha sido lançado com sucesso, False caso contrário
    
    Const CAMINHO_EXE = 0, NOME_EXE = 1
    
    Dim DadosFisicos()  As String
    Dim retornoProcesso As Boolean
    Dim StrAux          As String
    Dim CodAux          As Long
    
800     On Error GoTo TrataErro
    
810     FU_IniciaExecucao = False
    
820     StrAux = FU_GerenteDeploy(nomeLogicoPrograma)
830     If Trim(StrAux) = "" Then
840         MsgBox "Falha no Deploy do arquivo: " & UCase(nomeLogicoPrograma), _
                   vbOKOnly + vbExclamation, "FU_IniciaExecucao"
841         Exit Function
850     End If
    
860     DadosFisicos() = Split(StrAux, "/")

861     On Error Resume Next
862     If UBound(DadosFisicos) < 1 Then
863          MsgBox "Falha no Deploy do arquivo: " & UCase(nomeLogicoPrograma), _
                    vbOKOnly + vbExclamation, "FU_IniciaExecucao"
864          Exit Function
865     End If

866     On Error GoTo TrataErro

    'Inicializa o objeto que criará o processo
870     Set objProcesso = New GECOEX01
    
    'Cria o processo
880     If Not objProcesso.Processo(DadosFisicos(CAMINHO_EXE), _
                                DadosFisicos(NOME_EXE), _
                                auxParm, _
                                intervaloTimeOut) Then
885         Set objProcesso = Nothing
890         MsgBox "Falha na inicialização do programa: " & UCase(nomeLogicoPrograma), _
                    vbOKOnly + vbExclamation, "FU_IniciaExecucao"
891         Exit Function
900     End If
    
    'Aguarda a Carga
910     If Not objProcesso.aguardaCargaPrograma(intervaloTimeOut) Then
915         Set objProcesso = Nothing
920         MsgBox "Falha na Carga do programa: " & UCase(nomeLogicoPrograma), _
                    vbOKOnly + vbExclamation, "FU_IniciaExecucao"
921         Exit Function
930     End If

940     FU_IniciaExecucao = True
    
950     Exit Function
    
TrataErro:
960     StrAux = Err.Description & " (Linha: " & Erl & ")" & " Origem: " & Err.Source: CodAux = Err.Number
    
970     'Destroi os objetos instanciados
980     Set objProcesso = Nothing
    
990     MsgBox "Erro: " & StrAux, _
               vbOKOnly + vbExclamation, _
               "FU_Iniciaexecucao - " & UCase(nomeLogicoPrograma)
End Function

Public Function FU_IniciaExecucaoDireta(caminho As String, _
                                        nomePrograma As String, _
                                        auxParm As String, _
                               Optional intervaloTimeOut As Long = INFINITE) As Boolean
                         
    'Objetivo: Lança um programa executável SEM utilizar o Deploy-on-Demand!!!
    'Feita exclusivamente para o Lançamento de aplicações Não-Corporativas.
    
    'Retorno: True caso o programa tenha sido lançado com sucesso, False caso contrário
        
    Dim DadosFisicos(CAMINHO_EXE To NOME_EXE)   As String
    Dim retornoProcesso As Boolean
    Dim StrAux          As String
    Dim CodAux          As Long
    
1000    On Error GoTo TrataErro
    
1010    FU_IniciaExecucaoDireta = False
    
1020    DadosFisicos(CAMINHO_EXE) = caminho
1030    DadosFisicos(NOME_EXE) = nomePrograma
        
    'Inicializa o objeto que criará o processo
1040    Set objProcesso = New GECOEX01
    
    'Cria o processo
1050    If Not objProcesso.Processo(DadosFisicos(CAMINHO_EXE), _
                                DadosFisicos(NOME_EXE), _
                                auxParm, _
                                intervaloTimeOut) Then
1065        Set objProcesso = Nothing
1060        MsgBox "Falha na inicialização do programa: " & UCase(nomePrograma), _
                   vbOKOnly + vbExclamation, "FU_IniciaExecucaoDireta"
            
1070        Exit Function
1080    End If
    
    'Aguarda a Carga
1090    If Not objProcesso.aguardaCargaPrograma(intervaloTimeOut) Then
1095        Set objProcesso = Nothing
1100        MsgBox "Falha na Carga do programa: " & UCase(nomePrograma), _
                    vbOKOnly + vbExclamation, "FU_IniciaExecucaoDireta"
      
1110        Exit Function
     End If

1120    FU_IniciaExecucaoDireta = True
    
1130    Exit Function
    
TrataErro:
1140    StrAux = Err.Description & " (Linha: " & Erl & ")" & " Origem: " & Err.Source: CodAux = Err.Number
    
       'Destroi os objetos instanciados
1150    Set objProcesso = Nothing
    
1155     MsgBox "Erro: " & StrAux, _
               vbOKOnly + vbExclamation, _
               "FU_IniciaExecucaoDireta - " & UCase(nomePrograma)
End Function

Private Sub SU_GravaEstadoForm(Formulario As Form, _
                               WindowStateOriginal As Long, _
                               EnabledOriginal As Long)
                               
        'Registra o estado atual do form.
1160    If Not (Formulario Is Nothing) Then
1170      With Formulario
1180           WindowStateOriginal = .WindowState
1190           EnabledOriginal = .Enabled
'1200           Debug.Print
'1210           Debug.Print "SU_GravaEstadoForm - WindowState = " & WindowStateOriginal
'1220           Debug.Print "SU_GravaEstadoForm - Enabled     = " & EnabledOriginal
1230      End With
1240    End If
End Sub

Private Sub SU_RetornaEstadoForm(Formulario As Form, _
                                 WindowStateOriginal As Long, _
                                 EnabledOriginal As Long, _
                                 flagHIDE As Boolean)
                                 
    'Retorna o form ao seu estado original.
    
1250    If Not (Formulario Is Nothing) Then
1260      With Formulario
'1270           Debug.Print "SU_RetornaEstadoForm - WindowState = " & WindowStateOriginal
'1280           Debug.Print "SU_RetornaEstadoForm - Enabled     = " & EnabledOriginal
          
1290          .Enabled = EnabledOriginal
1300          .WindowState = WindowStateOriginal
1310          DoEvents
'1320         .Visible = True     'Foi retirado para evitar problemas ocorridos
                                  'em aplicações que controlam essa propriedade.
                               
1320          Call FU_JanelaPrimeiroPlano(Formulario.hwnd)
1330          DoEvents
              
1340          If flagHIDE = True Then .Show
                    
1350      End With
1360    End If
End Sub

Public Sub GravaLog(ByVal Mensagem As String)
    Dim intConfig      As Integer
    Dim strContents    As String
    Dim intLog         As String
    Dim indicadorDebug As Boolean
    Dim Unidade        As String
    Dim diretorioDebug As String
    Dim strUsuario     As String
    Dim strComputer    As String
    
1360    On Error GoTo Erro_GravaLog
    
    'Verifica se o debug foi ligado e qual o diretório de envio do arquivo de log
1370    Unidade = Left(App.Path, 1)
1380    intConfig = FreeFile
1390    Open Unidade & ":\producao\controle\gemosy01.dat" For Input As #intConfig
1400    While Not EOF(intConfig)
1410        Line Input #intConfig, strContents
1420        If Left(strContents, 6) = "Debug=" Then
1430            indicadorDebug = CBool(Mid(strContents, 7))
1440        ElseIf Left(strContents, 8) = "Caminho=" Then
1450            diretorioDebug = Mid(strContents, 9)
1460            If Right(diretorioDebug, 1) <> "\" Then diretorioDebug = diretorioDebug & "\"
1470        End If
1480    Wend
1490    Close #intConfig

    'Não setar debug
1500    If Not indicadorDebug Then Exit Sub
1510    If diretorioDebug = "" Then Exit Sub

    'Grava a log
1520    If FU_GetComputerName(strComputer, 255) <> 0 Then
1530        If FU_GetUserName(strUsuario, 8) <> 0 Then
1540            intLog = FreeFile
1550            Open diretorioDebug & UCase(strUsuario) + ".log" For Append As #intLog
1560            Print #intLog, Format(Now, "dd/MM/yyyy hh:mm:ss") & " " & _
                           Format("GEMOEX01", "!@@@@@@@@@@@") & " " & _
                           Format(UCase(strComputer), "!@@@@@@@@@@@@") & " " & _
                           Left(App.EXEName, 8) & " " & _
                           Mensagem
1570            Close #intLog
1580        End If
1590    End If
    
1600    On Error GoTo 0
1610    Exit Sub
    
Erro_GravaLog:
1620    Exit Sub
End Sub

Private Function FU_GetComputerName(lpBuffer As String, nSize As Long) As Long
    Dim lpBuffer_aux As String * 255

1630    lpBuffer = String(255, Chr(0))
    
1640    nSize = Len(lpBuffer_aux)
    
1650    FU_GetComputerName = GetComputerName(lpBuffer_aux, nSize)
    
1660    lpBuffer = Left$(lpBuffer_aux, nSize)

End Function

Private Function FU_GetUserName(lpBuffer As String, nSize As Long) As Long
        Dim lpBuffer_aux As String * 255
    
1670    lpBuffer = String(255, Chr(0))
    
1680    nSize = Len(lpBuffer_aux)
    
1690    FU_GetUserName = GetUserName(lpBuffer_aux, nSize)
    
1700    lpBuffer = Left$(lpBuffer_aux, nSize - 1)
    
End Function

Public Function FU_Inicia_Execucao_Corp( _
                                   objCtlProcesso As Object, _
                                   sCaminho As String, _
                                   nomeLogicoPrograma As String, _
                                   sParametros As String, _
                          Optional intervaloTimeOut As Long = INFINITE) As Boolean
                      
    'Objetivo: Lança o executável .
    'Retorno: true se o programa for iniciado com sucesso, ou
    '         false, caso contrário.
        
    Dim DadosFisicos()       As String
    Dim StrAux               As String
    Dim CodAux               As Long
    
1810      FU_Inicia_Execucao_Corp = False
    
1820      On Error GoTo TrataErro
    
1830      StrAux = FU_GerenteDeploy(nomeLogicoPrograma)
1840      If Trim(StrAux) = "" Then
1850          MsgBox "Falha no Deploy do arquivo: " & UCase(nomeLogicoPrograma), _
                     vbOKOnly + vbExclamation, "FU_Inicia_Execucao_Corp"
1860          Exit Function
1870     End If
    
1880     DadosFisicos() = Split(StrAux, "/")

1890     On Error Resume Next
1900     If UBound(DadosFisicos) < 1 Then
1910         MsgBox "Falha no Deploy do arquivo: " & UCase(nomeLogicoPrograma), _
                    vbOKOnly + vbExclamation, "FU_Inicia_Execucao_Corp"
1920         Exit Function
1930    End If

1940    On Error GoTo TrataErro

        'Inicializa o objeto que criará o processo
1950    Set objCtlProcesso = New GECOEX01
    
        'Cria o processo
1960    If Not objCtlProcesso.Processo(DadosFisicos(CAMINHO_EXE), _
                                       DadosFisicos(NOME_EXE), _
                                       sParametros, _
                                       intervaloTimeOut) Then
             'Destroi o objeto processo
1970         Set objCtlProcesso = Nothing
             'Dá mensagem de erro
1980         MsgBox "Falha na inicialização do programa: " & UCase(nomeLogicoPrograma), _
                    vbOKOnly + vbExclamation, "FU_Inicia_Execucao_Corp"
1990         Exit Function
2000    End If
    
        'Aguarda a Carga
2010    If Not objCtlProcesso.aguardaCargaPrograma(intervaloTimeOut) Then
            'Destroi o objeto processo
2020        Set objCtlProcesso = Nothing
            'Dá mensagem de erro
2030        MsgBox "Falha na Carga do programa: " & UCase(nomeLogicoPrograma), _
                    vbOKOnly + vbExclamation, "FU_Inicia_Execucao_Corp"
2040        Exit Function
2050    End If

2060    DoEvents
    
2070    FU_Inicia_Execucao_Corp = True
    
2080    Exit Function
    
TrataErro:
2090    StrAux = Err.Description & " (Linha: " & Erl & ") " & "Origem: " & Err.Source: _
                 CodAux = Err.Number
        
        'Destroi o objeto processo
2100    Set objCtlProcesso = Nothing
        
        'Dá mensagem de erro
2110    MsgBox "Erro: " & StrAux, _
               vbOKOnly + vbExclamation, _
               "FU_Inicia_Execucao_Corp - " & UCase(nomeLogicoPrograma)
End Function

Public Function FU_Programa_Executando(objCtrlProcesso As Object) As Boolean
        Dim StrAux As String
        Dim CodAux As Long
        
2200    FU_Programa_Executando = False

2210    On Error GoTo TrataErro

2220    If objCtrlProcesso Is Nothing Then Exit Function

2230    FU_Programa_Executando = objCtrlProcesso.programaExecutando()

2240    On Error GoTo 0
2250    Exit Function
    
TrataErro:
2260    StrAux = Err.Description & " (Linha: " & Erl & ") " & "Origem: " & Err.Source: _
                 CodAux = Err.Number
    
2270    Set objCtrlProcesso = Nothing
    
2280    MsgBox "Erro: " & StrAux, _
               vbOKOnly + vbExclamation, _
               "FU_Programa_Executando"
End Function

Public Function FU_JanelaPrimeiroPlano(ByVal hwnd As Long) As Boolean
   Dim ThreadID1 As Long
   Dim ThreadID2 As Long
   Dim nRet As Long
   
   If hwnd = GetForegroundWindow() Then
      FU_JanelaPrimeiroPlano = True
   Else
      ThreadID1 = GetWindowThreadProcessId(GetForegroundWindow, ByVal 0&)
      ThreadID2 = GetWindowThreadProcessId(hwnd, ByVal 0&)
      
      If ThreadID1 <> ThreadID2 Then
         Call AttachThreadInput(ThreadID1, ThreadID2, True)
         nRet = SetForegroundWindow(hwnd)
         Call AttachThreadInput(ThreadID1, ThreadID2, False)
      Else
         nRet = SetForegroundWindow(hwnd)
      End If
      
      Call BringWindowToTop(hwnd)
      
      FU_JanelaPrimeiroPlano = CBool(nRet)
   End If
End Function
