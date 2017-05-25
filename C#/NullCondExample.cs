/**Null-conditional operators example**/
		
//If the Text in txtBox1 is null, return 0, else return the length of the string of txtBox1. 
  
  int RunMe;

  RunMe = txtBox1?.Text.Length ?? 0;
	
  //The above statement is the equivalent of the if statement below
  if (txtBox1.Text.Length != 0) RunMe = txtBox1.Text.Length;
  else RunMe = 0;
	
//If the TextBox has the value ('Me@Me.com') then RunMe will have a value of 9. If it's empty, RunMe will be too.