Attribute VB_Name = "GEMOAJU1"
' =================================================== 
' COMENTARIO SOX 
' NOME : GEMOAJU1.BAS
' VERSAO : 1
' =================================================== 
Option Explicit
' ==================================================================
' Observações:
' ************
' Antigo GEMAJUST.BAS proveniente do WIN95/CONVERSOR
'
' -------------------------------------------------------------------
' Dependencias: 
'$#Componente:
'$#Modulos: GEMOVR01.BAS
' ==================================================================


'==========================================================================
'                               Observações:
'Objetivo:
'
'==========================================================================

Private Const CL_MENSAGEM_PADRAO = "Anote a mensagem a seguir e contate o analista responsável."
Private Declare Function CharToOem Lib "user32" Alias "CharToOemA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long

Private Function FU_CharToOem(lpszSrc As String, lpszDst As String) As Long

    'Função originalmente localizada no módulo GEMOAPI1.BAS
    FU_CharToOem = CharToOem(ByVal lpszSrc, ByVal lpszDst)

End Function
Function FU_IsDate(ByVal asrData As String) As Boolean
    'Descrição : Function FU_IsDate(asrData)
    'Objetivo  : Substituir a função IsDate que mudou comportamento no Win95
    '
    'Parâmetros: asrData$ - String com uma data
    'Retornos:   False - Data inválida.
    '            True  - Data OK.
    'Exemplo   :
    '
    '  If Not FU_IsDate (MinhaData$) Then
    '     MsgBox "Data Inválida"
    '  End If
    '
    'Autor      : André Leão de Paula Pinto
    'Data       : 09/09/1999
    '
    'Catalogacao: Joao Marcelo
    'Data       : 04/10/1999
    'GSNT - Itau Seguros S/A
    '
    'HISTÓRICO DE REVISÃO
    '====================
    '
    ' DATA       PROGRAMADOR   ALTERAÇÃO
    ' ====       ===========   =========
    ' 19/10/1999 Joao Marcelo  Aceitar data parametro em qualquer formato.
    
    Dim DIA     As Integer
    Dim MES     As Integer
    Dim ANO     As Integer
    Dim I       As Integer
    Dim lsrByte As String
    
    ' PROCURA POR UM BYTE NAO NUMERICO NA DATA
    ' SE ENCONTRAR ESTE BYTE, VERIFICA SE ELE NÃO É BARRA OU ESPAÇO
    ' CASO NÃO SEJA, RETORNA O VALOR DO ISDATE()
    ' COBRE CASOS EM QUE A DATA EH "Oct 10 1998", por exemplo
    For I% = 1 To Len(asrData$)
       lsrByte$ = Mid$(asrData$, I, 1)
       If Not IsNumeric(lsrByte$) Then
         If (lsrByte$ <> " ") And (lsrByte$ <> "/") Then
            FU_IsDate = IsDate(asrData$)
            Exit Function
         End If
       End If
    Next I%

    FU_IsDate = False
    
    If Not IsDate(asrData) Then Exit Function
    
    DIA = CInt(Mid(asrData, 1, 2))
    MES = CInt(Mid(asrData, 4, 2))
    ANO = CInt(Mid(asrData, 7, 4))
        
    If ANO < 1900 Then Exit Function
    
    If MES < 1 Or MES > 12 Then Exit Function
    
    If MES = 2 Then
        If ANO Mod 4 = 0 Then
            If DIA < 1 Or DIA > 29 Then Exit Function
        Else
            If DIA < 1 Or DIA > 28 Then Exit Function
        End If
    End If
    
    If MES = 4 Or MES = 6 Or MES = 9 Or MES = 11 Then
        If DIA < 1 Or DIA > 30 Then Exit Function
    Else
        If DIA < 1 Or DIA > 31 Then Exit Function
    End If
    
    FU_IsDate = True

End Function

Function FU_Verifica_Saida(Unloadmode As Integer, Formulario As Form) As Integer

    'Marcelo Roberto Pressi O(Origin) - 13/08/93
    'Descrição : Function FU_Verifica_Saida
    'Objetivo  : Não encerra o Windows caso a aplicação esteja ativa.
    'Parâmetros: <Unloadmode> - e a variavel Unloadmode do evento QueryUnload
    '            <Me> - e a indentificação do formulário.
    'Retorno   : TRUE OU FALSE
    'Exemplo   : Inserir no envento QueryUnlod do Form
    '            Cancel=FU_verifica_saida(Unloadmode,Me)
    
    FU_Verifica_Saida = False
    If Unloadmode > 1 Then
       MsgBox "Não pode finalizar a aplicação de outro modo que não seja dentro da mesma.", 16, Formulario.Caption
       FU_Verifica_Saida = True
    End If
    
End Function

Function FU_Converte_Mainframe(campo As String) As String
'** Retorna a palavra ou texto sem acento
'** Autor : Alexandre
'** Data : 26/05/1994
'** Ex: Variavel$="DECOMPOSIÇÃO"
'**     Texto_Convertido$=FU_Converte_Mainframe(Variavel$)

Dim Tamanho, I  As Integer
Dim letra       As String

Tamanho = Len(campo)

For I = 1 To Tamanho
   letra = Mid$(campo, I, 1)
   If (Asc(letra) >= 192 And Asc(letra) <= 198) Then       'A
      letra = "A"
   ElseIf (Asc(letra) >= 224 And Asc(letra) <= 230) Then   'a
      letra = "a"
   ElseIf (Asc(letra) >= 200 And Asc(letra) <= 203) Then   'E
      letra = "E"
   ElseIf (Asc(letra) >= 232 And Asc(letra) <= 235) Then   'e
      letra = "e"
   ElseIf (Asc(letra) >= 204 And Asc(letra) <= 207) Then   'I
      letra = "I"
   ElseIf (Asc(letra) >= 236 And Asc(letra) <= 239) Then   'i
      letra = "i"
   ElseIf (Asc(letra) >= 210 And Asc(letra) <= 214) Then   'O
      letra = "O"
   ElseIf (Asc(letra) >= 242 And Asc(letra) <= 246) Then   'o
      letra = "o"
   ElseIf (Asc(letra) >= 217 And Asc(letra) <= 220) Then   'U
      letra = "U"
   ElseIf (Asc(letra) >= 249 And Asc(letra) <= 252) Then   'u
      letra = "u"
   ElseIf (Asc(letra) = 199) Then   'Ç
      letra = "C"
   ElseIf (Asc(letra) = 231) Then   'ç
      letra = "c"
   ElseIf (Asc(letra) = 170) Then   'ª
      letra = "a"
   ElseIf (Asc(letra) = 186) Then   'º
      letra = "o"
   End If
   Mid$(campo, I) = letra
Next
FU_Converte_Mainframe = campo
End Function

Function FU_Codigo_Pagina(Nome_Arquivo As String) As Integer

'Objetivo       : Converter formato do arquivo desejado
'                 Padrão ANSI(WINDOWS) para padrão DOS
'Data           : 06/02/1996
'Responsável    : Alexandre (GSDS-R:3798)
'Parâmetro(s)   : Nome_Arquivo   - Nome do Arquivo a ser alterado
'Retorno        : TRUE,FALSE
'****************************************************************************
'OBS            : Esta função altera o Mousepointer
'****************************************************************************

Dim NBuffer0 As Integer
Dim NBuffer1 As Integer

Dim NLoc As Long
Dim I As Integer
Dim a As Long
Dim letra As String * 1
Dim lpOemStr As String * 1

Dim Nome_ArquivoTmp As String

On Error Resume Next
FU_Codigo_Pagina = False
    
    Screen.MousePointer = 11
    Err = 0: NBuffer0 = FreeFile: NBuffer1 = FreeFile + 1
    Open Nome_Arquivo For Binary Access Read As NBuffer0
    Nome_ArquivoTmp = Mid$(Nome_Arquivo, 1, InStr(Nome_Arquivo, ".")) & "TMP"
    Open Nome_ArquivoTmp For Binary Access Write As NBuffer1
    If Err <> 0 Then
        Screen.MousePointer = 0
        Close #NBuffer0, #NBuffer1
        Exit Function
    End If
    
    Do Until EOF(NBuffer0)
        Get #NBuffer0, , letra
        If EOF(NBuffer0) Then Exit Do
        a = FU_CharToOem(letra, lpOemStr)   'Tirei ByVal antes de letra e antes de lpOemStr
        Put #NBuffer1, , lpOemStr
    Loop
    Close #NBuffer0, #NBuffer1
        
    Err = 0
    FileCopy Nome_ArquivoTmp, Nome_Arquivo
    If Err <> 0 Then
        Screen.MousePointer = 0
        Kill Nome_ArquivoTmp
        Exit Function
    End If
    Kill Nome_ArquivoTmp
    
    Screen.MousePointer = 0

    FU_Codigo_Pagina = True

End Function
Function FU_Extenso(Valor As Variant, Moeda_Singular As String, moeda_plural As String) As String

'Transforma valor passado em números em extenso
'Autor : Marcelo Murata
'Data : 12/08/1994

Const Conj_virgula = " , "
Const Conj_e = " e "
Static Centena(10) As String        'tabela interna com os extensos de centena
Static Dezena(10) As String         'tabela interna com os extensos de dezena
Static Unidade(20) As String        'tabela interna com os extensos de unidade
Dim Str_Valor As String             'valor no formato string
Dim I As Integer                    'incrementador
Dim Conta_milhar As Integer         'contador de casas de milhar
Dim Desc_mil As String              'descrição da casa de milhar
Dim Prox_mil As Currency            'valor da próxima milhar
Dim Centavos As Integer
Dim Str_Centavos As String
ReDim Num_Mil(5) As Integer
ReDim Num_Centena(5) As Integer
ReDim Num_Dezena(5) As Integer
ReDim Num_Unidade(5) As Integer
ReDim Extensos(5) As String
Dim Str_Moeda As String
Dim letra As String
Dim Aux_Valor As String
Dim Posicao As Integer
    'Tabela interna com os valores por extenso
    Unidade(1) = "um"
    Unidade(2) = "dois"
    Unidade(3) = "três"
    Unidade(4) = "quatro"
    Unidade(5) = "cinco"
    Unidade(6) = "seis"
    Unidade(7) = "sete"
    Unidade(8) = "oito"
    Unidade(9) = "nove"
    Unidade(10) = "dez"
    Unidade(11) = "onze"
    Unidade(12) = "doze"
    Unidade(13) = "treze"
    Unidade(14) = "quatorze"
    Unidade(15) = "quinze"
    Unidade(16) = "dezesseis"
    Unidade(17) = "dezessete"
    Unidade(18) = "dezoito"
    Unidade(19) = "dezenove"
    Dezena(2) = "vinte"
    Dezena(3) = "trinta"
    Dezena(4) = "quarenta"
    Dezena(5) = "cinquenta"
    Dezena(6) = "sessenta"
    Dezena(7) = "setenta"
    Dezena(8) = "oitenta"
    Dezena(9) = "noventa"
    Centena(1) = "cem"
    Centena(2) = "duzentos"
    Centena(3) = "trezentos"
    Centena(4) = "quatrocentos"
    Centena(5) = "quinhentos"
    Centena(6) = "seiscentos"
    Centena(7) = "setecentos"
    Centena(8) = "oitocentos"
    Centena(9) = "novecentos"

    'Formatação do valor
    On Error Resume Next
    Posicao = 0
    Aux_Valor = ""
    If Mid$(Valor, Len(Valor) - 2, 1) = "." Then Mid(Valor, Len(Valor) - 2, 1) = ","
    For I = 1 To Len(Valor) - 3
        letra = Mid$(Valor, I, 1)
        If (letra <> "," And letra <> ".") Then
            Aux_Valor = Aux_Valor & letra
        End If
    Next I
    Valor = Aux_Valor & Right$(Valor, 3)
    Str_Valor = Format$(CCur(Valor), "000000000000000.00")
    If Err <> 0 Then
        FU_Extenso = ""
        Exit Function
    End If
    On Error GoTo 0
    Centavos = Val(Right$(Str_Valor, 2))
    Conta_milhar = 0
    'Tratamento do número de 3 em 3 casas
    For I = 1 To 15 Step 3
        Num_Centena(Conta_milhar) = Val(Mid$(Str_Valor, I, 1))       'Centena
        Num_Dezena(Conta_milhar) = Val(Mid$(Str_Valor, I + 1, 1))    'Dezena
        Num_Unidade(Conta_milhar) = Val(Mid$(Str_Valor, I + 2, 1))   'Unidade
        Num_Mil(Conta_milhar) = Num_Centena(Conta_milhar) & Num_Dezena(Conta_milhar) & Num_Unidade(Conta_milhar)
        Select Case Num_Centena(Conta_milhar)                   'Centena
            Case 0
            Case 1
                If (Num_Dezena(Conta_milhar) = 0) And (Num_Unidade(Conta_milhar) = 0) Then
                    Extensos(Conta_milhar) = Centena(Num_Centena(Conta_milhar))
                Else
                    Extensos(Conta_milhar) = "cento" & Conj_e
                End If
            Case Else
                If (Num_Dezena(Conta_milhar) = 0) And (Num_Unidade(Conta_milhar) = 0) Then
                    Extensos(Conta_milhar) = Centena(Num_Centena(Conta_milhar))
                Else
                    Extensos(Conta_milhar) = Centena(Num_Centena(Conta_milhar)) & Conj_e
                End If
        End Select
        Select Case Num_Dezena(Conta_milhar) & Num_Unidade(Conta_milhar)    'dezena/unidade
            Case 0
            Case Is < 20
                    Extensos(Conta_milhar) = Extensos(Conta_milhar) & Unidade(Num_Dezena(Conta_milhar) & Num_Unidade(Conta_milhar))
            Case Else
                If (Num_Unidade(Conta_milhar) = 0) Then
                    Extensos(Conta_milhar) = Extensos(Conta_milhar) & Dezena(Num_Dezena(Conta_milhar))
                Else
                    Extensos(Conta_milhar) = Extensos(Conta_milhar) & Dezena(Num_Dezena(Conta_milhar)) & Conj_e
                End If
                Extensos(Conta_milhar) = Extensos(Conta_milhar) & Unidade(Num_Unidade(Conta_milhar))
        End Select
        Conta_milhar = Conta_milhar + 1
    Next I
    'Tratamento das casas de milhar
    For I = 0 To 3
        Select Case I
        Case 0
            Prox_mil = Num_Mil(I + 1) & Num_Mil(I + 2) & Num_Mil(I + 3) & Num_Mil(I + 4)
            Select Case Num_Mil(I)
            Case 0
                Desc_mil = ""
            Case 1
                Desc_mil = " trilhão"
            Case Else
                Desc_mil = " trilhões"
            End Select
        Case 1
            Prox_mil = Num_Mil(I + 1) & Num_Mil(I + 2) & Num_Mil(I + 3)
            Select Case Num_Mil(I)
            Case 0
                Desc_mil = ""
            Case 1
                Desc_mil = " bilhão"
            Case Else
                Desc_mil = " bilhões"
            End Select
        Case 2
            Prox_mil = Num_Mil(I + 1) & Num_Mil(I + 2)
            Select Case Num_Mil(I)
            Case 0
                Desc_mil = ""
            Case 1
                Desc_mil = " milhão"
            Case Else
                Desc_mil = " milhões"
            End Select
        Case 3
            Prox_mil = Num_Mil(I + 1)
            Select Case Num_Mil(I)
            Case 0
                Desc_mil = ""
            Case Else
                Desc_mil = " mil"
            End Select
        End Select
        If Desc_mil <> "" Then
            Select Case Prox_mil
            Case 0
                If I = 3 Then
                    Desc_mil = Desc_mil
                Else
                    Desc_mil = Desc_mil & " de "
                End If
            Case Is <= 100
                Desc_mil = Desc_mil & Conj_e
            Case Else
                Desc_mil = Desc_mil & Conj_virgula
            End Select
            Extensos(I) = Extensos(I) & Desc_mil
        End If
    Next I
    
    'Tratamento dos centavos
    Select Case Centavos                            'dezena/unidade
        Case 0
            Str_Centavos = ""
        Case 1
            Str_Centavos = Unidade(Centavos) & " centavo"
        Case Is < 20
            Str_Centavos = Unidade(Centavos) & " centavos"
        Case Else
            If (Centavos Mod 10 = 0) Then
                Str_Centavos = Dezena(Centavos / 10) & " centavos"
            Else
                Str_Centavos = Dezena(Centavos \ 10)
                Str_Centavos = Str_Centavos & Conj_e & Unidade(Centavos Mod 10) & " centavos"
            End If
    End Select
    Select Case Trim$(Extensos(0) & Extensos(1) & Extensos(2) & Extensos(3) & Extensos(4) & Extensos(5))
    Case ""
        Str_Moeda = ""
    Case "um"
        Str_Moeda = Moeda_Singular
    Case Else
        Str_Moeda = moeda_plural
    End Select
    If (Str_Moeda <> "") And (Str_Centavos <> "") Then Str_Moeda = Str_Moeda & Conj_e
    FU_Extenso = Extensos(0) & Extensos(1) & Extensos(2) & Extensos(3) & Extensos(4) & Extensos(5) & " " & Str_Moeda & Str_Centavos

End Function

Function FU_Identifica_Apl(Texto As String) As String

'Atribui para a variável Projeto_Anterior o nome do projeto chamador,
'caso este foi passado no parâmetro.
'Extrai identificador do tipo de aplicação do projeto
'O identificador é precedido por "L="
'Identificadores :
'   - Corporativo           = C
'   - Massa                 = M
'   - Diferenciado          = D
'   - Batch Corporativo     = BC
'   - Batch Departamental   = BD
'Retorna :  Identificador
'           Texto recebido como parâmetro sem o Identificador

Dim Posicao_Inicio As Integer
Dim Posicao_Fim As Integer
Dim letra As String
Dim Texto_Aux As String
Dim Inicio_Projant, Fim_Projant As Integer
Dim I As Integer
Dim W_par As String
Dim W_apl As String

    'Seleciona Projeto Anterior do argumento
    Fim_Projant = InStr(Texto, ".EXE")
    If Fim_Projant = 0 Then
        Projeto_Anterior = ""
    Else
        For I = Fim_Projant To 1 Step -1
            If Mid$(Texto, I, 1) = "," Then Exit For
            Inicio_Projant = I
        Next I
        Projeto_Anterior = Mid$(Texto, Inicio_Projant, Fim_Projant - Inicio_Projant + 4)
    End If

    If Texto = "" Then Texto = Command
    Posicao_Inicio = InStr(Texto, "L=")
    If Posicao_Inicio = 0 Then Exit Function
    Posicao_Fim = InStr(Posicao_Inicio, Texto, ",")
    If Posicao_Fim = 0 Then
        Posicao_Fim = Len(Texto)
        W_apl = Mid$(Texto, Posicao_Inicio + 2)
        If Parametros = "" Then
            Parametros = Mid$(Texto, Posicao_Inicio)
        Else
            Parametros = Mid$(Texto, Posicao_Inicio) & "," & Parametros
        End If
        Posicao_Inicio = Posicao_Inicio - 1
    Else
        W_apl = Mid$(Texto, Posicao_Inicio + 2, Posicao_Fim - Posicao_Inicio - 2)
        If Parametros = "" Then
            Parametros = Mid$(Texto, Posicao_Inicio, Posicao_Fim - Posicao_Inicio)
        Else
            Parametros = Mid$(Texto, Posicao_Inicio, Posicao_Fim - Posicao_Inicio) & "," & Parametros
        End If
    End If
    FU_Identifica_Apl = W_apl
    
    For I = 1 To Len(Texto)
        If (I < Posicao_Inicio) Or (I > Posicao_Fim) Then
            letra = Mid$(Texto, I, 1)
            Texto_Aux = Texto_Aux + letra
        End If
    Next I
    Texto = Texto_Aux

End Function



Sub SU_Ajusta_Form(Formulario As Form, Tipoform As Integer)
        
    'Célio (Origin) - 28/05/93
    'Descrição : Sub SU_Ajusta_Form.
    'Objetivo  : Estabelece as propriedades iniciais padrões do formulário.
    'Parâmetros: <Formulario> - Nome do formulário a ser ajustado.
    '            <Tipoform  > - Indicador referente ao tamanho do formulário.
    'Retorno   : Nenhum
    'Exemplo   : SU_Ajusta_Form me,1
    '
    'HISTÓRICO DE REVISÃO
    '====================
    '
    ' DATA       PROGRAMADOR   ALTERAÇÃO
    ' ====       ===========   =========
    ' 19/10/1999 Joao Marcelo  Introdução do tamanho 6 (tela inteira no Win95 640x480)
    ' 28/11/2002 Eliane        Introdução do tamanho 7 (tela inteira no Win95 800x600)
    ' 27/12/2002 Eliane        Introdução do tamanho 8

Dim Nheight As Integer  'Altura  do formulario
Dim Nwidth  As Integer  'Largura do formulario
Dim Ntop    As Integer  'Topo do formulario
Dim Nleft   As Integer  'Esquerda do formulario

    Ntop = (Screen.Height) / 2 - Formulario.Height / 2 'centraliza o formulário
    Nleft = (Screen.Width) / 2 - Formulario.Width / 2 'centraliza o formulário

    Select Case Tipoform
    Case 1
       Nheight = 5505
       Nwidth = 8205
    Case 2
       Nheight = 3795
       Nwidth = 8205
    Case 3
       Nheight = 6300
       Nwidth = 8600
    Case 4
       Nheight = 6700
       Nwidth = 8700
    Case 5
       Nheight = 4400
       Nwidth = 8700
    Case 6 ' Ocupa a tela inteira em Windows 95 (640 x 480)
       Nheight = 6800
       Nwidth = 9600
       Ntop = 0
       Nleft = 0
    Case 7 ' *** Atenção: esse parâmetro funciona adequadamente somente na resolução 800 x 600
       Nheight = 8400
       Nwidth = 11600
    Case 8
       Nheight = 6600
       Nwidth = 9600
    Case Else
       MsgBox "Parametro Inválido", 16
       Exit Sub
    End Select
    
    Formulario.Height = Nheight         'ajusta a altura do formulário
    Formulario.Width = Nwidth           'ajusta a largura do formulário
    Formulario.Top = Ntop               'centraliza o formulário
    Formulario.Left = Nleft             'centraliza o formulário
    Formulario.BackColor = QBColor(7)   'cor cinza claro
    Formulario.WindowState = 0          'Janela Normal
    Formulario.Refresh
        
End Sub

Sub SU_Limita_Form(Formulario As Form, Tipoform As Integer)

    'Célio (Origin) - 25/11/93
    'Objetivo  : Estabelece as propriedades de limite do formulário no evento Resize.
    'Parâmetros: <Formulario> - Nome do formulário a ser limitado.
    '            <Tipoform  > - Indicador referente ao tamanho do formulário.
    'Retorno   : Nenhum
    'Exemplo   : SU_limita_form me,1

Dim MinHeight As Integer
Dim MaxHeight As Integer
Dim MinWidth  As Integer
Dim MaxWidth  As Integer
Dim NewHeight As Integer
Dim NewWidth  As Integer

    MinHeight = 3500
    MinWidth = 3500
    If Tipoform = 1 Then
       MaxHeight = 5505
       MaxWidth = 8205
    ElseIf Tipoform = 2 Then
       MaxHeight = 3795
       MaxWidth = 8205
    ElseIf Tipoform = 3 Then
       MaxHeight = 6300
       MaxWidth = 8600
    End If


    If Formulario.WindowState <> vbMinimized Then
        If Formulario.Width < MinWidth Then NewWidth = MinWidth Else NewWidth = Formulario.Width
        If Formulario.Height < MinHeight Then NewHeight = MinHeight Else NewHeight = Formulario.Height
        Formulario.Move Formulario.Left, Formulario.Top, NewWidth, NewHeight
        
        If Formulario.Width > MaxWidth Then NewWidth = MaxWidth Else NewWidth = Formulario.Width
        If Formulario.Height > MaxHeight Then NewHeight = MaxHeight Else NewHeight = Formulario.Height
        Formulario.Move Formulario.Left, Formulario.Top, NewWidth, NewHeight
    End If

End Sub



Sub SU_Muda_Pagina(form_anterior As Form, form_atual As Form)

    'Célio (Origin) - 18/06/93
    'Objetivo  : efetua uma mudança de página
    '            atualizando o top e o left do
    '            formulário atual e deixando a
    '            propriedade Visible do formulario
    '            anterior FALSE.
    'Parâmetros: <Form_anterior> - Nome do formulário a ser desativado da tela.
    '            <Form_atual   > - Nome do formulário a ser ativado na tela.
    'Retorno   : Nenhum
    'Exemplo   : SU_Muda_Pagina formulario1,formulario2

    form_atual.Top = form_anterior.Top
    form_atual.Left = form_anterior.Left
    form_anterior.Visible = False
    form_atual.Visible = True
    form_atual.Refresh

End Sub

Sub SU_Verifica_Duplicidade(Formulario As Form)

' Observação: Esta função foi desenvolvida porque no VB 5.0, quando se  tenta ativar uma
'             aplicação cujo formulário esteja desabilitado ou invisível, é retornado um
'             código de erro (5). Este erro pode ser  ignorado, pois,  como a  aplicação
'             está desabilitado ou invisível, o usuário não conseguiria mesmo fazer nada
'             com ela.   Entretanto deve-se  ficar atento com possíveis outras causas de
'             erro de retornem o mesmo código, o que deve ser  muito improvável de acon-
'             tecer.
'             Dúvidas ??? Procure o Edilson.

100 Dim CaptionDoForm
110
120 On Error GoTo SU_Verifica_DuplicidadeErro
130
140 If App.PrevInstance Then
150     CaptionDoForm = Formulario.Caption
160     Formulario.Caption = "ABC6D"
170     AppActivate CaptionDoForm
180     End
190 End If
200
210 On Error GoTo 0
220
230 Exit Sub

SU_Verifica_DuplicidadeErro:

    If Err = 5 And Erl = 170 Then
        Resume Next
    Else
        MsgBox CL_MENSAGEM_PADRAO, vbOK + vbCritical, "Atenção"
        MsgBox "O erro abaixo ocorreu na linha " & Erl & " da função SU_Verifica_Duplicidade95" & Chr(13) & "Erro: " & Str$(Err) & " (" & Error & ")", vbOK + vbCritical, App.EXEName & " - SU_Verifica_Duplicidade95 Error"
        End
    End If
    
End Sub

