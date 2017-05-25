using System;
using System.Web.UI;

public partial class CreateAMessage : Page 
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //This page creates an example messagebox on load.
        CreateMessage("Hello world!");
    }
        
        //The code below creates the message. The code is a piece of JavaScript that creates the Alert pop-up, with the message provided in Page_Load.  
        void CreateMessage(string Message) => ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('" + Message + "');", true);

}