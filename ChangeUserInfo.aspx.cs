﻿using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Web_Messenger
{
    public partial class ChangeUserInfo : System.Web.UI.Page
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
            if (string.IsNullOrWhiteSpace(txt_UserName.Text) && string.IsNullOrWhiteSpace(txt_phonenumber.Text))
            {
                string successScript = "alert('aaein! enter data if u wawnna change it');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "RegistrationSuccessScript", successScript, true);
                return;
            }
            if (IsNumberAlreadyExists(txt_phonenumber.Text))
            {
                string successScript = "alert('number already in use');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "RegistrationSuccessScript", successScript, true);
                return;
            }



            else if (string.IsNullOrWhiteSpace(txt_UserName.Text))
            {


                string userId = Session["User_id"].ToString();
                SqlConnection conn = new SqlConnection("Server=sql.bsite.net\\MSSQL2016;Database=messanger_db;User Id=messanger_db;password=Ganesh@123.");
                SqlCommand cmd = new SqlCommand("UPDATE userinfo SET mobile = @User_mobile  WHERE email = @User_id ;", conn);
                cmd.Parameters.AddWithValue("@User_id", userId);
                cmd.Parameters.AddWithValue("@User_mobile", txt_phonenumber.Text);

                conn.Open();

                int rowsAffected = cmd.ExecuteNonQuery();

                conn.Close();

                if (rowsAffected > 0)
                {
                    string successScript = "alert('Number Changed Successfully');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "RegistrationSuccessScript", successScript, true);
                }
                ClearTextboxes();
            }

            else if (string.IsNullOrWhiteSpace(txt_phonenumber.Text))
            {
                string userId = Session["User_id"].ToString();
                SqlConnection conn = new SqlConnection("Server=sql.bsite.net\\MSSQL2016;Database=messanger_db;User Id=messanger_db;password=Ganesh@123.");
                SqlCommand cmd = new SqlCommand("UPDATE userinfo SET name = @User_Name   WHERE email = @User_id ;", conn);
                cmd.Parameters.AddWithValue("@User_id", userId);
                cmd.Parameters.AddWithValue("@User_Name", txt_UserName.Text);

                conn.Open();

                int rowsAffected = cmd.ExecuteNonQuery();

                conn.Close();

                if (rowsAffected > 0)
                {
                    string successScript = "alert('UserName Changed Successfully');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "RegistrationSuccessScript", successScript, true);
                }
                ClearTextboxes();
            }
            else
            {
                string userId = Session["User_id"].ToString();
                SqlConnection conn = new SqlConnection("Server=sql.bsite.net\\MSSQL2016;Database=messanger_db;User Id=messanger_db;password=Ganesh@123.");
                SqlCommand cmd = new SqlCommand("UPDATE UserInfo SET name = @User_Name  , mobile = @User_mobile  WHERE email = @User_id ;", conn);
                cmd.Parameters.AddWithValue("@User_id", userId);
                cmd.Parameters.AddWithValue("@User_Name", txt_UserName.Text);
                cmd.Parameters.AddWithValue("@User_mobile", txt_phonenumber.Text);

                conn.Open();

                int rowsAffected = cmd.ExecuteNonQuery();

                conn.Close();

                if (rowsAffected > 0)
                {
                    string successScript = "alert('Changed Successfully');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "RegistrationSuccessScript", successScript, true);
                }
                ClearTextboxes();

            }

            void ClearTextboxes()
            {
                txt_UserName.Text = " ";
                txt_phonenumber.Text = " ";
            }

        }

        private bool IsNumberAlreadyExists(string number)
        {
            // Check if the email already exists in the database
            SqlConnection conn = new SqlConnection("Server=sql.bsite.net\\MSSQL2016;Database=messanger_db;User Id=messanger_db;password=Ganesh@123.");
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM userinfo WHERE mobile = @number", conn);
            cmd.Parameters.AddWithValue("@number", number);

            conn.Open();
            int count = (int)cmd.ExecuteScalar();
            conn.Close();

            return count > 0;
        }
    }
}