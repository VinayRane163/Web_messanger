using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Messenger
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TxtUsername.Text) || string.IsNullOrWhiteSpace(TxtPassword.Text))
            {
                string script = "showFlashMessage('Please enter both username and password.');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "EmptyFieldsScript", script, true);
                return;
            }

            SqlConnection conn = new SqlConnection("Server=sql.bsite.net\\MSSQL2016;Database=messanger_db;User Id=messanger_db;password=Ganesh@123.");
            SqlCommand cmd = new SqlCommand("select * from userinfo where email=@User_id and password=@User_password", conn);
            cmd.Parameters.AddWithValue("@User_id", TxtUsername.Text);
            cmd.Parameters.AddWithValue("@User_password", TxtPassword.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "userinfo");

            if (ds.Tables["userinfo"].Rows.Count == 0)
            {
                string script = "alert('Invalid User or Password');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "InvalidUserScript", script, true);
            }
            else
            {
                
                Session["session_id"] = Session.SessionID;
                Session["User_id"] = TxtUsername.Text;
                Response.Redirect("home.aspx");
            }
        }
    }
}