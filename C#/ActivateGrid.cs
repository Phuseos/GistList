    void ActivateGrid()
    {
        try
        {
	    string conStr = ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;

            MySqlConnection con = new MySqlConnection(conStr);	//Set a new connection

            con.Open();	                                        //Open the connection
			
            MySqlCommand cmd = new MySqlCommand("SELECT " +
                                                "Item1, " +
                                                "Item2, " +
                                                "Item3 " +
                                                "FROM tblItems"                                              
                                                , con);	        //Set the SQL string to use

            MySqlDataReader rdr = cmd.ExecuteReader();	        //Execute the reader

            DataTable dt = new DataTable();		        //Add a datatable and set the columns to use
            dt.Columns.Add("Item1");
            dt.Columns.Add("Item2");
            dt.Columns.Add("Item3");

	    if (rdr.HasRows) {
            while (rdr.Read())
            {
                DataRow row = dt.NewRow();
                row["Item1"] = rdr["Item1"];			//Add the rows with data to the columns of the gridview
                row["Item2"] = rdr["Item2"];
                row["Item3"] = rdr["Item3"];
                dt.Rows.Add(row);
            } }
		
	    rdr.Close();

	    Gridview1.Visible = dt.Rows.Count != 0 ? true  : false;	              //If there are no rows (no data), don't show the gridview

            Gridview1.DataSource = dt;					              //Set the gridview's datasource to the datatable
            Gridview1.DataBind();						      //Bind the datatable to the grid
            
            rdr.Close();							      //Close the reader
            con.Close();							      //Close the connection
            
        }
        catch (System.Threading.ThreadAbortException)
        {
            //Continue
        }
        catch (MySqlException MyEx)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('" + MyEx.Message + "');", true);
        } 
        catch (Exception ex)
        {
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "AlertBox", "alert('" + ex.Message + "');", true);
        }
    }