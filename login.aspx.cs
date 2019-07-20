using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default1 : System.Web.UI.Page
{
    private string strConnection = ConfigurationManager.ConnectionStrings["strcon"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        Session.Abandon();
        Session.Clear();
        Session.RemoveAll();

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string query = "Select * from userreg where status=1 and username='" + txtusername.Text + "' and password='" + txtpassword.Text + "'";
        SqlConnection con = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblmsg.Text = "Login successful";
        }
        else
        {
            lblmsg.Text = "Inavalid username or password";
        }

    }
}
