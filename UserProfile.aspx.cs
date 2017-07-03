using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserProfile : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        pageloader();
    }
    private void pageloader()
    {
        try
        {
            if (!IsPostBack)
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
                con.Open();

                SqlDataAdapter sqlDtAdp = new SqlDataAdapter("select * from userprofile with (nolock) where usn ='" + Session["userID"].ToString() + "' ", con);
                DataSet ds = new DataSet();
                sqlDtAdp.Fill(ds, "userprofile");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Image1.ImageUrl = "\\ProfilePictures\\Students\\" + Session["userID"].ToString() + ".jpeg";
                    TxtDpName.Text = ds.Tables[0].Rows[0]["dispname"].ToString();
                    LabelProfUSN.Text = ds.Tables[0].Rows[0]["usn"].ToString();
                    TxtProfBranch.Text = ds.Tables[0].Rows[0]["branch"].ToString();
                    TxtProfAddr.Text = ds.Tables[0].Rows[0]["address"].ToString();
                    TxtProfSec.Text = ds.Tables[0].Rows[0]["section"].ToString();
                    TxtProfAbt.Text = ds.Tables[0].Rows[0]["abtmessage"].ToString();
                    TxtProfEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    Calendar1.SelectedDate = DateTime.Parse(ds.Tables[0].Rows[0]["dob"].ToString());
                    TxtProfPwd.Text = ds.Tables[0].Rows[0]["password"].ToString();
                    TxtProfMob.Text = ds.Tables[0].Rows[0]["mobile"].ToString();

                }

                SqlDataAdapter sqlDtAdp1 = new SqlDataAdapter("select * from Table_User_Tags with (nolock) where UserUsn ='" + Session["userID"].ToString() + "' ", con);
                DataSet ds1 = new DataSet();
                sqlDtAdp1.Fill(ds1, "Table_User_Tags");
                if (ds1.Tables[0].Rows.Count > 0)
                {
                    txtTag1.Text = ds1.Tables[0].Rows[0]["tag1"].ToString();
                    txtTag2.Text = ds1.Tables[0].Rows[0]["tag2"].ToString();
                    txtTag3.Text = ds1.Tables[0].Rows[0]["tag3"].ToString();
                    txtTag4.Text = ds1.Tables[0].Rows[0]["tag4"].ToString();
                    txtTag5.Text = ds1.Tables[0].Rows[0]["tag5"].ToString();

                }


            }

        }
        catch (Exception e)
        {

        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;
        try
        {
            if (TxtProfPwd.Text != "") {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
                con.Open();
                string insertQuery = "UPDATE [dbo].[userprofile] SET dispname= @dispname,branch=@branch,section=@section,address=@address,dob=@dob,mobile=@mobile,email=@emailid,password=@password,abtmessage=@abtmessage where usn='" + Session["userID"].ToString() + "'"; //+
                                                                                                                                                                                                                                                                              // imageprof=@imageproof

                //"insert into faculty_user_details(faculty_name,highest_degree,department,designation,email,mobile,user_name,password)"
                // "values (@dispname,@usn,@branch,@section,@address,@dob,@mobile,@emailid,@password,@imageprof,@abtmessage)";
                SqlCommand com = new SqlCommand(insertQuery, con);
                com.Parameters.AddWithValue("@dispname", TxtDpName.Text);
                com.Parameters.AddWithValue("@branch", TxtProfBranch.Text);
                com.Parameters.AddWithValue("@section", TxtProfSec.Text);
                com.Parameters.AddWithValue("@address", TxtProfAddr.Text);
                com.Parameters.AddWithValue("@dob", Calendar1.SelectedDate.ToString());
                com.Parameters.AddWithValue("@mobile", TxtProfMob.Text);
                com.Parameters.AddWithValue("@emailid", TxtProfEmail.Text);
                com.Parameters.AddWithValue("@password", TxtProfPwd.Text);
                com.Parameters.AddWithValue("@abtmessage", TxtProfAbt.Text);
                com.ExecuteNonQuery();


                string insertQuery1 = "UPDATE [dbo].[Table_User_Tags] SET tag1= @tag1,tag2= @tag2,tag3= @tag3,tag4= @tag4,tag5= @tag5 where UserUsn = '" + Session["userID"].ToString() + "'"; //+
                                                                                                                                                                                               // imageprof=@imageproof

                //"insert into faculty_user_details(faculty_name,highest_degree,department,designation,email,mobile,user_name,password)"
                // "values (@dispname,@usn,@branch,@section,@address,@dob,@mobile,@emailid,@password,@imageprof,@abtmessage)";
                SqlCommand com1 = new SqlCommand(insertQuery1, con);
                com1.Parameters.AddWithValue("@tag1", txtTag1.Text);
                com1.Parameters.AddWithValue("@tag2", txtTag2.Text);
                com1.Parameters.AddWithValue("@tag3", txtTag3.Text);
                com1.Parameters.AddWithValue("@tag4", txtTag4.Text);
                com1.Parameters.AddWithValue("@tag5", txtTag5.Text);

                com1.ExecuteNonQuery();
                Response.Write("Updated Successfully");//"<script type='text/javascript'>alert('Data inserted successfully');</script>");
                con.Close();

            }
            else
            {
                Response.Write("Error: Please enter the password");
            }
        }
        catch (Exception ex)
        {
            Response.Write("ERROR:" + ex.ToString());
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void btnUpld_Click(object sender, EventArgs e)
    {
        if (!picUpdate.HasFile) //Validation  
        {
            Response.Write("No file Selected"); return;
        }
        else
        {

            if (picUpdate.FileName.Contains("jpg") || picUpdate.FileName.Contains("bmp") || picUpdate.FileName.Contains("jpeg") || picUpdate.FileName.Contains("png"))
            {
                string dob = Calendar1.SelectedDate.ToString();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
                con.Open();
                string imgName = Request.PhysicalApplicationPath + "ProfilePictures/Students/" + Session["userID"].ToString()  + ".jpeg";
                if (File.Exists(imgName))
                {
                    File.Delete(imgName);
                }
                picUpdate.SaveAs(imgName);

                FileStream fs;
                fs = new FileStream(imgName, FileMode.Open, FileAccess.Read);
                fs.Close();
            }
                //string filename = FileUpload1.PostedFile.FileName;

                ////convert the image into the byte  
                //byte[] imageByte = System.IO.File.ReadAllBytes(filename);

                ////Insert the Data in the Table  
                //using (SqlConnection connection = new SqlConnection())
                //{
                //    connection.ConnectionString = ConfigurationManager.ConnectionStrings["constr"].ToString();

                //    connection.Open();
                //    SqlCommand cmd = new SqlCommand();
                //    cmd.Connection = connection;

                //    string commandText = "Insert into [dbo].[userprofile] (@imageprof)";

                //    cmd.CommandText = commandText;
                //    cmd.CommandType = CommandType.Text;
                //    cmd.Parameters.Add("@image", SqlDbType.VarBinary);
                //    cmd.Parameters["@image"].Value = imageByte;
                //    cmd.ExecuteNonQuery();
                //    cmd.Dispose();
                //    connection.Close();

                Response.Write("Data has been Added");
           // }
        }
        // if (FileUpload1.FileName.Contains(".jpeg"))
        // {
        // Convert image to image datatype (of DB) and save 
        // }
        // else
        // {
        // error out to upload .jpeg only
        // }
    }
}