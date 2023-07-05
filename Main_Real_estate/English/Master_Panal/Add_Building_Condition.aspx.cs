using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Building_Condition : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Building_Condition_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addBuildingConditionQuary =
                    "Insert Into Building_Condition (Building_English_Condition,Building_Arabic_Condition) VALUES(@Building_English_Condition,@Building_Arabic_Condition)";
                _sqlCon.Open();
                MySqlCommand addBuildingConditionCmd = new MySqlCommand(addBuildingConditionQuary, _sqlCon);
                addBuildingConditionCmd.Parameters.AddWithValue("@Building_English_Condition",
                    txt_En_Building_Condition_Name.Text);
                addBuildingConditionCmd.Parameters.AddWithValue("@Building_Arabic_Condition",
                    txt_Ar_Building_Condition_Name.Text);
                addBuildingConditionCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Building_Condition.Text = "Added successfully";

                _sqlCon.Close();

                Response.Redirect("Building_Condition_List.aspx");
            }
        }

        protected void btn_Back_To_Ownership_statu_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Building_Condition_List.aspx");
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
                    lbl_titel_Add_New_Building_Condition.Text = Dt.Rows[69]["EN"].ToString();
                    lbl_En_Building_Condition_Name.Text = Dt.Rows[70]["EN"].ToString();
                    lbl_Ar_Building_Condition_Name.Text = Dt.Rows[71]["EN"].ToString();
                    btn_Add_Building_Condition.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Building_Condition_List.Text = Dt.Rows[72]["EN"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";
                }
                else
                {
                    lbl_titel_Add_New_Building_Condition.Text = Dt.Rows[69]["AR"].ToString();
                    lbl_En_Building_Condition_Name.Text = Dt.Rows[70]["AR"].ToString();
                    lbl_Ar_Building_Condition_Name.Text = Dt.Rows[71]["AR"].ToString();
                    btn_Add_Building_Condition.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Building_Condition_List.Text = Dt.Rows[72]["AR"].ToString();


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