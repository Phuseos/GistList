sub LockSubFormControl()
  
  'if called, locks all controls present on main and subform
  'where frmMain is the currently active main form
  'and frmSubForm the subform, located inside the main form
  
	For Each ctl in Forms!frmMain.Controls                        		  'Loop through the controls
		Select Case ctl.ControlType
			Case acTextBox, acComboBox, acCheckBox, acCommandButton   'Select the most used controls to lock
				ctl.Enabled = False                               'Lock the controls
			Case Else                                                 'Lock everything else
				ctl.Enabled = False
		End Select
	Next                                                          	    'Keep the loop going until all controls have been locked
		

	For Each ctl in Forms!frmMain!frmSubForm.Controls             		  'Target the subform
		Select Case ctl.ControlType                                 	  'Select the controls to lock
			Case acTextBox                                            'Textboxes
				ctl.Enabled = False
			Case acComboBox                                           'ComboBoxes / DropDownLists
				ctl.Enabled = False
			Case acCheckBox                                           'CheckBoxes
				ctl.Enabled = False
			Case acCommandButton                                      'Buttons
				ctl.Enabled = False
			Case Else                                                 'Rest
				ctl.Enabled = False
		End Select
	Next

end sub