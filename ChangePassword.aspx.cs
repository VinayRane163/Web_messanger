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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["session_id"] == null)
            {
                Response.Redirect("Login.aspx");

            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userId = Session["User_id"].ToString();
            SqlConnection conn = new SqlConnection("Server=sql.bsite.net\\MSSQL2016;Database=messanger_db;User Id=messanger_db;password=Ganesh@123.");
            SqlCommand cmd = new SqlCommand("UPDATE userinfo SET password = @User_password WHERE email = @User_id ;", conn);
            cmd.Parameters.AddWithValue("@User_id", userId);
            cmd.Parameters.AddWithValue("@User_password", txt_Password.Text);

            conn.Open();

            int rowsAffected = cmd.ExecuteNonQuery();

            conn.Close();

            if (rowsAffected > 0)
            {
                string successScript = "alert('Password changed successfully');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "RegistrationSuccessScript", successScript, true);
            }


        }
    }
}