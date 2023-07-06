using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Contract_Type : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();


                string contractTypeId = Request.QueryString["Id"];
                DataTable getContractTypeDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getContractTypeCmd =
                    new MySqlCommand(
                        "SELECT Contract_Type_id , Contract_English_Type , Contract_Arabic_Type  FROM Contract_Type WHERE Contract_Type_id = @ID",
                        _sqlCon);
                MySqlDataAdapter getContractTypeDa = new MySqlDataAdapter(getContractTypeCmd);

                getContractTypeCmd.Parameters.AddWithValue("@ID", contractTypeId);
                getContractTypeDa.Fill(getContractTypeDt);
                if (getContractTypeDt.Rows.Count > 0)
                {
                    txt_En_Contract_Type_Name.Text = getContractTypeDt.Rows[0]["Contract_English_Type"].ToString();
                    txt_Ar_Contract_Type_Name.Text = getContractTypeDt.Rows[0]["Contract_Arabic_Type"].ToString();
                    if (Session["Langues"].ToString() == "1") { lbl_Name_Of_Contract_Type.Text = getContractTypeDt.Rows[0]["Contract_English_Type"].ToString(); }
                    else { lbl_Name_Of_Contract_Type.Text = getContractTypeDt.Rows[0]["Contract_Arabic_Type"].ToString(); }
                        
                }

                _sqlCon.Close();
            }
        }

        protected void btn_Back_To_Contract_Type_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contract_Type_List.aspx");
        }

        protected void btn_Edit_Contract_Type_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string contractTypeId = Request.QueryString["Id"];
                string updateContractTypeQuary =
                    "UPDATE Contract_Type SET Contract_English_Type=@Contract_English_Type , Contract_Arabic_Type=@Contract_Arabic_Type  WHERE Contract_Type_id=@ID ";
                _sqlCon.Open();
                MySqlCommand updateContractTypeCmd = new MySqlCommand(updateContractTypeQuary, _sqlCon);
                updateContractTypeCmd.Parameters.AddWithValue("@ID", contractTypeId);
                updateContractTypeCmd.Parameters.AddWithValue("@Contract_English_Type",
                    txt_En_Contract_Type_Name.Text);
                updateContractTypeCmd.Parameters.AddWithValue("@Contract_Arabic_Type",
                    txt_Ar_Contract_Type_Name.Text);
                updateContractTypeCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_New_Contract_Type.Text = "Edit successfully";
                Response.Redirect("Contract_Type_List.aspx");
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
                    lbl_titel_Edit_New_Contract_Type.Text = Dt.Rows[117]["EN"].ToString();
                    lbl_En_Contract_Type_Name.Text = Dt.Rows[114]["EN"].ToString();
                    lbl_Ar_Contract_Type_Name.Text = Dt.Rows[115]["EN"].ToString();
                    btn_Edit_Contract_Type.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_Contract_Type_List.Text = Dt.Rows[116]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";

                    reqFuild1.ErrorMessage = "* Required";
                    reqFuild2.ErrorMessage = "* Required";
                }
                else
                {
                    lbl_titel_Edit_New_Contract_Type.Text = Dt.Rows[117]["AR"].ToString();
                    lbl_En_Contract_Type_Name.Text = Dt.Rows[114]["AR"].ToString();
                    lbl_Ar_Contract_Type_Name.Text = Dt.Rows[115]["AR"].ToString();
                    btn_Edit_Contract_Type.Text = Dt.Rows[54]["AR"].ToString();
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