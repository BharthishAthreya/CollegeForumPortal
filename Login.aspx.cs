using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.RemoveAll();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        DBLayerCls dlCls = new DBLayerCls();
        DataSet ds = new DataSet();
        ds = dlCls.LoginValidation(txtemail.Text, txtpwd.Text);
        if (ds.Tables[0].Rows.Count != 0)
        {
            Session["userID"] = ds.Tables[0].Rows[0]["usn"].ToString();
            Session["username"] = ds.Tables[0].Rows[0]["dispname"].ToString();
            Response.Redirect("mywall.aspx");
        }
        else
            lblerror.Text = "username and password does not match";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        txtemail.Text = string.Empty;
        txtpwd.Text = string.Empty;
        lblerror.Text = "";
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgotpassword.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("registrationpage.aspx");
    }
}