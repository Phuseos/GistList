protected void NullCheck(Object sender, EventArgs e) {
  
  /*
  * Different ways to check for a null value as an example
  * Assume we have TextBox1 that we want to fill with a value, but only if the string is not null
  */
  
  //Set the value that we want to use
  string NewMessage = null;
  
  //First way to check for null, if with check, then set the TextBox value
  if (!string.IsNullOrEmpty(NewMessage)) { 
  TextBox1.Text = NewMessage; 
  }
  else if (string.IsNullOrEmpty(NewMessage)) { TextBox1.Text = Convert.ToString(null); }
  
  //Way to check using the ?? Coalesced operator
  TextBox1.Text = NewMessage ?? Convert.ToString(null);
  
}