using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;
using System.Data.SqlClient;




public partial class CampusNews : System.Web.UI.UserControl
{
    SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=NEWSSITForumDB;Integrated Security=True");
    DataTable dt = new DataTable();
    SqlDataReader dr;
    SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataAdapter sqlDtAdpQuest = new SqlDataAdapter("SELECT [Title], [Description], [Url] FROM [Table_RSS_Feed]", con);
        DataSet dsQuest = new DataSet();
        sqlDtAdpQuest.Fill(dsQuest, "Table_RSS_Feed");

       gnGridView1.DataSource = dsQuest;
        gnGridView1.DataBind();
    }
}