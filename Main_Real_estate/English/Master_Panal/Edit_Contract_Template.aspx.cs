using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Contract_Template : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();

                string contractTemplateId = Request.QueryString["Id"];
                DataTable getContractTemplateDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getContractTemplateCmd = new MySqlCommand(
                    "SELECT Contract_Template_id , Contract_English_Template , Contract_Arabic_Template  FROM Contract_Template WHERE Contract_Template_id = @ID",
                    _sqlCon);
                MySqlDataAdapter getContractTemplateDa = new MySqlDataAdapter(getContractTemplateCmd);

                getContractTemplateCmd.Parameters.AddWithValue("@ID", contractTemplateId);
                getContractTemplateDa.Fill(getContractTemplateDt);
                if (getContractTemplateDt.Rows.Count > 0)
                {
                    txt_En_Contract_Template_Name.Text =  getContractTemplateDt.Rows[0]["Contract_English_Template"].ToString();
                    txt_Ar_Contract_Template_Name.Text = getContractTemplateDt.Rows[0]["Contract_Arabic_Template"].ToString();
                    if (Session["Langues"].ToString() == "1") { lbl_Name_Of_Contract_Template.Text = getContractTemplateDt.Rows[0]["Contract_English_Template"].ToString(); }
                    else { lbl_Name_Of_Contract_Template.Text = getContractTemplateDt.Rows[0]["Contract_Arabic_Template"].ToString(); }
                        
                }

                _sqlCon.Close();
            }
        }

        protected void btn_Back_To_Contract_Template_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contract_Template_List.aspx");
        }

        protected void btn_Edit_Contract_Template_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string contractTemplateId = Request.QueryString["Id"];
                string updateContractTemplateQuary =
                    "UPDATE Contract_Template SET Contract_English_Template=@Contract_English_Template , Contract_Arabic_Template=@Contract_Arabic_Template  WHERE Contract_Template_id=@ID ";
                _sqlCon.Open();
                MySqlCommand updateContractTemplateCmd = new MySqlCommand(updateContractTemplateQuary, _sqlCon);
                updateContractTemplateCmd.Parameters.AddWithValue("@ID", contractTemplateId);
                updateContractTemplateCmd.Parameters.AddWithValue("@Contract_English_Template",
                    txt_En_Contract_Template_Name.Text);
                updateContractTemplateCmd.Parameters.AddWithValue("@Contract_Arabic_Template",
                    txt_Ar_Contract_Template_Name.Text);
                updateContractTemplateCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_New_Contract_Template.Text = "Edit successfully";
                Response.Redirect("Contract_Template_List.aspx");
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
                    lbl_titel_Edit_New_Contract_Template.Text = Dt.Rows[122]["EN"].ToString();
                    lbl_En_Contract_Template_Name.Text = Dt.Rows[119]["EN"].ToString();
                    lbl_Ar_Contract_Template_Name.Text = Dt.Rows[120]["EN"].ToString();
                    btn_Edit_Contract_Template.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_Contract_Template_List.Text = Dt.Rows[121]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";

                    reqFuild1.ErrorMessage = "* Required";
                    reqFuild2.ErrorMessage = "* Required";
                }
                else
                {
                    lbl_titel_Edit_New_Contract_Template.Text = Dt.Rows[122]["AR"].ToString();
                    lbl_En_Contract_Template_Name.Text = Dt.Rows[119]["AR"].ToString();
                    lbl_Ar_Contract_Template_Name.Text = Dt.Rows[120]["AR"].ToString();
                    btn_Edit_Contract_Template.Text = Dt.Rows[57]["AR"].ToString();
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