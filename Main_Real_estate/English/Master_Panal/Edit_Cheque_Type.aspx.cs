using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Cheque_Type : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();
                string chequeTypeId = Request.QueryString["Id"];
                DataTable getChequeTypeDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getChequeTypeCmd =
                    new MySqlCommand(
                        "SELECT cheque_Type_id , cheque_English_Type , cheque_Arabic_Type  FROM cheque_Type WHERE cheque_Type_id = @ID",
                        _sqlCon);
                MySqlDataAdapter getChequeTypeDa = new MySqlDataAdapter(getChequeTypeCmd);

                getChequeTypeCmd.Parameters.AddWithValue("@ID", chequeTypeId);
                getChequeTypeDa.Fill(getChequeTypeDt);
                if (getChequeTypeDt.Rows.Count > 0)
                {
                    txt_En_cheque_Type_Name.Text = getChequeTypeDt.Rows[0]["cheque_English_Type"].ToString();
                    txt_Ar_cheque_Type_Name.Text = getChequeTypeDt.Rows[0]["cheque_Arabic_Type"].ToString();

                    if (Session["Langues"].ToString() == "1") { lbl_Name_Of_cheque_Type.Text = getChequeTypeDt.Rows[0]["cheque_English_Type"].ToString(); }
                    else { lbl_Name_Of_cheque_Type.Text = getChequeTypeDt.Rows[0]["cheque_Arabic_Type"].ToString(); }
                        
                }

                _sqlCon.Close();
            }
        }

        protected void btn_Back_To_cheque_Type_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("cheque_Type_List.aspx");
        }

        protected void btn_Edit_cheque_Type_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string chequeTypeId = Request.QueryString["Id"];
                string updateChequeTupeQuary =
                    "UPDATE cheque_Type SET cheque_English_Type=@cheque_English_Type , cheque_Arabic_Type=@cheque_Arabic_Type  WHERE cheque_Type_id=@ID ";
                _sqlCon.Open();
                MySqlCommand updateChequeTypeCmd = new MySqlCommand(updateChequeTupeQuary, _sqlCon);
                updateChequeTypeCmd.Parameters.AddWithValue("@ID", chequeTypeId);
                updateChequeTypeCmd.Parameters.AddWithValue("@cheque_English_Type", txt_En_cheque_Type_Name.Text);
                updateChequeTypeCmd.Parameters.AddWithValue("@cheque_Arabic_Type", txt_Ar_cheque_Type_Name.Text);
                updateChequeTypeCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_New_cheque_Type.Text = "Edit successfully";
                Response.Redirect("cheque_Type_List.aspx");
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
                    lbl_titel_Edit_New_cheque_Type.Text = Dt.Rows[205]["EN"].ToString();
                    lbl_En_cheque_Type_Name.Text = Dt.Rows[202]["EN"].ToString();
                    lbl_Ar_cheque_Type_Name.Text = Dt.Rows[203]["EN"].ToString();
                    btn_Edit_cheque_Type.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_cheque_Type_List.Text = Dt.Rows[204]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Edit_New_cheque_Type.Text = Dt.Rows[205]["AR"].ToString();
                    lbl_En_cheque_Type_Name.Text = Dt.Rows[202]["AR"].ToString();
                    lbl_Ar_cheque_Type_Name.Text = Dt.Rows[203]["AR"].ToString();
                    btn_Edit_cheque_Type.Text = Dt.Rows[57]["AR"].ToString();
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