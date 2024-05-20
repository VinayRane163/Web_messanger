using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_Messenger
{
    public partial class Home : System.Web.UI.Page
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
                    string query = "SELECT * FROM userinfo WHERE email <> @email";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@email", userId);


                        using (SqlDataReader reader = command.ExecuteReader())
                        {

                            Repeater1.DataSource = reader;
                            Repeater1.DataBind();
                        }
                    }
                }

                if (IsPostBack)
                {

                    string touser = TextBox1.Text;
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "SELECT * FROM User_Message WHERE (from_user = @User_id AND to_user = @To_user)  OR (from_user = @To_user AND to_user = @User_id)";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@User_id", userId);
                            command.Parameters.AddWithValue("@To_user", touser);

                            connection.Open();

                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                rptGuides.DataSource = reader;
                                rptGuides.DataBind();
                            }
                        }
                    }
                }

            }
        }

       


        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {


                if (string.IsNullOrWhiteSpace(textbox.Text))
                {

                    return;
                }
                else
                {
                    string touser = TextBox1.Text;

                    string userId = Session["User_id"].ToString();

                    // Proceed with inserting message into the database with from and to users
                    string connectionString = "Server=sql.bsite.net\\MSSQL2016;Database=messanger_db;User Id=messanger_db;password=Ganesh@123.";

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO User_Message (From_user, To_user, message) VALUES (@From_user, @To_user, @message)";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@From_user", userId);
                            cmd.Parameters.AddWithValue("@To_user", touser);
                            cmd.Parameters.AddWithValue("@message", textbox.Text);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                            ClearTextboxes();
                            ScriptManager.RegisterStartupScript(this, GetType(), "RefreshScript", "refreshPage();", true);
                        }
                    }
                    void ClearTextboxes()
                    {
                        textbox.Text = " ";
                    }
                }
            }
            catch {
                string script = "alert('error occured');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "InvalidUserScript", script, true);
                return;
            }   

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectEmail")
            {
                string email = e.CommandArgument.ToString();
                TextBox1.Text = email;
                // Now you can perform any other actions you need
            }
        }

        protected string GetAlignment(object fromUser)
        {
            // Assuming "fromUser" and "Session["User_id"]" are of the same type
            string currentUser = Session["User_id"].ToString();

            // Compare "fromUser" with the current user
            if (fromUser.ToString() == currentUser)
                return "text-right"; // Message sent by the current user
            else
                return "text-left"; // Message sent to the current user
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            string connectionString = "Server=sql.bsite.net\\MSSQL2016;Database=messanger_db;User Id=messanger_db;password=Ganesh@123.";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM userinfo WHERE email LIKE '%' + @email + '%'";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@email", Search_Box.Text);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        Repeater1.DataSource = reader;
                        Repeater1.DataBind();
                    }
                }
            }
        }
    }
}