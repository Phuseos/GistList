    protected void ButtonBlocker(Control Parent)
    {   //Set all buttons on page to not enabled
        //Call by using ButtonBlocker(Page);
        foreach (Control c in Parent.Controls)  //Loop through the controls on the page
        {
            Button bt = c as Button; if (bt != null)  
            {
                bt.Enabled = false; //Set the buttons to not enabled.
                //c.Visible = false; //Uncomment to make the buttons invisible.
            }
            if (c.HasControls()) { ButtonBlocker(c); }
        }
    }