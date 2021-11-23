VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "PEGFNZ01"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' ===================================================
' COMENTARIO SOX
' NOME : PEGFNZ01.CLS
' VERSAO : 2
' ===================================================
Option Explicit

Private cargaRealizada              As Boolean
Private codigoErro                  As Long
Private textoErro                   As String
Private indiceFonetico(1 To 6)      As String
Private textoNormalizado            As String
Private versaoTabelas               As String

Private Const ArqVersao = "C:\ApoioDes\Fonet\FONETVER.TXT"
Private Const ArqAntes = "C:\ApoioDes\Fonet\FONETANT.TXT"
Private Const ArqDepois = "C:\ApoioDes\Fonet\FONETDEP.TXT"

Private Declare Function Fonetiza Lib "C:\ApoioDes\Fonet\FONET32.DLL" Alias "f1" (ByVal Str1 As String, ByVal Str2 As String, ByVal Str3 As String, ByVal Tipo As Integer) As Integer
Private Declare Function FonTab Lib "C:\ApoioDes\Fonet\FONET32.DLL" Alias "TAB" (ByVal Str1 As String, ByVal Str2 As String, ByVal Str3 As String) As Integer
Private Declare Function FonNorm Lib "C:\ApoioDes\Fonet\FONET32.DLL" Alias "NORM" (ByVal StrNorm As String, ByVal StrIn As String, ByVal Tipo As Integer) As Integer

Private Function montarArrayRetornoFonetico(codigoFoneticoPrincipal As String, codigoFoneticoAlternativo As String) As Boolean

    On Error GoTo ErroArrayRetorno
    
    montarArrayRetornoFonetico = False
    
    indiceFonetico(1) = ""
    indiceFonetico(2) = ""
    indiceFonetico(3) = ""
    indiceFonetico(4) = ""
    indiceFonetico(5) = ""
    indiceFonetico(6) = ""
    
    'Quebra a palavra fonetizada em 15 posições cada
    indiceFonetico(1) = Mid$(codigoFoneticoPrincipal, 1, 15)
    indiceFonetico(2) = Mid$(codigoFoneticoPrincipal, 17, 15)
    indiceFonetico(3) = Mid$(codigoFoneticoPrincipal, 33, 15)
         
    If Trim$(indiceFonetico(2)) = "" Then
        indiceFonetico(2) = indiceFonetico(1)
        indiceFonetico(3) = indiceFonetico(1)
    End If
        
    'Se a palavra não possui índice alternativo
    If Trim$(UCase$(Left$(codigoFoneticoAlternativo, 21))) = "**NAO TEM ALTERNADO**" Then
        indiceFonetico(4) = ""
        indiceFonetico(5) = ""
        indiceFonetico(6) = ""
        montarArrayRetornoFonetico = True
        Exit Function
    End If

    'Quebra a palavra fonetizada alternativa em 15 posições cada
    indiceFonetico(4) = Mid$(codigoFoneticoAlternativo, 1, 15)
    indiceFonetico(5) = Mid$(codigoFoneticoAlternativo, 17, 15)
    indiceFonetico(6) = Mid$(codigoFoneticoAlternativo, 33, 15)

    If Trim$(indiceFonetico(5)) = "" Then
        indiceFonetico(5) = indiceFonetico(4)
        indiceFonetico(6) = indiceFonetico(4)
    End If

    montarArrayRetornoFonetico = True
    
    Exit Function
    
ErroArrayRetorno:
    
    setcodigoErro = 1012
    settextoErro = "Erro: montarArrayRetornoFonetico- " & Str$(Err.Number) & " / " & Err.Description
    Exit Function

End Function

Public Function obterIndiceFonetico(Texto As String, regraFonetizacao As Integer) As Integer
    'O array de retorno será formado por cinco índices fonéticos:
    
    Dim codigoFoneticoPrincipal   As String * 255
    Dim codigoFoneticoAlternativo As String * 255
    Dim ret                       As Integer
    
    On Error GoTo ErroIndiceFonetico
    
    codigoFoneticoPrincipal = ""
    codigoFoneticoAlternativo = ""
    setcodigoErro = 0
    
    obterIndiceFonetico = getcodigoErro
    
    If Not obterVersaoTabelasAuxiliares(ArqVersao) Then
        setcodigoErro = 1001
        settextoErro = "Não foi possível obter a versão atual dos arquivos de carga de tabelas auxiliares." & "  " & gettextoErro
        obterIndiceFonetico = getcodigoErro
        Exit Function
    End If
    
    If getcargaRealizada = False Then
        ret = executarCargaTabela(ArqAntes, ArqDepois, getversaoTabelas)
        If ret <> 999 Then
            setcodigoErro = 1011
            settextoErro = "Não foi possível efetuar a carga de tabelas auxiliares. " & gettextoErro
            obterIndiceFonetico = getcodigoErro
            Exit Function
        End If
        setcargaRealizada = True
    End If

    ret = executarFonetizacao(codigoFoneticoPrincipal, RTrim$(Texto$), codigoFoneticoAlternativo, regraFonetizacao%)
    If ret = 0 Then
        setcodigoErro = 1002
        settextoErro = "Erro na fonetização da palavra - " & Trim(Texto$)
        obterIndiceFonetico = getcodigoErro
        Exit Function
    End If
    
    If Not montarArrayRetornoFonetico(codigoFoneticoPrincipal, codigoFoneticoAlternativo) Then
        setcodigoErro = 1003
        settextoErro = "Erro ao montar o retorno fonético!"
        obterIndiceFonetico = getcodigoErro
        Exit Function
    End If
    
    obterIndiceFonetico = getcodigoErro
    
    Exit Function
        
ErroIndiceFonetico:
    
    setcodigoErro = 1011
    settextoErro = "Erro: obterIndiceFonetico - " & Str$(Err.Number) & " / " & Err.Description
    Exit Function

End Function

Private Function obterVersaoTabelasAuxiliares(enderecoTabelasAuxiliares As String) As Boolean
    'Path da rede onde deverá estar os arquivos das tabelas auxiliares.

    Dim NroArq      As Integer
    Dim Char        As String * 1
    Dim versao      As String
    Dim versaoAnt   As String
    Dim nLen        As Integer
    Dim cont        As Integer

    obterVersaoTabelasAuxiliares = False

    NroArq% = FreeFile
    On Error GoTo ErroArq
    
    'ChDrive Environ("DRVPROD")
    
    'ChDir Environ("DRVPROD") + "\PROD\PGMS"
    
    Open enderecoTabelasAuxiliares For Input Access Read Shared As NroArq%
    
    If NroArq% = 0 Then Exit Function

    Do While Not EOF(NroArq%)
        Char$ = Input(1, NroArq%)
        If Char$ <> Chr$(10) Or Char$ <> Chr$(13) Then
            versao$ = versao$ + Char
        End If
    Loop

    Close NroArq%
    
    If Trim(getversaoTabelas) <> Trim(versao) Then
        setcargaRealizada = False
    End If
    
    setversaoTabelas = Trim$(versao)
    
    obterVersaoTabelasAuxiliares = True
    
    Exit Function

ErroArq:
    NroArq% = 0

    setcodigoErro = 1004
    settextoErro = "Erro " & Str$(Err) & " " & Err.Description & "  no arquivo de versão da fonetização. Arquivo: " & ArqVersao
    Exit Function
    
End Function

Public Function obterTextoNormalizado(Texto As String, regraFonetizacao As Integer) As Integer
    
    'regraFonetizacao:
    '1- Pessoa Física
    '2- Pessoa Jurídica
    '3- Endereço
    
    Dim VersaoTabelasAuxiliares     As String
    Dim ret                         As Integer
    
    On Error GoTo ErroTextoNormalizado
        
    textoNormalizado = ""
    setcodigoErro = 0
    
    obterTextoNormalizado = getcodigoErro

    If Not obterVersaoTabelasAuxiliares(ArqVersao) Then
        setcodigoErro = 1005
        settextoErro = "Não foi possível obter a versão atual dos arquivos de carga de tabelas auxiliares."
        obterTextoNormalizado = getcodigoErro
        Exit Function
    End If
    
    If getcargaRealizada = False Then

        ret = executarCargaTabela(ArqAntes, ArqDepois, getversaoTabelas)
        If ret <> 999 Then
            setcodigoErro = 1011
            settextoErro = "Não foi possível efetuar a carga de tabelas auxiliares." & gettextoErro
            obterTextoNormalizado = getcodigoErro
            Exit Function
        End If
        setcargaRealizada = True
        
    End If

    ret = executarNormalizacao(textoNormalizado, Texto, regraFonetizacao)

    If ret <> 1 Then
        setcodigoErro = 1006
        settextoErro = "Não foi possível efetuar a normalização do texto: " & Trim(Texto)
        obterTextoNormalizado = getcodigoErro
        Exit Function
    End If

    obterTextoNormalizado = getcodigoErro
    
    Exit Function

ErroTextoNormalizado:
    
    setcodigoErro = 1010
    settextoErro = "Erro: obterTextoNormalizado - " & Str$(Err.Number) & " / " & Err.Description
    Exit Function

End Function

Private Function executarFonetizacao(Str1 As String, Str2 As String, Str3 As String, ByVal Tipo As Integer) As Integer
    
    Dim aux_Str1 As String * 255
    Dim aux_Str2 As String * 255
    Dim aux_Str3 As String * 255

    On Error GoTo ErroFonetizacao

    aux_Str1 = Str1
    aux_Str2 = Str2
    aux_Str3 = Str3
    executarFonetizacao = Fonetiza(aux_Str1, aux_Str2, aux_Str3, Tipo)
    Str1 = aux_Str1
    Str2 = aux_Str2
    Str3 = aux_Str3

    Exit Function
    
ErroFonetizacao:
    
    setcodigoErro = 1007
    settextoErro = "Erro: executarFonetizacao - " & Str$(Err.Number) & " / " & Err.Description
    Exit Function

End Function

Private Function executarNormalizacao(Str1 As String, Str2 As String, ByVal Tipo As Integer) As Integer
    
    Dim aux_Str1 As String * 255
    Dim aux_Str2 As String * 255
    
    On Error GoTo ErroNormalizacao

    aux_Str1 = Str1
    aux_Str2 = Str2
    executarNormalizacao = FonNorm(aux_Str1, aux_Str2, Tipo)
    Str1 = aux_Str1
    Str2 = aux_Str2
    
    Exit Function

ErroNormalizacao:
    
    setcodigoErro = 1008
    settextoErro = "Erro: executarNormalizacao - " & Str$(Err.Number) & " / " & Err.Description
    Exit Function

End Function

Private Function executarCargaTabela(Str1 As String, Str2 As String, Str3 As String) As Integer
    
    Dim aux_Str1 As String * 255
    Dim aux_Str2 As String * 255
    Dim aux_Str3 As String * 255

    On Error GoTo ErroCargaTabela
    
    aux_Str1 = Str1
    aux_Str2 = Str2
    aux_Str3 = Str3
    executarCargaTabela = FonTab(aux_Str1$, aux_Str2$, aux_Str3$)
    Str1 = aux_Str1
    Str2 = aux_Str2
    
    Exit Function

ErroCargaTabela:
    
    setcodigoErro = 1009
    settextoErro = "Erro:  executarCargaTabela - " & Str$(Err.Number) & " / " & Err.Description
    Exit Function

End Function

Public Property Get getcodigoErro() As Long
    getcodigoErro = codigoErro
End Property

Public Property Get gettextoErro() As String
    gettextoErro = textoErro
End Property

Private Property Get getcargaRealizada()
    getcargaRealizada = cargaRealizada
End Property

Public Property Get getindiceFonetico(Valor As Integer) As String
    If Valor >= 1 And Valor <= 6 Then
        getindiceFonetico = indiceFonetico(Valor)
    End If
End Property

Public Property Get gettextoNormalizado() As String
    gettextoNormalizado = textoNormalizado
End Property

Private Property Get getversaoTabelas() As String
    getversaoTabelas = versaoTabelas
End Property

Private Property Let setcargaRealizada(Valor As Boolean)
    'Atribue True para o atributo cargaRealizada.
    cargaRealizada = Valor
End Property

Private Property Let setcodigoErro(Valor As Long)
    codigoErro = Valor
End Property

Private Property Let settextoErro(Valor As String)
    textoErro = Valor
End Property

Private Property Let setversaoTabelas(Valor As String)
    versaoTabelas = Valor
End Property
