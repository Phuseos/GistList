sub ReadPDF()

    'NOTE: Adobe Acrobat Pro XI or higher has to be installed and the following references have to be active:
    'Adobe Acrobat 10.0 Type Library	(acrobat.tlb)			Usually found in: C:\Program Files (x86)\Adobe\Acrobat 11.0\Acrobat\
    'Acrobat Access 3.0 Type Library	(Accessibility.api)		Usually found in: C:\Program Files (x86)\Adobe\Acrobat 11.0\Acrobat\plug_ins\

    'To check for active references, see Tools -> References OR use the Immediate window (ctrl + G) and type "for each r in references : debug.Print r.name, r.fullpath : next r" (minus "" quotes)
	
    Dim AcroApp                                     As Acrobat.CAcroApp			'We're going to use the Acrobat 'app', so point to that
    Dim theForm                                     As Acrobat.CAcroPDDoc		'Define that we're going to use a Acrobat Form (known as PDF)
    Dim jso                                         As Object				'Objects within the form / PDF
    Dim dlgPickFiles                                As Office.FileDialog		'Used for selecting the PDF to use
    Dim FieldRead				    As String				'String that will contain the read information
	
    Set AcroApp = CreateObject("AcroExch.App")						'Create the Acrobat app object
    Set theForm = CreateObject("AcroExch.PDDoc")					'Create the form object
	
    'File picker
    Set dlgPickFiles = Application.FileDialog(msoFileDialogFilePicker)			'Open the file dialog
    
    On Error GoTo FileErr
    
    With dlgPickFiles
        .AllowMultiSelect = False
        With .Filters
            .Clear
           .Add "PDF", "*.PDF"								'Filters to only allow selection of PDF's
        End With
        .Show
        MyPath = .SelectedItems(1)							'Bind the selected item to MyPath
    End With
    
    theForm.Open MyPath									'Open the document
    
    Set jso = theForm.GetJSObject							'Get the objects of the form

FileErr:
    Select Case Err.Number
    Case 5										'Access is denied error, exit the sub
    Exit Sub
    Case Else
    'continue
    End Select

    'get the information from the form
    FieldRead = jso.getfield("Field_To_Read").value					'Bind the value of the PDF field so we can use it
	
    MsgBox "Read the value '" & FieldRead & "' from the PDF!"				'Show what value was read
	
    theForm.Close									'Close the form
    
    AcroApp.Exit									'Close the Acrobat application
	
    Set AcroApp = Nothing								'Clear the form and app from memmory
    Set theForm = Nothing
	
end sub