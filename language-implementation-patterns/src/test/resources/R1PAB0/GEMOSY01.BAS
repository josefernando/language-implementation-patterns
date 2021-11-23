Attribute VB_Name = "Sybase_Especifico"
Option Explicit

Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Private Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Public objCamada As IGerenteConexoes

'Declarando handle de erros
Public VBSQL As gecoms01

Public Function FU_Verifica_Acesso(ByVal Formulario As String, Optional nMostraMsgbox As Byte) As Integer

'Seleciona Próximo procedimento referente ao formulário caso usuário tenha permissão
'==========================================================================================================
'Parâmetros de entrada:
'    Formulario = form a ser autenticado
'    nMostraMsgbox = (OPCIONAL) informa para função se, em caso de erro, é para mostrar a msgbox.
'                     Os valores válidos são: FALSE = mostra Msgbox (Default)
'                                             TRUE  = não mostra Msgbox
'                                                2  = dispara err.raise
'==========================================================================================================
'Alteração: Marcio - 28/12/2004 - Inclusão do parametro nMostraMsgbox
'==========================================================================================================
'Alteração: Eley - 07/06/2005 - Alteração do tipo nMostraMsgBox para Byte, possibilitando três estados
'           exibe MsgBox, não realiza nenhuma ação, dispara a mensagem para fora do procedimento
'==========================================================================================================

  
    Dim retorno As Integer
    Dim Mens_Erro As String
    Dim AuxGrUser  As String * 9
  
    FU_Verifica_Acesso = FAIL
    
    Formulario = Trim(UCase(Formulario))
    
    'Executa Stored Procedure "DBNLOGIN..PR_LGN_USR_S01173"
    retorno = Verifica_Acesso(SqlConn, Formulario, Permissoes(), AuxGrUser)
    
    Grupo_Usuario = Trim(AuxGrUser)
    Mens_Erro = ""
    Select Case retorno
    Case 100    'Usuário não cadastrado
        Mens_Erro = "Acesso não permitido, usuário não está cadastrado na tabela de grupo."
    Case 101    'Usuário cancelado
        Mens_Erro = "Acesso não permitido, situação do usuário cancelado."
    Case 102    'Houve problemas na abertura do cursor
        Mens_Erro = "Houve problemas na verificação de autorização."
    Case 103    'Execução efetuada com sucesso
        Mens_Erro = ""
    Case 104    'Grupo cancelado
        Mens_Erro = "Acesso não permitido, situação do grupo cancelado."
    Case 200
        Mens_Erro = "Não foi possível identificar usuário."
    Case 201    'Erro na execução do comando
        Mens_Erro = "Falha na leitura do buffer"
    Case 202    'Erro na execução do comando
        Mens_Erro = "Falha no envio do comando para o servidor"
    Case 203    'Não encontrou o formulário
        Mens_Erro = "Usuário não está autorizado a acessar a aplicação. Solicite ao seu gestor que avalie a necessidade do acesso e, se for o caso, cadastre SR solicitando liberação."
    End Select
    
    If Mens_Erro <> "" Then
        If CBool(nMostraMsgbox) = False Then
            MsgBox Mens_Erro, 16, "SEGURANÇA"
        ElseIf nMostraMsgbox = 2 Then
            Err.Raise retorno, "SEGURANÇA", Mens_Erro
        ElseIf CBool(nMostraMsgbox) = True Then
            
        End If
        Exit Function
    End If
  
    FU_Verifica_Acesso = SUCCEED

End Function

Private Function Verifica_Acesso(ByVal Connumber As Integer, ByVal Formulario As String, Autorizacao() As String, AuxGrUser As String) As Integer

Dim msgerrstr As String          'buffer de mensagem de erro
Dim severitystr As Integer       'severidade da mensagem de erro
Dim result_ret As Long
Dim retct As Long
Dim proc_status As Integer
Dim autorizacaostr As String
Dim qtd_linhas As Long
Dim qtd_autorizacoes As Long

Dim Achou As Integer
Dim prox_proc As String
Dim i As Integer

On Error GoTo Verifica_Acesso_err

    Verifica_Acesso = 0
    qtd_linhas = 0
    qtd_autorizacoes = 0
    severitystr = EXCONSISTENCY
    msgerrstr = "Verifica_Acesso - "

    If SQLRPCInit(Connumber, "DBNLOGIN..PR_LGN_USR_S01173", 0) <> SUCCEED Then
        severitystr = EXPROGRAM
        msgerrstr = msgerrstr & "Erro na inicialização da Stored Procedure 'DBNLOGIN..PR_LGN_USR_S01173'."
        GoTo Verifica_Acesso_err
    End If
    'passa parâmetro indicador de usuário ou grupo de usuário
    If SQLRPCParam(Connumber, "@i_usr", Not SQLRPCRETURN, SQLINT2, -1, -1, "1") <> SUCCEED Then
        severitystr = EXPROGRAM
        msgerrstr = msgerrstr & "Erro na passagem de parâmetro."
        GoTo Verifica_Acesso_err
    End If
    'passa parâmetro com o nome do usuário
    If SQLRPCParam(Connumber, "@n_usr", Not SQLRPCRETURN, SQLCHAR, -1, -1, Usuario) <> SUCCEED Then
        severitystr = EXPROGRAM
        msgerrstr = msgerrstr & "Erro na passagem de parâmetro."
        GoTo Verifica_Acesso_err
    End If
    'passa parâmetro com o nome do formulário
    If SQLRPCParam(Connumber, "@n_fmr", Not SQLRPCRETURN, SQLCHAR, -1, -1, Formulario) <> SUCCEED Then
        severitystr = EXPROGRAM
        msgerrstr = msgerrstr & "Erro na passagem de parâmetro."
        GoTo Verifica_Acesso_err
    End If

    'parâmetro de retorno com o grupo de usuário
    If SQLRPCParam(Connumber, "@c_grp_usr", SQLRPCRETURN, SQLCHAR, 8, -1, "") <> SUCCEED Then
        severitystr = EXPROGRAM
        msgerrstr = msgerrstr & "Erro na passagem de parâmetro."
        GoTo Verifica_Acesso_err
    End If
    
    If SQLRPCSend(Connumber) <> SUCCEED Then
        msgerrstr = msgerrstr & "Erro no envio do comando."
        GoTo Verifica_Acesso_err
    End If
    
    'Processa resultados
    result_ret = SqlResults(Connumber)
    Do Until result_ret = NOMORERESULTS Or result_ret = FAIL
        retct = SqlNextRow(Connumber)
        Do Until retct = NOMOREROWS Or retct = FAIL
            qtd_linhas = qtd_linhas + 1
            autorizacaostr = Trim(SqlData(Connumber, 1))
            
            'While autorizacaostr <> ""
            While Len(autorizacaostr) >= 8 'Para compatibilidade com Windows 95 / VB 5.0, onde
                                           'as autorizações fracionadas são removidas
              prox_proc = Left(autorizacaostr, 8)
              autorizacaostr = Mid(autorizacaostr, 9)
              Achou = False
              For i = 0 To qtd_autorizacoes - 1
                  If prox_proc = Autorizacao(i) Then
                    Achou = True
                    Exit For
                  End If
              Next i
              If Not Achou Then
                  ReDim Preserve Autorizacao(qtd_autorizacoes + 1) 'Redimensiona array dinâmico com total de linhas selecionadas
                                                                   '+ 1 foi acrescentado por conta da compatibilidade com Windows 95 / VB 5.0
                  Autorizacao(qtd_autorizacoes) = prox_proc
                  qtd_autorizacoes = qtd_autorizacoes + 1
              End If
            Wend
            
            retct = SqlNextRow(Connumber)
        Loop
        result_ret = SqlResults(Connumber)
    Loop
    
    For i = 0 To qtd_autorizacoes - 1
        Autorizacao(i) = Replace(Autorizacao(i), "!", "")
    Next i

    If result_ret = FAIL Or retct = FAIL Then
        msgerrstr = msgerrstr & "Erro na seleção dos resultados."
        GoTo Verifica_Acesso_err
    End If
    
    AuxGrUser = SqlRetData(Connumber, 1)

    proc_status = SqlRetStatus(Connumber)
    If qtd_linhas < 1 Then proc_status = 203
    Verifica_Acesso = proc_status
    On Error GoTo 0
    Exit Function

Verifica_Acesso_err:
    msgerrstr = msgerrstr & Error
    Verifica_Acesso = FAIL
    On Error GoTo 0
    MsgBox "RaiseEvent Error(0, severitystr, 0, msgerrstr, 0)"
    Exit Function

End Function

Public Sub SU_Conecta_Verifica(Servidor_Id As Integer, Formulario As String)

'Objetivo : Abrir conexão com o servidor sybase especificado
'           Verifica autorização no formulário especificado
'Recebe    :Servidor_Id
'           Identificação de qual servidor será aberta a conexão.
'           SERV_SIE_ID = 1 - Servidor Sie
'           SERV_MASCORP_ID = 2 - Servidor PROD10
'           SERV_MANUAPO_ID = 3 - Servidor PROD20
'           SERV_CONSAPO_ID = 4 - Servidor PROD30
'           SERV_GETAO_ID = 5 - Servidor Gestão
'
'           Formulario
'           Formulário a ser verificado a autorização

    If SqlInit() = "" Then 'Abre a Biblioteca
        MsgBox "Não foi inicializar a biblioteca de conexão, tente o LOGIN da rede novamente.", 16, "Erro de Acesso"
        End
    End If
    
    SqlConn% = FU_Conecta_Servidor(Servidor_Id)
    If SqlConn% = 0 Then
        MsgBox "Não foi possível abrir conexão, tente o LOGIN da rede novamente.", 16, "Erro de Acesso"
        SqlWinExit
        End
    End If
    
    If FU_Verifica_Acesso(Formulario) = FAIL Then
        SqlExit
        SqlWinExit
        End
    End If

End Sub

Public Sub SU_LogOff()
                                          
    '*** Fecha a conexão aberta "SQLCONN%"
    If SqlConn% <> 0 Then
        SqlClose (SqlConn%)
        SqlConn% = 0
    End If

End Sub

Public Sub SU_Mostra_Erro(Severity As Integer, errornum As Integer, ErrorStr As String, RetCode As Integer)

    Err_Syb = 0
    ErrSev_Syb = 0
    ErrStr_Syb = ""
    Select Case Severity
        Case 1, 5   '1=Mensagem informativa,5=Mensagem mostrada na rotina SU_Mostra_Mensagem
        Case Else
            Err_Syb = errornum
            ErrSev_Syb = Severity
            ErrStr_Syb = ErrorStr
            MsgBox CG_MENSAGEM_PADRAO, vbOKOnly + vbCritical, "Atenção"
            MsgBox Str$(errornum) & " - " & ErrorStr, vbOKOnly + vbCritical, "Erro no Client - DBlibrary Error"
    End Select

End Sub

Public Sub SU_Mostra_Mensagem(message As Long, State As Integer, Severity As Integer, msgstr As String)

    Msg_Syb = 0
    MsgSev_Syb = 0
    MsgStr_Syb = ""
    Select Case message
    Case 5701, 5703, 5704 'mensagens apenas informativas
    Case Else
        Msg_Syb = message
        MsgSev_Syb = Severity
        MsgStr_Syb = msgstr
        MsgBox CG_MENSAGEM_PADRAO, vbOKOnly + vbCritical, "Atenção"
        MsgBox Str$(message) & " - " & msgstr, vbOKOnly + vbCritical, "Erro no Server - DBlibrary Error - SQL Server Error"
    End Select

End Sub

Public Sub SU_SqlOkFail(conexao As Integer)

'Objetivo   : Tratar mensagem de erro quando SqlOk() retornar FAIL.
'             deve ser chamada nas execuções de stored procedures de
'             insert, delete e update.
'Autores    : Edilson e Marisa
'Data       : 28/07/1995
'Exemplo    : If SqlOk(Conexao) = FAIL then
'                SU_SqlOkFail (Conexao)
'                Exit Function
'             End If
Dim ret As Integer
    
    ret = SqlResults%(conexao)
    Do Until ret = NOMORERESULTS Or ret = FAIL
        ret = SqlNextRow(conexao)
        Do Until ret = NOMOREROWS Or ret = FAIL
            ret = SqlNextRow(conexao)
        Loop
        If ret = FAIL Then Exit Sub
        ret = SqlResults(conexao)
    Loop

End Sub

Public Function fu_executesqlcommand(ByVal SqlConn As Integer, ByVal Comando As String) As Integer
 
'
'*** Função que executa o comando "CMD" passado como parâmetro e retorna
'*** "SUCCEED"" ou "FAIL" dependendo do sucesso da operação
'
    fu_executesqlcommand = FAIL
    If SqlCmd(SqlConn, Comando) = SUCCEED Then
        fu_executesqlcommand = SqlExec(SqlConn)
    End If

End Function

Public Function Fu_Mensagem(ByVal SqlConn As Integer, ByVal Codigo As Integer, ByVal numero As Integer) As Integer
    
    ' Programador: Roney (Origin)
    ' Data: 29/06/93
    ' recebe como parâmetros o código e o número do ícone da mensagem
    ' retorna true ou false
    ' seleciona a mensagem de acordo com código recebido
Dim Titulo As String
Dim Recebe As String
    Titulo = "Mensagem"
    Fu_Mensagem = True
    'Inicializa Stored Procedure
    If SQLRPCInit(SqlConn%, "prod20.dbnapoio..pr_msg_s00211", 0) = FAIL% Then
        SqlStatus% = FAIL
        Fu_Mensagem = FAIL
        Exit Function
    End If
    If SQLRPCParam(SqlConn%, "@Codigo", Not SQLRPCRETURN, SQLINT2%, -1, Len(Str$(Codigo)), Str$(Codigo)) = FAIL% Then
        SqlStatus% = FAIL
        Fu_Mensagem = FAIL
    End If
    If SQLRPCSend(SqlConn%) = FAIL% Then    'Finaliza Stored Procedure
        SqlStatus% = FAIL
        Fu_Mensagem = FAIL
        Exit Function
    End If
    If SqlOk(SqlConn%) = FAIL% Then
        SqlStatus% = FAIL
        Fu_Mensagem = FAIL
        Exit Function
    End If
    
    'retorna s status se existe a mensagem ou não na tabela
    SqlStatus% = 1
    Do Until SqlStatus% = NOMORERESULTS%
        SqlStatus% = SqlResults%(SqlConn%)
        If SqlStatus% = FAIL Then
            Fu_Mensagem = False
            MsgBox "Houve problemas na seleção da mensagem.", 16, Titulo$
            Exit Function
        End If
        While SqlNextRow(SqlConn%) <> NOMOREROWS
            Recebe = SqlData$(SqlConn%, 1)
        Wend
    Loop
    If Trim$(Recebe$) = "" Then
        MsgBox "Mensagem não cadastrada.", 16, Titulo$
        Exit Function
    Else
        MsgBox Str$(Codigo) + " - " + Trim$(Recebe), numero, Titulo
        Exit Function
    End If

End Function

Public Sub SU_InitializeApplication()

    'EFO - Funções expurgáveis

    SqlConn% = 0
    If SqlInit() Then 'Inicializa a DBLIB
        App.OleRequestPendingTimeout = 2147483647
        DBLIB_VERSION$ = objCamada.getVersao()
        App.OleRequestPendingTimeout = 5000
    Else
        DBLIB_VERSION$ = ""
    End If

End Sub

Public Sub SU_Habilita_Controles(Formulario As Form)
    
    '*** Habilita os controles dependendo do conteúdo do array permissoes()
    '*** (montado na função acesso()). Habilita os seguintes tipos de
    '*** controles:
    ' .SSCommand        - Botão 3d
    ' .Label            - Label Normal
    ' .CommandButton    - Botão Normal
    ' .Menu             - Opções do Menu
    '*** Recebe:
    ' .Formulario - Nome do form que contém os controles

    Dim Total_Linhas    As Integer
    Dim a               As Integer
    Dim j               As Integer

    ' Atribui Total de Linhas selecionadas para a variável:
    ' Total_Linhas%

    On Error Resume Next
    Total_Linhas% = UBound(Permissoes)
    If Err <> 0 Then Exit Sub
    On Error GoTo 0

    For a = 0 To Formulario.Count - 1
        If TypeName(Formulario.Controls(a)) = "SSCommand" Then
            For j% = 0 To Total_Linhas%
                If (Trim$(UCase$(Permissoes(j%))) = Trim$(UCase$(Formulario.Controls(a).Tag))) And (Trim$(UCase$(Permissoes(j%))) <> "") Then
                    Formulario.Controls(a).BevelWidth = 2
                    Formulario.Controls(a).Enabled = True
                    Formulario.Controls(a).AutoSize = 0
                    Formulario.Controls(a).Enabled = True
                    Formulario.Controls(a).Refresh
                    Exit For
                End If
            Next j%
        
        ElseIf TypeName(Formulario.Controls(a)) = "Label" Then
            For j% = 0 To Total_Linhas%
                If (Trim$(UCase$(Permissoes(j%))) = Trim$(UCase$(Formulario.Controls(a).Tag))) And (Trim$(UCase$(Permissoes(j%))) <> "") Then
                    Formulario.Controls(a).ForeColor = QBColor(1)
                    Formulario.Controls(a).Refresh
                    Exit For
                End If
            Next j%
        ElseIf TypeName(Formulario.Controls(a)) = "CommandButton" Then
            For j% = 0 To Total_Linhas%
                If (Trim$(UCase$(Permissoes(j%))) = Trim$(UCase$(Formulario.Controls(a).Tag))) And (Trim$(UCase$(Permissoes(j%))) <> "") Then
                    Formulario.Controls(a).Enabled = True
                    Formulario.Controls(a).Refresh
                    Exit For
                End If
            Next j%
            
        ElseIf TypeName(Formulario.Controls(a)) = "Menu" Then
            For j% = 0 To Total_Linhas%
                If (Trim$(UCase$(Permissoes(j%))) = Trim$(UCase$(Formulario.Controls(a).Tag))) And (Trim$(UCase$(Permissoes(j%))) <> "") Then
                    Formulario.Controls(a).Enabled = True
                    Exit For
                End If
            Next j%
        End If
    Next a
End Sub

Function fu_mes_ing_port(data_ingles As String, ErrorStr As String) As Long
    'Objetivo   : Converte mês por extenso abreviado do formato inglês para português ('Apr'  por "Abr")
    'Autor      : Marcelo Murata
    'Data       : 03/11/1998
    'Recebe     : data_ingles = data completa ("Nov 3 1998 11:30:39:876AM" ou "Nov 3 1998 11:30:39AM")
    'Retorna    : TRUE ou FALSE (além de alterar o parâmetro passado com a data)

    Dim mes_abrev As String
    
    fu_mes_ing_port = False
    On Error GoTo mes_ing_port_erro
    mes_abrev = UCase$(Left$(data_ingles, 3))
    Select Case mes_abrev
    Case "FEB"
        Mid$(data_ingles, 1, 3) = "fev"
    Case "APR"
        Mid$(data_ingles, 1, 3) = "abr"
    Case "MAY"
        Mid$(data_ingles, 1, 3) = "mai"
    Case "AUG"
        Mid$(data_ingles, 1, 3) = "ago"
    Case "SEP"
        Mid$(data_ingles, 1, 3) = "set"
    Case "OCT"
        Mid$(data_ingles, 1, 3) = "out"
    Case "DEC"
        Mid$(data_ingles, 1, 3) = "dez"
    End Select
    fu_mes_ing_port = True
    
mes_ing_port_erro:
    ErrorStr = Error$
    On Error GoTo 0
    Exit Function
    
End Function

Public Function FU_GetDatabases(Database_Control As Control) As Integer
    'Função que seleciona todos os Databases existentes e
    'carrega o controle(Combo ou List Box) passado como parâmetro

    Dim retexec As Integer
    Dim cmdstr As String

    FU_GetDatabases = FAIL
    Database_Control.Clear
    cmdstr = "Select name from master..sysdatabases where name like 'dbn%' "
    cmdstr = cmdstr & "and (name <> 'DBNIO' and name <> 'DBNINIT') order by name"
    If SqlCmd(SqlConn, cmdstr) = FAIL Then Exit Function
    If SqlExec(SqlConn) = FAIL Then Exit Function
    retexec = SqlResults%(SqlConn%)
    Do Until retexec = NOMORERESULTS%
        If retexec = FAIL Then
            Exit Function
        End If
        While SqlNextRow(SqlConn%) <> NOMOREROWS
            Database_Control.AddItem UCase$(SqlData(SqlConn%, 1))
        Wend
        retexec = SqlResults%(SqlConn%)
    Loop
    If TypeOf Database_Control Is ComboBox Then
        Database_Control.Text = Database_Control.List(0)
    End If
    FU_GetDatabases = SUCCEED

End Function

Function FU_SqlSetTime(Par As Integer) As Integer
    
   FU_SqlSetTime = True

End Function

Public Function SqlInit() As String
    Dim objAux As IGerenteConexoes
    Dim NomeExe As String
    Dim TipoDebug As Byte
'    Dim Cont As Byte
    Dim MensagemErro As String

    On Error GoTo Erro_SqlInit
    
1000    SqlInit = ""
'1005    Cont = 0

1010    App.OleRequestPendingTimeout = 2147483647

1020    If objCamada Is Nothing Then

1030        Set objAux = New GerenteConexoes

1039        Set objCamada = objAux

1040        Set VBSQL = New gecoms01

1050        objCamada.setNomeApp (App.EXEName)
1060        objCamada.Inicializa
    
1070        objCamada.setIdioma ("en-US")
    
1080        NomeExe = UCase(Trim(App.EXEName))
            'Truque para corrigir um Bug do VB que retorna
            'o nome do VBP e não do EXE (Mario)
1090        NomeExe = Left(NomeExe, Len(NomeExe) - 2) & "01"

            'Usado para validar processos no Control-M
            'serve para forçar a conexão a um servidor
            'alternativo quando em ambiente de produção
            '0 = PRODUÇÃO -> PRODUÇÃO
            '1 = PRODUÇÃO -> ACEITE
            '2 = PRODUÇÃO -> DESENVOLVIMENTO
            'OBS: Não funciona para aplicativos que se conectam
            'ao servidor usando o nome, usuário e senha
1100        TipoDebug = Val(Le_String_Ini(App.Path & "\" & NomeExe & ".ini", _
                                          NomeExe, "TipoDebug"))

1110        objCamada.setTipoDebug (TipoDebug)
1120        Usuario = objCamada.getUsuario()

1130    End If
    
1140    SqlInit = objCamada.getVersao()
1150    App.OleRequestPendingTimeout = 5000
1160    On Error GoTo 0
1170    Exit Function

Erro_SqlInit:
    MensagemErro = "Erro no SqlInit: " + CStr(Err.Number) + " - " + Err.Description + " - linha: " & Erl
    If Err.Number = 70 Then
'        Cont = Cont + 1
        GravaLog MensagemErro
'        If Cont < 5 Then
'            SU_Sleep 100
'            DoEvents
'            Err.Clear
'            Resume Next
'        End If
    End If
    App.OleRequestPendingTimeout = 5000
    MsgBox MensagemErro
    On Error GoTo 0
End Function

Private Sub SU_Sleep(ByVal dwMilliseconds As Long)
    Sleep ByVal dwMilliseconds
End Sub

Private Sub GravaLog(ByVal Mensagem As String)
    Dim intConfig As Integer
    Dim strContents As String
    Dim intLog As String
    Dim indicadorDebug As Boolean
    Dim diretorioDebug As String
    Dim strUsuario As String
    Dim strComputador As String
    
    On Error GoTo Erro_GravaLog
    
    'Verifica se o debug foi ligado e qual o diretório de envio do arquivo de log
    intConfig = FreeFile
    Open Left(App.Path, 1) + ":\producao\controle\gemosy01.dat" For Input As #intConfig
    While Not EOF(intConfig)
        Line Input #intConfig, strContents
        If Left(strContents, 6) = "Debug=" Then
            indicadorDebug = CBool(Mid(strContents, 7))
        ElseIf Left(strContents, 8) = "Caminho=" Then
            diretorioDebug = Mid(strContents, 9)
            If Right(diretorioDebug, 1) <> "\" Then diretorioDebug = diretorioDebug + "\"
        End If
    Wend
    Close #intConfig

    'Não setar debug
    If Not indicadorDebug Then Exit Sub
    If diretorioDebug = "" Then Exit Sub

    'Grava a log
    If FU_GetUserName(strUsuario, 8) <> 0 Then
        strComputador = Left(FU_GetComputerName() + Space(12), 12)
        intLog = FreeFile
        Open diretorioDebug + strUsuario + ".log" For Append As #intLog
        Print #intLog, Format(Now, "dd/MM/yyyy HH:mm:ss") + " GEMOSY01    " + _
                       strComputador + " " + App.EXEName + " " + Mensagem
        Close #intLog
    End If
    
    Exit Sub
    
Erro_GravaLog:
    Exit Sub
End Sub

Private Function FU_GetUserName(lpBuffer As String, nSize As Long) As Long

Dim lpBuffer_aux As String * 20
    nSize = Len(lpBuffer_aux)
    FU_GetUserName = GetUserName(lpBuffer_aux, nSize)
    lpBuffer = Left$(lpBuffer_aux, nSize - 1)
    
End Function

Private Function FU_GetComputerName() As String
   Dim strBuffer As String * 255

   If GetComputerName(strBuffer, 255&) <> 0 Then
      FU_GetComputerName = Left(strBuffer, InStr(strBuffer, vbNullChar) - 1)
   End If
End Function

Private Function Le_String_Ini(ByVal ArqIni As String, ByVal Sessao As String, ByVal KeyName As String) As String
    'Leitura padrão de um item de um arquivo INI
    'ArqIni  = Nome do arquivo INI a ser consultado
    'Sessao  = Parte do arquivo a ser consultada
    'KeyName = Chave a ser lida
    Dim Conteudo As String
    Dim Tamanho As Long

    Conteudo = Space(256)
    Tamanho = GetPrivateProfileString(Sessao, KeyName, "NULL", Conteudo, 256, ArqIni)

    If Left(Conteudo, 4) = "NULL" Then
        Le_String_Ini = ""
    Else
        Le_String_Ini = Left(Conteudo, Tamanho)
    End If
End Function

Public Function FU_Conecta_Servidor(ByVal ServerID As Integer) As Integer
    Dim servidor As Integer
    
    On Error GoTo Saida_FU_Conecta_Servidor

    If (ServerID < 1) Then Exit Function
    App.OleRequestPendingTimeout = 2147483647
    servidor = CInt(objCamada.Conecta(ServerID))
    If servidor > 0 Then
        ServerName = objCamada.getServidor(servidor)
    End If
    App.OleRequestPendingTimeout = 5000
    FU_Conecta_Servidor = servidor

Saida_FU_Conecta_Servidor:
    App.OleRequestPendingTimeout = 5000
    On Error GoTo 0
End Function

Public Function SqlUse(ByVal SqlConn As Integer, ByVal DBName As String) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlUse = objCamada.setNomeDB(SqlConn, DBName)
    App.OleRequestPendingTimeout = 5000
End Function

Public Sub SqlClose(ByVal SqlConn As Integer)
    App.OleRequestPendingTimeout = 2147483647
    objCamada.FechaConexao (SqlConn)
    App.OleRequestPendingTimeout = 5000
End Sub

Public Function fu_exe_res(ByVal SqlConn As Integer, ByVal Comando As String) As Boolean
    '*** Função que executa  o comando SQL e recebe o primeiro set de resultados
    '*** passado como parâmetro e retorna
    '*** "SUCCEED"" ou "FAIL" dependendo do sucesso da operação
    If SqlSendCmd(SqlConn, Comando) = SUCCEED Then
        fu_exe_res = True
    Else
        fu_exe_res = False
    End If
End Function

Public Function SqlSendCmd(ByVal SqlConn As Integer, ByVal ComandoSQL As String) As Integer
    SqlSendCmd = FAIL
    App.OleRequestPendingTimeout = 2147483647
    If objCamada.PreparaComando(SqlConn, ComandoSQL) = SUCCEED Then
        If objCamada.Executa(SqlConn) = SUCCEED Then
            SqlSendCmd = objCamada.getProximoResultado(SqlConn)
        End If
    End If
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlCmd(ByVal SqlConn As Integer, ByVal ComandoSQL As String) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlCmd = objCamada.PreparaComando(SqlConn, ComandoSQL)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlSend(ByVal SqlConn As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlSend = objCamada.Executa(SqlConn)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SQLRPCInit(ByVal SqlConn As Integer, ByVal StpName As String, ByVal FlagRecompile As Integer, Optional ParametrosOrdenados As Boolean = False) As Integer
    'O parâmetro FlagRecompile não tem um equivalente, será mantido para
    'compatibilidade com as versões anteriores.
    App.OleRequestPendingTimeout = 2147483647
    SQLRPCInit = objCamada.PreparaStoredProcedure(SqlConn, StpName, ParametrosOrdenados)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlExec(ByVal SqlConn As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlExec = objCamada.Executa(SqlConn)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlResults(ByVal SqlConn As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlResults = objCamada.getProximoResultado(SqlConn)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlNextRow(ByVal SqlConn As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlNextRow = objCamada.getProximaLinha(SqlConn)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlData(ByVal SqlConn As Integer, ByVal Column As Integer) As String
    App.OleRequestPendingTimeout = 2147483647
    SqlData = objCamada.getValorColuna(SqlConn, Column)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlNumCols(ByVal SqlConn As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlNumCols = objCamada.getNumeroColunas(SqlConn)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlColName(ByVal SqlConn As Integer, ByVal Column As Integer) As String
    App.OleRequestPendingTimeout = 2147483647
    SqlColName = UCase(objCamada.getNomeColuna(SqlConn, Column))
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlCollen(ByVal SqlConn As Integer, ByVal Column As Integer) As Integer
    'Ignora o erro como o VBSQL (16 bits)
    App.OleRequestPendingTimeout = 2147483647
    SqlCollen = objCamada.getTamanhoColuna(SqlConn, Column)
    App.OleRequestPendingTimeout = 5000
End Function

Private Function TipoVB(ByVal tipo As Integer)
    Select Case tipo
    Case 1
        tipo = SQLCHAR
    Case -2
        tipo = SQLBINARY
    Case -1
        tipo = SQLTEXT
    Case -4
        tipo = SQLIMAGE
    Case -6
        tipo = SQLINT1
    Case 5
        tipo = SQLINT2
    Case 4
        tipo = SQLINT4
    Case 7
        tipo = SQLFLT4
    Case 8
        tipo = SQLFLT8
    Case -7
        tipo = SQLBIT
    Case 93
        tipo = SQLDATETIME
    Case -202
        tipo = SQLDATETIM4
    Case -200
        tipo = SQLMONEY
    Case -201
        tipo = SQLMONEY4
    Case 2
        tipo = SQLNUMERIC
    Case 3
        tipo = SQLDECIMAL
    Case 12
        tipo = SQLVARCHAR
    Case -3
        tipo = SQLVARBINARY
    End Select
    
    TipoVB = tipo
End Function

Public Function SqlColType(ByVal SqlConn As Integer, ByVal Column As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlColType = TipoVB(objCamada.getTipoColuna(SqlConn, Column))
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlDatLen(ByVal SqlConn As Integer, ByVal Column As Integer) As Long
    SqlDatLen = Len(SqlData(SqlConn, Column))
End Function

Public Function SqlCount(ByVal SqlConn As Integer) As Long
    App.OleRequestPendingTimeout = 2147483647
    SqlCount = objCamada.getNumeroLinhas(SqlConn)
    App.OleRequestPendingTimeout = 5000
End Function

Public Sub SqlExit()
    If Not objCamada Is Nothing Then
        App.OleRequestPendingTimeout = 2147483647
        objCamada.Saida
        App.OleRequestPendingTimeout = 5000
    End If
End Sub

Public Sub SqlFreeBuf(ByVal SqlConn As Integer)
    
End Sub

Public Function SqlCanQuery(ByVal SqlConn As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlCanQuery = objCamada.CancelaComando(SqlConn)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlCancel(ByVal SqlConn As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlCancel = objCamada.CancelaComando(SqlConn)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SQLRPCParam(ByVal SqlConn As Integer, ByVal ParamName As String, ByVal FReturn As Integer, ByVal ParamType As Integer, ByVal MaxLen As Integer, ByVal ParamLen As Integer, ByVal ParamValue As Variant, Optional Precisao As Byte = 0, Optional Escala As Byte = 0) As Integer
    Dim TamParam As Long

    SQLRPCParam = FAIL

    Select Case ParamType
        Case SQLCHAR
            ParamType = 1
            If FReturn <> SQLRPCRETURN Then
                TamParam = IIf(ParamLen > 0, ParamLen, Len(ParamValue))
            Else
                TamParam = IIf(MaxLen > 0, MaxLen, 256)
            End If
        Case SQLBINARY
            'Não testado
            ParamType = -2
        Case SQLTEXT
            'Não testado
            ParamType = -1
        Case SQLIMAGE
            'Não testado
            ParamType = -4
        Case SQLINT1
            ParamType = -6
            'SQLINT1: ParamValue = CByte(ParamValue)
        Case SQLINT2
            ParamType = 5
            'SQLINT2: ParamValue = CInt(ParamValue)
        Case SQLINT4
            ParamType = 4
            'SQLINT4: ParamValue = CLng(ParamValue)
        Case SQLFLT4
            ParamType = 7
            'SQLFLT4: ParamValue = CSng(ParamValue)
        Case SQLFLT8
            ParamType = 8
            'SQLFLT8: ParamValue = CDbl(ParamValue)
        Case SQLBIT = 11
            ParamType = -7
            'Não testado
        Case SQLDATETIME
            ParamType = 93
        Case SQLDATETIM4
            ParamType = -202
            'SQLDATETIM4: ParamValue = CVDate(ParamValue)
        Case SQLMONEY
            ParamType = -200
        Case SQLMONEY4
            ParamType = -201
        Case SQLNUMERIC
            ParamType = 2
        Case SQLDECIMAL
            ParamType = 3
        Case SQLVARCHAR
            ParamType = 12
            If FReturn <> SQLRPCRETURN Then
                TamParam = IIf(ParamLen > 0, ParamLen, Len(ParamValue))
            Else
                TamParam = IIf(MaxLen > 0, MaxLen, 256)
            End If
        Case SQLVARBINARY
            'Não testado
            ParamType = -3
        Case Else
            Err.Raise vbObjectError + 100, "SQLRpcParam", "Tipo de Dado não suportado"
            Exit Function
    End Select
    
    If FReturn = SQLRPCRETURN Then
        FReturn = 3 'Input/Output
    Else
        FReturn = 1 'Input
    End If

    App.OleRequestPendingTimeout = 2147483647
    SQLRPCParam = objCamada.CriaParametro(SqlConn, ParamName, ParamType, FReturn, ParamValue, TamParam, Precisao, Escala)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SQLRPCSend(ByVal SqlConn As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SQLRPCSend = objCamada.Executa(SqlConn)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlOk(ByVal SqlConn As Integer) As Integer
    SqlOk = 1
End Function

Public Function SqlNumRets(ByVal SqlConn As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlNumRets = objCamada.getNumeroParametrosOutput(SqlConn)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlRetName(ByVal SqlConn As Integer, ByVal RetNum As Integer) As String
    App.OleRequestPendingTimeout = 2147483647
    SqlRetName = objCamada.getNomeParametroOutput(SqlConn, RetNum)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlRetData(ByVal SqlConn As Integer, ByVal RetNum As Integer) As String
    App.OleRequestPendingTimeout = 2147483647
    SqlRetData = objCamada.getValorParametroOutput(SqlConn, RetNum)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlRetType(ByVal SqlConn As Integer, ByVal RetNum As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    SqlRetType = TipoVB(objCamada.getTipoParametroOutput(SqlConn, RetNum))
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlRetlen(ByVal SqlConn As Integer, ByVal RetNum As Integer) As Long
    App.OleRequestPendingTimeout = 2147483647
    SqlRetlen = objCamada.getTamanhoParametroOutput(SqlConn, RetNum)
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlHasRetStat(ByVal SqlConn As Integer) As Integer
    App.OleRequestPendingTimeout = 2147483647
    If objCamada.hasCodigoRetorno(SqlConn) Then
        SqlHasRetStat = SUCCEED
    Else
        SqlHasRetStat = FAIL
    End If
    App.OleRequestPendingTimeout = 5000
End Function

Public Function SqlRetStatus(ByVal SqlConn As Integer) As Long
    If Not objCamada Is Nothing Then
        If SqlHasRetStat(SqlConn) = SUCCEED Then
            App.OleRequestPendingTimeout = 2147483647
            SqlRetStatus = objCamada.getCodigoRetorno(SqlConn)
            App.OleRequestPendingTimeout = 5000
        End If
    End If
End Function

Public Function SqlDead(ByVal SqlConn As Integer) As Integer
    If objCamada Is Nothing Then
        SqlDead = SUCCEED
    Else
        App.OleRequestPendingTimeout = 2147483647
        If objCamada.getEstado(SqlConn) = 0 Then ' State Closed = 0
            SqlDead = SUCCEED
        Else
            SqlDead = FAIL
        End If
        App.OleRequestPendingTimeout = 5000
    End If
End Function

Public Sub SqlWinExit()
    If Not objCamada Is Nothing Then
        App.OleRequestPendingTimeout = 2147483647
        objCamada.Finaliza
        Set objCamada = Nothing
        App.OleRequestPendingTimeout = 5000
    End If
End Sub

Public Function fu_data_servidor(ByVal SqlConn As Integer, ByVal Formato As String) As String

    '** Retorna data e hora do servidor SYBASE
    '** Recebe parâmetro para informar o formato da data
    '** Caso o parâmetro seja nulo("") retorna a data no
    '** formato original.
    '** Autor : Marcelo
    '** Data : 23/12/1993
    '** Ex: Data_Serv$ = FU_Data_Servidor("mm/dd/yyyy hh:mm")
    '
    Dim Retdata As String
    Dim ret_results As Integer
    Dim ErrorStr As String

    ret_results = SqlSendCmd(SqlConn, "select getdate()")
    Do Until ret_results = NOMORERESULTS
        If ret_results = FAIL Then
            fu_data_servidor = ""
            Exit Function
        End If
        Do Until SqlNextRow(SqlConn) = NOMOREROWS
            Retdata = SqlData(SqlConn, 1)
        Loop
        ret_results = SqlResults(SqlConn)
    Loop

    Retdata = Left(Retdata, Len(Retdata) - 6) & Right(Retdata, 2)

    If Formato = "" Then
        fu_data_servidor = Retdata
    Else
        fu_data_servidor = Format(Retdata, Formato)
    End If

End Function

Public Function FU_Data_Servidor_Datetime(ByVal SqlConn As Integer) As String
    '** Retorna data e hora do servidor SYBASE no formato DATETIME (MMM DD YYYY HH:MM:SS:MMMAM)
    '** Autor : Alexandre
    '** Data : 26/05/1994
    '** Ex: Data_Serv$ = FU_Data_Servidor_Datetime()

    Dim Retdata As String
    Dim ret_results As Integer

    ret_results = SqlSendCmd(SqlConn, "select getdate()")
    Do Until ret_results = NOMORERESULTS
        If ret_results = FAIL Then Exit Function
        Do Until SqlNextRow(SqlConn) = NOMOREROWS
            Retdata = SqlData(SqlConn, 1)
        Loop
        ret_results = SqlResults(SqlConn)
    Loop
    FU_Data_Servidor_Datetime = Retdata

End Function

Public Function FU_Get_Ambiente() As String
    'Retorna o ambiente atual de execução:
    'DES : Desenvolvimento
    'ACT : Aceite
    'PRD : Produção
    App.OleRequestPendingTimeout = 2147483647
    FU_Get_Ambiente = objCamada.getAmbiente()
    App.OleRequestPendingTimeout = 5000
End Function

Public Function FU_Parametro(ByVal SqlConn As Integer, ByVal ParamName As String, ByVal Valor As Variant, ByVal tipo As Integer, Optional ByVal MaxLen As Integer = 0, Optional ByVal DataLen As Integer = 0, Optional ByVal Precisao As Byte = 0, Optional ByVal Escala As Byte = 0) As Integer
    FU_Parametro = SQLRPCParam(SqlConn, ParamName, Not SQLRPCRETURN, tipo, MaxLen, DataLen, CStr(Valor), Precisao, Escala)
End Function

Public Function FU_Parametro_Ret(ByVal SqlConn As Integer, ByVal ParamName As String, ByVal Valor As Variant, ByVal tipo As Integer, Optional ByVal MaxLen As Integer = 0, Optional ByVal DataLen As Integer = 0, Optional ByVal Precisao As Byte = 0, Optional ByVal Escala As Byte = 0) As Integer
    FU_Parametro_Ret = SQLRPCParam(SqlConn, ParamName, SQLRPCRETURN, tipo, MaxLen, DataLen, CStr(Valor), Precisao, Escala)
End Function

Public Function SqlDataReady(ByVal SqlConn As Integer) As Integer
    SqlDataReady = 1
    Me.VBSQL.objEventoZe.AbcZE = 1 'ZE
    VBSQL.objEventoZe.AbcZE = 1 'ZE
    objEventoZe.AbcZE = 1 'ZE
    
    
End Function


