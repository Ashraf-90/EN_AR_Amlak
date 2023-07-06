using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Contract_Template : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Contract_Template_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addContractTemplateQuary =
                    "Insert Into Contract_Template (Contract_English_Template,Contract_Arabic_Template) VALUES(@Contract_English_Template,@Contract_Arabic_Template)";
                _sqlCon.Open();
                MySqlCommand addContractTemplateCmd = new MySqlCommand(addContractTemplateQuary, _sqlCon);
                addContractTemplateCmd.Parameters.AddWithValue("@Contract_English_Template",
                    txt_En_Contract_Template_Name.Text);
                addContractTemplateCmd.Parameters.AddWithValue("@Contract_Arabic_Template",
                    txt_Ar_Contract_Template_Name.Text);
                addContractTemplateCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Contract_Template.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("Contract_Template_List.aspx");
            }
        }

        protected void btn_Back_To_Contract_Template_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contract_Template_List.aspx");
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
                    lbl_titel_Add_New_Contract_Template.Text = Dt.Rows[118]["EN"].ToString();
                    lbl_En_Contract_Template_Name.Text = Dt.Rows[119]["EN"].ToString();
                    lbl_Ar_Contract_Template_Name.Text = Dt.Rows[120]["EN"].ToString();
                    btn_Add_Contract_Template.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Contract_Template_List.Text = Dt.Rows[121]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";

                    reqFuild1.ErrorMessage = "* Required";
                    reqFuild2.ErrorMessage = "* Required";
                }
                else
                {
                    lbl_titel_Add_New_Contract_Template.Text = Dt.Rows[118]["AR"].ToString();
                    lbl_En_Contract_Template_Name.Text = Dt.Rows[119]["AR"].ToString();
                    lbl_Ar_Contract_Template_Name.Text = Dt.Rows[120]["AR"].ToString();
                    btn_Add_Contract_Template.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Contract_Template_List.Text = Dt.Rows[121]["AR"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "إنكليزي فقط";
                    RegularExpressionValidator2.ErrorMessage = "عربي فقط";

                    reqFuild1.ErrorMessage = "* مطلوب";
                    reqFuild2.ErrorMessage = "* مطلوب";

                }
            }
            _sqlCon.Close();

        }
    }
}