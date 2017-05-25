void NestedConditionalOperator() {

  //This is an example to show what you can do with nested Conditional operators
  //For this example we'll use int A and TestBool to demonstrate
  //Assuming the page we're working with has TextBox1 as a TextBox on it
  
  int A = 1;
  bool TestBool = false;
  
  //Below you'll see that we'll be testing for the value of both TestBool and A.
  //The value the TextBox will get is defined with "True", if the conditions don't match it would be false.
  TextBox1.Text = TestBool == false ? A == 1 ? "True" : "False" : "False";
  TextBox1.Text = TestBool == false ? A == 2 ? "False" : "True" : "False";
  TextBox1.Text = TestBool == true ? A == 1 ? "False" : "False" : "True";
  TextBox1.Text = TestBool == true ? A == 2 ? "False" : "False" : "True";
  
  //To give some more insight, here's the first example in an 'if' statement.
  if (TestBool == false && A == 1) { TextBox1.Text = "True"; } else { TextBox1.Text = "False"; }
  
  //We can split it even more like this;
  if (TestBool == false)
  {
    if (A == 1)
    {
        TextBox1.Text = "True";
    }
    else
    {
        TextBox1.Text = "False";
    }
  }
  else
  {
      TextBox1.Text = "False";
  }
}