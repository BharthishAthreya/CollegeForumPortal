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
using System.Net;

public partial class RegistrationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void BtnRegister_Click(object sender, EventArgs e)
    {        
     if (!Page.IsValid)
            return;
        try
        {
            if (profimageuploader.FileName.Contains("jpg") || profimageuploader.FileName.Contains("bmp") || profimageuploader.FileName.Contains("jpeg") || profimageuploader.FileName.Contains("png"))
            {

                // save the image tp folder within project

                string dob = Calendar1.SelectedDate.ToString();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
                con.Open();
                string imgName = Request.PhysicalApplicationPath + "ProfilePictures/Students/" + TxtUSN.Text + ".jpeg";
                if (File.Exists(imgName))
                {
                    File.Delete(imgName);
                }
                profimageuploader.SaveAs(imgName);
                
                FileStream fs;
                fs = new FileStream(imgName, FileMode.Open, FileAccess.Read);
                fs.Close();
                
                // save profile details to DB
                
                SqlDataAdapter sqlDtAdp = new SqlDataAdapter("select * from userprofile with (nolock) where email ='" + TxtEmail.Text + "' ", con);
                DataSet ds = new DataSet();
                sqlDtAdp.Fill(ds, "userprofile");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    forgotpswd.Visible = true;
                    lblforgotpswd.Text = "USN / Email  already exist, please try ";
                }
                else
                {
                    forgotpswd.Visible = false;

                    string insertQuery = "INSERT INTO [dbo].[userprofile]([dispname],[usn],[branch],[section],[address],[dob],[mobile],[email],[password],[imageprof],[abtmessage]) values " +
                    "('" + TxtUsrName.Text + "','" + TxtUSN.Text + "','" + TxtBranch.Text + "','" + TxtSec.Text + "','" + TxtAddr.Text + "','" + dob + "','" + TxtMob.Text + "','" + TxtEmail.Text + "','" + TxtPwd.Text + "','','" + TxtabtSelf.Text + "')";

                    SqlCommand com = new SqlCommand(insertQuery, con);

                    com.ExecuteNonQuery();


                    // Saving TAGs details to DB

                    string strTagQuery = "";
                    strTagQuery = "Insert into [dbo].[Table_User_Tags]([UserUsn],[tag1],[tag2],[tag3],[tag4],[tag5]) values " +
                         "('" + TxtUSN.Text + "','" + txtTag1.Text + "','" + txtTag2.Text + "','" + txtTag3.Text + "','" + txtTag4.Text + "','" + txtTag5.Text + "')";
                    SqlCommand comTAG = new SqlCommand(strTagQuery, con);

                    comTAG.ExecuteNonQuery();
                    con.Close();
                    
                    sendemailfunc(TxtPwd.Text, TxtUsrName.Text);

                    string message = "Registration successful. Please login now";
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                    // 
                    System.Threading.Thread.Sleep(500);
                    Response.Redirect("Login.aspx");
                }
            }
            else
                lblerror.Text = "invalid image format, use only jpeg/jpg/bmp/png formats || Only number is accepted";
               
        }
        catch (Exception ex)
        {
            Response.Write("ERROR:" + ex.ToString());
            lblerror.Text = ex.Message.ToString() + " -  " + ex.InnerException.Message.ToString();
        }
    }

    private void sendemailfunc(string pswd, string uname)
    {
        try
        {
            MailMessage msg = new MailMessage();

            msg.From = new MailAddress("ssitcollegeportal@gmail.com");
            msg.To.Add(TxtEmail.Text);
            msg.Subject = "Welcome to SSIT college forum website";
            msg.Body = "Hi " + uname + ", " + Environment.NewLine + Environment.NewLine + "Welcome to college forum website." + Environment.NewLine+ 
                "Please find the following username and password to access college forum portal: " +
                Environment.NewLine + Environment.NewLine + "Your name: " + uname + Environment.NewLine + "Password: " + pswd + Environment.NewLine + "E-mail id: " +
                TxtEmail.Text + Environment.NewLine + Environment.NewLine + Environment.NewLine + "Thanks and regards," + Environment.NewLine + "SSIT College Forum";

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


    protected void BtnReset_Click(object sender, EventArgs e)
    {
        TxtabtSelf.Text = string.Empty;
        TxtAddr.Text = string.Empty;
        TxtBranch.Text = string.Empty;
        TxtEmail.Text = string.Empty;
        TxtMob.Text = string.Empty;
        TxtPwd.Text = string.Empty;
        TxtSec.Text = string.Empty;
        TxtUSN.Text = string.Empty;
        TxtUsrName.Text = string.Empty;
    }

    protected void TxtEmail_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TxtUSN_TextChanged(object sender, EventArgs e)
    {

    }
}