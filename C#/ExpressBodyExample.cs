/*** Expression bodies on method-like members example ***/

/**This example shows how voids that only return methods or statements can be build using the 'lambda arrow' 
The void below takes a string and returns it as a JavaScript alert window to the user **/
    void CreateMessage(string Message)
    {
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('" + Message + "');", true);
    }

//With the new expression body, the void will look like this:
void CreateMessage(string Message) => System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('" + Message + "');", true);
