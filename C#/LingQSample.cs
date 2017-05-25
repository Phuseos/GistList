    protected void btnLINQ_Click(object sender, EventArgs e)
    {
        string[] WordsToUse = { "Hello ", "World", "!" };                         //Array of words to use

        var Res = WordsToUse.Aggregate((current, next) => current + next);        //Aggregate words using LINQ

        System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('" + Res + "');", true); //Print text using JavaScript (don't use in production)
    }