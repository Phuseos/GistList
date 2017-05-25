Private Sub ExportSR()
1 Dim db As DAO.Database
2 Dim rs As DAO.Recordset
3 Dim oApp As Excel.Application
4 Dim i As Integer
5 Dim oWbk As Object
6 Dim oWbs As Object

7 Set db = CurrentDb()

8 Set rs = db.OpenRecordset("tblExample")

9 Set oApp = CreateObject("Excel.Application")                          'Point to the Excel application
10 Set oWbk = oApp.Workbooks.Add                                        'Adds a workbook to select
11 Set oWbs = oWbk.Worksheets("Blad1")                                  'Selects the worksheet, would be 'Sheet1' in English
12 oWbs.Name = "SheetName"                                              'Changes the name of the currently selected sheet
13       With oApp
14        .Visible = True
15 '        .Workbooks.Add                                              'Creates a new workbook
16        .Sheets("SheetName").Select                                   'Selects the renamed worksheets
17       .ActiveSheet.Range("A2").CopyFromRecordset rs                  'Start copying data from A2 onward, A1 is reserved for the table headers
        
18        For i = 1 To rs.Fields.Count                                  'loop through the recordset
19            .ActiveSheet.Cells(1, i).value = rs.Fields(i - 1).Name    'Make sure the recordset doesn't loop infinitely
            
              'top decoration
20            .Cells(1, i).FormulaR1C1 = rs.Fields(i - 1).Name          'standard formula used to determine the range used
21            .Cells(1, i).Font.Bold = True                             'headers must be bold (styling choice)
22            .Cells(1, i).Font.Color = RGB(250, 250, 250)              '#FFFFFF / White
23            .Range("A1:C1").Interior.Color = RGB(150, 150, 150)       'Colour of the header (assumes the amount of headers used is 3, change at your own discretion)
24            .Range("A1:C1").AutoFilter 1, "<>"                        'makes the headers filtered

25        Next i
              
26        oApp.Cells.EntireColumn.AutoFit                               'automatically resizes the sheet for aestatics
27        oApp.Cells.EntireRow.AutoFit
            
28    End With

29 rs.Close                                                             'Close the recordset and empty it
30 Set rs = Nothing

31 db.Close                                                             'Close the database connection

End Sub