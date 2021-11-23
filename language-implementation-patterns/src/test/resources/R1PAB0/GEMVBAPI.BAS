Attribute VB_Name = "GEMVBAPI"
Option Explicit
'****************************************************************************************************
'HISTORICO
'28/03/2005 - Marcio -  Inclusao da chamada da API StretchBlt. (utilizada para tratamento de imagens).
'                       Foi incluida para ser colocada no lugar da API BitBlt, que apresentava o seguinte
'                                                                       erro: ela nao estava conseguindo enviar o todo o conteudo do form para um
'                          picturebox quando era executada via TS.
'****************************************************************************************************

Global Const OSAmbiente = "Windows 95"

' Reg Key Security Options...
Const KEY_ALL_ACCESS = &H2003F
                                          
' Reg Key ROOT Types...
Const HKEY_LOCAL_MACHINE = &H80000002
Const ERROR_SUCCESS = 0
Const REG_SZ = 1                         ' Unicode nul terminated string
Const REG_DWORD = 4                      ' 32-bit number

'Utilizados pelas funções de registro
Const KEY_QUERY_VALUE = &H1&
Const KEY_SET_VALUE = &H2&
Const KEY_CREATE_SUB_KEY = &H4&
Const KEY_ENUMERATE_SUB_KEYS = &H8&
Const KEY_NOTIFY = &H10&
Const READ_CONTROL = &H20000
Const STANDARD_RIGHTS_READ = READ_CONTROL
Const STANDARD_RIGHTS_WRITE = READ_CONTROL
Const KEY_READ = STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY
Const KEY_WRITE = STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY
Const KEY_EXECUTE = KEY_READ


'Utilizados pela função Fu_GetRI
Const gREGPATHRI = "System\CurrentControlSet\Control\ComputerName\ComputerName"
Const gREGVALRI = "ComputerName"

Private Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function Escape Lib "gdi32" (ByVal hdc As Long, ByVal nEscape As Long, ByVal nCount As Long, ByVal lpInData As String, lpOutData As Any) As Long

Global Const MinEnableFalse% = 1
Global Const NormalEnableFalse% = 2
Global Const FormularioHide% = 3

Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
Private Const STILL_ACTIVE& = &H103
Private Declare Function WaitForInputIdle Lib "user32" (ByVal hProcess As Long, ByVal dwMilliseconds As Long) As Long

'as API´s abaixo estão sendo usadas no VB3 e não existe no VB5
'GetModuleUsage
'Declare Function GetWindowTask Lib "User" (ByVal hWnd As Integer) As Integer
'Declare Function TaskFirst Lib "toolhelp.dll" (lpte As TASKENTRY) As Integer
'Declare Function TaskNext Lib "toolhelp.dll" (lpte As TASKENTRY) As Integer
'Declare Function OSWritePrivateProfileString% Lib "Kernel" (ByVal AppName$, ByVal KeyName$, ByVal keydefault$, ByVal FileName$)

Public Type TASKENTRY
    dwSize As Long
    htask As Integer
    hTaskParent As Integer
    hinst As Integer
    hModule As Integer
    wSS As Integer
    wSP As Integer
    wStackTop As Integer
    wStackMinimum As Integer
    wStackBottom As Integer
    wcEvents As Integer
    hQueue As Integer
    szModule As String * 10
    wPSPOffset As Integer
    hNext As Integer
End Type


Private Declare Function FlashWindow Lib "user32" (ByVal hwnd As Long, ByVal bInvert As Long) As Long

Private Declare Function IsChild Lib "user32" (ByVal hWndParent As Long, ByVal hwnd As Long) As Long
Private Declare Function WindowFromPoint Lib "user32" (ByVal xPoint As Long, ByVal yPoint As Long) As Long

Private Declare Function CharToOem Lib "user32" Alias "CharToOemA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long

Public Const GETSETPRINTORIENT = 30
Public Const PORTRAIT% = 1
Public Const LANDSCAPE% = 2
Public Const QUAL% = 3
Public Const GRAY& = &HEFEFEF

Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

'Declaração de constantes utilizadas pelas API's exclusivas de 32 bits
Public Const NORMAL_PRIORITY_CLASS = &H20&
Public Const INFINITE = -1&
Private proc As PROCESS_INFORMATION

'Declaração de TYPEs utilizadas pelas API's exclusivas de 32 bits
Public Type STARTUPINFO
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
Public Type PROCESS_INFORMATION
   hProcess As Long
   hThread As Long
   dwProcessID As Long
   dwThreadID As Long
End Type

Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Private Declare Function CreateProcessA Lib "kernel32" (ByVal lpApplicationName As Long, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long

Private Declare Function SetActiveWindow Lib "user32" (ByVal hwnd As Long) As Long

' sendmessage - posiciona item da lista ou combo
Public Const CB_SELECTSTRING = &H14D
Public Const EM_LIMITTEXT = &HC5
Public Const EM_SETREADONLY = &HCF
Public Const LB_SETHORIZONTALEXTENT = &H194
Public Const LB_SELECTSTRING = &H18C
Public Const LB_FINDSTRING = &H18F
Public Const WM_USER = &H400
Public Const HWND_BROADCAST = &HFFFF
Public Const WM_WININICHANGE = &H1A
Public Const CB_SHOWDROPDOWN = &H14F
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, LParam As Any) As Long

' seleciona o usuario
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long

' mostra um arquivo help

Public Const HELP_CONTEXT = &H1          '  Display topic in ulTopic
Public Const HELP_INDEX = &H3            '  Display index
Public Const HELP_KEY = &H101            '  Display topic for keyword in offabData
Public Const HELP_MULTIKEY = &H201&
Public Const HELP_QUIT = &H2             '  Terminate help
Public Const HELP_SETINDEX = &H5         '  Set current Index for multi index help
Public Const HELP_HELPONHELP = &H4       '  Display help on using help

Private Declare Function WinHelp Lib "user32" Alias "WinHelpA" (ByVal hwnd As Long, ByVal lpHelpFile As String, ByVal wCommand As Long, ByVal dwData As Long) As Long
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

' atacha um servidor netware
Public Type NETRESOURCE
        dwScope As Long
        dwType As Long
        dwDisplayType As Long
        dwUsage As Long
        lpLocalName As String
        lpRemoteName As String
        lpComment As String
        lpProvider As String
End Type

'Função de identificação do tipo de drive
Private Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long

'Retorna informação sobre conexões existentes com servidores netware
Private Declare Function WNetGetConnection Lib "mpr.dll" Alias "WNetGetConnectionA" (ByVal lpszLocalName As String, ByVal lpszRemoteName As String, cbRemoteName As Long) As Long

' abre uma arquivo
Public nErrCode As Integer
Public Const OF_CREATE = &H1000
Public Const OF_READ = &H0
Public Const OF_DELETE = &H200
Public Const OFS_MAXPATHNAME = 128
Public Type OFSTRUCT
        cBytes As Byte
        fFixedDisk As Byte
        nErrCode As Integer
        Reserved1 As Integer
        Reserved2 As Integer
        szPathName(OFS_MAXPATHNAME) As Byte
End Type

' traz o handle de uma janela, dado sua classe e título
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long

' executa linha de comando no windows
Private Declare Function WinExec Lib "kernel32" (ByVal lpCmdLine As String, ByVal nCmdShow As Integer) As Integer

' determina a proxima janela
Public Const GW_HWNDNEXT = 2

' Controla a aparência de uma janela, ou a esconde
Public Const SW_HIDE = 0
Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long

' Determina se uma janela está visível
Private Declare Function IsWindowVisible Lib "user32" (ByVal hwnd As Long) As Long

' rebuta o windows
Public Const EW_REBOOTSYSTEM = &H43

Public Const SW_SHOWNORMAL = 1
Public Const SW_SHOWNA = 8
Public Const SW_RESTORE = 9
Public Const GW_OWNER = 4

Private Declare Function GetKeyboardState Lib "user32" (pbKeyState As Byte) As Long
Private Declare Function GetSystemWindowsDirectory Lib "kernel32.dll" Alias "GetSystemWindowsDirectoryA" (ByVal lpBuffer As String, ByVal uSize As Long) As Long
Private Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Private Declare Function GetActiveWindow Lib "user32" () As Long
Private Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Public Type lRECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type
Public TwipsPerPixel As Single
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function ReleaseDC Lib "user32" (ByVal hwnd As Long, ByVal hdc As Long) As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal hwnd As Long, lpRect As lRECT) As Long
Public Type POINTAPI
        X As Long
        Y As Long
End Type
Private Declare Function IsWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function SetFocus Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function AbortDoc Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function EnableWindow Lib "user32" (ByVal hwnd As Long, ByVal fEnable As Long) As Long
Public Const SC_SIZE = &HF000
Public Const SC_MOVE = &HF010
Public Const SC_RESTORE = &HF120
Public Const MF_BYCOMMAND = &H0&
Private Declare Function GetSystemMenu Lib "user32" (ByVal hwnd As Long, ByVal bRevert As Long) As Long
Private Declare Function DeleteMenu Lib "user32" (ByVal hMenu As Long, ByVal nPosition As Long, ByVal wFlags As Long) As Long
Private Declare Function Rectangle Lib "gdi32" (ByVal hdc As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long) As Long
Private Declare Function GetDiskFreeSpace Lib "kernel32" Alias "GetDiskFreeSpaceA" (ByVal lpRootPathName As String, lpSectoRPTerCluster As Long, lpBytesPerSector As Long, lpNumberOfFreeClusters As Long, lpTtoalNumberOfClusters As Long) As Long
Private Declare Function EnumWindows Lib "user32" (ByVal wndenmprc As Long, ByVal LParam As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long

Private Declare Function SetParent Lib "user32" (ByVal hWndChild As Long, ByVal hWndNewParent As Long) As Long
Private Declare Function MoveWindow Lib "user32" (ByVal hwnd As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As Long) As Long

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (VersionInfo As OSVERSIONINFOEX) As Long
    
Public Type OSVERSIONINFOEX
    dwOSVersionInfoSize As Long
    dwMajorVersion As Long
    dwMinorVersion As Long
    dwBuildNumber As Long
    dwPlatformId As Long
    szCSDVersion As String * 128
    wServicePackMajor As Integer
    wServicePackMinor As Integer
    wSuiteMask As Integer
    bProductType As Byte
    bReserved As Byte
End Type
Private Const OSVERSIONINFOSIZE = 148
Private Const VK_NUMLOCK = &H90
Private Const VER_PLATFORM_WIN32_NT = 2
Private Const VER_PLATFORM_WIN32_WINDOWS = 1

Private Declare Function GetNetworkParams Lib "IPHlpApi.dll" (FixedInfo As Any, pOutBufLen As Long) As Long
Private Declare Function GetAdaptersInfo Lib "IPHlpApi.dll" (IpAdapterInfo As Any, pOutBufLen As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
    
Private Const MAX_HOSTNAME_LEN = 132
Private Const MAX_DOMAIN_NAME_LEN = 132
Private Const MAX_SCOPE_ID_LEN = 260
Private Const MAX_ADAPTER_NAME_LENGTH = 260
Private Const MAX_ADAPTER_ADDRESS_LENGTH = 8
Private Const MAX_ADAPTER_DESCRIPTION_LENGTH = 132
Private Const ERROR_BUFFER_OVERFLOW = 111

Private Type IP_ADDR_STRING
'            Next As Long
            IPAddress As String * 16
            IpMask As String * 16
            Context As Long
End Type

Private Type IP_ADAPTER_INFO
            Next As Long
            ComboIndex As Long
            AdapterName As String * MAX_ADAPTER_NAME_LENGTH
            Description As String * MAX_ADAPTER_DESCRIPTION_LENGTH
            AddressLength As Long
            Address(MAX_ADAPTER_ADDRESS_LENGTH - 1) As Byte
            Index As Long
            Type As Long
            DhcpEnabled As Long
            CurrentIpAddress As Long
            IpAddressList As IP_ADDR_STRING
            GatewayList As IP_ADDR_STRING
            DhcpServer As IP_ADDR_STRING
            HaveWins As Byte
            PrimaryWinsServer As IP_ADDR_STRING
            SecondaryWinsServer As IP_ADDR_STRING
            LeaseObtained As Long
            LeaseExpires As Long
End Type

Private Type FIXED_INFO
            HostName As String * MAX_HOSTNAME_LEN
            DomainName As String * MAX_DOMAIN_NAME_LEN
            CurrentDnsServer As Long
            DnsServerList As IP_ADDR_STRING
            NodeType As Long
            ScopeId  As String * MAX_SCOPE_ID_LEN
            EnableRouting As Long
            EnableProxy As Long
            EnableDns As Long
End Type

Public Function FU_OSVersion() As OSVERSIONINFOEX
    
    'Autor   : Eliane Akemi
    'Data    : 10/12/2004
    'Objetivo: Devolve uma estrutura com informações sobre o sistema operacional
    
    '    Para determinar o sistema operacional, utilize os valores abaixo:
    '                                                                Win 2003
    '                  Win 95 Win 98 Win Me Win NT 4 Win 2000 Win XP  Server
    '    PlatformID       1      1      1       2        2       2      2
    '    Major Version    4      4      4       4        5       5      5
    '    Minor Version    0     10     90       0        0       1      2
    '
    '    Exemplo para exibir qual é o seu sistema operacional:
    '        Public Sub FU_Exibe_Versao_SO()
    '            Dim osvInfoEx As OSVERSIONINFOEX
    '            osvInfoEx = FU_OSVersion()
    '            Select Case osvInfoEx.dwPlatformId
    '                Case 2
    '                    If (osvInfoEx.dwMajorVersion = 5 And osvInfoEx.dwMinorVersion = 2) Then
    '                        MsgBox "Microsoft Windows Server 2003"
    '                    ElseIf (osvInfoEx.dwMajorVersion = 5 And osvInfoEx.dwMinorVersion = 1) Then
    '                        MsgBox "Microsoft Windows XP"
    '                    ElseIf (osvInfoEx.dwMajorVersion = 5 And osvInfoEx.dwMinorVersion = 0) Then
    '                        MsgBox "Microsoft Windows 2000"
    '                    ElseIf (osvInfoEx.dwMajorVersion <= 4) Then
    '                        MsgBox "Microsoft Windows NT"
    '                    Else
    '                        MsgBox "Sistema Operacional não previsto"
    '                    End If
    '                Case 1
    '                    If (osvInfoEx.dwMajorVersion = 4 And osvInfoEx.dwMinorVersion = 0) Then
    '                        MsgBox "Microsoft Windows 95"
    '                    ElseIf (osvInfoEx.dwMajorVersion = 4 And osvInfoEx.dwMinorVersion = 10) Then
    '                        MsgBox "Microsoft Windows 98"
    '                    ElseIf (osvInfoEx.dwMajorVersion = 4 And osvInfoEx.dwMinorVersion = 90) Then
    '                        MsgBox "Microsoft Windows Millennium Edition"
    '                    End If
    '                Case Else
    '                    MsgBox "Sistema Operacional não previsto"
    '            End Select
    '        End Sub
    
    Dim osvInfoEx As OSVERSIONINFOEX
    
    osvInfoEx.dwOSVersionInfoSize = Len(osvInfoEx)
    If GetVersionEx(osvInfoEx) = 0 Then
        osvInfoEx.dwOSVersionInfoSize = OSVERSIONINFOSIZE
        If GetVersionEx(osvInfoEx) = 0 Then
            Exit Function
        End If
    End If
    
    FU_OSVersion = osvInfoEx
   
End Function

Public Sub SU_Sleep(ByVal dwMilliseconds As Long)
    'Testado 31/08/2004 - Eley
    Sleep ByVal dwMilliseconds
End Sub

Public Function FU_SetParent(lhWndChild As Long, lhWndNewParent As Long) As Long
    'Testado 31/08/2004 - Eley
    FU_SetParent = SetParent(ByVal lhWndChild, ByVal lhWndNewParent)
End Function

Public Function FU_MoveWindow(ByVal lhwnd As Long, ByVal lX As Long, ByVal lY As Long, ByVal lNwidth As Long, ByVal lNheight As Long, ByVal lbRepaint As Long) As Long
    'Testado 01/09/2004 - Eley
    FU_MoveWindow = MoveWindow(ByVal lhwnd, ByVal lX, ByVal lY, ByVal lNwidth, ByVal lNheight, ByVal lbRepaint)
End Function

Public Function FU_IsWindow(hwnd As Long) As Long
    'Testado 01/09/2004  Eley
    FU_IsWindow = IsWindow(ByVal hwnd)
End Function
Public Function FU_SetFocus(hwnd As Long) As Long
    'Testado 01/09/2004 - Eley
    FU_SetFocus = SetFocus(ByVal hwnd)
End Function
Public Sub SU_GetCursorPos(lpPoint As POINTAPI)
    'Testado 01/09/2004 - Eley
    GetCursorPos lpPoint
End Sub
Public Function FU_GetCursorPos(lpPoint As POINTAPI) As Long
    'Testado 01/09/2004 - Eley
    FU_GetCursorPos = GetCursorPos(lpPoint)
End Function
Public Function FU_Escape(hdc As Long, nEscape As Long, nCount As Long, lpInData As String, lpOutData As String) As Long
    FU_Escape = Escape(ByVal hdc, ByVal nEscape, ByVal nCount, ByVal lpInData, ByVal lpOutData)
End Function

Public Function FU_SetWindowPos(hwnd As Long, hWndInsertAfter As Long, X As Long, Y As Long, cx As Long, cy As Long, wFlags As Long) As Long
    'Testado 01/09/2004 - Eley
    FU_SetWindowPos = SetWindowPos(ByVal hwnd, ByVal hWndInsertAfter, ByVal X, ByVal Y, ByVal cx, ByVal cy, ByVal wFlags)
End Function
Public Function FU_AbortDoc(hdc As Long) As Long
    'Testado 01/09/2004 - Eley
    FU_AbortDoc = AbortDoc(ByVal hdc)
End Function
Public Function FU_EnableWindow(hwnd As Long, fEnable As Long) As Long
    'Testado 01/09/2004 - Eley
    FU_EnableWindow = EnableWindow(ByVal hwnd, ByVal fEnable)
End Function
Public Function FU_GetSystemMenu(hwnd As Long, bRevert As Long) As Long
    'Testado 01/09/2004 - Eley
    FU_GetSystemMenu = GetSystemMenu(ByVal hwnd, ByVal bRevert)
End Function
Public Function FU_DeleteMenu(hMenu As Long, nPosition As Long, wFlags As Long) As Long
    'Testado 01/09/2004 - Eley
    FU_DeleteMenu = DeleteMenu(ByVal hMenu, ByVal nPosition, ByVal wFlags)
End Function
Public Function FU_Rectangle(hdc As Long, x1 As Long, y1 As Long, x2 As Long, y2 As Long) As Long
    'Testado 01/09/2004 - Eley
    FU_Rectangle = Rectangle(ByVal hdc, ByVal x1, ByVal y1, ByVal x2, ByVal y2)
End Function
Public Function FU_GetDesktopWindow() As Long
    'Testado 01/09/2004 - Eley
    FU_GetDesktopWindow = GetDesktopWindow()
End Function
Public Function FU_GetDC(hwnd As Long) As Long
    'Testado 01/09/2004 - Eley
    FU_GetDC = GetDC(ByVal hwnd)
End Function
Public Function FU_BitBlt(hDestDC As Long, X As Long, Y As Long, nWidth As Long, nHeight As Long, hSrcDC As Long, xSrc As Long, ySrc As Long, dwRop As Long) As Long
    'Testado 01/09/2004 - Eley
    FU_BitBlt = BitBlt(ByVal hDestDC, ByVal X, ByVal Y, ByVal nWidth, ByVal nHeight, ByVal hSrcDC, ByVal xSrc, ByVal ySrc, ByVal dwRop)
End Function
Public Function FU_ReleaseDC(hwnd As Long, hdc As Long) As Long
    'Testado 01/09/2004 - Eley
    FU_ReleaseDC = ReleaseDC(ByVal hwnd, ByVal hdc)
End Function
Public Function FU_GetWindowRect(hwnd As Long, lpRect As lRECT) As Long
    'Testado 01/09/2004 - Eley
    FU_GetWindowRect = GetWindowRect(ByVal hwnd, lpRect)
End Function
Public Function FU_CharToOem(lpszSrc As String, lpszDst As String) As Long
    'Testado 01/09/2004 - Eley
    FU_CharToOem = CharToOem(ByVal lpszSrc, ByVal lpszDst)
End Function
Public Function FU_GetPrivateProfileString(lpApplicationName As String, lpKeyName As String, lpDefault As String, lpReturnedString As String, nSize As Long, lpFileName As String) As Long
    'Testado 02/09/2004 - Eley com problemas
    FU_GetPrivateProfileString = GetPrivateProfileString(ByVal lpApplicationName, ByVal lpKeyName, ByVal lpDefault, ByVal lpReturnedString, ByVal nSize, ByVal lpFileName)
End Function
Public Function FU_WritePrivateProfileString(lpApplicationName As String, lpKeyName As String, lpString As String, lpFileName As String) As Long
    'Testado 02/09/2004
    FU_WritePrivateProfileString = WritePrivateProfileString(ByVal lpApplicationName, ByVal lpKeyName, ByVal lpString, ByVal lpFileName)
End Function
Public Function FU_WaitForSingleObject(hHandle As Long, dwMilliseconds As Long) As Long
    'Testado 02/09/2004
    FU_WaitForSingleObject = WaitForSingleObject(ByVal hHandle, ByVal dwMilliseconds)
End Function
Public Function FU_CreateProcessA(lpApplicationName As Long, lpCommandLine As String, lpProcessAttributes As Long, lpThreadAttributes As Long, bInheritHandles As Long, dwCreationFlags As Long, lpEnvironment As Long, lpCurrentDirectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
    'Testado 02/09/2004
    FU_CreateProcessA = CreateProcessA(ByVal lpApplicationName, ByVal lpCommandLine, ByVal lpProcessAttributes, ByVal lpThreadAttributes, ByVal bInheritHandles, ByVal dwCreationFlags, ByVal lpEnvironment, ByVal lpCurrentDirectory, lpStartupInfo, lpProcessInformation)
End Function
Public Function FU_SetActiveWindow(hwnd As Long) As Long
    'Testado 02/09/2004
    FU_SetActiveWindow = SetActiveWindow(ByVal hwnd)
End Function
Public Function FU_SendMessage(hwnd As Long, wMsg As Long, wParam As Long, LParam As String) As Long
    'Testado 02/09/2004
    FU_SendMessage = SendMessage(ByVal hwnd, ByVal wMsg, ByVal wParam, ByVal LParam)
End Function
Public Function FU_GetUserName(lpBuffer As String, nSize As Long) As Long
    'Testado 02/09/2004
    Dim lpBuffer_aux As String * 20
    nSize = Len(lpBuffer_aux)
    FU_GetUserName = GetUserName(lpBuffer_aux, nSize)
    lpBuffer = Left$(lpBuffer_aux, nSize - 1)
    
End Function
Public Function FU_WinHelp(hwnd As Long, lpHelpFile As String, wCommand As Long, dwData As Long) As Long
    'Testado 02/09/2004 - Eley
    FU_WinHelp = WinHelp(ByVal hwnd, ByVal lpHelpFile, ByVal wCommand, ByVal dwData)
End Function
Public Function FU_GetDriveType(nDrive As String) As Long
    'Testado 02/09/2004 - Eley com problemas
    FU_GetDriveType = GetDriveType(ByVal nDrive)
End Function
Public Function FU_WNetGetConnection(lpszLocalName As String, lpszRemoteName As String, cbRemoteName As Long) As Long
    'Testado 02/09/2004 - Eley
    FU_WNetGetConnection = WNetGetConnection(ByVal lpszLocalName, ByVal lpszRemoteName, cbRemoteName)
End Function
Public Function FU_FindWindow(lpClassName As String, lpWindowName As String) As Long
    'Testado 02/09/2004 - Eley
    FU_FindWindow = FindWindow(ByVal lpClassName, ByVal lpWindowName)
End Function
Public Function FU_WinExec(lpCmdLine As String, nCmdShow As Integer) As Integer
    'Testado 02/09/2004 - Eley
    FU_WinExec = WinExec(ByVal lpCmdLine, ByVal nCmdShow)
End Function
Public Function FU_FlashWindow(hwnd As Long, bInvert As Long) As Long
    'Testado 02/09/2004 - Eley
    FU_FlashWindow = FlashWindow(ByVal hwnd, ByVal bInvert)
End Function
Public Function FU_ShowWindow(hwnd As Long, nCmdShow As Long) As Long
    'Testado 02/09/2004 - Eley
    FU_ShowWindow = ShowWindow(ByVal hwnd, ByVal nCmdShow)
End Function

Public Function FU_StretchBlt(hDestDC As Long, X As Long, Y As Long, nWidth As Long, nHeight As Long, hSrcDC As Long, xSrc As Long, ySrc As Long, nSrcWidth As Long, nSrcHeight As Long, dwRop As Long) As Long
    'Incluida em 28/03/2005
    FU_StretchBlt = StretchBlt(ByVal hDestDC, ByVal X, ByVal Y, ByVal nWidth, ByVal nHeight, ByVal hSrcDC, ByVal xSrc, ByVal ySrc, ByVal nSrcWidth, ByVal nSrcHeight, ByVal dwRop)
End Function

Public Function FU_IsWindowVisible(hwnd As Long) As Long
    'Testado 02/09/2004 - Eley
    FU_IsWindowVisible = IsWindowVisible(ByVal hwnd)
End Function

Public Function FU_GetWindow(hwnd As Long, wCmd As Long) As Long
    'Testado 02/09/2004 - Eley
    FU_GetWindow = GetWindow(ByVal hwnd, ByVal wCmd)
End Function
Public Function FU_GetActiveWindow() As Long
    'Testado 02/09/2004 - Eley
    FU_GetActiveWindow = GetActiveWindow()
End Function
Public Function FU_GetWindowTextLength(hwnd As Long) As Long
    'Testado 02/09/2004 - Eley
    FU_GetWindowTextLength = GetWindowTextLength(ByVal hwnd)
End Function
Public Function FU_GetWindowText(hwnd As Long, lpString As String, cch As Long) As Long
    'Testado 02/09/2004 - Eley
    FU_GetWindowText = GetWindowText(ByVal hwnd, ByVal lpString, ByVal cch)
End Function
'Public Function FU_GetWindowText(hwnd As Long, lpClassName As String, nMaxCount As Long) As Long
    'Testado 02/09/2004 - Eley
 '   FU_GetClassName = GetClassName(ByVal hwnd, ByVal lpClassName, ByVal nMaxCount)
'End Function
Public Function FU_WindowFromPoint(xPoint As Long, yPoint As Long) As Long
    'Testado 02/09/2004 - Eley
    FU_WindowFromPoint = WindowFromPoint(ByVal xPoint, ByVal yPoint)
End Function
Public Function FU_IsChild(hWndParent As Long, hwnd As Long) As Long
    'Testado 02/09/2004  Eley
    FU_IsChild = IsChild(ByVal hWndParent, ByVal hwnd)
End Function
Public Function FU_Orientacao(Orientacao As Integer) As Integer

    'Define a orientação da impressora default
    'Se o parâmetro Orientacao for igual a QUAL% retorna a orientação corrente
    'Autor: Edilson
    'Data: 03/11/1998
    
    'Testado 02/09/2004 - Eley
    
    FU_Orientacao = False
    
    If Orientacao% <> PORTRAIT% And Orientacao% <> LANDSCAPE% And Orientacao% <> QUAL% Then
        Exit Function
    End If

    On Error GoTo ErroFU_Orientacao

    If Orientacao% = QUAL% Then
        FU_Orientacao = Printer.Orientation
        Exit Function
    Else
        Printer.Orientation = Orientacao%
    End If
        
    On Error GoTo 0
    
    FU_Orientacao = True
    
    Exit Function
    
ErroFU_Orientacao:
    
    MsgBox "Erro ao definir a orientação da impressora." & Chr(13) & Err & error
    Resume Next
    
End Function
Public Function FU_GetModuleUsage(ByVal hModule As Long) As Integer

    'Testado 02/09/2004 - Eley
    Dim ret_wait As Long
    
    FU_GetModuleUsage = 0
    ret_wait = FU_WaitForSingleObject(hModule, INFINITE)
    ret_wait = FU_CloseHandle(hModule)
    
End Function

Function FU_Escreve_String_Ini(ByVal Arquivo_Ini As String, ByVal Sessao As String, ByVal Item As String, ByVal Texto As String) As Long
    
    'Testado 02/09/2004 - Eley
    Const Item_Nulo = 1
    Const Texto_Nulo = 2

    Dim Retorno As Integer
    Dim QUAL As Integer

    QUAL = 0
    If Item = "" Then QUAL = Item_Nulo
    If Texto = "" Then QUAL = QUAL + Texto_Nulo

    Select Case QUAL
        Case 0
            FU_Escreve_String_Ini = WritePrivateProfileString(Sessao, Item, Texto, Arquivo_Ini)
        Case Item_Nulo
            FU_Escreve_String_Ini = WritePrivateProfileString(Sessao, 0&, Texto, Arquivo_Ini)
        Case Texto_Nulo
            FU_Escreve_String_Ini = WritePrivateProfileString(Sessao, Item, 0&, Arquivo_Ini)
        Case Else
            FU_Escreve_String_Ini = WritePrivateProfileString(Sessao, 0&, 0&, Arquivo_Ini)
    End Select

End Function
Function FU_Le_String_Ini(ByVal Arquivo_Ini As String, ByVal Sessao As String, ByVal Item As String, Optional nSize As Long = 256) As String
   
    '02/09/2004 - Testado por Eley
    '
    '19/10/2006 - Incluido como optional o parametro nSize para poder receber conteudos maiores que o
    'anteriormente fixado(que era 256)
    Dim Resposta As String '* 256
    Dim Tamanho As Long
    Dim a As Integer
    Dim Aux As String
    
    Resposta = Space(nSize)

    If Item = "" Then
        Tamanho = GetPrivateProfileString(Sessao, 0&, "NULL", Resposta, nSize, Arquivo_Ini)
    Else
        Tamanho = GetPrivateProfileString(Sessao, Item, "NULL", Resposta, nSize, Arquivo_Ini)
    End If

    Aux = Left(Resposta, Tamanho)

    If Left$(Aux, 4) = "NULL" Then
        FU_Le_String_Ini = ""
    Else
        FU_Le_String_Ini = Aux
    End If

End Function

Public Function FU_CloseHandle(hObject As Long) As Long
    FU_CloseHandle = CloseHandle(ByVal hObject)
End Function
Public Function FU_GetRI() As String

'******************************************************'
' Obtém o RI da máquina atual                          '
' Retorno: Caso Ok - String com o endereço IP          '
'          Ocorrendo erro: String "NULL"               '
'******************************************************'
    
    'Testado 02/09/2004 - Eley
    
    On Error GoTo Fu_GetRI_Err
    
    Dim rc As Long
    Dim RI As String
    
    ' Try To Get System Info Program Path\Name From Registry...
    If GetKeyValue(HKEY_LOCAL_MACHINE, gREGPATHRI, gREGVALRI, RI) Then
        FU_GetRI = RI
    Else
        ' Error - Registryntry Can Not Be Found...
        GoTo Fu_GetRI_Err
    End If
    
    Exit Function

Fu_GetRI_Err:
        FU_GetRI = "NULL"

End Function

Public Function FU_RegOpenKeyEx(ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
    
    FU_RegOpenKeyEx = RegOpenKeyEx(hKey, lpSubKey, ulOptions, samDesired, phkResult)
    
End Function

Public Function FU_RegCloseKey(ByVal hKey As Long) As Long

    FU_RegCloseKey = RegCloseKey(hKey)
    
End Function

Public Function FU_RegQueryValueEx(ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByRef lpData As String, ByRef lpcbData As Long) As Long

    FU_RegQueryValueEx = RegQueryValueEx(hKey, lpValueName, lpReserved, lpType, lpData, lpcbData)
    
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
        rc = RegOpenKeyEx(KeyRoot, KeyName, 0, KEY_ALL_ACCESS, hKey) ' Open Registry Key
        

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

Function fu_login_usuario() As String
   ' OBJETIVO:    Devolve o usuario logado na rede
   '              em letras maiusculas.
   ' PROGRAMADOR: Joao Marcelo.
   ' DATA       : 28/09/1999
   ' GSNT - ITAU SEGUROS S/A
   
   'Testado 02/09/2004 - Eley

   Dim lsrUsr  As String
   Dim llgRet  As Long
   Dim llgFim  As Long

   lsrUsr$ = Space(20)
   llgRet& = GetUserName(lsrUsr$, Len(lsrUsr$))

   ' Procura "\0" na string de usuario
   llgFim& = InStr(1, lsrUsr$, Chr$(0))

   ' Caso nao tenha encontrado
   If llgFim& <= 1 Then
      fu_login_usuario = ""
      Exit Function
   End If

   ' Retorno
   fu_login_usuario = UCase$(Trim$(Mid$(lsrUsr$, 1, llgFim& - 1)))

End Function

Public Function FU_GetDiskFreeSpace(lpRootPathName As String, lpSectoRPTerCluster As Long, lpBytesPerSector As Long, lpNumberOfFreeClusters As Long, lpTotalNumberOfClusters As Long) As Long
    'Testado 02/09/2004 - Eley
    FU_GetDiskFreeSpace = GetDiskFreeSpace(lpRootPathName, lpSectoRPTerCluster, lpBytesPerSector, lpNumberOfFreeClusters, lpTotalNumberOfClusters)

End Function

Public Function FU_EnumWindows(ByVal wndenmprc As Long, ByVal LParam As Long) As Long

    ' FUNÇÃO FU_EnumWindows
    ' ========================
    ' Joao Marcelo (GSNT)
    ' 29/06/2000
    
    'Testado 02/09/2004 - Eley, com problemas
    
    FU_EnumWindows = EnumWindows(wndenmprc, LParam)

End Function

Public Function FU_GetWindowLong(ByVal hwnd As Long, ByVal nIndex As Long) As Long

    ' FUNÇÃO FU_GetWindowLong
    ' ========================
    ' Joao Marcelo (GSNT)
    ' 29/06/2000
    
    'Testado 02/09/2004 - Eley

    FU_GetWindowLong = GetWindowLong(hwnd, nIndex)

End Function

Public Sub SU_InativaNUMLOCK()
    '********************************************************************************
    'Eleyfeson - 18/02/2005
    'Função criada para simular o comportamento da tecla NUMLOCK desativada
    'no windows xp pois quando ela está ativa não é possível simular o comportamento
    'das teclas "alt+arrow down" através do comando sendkey.
    '********************************************************************************

    Dim NumLockState As Boolean
    Dim keys(0 To 255) As Byte
    
    If FU_OSVersion.dwPlatformId = VER_PLATFORM_WIN32_NT Then
        GetKeyboardState keys(0)
        NumLockState = keys(VK_NUMLOCK)
        If NumLockState Then
           SendKeys "{Numlock}"
        End If
    End If
    
End Sub

Public Function FU_GetWindowsDirectory() As String
'******************************************************************
'Desenvolvido por: Eleyfeson(Opus)
'Data: 10/03/2005
'Objetivo: Retorna o caminho do diretório Windows
'Observação: Não utilizar no Windows95, pois essa API funciona no
'            Terminal Service e nos Windows a partir do 2000.
'******************************************************************

    Dim sDirWin As String
    Dim sRet As String
    
    sDirWin = String$(145, 0)
    sRet = GetSystemWindowsDirectory(sDirWin, 145)
    
    sDirWin = Left$(sDirWin, sRet)
    
    FU_GetWindowsDirectory = sDirWin

End Function

Public Function FU_ShellExecute(ByVal lhwnd As Long, ByVal lOperacao As String, ByVal lArquivo As String, ByVal lParametros As String, ByVal lDiretorio As String, ByVal lModoExibicao As Long) As Long
   '******************************************************************
   'Desenvolvido por: Eleyfeson(Opus)
   'Data: 20/06/2005
   'Objetivo: Abre o arquivo identificando o programa associado, imprime-o
   '          ou explora a pasta onde arquivo se encontra.
   'Observação: A ação a ser realizada é definida pelo parâmetro lOperacao
   '          valores = "open", "print" e "explore"
   '******************************************************************
   FU_ShellExecute = ShellExecute(lhwnd, lOperacao, lArquivo, lParametros, lDiretorio, lModoExibicao)
End Function

Public Function FU_RegSetValueEx(ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As String, ByVal cbData As Long) As Long

    FU_RegSetValueEx = RegSetValueEx(hKey, lpValueName, Reserved, dwType, ByVal lpData, cbData)

End Function



Public Function FU_EnderecoIP() ' ZE As String()
'**************************************************************************
'Data: 01.11.2005
'Autor: Eleyfeson(Opus)
'Objetivo: Retorna o endereço IP local
'Retorno
'   Retorna um array de string, pois se existir mais de uma placa de rede
'   será retornado o endereço ip de todas.
'**************************************************************************
    Dim error As Long
    Dim FixedInfoSize As Long
    Dim AdapterInfoSize As Long
    Dim AdapterInfo As IP_ADAPTER_INFO
    Dim FixedInfo As FIXED_INFO
    Dim pAdapt As Long
    Dim Buffer As IP_ADAPTER_INFO
    Dim FixedInfoBuffer() As Byte
    Dim AdapterInfoBuffer() As Byte
    Dim Retorno() As String
    Dim PrimeiroItem As Boolean
    Dim SemCaracterInvalido As String
    Dim PosicaoCaracter As Integer
    Dim AuxEndIP As String
    Dim CaracterEndIP As String
    
    ' Get the main IP configuration information for this machine
    ' using a FIXED_INFO structure.
    FixedInfoSize = 0
    error = GetNetworkParams(ByVal 0&, FixedInfoSize)
    If error <> 0 Then
        If error <> ERROR_BUFFER_OVERFLOW Then
           Err.Raise error, Err.Source, "GetNetworkParams sizing failed"
           Exit Function
        End If
    End If
    ReDim FixedInfoBuffer(FixedInfoSize - 1)

    error = GetNetworkParams(FixedInfoBuffer(0), FixedInfoSize)
    If error = 0 Then
            CopyMemory FixedInfo, FixedInfoBuffer(0), FixedInfoSize
    Else
            Err.Raise error, Err.Source, "GetNetworkParams failed with error "
            Exit Function
    End If

    ' Enumerate all of the adapter specific information using the
    ' IP_ADAPTER_INFO structure.
    ' Note:  IP_ADAPTER_INFO contains a linked list of adapter entries.

    AdapterInfoSize = 0
    error = GetAdaptersInfo(ByVal 0&, AdapterInfoSize)
    If error <> 0 Then
        If error <> ERROR_BUFFER_OVERFLOW Then
           Err.Raise error, Err.Source, "GetAdaptersInfo sizing failed"
           Exit Function
        End If
    End If
    ReDim AdapterInfoBuffer(AdapterInfoSize - 1)
'
    ' Get actual adapter information
    error = GetAdaptersInfo(AdapterInfoBuffer(0), AdapterInfoSize)
    If error <> 0 Then
       Err.Raise error, "IPAddress", "GetAdaptersInfo failed with error "
       Exit Function
    End If

    ' Allocate memory
     CopyMemory AdapterInfo, AdapterInfoBuffer(0), AdapterInfoSize
    pAdapt = AdapterInfo.Next
    PrimeiroItem = True

    Do
       SemCaracterInvalido = ""
       CopyMemory Buffer, AdapterInfo, AdapterInfoSize
       If PrimeiroItem Then
          ReDim Retorno(1)
          PrimeiroItem = False
       Else
          ReDim Preserve Retorno(UBound(Retorno) + 1)
       End If
       
       '********************************************************************
       'Esse código retira os caracteres inválidos que a API retorna
       'junto com o endereço IP
       AuxEndIP = Buffer.IpAddressList.IPAddress
       For PosicaoCaracter = 1 To Len(AuxEndIP)
           CaracterEndIP = Mid(AuxEndIP, PosicaoCaracter, 1)
            If CaracterEndIP = "." Or IsNumeric(CaracterEndIP) Then
                SemCaracterInvalido = SemCaracterInvalido & CaracterEndIP
            End If
       Next
       '********************************************************************
       Retorno(UBound(Retorno) - 1) = SemCaracterInvalido
       
       pAdapt = Buffer.Next
       If pAdapt <> 0 Then
           CopyMemory AdapterInfo, ByVal pAdapt, AdapterInfoSize
        End If
    Loop Until pAdapt = 0
    
    FU_EnderecoIP = Retorno
        
End Function





