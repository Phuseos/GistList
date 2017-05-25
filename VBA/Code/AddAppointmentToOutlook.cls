Option Compare Database
Option Explicit

	'	This Gist shows you how to add appointments to an Outlook Agenda
	'	It's based on the following user input:
	'	ApptDate (textbox, shortdate)
	'	ApptTime (textbox, short time)
	'	Duration (textbox, integer)
	'	Subject (textbox, string)
	'	ApptNotes (textbox, string)
	'	ApptReminder (checkbox, yes/no), ReminderMinutes (not set, standard 30)

	'	Must have a reference to the Microsoft Outlook (15.0 in my case, not tested with other versions) Object Library!
	
Private Sub btnAddAppt_Click()
On Error GoTo err_mw
         '	Save record first to be sure required fields are filled.
         DoCmd.RunCommand acCmdSaveRecord
         	
         		'	Open Outlook
            Dim OutObj As Outlook.Application
            Dim OutAppt As Outlook.AppointmentItem
			
            Set OutObj = CreateObject("Outlook.Application")
            Set OutAppt = OutObj.CreateItem(olAppointmentItem)
		
						'	Add a new appointment.
            With OutAppt
               .Start = Me!ApptDate & " " & Me!ApptTime										'	Startdate and time of the appointment
               .Duration = Me!ApptLength																	'	Duration in minutes
               .Subject = Me!Appt									
               If Not IsNull(Me!ApptNotes) Then .Body = Me!ApptNotes			'	Notes
               If Not IsNull(Me!ApptLocation) Then .Location = _					'	Location 
                  Me!ApptLocation
               If Me!ApptReminder Then																		'	Add a reminder?
                  .ReminderMinutesBeforeStart = Me!ReminderMinutes				'	# minutes for the reminder
                  .ReminderSet = True			
               End If
               .Save																											'	Save the appointment
            End With
         End If
		 
         '	Release the Outlook object variable.
         Set OutObj = Nothing
		 
         '	Save the record, display a message.
         DoCmd.RunCommand acCmdSaveRecord
		 
         MsgBox "Appointment Added!"
		 
		 '	Cleanup
		 set OutObj = nothing
		 set OutAppt = nothing
		 
err_mw:
Select Case Err.Number
    Case 0
    Case 5
    Case Else
        Call LogError(Err.Number, Err.Description, "btnAddAppt_frmAppointments")
		'	Custom error log, build on the work of Alan Browne (http://allenbrowne.com/ser-23a.html)
End Select
End Sub