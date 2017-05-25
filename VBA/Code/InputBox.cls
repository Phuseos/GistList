Private sub GetName()
On Error GoTo err_mw

Dim strName As String                                       '   Name to be obtained

    strName = InputBox(Prompt:="What is your name?", _
            Title:="Name", Default:="Name")                 '   Get the name and save it to strName
    
    If strName = Null Or strName = Nothing Then Exit Sub    '   If the response is empty exit sub

err_mw:
Select Case Err.Number
    Case 0                                                  '   Completed action
    Case 5                                                  '   User cancelled action
    Case Else
        MsgBox "Error " & Err.Number & ": " & Err.Description
End Select
end sub