using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Bank : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Back_To_Bank_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bank_List.aspx");
        }

        protected void btn_Add_Bank_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addBankQuary =  "Insert Into Bank (Bank_English_name,Bank_arabic_name) VALUES(@Bank_English_name,@Bank_arabic_name)";
                _sqlCon.Open();
                MySqlCommand addBankCmd = new MySqlCommand(addBankQuary, _sqlCon);
                addBankCmd.Parameters.AddWithValue("@Bank_English_name", txt_En_Bank_Name.Text);
                addBankCmd.Parameters.AddWithValue("@Bank_arabic_name", txt_Ar_Bank_Name.Text);
                addBankCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Bank.Text = "Added successfully";
                Response.Redirect("Bank_List.aspx");
            }
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
                    lbl_titel_Add_New_Bank.Text = Dt.Rows[206]["EN"].ToString();
                    lbl_En_Bank_Name.Text = Dt.Rows[207]["EN"].ToString();
                    lbl_Ar_Bank_Name.Text = Dt.Rows[208]["EN"].ToString();
                    btn_Add_Bank.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Bank_List.Text = Dt.Rows[209]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Add_New_Bank.Text = Dt.Rows[206]["AR"].ToString();
                    lbl_En_Bank_Name.Text = Dt.Rows[207]["AR"].ToString();
                    lbl_Ar_Bank_Name.Text = Dt.Rows[208]["AR"].ToString();
                    btn_Add_Bank.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Bank_List.Text = Dt.Rows[209]["AR"].ToString();

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