using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class appointmentinfo : System.Web.UI.Page
{
    private string strConnection = ConfigurationManager.ConnectionStrings["strcon"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        FillDataDoctor();
        FillDataPatient();
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(strConnection);
        string apptid = "";
        string sql = "select (coalesce(max(Id),0)+1) as apptid from appointmentinfo";
        SqlCommand cmmnd = new SqlCommand(sql, con);
        con.Open();
        var y = cmmnd.ExecuteScalar();
        con.Close();
        apptid = string.Concat("APP_", DateTime.Now.ToString("ddMMyy"), y);

        string query = "insert into appointmentinfo(doctorid,patientid,date,time,isapproved,createddate,status,isvisited,apptid,day) values('" + ddldoctor.SelectedValue + "','" + ddlpatient.SelectedValue + "','" + txtdate.Text + "','" + DateTime.Now.ToString("hh:mm:ss tt") + "',0,'" + DateTime.Now.ToString() + "',1,0,'" + apptid + "','"+ddlday.SelectedValue+"')";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        int x = cmd.ExecuteNonQuery();
        con.Close();

    }
    private void FillDataDoctor()
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
    private void FillDataPatient()
    {
        string query = "Select fullname,patientid from patient where status=1";
        SqlConnection con = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlpatient.Items.Clear();
            ddlpatient.DataSource = ds;
            ddlpatient.DataBind();
            ddlpatient.Items.Insert(0, new ListItem("-Select-", "0"));
        }

    }

    protected void ddldoctor_SelectedIndexChanged(object sender, EventArgs e)
    {
        string query = "Select fees from scheduleinfo where username='" + ddldoctor.SelectedValue + "' ";
        SqlConnection con = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtfees.Text = Convert.ToString(ds.Tables[0].Rows[0]["fees"]);
            txtfees.ReadOnly = true;
        }
        else
        {
            txtfees.ReadOnly = false;
        }
    }
}