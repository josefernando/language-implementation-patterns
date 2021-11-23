Attribute VB_Name = "R1MAB004"
' ===================================================
' COMENTARIO SOX
' NOME : RXGCMG02.BAS
' VERSAO : 2
' ===================================================
'/****************************************************************************/
'/*  MÓDULO DE ACESSO AO CONTENT MANAGER 8.4                                 */
'/*  NOME.....: R1PAB001                                                     */
'/*  AUTOR....: REBERT MATHEUS TEIXEIRA                                      */
'/*  DATA.....: 19/12/2013                                                   */
'/*  TIPO.....: MÓDULO BAS CÓPIA VB6                                         */
'/*  OBJETIVO.: ACESSO AO NOVO CONTENT MANAGER 8.4                           */
'/*  OBSERVAÇOES                                                             */
'/*  - ESTE MÓDULO FOI DESENVOLVIDO COM A DEPENDENCIA DA BIBLIOTECA          */
'/*    IW8AQTCTM01VBNX                                                       */
'/*  - ESTA BIBLIOTECA DEVE ESTAR SENDO REFERENCIADA NO PROJETO              */
'/*  - OS ARQUIVOS PARA INCLUSÃO DEVEM ESTAR SENDO REFERENCIADO PELO         */
'/*    SEU CAMINHO COMPLETO                                                  */
'/*                                                                          */
'/*                                                                          */
'/****************************************************************************/

' Data declarations
'Global VhlApplObj As Object
'Global VhlDocsObj As Object
'Global VhlErrorObj As Object

'Constantes de logon no Content Manager
Public Const T_END_SRV_DES As String = "http://cmdes1.itau/CMBSpecificWebService/services/CMWebService"
Public Const T_END_SRV_ACT As String = "http://cmhomol.itau/CMBSpecificWebService/services/CMWebService"
Public Const T_END_SRV_PRD As String = "http://cmseguros.itau/CMBSpecificWebService/services/CMWebService"
'Public Const T_END_SRV_PRD As String = "http://cmcorp2.itau/CMBSpecificWebService/services/CMWebService"

Public Const T_NOM_SRV_DES As String = "OA0LS01"
Public Const T_NOM_SRV_ACT As String = "OA0LS01"
'Public Const T_NOM_SRV_PRD As String = "nlsdb01"
Public Const T_NOM_SRV_PRD As String = "OA0LS01"

Public VG_CMG_C_ERR  As String
Public VG_CMG_T_ERR  As String

Public content As IW8AQTCTM01VBNX.ContentManager

'Logon no CM8.4 - Se os dados não forem recebidos, utiliza as constantes
Public Function FU_CMG_Logon2() As Boolean
    
    FU_CMG_Logon2 = FU_CMG_InicializaModulo("IY0_ITAUSEG_ARQ_ANEXO_APOLICE")
    
End Function

Public Function FU_CMG_InicializaModulo(itemType As String)
    If content Is Nothing Then
        Set content = New IW8AQTCTM01VBNX.ContentManager
    End If
    
    Dim N_ABE  As String
On Error GoTo Trata_Erro
        
    N_ABE = FU_Get_Ambiente()
    
    If itemType = "" Then
        itemType = "IY0_ITAUSEG_ARQ_ANEXO_APOLICE"
    End If
    'DES : Desenvolvimento
    'ACT : Aceite
    'PRD : Produção
    Select Case Trim(UCase(N_ABE))
        Case "PRD"
            'PRODUCAO
            content.servidor = T_NOM_SRV_PRD
            content.url = T_END_SRV_PRD
            content.Usuario = "CONTMAN"
            content.senha = "contman84"
            content.itemType = itemType
        Case "ACT"
            'ACEITE
            content.servidor = T_NOM_SRV_ACT
            content.url = T_END_SRV_ACT
            content.Usuario = "CONTMAN"
            content.senha = "contman84"
            content.itemType = itemType
        Case "DES"
            'DESENVOLVIMENTO
            content.servidor = T_NOM_SRV_DES
            content.url = T_END_SRV_DES
            content.Usuario = "CONTMAN"
            content.senha = "contman84"
            content.itemType = itemType
    End Select

    'G_CMDES_IY0_CM843_E
    'G_CMHOM_IY0_CM843_E
    'G_CMPRD_IY0_CM843_E
  
    'If content.codigoErro = 0 Then
    '    FU_CMG_InicializaModulo = True
    '    Exit Function
    'Else
    '    FU_CMG_InicializaModulo = False
    'End If
    FU_CMG_InicializaModulo = True
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

Public Function FU_CMG_CONSULTACM8(ByVal strQuery As String) As Variant

    Dim metaDados As Variant
    Dim i As Integer
    Dim Y As Integer
    Dim registro As String

    registro = ""
    metaDados = content.consultaCM8(strQuery)
    If (content.MensagemErro <> "") Then
        MsgBox content.MensagemErro, vbCritical, "Erro"
        FU_CMG_CONSULTACM8 = "Err"
        Exit Function
    Else
        If UBound(metaDados) > 0 Then
            For i = 0 To UBound(metaDados)
                For Y = 0 To UBound(metaDados(i))
                    registro = registro & "|" & metaDados(i)(Y)
                Next Y
                'registro = ""
            Next i
            FU_CMG_CONSULTACM8 = registro
        Else
            FU_CMG_CONSULTACM8 = ""
        End If
    End If
End Function

Public Sub SU_IncluirArquivo(ByVal p_t_loc_arq As String, ArrayParameters() As String)
    Dim TipoArquivo As String
    'Dim AttrValue(8) As String
    Dim retorno As Integer
    
    'TipoArquivo = Mid(p_t_loc_arq, (InStr(p_t_loc_arq, ".") + 1), 4)
    
    TipoArquivo = Split(p_t_loc_arq, ".")(UBound(Split(p_t_loc_arq, ".")))
    
    content.incluiArquivoCM8 p_t_loc_arq, TipoArquivo, ArrayParameters
    
    If (content.MensagemErro <> "") Then
        MsgBox content.MensagemErro, vbCritical, "Erro"
'    Else
'        MsgBox "Inclusão efetuada com sucesso!", vbOKOnly, "Aviso"
    End If
    
End Sub

Function FU_TRATA_CONEXAO_CM84(e_acao As String, n_dir_tmp As String)
                                                                                                                                                                                            
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'Autor  : Rebert Matheus Teixeira
'Data   : 29/01/2014
'PR     : PR-2014-0008017 - Migração para o Content Manager 8.4
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                                                                                                                                                                                            
    Dim ctd_conexao As Integer
                                                                                                                                                                                            
    FU_TRATA_CONEXAO_CM84 = False
                                                                                                                                                                                            
    If e_acao <> "CONECTAR" And e_acao <> "DESCONECTAR" Then
        msgerro = "[FU_TRATA_CONEXAO_CMG] Tipo de ação inválida = " & e_acao
        Exit Function
    End If
                                                                                                                                                                                            
Tenta_Conexao:
                                                                                                                                                                                            
    'Conectar no Content Manager
    If e_acao = "CONECTAR" Then
        If i_conexao = True Then GoTo Traz_Arquivo
        If FU_CMG_Logon = i_conexao Then
            If ctd_conexao = 5 Then
                'v57 Emilio - Obs.: Retirar comentário quando não existir mais FTP
                'msgerro = "Erro ao tentar conectar no Content Manager."
                'Exit Function
                R1FAB005.pa3d_status.Caption = "R1FAB005 - ATENÇÃO ! Erro ao conectar no Content Manager."
                GoTo Fim
            Else
                ctd_conexao = ctd_conexao + 1
                GoTo Tenta_Conexao
            End If
        Else
            i_conexao = True
        End If
Traz_Arquivo:
        'Exporta arquivo do Content Manager
        If Not FU_Traz_Arquivo_CM84(n_dir_tmp) Then Exit Function
    End If
                                                                                                                                                                                            
    'Desconectar do Content Manager
    If e_acao = "DESCONECTAR" Then
        If i_conexao = True Then
            If Not FU_CMG_Logoff Then
                msgerro = "Erro ao desconectar do Content Manager"
                Exit Function
            End If
            i_conexao = False
        End If
    End If
Fim:
    FU_TRATA_CONEXAO_CM84 = True
                                                                                                                                                                                            
End Function

Public Function FU_Traz_Arquivo_CM84(n_dir_tmp As String)
                                                                                                                                                                                            
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
'   Autor: Emilio Lacerda Conde
'   Data de criação: 28/06/2006
'   SSI: EV05/6124 - Solução Word para Diferenciado - Transportes
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                                                                                                                                                                                            
    'Dim aItemList() As Variant  'Array de Código Interno do Content Manager para o arquivo
    Dim cmd_Query   As String   'Comando de Consulta do Arquivo no Content Manager
    Dim n_arq_exp   As String   'Nome do arquivo de exportação do Content Manager para Pasta Local
                                                                                                                                                                                            
    On Error GoTo Trata_Erro
    
    If content Is Nothing Then
        FU_CMG_Logon2
    End If
                                                                                                                                                                                            
    'Inicia variáveis
    FU_Traz_Arquivo_CM84 = False
                                                                                                                                                                                            
    'ReDim aItemList(-1 To -1)
    cmd_Query = ""
    n_arq_exp = ""
    msgerro = ""
    
    CMG_APO.IY0_N_ARQ_ESF_APO = UCase(n_arq_esf_apo)
    cmd_Query = "/IY0_ITAUSEG_ARQ_ANEXO_APOLICE[@IY0_N_ARQ_ESF_APO=""" & CMG_APO.IY0_N_ARQ_ESF_APO & """]"
                                                                                                                                                                                            
    n_arq_exp = n_dir_tmp & CMG_APO.IY0_N_ARQ_ESF_APO
    
    'Dim retorno As Integer
    content.downloadArquivoCM8 n_arq_exp, cmd_Query, False
    
    If (content.codigoErro = 1) Then
        msgerro = "Não foi encontrado o arquivo no Content Manager." & vbCrLf & _
        "Nome do arquivo : " & Chr(34) & Trim(UCase(CMG_APO.IY0_N_ARQ_ESF_APO)) & Chr(34)
        GoTo Trata_Erro
    ElseIf (content.codigoErro <> 1) And (content.MensagemErro <> "") Then
        msgerro = "Problema ao buscar o arquivo no Content Manager." & vbCrLf & _
        "Erro: " & Trim(content.MensagemErro)
        GoTo Trata_Erro
    Else
        MsgBox "Download efetuado com sucesso!", vbOKOnly, "Aviso"
        GoTo Fim
    End If
    
'    'Busca o ID do arquivo de especificação da apólice/aditamento
'    'If VbVhlSearchItem(aItemList, CLASSE_CMG_ANEXO, cmd_Query) <> 0 Then
'    If content.consultaCM8(cmd_Query) <> 0 Then
'        If ulRC = 12003 Then    'No items found
'            msgerro = "Não foi encontrado o arquivo no Content Manager." & vbCrLf & _
'                      "Nome do arquivo : " & Chr(34) & Trim(UCase(n_arq_esf_apo)) & Chr(34)
'            GoTo Trata_Erro
'        End If
'
'        msgerro = "Problema ao buscar o ID do arquivo no Content Manager." & vbCrLf & _
'                  "Nome do arquivo: " & Trim(UCase(n_arq_esf_apo))
'        GoTo Trata_Erro
'    End If
'
'    'Verifica se existe mais de um item para o nome de arquivo pesquisado
'    If aItemList(0) > 1 Then    'Qtde. Itens (ID Content Manager do arquivo)
'        msgerro = "Existem " & Trim(Str(aItemList(0))) & " itens para arquivo pesquisado." & vbCrLf & _
'                  "IY0_N_ARQ_CPS_IMP = " & n_arq_esf_apo
'        GoTo Trata_Erro
'    End If
'
'    'Exporta (Busca) do Content Manager
'    If VbVhlExportDocObj(aItemList(1), n_dir_tmp & n_arq_esf_apo, 0) <> 0 Then
'        msgerro = "Erro na exportação do arquivo " & n_arq_esf_apo & "."
'        GoTo Trata_Erro
'    End If
'
'    If Dir(n_dir_tmp & n_arq_esf_apo) = "" Then
'        msgerro = "Erro na exportação do arquivo. Não foi encontrado o arquivo." & vbCrLf & _
'                  "Diretório: " & n_dir_tmp & vbCrLf & _
'                  "Nome do arquivo: " & n_arq_esf_apo
'        GoTo Trata_Erro
'    End If
                                                                                                                                                                                            
                                                                                                                                                                                            
Fim:
    FU_Traz_Arquivo_CM84 = True
                                                                                                                                                                                            
    Exit Function
                                                                                                                                                                                            
Trata_Erro:
                                                                                                                                                                                            
    If Err.Number <> 0 Then msgerro = "Erro VB: " & Trim(Str(Err.Number)) & " - " & Err.Description
                                                                                                                                                                                            
    If ulRC <> 0 Then
        If msgerro <> "" Then
            msgerro = msgerro & vbCrLf & vbCrLf & "Erro CMG: [" & ulRC & "] " & Trim(VhlErrorObj.ErrorMessage)
        Else
            msgerro = "Erro CMG: [" & ulRC & "] " & Trim(VhlErrorObj.ErrorMessage)
        End If
    End If
                                                                                                                                                                                            
End Function
