using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Contract_Type : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }
        protected void btn_Add_Contract_Type_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addContractTypeQuary =
                    "Insert Into Contract_Type (Contract_English_Type,Contract_Arabic_Type) VALUES(@Contract_English_Type,@Contract_Arabic_Type)";
                _sqlCon.Open();
                MySqlCommand addContractTypeCmd = new MySqlCommand(addContractTypeQuary, _sqlCon);
                addContractTypeCmd.Parameters.AddWithValue("@Contract_English_Type", txt_En_Contract_Type_Name.Text);
                addContractTypeCmd.Parameters.AddWithValue("@Contract_Arabic_Type", txt_Ar_Contract_Type_Name.Text);
                addContractTypeCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Contract_Type.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("Contract_Type_List.aspx");
            }
        }

        protected void btn_Back_To_Contract_Type_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contract_Type_List.aspx");
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
                    lbl_titel_Add_New_Contract_Type.Text = Dt.Rows[113]["EN"].ToString();
                    lbl_En_Contract_Type_Name.Text = Dt.Rows[114]["EN"].ToString();
                    lbl_Ar_Contract_Type_Name.Text = Dt.Rows[115]["EN"].ToString();
                    btn_Add_Contract_Type.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Contract_Type_List.Text = Dt.Rows[116]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";

                    reqFuild1.ErrorMessage = "* Required";
                    reqFuild2.ErrorMessage = "* Required";
                }
                else
                {
                    lbl_titel_Add_New_Contract_Type.Text = Dt.Rows[113]["AR"].ToString();
                    lbl_En_Contract_Type_Name.Text = Dt.Rows[114]["AR"].ToString();
                    lbl_Ar_Contract_Type_Name.Text = Dt.Rows[115]["AR"].ToString();
                    btn_Add_Contract_Type.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Contract_Type_List.Text = Dt.Rows[116]["AR"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";

                    reqFuild1.ErrorMessage = "* Required";
                    reqFuild2.ErrorMessage = "* Required";

                }
            }
            _sqlCon.Close();

        }
    }
}