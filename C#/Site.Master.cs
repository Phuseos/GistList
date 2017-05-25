    protected void ahrefOut_Click(object sender, EventArgs e)
    {//Logout button
        
        //Get the current absolute URL of the ContentPlaceHolder
        string AbsoluteURL = BodyContent.Page.Request.Url.AbsoluteUri;

        //Set the string to search for in the URL
        string strCheck = "Test";

        //If the URL contains (part of) the string to check redirect to special login page
        if (AbsoluteURL.Contains(strCheck))
            Response.Redirect("LoginTest.aspx");
        //Otherwise, redirect to standard login
        else
            Response.Redirect("Login.aspx");
    }