protected void TextBoxNullCatcher(object sender, EventArgs e)
{//Code to makes sure all controls that are textboxes have at least a '1' value.
	if (sender is Control)
	{
		var usedControl = sender as Control;	//Declare the control

		if (usedControl is TextBox)						
		{
			TextBox txtType = usedControl as TextBox;	//Set the control as a textbox
			if (string.IsNullOrEmpty(Convert.ToString(txtType.Text)))
			{
				txtType.Text = Convert.ToString("1");	
				/*
				You can shorten it like this: 
				    txtType.Text = string.IsNullOrEmpty(txtType.Text) ? "1" : txtType.Text;	
				Or  txtType.Text = txtType.Text ?? "1";
				*/
			}
		}
	}
	
	//Rest of your code
}