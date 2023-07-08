using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Contractor : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();
                string ContractorId = Request.QueryString["Id"];
                DataTable getContractorDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getContractorCmd = new MySqlCommand("SELECT * FROM contractor WHERE Contractor_ID = @ID",
                        _sqlCon);
                MySqlDataAdapter getContractorDa = new MySqlDataAdapter(getContractorCmd);

                getContractorCmd.Parameters.AddWithValue("@ID", ContractorId);
                getContractorDa.Fill(getContractorDt);
                if (getContractorDt.Rows.Count > 0)
                {
                    txt_Ar_contractor_Name.Text = getContractorDt.Rows[0]["Contractor_Ar_Name"].ToString();
                    txt_En_contractor_Name.Text = getContractorDt.Rows[0]["Contractor_En_Name"].ToString();
                    txt_Company_Name.Text = getContractorDt.Rows[0]["Contractor_Company_Name"].ToString();
                    txt_Company_Editress.Text = getContractorDt.Rows[0]["Contractor_Company_Address"].ToString();
                    txt_contractor_tell.Text = getContractorDt.Rows[0]["Contractor_Phon"].ToString();
                    if (Session["Langues"].ToString() == "1") { lbl_Contractor_Name.Text = getContractorDt.Rows[0]["Contractor_En_Name"].ToString(); }
                    else { lbl_Contractor_Name.Text = getContractorDt.Rows[0]["Contractor_Ar_Name"].ToString(); }

                        
                }

                _sqlCon.Close();
            }
        }
        protected void btn_Edit_contractor_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string ContractorId = Request.QueryString["Id"];

                string updateContractorQuary =
                    "UPDATE contractor SET " +
                    "Contractor_Ar_Name=@Contractor_Ar_Name , " +
                    "Contractor_En_Name=@Contractor_En_Name , " +
                    "Contractor_Company_Name=@Contractor_Company_Name, " +
                    "Contractor_Company_Address=@Contractor_Company_Address , " +
                    "Contractor_Phon=@Contractor_Phon " +
                    " WHERE Contractor_ID=@ID ";
                _sqlCon.Open();
                MySqlCommand updateContractorCmd = new MySqlCommand(updateContractorQuary, _sqlCon);
                updateContractorCmd.Parameters.AddWithValue("@ID", ContractorId);
                updateContractorCmd.Parameters.AddWithValue("@Contractor_En_Name", txt_En_contractor_Name.Text);
                updateContractorCmd.Parameters.AddWithValue("@Contractor_Ar_Name", txt_Ar_contractor_Name.Text);
                updateContractorCmd.Parameters.AddWithValue("@Contractor_Company_Name", txt_Company_Name.Text);
                updateContractorCmd.Parameters.AddWithValue("@Contractor_Company_Address", txt_Company_Editress.Text);
                updateContractorCmd.Parameters.AddWithValue("@Contractor_Phon", txt_contractor_tell.Text);
                updateContractorCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_contractor.Text = "تم التعديل بنجاح";
                Response.Redirect("Contractor_List.aspx");
            }
        }

        protected void btn_Back_To_contractor_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contractor_List.aspx");
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
                    lbl_titel_Edit_contractor.Text = Dt.Rows[200]["EN"].ToString();
                    lbl_En_contractor_Name.Text = Dt.Rows[194]["EN"].ToString();
                    lbl_Ar_contractor_Name.Text = Dt.Rows[195]["EN"].ToString();
                    lbl_contractor_tell.Text = Dt.Rows[196]["EN"].ToString();
                    lbl_Company_Name.Text = Dt.Rows[197]["EN"].ToString();
                    lbl_Company_Address.Text = Dt.Rows[198]["EN"].ToString();
                    btn_Edit_contractor.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_contractor_List.Text = Dt.Rows[199]["EN"].ToString();

                    En_contractor_Name_RegularExpressionValidator.ErrorMessage = "Only English";
                    Ar_contractor_Name_RegularExpressionValidator.ErrorMessage = "Only Arabic";
                    contractor_tell_RegularExpressionValidator.ErrorMessage = "Only Numbers";

                }
                else
                {
                    lbl_titel_Edit_contractor.Text = Dt.Rows[200]["AR"].ToString();
                    lbl_En_contractor_Name.Text = Dt.Rows[194]["AR"].ToString();
                    lbl_Ar_contractor_Name.Text = Dt.Rows[195]["AR"].ToString();
                    lbl_contractor_tell.Text = Dt.Rows[196]["AR"].ToString();
                    lbl_Company_Name.Text = Dt.Rows[197]["AR"].ToString();
                    lbl_Company_Address.Text = Dt.Rows[198]["AR"].ToString();
                    btn_Edit_contractor.Text = Dt.Rows[57]["AR"].ToString();
                    btn_Back_To_contractor_List.Text = Dt.Rows[199]["AR"].ToString();

                    En_contractor_Name_RegularExpressionValidator.ErrorMessage = "أنكليزي فقط";
                    Ar_contractor_Name_RegularExpressionValidator.ErrorMessage = "عربي فقط";
                    contractor_tell_RegularExpressionValidator.ErrorMessage = "أرقام فقط";

                }
            }
            _sqlCon.Close();

        }
    }
}