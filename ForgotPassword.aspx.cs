using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Net.Mail;
using System.Text;
using System.Net;

public partial class RegistrationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnsendpassword_Click(object sender, EventArgs e)
    {

        validateEmailID();

    }

    private void validateEmailID()
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
            con.Open();
            SqlDataAdapter sqlDtAdp = new SqlDataAdapter("select * from userprofile with (nolock) where email ='" + txtemailID.Text + "' ", con);
            DataSet ds = new DataSet();
            sqlDtAdp.Fill(ds, "userprofile");
            if (ds.Tables[0].Rows.Count == 0)
            {
                registerlink.Visible = true;
                lblInfo.Text = "USN / Email does not exist, please register:";
            }
            else
            {
                registerlink.Visible = false;

                string username = ds.Tables[0].Rows[0]["dispname"].ToString();
                string pswd = ds.Tables[0].Rows[0]["password"].ToString();
                // send email function
                sendemailfunc(pswd, username);
            }

        }
        catch (Exception e)
        {
            lblerror.Text = "Error : validateEmailID : " + e.Message.ToString();
;        }
    }

    private void sendemailfunc(string pswd, string uname)
    {
        try
        {
            MailMessage msg = new MailMessage();

            msg.From = new MailAddress("ssitcollegeportal@gmail.com");
            msg.To.Add(txtemailID.Text);
            msg.Subject = "Forgot password:- from college forum website";
            msg.Body = "Hi " + uname + ", " + Environment.NewLine + Environment.NewLine + "Please find the username and password below: " + 
                Environment.NewLine + Environment.NewLine + "Your name: " + uname + Environment.NewLine + "Password: " + pswd + Environment.NewLine + "E-mail id: " + 
                txtemailID.Text + Environment.NewLine + Environment.NewLine + Environment.NewLine +"Thanks and regards," + Environment.NewLine + "SSIT College Forum";

            SmtpClient client = new SmtpClient();
            client.UseDefaultCredentials = true;
            client.Host = "smtp.gmail.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new NetworkCredential("ssitcollegeportal@gmail.com", "collegeportal");
            client.Send(msg);
            client.Timeout = 20000;
            lblerror.Text = "E-mail has been sent. Please use the credentials from the email and login to the application.";

        }
        catch (Exception e)
        {
            lblerror.Text = "Error: sendemailfunc: " + e.Message.ToString();
        }
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtemailID.Text = "";
        lblerror.Text = "";

        Response.Redirect("login.aspx");
    }
}