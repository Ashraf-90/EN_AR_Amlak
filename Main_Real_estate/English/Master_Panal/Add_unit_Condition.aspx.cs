using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Unit_Condition : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Unit_Condition_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addUnitConditionQuar =
                    "Insert Into Unit_Condition (Unit_English_Condition,Unit_Arabic_Condition) VALUES(@Unit_English_Condition,@Unit_Arabic_Condition)";
                _sqlCon.Open();
                MySqlCommand addUnitConditionCmd = new MySqlCommand(addUnitConditionQuar, _sqlCon);
                addUnitConditionCmd.Parameters.AddWithValue("@Unit_English_Condition",
                    txt_En_Unit_Condition_Name.Text);
                addUnitConditionCmd.Parameters.AddWithValue("@Unit_Arabic_Condition",
                    txt_Ar_Unit_Condition_Name.Text);
                addUnitConditionCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Unit_Condition.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("Unit_Condition_List.aspx");
            }
        }

        protected void btn_Back_To_Unit_Condition_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Unit_Condition_List.aspx");
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
                    lbl_titel_Add_New_Unit_Condition.Text = Dt.Rows[84]["EN"].ToString();
                    lbl_En_Unit_Condition_Name.Text = Dt.Rows[85]["EN"].ToString();
                    lbl_Ar_Unit_Condition_Name.Text = Dt.Rows[86]["EN"].ToString();
                    btn_Add_Unit_Condition.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Unit_Condition_List.Text = Dt.Rows[87]["EN"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";


                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Add_New_Unit_Condition.Text = Dt.Rows[84]["AR"].ToString();
                    lbl_En_Unit_Condition_Name.Text = Dt.Rows[85]["AR"].ToString();
                    lbl_Ar_Unit_Condition_Name.Text = Dt.Rows[86]["AR"].ToString();
                    btn_Add_Unit_Condition.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Unit_Condition_List.Text = Dt.Rows[87]["AR"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "إنكليزي فقط";
                    RegularExpressionValidator2.ErrorMessage = "عربي فقط";

                    reqFuild1.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator1.ErrorMessage = "* مطلوب";

                }
            }
            _sqlCon.Close();

        }
    }
}