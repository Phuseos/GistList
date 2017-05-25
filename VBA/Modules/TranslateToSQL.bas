
Public Function TranslateToSQL(ByVal jSQL As String) As String

  If (Application.CurrentProject.ProjectType = acADP) Then
    '	Operators, constants, delimiters and wildcard characters
    jSQL = Replace$(jSQL, "#", "'")
    jSQL = Replace$(jSQL, """", "'")
    jSQL = Replace$(jSQL, "&", "+")
    jSQL = Replace$(jSQL, "?", "_")
    jSQL = Replace$(jSQL, "*", "%")
    jSQL = Replace$(jSQL, "True", "-1")
    jSQL = Replace$(jSQL, "False", "0")
    ' correct SELECT * FROM and SELECT <table>.* FROM
    jSQL = Replace$(jSQL, ".% ", ".* ")
    jSQL = Replace$(jSQL, ".%,", ".*,")
    jSQL = Replace$(jSQL, " % ", " * ")
    ' correct SELECT COUNT(*)
    jSQL = Replace$(asSQL, "(%)", "(*)")
  Else
    ' Correctie voor ABS(TRUE)
    jSQL = Replace$(asSQL, "ABS(True)", "True")
  End If
  
  TranslateToSQL = jSQL
  
End Function