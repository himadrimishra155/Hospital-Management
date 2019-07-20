using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class doctorscheduling : System.Web.UI.Page
{
    private string strConnection = ConfigurationManager.ConnectionStrings["strcon"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        FillData();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(strConnection);

        var ismon = 0;
        if (chkmonday.Checked)
        {
            ismon = 1;
        }
        var istues = 0;
        if (chktuesday.Checked)
        {
            istues = 1;
        }
        var iswed = 0;
        if (chkwednesday.Checked)
        {
            iswed = 1;
        }

        string query = "insert into scheduleinfo(username,fees,montimefrom,montimeto,monisavail,tuetimefrom,tuetimeto,tueisavail,wedtimefrom,wedtimeto,wedisavail,createddate,status) values('"+ddldoctor.SelectedValue+"','" + txtfeeamount.Text + "','" + txtmonfrom.Text + "','" + txtmonto.Text + "'," + istues+ ",'" + txttuefrom.Text + "','" + txttueto.Text + "'," + ismon+ " ,'" + txtwedfrom.Text + "','" + txtwedto.Text + "',  + " + iswed+ ",'" + DateTime.Now.ToString() + "',1)";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        int x = cmd.ExecuteNonQuery();
        con.Close();    
    }
    private void FillData()
    {
        string query = "Select fullname,username from userreg where utid='D_002' and status=1";
        SqlConnection con = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddldoctor.Items.Clear();
            ddldoctor.DataSource = ds;
            ddldoctor.DataBind();
            ddldoctor.Items.Insert(0, new ListItem("-Select-", "0"));
        }

    }

}