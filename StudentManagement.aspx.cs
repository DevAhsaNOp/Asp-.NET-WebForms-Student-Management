﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class StudentManagement : System.Web.UI.Page
    {
        readonly string connectionString = "Data Source=DEV-AHSAN\\SQLEXPRESS;Initial Catalog=WebFormsStudentManagement;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CascadingDropDownListForClass();
                LoadDataInTable();
            }
        }


        private void CascadingDropDownListForClass()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblClass", conn)
                {
                    CommandType = CommandType.Text
                };
                SqlDataReader reader = cmd.ExecuteReader();
                ClassID.DataSource = reader;
                ClassID.DataTextField = "ClassName";
                ClassID.DataValueField = "ClassID";
                ClassID.DataBind();
                ClassID.Items.Insert(0, new ListItem("--Select Class--", "0"));
                conn.Close();
            }
        }

        protected void ClassID_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                int classID = Convert.ToInt32(ClassID.SelectedValue);
                GetAllSectionsByClass(classID, conn);
                conn.Close();
            }
        }

        private void GetAllSectionsByClass(int ClassID, SqlConnection conn)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblSection WHERE ClassID = " + ClassID, conn)
            {
                CommandType = CommandType.Text
            };
            SqlDataReader reader = cmd.ExecuteReader();
            SectionID.DataSource = reader;
            SectionID.DataTextField = "SectionName";
            SectionID.DataValueField = "SectionID";
            SectionID.DataBind();
            SectionID.Items.Insert(0, new ListItem("--Select Section--", "0"));
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO tblStudent(StudentName, StudentFatherName, AdmissionDate, SectionID, IsActive, CreatedOn) VALUES(@StudentName, @StudentFatherName, @AdmissionDate, @SectionID, @IsActive, @CreatedOn)", conn)
                {
                    CommandType = CommandType.Text
                };
                cmd.Parameters.AddWithValue("@StudentName", StudentName.Text);
                cmd.Parameters.AddWithValue("@StudentFatherName", StudentFatherName.Text);
                cmd.Parameters.AddWithValue("@AdmissionDate", AdmissionDate.Text);
                cmd.Parameters.AddWithValue("@SectionID", SectionID.SelectedValue);
                cmd.Parameters.AddWithValue("@IsActive", true);
                cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                cmd.ExecuteNonQuery();
                conn.Close();
                EmptyAllFields();
                LoadDataInTable();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            EmptyAllFields();
        }

        private void EmptyAllFields()
        {
            btnSave.Enabled = true;
            StudentName.Text = "";
            StudentFatherName.Text = "";
            AdmissionDate.Text = "";
            ClassID.ClearSelection();
            SectionID.ClearSelection();
        }

        private void LoadDataInTable()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT StudentID, StudentName, StudentFatherName, c.ClassName , s.SectionName , AdmissionDate FROM tblStudent std inner join tblSection s on std.SectionID = s.SectionID inner join tblClass c on c.ClassID = s.ClassID", conn)
                {
                    CommandType = CommandType.Text
                };
                SqlDataReader reader = cmd.ExecuteReader();
                StudentGridView.DataSource = reader;
                StudentGridView.DataBind();
                conn.Close();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

        }

        protected void StudentGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ShowDetails")
            {
                int StudentID = Convert.ToInt32(e.CommandArgument);
                btnSave.Enabled = false;
                FillStudentDetailsInFields(StudentID);
            }
        }

        private void FillStudentDetailsInFields(int StudentID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                int classID = 0, sectionID = 0;
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT StudentID, StudentName, StudentFatherName, c.ClassID , s.SectionID , AdmissionDate FROM tblStudent std inner join tblSection s on std.SectionID = s.SectionID inner join tblClass c on c.ClassID = s.ClassID WHERE std.StudentID = " + StudentID, conn)
                {
                    CommandType = CommandType.Text
                };
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        StudentName.Text = reader["StudentName"].ToString();
                        StudentFatherName.Text = reader["StudentFatherName"].ToString();
                        AdmissionDate.Text = DateTime.Parse(reader["AdmissionDate"].ToString()).ToString("yyyy-MM-dd");
                        ClassID.SelectedValue = reader["ClassID"].ToString();
                        classID = Convert.ToInt32(reader["ClassID"].ToString());
                        sectionID = Convert.ToInt32(reader["SectionID"].ToString());
                    }
                }
                reader.Close();
                GetAllSectionsByClass(classID, conn);
                SectionID.SelectedValue = sectionID.ToString();
                conn.Close();
            }
        }
    }
}