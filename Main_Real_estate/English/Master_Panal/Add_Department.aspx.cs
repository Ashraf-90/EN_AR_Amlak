using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Department : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Department_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addDepartmentQuary =
                    "Insert Into Department (Department_English_name,Department_arabic_name) VALUES(@Department_English_name,@Department_arabic_name)";
                _sqlCon.Open();
                MySqlCommand addDepartmentCmd = new MySqlCommand(addDepartmentQuary, _sqlCon);
                addDepartmentCmd.Parameters.AddWithValue("@Department_English_name", txt_En_Department_Name.Text);
                addDepartmentCmd.Parameters.AddWithValue("@Department_arabic_name", txt_Ar_Department_Name.Text);
                addDepartmentCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Department.Text = "Added successfully";
                Response.Redirect("Department_List.aspx");
            }
        }

        protected void btn_Back_To_Department_List_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Department_List.aspx");
        }




        //******************************************************************************************************************************************
        //************************************************** languages ****************************************************************
        //******************************************************************************************************************************************

        protected void language()
        {

            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            _sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_master", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_titel_Add_New_Department.Text = Dt.Rows[251]["EN"].ToString();
                    lbl_En_Department_Name.Text = Dt.Rows[252]["EN"].ToString();
                    lbl_Ar_Department_Name.Text = Dt.Rows[253]["EN"].ToString();
                    btn_Add_Department.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Department_List.Text = Dt.Rows[254]["EN"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";
                }
                else
                {
                    lbl_titel_Add_New_Department.Text = Dt.Rows[251]["AR"].ToString();
                    lbl_En_Department_Name.Text = Dt.Rows[252]["AR"].ToString();
                    lbl_Ar_Department_Name.Text = Dt.Rows[253]["AR"].ToString();
                    btn_Add_Department.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Department_List.Text = Dt.Rows[254]["AR"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "فقط إنكليزي";
                    RegularExpressionValidator2.ErrorMessage = "فقط عربي";

                    reqFuild1.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator1.ErrorMessage = "* مطلوب";

                }
            }
            _sqlCon.Close();

        }
    }
}