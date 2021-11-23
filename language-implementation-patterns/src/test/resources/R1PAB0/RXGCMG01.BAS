Attribute VB_Name = "RXGCMG01"
' ===================================================
' COMENTARIO SOX
' NOME : RXGCMG01.BAS
' VERSAO : 2
' ===================================================
'/****************************************************************************/
'/*                                                                          */
'/* MODULE: FRNWWFVB.BAS                                                     */
'/*                                                                          */
'/* 5697-250                                                                 */
'/* (C) Copyright IBM Corporation 1996.  All Rights Reserved.                */
'/*                                                                          */
'/* DERIVATIVE RIGHTS:                                                       */
'/* ------------------                                                       */
'/* This program is provided for the customer's use and the customer is      */
'/* granted permission to copy this program to the extent reasonably         */
'/* required for such use.  All title, ownership, and rights to this         */
'/* program and any copies remain with IBM, irrespective of the ownership    */
'/* of the media on which the program resides.  The customer is permitted    */
'/* to create derivative works to this program.  However, all copies of      */
'/* the program and its derivative works must contain the IBM copyright      */
'/* notice.  The customer understands and agrees that this program in and    */
'/* of itself is not to be sold or distributed.  The customer is free to     */
'/* sell, distribute, and commercially exploit any derivative works          */
'/* created from this program.                                               */
'/*                                                                          */
'/* DISCLAIMER OF WARRANTIES:                                                */
'/* ------------------------                                                */
'/* The following "enclosed" code is sample code created by IBM              */
'/* Corporation.  This sample code is not part of any standard IBM product   */
'/* and is provided to you solely for the purpose of assisting you in the    */
'/* development of your applications.  The code is provided "AS IS",         */
'/* without warranty of any kind.  IBM shall not be liable for any damages   */
'/* arising out of your use of the sample code, even if they have been       */
'/* advised of the possibility of such damages.                              */
'/*                                                                          */
'/* DESCRIPTION:                                                             */
'/* ------------                                                             */
'/* This program provides a VisualInfo High Level Programming Interface      */
'/* for Visual Basic applications. The enclosed VHLPI functions use the      */
'/* OLE Automation interface of the VisualInfo Client application which      */
'/* must be running (or invokeable) for these functions to work.             */
'/*                                                                          */
'/****************************************************************************/


'+--------------------------------------------------------------------------+
'| Alteração: Eliminar as chamadas da função FU_Trata_Erro                   |
'|            Retornar as mensagens de erro na variável global VG_CMG_T_ERR$ |
'|            Incluir "On error goto ..."  em todas as funções não nativas   |
'|            ou seja todas as FU_CMG_...  e devolver o erro de VB           |
'| Autor: Carla                                                              |
'| Data:  30/09/2004                                                         |
'+--------------------------------------------------------------------------+


' Data declarations
'Global VhlApplObj As Object  ZE
'Global VhlDocsObj As Object ZE
'Global VhlErrorObj As Object ZE

'Constantes de logon no Content Manager
Const CM_USERNAME_TESTE = "ditest"
Const CM_PASSWORD_TESTE = "ditest"
Const CM_LIBRARY_TESTE = "LIBSRVRD"
Const CM_USERNAME_PROD = "diprod"
Const CM_PASSWORD_PROD = "diprod"
Const CM_LIBRARY_PROD = "LIBSRVRX"
Const CM_CLASS_DOC_IDT = "IX1_ITAUSEG_DOC_IDENTIFICADO"
Const CM_CLASS_DOC_NAO_IDT = "IX1_ITAUSEG_DOC_NAO_IDENTIFICADO"

'Constantes do metodo disablemenus
Global Const IP2_DISABLE_CHECKINOUT = &H1
Global Const IP2_DISABLE_DELETE = &H2
Global Const IP2_DISABLE_EXPORT = &H4
Global Const IP2_DISABLE_FAXOUT = &H8
Global Const IP2_DISABLE_FOLDER_FUNCTIONS = &H10
Global Const IP2_DISABLE_INDEX_CLASS_CHANGE = &H20
Global Const IP2_DISABLE_INDEX_VALUE_CHANGE = &H40
Global Const IP2_DISABLE_NOTE_EDIT = &H80
Global Const IP2_DISABLE_NOTE_APPEND = &H100
Global Const IP2_DISABLE_PRINT = &H200
Global Const IP2_DISABLE_WORKBASKET_ACTIVATE = &H400
Global Const IP2_DISABLE_WORKBASKET_REMOVAL = &H800
Global Const IP2_DISABLE_WORKBASKET_SUSPEND = &H1000
Global Const IP2_DISABLE_WORKFLOW = &H2000
Global Const IP2_DISABLE_SEARCH = &H4000
Global Const IP2_DISABLE_OPTIONS = &H8000

'Utilizado em FU_CMG_Visualiza_Imagem_PDF
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpszOp As String, ByVal lpszFile As String, ByVal lpszParams As String, ByVal lpszDir As String, ByVal FsShowCmd As Long) As Long

'Utilizado em FU_CMG_Visualiza_Imagem_PDF
Private Declare Function GetDesktopWindow Lib "user32" () As Long

'Utilizado em FU_CMG_Visualiza_Imagem_PDF
Private Declare Function GetTempFileName Lib "kernel32" Alias "GetTempFileNameA" (ByVal lpszPath As String, ByVal lpPrefixString As String, ByVal wUnique As Long, ByVal lpTempFileName As String) As Long

Const SW_SHOWNORMAL = 1
Const SW_SHOWMAXIMIZED = 3

Const SE_ERR_FNF = 2&
Const SE_ERR_PNF = 3&
Const SE_ERR_ACCESSDENIED = 5&
Const SE_ERR_OOM = 8&
Const SE_ERR_DLLNOTFOUND = 32&
Const SE_ERR_SHARE = 26&
Const SE_ERR_ASSOCINCOMPLETE = 27&
Const SE_ERR_DDETIMEOUT = 28&
Const SE_ERR_DDEFAIL = 29&
Const SE_ERR_DDEBUSY = 30&
Const SE_ERR_NOASSOC = 31&
Const ERROR_BAD_FORMAT = 11&

'+-------------------------------------------------------------------------+
'| Carla - 30/09/2004 - Variáveis de código e descrição de erros            |
'+-------------------------------------------------------------------------+

Public VG_CMG_C_ERR  As String
Public VG_CMG_T_ERR  As String


'+----------------------------------------------------------------------+
' Autor     : André de Santi (People Consulting)
' Criação   : 16/12/2003
' Descrição : Cria um arquivo temporário para que este seja transformado
'             em PDF.
'+----------------------------------------------------------------------+
' Autor     : Carla
' Alteração : 19/10/2004
' Descrição : Alteração do nome da função (inclusão do CMG) e tratamento
'             de erros
'+----------------------------------------------------------------------+
Private Function FU_CMG_CreateTempFile(pPrefix As String) As String

    On Error GoTo TrataErro

    Dim nRet        As Long

    'Se as strings abaixo não forem criadas com um tamanho fixo,
    '   ocorrerá um erro na função GetTempFileName
    Dim sTmpPath    As String * 512
    Dim sTmpName    As String * 576
    Dim osvInfoEx As OSVERSIONINFOEX

    osvInfoEx = FU_OSVersion()

    'Monta o diretório onde será criado o arquivo temporário
    'Carla 17/01/2005 _ Homolocação TS
    'sTmpPath = "C:\WINDOWS\TEMP\" & Left$(App.EXEName, 6) & "01\"

    Select Case osvInfoEx.dwPlatformId
        Case 1
            If (osvInfoEx.dwMajorVersion = 4 And osvInfoEx.dwMinorVersion = 0) Then
                '"Microsoft Windows 95"
                sTmpPath = "C:\WINDOWS\TEMP\" & Left$(App.EXEName, 6) & "01\"
            End If
        Case Else
            sTmpPath = FU_Diretorio_Usuario() & "\" & Left$(App.EXEName, 6) & "01\"
    End Select


    'Cálculo utilizado para preencher a string com vbNullChar
    nRet = 512 - Len(Trim$(sTmpPath))

    'Preenche a string com o diretório padrão e com vbNullChar no final
    sTmpPath = Trim$(sTmpPath) & String(nRet, vbNullChar)

    'Verifica se o diretório com o nome do projeto já existe
    If Dir(sTmpPath, vbDirectory) = "" Then

        'Cria o diretório com o nome do projeto
        MkDir Left$(sTmpPath, InStr(1, sTmpPath, vbNullChar) - 1)

    End If

    'Cria o arquivo temporário
    nRet = GetTempFileName(sTmpPath, pPrefix, 0, sTmpName)

    If nRet <> 0 Then
        'Se criou o arquivo temporário, retorna o caminho e nome do mesmo
        FU_CMG_CreateTempFile = Left$(sTmpName, InStr(sTmpName, vbNullChar) - 1)
    End If

    Exit Function
TrataErro:
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " Erro na FU_CMG_CreateTempFile. "
    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If
End Function


'+----------------------------------------------------------------------+
' Autor     : André de Santi (People Consulting)
' Criação   : 16/12/2003
' Descrição : Deleta todos os arquivos temporários, deve ser colocada
'             nos projetos que utilizam a "FU_CMG_Visualiza_Imagem_Form".
'             Aconselhável a ser colocada no form_load.
'+----------------------------------------------------------------------+
' Autor     : Carla
' Alteração : 19/10/2004
' Descrição : Alteração do nome da função (inclusão do CMG) e tratamento
'             de erros
'+----------------------------------------------------------------------+
Public Function FU_CMG_DeleteTempFile() As Boolean

    FU_CMG_DeleteTempFile = False

    On Error GoTo TrataErro

    Dim sTmpPath    As String

    'Carla 17/01/2004 - Homologação TS
    Dim osvInfoEx As OSVERSIONINFOEX

    osvInfoEx = FU_OSVersion()


    'Monta o diretório onde será criado o arquivo temporário
    'Carla 17/01/2004 - Homologação TS
    'sTmpPath = "C:\WINDOWS\TEMP\" & Left$(App.EXEName, 6) & "01\*.*"

    Select Case osvInfoEx.dwPlatformId
        Case 1
            If (osvInfoEx.dwMajorVersion = 4 And osvInfoEx.dwMinorVersion = 0) Then
                '"Microsoft Windows 95"
                sTmpPath = "C:\WINDOWS\TEMP\" & Left$(App.EXEName, 6) & "01\*.*"
            End If
        Case Else
            sTmpPath = FU_Diretorio_Usuario() & "\" & Left$(App.EXEName, 6) & "01\*.*"
    End Select

    'Verifica se o diretório com o nome do projeto já existe
    If Dir(sTmpPath) <> "" Then

        'Delete os arquivos temporários
        Kill sTmpPath

    End If

    FU_CMG_DeleteTempFile = True

    Exit Function


TrataErro:
    VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " Erro na FU_CMG_DeleteTempFile. "

    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If

End Function


Private Function FU_CMG_StartDoc(DocName As String) As Long
    Dim Scr_hDC As Long

        On Error GoTo Trata_Erro

    Scr_hDC = GetDesktopWindow()
    FU_CMG_StartDoc = ShellExecute(Scr_hDC, "Open", DocName, _
    "", "C:\", SW_SHOWMAXIMIZED)

        Exit Function

Trata_Erro:
    VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " Erro na FU_CMG_StartDoc. "

    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If

End Function


Public Function FU_CMG_Logoff() As Boolean
On Error GoTo Trata_Erro
    If Not VhlApplObj Is Nothing Then
        FU_CMG_Logoff = IIf(VbVhlLogoff = 0, True, False)
    Else
        FU_CMG_Logoff = True
    End If
    Exit Function
Trata_Erro:

    FU_CMG_Logoff = False

    VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " Erro na FU_CMG_Logoff. "

    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If
End Function

Public Function FU_CMG_Recupera_ItemID( _
                prm_u_idt_doc_rbd As Long) _
                As String

    Dim aItemList()
    Dim strQuery
        On Error GoTo Erro_FU_CMG_Recupera_ItemID


    If prm_u_idt_doc_rbd <> 0 Then
        strQuery = "@IX1_U_IDT_DOC_RBD@==" & Chr(34) & UCase(Trim(prm_u_idt_doc_rbd)) & Chr(34)
        If VbVhlSearchItem(aItemList, CM_CLASS_DOC_IDT, strQuery) Then
            VG_CMG_T_ERR$ = "Documento não encontrado. u_idt_doc_rbd = " & Trim(CStr(prm_u_idt_doc_rbd)) & " Classe " & CM_CLASS_DOC_IDT
            GoTo Erro_FU_CMG_Recupera_ItemID
        End If
        If aItemList(0) <> 1 Then
            VG_CMG_T_ERR$ = "Documento ambíguo. " & " aItemList(0) = " & Trim(CStr(aItemList(0))) & "u_idt_doc_rbd = " & Trim(CStr(prm_u_idt_doc_rbd)) & vbCrLf & "Classe " & CM_CLASS_DOC_IDT
        Else
            FU_CMG_Recupera_ItemID = Trim(CStr(aItemList(1)))
        End If
    Else
         VG_CMG_T_ERR$ = "FU_CMG_Recupera_ItemID sem parâmetros. u_idt_doc_rbd = " & Trim(CStr(prm_u_idt_doc_rbd))
    End If

    Exit Function

Erro_FU_CMG_Recupera_ItemID:

    FU_CMG_Recupera_ItemID = ""

    VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & " Erro na FU_CMG_Recupera_ItemID. "

    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If

End Function


'Para utilizar esta função, vá em VB/Project/Components e
'selecione Microsoft Internet Controls.
'Depois, insira em seu form um controle WebBrowser, que
'servirá como a área de visualização. Passe este objeto como
'o primeiro parâmetro da função.
'ATENÇÃO: Não há como saber se o documento foi mostrado com sucesso !!!!
'        (Isto dependerá da configuração do Acrobat e do Internet Explorer.)
Public Function FU_CMG_Visualiza_Imagem_Form( _
                prm_obj_browser As Object, _
                prm_u_idt_doc_rbd As Long, _
                Optional prm_c_itemid_cm As String = "") _
                As Boolean

    Dim aItemList()
    Dim strQuery

    On Error GoTo Erro_CM_Visualiza_imagem_Form

    FU_CMG_Disable_Menus (&HFFFF - IP2_DISABLE_PRINT)

    'Se prm_u_idt_doc_rbd for numérico, utiliza para query
    If prm_u_idt_doc_rbd <> 0 Then

        strQuery = "@IX1_U_IDT_DOC_RBD@==" & Chr(34) & UCase(Trim(prm_u_idt_doc_rbd)) & Chr(34)
        If VbVhlSearchItem(aItemList, CM_CLASS_DOC_IDT, strQuery) Then
            VG_CMG_T_ERR$ = "Documento não encontrado. u_idt_doc_rbd = " & Trim(CStr(prm_u_idt_doc_rbd)) & "Classe " & CM_CLASS_DOC_IDT
            GoTo Erro_CM_Visualiza_imagem_Form
        End If
    Else 'Utiliza prm_c_itemid_cm
        If Len(prm_c_itemid_cm) > 0 Then
            ReDim aItemList(1)
            aItemList(0) = 1
            aItemList(1) = UCase(Trim(prm_c_itemid_cm))
        Else
            VG_CMG_T_ERR$ = "FU_CMG_Visualiza_imagem_form não recebeu nenhum parâmetro. u_idt_doc_rbd = " & Trim(CStr(prm_u_idt_doc_rbd)) & "ItemID = " & prm_c_itemid_cm
            GoTo Erro_CM_Visualiza_imagem_Form
        End If
    End If

    Dim i As Integer
    Dim sTempFile As String
    Dim hI As Long
    If (aItemList(0) > 0) Then
       For i = 1 To aItemList(0)
            sTempFile = FU_CMG_CreateTempFile("WN") & ".pdf"
            If Len(sTempFile) = 0 Then
                VG_CMG_T_ERR$ = "Erro na criação do arquivo temporário"
                GoTo Erro_CM_Visualiza_imagem_Form
            End If
            If VbVhlExportDocObj(aItemList(i), sTempFile, 0) Then
                VG_CMG_T_ERR$ = "Erro na exportação da imagem pelo Content Manager"
                GoTo Erro_CM_Visualiza_imagem_Form
            End If
            prm_obj_browser.Navigate sTempFile
'            If hI < 32 Then
'                FU_Trata_Erro "Erro na execução do arquivo temporário." & vbCrLf & "StartDoc Err =" & Val(hI)
'                GoTo Erro_CM_Visualiza_imagem_form
'            End If
       Next
    End If

    FU_CMG_Visualiza_Imagem_Form = True

    Exit Function

Erro_CM_Visualiza_imagem_Form:

    FU_CMG_Visualiza_Imagem_Form = False

    VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & " Erro na FU_Visualiza_Imagem_Form. "

    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If

End Function


Public Function FU_CMG_Visualiza_Imagem_PDF( _
                prm_u_idt_doc_rbd As Long, _
                Optional prm_c_itemid_cm As String = "", _
                Optional prm_Abrir_Adobe As Boolean = True, _
                Optional prm_Form As Form) _
                As Boolean

    Dim aItemList()
    Dim strQuery

    On Error GoTo Erro_CM_Visualiza_Imagem_PDF


    FU_CMG_Disable_Menus (&HFFFF - IP2_DISABLE_PRINT)

    'Se prm_u_idt_doc_rbd for numérico, utiliza para query
    If prm_u_idt_doc_rbd <> 0 Then

        strQuery = "@IX1_U_IDT_DOC_RBD@==" & Chr(34) & UCase(Trim(prm_u_idt_doc_rbd)) & Chr(34)
        If VbVhlSearchItem(aItemList, CM_CLASS_DOC_IDT, strQuery) Then
            VG_CMG_T_ERR$ = "Documento não encontrado. u_idt_doc_rbd = " & Trim(CStr(prm_u_idt_doc_rbd)) & "  Classe = " & CM_CLASS_DOC_IDT
            GoTo Erro_CM_Visualiza_Imagem_PDF
        End If
    Else 'Utiliza prm_c_itemid_cm
        If Len(prm_c_itemid_cm) > 0 Then
            ReDim aItemList(1)
            aItemList(0) = 1
            aItemList(1) = UCase(Trim(prm_c_itemid_cm))
        Else
            VG_CMG_T_ERR$ = "FU_CMG_Visualiza_Imagem_PDF não recebeu nenhum parâmetro. u_idt_doc_rbd = " & Trim(CStr(prm_u_idt_doc_rbd)) & " ItemID = " & prm_c_itemid_cm
            GoTo Erro_CM_Visualiza_Imagem_PDF
        End If
    End If

    Dim i As Integer
    Dim sTempFile As String
    Dim hI As Long
    If (aItemList(0) > 0) Then
       For i = 1 To aItemList(0)
            sTempFile = FU_CMG_CreateTempFile("WN") & ".pdf"
            If Len(sTempFile) = 0 Then
                VG_CMG_T_ERR$ = "Erro na criação do arquivo temporário. "
                GoTo Erro_CM_Visualiza_Imagem_PDF
            End If
            If VbVhlExportDocObj(aItemList(i), sTempFile, 0) Then
                VG_CMG_T_ERR$ = "Erro na exportação da imagem pelo Content Manager. "
                GoTo Erro_CM_Visualiza_Imagem_PDF
            End If

            If prm_Abrir_Adobe = True Then
                                hI = FU_CMG_StartDoc(sTempFile)

                If hI < 32 Then
                        VG_CMG_T_ERR$ = "Erro na execução do arquivo temporário." & vbCrLf & "StartDoc Err =" & Val(hI)
                        GoTo Erro_CM_Visualiza_Imagem_PDF
                End If
            Else
                prm_Form.SU_Abir_PDF sTempFile
                prm_Form.Show
            End If

       Next
    End If

    FU_CMG_Visualiza_Imagem_PDF = True

    Exit Function

Erro_CM_Visualiza_Imagem_PDF:

    FU_CMG_Visualiza_Imagem_PDF = False

    VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & " Erro na FU_CMG_Visualiza_Imagem_PDF. "

    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If

End Function


Public Function FU_CMG_Visualiza_Imagem( _
                prm_u_idt_doc_rbd As Long, _
                Optional prm_c_itemid_cm As String = "") _
                As Boolean

    Dim aItemList()
    Dim strQuery

        On Error GoTo Erro_CM_Visualiza_Imagem

    FU_CMG_Disable_Menus (&HFFFF - IP2_DISABLE_PRINT)

    'Se prm_u_idt_doc_rbd for numérico, utiliza para query
    If prm_u_idt_doc_rbd <> 0 Then

        strQuery = "@IX1_U_IDT_DOC_RBD@==" & Chr(34) & UCase(Trim(prm_u_idt_doc_rbd)) & Chr(34)
        If VbVhlSearchItem(aItemList, CM_CLASS_DOC_IDT, strQuery) Then
            VG_CMG_T_ERR$ = "Documento não encontrado. u_idt_doc_rbd = " & Trim(CStr(prm_u_idt_doc_rbd)) & " Classe = " & CM_CLASS_DOC_IDT
            GoTo Erro_CM_Visualiza_Imagem
        End If
    Else 'Utiliza prm_c_itemid_cm
        If Len(prm_c_itemid_cm) > 0 Then
            ReDim aItemList(1)
            aItemList(0) = 1
            aItemList(1) = UCase(Trim(prm_c_itemid_cm))
        Else
            VG_CMG_T_ERR$ = "FU_CMG_Visualiza_Imagem não recebeu nenhum parâmetro. u_idt_doc_rbd = " & Trim(CStr(prm_u_idt_doc_rbd)) & " ItemID = " & prm_c_itemid_cm
            GoTo Erro_CM_Visualiza_Imagem
        End If
    End If

    Dim i As Integer
    If (aItemList(0) > 0) Then
       For i = 1 To aItemList(0)
            If VbVhlDisplayDocView(aItemList(i), False) Then
                VG_CMG_T_ERR$ = " Erro na visualização da imagem pelo Content Manager. "
                GoTo Erro_CM_Visualiza_Imagem
            End If
       Next
    End If

    FU_CMG_Visualiza_Imagem = True

    Exit Function

Erro_CM_Visualiza_Imagem:

    FU_CMG_Visualiza_Imagem = False

    VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & " Erro na FU_CMG_Visualiza_Imagem. "

    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If

End Function


'Desabilita todos menus (IP2_*) acima
Public Sub FU_CMG_Disable_Menus(Optional prm_menus As Long = &HFFFF)
    On Error GoTo Trata_Erro
    '&HFFFF - Desabilita todos os menus.
    'Se quiser desabilitar menus específicos, utilize as
    'constantes IP2_*, somando-as.
    VhlApplObj.DisableMenus prm_menus, 1
        Exit Sub
Trata_Erro:

    VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & "Erro na FU_CMG_Disable_Menus. "

    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If
End Sub

Function FU_CMG_Campos_Content_Manager(ItemList(), ItemId)
    ' Declarations
    Dim FolderObj As Object
    Dim ContentObj As Object

    Dim ulTOCCnt, ulStart, ulEnd, ulLen, ulTotLen As Long

    ' Setup Error handler
    On Error GoTo VhlSearchAdvError
    ulRC = 0

    Set FolderObj = VhlApplObj.ItemId(ItemId)

    ' If only 1 match - then actual Item returned NOT a Folder
    If FolderObj.Class <> "" Then
       ReDim ItemList(2)
       ItemList(0) = 1
       ItemList(1) = FolderObj.ItemId
       GoTo VhlSearchAdvEnd
    End If

    ' Setup return array based on size of folder
    ulTOCCnt = FolderObj.TOCCount
    ReDim ItemList(ulTOCCnt + 1)
    ItemList(0) = 0

    ' Get the list of Item Objects in the Folder
    For i = 1 To ulTOCCnt
       Set ContentObj = FolderObj.GetTOCItem(i - 1)
       ItemList(i) = ContentObj.ItemId
       Set ContentObj = Nothing
       ItemList(0) = i
    Next

VhlSearchAdvEnd:

    ' Free the objects
    Set ContentObj = Nothing
    Set FolderObj = Nothing

    ' Set return value to error code
    'VbVhlSearchAdv = ulRC

    Exit Function

VhlSearchAdvError:

        VG_CMG_T_ERR = " Erro na FU_CMG_Campos_Content_Manager. "
    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlSearchAdvEnd

End Function

'Logon no CM - Se os dados não forem recebidos, utiliza as constantes
Public Function FU_CMG_Logon(Optional prm_username As String = CM_USERNAME_TESTE, Optional prm_password As String = CM_PASSWORD_TESTE, Optional prm_library As String = CM_LIBRARY_TESTE) As Boolean
Dim N_ABE  As String
    On Error GoTo Trata_Erro

    N_ABE$ = FU_Get_Ambiente()

    Select Case Trim(UCase(N_ABE$))
        Case "PRD"
            prm_username = CM_USERNAME_PROD
            prm_password = CM_PASSWORD_PROD
            prm_library = CM_LIBRARY_PROD
    End Select

 'Se VbVhlLogon retorna 0, FU_Logon_CM retorna true = OK !
 'FU_CMG_Logon = IIf(VbVhlLogon(prm_username, prm_password, prm_library) = 0, True, False)
 'Logon no Content Manager
    If VbVhlLogon(prm_username, prm_password, prm_library) = 0 And _
        VhlApplObj = prm_library Then    'Verifica Servidor conectado
        FU_CMG_Logon = True
    Else
        FU_CMG_Logon = False
        FU_CMG_Logoff
    End If

Exit Function

Trata_Erro:
    VG_CMG_T_ERR = " Erro na FU_CMG_Logon. "
    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If
End Function


Public Function FU_CMG_Export_Doc(ItemId As String, Filename As String) As Boolean
    On Error GoTo Trata_Erro
    FU_CMG_Export_Doc = IIf(VbVhlExportDocObj(ItemId, Filename, 0) = 0, True, False)

    Exit Function
Trata_Erro:

    VG_CMG_T_ERR = " Erro na FU_CMG_Export_Doc. "
    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & " Erro VB: " & Trim(Str(Err)) & " - " & Err.Description
        Err.Clear
    End If
End Function

Function VbVhlAddFolderItem(ItemId, FolderId)

    ' Declarations
    Dim ItemObj As Object
    Dim FolderObj As Object

    ' Setup Error handler
    On Error GoTo VhlAddFolderError
    ulRC = 0

    ' Get the Folder Object
    Set FolderObj = VhlApplObj.ItemId(FolderId)

    ' Get the ItemID Object
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' Put ItemId into Folder
    ulRC = ItemObj.AddToFolder(FolderObj)

VhlAddFolderEnd:

    ' Free the objects
    Set ItemObj = Nothing
    Set FolderObj = Nothing

    ' Set return value to error code
    VbVhlAddFolderItem = ulRC

    Exit Function

VhlAddFolderError:

    ' Set return value to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlAddFolderEnd

End Function

Function VbVhlAdminItemNoteLog(ItemId, FuncInd, NoteText)

    ' Declarations
    Dim ItemObj As Object

    ' Setup Error handler
    On Error GoTo VhlAdminNoteError
    ulRC = 0

    ' Get the Item object
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' Determine what to do
    Select Case FuncInd
    Case "APPEND"
       OldNoteText = ItemObj.GetNotes
       ulRC = ItemObj.ChangeNotes(OldNoteText & NoteText)
    Case "DELETE"
       OldNoteText = ItemObj.GetNotes
       ulRC = ItemObj.ChangeNotes(" ")
    Case "REPLACE"
       OldNoteText = ItemObj.GetNotes
       ulRC = ItemObj.ChangeNotes(NoteText)
    Case "GET"
       NoteText = ItemObj.GetNotes
    End Select

    ' Unlock the Note log
    If (ulRC = 0) Then
       ulRC = ItemObj.CloseNotes
    End If

VhlAdminNoteEnd:

    ' Free the object
    Set ItemObj = Nothing

    ' Set return value to error code
    VbVhlAdminItemNoteLog = ulRC

    Exit Function

VhlAdminNoteError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlAdminNoteEnd

End Function

Function VbVhlChangeItemIndex(ItemId, ClassName, AttrName(), AttrValue())

    ' Declarations
    Dim ItemObj As Object

    ' Setup Error handler
    On Error GoTo VhlChgIndexError
    ulRC = 0

    ' Get the Item
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' Update Item index class
    ItemObj.Class = ClassName

    ' Update the Item attributes
    For i = 1 To AttrName(0)
       ItemObj.KeyFields(AttrName(i)) = AttrValue(i)
    Next
    ' Update the Items Index Class and attribute information
    ulRC = ItemObj.UpdateIndex

VhlChgIndexEnd:

    ' Free the objects
    Set ItemObj = Nothing

    ' Set return value to error code
    VbVhlChangeItemIndex = ulRC

    Exit Function

VhlChgIndexError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlChgIndexEnd

End Function

Function VbVhlCheckInItem(ItemId, UserId)

    ' Declarations
    Dim ItemObj As Object

    ' Setup Error handler
    On Error GoTo VhlCheckInError
    ulRC = 0

    ' Get the Item object
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' CheckIn the Item
    ulRC = ItemObj.CheckIn

    ' Store the Checked out status
    UserId = ItemObj.CheckedStatus

VhlCheckInEnd:

    ' Free the object
    Set ItemObj = Nothing

    ' Set return value to error code
    VbVhlCheckInItem = ulRC

    Exit Function

VhlCheckInError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlCheckInEnd

End Function

Function VbVhlCheckOutItem(ItemId, UserId)

    ' Declarations
    Dim ItemObj As Object

    ' Setup Error handler
    On Error GoTo VhlCheckOutError
    ulRC = 0

    ' Get the Item object
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' CheckOut the Item
    ulRC = ItemObj.CheckOut

    ' Store the Checked out status
    UserId = ItemObj.CheckedStatus

VhlCheckOutEnd:

    ' Free the object
    Set ItemObj = Nothing

    ' Set return value to error code
    VbVhlCheckOutItem = ulRC

    Exit Function

VhlCheckOutError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlCheckOutEnd

End Function

Function VbVhlCloseDocViews(fUpdate)

    ' Declarations
    Dim ImageObj As Object

    ' Setup Error handler
    On Error GoTo VhlCloseDocError
    ulRC = 0

    ' Close Document being displayed
    Set ImageObj = VhlApplObj.Image
    If Not (ImageObj Is Nothing) Then
       ImageObj.CloseIt (fUpdate)
    End If

VhlCloseDocEnd:

    ' Set return value to error code
    VbVhlCloseDocViews = ulRC

    Exit Function

VhlCloseDocError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlCloseDocEnd

End Function

Function VbVhlCopyDoc(NewDocId, docID, ClassName, AttrName(), AttrValue())

    ' Declarations
    Dim ItemObj As Object
    Dim NewItemObj As Object

    ' Setup Error handler
    On Error GoTo VhlCopyDocError
    ulRC = 0

    ' Get the Document object
    Set ItemObj = VhlApplObj.ItemId(docID)
    ' Make sure the object is a document
    If ItemObj.Type <> 1 Then
       ' Return with error - SBVI_BAD_DOCUMENT
       ulRC = 909
       GoTo VhlCopyDocEnd
    End If

    ' Create a new document
    Set NewItemObj = VhlApplObj.CreateDocument("COPY")
    NewDocId = NewItemObj.ItemId

    ' Update the new document with Index Class information if provided
    If (ulRC = 0) And (ClassName <> "") Then
       ' Change the Items Index Class
       ulRC = VbVhlChangeItemIndex(NewDocId, ClassName, AttrName(), AttrValue())
    End If

    ' Copy document base parts into new document
    i = 0
    While (ulRC = 0) And (i < ItemObj.PartCount)
       ContentClass = ItemObj.GetPartContentClass(i)
       TempFile = ItemObj.GetPartFile(i)
       ulRC = NewItemObj.AddPart(TempFile, ContentClass)
       i = i + 1
    Wend
    ' Close the original document
    rc = ItemObj.CloseParts

VhlCopyDocEnd:

    ' Free the objects
    Set ItemObj = Nothing
    Set NewItemObj = Nothing

    ' Set return value to error code
    VbVhlCopyDoc = ulRC

    Exit Function

VhlCopyDocError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlCopyDocEnd

End Function

Function VbVhlCreateFolder(FolderId, ClassName, AttrName(), AttrValue())

    ' Declarations
    Dim FolderObj As Object

    ' Setup Error handler
    On Error GoTo VhlCreFoldError
    ulRC = 0

    ' Create the folder
    Set FolderObj = VhlApplObj.CreateFolder("CREATE")
    FolderId = FolderObj.ItemId
    If (ulRC = 0) And (ClassName <> "") Then
       ' Change the Items Index Class
       ulRC = VbVhlChangeItemIndex(FolderId, ClassName, AttrName(), AttrValue())
    End If

VhlCreFoldEnd:

    ' Free the object
    Set FolderObj = Nothing

    ' Set return value to error code
    VbVhlCreateFolder = ulRC

    Exit Function

VhlCreFoldError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlCreFoldEnd

End Function

Function VbVhlCreateFolderAddItem(FolderId, ItemId, ClassName, AttrName(), AttrValue())

    ' Declarations
    Dim FolderObj As Object
    Dim ItemObj As Object

    ' Setup Error handler
    On Error GoTo VhlCreFoldAddError
    ulRC = 0

    ' Create the folder
    Set FolderObj = VhlApplObj.CreateFolder("CREATE")
    FolderId = FolderObj.ItemId

    ' Get the ItemID Object
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' Put ItemId into Folder
    ulRC = ItemObj.AddToFolder(FolderObj)

    If (ulRC = 0) And (ClassName <> "") Then
       ' Change the Items Index Class
       ulRC = VbVhlChangeItemIndex(FolderId, ClassName, AttrName(), AttrValue())
    End If

VhlCreFoldAddEnd:

    ' Free the objects
    Set FolderObj = Nothing
    Set ItemObj = Nothing

    ' Set return value to error code
    VbVhlCreateFolderAddItem = ulRC

    Exit Function

VhlCreFoldAddError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlCreFoldAddEnd

End Function

Function VbVhlDeleteItem(ItemId)

    ' Declarations
    Dim ItemObj As Object

    ' Setup Error handler
    On Error GoTo VhlDeleteError
    ulRC = 0

    ' Get the ItemID Object
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' Delete the Item
    ulRC = ItemObj.Delete

VhlDeleteEnd:

    ' Free the objects
    Set ItemObj = Nothing

    ' Set return value to error code
    VbVhlDeleteItem = ulRC

    Exit Function

VhlDeleteError:

    ' Set return value to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlDeleteEnd

End Function

Function VbVhlDisplayDocView(ItemId, fUpdate)

    ' Declarations
    Dim ItemObj As Object
    Dim ImageObj As Object

    ' Setup Error handler
    On Error GoTo VhlDispDocError
    ulRC = 0

    ' Get the Item object
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' Close Document being displayed
    Set ImageObj = VhlApplObj.Image
    If Not (ImageObj Is Nothing) Then
       ImageObj.CloseIt (fUpdate)
    End If

    ' Display Document
    ulRC = ImageObj.OpenDocument(ItemObj)

VhlDispDocEnd:

    ' Free the object
    Set ItemObj = Nothing

    ' Set return value to error code
    VbVhlDisplayDocView = ulRC

    Exit Function

VhlDispDocError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlDispDocEnd

End Function

Function VbVhlDisplayVIItem(ItemId, fUpdate)

    ' Declarations
    Dim ItemObj As Object
    Dim ImageObj As Object
    Dim FolderObj As Object

    ' Setup Error handler
    On Error GoTo VhlDispItemError
    ulRC = 0

    ' Get the Item object
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' Find out if the item is a folder or a document
    If (ItemObj.Type = 1) Then
       ' Close Document being displayed
       Set ImageObj = VhlApplObj.Image
       If Not (ImageObj Is Nothing) Then
          ImageObj.CloseIt (fUpdate)
       End If
       ' Display Document
       ulRC = ImageObj.OpenDocument(ItemObj)
    Else
        ' Must be a folder. Display it.
        Set FolderObj = VhlDocsObj.OpenTOC(ItemObj)
    End If

VhlDispItemEnd:

    ' Free the object
    Set ItemObj = Nothing
    Set FolderObj = Nothing
    Set ImageObj = Nothing

    ' Set return value to error code
    VbVhlDisplayVIItem = ulRC

    Exit Function

VhlDispItemError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlDispItemEnd

End Function

Function VbVhlDropFuncs()

    ' Setup Error handler
    On Error GoTo VhlDropError

    ' End access with OLE interface
    ulRC = 0
    Set VhlDocsObj = Nothing
    Set VhlErrorObj = Nothing
    Set VhlApplObj = Nothing

VhlDropEnd:

    ' Set return value to error code
    VbVhlDropFuncs = ulRC

    Exit Function

VhlDropError:

    ' Set return code to error code
    ulRC = Err
    Resume VhlDropEnd

End Function

Function VbVhlExportDocObj(docID, Filename, PartNum)

    ' Declarations
    Dim DocObj As Object

    ' Setup Error handler
    On Error GoTo VhlExportDocError
    ulRC = 0

    ' Get the document object
    Set DocObj = VhlApplObj.ItemId(docID)

    ' Copy document base part into file
    TempFile = DocObj.GetPartFile(PartNum)
    Name TempFile As Filename
    ' Close the document
    rc = DocObj.CloseParts

VhlExportDocEnd:

    ' Free the object
    Set DocObj = Nothing

    ' Set return value to error code
    VbVhlExportDocObj = ulRC

    Exit Function

VhlExportDocError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlExportDocEnd

End Function

Function VbVhlGetVIUserID()

    ' Setup Error handler
    On Error GoTo VhlGetUserError
    ulRC = 0

    ' Set return value to UserId
    VbVhlGetVIUserID = VhlApplObj.USER

VhlGetUserEnd:

    Exit Function

VhlGetUserError:

    ' Set return code to error code
    VbVhlGetVIUserID = VhlErrorObj.ReturnCode

    Resume VhlGetUserEnd

End Function

Function VbVhlImportDocObj(docID, Filename, ContentClass, ClassName, AttrName(), AttrValue())

    ' Declarations
    Dim DocObj As Object

    ' Setup Error handler
    On Error GoTo VhlImportDocError
    ulRC = 0

    ' Create the document and add the file
    Set DocObj = VhlApplObj.CreateDocument("IMPORT")
    docID = DocObj.ItemId
    ulRC = DocObj.AddPart(Filename, ContentClass)
    If (ulRC = 0) And (DocObj.CheckedStatus <> "") Then
       ' CheckIn the Item
       ulRC = DocObj.CheckIn
    End If

    If (ulRC = 0) And (ClassName <> "") Then
       ' Change the Items Index Class
       ulRC = VbVhlChangeItemIndex(docID, ClassName, AttrName(), AttrValue())
    End If

VhlImportDocEnd:

    ' Free the object
    Set DocObj = Nothing

    ' Set return value to error code
    VbVhlImportDocObj = ulRC

    Exit Function

VhlImportDocError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlImportDocEnd

End Function

Function VbVhlListContClasses(CCList())

    ' Declarations
    Dim i, ulStart, ulEnd, ulLen, ulTotLen As Long

    ' Setup Error handler
    On Error GoTo VhlContListError
    ulRC = 0

    ' Get the list of Cont Classes
    strRet = VhlApplObj.ContentClassList(";")
    ulTotLen = Len(strRet)

    ' Add Cont classes to List array
    i = 0
    ReDim CCList(1)
    CCList(0) = 0
    ulStart = 1
    Do
       ' Each name separated by a ";"
       ulEnd = InStr(ulStart, strRet, ";")
       If (ulEnd = 0) Then
          ulEnd = ulTotLen + 1
       End If
       ulLen = ulEnd - ulStart

       ' Set next array variable to Cont Class name
       i = i + 1
       ReDim Preserve CCList(i + 1)
       CCList(i) = Mid$(strRet, ulStart, ulLen)

       ' Setup for next loop
       ulStart = ulEnd + 1
    Loop Until (ulStart >= ulTotLen)

    ' Set total number of Cont Classes in array
    CCList(0) = i

VhlContListEnd:

    ' Set return value to error code
    VbVhlListContClasses = ulRC

    Exit Function

VhlContListError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlContListEnd

End Function

Function VbVhlListFolderItems(ItemList(), FolderId, IndexClass())

    ' Declarations
    Dim FolderObj As Object
    Dim ContentObj As Object
    Dim ulTOCCnt, ulStart, ulEnd, ulLen, ulTotLen As Long

    ' Setup Error handler
    On Error GoTo VhlLstFldError
    ulRC = 0

    ' Get the Folder Object
    Set FolderObj = VhlApplObj.ItemId(FolderId)

    ' Setup return array based on size of folder
    ulTOCCnt = FolderObj.TOCCount
    ReDim ItemList(ulTOCCnt + 1, 4)
    ItemList(0, 0) = 0

    ' Get the list of Item Objects in the Folder
    j = 1
    For i = 1 To ulTOCCnt
       Set ContentObj = FolderObj.GetTOCItem(i - 1)
       ItemList(j, 0) = 3
       ItemList(j, 1) = ContentObj.ItemId
       ItemList(j, 2) = ContentObj.Type
       ItemList(j, 3) = ContentObj.Class
       Set ContentObj = Nothing
       ' Check if Index Class filter was provided
       found = False
       If IndexClass(0) <> 0 Then
          For k = 1 To IndexClass(0)
             If IndexClass(k) = ItemList(j, 3) Then
                found = True
                Exit For
             End If
          Next k
       Else
          found = True
       End If
       ' Only send back Items found in Index Class list
       If found Then
          ItemList(0, 0) = j
          j = j + 1
       End If
    Next i

VhlLstFldEnd:

    ' Free the objects
    Set ContentObj = Nothing
    Set FolderObj = Nothing

    ' Set return value to error code
    VbVhlListFolderItems = ulRC

    Exit Function

VhlLstFldError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlLstFldEnd

End Function

Function VbVhlListFolderItemsAttr(ItemList(), FolderId)

    ' Declarations
    Dim FolderObj As Object
    Dim ContentObj As Object
    Dim ulTOCCnt, ulStart, ulEnd, ulLen, ulTotLen As Long

    ' Setup Error handler
    On Error GoTo VhlLstFldAttrError
    ulRC = 0

    ' Get the Folder Object
    Set FolderObj = VhlApplObj.ItemId(FolderId)

    ' Setup return array based on size of folder
    ulTOCCnt = FolderObj.TOCCount
    ReDim ItemList(ulTOCCnt + 1, 4)
    ItemList(0, 0) = 0

    ' Get the list of Item Objects in the Folder
    For i = 1 To ulTOCCnt
       Set ContentObj = FolderObj.GetTOCItem(i - 1)
       ItemList(i, 1) = ContentObj.ItemId
       ItemList(i, 2) = ContentObj.Type
       ItemList(i, 3) = ContentObj.Class
       ItemList(0, 0) = i
       ItemList(i, 0) = 3

       ' Get the list of Index Class attributes
       strRet = VhlApplObj.ClassKeyFieldList(ContentObj.Class, ";")
       ulTotLen = Len(strRet)
       j = 3
       ulStart = 1
       ' Add attributes to List array
       Do
          ' Each name separated by a ";"
          ulEnd = InStr(ulStart, strRet, ";")
          If (ulEnd = 0) Then
             ulEnd = ulTotLen + 1
          End If
          ulLen = ulEnd - ulStart
          AttrName = Mid$(strRet, ulStart, ulLen)

          ' Set next array variables to attribute name and value
          j = j + 1
          ReDim Preserve ItemList(i, j + 2)
          ItemList(i, j) = AttrName
          j = j + 1
          ItemList(i, j) = ContentObj.KeyFields(AttrName)

          ' Setup for next loop
          ulStart = ulEnd + 1
       Loop Until (ulStart >= ulTotLen)

       ' Reset total number of variables in array
       ItemList(i, 0) = j
       ' Free the current Item object
       Set ContentObj = Nothing

    Next i

VhlLstFldAttrEnd:

    ' Free the objects
    Set ContentObj = Nothing
    Set FolderObj = Nothing

    ' Set return value to error code
    VbVhlListFolderItemsAttr = ulRC

    Exit Function

VhlLstFldAttrError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlLstFldAttrEnd

End Function

Function VbVhlListIndexClassAttr(AttrList(), ClassName)

    ' Declarations
    Dim i, ulStart, ulEnd, ulLen, ulTotLen As Long

    ' Setup Error handler
    On Error GoTo VhlClassAttrError
    ulRC = 0

    ' Get the list of Index Class attributes
    strRet = VhlApplObj.ClassKeyFieldList(ClassName, ";")
    ulTotLen = Len(strRet)

    ' Add attributes to List array
    i = 0
    ReDim AttrList(1)
    AttrList(0) = 0
    ulStart = 1
    Do
       ' Each name separated by a ";"
       ulEnd = InStr(ulStart, strRet, ";")
       If (ulEnd = 0) Then
          ulEnd = ulTotLen + 1
       End If
       ulLen = ulEnd - ulStart

       ' Set next array variable to attribute name
       i = i + 1
       ReDim Preserve AttrList(i + 1)
       AttrList(i) = Mid$(strRet, ulStart, ulLen)

       ' Setup for next loop
       ulStart = ulEnd + 1
    Loop Until (ulStart >= ulTotLen)

    ' Set total number of attributes in array
    AttrList(0) = i

VhlClassAttrEnd:

    ' Set return value to error code
    VbVhlListIndexClassAttr = ulRC

    Exit Function

VhlClassAttrError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlClassAttrEnd

End Function

Function VbVhlListIndexClasses(IxClassList())

    ' Declarations
    Dim i, ulStart, ulEnd, ulLen, ulTotLen As Long

    ' Setup Error handler
    On Error GoTo VhlClassListError
    ulRC = 0

    ' Get the list of Index Classes
    strRet = VhlApplObj.ClassList(";")
    ulTotLen = Len(strRet)

    ' Add Index classes to List array
    i = 0
    ReDim IxClassList(1)
    IxClassList(0) = 0
    ulStart = 1
    Do
       ' Each name separated by a ";"
       ulEnd = InStr(ulStart, strRet, ";")
       If (ulEnd = 0) Then
          ulEnd = ulTotLen + 1
       End If
       ulLen = ulEnd - ulStart

       ' Set next array variable to Index Class name
       i = i + 1
       ReDim Preserve IxClassList(i + 1)
       IxClassList(i) = Mid$(strRet, ulStart, ulLen)

       ' Setup for next loop
       ulStart = ulEnd + 1
    Loop Until (ulStart >= ulTotLen)

    ' Set total number of Index Classes in array
    IxClassList(0) = i

VhlClassListEnd:

    ' Set return value to error code
    VbVhlListIndexClasses = ulRC

    Exit Function

VhlClassListError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlClassListEnd

End Function

Function VbVhlListItemCC(ItemCC, ItemId, PartNum)

    ' Declarations
    Dim ItemObj As Object

    ' Setup Error handler
    On Error GoTo VhlItemCCError
    ulRC = 0

    ' Get the Item object
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' Copy content class of document base part
    ItemCC = ItemObj.GetPartContentClass(PartNum)

VhlItemCCEnd:

    ' Free the object
    Set ItemObj = Nothing

    ' Set return value to error code
    VbVhlListItemCC = ulRC

    Exit Function

VhlItemCCError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlItemCCEnd

End Function

Function VbVhlListItemInfo(ItemList(), ItemId)

    ' Declarations
    Dim ItemObj As Object
    Dim ulTOCCnt, ulStart, ulEnd, ulLen, ulTotLen As Long

    ' Setup Error handler
    On Error GoTo VhlListInfoError
    ulRC = 0

    ' Get the Item Object
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' Get the list of Item Objects in the Folder
    ReDim ItemList(10)
    ItemList(0) = 3
    ItemList(1) = ItemObj.ItemId
    ItemList(2) = ItemObj.Type
    ItemList(3) = ItemObj.Class

    ' Workbaskets don't have attributes
    If ItemList(2) > 2 Then
       GoTo VhlListInfoEnd
    End If

    ' Get the list of Index Class attributes
    strRet = VhlApplObj.ClassKeyFieldList(ItemObj.Class, ";")
    ulTotLen = Len(strRet)
    i = 3
    ulStart = 1
    ' Add attributes to List array
    Do
       ' Each name separated by a ";"
       ulEnd = InStr(ulStart, strRet, ";")
       If (ulEnd = 0) Then
          ulEnd = ulTotLen + 1
       End If
       ulLen = ulEnd - ulStart
       AttrName = Mid$(strRet, ulStart, ulLen)

       ' Set next array variables to attribute name and value
       i = i + 1
       ReDim Preserve ItemList(i + 2)
       ItemList(i) = AttrName
       i = i + 1
       ItemList(i) = ItemObj.KeyFields(AttrName)

       ' Setup for next loop
       ulStart = ulEnd + 1
    Loop Until (ulStart >= ulTotLen)

    ' Set total number of variables in array
    ItemList(0) = i

VhlListInfoEnd:

    ' Free the objects
    Set ItemObj = Nothing

    ' Set return value to error code
    VbVhlListItemInfo = ulRC

    Exit Function

VhlListInfoError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlListInfoEnd

End Function

Function VbVhlListWBItems(ItemList(), WBItemID)

    ' Declarations
    Dim WBObj As Object
    Dim ContentObj As Object
    Dim ulTOCCnt As Long

    ' Setup Error handler
    On Error GoTo VhlLstWBItemError
    ulRC = 0

    ' Get the WB Object
    Set WBObj = VhlApplObj.GetWorkbasket(WBItemID)

    ' Setup return array based on size of WB
    ulTOCCnt = WBObj.TOCCount
    ReDim ItemList(ulTOCCnt + 1)
    ItemList(0) = 0

    ' Get the list of Item Objects in the WB
    j = 1
    For i = 1 To ulTOCCnt
       Set ContentObj = WBObj.GetTOCItem(i - 1)
       ItemList(j) = ContentObj.ItemId
       Set ContentObj = Nothing
       ItemList(0) = j
       j = j + 1
    Next i

VhlLstWBItemEnd:

    ' Free the objects
    Set ContentObj = Nothing
    Set WBObj = Nothing

    ' Set return value to error code
    VbVhlListWBItems = ulRC

    Exit Function

VhlLstWBItemError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlLstWBItemEnd

End Function

Function VbVhlListWorkBaskets(WBList())

    ' Declarations
    Dim i, ulStart, ulEnd, ulLen, ulTotLen As Long

    ' Setup Error handler
    On Error GoTo VhlListWBError
    ulRC = 0

    ' Get the list of WorkBaskets
    strRet = VhlApplObj.WorkBasketList(";")
    ulTotLen = Len(strRet)

    ' Add Index classes to List array
    i = 0
    ReDim WBList(1)
    WBList(0) = 0
    ulStart = 1
    Do
       ' Each name separated by a ";"
       ulEnd = InStr(ulStart, strRet, ";")
       If (ulEnd = 0) Then
          ulEnd = ulTotLen + 1
       End If
       ulLen = ulEnd - ulStart

       ' Set next array variable to Index Class name
       i = i + 1
       ReDim Preserve WBList(i + 1)
       WBList(i) = Mid$(strRet, ulStart, ulLen)

       ' Setup for next loop
       ulStart = ulEnd + 1
    Loop Until (ulStart >= ulTotLen)

    ' Set total number of Index Classes in array
    WBList(0) = i

VhlListWBEnd:

    ' Set return value to error code
    VbVhlListWorkBaskets = ulRC

    Exit Function

VhlListWBError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlListWBEnd

End Function

Function VbVhlLoadFuncs()

    ' Setup Error handler
    On Error GoTo VhlLoadError
    ulRC = 0

    ' Get the application object
    Set VhlApplObj = CreateObject("Vic.Application")

    ' Setup Global Application Objects
    Set VhlDocsObj = VhlApplObj.Documents
    Set VhlErrorObj = VhlApplObj.error

VhlLoadEnd:

    ' Set return value to error code
    VbVhlLoadFuncs = ulRC

    Exit Function

VhlLoadError:

    ' Set return code to error code
    ulRC = Err
    Resume VhlLoadEnd

End Function

Function VbVhlLogoff()

    ' Setup Error handler
    On Error GoTo VhlLogoffError

    ' Logoff from VisualInfo
    ulRC = 0
    VhlApplObj.Quit
    Set VhlDocsObj = Nothing
    Set VhlErrorObj = Nothing
    Set VhlApplObj = Nothing

VhlLogoffEnd:

    ' Set return value to error code
    VbVhlLogoff = ulRC

    Exit Function

VhlLogoffError:

    ' Set return code to error code
    ulRC = Err
    Resume VhlLogoffEnd

End Function

Function VbVhlLogon(UserId, Password, LibServer)

    ' Setup Error handler
    On Error GoTo VhlLogonError
    ulRC = 0

    ' Get the application object
    Set VhlApplObj = CreateObject("Vic.Application")
    VhlApplObj.Visible = False

    ' Set logon information
    VhlApplObj.USER = UserId
    VhlApplObj.SERVER = LibServer
    VhlApplObj.Password = Password

    ' Display the Logon screen and Log onto VisualInfo
    ulRC = VhlApplObj.Logon
    If (ulRC = 0) Then
       ' Setup Global Application Objects
       Set VhlDocsObj = VhlApplObj.Documents
       Set VhlErrorObj = VhlApplObj.error
    Else
       ' Release application object
       Set VhlApplObj = Nothing
    End If

VhlLogonEnd:

    ' Set return value to error code
    VbVhlLogon = ulRC

    Exit Function

VhlLogonError:

    ' Set return code to error code
    ulRC = Err
    Resume VhlLogonEnd

End Function

Function VbVhlRemoveFolderItem(ItemId, FolderId)

    ' Declarations
    Dim ItemObj As Object
    Dim FolderObj As Object

    ' Setup Error handler
    On Error GoTo VhlRemFolderError
    ulRC = 0

    ' Get the Folder Object
    Set FolderObj = VhlApplObj.ItemId(FolderId)

    ' Get the ItemID Object
    Set ItemObj = VhlApplObj.ItemId(ItemId)

    ' Put ItemId into Folder
    ulRC = ItemObj.RemoveFromFolder(FolderObj)

VhlRemFolderEnd:

    ' Free the objects
    Set ItemObj = Nothing
    Set FolderObj = Nothing

    ' Set return value to error code
    VbVhlRemoveFolderItem = ulRC

    Exit Function

VhlRemFolderError:

    ' Set return value to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlRemFolderEnd

End Function

Function VbVhlScanDoc()

    ' Setup Error handler
    On Error GoTo VhlScanDocError
    ulRC = 0

    ' Scan some documents
    VhlApplObj.OpenScan

VhlScanDocEnd:

    Exit Function

VhlScanDocError:

    ' Set return code to error code
    VbVhlScanDoc = VhlErrorObj.ReturnCode

    Resume VhlScanDocEnd

End Function

Function VbVhlSearchAdv(ItemList(), ClassName, Criteria, TypeFilter, WIPFilter, SuspendFilter)

    ' Declarations
    Dim FolderObj As Object
    Dim ContentObj As Object
    Dim ulTOCCnt, ulStart, ulEnd, ulLen, ulTotLen As Long

    ' Setup Error handler
    On Error GoTo VhlSearchAdvError
    ulRC = 0

    ' Get the search results folder
    Set FolderObj = VhlApplObj.Search(ClassName, Criteria, TypeFilter, WIPFilter, SuspendFilter)

    ' If only 1 match - then actual Item returned NOT a Folder
    If FolderObj.Class <> "" Then
       ReDim ItemList(2)
       ItemList(0) = 1
       ItemList(1) = FolderObj.ItemId
       GoTo VhlSearchAdvEnd
    End If

    ' Setup return array based on size of folder
    ulTOCCnt = FolderObj.TOCCount
    ReDim ItemList(ulTOCCnt + 1)
    ItemList(0) = 0

    ' Get the list of Item Objects in the Folder
    For i = 1 To ulTOCCnt
       Set ContentObj = FolderObj.GetTOCItem(i - 1)
       ItemList(i) = ContentObj.ItemId
       Set ContentObj = Nothing
       ItemList(0) = i
    Next

VhlSearchAdvEnd:

    ' Free the objects
    Set ContentObj = Nothing
    Set FolderObj = Nothing

    ' Set return value to error code
    VbVhlSearchAdv = ulRC

    Exit Function

VhlSearchAdvError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlSearchAdvEnd

End Function

Function VbVhlSearchItem(ItemList(), ClassName, Criteria)

    ' Declarations
    Dim FolderObj As Object
    Dim ContentObj As Object
    Dim ulTOCCnt, ulStart, ulEnd, ulLen, ulTotLen As Long

    ' Setup Error handler
    On Error GoTo VhlSearchError
    ulRC = 0

    ' Get the search results folder
    Set FolderObj = VhlApplObj.Search(ClassName, Criteria, 3, 15, 3)

    ' If only 1 match - then actual Item returned NOT a Folder
    If FolderObj.Class <> "" Then
       ReDim ItemList(2)
       ItemList(0) = 1
       ItemList(1) = FolderObj.ItemId
       GoTo VhlSearchEnd
    End If

    ' Setup return array based on size of folder
    ulTOCCnt = FolderObj.TOCCount
    ReDim ItemList(ulTOCCnt + 1)
    ItemList(0) = 0

    ' Get the list of Item Objects in the Folder
    For i = 1 To ulTOCCnt
       Set ContentObj = FolderObj.GetTOCItem(i - 1)
       ItemList(i) = ContentObj.ItemId
       Set ContentObj = Nothing
       ItemList(0) = i
    Next

VhlSearchEnd:

    ' Free the objects
    Set ContentObj = Nothing
    Set FolderObj = Nothing

    ' Set return value to error code
    VbVhlSearchItem = ulRC

    Exit Function

VhlSearchError:

    ' Set return code to error code
    ulRC = VhlErrorObj.ReturnCode

    Resume VhlSearchEnd

End Function


Public Function FU_CMG_Gera_Imagem(prm_u_idt_doc_rbd As Long, _
                                   prm_c_itemid_cm As String, _
                                   prm_SiglaSistema As String, _
                                   prm_NomeArquivo As String, _
                                   prm_ExtArquivo As String) As String

    Dim aItemList()
    Dim strQuery

    On Error GoTo Erro_CM_Gera_Imagem

    FU_CMG_Disable_Menus (&HFFFF - IP2_DISABLE_PRINT)

    'Se prm_u_idt_doc_rbd for numérico, utiliza para query
    If prm_u_idt_doc_rbd <> 0 Then
        strQuery = "@IX1_U_IDT_DOC_RBD@==" & Chr(34) & UCase(Trim(prm_u_idt_doc_rbd)) & Chr(34)
        If VbVhlSearchItem(aItemList, CM_CLASS_DOC_IDT, strQuery) Then
            VG_CMG_T_ERR$ = "Documento não encontrado. u_idt_doc_rbd = " & Trim(CStr(prm_u_idt_doc_rbd)) & "Classe " & CM_CLASS_DOC_IDT
            GoTo Erro_CM_Gera_Imagem
        End If
    Else 'Utiliza prm_c_itemid_cm
        If Len(prm_c_itemid_cm) > 0 Then
            ReDim aItemList(1)
            aItemList(0) = 1
            aItemList(1) = UCase(Trim(prm_c_itemid_cm))
        Else
            VG_CMG_T_ERR$ = "FU_CMG_Gerar_Imagem não recebeu nenhum parâmetro. u_idt_doc_rbd = " & Trim(CStr(prm_u_idt_doc_rbd)) & "ItemID = " & prm_c_itemid_cm
            GoTo Erro_CM_Gera_Imagem
        End If
    End If

    Dim i As Integer
    Dim sTempFile As String
    Dim hI As Long
    If (aItemList(0) > 0) Then
       For i = 1 To aItemList(0)

            sTempFile = FU_CMG_CreateTempFile(prm_SiglaSistema) & "." & Trim(prm_ExtArquivo)
            If Len(sTempFile) = 0 Then
                VG_CMG_T_ERR$ = "Erro na criação do arquivo temporário"
                GoTo Erro_CM_Gera_Imagem
            End If
            If VbVhlExportDocObj(aItemList(i), sTempFile, 0) Then
                VG_CMG_T_ERR$ = "Erro na exportação da imagem pelo Content Manager"
                GoTo Erro_CM_Gera_Imagem
            End If

            Name sTempFile As Mid(sTempFile, 1, InStr(sTempFile, prm_SiglaSistema) - 1) & prm_NomeArquivo & "." & Trim(prm_ExtArquivo)
            sTempFile = Mid(sTempFile, 1, InStr(sTempFile, prm_SiglaSistema) - 1) & prm_NomeArquivo & "." & Trim(prm_ExtArquivo)

       Next
    End If

    FU_CMG_Gera_Imagem = sTempFile

    Exit Function

Erro_CM_Gera_Imagem:

    VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro na FU_CMG_Gera_Imagem. "

    'Verifica erros de VB
    If Err <> 0 Then
        VG_CMG_C_ERR$ = "1254"
        VG_CMG_T_ERR$ = VG_CMG_T_ERR$ & " - " & "Erro VB: " & Trim(Str(Err)) & "-" & Err.Description
        Err.Clear
    End If

    MsgBox VG_CMG_T_ERR$, vbCritical, App.EXEName

End Function


'*********************
'Origem: ONLINE
'*********************
