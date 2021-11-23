VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GECOEX01"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' ===================================================
' COMENTARIO SOX
' NOME : GECOEX01.CLS
' VERSAO : 1
' ===================================================
Option Explicit
' ==================================================================
' Observações:
' ************
' Antigo GECGE001.CLS proveniente do WIN95/CONVERSOR
'
' ------------------------------------------------------------------
' Dependencias:
'       Componente:
'       Modulos:
' ==================================================================

'******************* Constantes ****************************************************************
Private Const NORMAL_PRIORITY_CLASS = &H20&
Private Const FORMAT_MESSAGE_ALLOCATE_BUFFER = &H100
Private Const FORMAT_MESSAGE_FROM_SYSTEM = &H1000
Private Const FORMAT_MESSAGE_IGNORE_INSERTS = &H200
Private Const INFINITE = &HFFFF                      'timeout infinito
'***********************************************************************************************

'***********************************************************************************************
'Especifica como a nova janela do processo deve aparecer,caso uma seja utilizada
Private Type STARTUPINFO
   cb As Long
   lpReserved As String
   lpDesktop As String
   lpTitle As String
   dwX As Long
   dwY As Long
   dwXSize As Long
   dwYSize As Long
   dwXCountChars As Long
   dwYCountChars As Long
   dwFillAttribute As Long
   dwFlags As Long
   wShowWindow As Integer
   cbReserved2 As Integer
   lpReserved2 As Long
   hStdInput As Long
   hStdOutput As Long
   hStdError As Long
End Type

'Fornece informações sobre o processo e seu thread principal
Private Type PROCESS_INFORMATION
   hProcess As Long
   hThread As Long
   dwProcessID As Long
   dwThreadID As Long
End Type
'***********************************************************************************************

'************************* Variáveis ***********************************************************
Private stInfo           As STARTUPINFO          'Informações sobre a inicialização do processo
Private proInfo          As PROCESS_INFORMATION  'Informações sobre o processo
Private idProcesso       As Long                 'Identificador do processo criado
Private idThread         As Long                 'Identificador do Thread criado
Private ProcessoIniciado As Boolean              'Verifica se o processo foi inicializado
'***********************************************************************************************

'******************* Api´s *********************************************************************
Private Declare Function FormatMessage Lib "kernel32" Alias "FormatMessageA" (ByVal dwFlags As Long, lpSource As Any, ByVal dwMessageId As Long, ByVal dwLanguageId As Long, ByVal lpBuffer As String, ByVal nSize As Long, Arguments As Long) As Long
                                            
Private Declare Function CreateProcessA Lib "kernel32" (ByVal lpApplicationName As String, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As String, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
                                            
Private Declare Function WaitForInputIdle Lib "user32" (ByVal hProcess As Long, ByVal dwMilliseconds As Long) As Long
                                            
Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
                                            
Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
                                            
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long

Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
                                                                                       
'***********************************************************************************************

Public Function Processo(caminho As String, nomePrograma As String, auxParm As String, intervaloTimeOut As Long) As Boolean
                         
    'Descrição: Pseudo construtor da Classe. Inicializa os atributos da classe com os
    'parâmetros recebidos e lança o executável
    'Retorno: true caso o programa tenha sido executado com sucesso, false caso contrário
    Dim retorno As Long
    Dim sParametros As String
    
    Processo = False
    
    sParametros = auxParm
    nomePrograma = caminho & "\" & nomePrograma
    
    'Impede que a mesma instância inicie dois processos
    If ProcessoIniciado = False Then
       'Alterado o Parâmetro bInheritHandles para false, para evitar
       'conflitos apresentados pelas aplicações do CallCenter
       
       'retorno = CreateProcessA(nomePrograma, sParametros, 0&, 0&, 1&, NORMAL_PRIORITY_CLASS, 0&, vbNullString, stInfo, proInfo)
       retorno = CreateProcessA(vbNullString, Chr(34) & nomePrograma & Chr(34) & sParametros, 0&, 0&, 0&, NORMAL_PRIORITY_CLASS, 0&, vbNullString, stInfo, proInfo)
       If retorno <> 0 Then
          idProcesso = proInfo.hProcess
          idThread = proInfo.hThread
          ProcessoIniciado = True
          
          Processo = True
          Exit Function
       Else
          'Se ocorreu um erro na API
          RetornaApiErro Err.LastDllError, nomePrograma
       End If
    Else
        Err.Raise vbObjectError + 513, "GECOEX01.processo", "Processo já inicializado!"
    End If
    
End Function

Public Function aguardaCargaPrograma(intervaloTimeOutCarga As Long) As Boolean
    'Descrição: Aguarda pela carga completa do programa(WaitForInputIdle)
    'Retorno: true caso o programa tenha sido carregado com sucesso, false caso contrário
    Dim retorno As Long
    
    aguardaCargaPrograma = False
    
    If ProcessoIniciado Then
        If intervaloTimeOutCarga <> -1 Then
            retorno = WaitForInputIdle(idProcesso, intervaloTimeOutCarga)
        Else
            retorno = WaitForInputIdle(idProcesso, INFINITE)
        End If
        
        '258 - Timeout
        If ((retorno = 0) Or _
            (retorno = 258) Or _
            (retorno = -1)) Then
           aguardaCargaPrograma = True
        Else
           'Se ocorreu um erro na API
           RetornaApiErro Err.LastDllError
        End If
    Else
        Err.Raise vbObjectError + 514, "GECOEX01.aguardaCargaPrograma", "Processo não inicializado!"
    End If
    
End Function

Public Function aguardaTerminoPrograma(intervaloTimeOutTermino As Long) As Boolean
    'Descrição: Aguarda pelo término da execução do programa e desaloca os handles do processo e da thread criada.
    'Retorno: true caso o programa tenha terminado antes do intervalo, false caso contrário
    Dim retorno As Long
    
    aguardaTerminoPrograma = False
    
    If ProcessoIniciado Then
        If intervaloTimeOutTermino <> -1 Then
            retorno = WaitForSingleObject(idProcesso, intervaloTimeOutTermino)
        Else
            retorno = WaitForSingleObject(idProcesso, INFINITE)
        End If
        
        If retorno = 0 Then
           aguardaTerminoPrograma = True
        ElseIf retorno = 258 Then
           'Time-out
        Else
            'Erros na API
            RetornaApiErro Err.LastDllError
        End If
    Else
       Err.Raise vbObjectError + 514, "GECOEX01.aguardaTerminoPrograma", _
                 "Processo não inicializado!"
    End If

End Function

Public Function programaExecutando() As Boolean
    'Descrição: Verifica se o programa ainda está em execução.
    'Retorno: TRUE  caso o programa ainda esteja executando,
    '         FALSE caso contrário
    
    Dim CodSaida As Long
    
    programaExecutando = False
    
    If ProcessoIniciado Then
        If GetExitCodeProcess(idProcesso, CodSaida) <> 0 Then
           If CodSaida = 259 Then
              'Ainda em execução
              programaExecutando = True
            End If
        Else
            'Erros na API
            RetornaApiErro Err.LastDllError
        End If
    Else
        Err.Raise vbObjectError + 514, "GECOEX01.programaExecutando", "Processo não inicializado!"
    End If
    
End Function

Public Function derrubaPrograma() As Boolean
    'Descrição: Para a execução do programa e desaloca
    '           os handles do processo e da thread criada.
    'Retorno:   TRUE  caso o programa pare de executar,
    '           FALSE caso contrário
    
    Dim CodSaida As Long
    
    derrubaPrograma = False
    
    If ProcessoIniciado Then
        If TerminateProcess(idProcesso, CodSaida) = 0 Then
           'Erros na API
           RetornaApiErro Err.LastDllError
           Exit Function
        End If
        
        If CloseHandle(idThread) = 0 Then
           'Erros na API
           RetornaApiErro Err.LastDllError
           Exit Function
        End If
        
        If CloseHandle(idProcesso) = 0 Then
           'Erros na API
           RetornaApiErro Err.LastDllError
           Exit Function
        End If
        
        ProcessoIniciado = False
        
        derrubaPrograma = True
        
        Exit Function
    Else
        Err.Raise vbObjectError + 514, "GECOEX01.derrubaPrograma", "Processo não inicializado!"
    End If
    
End Function

Private Sub RetornaApiErro(ByVal lLastDLLError As Long, Optional sNomeArq As String)
    'Descrição: Retorna a descrição da mensagem de erro da API
    Dim sBuff As String
    Dim lCount As Long
    
    'Retorna a mensagem de erro
    sBuff = String$(256, 0)
    lCount = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM Or FORMAT_MESSAGE_IGNORE_INSERTS, _
                           0, lLastDLLError, 0&, sBuff, Len(sBuff), ByVal 0)
                           
     sBuff = Left(sBuff, lCount)
     
     Err.Raise vbObjectError + 1000, "GECOEX01.RetornaApiErro", _
               sBuff & " (Err.cod = " & lLastDLLError & ") " & _
               IIf(Trim(sNomeArq) <> "", vbLf & "(Arquivo: " & sNomeArq & ")", "")

End Sub

Private Sub Class_Terminate()
    'Descrição: Desaloca os handles do processo e da thread criada.
    
    Dim retorno As Long
    
    If ProcessoIniciado Then
        retorno = CloseHandle(idThread)
        If retorno = 0 Then
           'Erros na API
            RetornaApiErro Err.LastDllError
            'Exit Sub
        End If
        
        retorno = CloseHandle(idProcesso)
        If retorno = 0 Then
           'Erros na API
            RetornaApiErro Err.LastDllError
        End If
    End If

End Sub
