using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Asset_Condition : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Asset_Condition_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addAssetConditionQuary =
                    "Insert Into asset_condition (Asset_English_Condition,Asset_Arabic_Condition) VALUES(@Asset_English_Condition,@Asset_Arabic_Condition)";
                _sqlCon.Open();
                MySqlCommand addAssetConditionCmd = new MySqlCommand(addAssetConditionQuary, _sqlCon);
                addAssetConditionCmd.Parameters.AddWithValue("@Asset_English_Condition",
                    txt_En_Asset_Condition_Name.Text);
                addAssetConditionCmd.Parameters.AddWithValue("@Asset_Arabic_Condition",
                    txt_Ar_Asset_Condition_Name.Text);
                addAssetConditionCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Asset_Condition.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("Asset_Condition_List.aspx");
            }
        }

        protected void btn_Back_To_Asset_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Asset_Condition_List.aspx");
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
                    lbl_titel_Add_New_Asset_Condition.Text = Dt.Rows[176]["EN"].ToString();
                    lbl_En_Asset_Condition_Name.Text = Dt.Rows[177]["EN"].ToString();
                    lbl_Ar_Asset_Condition_Name.Text = Dt.Rows[178]["EN"].ToString();
                    btn_Add_Asset_Condition.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Asset_Condition_List.Text = Dt.Rows[179]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Add_New_Asset_Condition.Text = Dt.Rows[176]["AR"].ToString();
                    lbl_En_Asset_Condition_Name.Text = Dt.Rows[177]["AR"].ToString();
                    lbl_Ar_Asset_Condition_Name.Text = Dt.Rows[178]["AR"].ToString();
                    btn_Add_Asset_Condition.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Asset_Condition_List.Text = Dt.Rows[179]["AR"].ToString();

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