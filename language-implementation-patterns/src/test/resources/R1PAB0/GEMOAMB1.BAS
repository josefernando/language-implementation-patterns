Attribute VB_Name = "GEMOAMB1"
' ===================================================
' COMENTARIO SOX
' NOME : GEMOAMB1.BAS
' VERSAO : 1
' ===================================================
Option Explicit
' ==================================================================
' Observações:
' ************
' Antigo GEMAMB01.BAS proveniente do WIN95/CONVESOR
'
' ------------------------------------------------------------------
' Dependencias:
'       Componente:
'       Modulos:
' ==================================================================


' Reg Key Security Options...
Private Const KEY_ALL_ACCESS = &H2003F
                                          
' Reg Key ROOT Types...
Private Const HKEY_LOCAL_MACHINE = &H80000002
Private Const ERROR_SUCCESS = 0
Private Const REG_SZ = 1                         ' Unicode nul terminated string
Private Const REG_DWORD = 4                      ' 32-bit number

'Utilizados pelas funções de registro
Private Const KEY_QUERY_VALUE = &H1&
Private Const KEY_SET_VALUE = &H2&
Private Const KEY_CREATE_SUB_KEY = &H4&
Private Const KEY_ENUMERATE_SUB_KEYS = &H8&
Private Const KEY_NOTIFY = &H10&
Private Const READ_CONTROL = &H20000
Private Const STANDARD_RIGHTS_READ = READ_CONTROL
Private Const STANDARD_RIGHTS_WRITE = READ_CONTROL
Private Const KEY_READ = STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY
Private Const KEY_WRITE = STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY
Private Const KEY_EXECUTE = KEY_READ

'Localização das chaves no registro
Private Const REGPATHDIR = "Software\Itau Seguros\ApoioDes\GemAmb"
Private Const REGVALDIR = "DiretorioUsuario"
Private Const HKAppPaths = "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths"

Private Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long

' seleciona o usuario
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long

Public Function FU_Diretorio_Usuario() As String
       
    Dim diretorio As String
    Dim racf As String

    Dim objFso      As Variant
    Dim objFolder   As Variant
    
    On Error GoTo Erro_FU_Diretorio_Usuario
    
5   Set objFso = CreateObject("Scripting.FileSystemObject")
    
10  If GetKeyValue(HKEY_LOCAL_MACHINE, REGPATHDIR, REGVALDIR, diretorio) Then
20      If LCase(Right(diretorio, 5)) = "@racf" <> 0 Then
30          If FU_GetUserName(racf, 8) = 0 Then
40              Err.Raise "Erro na obtenção do RACF do usuário."
50              Exit Function
60          End If
70          diretorio = Left(diretorio, Len(diretorio) - 5) + Trim(racf)
71      ElseIf LCase(Right(diretorio, 5)) = "@temp" <> 0 Then
72          diretorio = Environ("APPDATA")
73          Set objFolder = objFso.GetFolder(diretorio)
74          diretorio = objFolder.shortpath
80      End If
90      FU_Diretorio_Usuario = diretorio
100 Else
110     FU_Diretorio_Usuario = "c:\user"
120 End If

130 Exit Function

Erro_FU_Diretorio_Usuario:
    MsgBox "Erro na obtenção do diretório do usuário: " & Err.Number & " - " & Err.Description & ". Linha: " & Erl
    Exit Function
End Function
Private Function GetKeyValue(KeyRoot As Long, KeyName As String, SubKeyRef As String, ByRef KeyVal As String) As Boolean
'******************************************************'
' Lê valor no registro do Windows                      '
' Retorno: True ou False                               '
'******************************************************'
    
    On Error GoTo GetKeyError:
        
        Dim i As Long                                           ' Loop Counter
        Dim rc As Long                                          ' Return Code
        Dim hKey As Long                                        ' Handle To An Open Registry Key
        Dim hDepth As Long                                      '
        Dim KeyValType As Long                                  ' Data Type Of A Registry Key
        Dim tmpVal As String                                    ' Tempory Storage For A Registry Key Value
        Dim KeyValSize As Long                                  ' Size Of Registry Key Variable
        '-----------------------------------------------------------
        ' Open RegKey Under KeyRoot {HKEY_LOCAL_MACHINE...}
        '-----------------------------------------------------------
        rc = RegOpenKeyEx(KeyRoot, KeyName, 0, KEY_READ, hKey) ' Open Registry Key
        

        If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' Handle Error...
        

        tmpVal = String$(1024, 0)                             ' Allocate Variable Space
        KeyValSize = 1024                                       ' Mark Variable Size
        

        '-----------------------------------------------------------
        ' Retrieve Registry Key Value...
        '-----------------------------------------------------------
        rc = RegQueryValueEx(hKey, SubKeyRef, 0, KeyValType, tmpVal, KeyValSize)    ' Get/Create Key Value
                                                

        If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' Handle Errors
        

        If (Asc(Mid(tmpVal, KeyValSize, 1)) = 0) Then           ' Win95 Adds Null Terminated String...
                tmpVal = Left(tmpVal, KeyValSize - 1)               ' Null Found, Extract From String
        Else                                                    ' WinNT Does NOT Null Terminate String...
                tmpVal = Left(tmpVal, KeyValSize)                   ' Null Not Found, Extract String Only
        End If
        '-----------------------------------------------------------
        ' Determine Key Value Type For Conversion...
        '-----------------------------------------------------------
        Select Case KeyValType                                  ' Search Data Types...
        Case REG_SZ                                             ' String Registry Key Data Type
                KeyVal = tmpVal                                     ' Copy String Value
        Case REG_DWORD                                          ' Double Word Registry Key Data Type
                For i = Len(tmpVal) To 1 Step -1                    ' Convert Each Bit
                        KeyVal = KeyVal + Hex(Asc(Mid(tmpVal, i, 1)))   ' Build Value Char. By Char.
                Next
                KeyVal = Format$("&h" + KeyVal)                     ' Convert Double Word To String
        End Select
        

        GetKeyValue = True                                      ' Return Success
        rc = RegCloseKey(hKey)                                  ' Close Registry Key
        Exit Function                                           ' Exit
        

GetKeyError:    ' Cleanup After An Error Has Occured...
        
        KeyVal = ""                                             ' Set Return Val To Empty String
        GetKeyValue = False                                     ' Return Failure
        rc = RegCloseKey(hKey)                                  ' Close Registry Key

End Function

Private Function FU_GetUserName(lpBuffer As String, nSize As Long) As Long

Dim lpBuffer_aux As String * 20
    nSize = Len(lpBuffer_aux)
    FU_GetUserName = GetUserName(lpBuffer_aux, nSize)
    lpBuffer = Left$(lpBuffer_aux, nSize - 1)
    
End Function


Public Function FU_Diretorio_Aplicativo(nAplicativo As String, Optional nChave As String) As String
'Objetivo: Retornar o caminho (diretório de instalação) da aplicação de terceiros.
'Homologada essencialmente para Word, Excel, Access, Acrobat Reader
'   (para outros aplicativos consulte a área de Apoio ao Desenvolvimento)
'
'Parametros de Entrada:
'   NAPLICATIVO = nome do executável (com a extensão) do aplicativo que deverá ter o
'                 caminho descoberto.
'
'   [NCHAVE] = parametro opcional que deverá ser passado caso seja necessário retornar
'              algum outro tipo de informação.
'              Valor válido para este parametro = 'path'
'              ==> OBS.: Na maioria dos aplicativos (inclusive Word, Excel e Access - ou
'              seja os mais utilizados). Se for passado somente o parametro nAplicativo,
'              será retornado o caminho (com o nome do diretório curto) e no caso de ser
'              passado também o parametro nChave o retorno será o caminho (com o nome do
'              diretório longo) do executável.
'
'Exemplo1:
'   FU_Diretorio_Aplicativo("excel.exe")
'   ==> Retorna: "C:\ARQUIV~1\MICROS~4\Office10\"
'
'Exemplo2:
'   FU_Diretorio_Aplicativo("excel.exe","path")
'   ==> Retorna: "C:\Arquivos de programas\Microsoft Office\Office10\"

    Dim VL_strDiretorio     As String
    Dim VL_intPosBarra      As Integer
    Dim VL_intPosBarraAux   As Integer
    

    On Error GoTo ERRO_FU_Diretorio_Aplicativo
    
10  GetKeyValue HKEY_LOCAL_MACHINE, HKAppPaths & "\" & nAplicativo, nChave, VL_strDiretorio
20  If Right(UCase(VL_strDiretorio), 4) = ".EXE" Then
30      VL_intPosBarra = InStr(1, VL_strDiretorio, "\")
40      Do While VL_intPosBarra <> 0
50          VL_intPosBarraAux = VL_intPosBarra
60          VL_intPosBarra = VL_intPosBarra + 1
70          VL_intPosBarra = InStr(VL_intPosBarra, VL_strDiretorio, "\")
80      Loop
90      VL_strDiretorio = Left(VL_strDiretorio, VL_intPosBarraAux)
100 End If
    
110 If Right(VL_strDiretorio, 1) <> "\" And Len(VL_strDiretorio) <> 0 Then
120     VL_strDiretorio = VL_strDiretorio & "\"
130 End If

140 FU_Diretorio_Aplicativo = VL_strDiretorio

150 Exit Function

ERRO_FU_Diretorio_Aplicativo:
       MsgBox "Erro na obtenção do diretório do aplicativo : " & nAplicativo & "-" & Err.Number & " - " & Err.Description & ". Linha: " & Erl
       Exit Function

End Function


