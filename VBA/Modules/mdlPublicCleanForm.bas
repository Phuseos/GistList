Option Compare Database

Function CleanForm()

'Call as CleanForm(), will clear current text & comboboxes on active form.

    For Each ctl In Form.Controls     'Loop through controls of the form
        Select Case ctl.ControlType   
          Case acTextBox, acComboBox  'Select Textboxes and Comboboxes (DropDownLists)
               ctl.value = ""         'Set the value to ""
        End Select
    Next

End Function