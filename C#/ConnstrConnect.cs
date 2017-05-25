public partial class Home : System.Web.UI.Page
{
  //Assuming the connectionstring "YourConnectionString" has been build properly in web.config, set up a public MySqlConnection to use called 'con'.
   public MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString);

  protected void Page_Load(object sender, EventArgs e)
  {
    using (con) //replaces using (MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString))
    {
      if (con.State != ConnectionState.Open) con.Open();
      
      //Interact with the databas here
      
      if (con.State != ConnectionState.Closed) con.Close();
    }
  }
}