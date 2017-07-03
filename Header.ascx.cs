using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Header : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LblWlcm.Text = Session["username"].ToString();
        imgHdr.ImageUrl = "\\ProfilePictures\\Students\\" + Session["userID"].ToString() + ".jpeg";
    }

    protected void lnkBtnHme_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyWall.aspx");
    }
    protected void lnkBtnmyQ_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyWall.aspx");
    }

    protected void lnkBtnQ4me_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyWall.aspx");
    }

    protected void lnkBtnProf_Click(object sender, EventArgs e)
    {
        Response.Redirect("userprofile.aspx");
    }

    protected void lnkBtnSgnout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("login.aspx");

    }
}