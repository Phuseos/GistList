'Using the IIf() function as a Nested Conditional (?:) Operator
'Quick view of how you can use the iif function as the nested conditional operator, used in C#

	'In C#
	string TestString;
	//string = Condition == true ? if true -> TestString = "Value" : else (false) -> TestString = null;
	TestString = Condition ? "Value" : Convert.ToString(null);
	
	'In VBA
	dim TestString As String
	'string = Condition = true ? Gets "Value" on true, Else gets vbEmpty (Null)
	TestString = IIf((Condition = true), "Value", vbEmpty)