using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class appontmentfix : System.Web.UI.Page
{
    private string strConnection = ConfigurationManager.ConnectionStrings["strcon"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack) return;
        FillData();
        
        
    }
    protected void gddisplay_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "confirmappt")
        {
            var confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                var lnk = (LinkButton)e.CommandSource;
                var cmmndargs = lnk.CommandArgument.Split(',');
                var id = cmmndargs[0];
                var isappid = cmmndargs[1];
                if (isappid == "1")
                {
                    isappid = "0";
                }
                else if (isappid == "0")
                {
                    isappid = "1";
                }
                else { }
                SqlConnection con = new SqlConnection(strConnection);
                var sql = "update appointmentinfo set isapproved=" + isappid + " where id=" + id + " ";
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
    }

    private void FillData()
    {
        string query = " SELECT    a.id, a.date, a.time,a.day, (case a.isapproved when 1 then 'Confirmed' when 0 then 'Approval Remains' end) as IsApproved, a.isapproved as isappid,a.apptid, c.fullname,b.fullname AS DoctorName, a.doctorid, a.patientid FROM dbo.appointmentinfo as a LEFT JOIN dbo.userreg as b ON a.doctorid = b.username LEFT JOIN dbo.patient as c ON a.patientid = c.patientid";

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



