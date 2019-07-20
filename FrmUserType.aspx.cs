using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class FrmUserType : System.Web.UI.Page
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

        string utid = "";
        string sql = "select (coalesce(max(Id),0)+1) as UtId from usertypeinfo";
        SqlCommand cmmnd = new SqlCommand(sql, con);
        con.Open();
        var y = cmmnd.ExecuteScalar();
        con.Close();
        utid = string.Concat(txtustype.Text.Substring(0, 1).ToUpper(), "_00", y);

        con.Open();
        SqlCommand cmd = new SqlCommand("spInsertUserType", con);
        cmd.Parameters.AddWithValue("@utid", SqlDbType.VarChar).Value = utid;
        cmd.Parameters.AddWithValue("@utname", SqlDbType.VarChar).Value = txtustype.Text;
        cmd.Parameters.AddWithValue("@createddate", SqlDbType.DateTime).Value = DateTime.Now.ToString();
        cmd.Parameters.AddWithValue("@status", SqlDbType.Int).Value = 1;
       
        cmd.CommandType = CommandType.StoredProcedure;
        int x = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        if (x ==-1)
        {
            
        }
        else { FillData(); }
    }

    protected void gddisplay_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "updstatus")
        {
            var lnk = (LinkButton)e.CommandSource;
            var cmmndargs = lnk.CommandArgument.Split(',');
            var utid = cmmndargs[0];
            var statusid = cmmndargs[1];
            if (statusid == "1")
            {
                statusid = "2";
            }
            else if (statusid == "2")
            {
                statusid = "1";
            }
            else if (statusid == "3")
            {
                statusid = "1";
            }
            else { }
            SqlConnection con = new SqlConnection(strConnection);
            var sql = "update usertypeinfo set status=" + statusid + " where utid='" + utid+"' ";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
            int x = cmd.ExecuteNonQuery();
            con.Close();
            if (x > 0)
            {
                FillData();
            }
            else
            {
            }
        }
    }


    private void FillData()
    {
        string query = "Select utid,utname,createddate,(case status when 1 then 'Active' when 2 then 'InActive' end) as Status, status as StatusId from usertypeinfo where status!=0";
        SqlConnection con = new SqlConnection(strConnection);
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            gddisplay.DataSource = ds;
            gddisplay.DataBind();
        }

    }
}