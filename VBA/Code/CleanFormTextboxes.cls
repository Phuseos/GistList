Private Sub CleanFormTextboxes()
  'Empty textboxes in the current form  
  
    'Loop through the controls
    Dim ctrl As Control
    Dim txt As TextBox
    
    'If a textbox is found in the loop and the text is more then 1 character, empty it
    For Each ctrl In Me.Controls
        If TypeOf ctrl Is TextBox Then
            Set txt = ctrl
                If Len(txt.Value) > 0 Then txt.Value = Null
        End If
    Next ctrl
    
End Sub