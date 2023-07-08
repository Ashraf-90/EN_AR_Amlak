using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Employee_Level : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Employee_Level_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addEmployeeLevelQuary =
                    "Insert Into Employee_Level (Employee_English_Level,Employee_Arabic_Level) VALUES(@Employee_English_Level,@Employee_Arabic_Level)";
                _sqlCon.Open();
                MySqlCommand addEmployeeLevelCmd = new MySqlCommand(addEmployeeLevelQuary, _sqlCon);
                addEmployeeLevelCmd.Parameters.AddWithValue("@Employee_English_Level",
                    txt_En_Employee_Level_Name.Text);
                addEmployeeLevelCmd.Parameters.AddWithValue("@Employee_Arabic_Level",
                    txt_Ar_Employee_Level_Name.Text);
                addEmployeeLevelCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Employee_Level.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("Employee_Level_List.aspx");
            }
        }

        protected void btn_Back_To_Employee_Level_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee_Level_List.aspx");
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
                    lbl_titel_Add_New_Employee_Level.Text = Dt.Rows[256]["EN"].ToString();
                    lbl_En_Employee_Level_Name.Text = Dt.Rows[257]["EN"].ToString();
                    lbl_Ar_Employee_Level_Name.Text = Dt.Rows[258]["EN"].ToString();
                    btn_Add_Employee_Level.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Employee_Level_List.Text = Dt.Rows[259]["EN"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";
                }
                else
                {
                    lbl_titel_Add_New_Employee_Level.Text = Dt.Rows[256]["AR"].ToString();
                    lbl_En_Employee_Level_Name.Text = Dt.Rows[257]["AR"].ToString();
                    lbl_Ar_Employee_Level_Name.Text = Dt.Rows[258]["AR"].ToString();
                    btn_Add_Employee_Level.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Employee_Level_List.Text = Dt.Rows[259]["AR"].ToString();


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