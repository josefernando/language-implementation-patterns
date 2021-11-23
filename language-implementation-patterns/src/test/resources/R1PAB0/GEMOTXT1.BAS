Attribute VB_Name = "GEMOTXT1"
' ===================================================
' COMENTARIO SOX
' NOME : GEMOTXT1.BAS
' VERSAO : 1
' ===================================================
Option Explicit
' ==================================================================
' ObservaÃ§Ãµes:
' ************
' Este mÃ³dulo estava duplicado nos ambientes WIN95/CONVERSOR e 
' SCXT094CTO com o nome GEMTXT01.BAS. mesmo ele estando.
' PorÃ©m, ele nÃ£o Ã© indicado para programas BATCH por conter chamadas 
' a MSGBOX.
' ------------------------------------------------------------------
' Dependencias:
'	NENHUMA
' ==================================================================
' ==================================================================


'Rotinas Gerais mantidas pelo POOL DE PROGRAMAÃ‡ÃƒO
'------------------------------------------------------------------------
'OBJETIVO   : Separa um bloco de texto em linhas de um determina-
'             do tamanho.
'
'RESPONSÃVEL: Mario A. Radovich
'
'DATA       : 20/01/1997
'
'OBS        : Se TamTabula = 0 os parÃ¡grafos serÃ£o exibidos sem o
'             recuo da primeira linha!
'
'             No vetor TextoOut nÃ£o deve ser considerado o elemento 0!
'-------------------------------------------------------------------------
  


  '-------------------------------------------------------------------
  'Constantes e variÃ¡veis utilizadas pelas rotinas de scaneamento de
  'textos.
  
  Const NORMAL = 0
  Const FIM_DE_PARAGRAFO = 1
  Const FIM_DE_TEXTO = 2
  '-------------------------------------------------------------------

Function fu_monta_linha (Palavras() As String, len_linha As Integer, Justifica As Integer) As String
  Dim Faltam  As Integer, NumPalavras As Integer
  Dim Preenche As Integer, i As Integer, s_aux As String, NumCaracs As Integer

  NumPalavras = UBound(Palavras)
  s_aux = ""
  
  NumCaracs = 0
  For i = 1 To NumPalavras
    NumCaracs = NumCaracs + Len(Palavras(i))
  Next i

  If Not Justifica Then
    For i = 1 To NumPalavras
      s_aux = s_aux + Palavras(i)
    Next i
  Else
    Faltam = len_linha - NumCaracs
    If NumPalavras > 1 Then
      Preenche = -Int(-(Faltam) / (NumPalavras - 1))
    Else
      Preenche = 0
      Faltam = 0
    End If
    
    For i = 1 To NumPalavras
      If i = 1 Then
        s_aux = Palavras(1)
      Else
        If Faltam > 0 Then
          If Faltam > Preenche Then
            s_aux = s_aux + Space$(Preenche)
            Faltam = Faltam - Preenche
          Else
            s_aux = s_aux + Space$(Faltam)
            Faltam = 0
          End If
        End If
        
        s_aux = s_aux + Palavras(i)
      End If
      
    Next i

  End If
  
  fu_monta_linha = RTrim$(s_aux)
End Function

Function fu_monta_linha_col (Palavras() As String, len_linha As Integer) As String
  Dim NumPalavras As Integer
  Dim i  As Integer, s_aux As String, NumCaracs As Integer

  NumPalavras = UBound(Palavras)
  s_aux = ""
  
  NumCaracs = 0
  For i = 1 To NumPalavras
    NumCaracs = NumCaracs + Len(Palavras(i))
  Next i
  
  For i = 1 To NumPalavras
    s_aux = s_aux + Palavras(i)
  Next i
  
  fu_monta_linha_col = RTrim$(s_aux)
End Function

Function fu_traz_linha (Texto As String, Palavras() As String, Ini As Long, LenLinha As Integer) As Integer
  Dim Status As Integer, Sai As Integer, LenAux As Integer
  Dim Palavra  As String
  Dim PosLida As Long, CaracsLinha As Integer, NumPalavras As Integer

  ReDim Palavras(0)
  
  PosLida = Ini
  
  NumPalavras = 0
  CaracsLinha = LenLinha

  Do
    Sai = False
    Status = fu_traz_palavra(Texto, PosLida, Palavra, LenLinha)
    
    Select Case Status
      Case NORMAL
        If RTrim$(Palavra) = "" Then
          LenAux = Len(Palavra)
        Else
          LenAux = Len(RTrim$(Palavra))
        End If

        If LenAux <= (CaracsLinha - 1) Then
          NumPalavras = NumPalavras + 1
          
          ReDim Preserve Palavras(NumPalavras)
          Palavras(NumPalavras) = Palavra
          
          CaracsLinha = CaracsLinha - Len(Palavra)
          Ini = PosLida
        Else
          Sai = True
        End If

      Case FIM_DE_PARAGRAFO
        Ini = PosLida
        Sai = True

      Case FIM_DE_TEXTO
        Ini = PosLida
        Sai = True

      Case Else
        MsgBox "Erro na FU_TRAZ_LINHA", 16   'MB_ICONSTOP
        Stop
    End Select

  Loop Until Sai
  
  fu_traz_linha = Status
End Function

Function fu_traz_linha_col (Texto As String, Palavras() As String, Ini As Long, LenLinha As Integer) As Integer
  Dim Status As Integer, Sai As Integer, LenAux As Integer
  Dim Palavra  As String
  Dim PosLida As Long, CaracsLinha As Integer, NumPalavras As Integer

  ReDim Palavras(0)
  
  PosLida = Ini
  
  NumPalavras = 0
  CaracsLinha = LenLinha

  Do
    Sai = False
    Status = fu_traz_palavra_col(Texto, PosLida, Palavra, LenLinha)
    
    Select Case Status
      Case NORMAL
        If RTrim$(Palavra) = "" Then
          LenAux = Len(Palavra)
        Else
          LenAux = Len(RTrim$(Palavra))
        End If

        If LenAux <= (CaracsLinha - 1) Then
          NumPalavras = NumPalavras + 1
          
          ReDim Preserve Palavras(NumPalavras)
          Palavras(NumPalavras) = Palavra
          
          CaracsLinha = CaracsLinha - Len(Palavra)
          Ini = PosLida
        Else
          Sai = True
        End If

      Case FIM_DE_PARAGRAFO
        Ini = PosLida
        Sai = True

      Case FIM_DE_TEXTO
        Ini = PosLida
        Sai = True

      Case Else
        MsgBox "Erro na FU_TRAZ_LINHA", 16   'MB_ICONSTOP
        Stop
    End Select

  Loop Until Sai
  
  fu_traz_linha_col = Status

End Function

Public Function fu_traz_palavra (Texto As String, Ini As Long, Palavra As String, LenLinha As Integer) As Integer
  Dim Lendo_Palavra As Integer, Lendo_Brancos As Integer
  Dim i As Integer, Fim As Long, Status As Integer
  Dim Caracter As String, s_aux  As String

  Lendo_Palavra = False
  Lendo_Brancos = False

  s_aux = ""
  Fim = Len(Texto)
  Status = NORMAL
  
  If Ini > Fim Then
    Status = FIM_DE_TEXTO
  Else
    For i = Ini To Fim
      Caracter = Mid$(Texto, i, 1)
      
      Select Case Asc(Caracter)
        Case 13
          If Lendo_Palavra Then
            'Se estiver Lendo_Palavra uma palavra, sÃ³ interrompe a leitura
            Exit For
          Else
            'Se nÃ£o, incrementa o ponteiro e registra o Status
            Ini = Ini + 1
            Status = FIM_DE_PARAGRAFO
            Exit For
          End If
  
        Case 10
          If Lendo_Palavra Then
            'Se estiver Lendo_Palavra uma palavra, sÃ³ interrompe a leitura
            Exit For
          Else
            'Se nÃ£o, incrementa o ponteiro e sai do loop
            Ini = Ini + 1
            'Exit For
          End If
  
        Case 32
          If Lendo_Palavra Then
            'Pega o branco depois da palavra
            Ini = Ini + 1
            s_aux = s_aux + Caracter
            Exit For
          Else
            Ini = Ini + 1
          End If
  
        Case Else
          Lendo_Palavra = True
          If Len(s_aux) < LenLinha - 1 Then
            Ini = Ini + 1
            s_aux = s_aux + Caracter
          Else
            s_aux = s_aux + " "
            Exit For
          End If
  
      End Select
    Next i
  End If

  Palavra = s_aux
  
  fu_traz_palavra = Status

End Function

Function fu_traz_palavra_col (Texto As String, Ini As Long, Palavra As String, LenLinha As Integer) As Integer
  Dim Lendo_Palavra As Integer, Lendo_Brancos As Integer
  Dim i As Long, Fim As Long, Status As Integer
  Dim Caracter As String, s_aux  As String

  Lendo_Palavra = False
  Lendo_Brancos = False

  s_aux = ""
  Fim = Len(Texto)
  Status = NORMAL
  
  If Ini > Fim Then
    Status = FIM_DE_TEXTO
  Else
    For i = Ini To Fim
      Caracter = Mid$(Texto, i, 1)
      
      Select Case Asc(Caracter)
        Case 13
          If Lendo_Palavra Then
            'Se estiver Lendo_Palavra uma palavra, sÃ³ interrompe a leitura
            Exit For
          Else
            'Se nÃ£o, incrementa o ponteiro e registra o Status
            Ini = Ini + 1
            Status = FIM_DE_PARAGRAFO
            Exit For
          End If
  
        Case 10
          If Lendo_Palavra Then
            'Se estiver Lendo_Palavra uma palavra, sÃ³ interrompe a leitura
            Exit For
          Else
            'Se nÃ£o, incrementa o ponteiro e sai do loop
            Ini = Ini + 1
            'Exit For
          End If
  
        Case 32
          If Lendo_Palavra Then
            'NÃ£o pega o branco depois da palavra
            Exit For
          Else
            'Considera os brancos antes como parte da palavra
            Lendo_Palavra = True
            s_aux = s_aux + Caracter
            Ini = Ini + 1
          End If
          
          'If Lendo_Palavra Then
          '  'Pega o branco depois da palavra
          '  Ini = Ini + 1
          '  s_aux = s_aux + Caracter
          '  Exit For
          'Else
          '  Ini = Ini + 1
          'End If
  
        Case Else
          Lendo_Palavra = True
          If Len(s_aux) < LenLinha - 1 Then
            Ini = Ini + 1
            s_aux = s_aux + Caracter
          Else
            s_aux = s_aux + " "
            Exit For
          End If
  
      End Select
    Next i
  End If

  Palavra = s_aux
  
  fu_traz_palavra_col = Status

End Function

Sub su_Scaneia_Texto (TextoIn As String, TextoOut() As String, TamLinha As Integer, Justifica As Integer, TamTabula As Integer)
  '------------------------------------------------------------------------
  'OBJETIVO   : Separa um bloco de texto em linhas de um determina-
  '             do tamanho.
  '
  'RESPONSÃ�VEL: Mario A. Radovich
  '
  'DATA       : 20/01/1997
  '
  'OBS        : Se TamTabula = 0 os parÃ¡grafos serÃ£o exibidos sem o
  '             recuo da primeira linha!
  '             No vetor TextoOut nÃ£o deve ser considerado o elemento 0!
  '-------------------------------------------------------------------------
  Dim Palavras() As String
  Dim ParagrafoNovo As Integer, Inicio As Long, Status  As Integer, Sai As Integer
  Dim LinhaNum As Integer, TamLinhaAux As Integer
  '-------------------------------------------------------------------------
  
  'InicializaÃ§Ã£o
  If TamLinha <= TamTabula Then
    MsgBox "O tamanho da linha deve ser maior que a tabulaÃ§Ã£o", 48
    Exit Sub
  End If

  ReDim Palavras(0)
  ReDim TextoOut(0)
  
  LinhaNum = 0
  Inicio = 1
  ParagrafoNovo = True

  Do
    Sai = False
    If ParagrafoNovo And TamTabula > 0 Then
      TamLinhaAux = TamLinha - TamTabula + 1 'Desconta a Tabulacao e um branco
    Else
      TamLinhaAux = TamLinha + 1             'Desconta um branco
    End If
    
    Status = fu_traz_linha(TextoIn, Palavras(), Inicio, TamLinhaAux)

    Select Case Status
      Case NORMAL
        LinhaNum = LinhaNum + 1
        ReDim Preserve TextoOut(LinhaNum)
        
        If ParagrafoNovo And TamTabula > 0 Then
          TextoOut(LinhaNum) = RTrim$(Space$(TamTabula) + fu_monta_linha(Palavras(), TamLinhaAux, Justifica))
        Else
          TextoOut(LinhaNum) = RTrim$(fu_monta_linha(Palavras(), TamLinhaAux, Justifica))
        End If
        
        ParagrafoNovo = False

      Case FIM_DE_PARAGRAFO
        LinhaNum = LinhaNum + 1
        ReDim Preserve TextoOut(LinhaNum)
        
        If ParagrafoNovo And TamTabula > 0 Then
          TextoOut(LinhaNum) = RTrim$(Space$(TamTabula) + fu_monta_linha(Palavras(), TamLinhaAux, False))
        Else
          TextoOut(LinhaNum) = RTrim$(fu_monta_linha(Palavras(), TamLinhaAux, False))
        End If
        
        ParagrafoNovo = True

      Case FIM_DE_TEXTO
        LinhaNum = LinhaNum + 1
        ReDim Preserve TextoOut(LinhaNum)
        
        If ParagrafoNovo And TamTabula > 0 Then
          TextoOut(LinhaNum) = RTrim$(Space$(TamTabula) + fu_monta_linha(Palavras(), TamLinhaAux, False))
        Else
          TextoOut(LinhaNum) = RTrim$(fu_monta_linha(Palavras(), TamLinhaAux, False))
        End If
        
        ParagrafoNovo = True
        Sai = True

      Case Else
        MsgBox "Erro na SU_SCANEIA_TEXTO.", 16
        Stop
    End Select

  Loop Until Sai

End Sub

Sub su_Scaneia_Texto_Col (TextoIn As String, TextoOut() As String, TamLinha As Integer)
  '-------------------------------------------------------------------------
  'OBJETIVO   : Separa um bloco de texto em linhas de um determina-
  '             do tamanho. VersÃ£o simplificada de SU_SCANEIA_TEXTO.
  '             Esta versÃ£o respeita os formatos de parÃ¡grafo montados
  '             pelo usuÃ¡rio, desde que estejam dentro dos limites da
  '             linha definida!
  '
  'RESPONSÃ�VEL: Mario A. Radovich
  '
  'DATA       : 24/06/1997
  '------------------------------------------------------------------------

  Dim Palavras() As String
  Dim ParagrafoNovo As Integer, Inicio As Long, Status  As Integer, Sai As Integer
  Dim LinhaNum As Integer, TamLinhaAux As Integer
  '-------------------------------------------------------------------------
  
  'InicializaÃ§Ã£o
  ReDim Palavras(0)
  ReDim TextoOut(0)
  
  LinhaNum = 0
  Inicio = 1
  ParagrafoNovo = True

  Do
    Sai = False
    
    TamLinhaAux = TamLinha + 1             'Desconta um branco
    
    Status = fu_traz_linha_col(TextoIn, Palavras(), Inicio, TamLinhaAux)

    Select Case Status
      Case NORMAL
        LinhaNum = LinhaNum + 1
        ReDim Preserve TextoOut(LinhaNum)
        
        TextoOut(LinhaNum) = RTrim$(fu_monta_linha_col(Palavras(), TamLinhaAux))
        
        ParagrafoNovo = False

      Case FIM_DE_PARAGRAFO
        LinhaNum = LinhaNum + 1
        ReDim Preserve TextoOut(LinhaNum)
        
        TextoOut(LinhaNum) = RTrim$(fu_monta_linha_col(Palavras(), TamLinhaAux))
        
        ParagrafoNovo = True

      Case FIM_DE_TEXTO
        LinhaNum = LinhaNum + 1
        ReDim Preserve TextoOut(LinhaNum)
          
        TextoOut(LinhaNum) = RTrim$(fu_monta_linha_col(Palavras(), TamLinhaAux))
        
        ParagrafoNovo = True
        Sai = True

      Case Else
        MsgBox "Erro na SU_SCANEIA_TEXTO_COL.", 16
        Stop
    End Select

  Loop Until Sai
End Sub

