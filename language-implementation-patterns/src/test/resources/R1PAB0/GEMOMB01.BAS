Attribute VB_Name = "MsgBox_em_Portugues"
Option Explicit

'Parâmetro uType
Private Const MB_TASKMODAL = &H2000&

'MB_SYSTEMMODAL (&H1000) "invertido"
Private Const MB_CANCEL_SYSTEMMODAL = &HFFFFEFFF

'Botão Ajuda
Private Const MB_HELP = 9

'Constantes para SetWindowsHookEx
Private Const WH_CBT = 5
Private Const HCBT_ACTIVATE = 5

Private Declare Function GetCurrentThreadId Lib "kernel32" () As Long
Private Declare Function SetDlgItemText Lib "User32" Alias "SetDlgItemTextA" (ByVal hDlg As Long, ByVal nIDDlgItem As Long, ByVal lpString As String) As Long
Private Declare Function SetWindowsHookEx Lib "User32" Alias "SetWindowsHookExA" (ByVal idHook As Long, ByVal lpfn As Long, ByVal hmod As Long, ByVal dwThreadId As Long) As Long
Private Declare Function UnhookWindowsHookEx Lib "User32" (ByVal hHook As Long) As Long


'Declarações para utilização da função MessageBoxIndirect
Private Type MSGBOXPARAMS
    cbSize As Long
    hWndOwner As Long
    hInstance As Long
    lpszText As String
    lpszCaption As String
    dwStyle As Long
    lpszIcon As Long
    dwContextHelpId As Long
    lpfnMsgBoxCallback As Long
    dwLanguageId As Long
End Type

Private Const LANG_PORTUGUESE As Long = &H16
Private Const SUBLANG_PORTUGUESE_BRAZILIAN As Long = &H1

Private Declare Function MessageBoxIndirect Lib "User32" Alias "MessageBoxIndirectA" (lpMsgBoxParams As MSGBOXPARAMS) As Long


'Declarações para abertura de Help File
Private Type POINTAPI
    x As Long
    Y As Long
End Type
Private Type HELPINFO
    cbSize As Long
    iContextType As Long
    iCtrlId As Long
    hItemHandle As Long
    dwContextId As Long
    MousePos As POINTAPI
End Type
Private Type HELPWININFO
    wStructSize As Long
    x As Long
    Y As Long
    dx As Long
    dy As Long
    wMax As Long
    rgchMember As String * 2
End Type

Private Const HELP_CONTEXT = &H1
Private Const HELP_QUIT = &H2
Private Const HELP_INDEX = &H3
Private Const HELP_CONTENTS = &H3&
Private Const HELP_HELPONHELP = &H4
Private Const HELP_SETINDEX = &H5
Private Const HELP_SETCONTENTS = &H5&
Private Const HELP_CONTEXTPOPUP = &H8&
Private Const HELP_FORCEFILE = &H9&
Private Const HELP_TAB = &HF&
Private Const HELP_KEY = &H101C&
Private Const HELP_COMMAND = &H102&
Private Const HELP_PARTIALKEY = &H105&
Private Const HELP_MULTIKEY = &H201&
Private Const HELP_SETWINPOS = &H203&
Private Const HELP_FINDER = &HB

Private Declare Function WinHelp Lib "User32" Alias "WinHelpA" (ByVal hwndApp As Long, ByVal lpHelpFile As String, ByVal wCommand As Long, ByVal dwData As Long) As Long


'Declarações para abertura de HTML Help File
Private Const HH_DISPLAY_TOPIC = &H0             '  WinHelp equivalent
Private Const HH_DISPLAY_TOC = &H1               '  WinHelp equivalent
Private Const HH_DISPLAY_INDEX = &H2             '  WinHelp equivalent
Private Const HH_DISPLAY_SEARCH = &H3            '  WinHelp equivalent
Private Const HH_SET_WIN_TYPE = &H4
Private Const HH_GET_WIN_TYPE = &H5
Private Const HH_GET_WIN_HANDLE = &H6
Private Const HH_KEYWORD_LOOKUP = &HD            '  WinHelp equivalent
Private Const HH_DISPLAY_TEXT_POPUP = &HE        ' display string resource id
                                                 ' or text in a popup window
                                                 ' value in dwData
Private Const HH_HELP_CONTEXT = &HF              '  display mapped numeric
Private Const HH_CLOSE_ALL = &H12                '  WinHelp equivalent

Private Declare Function HTMLHelp Lib "hhctrl.ocx" Alias "HtmlHelpA" (ByVal hwnd As Long, ByVal lpHelpFile As String, ByVal wCommand As Long, ByVal dwData As Long) As Long


'Variables de intercâmbio entre funções
Private hHook As Long

Private lngButtons As Long
Private strPrompt As String
Private strTitle As String
Private strHelpFile As String


Public Function MsgBox(ByVal Prompt As String, Optional ByVal Buttons As VbMsgBoxStyle = vbOKOnly, Optional ByVal Title As Variant, Optional ByVal HelpFile As Variant, Optional ByVal Context As Variant) As VbMsgBoxResult

    Dim lngContext As Long
    Dim typMSG As MSGBOXPARAMS
    Dim hwndThreadOwner As Long
    Dim hInstance As Long
    Dim hThreadId As Long


    'Carrega variáveis que serão utilizados em funções locais
    lngButtons = Buttons
    strPrompt = Prompt
    If IsMissing(Title) Then
        strTitle = App.Title
    Else
        strTitle = Title
    End If
    If IsMissing(HelpFile) Or IsMissing(Context) Then
        strHelpFile = ""
        lngContext = 0
    Else
        strHelpFile = HelpFile
        lngContext = Context
    End If
    
        
    'Seta hook
    hwndThreadOwner = 0 'Screen.ActiveForm.hWnd
    hInstance = 0       'GetWindowLong(hwndThreadOwner, GWL_HINSTANCE)
    hThreadId = GetCurrentThreadId()
    
    'Especificando Windows hook como um dos parâmetros, pode-se interceptar
    'mensagens e tratá-las
    hHook = SetWindowsHookEx(WH_CBT, AddressOf MsgBoxHookProc, hInstance, hThreadId)

    'Preenche parâmetros do Message Box
    With typMSG
        .cbSize = Len(typMSG)
        .hWndOwner = hwndThreadOwner
        .hInstance = hInstance
        .lpszText = strPrompt
        .lpszCaption = strTitle
        'É necessário desligar o bit referente à MB_SYSTEMMODAL, pois
        'ele tem precedência sobre MB_TASKMODAL e o MsgBox passa a ter
        'comportamento não-modal
        'É necessário ligar o bit referente à MB_TASKMODAL para o MsgBox
        'ter comportamento Modal
        .dwStyle = (lngButtons And MB_CANCEL_SYSTEMMODAL) Or MB_TASKMODAL
        .dwContextHelpId = lngContext
        .lpfnMsgBoxCallback = DummyFunc(AddressOf MsgBoxCallback)
        .dwLanguageId = MAKELANGID(LANG_PORTUGUESE, SUBLANG_PORTUGUESE_BRAZILIAN)
    End With
    
    MsgBox = MessageBoxIndirect(typMSG)

End Function

Private Function MsgBoxHookProc(ByVal uMsg As Long, ByVal wParam As Long, _
        ByVal LParam As Long) As Long
    Dim hwnd As Long
        
    'Quando o message box for exibido, altera o texto dos botões
    If uMsg = HCBT_ACTIVATE Then
        SetDlgItemText wParam, vbAbort, "Anular"
        SetDlgItemText wParam, vbCancel, "Cancelar"
        SetDlgItemText wParam, vbIgnore, "Ignorar"
        SetDlgItemText wParam, vbNo, "Não"
        SetDlgItemText wParam, vbOK, "Ok"
        SetDlgItemText wParam, vbRetry, "Repetir"
        SetDlgItemText wParam, vbYes, "Sim"
        SetDlgItemText wParam, MB_HELP, "Ajuda"
        
        'Libera hook
        UnhookWindowsHookEx hHook
    End If
    
    'Retorna Falso para continuar o processamento
    MsgBoxHookProc = False
End Function

'Função de callback para manipular o botão de Help do message box
Private Sub MsgBoxCallback(lpHelpInfo As HELPINFO)
    Dim lngContext As Long
    Dim lngRet As Long

    If LCase(Right(strHelpFile, 4)) = ".chm" Then
        'If lpHelpInfo.dwContextId = 0 Then
        '    lngContext = HH_DISPLAY_TOPIC
        'Else
        '    lngContext = HH_HELP_CONTEXT
        'End If
        'lngRet = HTMLHelp(0&, strHelpFile, lngContext, lpHelpInfo.dwContextId)
        lngRet = HTMLHelp(0&, strHelpFile, HH_DISPLAY_TOPIC, 0)
    Else
        If lpHelpInfo.dwContextId = 0 Then
            lngContext = HELP_TAB 'HELP_TAB | HELP_FINDER
        Else
            lngContext = HELP_CONTEXT
        End If
        lngRet = WinHelp(0&, strHelpFile, lngContext, lpHelpInfo.dwContextId)
    End If
End Sub

Private Function MAKELANGID(ByVal usPrimaryLanguage As Integer, ByVal usSubLanguage As Integer) As Long
    MAKELANGID = (usSubLanguage * 1024) Or usPrimaryLanguage
End Function

Private Function DummyFunc(ByVal pointer As Long) As Long
    DummyFunc = pointer
End Function
