using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for DBLayer
/// </summary>
public class DBLayerCls
{
    public DataSet GetUserProfile(string usnfromSession)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
        con.Open();
        string getUserdetails = "select * from userprofile where usn = '" + usnfromSession + "'";

        SqlDataAdapter sqlDA = new SqlDataAdapter(getUserdetails, con);
        DataSet ds = new DataSet();
        sqlDA.Fill(ds, "userprofile");
        con.Close();
        return ds;

    }

    public DataSet LoginValidation(string username, string  password)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SSITConString"].ConnectionString);
        con.Open();
        string getUserdetails = "select *  from userprofile where email = '" + username + "' and password = '" + password + "'";
        SqlDataAdapter sqlDA = new SqlDataAdapter(getUserdetails, con);
        DataSet ds = new DataSet();
        sqlDA.Fill(ds, "userprofile");
        con.Close();
        return ds;
    }

}