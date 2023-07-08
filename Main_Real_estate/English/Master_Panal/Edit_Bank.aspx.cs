using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Bank : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();
                string bankId = Request.QueryString["Id"];
                DataTable getBankDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getBankCmd =
                    new MySqlCommand(
                        "SELECT Bank_Id , Bank_English_name , Bank_arabic_name  FROM Bank WHERE Bank_Id = @ID", _sqlCon);
                MySqlDataAdapter getBankDa = new MySqlDataAdapter(getBankCmd);

                getBankCmd.Parameters.AddWithValue("@ID", bankId);
                getBankDa.Fill(getBankDt);
                if (getBankDt.Rows.Count > 0)
                {
                    txt_En_Bank_Name.Text = getBankDt.Rows[0]["Bank_English_name"].ToString();
                    txt_Ar_Bank_Name.Text = getBankDt.Rows[0]["Bank_arabic_name"].ToString();
                    if (Session["Langues"].ToString() == "1") { lbl_titel_Name_Edit_Bank.Text = getBankDt.Rows[0]["Bank_English_name"].ToString(); }
                    else { lbl_titel_Name_Edit_Bank.Text = getBankDt.Rows[0]["Bank_arabic_name"].ToString(); }
                        
                }

                _sqlCon.Close();
            }
        }

        protected void btn_Back_To_Bank_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bank_List.aspx");
        }

        protected void btn_Add_Bank_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string bankId = Request.QueryString["Id"];
                string updateBankQuary =
                    "UPDATE Bank SET Bank_English_name=@Bank_English_name , Bank_arabic_name=@Bank_arabic_name  WHERE Bank_Id=@ID ";
                _sqlCon.Open();
                MySqlCommand updateBankCmd = new MySqlCommand(updateBankQuary, _sqlCon);
                updateBankCmd.Parameters.AddWithValue("@ID", bankId);
                updateBankCmd.Parameters.AddWithValue("@Bank_English_name", txt_En_Bank_Name.Text);
                updateBankCmd.Parameters.AddWithValue("@Bank_arabic_name", txt_Ar_Bank_Name.Text);
                updateBankCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_Bank.Text = "Edit successfully";
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
                    lbl_titel_Edit_Bank.Text = Dt.Rows[210]["EN"].ToString();
                    lbl_En_Bank_Name.Text = Dt.Rows[207]["EN"].ToString();
                    lbl_Ar_Bank_Name.Text = Dt.Rows[208]["EN"].ToString();
                    btn_Add_Bank.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_Bank_List.Text = Dt.Rows[209]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Edit_Bank.Text = Dt.Rows[210]["AR"].ToString();
                    lbl_En_Bank_Name.Text = Dt.Rows[207]["AR"].ToString();
                    lbl_Ar_Bank_Name.Text = Dt.Rows[208]["AR"].ToString();
                    btn_Add_Bank.Text = Dt.Rows[57]["AR"].ToString();
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