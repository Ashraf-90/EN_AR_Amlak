using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Payment_Type : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Payment_Type_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addPaymentTypeQuary =
                    "Insert Into Payment_Type (Payment_English_Type,Payment_Arabic_Type) VALUES(@Payment_English_Type,@Payment_Arabic_Type)";
                _sqlCon.Open();
                MySqlCommand addPaymentTypeCmd = new MySqlCommand(addPaymentTypeQuary, _sqlCon);
                addPaymentTypeCmd.Parameters.AddWithValue("@Payment_English_Type", txt_En_Payment_Type_Name.Text);
                addPaymentTypeCmd.Parameters.AddWithValue("@Payment_Arabic_Type", txt_Ar_Payment_Type_Name.Text);
                addPaymentTypeCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Payment_Type.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("Payment_Type_List.aspx");
            }
        }

        protected void btn_Back_To_Payment_Type_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment_Type_List.aspx");
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
                    lbl_titel_Add_New_Payment_Type.Text = Dt.Rows[123]["EN"].ToString();
                    lbl_En_Payment_Type_Name.Text = Dt.Rows[124]["EN"].ToString();
                    lbl_Ar_Payment_Type_Name.Text = Dt.Rows[125]["EN"].ToString();
                    btn_Add_Payment_Type.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Payment_Type_List.Text = Dt.Rows[126]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";

                    reqFuild1.ErrorMessage = "* Required";
                    reqFuild2.ErrorMessage = "* Required";
                }
                else
                {
                    lbl_titel_Add_New_Payment_Type.Text = Dt.Rows[123]["AR"].ToString();
                    lbl_En_Payment_Type_Name.Text = Dt.Rows[124]["AR"].ToString();
                    lbl_Ar_Payment_Type_Name.Text = Dt.Rows[125]["AR"].ToString();
                    btn_Add_Payment_Type.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Payment_Type_List.Text = Dt.Rows[126]["AR"].ToString();

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