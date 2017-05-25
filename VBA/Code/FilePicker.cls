Private Sub FilePicker()

''''''''''''''
'The filepicker is made for images at the moment, you change this by changing the allowed extentions after .Add.
''''''''''''''

    Dim dlgPickFiles As Office.FileDialog
    Dim strList As String
    Dim FileN As String
         
    Set dlgPickFiles = Application.FileDialog(msoFileDialogFilePicker)
 
    With dlgPickFiles
        .AllowMultiSelect = False
        With .Filters
            .Clear
            .Add "Images", "*.jpg; *.jpeg; *.bmp; *.png; *.gif" 
        End With
        .Show
        Me.txtImagePath = .SelectedItems(1) 'This is where you can load the path into the table. Change at your leisure.
    End With
 
    Set dlgPickFiles = Nothing

End Sub