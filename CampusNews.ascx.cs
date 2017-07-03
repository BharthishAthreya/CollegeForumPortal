using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



public partial class CampusNews : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=NEWSSITForumDB;Integrated Security=True");
      
        SqlDataAdapter sqlDtAdpQuest = new SqlDataAdapter("select * from [dbo].[Table_campus_news]", con);
        DataSet dsQuest = new DataSet();
        sqlDtAdpQuest.Fill(dsQuest, "Table_campus_news");

        GridView1.DataSource = dsQuest;
        GridView1.DataBind();
    }
}