using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    private string strConnection = ConfigurationManager.ConnectionStrings["strcon"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        FillData();
    }


    private void FillData()
    {
        string query = "Select utid,utname from usertypeinfo where status=1";
        SqlConnection con = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddluserlist.Items.Clear();
            ddluserlist.DataSource = ds;
            ddluserlist.DataBind();
            ddluserlist.Items.Insert(0, new ListItem("-Select-", "0"));
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
         
        SqlConnection con = new SqlConnection(strConnection);

        string query = "insert into userreg(username,password,fullname,kycno,utid,mobileno,createddate,status) values('"+txtusername.Text+"','"+txtpassword.Text+"','"+txtfullname.Text+"','"+txtkyc.Text+"','"+txtutid.Text+"','"+txtmobile.Text+"','"+DateTime.Now.ToString()+"',1)";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        int x = cmd.ExecuteNonQuery();
        con.Close();    
    }
   
    }
