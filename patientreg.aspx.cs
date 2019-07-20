using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class patientreg : System.Web.UI.Page
{
    private string strConnection = ConfigurationManager.ConnectionStrings["strcon"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(strConnection);
        string patientid = "";
        string sql = "select (coalesce(max(Id),0)+1) as patientid from patient";
        SqlCommand cmmnd = new SqlCommand(sql, con);
        con.Open();
        var y = cmmnd.ExecuteScalar();
        con.Close();
        patientid = string.Concat(txtfullname.Text.Substring(0, 1).ToUpper(), "_00", y);

        string query = "insert into patient(fullname,emailid,mobileno,address,patientid,dateofbirth,bloodgroup,createdon,status) values('" + txtfullname.Text + "','" + txtemailid.Text + "','" + txtmobile.Text + "','" + txtaddress.Text + "','"+patientid+"','" + txtdateofbirth.Text + "','" + ddlbloodgroup.SelectedValue + "','" + DateTime.Now.ToString() + "',1)";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        int x = cmd.ExecuteNonQuery();
        con.Close();
    }
}

   