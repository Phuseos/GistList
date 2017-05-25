Option Compare Database

Public gstrInlogNaam As String  'Saves the login name, set this with a lookup in the table.

''Checks when a user logs off / in and sets this in the table

Sub CaptureInlog()
On Error GoTo err_mw
Dim rstL As ADODB.Recordset 'For logging inlog time / user / comp name

Dim LogName As String

LogName = gstrInlogNaam 'Public string that saves the login name

Set rstL = New ADODB.Recordset

rstL.Open "SELECT * FROM tblAuditLogin", CurrentProject.Connection, adOpenDynamic, adLockOptimistic

Dim env As String
env = Environ("USERNAME") 'Gets the environmental / Machine-asigned username

'Table (tblAuditLogin) consists of:
'LoginName: Username (string)
'LogTime: time captured on login (date/time)
'CompName: Environmental computername
'Action: The action taken (logged in in this case)

If env <> "Admin" Then  'No need to log your own login
    With rstL
        .AddNew
        ![LoginName] = LogName
        ![LogTime] = Now()
        ![CompName] = env
        ![Action] = "LogIn"
        .Update
    End With
End If

rstL.Close

Set rstL = Nothing

err_mw:
Select Case Err.Number
    Case 0
    'skip
    Case Else
    'MsgBox "Error: " & Err & " Desc: " & Err.Description
    Call LogError(Err.Number, Err.Description, "CaptureLogin")
End Select
End Sub