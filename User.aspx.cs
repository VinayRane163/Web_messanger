using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Messenger
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["session_id"] == null)
            {

                Response.Redirect("Login.aspx");

            }
            else
            {
                string userId = Session["User_id"].ToString();
                string connectionString = "Server=sql.bsite.net\\MSSQL2016;Database=messanger_db;User Id=messanger_db;password=Ganesh@123.";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * from userinfo where email = @User_id";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@User_id", userId);
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            rptGuides.DataSource = reader;
                            rptGuides.DataBind();
                        }
                    }
                }
            }
        }
        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session["session_id"] = null;
            Session["User_id"] = null;
            Response.Redirect("Login.aspx");

        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void CNG_Password_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void CNG_INFO_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeUserInfo.aspx");
        }
    }
}