protected void CoalesNull(Object sender, EventArgs e) {
	
	string MessageNoNull = "Hello World!";
	string ResultNoNull = MessageNoNull ?? "Null!";
	
	Console.WriteLine(ResultNoNull);	//Prints "Hello Word!"
	
	string MessageNull = null;
	string ResultNull = MessageNull ?? "Null!";
	
	Console.WriteLine(ResultNull);		//Prints "Null!"
}