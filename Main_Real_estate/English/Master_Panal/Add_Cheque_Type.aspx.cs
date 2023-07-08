using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Cheque_Type : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_cheque_Type_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addChequeTypeQuary =
                    "Insert Into cheque_Type (cheque_English_Type,cheque_Arabic_Type) VALUES(@cheque_English_Type,@cheque_Arabic_Type)";
                _sqlCon.Open();
                MySqlCommand addChequeTypeCmd = new MySqlCommand(addChequeTypeQuary, _sqlCon);
                addChequeTypeCmd.Parameters.AddWithValue("@cheque_English_Type", txt_En_cheque_Type_Name.Text);
                addChequeTypeCmd.Parameters.AddWithValue("@cheque_Arabic_Type", txt_Ar_cheque_Type_Name.Text);
                addChequeTypeCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_cheque_Type.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("cheque_Type_List.aspx");
            }
        }

        protected void btn_Back_To_cheque_Type_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("cheque_Type_List.aspx");
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
                    lbl_titel_Add_New_cheque_Type.Text = Dt.Rows[201]["EN"].ToString();
                    lbl_En_cheque_Type_Name.Text = Dt.Rows[202]["EN"].ToString();
                    lbl_Ar_cheque_Type_Name.Text = Dt.Rows[203]["EN"].ToString();
                    btn_Add_cheque_Type.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_cheque_Type_List.Text = Dt.Rows[204]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Add_New_cheque_Type.Text = Dt.Rows[201]["AR"].ToString();
                    lbl_En_cheque_Type_Name.Text = Dt.Rows[202]["AR"].ToString();
                    lbl_Ar_cheque_Type_Name.Text = Dt.Rows[203]["AR"].ToString();
                    btn_Add_cheque_Type.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_cheque_Type_List.Text = Dt.Rows[204]["AR"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "أنكليزي فقط";
                    RegularExpressionValidator2.ErrorMessage = "عربي فقط";

                    reqFuild1.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator1.ErrorMessage = "* مطلوب";

                }
            }
            _sqlCon.Close();

        }
    }
}