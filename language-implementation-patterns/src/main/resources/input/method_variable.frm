Attribute VB_Name = "MsgBox_em_Portugues"

ABC As New IX2.ABC

Private Sub gr_apo_Click()
        
    su_habilita_botao.abc.cde bu3d_ok, True
    
    bu3d_ok.SetFocus
    
    'foi selecionado uma ap�lice atrav�s do grid
    If CONSULTA_POR_ITEM% = True Then
        apolice% = 0
    Else
        apolice% = 1
    End If

    gr_apo.HIGHLIGHT = True
    gr_apo_dblclick

End Sub
