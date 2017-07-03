using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.UI;

public partial class _MyWall : System.Web.UI.Page

{
    protected void Page_Load(object sender, EventArgs e)
    {

       if(!IsPostBack)
        {

        
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
        con.Open();

        SqlDataAdapter sqlDtAdp = new SqlDataAdapter("select tag1,tag2,tag3,tag4,tag5 from Table_User_Tags with (nolock)", con);
        DataSet ds = new DataSet();
        sqlDtAdp.Fill(ds, "Table_User_Tags");

        con.Close();
        ArrayList _aryLstTmp = new ArrayList();
        ArrayList _aryLstFinal = new ArrayList();

        if (TextBox1.Text == "")
        {
            btnAsk.Enabled = false; // <<== No double-quotes around false
        }
        else
        {
            // Don't forget to re-enable the button
            btnAsk.Enabled = true;
        }
        for (int i =0; i<=ds.Tables[0].Rows.Count -1; i++)
        {
            for (int j = 0; j< 5; j++)
            {
                _aryLstTmp.Add(ds.Tables[0].Rows[i][j].ToString());
                _aryLstFinal.Add(ds.Tables[0].Rows[i][j].ToString());
            }
        }

        _aryLstTmp.Sort();
        _aryLstFinal.Sort();

        for (int i = 0; i <= _aryLstTmp.Count - 1; i++) {
            for (int j=0; j< i; j++)
            {
                if(_aryLstTmp[i].ToString().ToUpper().Equals(_aryLstTmp[j].ToString().ToUpper()) && i!=j)
                {
                    _aryLstFinal.Remove(_aryLstTmp[i]);
                }
            }
        }
        for(int i=0; i<= _aryLstFinal.Count-1; i++)
        {
            cblist1.Items.Add(_aryLstFinal[i].ToString());
        }

        // display dg


        SqlDataAdapter sqlDtAdpQuest = new SqlDataAdapter("SELECT id,UserUSN,Questions,tag1,tag2,tag3,tag4,tag5,convert(varchar,[dtTime], 104) as [AskedDate] FROM [Table_User_Questions] with (nolock) order by id desc", con);
        DataSet dsQuest = new DataSet();
        sqlDtAdpQuest.Fill(dsQuest, "Table_User_Questions");
        
        GDView.DataSource = dsQuest;
        GDView.DataBind();

       // GridView1.DataSource= dsQuest;
      //  GridView1.DataBind();
    }
    }
    protected void btnAsk_Click(object sender, EventArgs e)
    {
        // save to db
        //Table_User_Questions


        if (TextBox1.Text == "")
        {
            btnAsk.Enabled = false; // <<== No double-quotes around false
        }
        else
        {
            // Don't forget to re-enable the button
            btnAsk.Enabled = true;


            ArrayList _aryListCheckedList = new ArrayList();

            for (int i = 0; i < cblist1.Items.Count - 1; i++)
            {
                if (cblist1.Items[i].Selected)
                {
                    _aryListCheckedList.Add(cblist1.Items[i]);
                }
            }
            if (_aryListCheckedList.Count == 0)
            {
                LblErrorMsg.Text="Choose tags for the question";
            }
            else if (_aryListCheckedList.Count > 5)
            {
                LblErrorMsg.Text="Choose only 5 tags for your question";
            }
            else
            {
                LblErrorMsg.Text = "";
                for (int j = _aryListCheckedList.Count - 1; j < 5; j++)
                {
                    _aryListCheckedList.Add("");
                }

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
                con.Open();
                string insertQuery = "INSERT INTO [dbo].[Table_User_Questions] ([UserUsn],[Questions],[tag1],[tag2],[tag3],[tag4],[tag5],[dtTime]) values " +
                       "('" + Session["username"].ToString() + "','" + TextBox1.Text + "','" + _aryListCheckedList[0] + "','" + _aryListCheckedList[1] + "','" + _aryListCheckedList[2] + "','" + _aryListCheckedList[3] + "','" + _aryListCheckedList[4] + "' , '" + DateTime.Today.ToString() + "')";

                SqlCommand com = new SqlCommand(insertQuery, con);

                com.ExecuteNonQuery();
            }

            // Display content





            // refresh page
        }

    }


    /*  protected void GridView1_DataBound(object sender, EventArgs e)
      {

      }

      protected void GridView1_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
      {
          //Dim _key As String = GridView1.DataKeys(e.Row.RowIndex).Value.ToString()
          try
          {
              if (e.Row.RowType == DataControlRowType.DataRow)
              {

                  //Finding label
                  Label lbl = (Label)e.Row.FindControl("LblHide");
                  string s = lbl.Text;
                  //Finding textbox
                 // TextBox txt = (TextBox)e.Row.FindControl("txtDescription");

                  //Finding dropdown
                  //DropDownList ddl = (DropDownList)e.Row.FindControl("ddlItem");
              }
          }
          catch (Exception ex)
          {

          }


      }*/

    //   protected void GridView1_DataBinding(object sender, EventArgs e)
    //   {

    //   }

    // protected void GDView_SelectedIndexChanged(object sender, EventArgs e)
    // {

    // Get the currently selected row using the SelectedRow property.
    //string row = GDView.SelectedRow.DataItemIndex.ToString();

    // Display the company name from the selected row.
    // In this example, the third column (index 2) contains
    // the company name.
    //string Text = "You selected " + row.Cells[1].Text + ".";

    // }

    protected void GDView_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        string id = ((Label)e.Item.FindControl("Label2")).Text; // ID

        string txtAns = ((TextBox)e.Item.FindControl("TextBox2")).Text; // ans Tb

        if (txtAns != "")
        {
           

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
                con.Open();
                string insertQuery = "INSERT INTO [dbo].[Table_Answer] ([Qid],[Answer],[Time],[AnsweredBy],[AnsweredById]) values " +
                       "('" + id + "','" + txtAns + "','" + DateTime.Now.ToString() + "','" + Session["username"].ToString() + "','" + Session["userID"].ToString() + "')";


                SqlCommand com = new SqlCommand(insertQuery, con);

                com.ExecuteNonQuery();
            }
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
        con1.Open();

        SqlDataAdapter sqlDtAdp = new SqlDataAdapter("select Answer, convert(varchar,[Time], 104) as [Updated on] , AnsweredBy as [Answered By] from Table_Answer with (nolock) where Qid = '" + id.ToString()+ "' order by id desc", con1);
        DataSet ds = new DataSet();
        sqlDtAdp.Fill(ds, "Table_Answer");
        DataGrid gvans = ((DataGrid)e.Item.FindControl("GridView1"));

        gvans.DataSource = ds.Tables[0];
        gvans.DataBind();
        con1.Close();
        ((TextBox)e.Item.FindControl("TextBox2")).Text = "";
    }

    protected void GDView_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GDView_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        try
        {
             string id = ((Label)e.Item.FindControl("Label2")).Text;
            ((TextBox)e.Item.FindControl("TextBoxID")).ReadOnly = true;

            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
        con1.Open();

            SqlDataAdapter sqlDtAdp = new SqlDataAdapter("select Answer, convert(varchar,[Time], 104) as [Updated on] , AnsweredBy as [Answered By] from Table_Answer with (nolock) where Qid = '" + id.ToString() + "' order by id desc", con1);
             DataSet ds = new DataSet();
             sqlDtAdp.Fill(ds, "Table_Answer");
             DataGrid gvans = ((DataGrid)e.Item.FindControl("GridView1"));

             gvans.DataSource = ds.Tables[0];
             gvans.DataBind();
             con1.Close();
        }
        catch
        {

        }
    }

    protected void cblist1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}