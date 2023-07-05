using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Tenant_Type : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();
                string tenantTypeId = Request.QueryString["Id"];
                DataTable getTenantTypeDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getTenantTypeCmd =
                    new MySqlCommand(
                        "SELECT Tenant_Type_id , Tenant_English_Type , Tenant_Arabic_Type  FROM Tenant_Type WHERE Tenant_Type_id = @ID",
                        _sqlCon);
                MySqlDataAdapter getTenantTypeDa = new MySqlDataAdapter(getTenantTypeCmd);

                getTenantTypeCmd.Parameters.AddWithValue("@ID", tenantTypeId);
                getTenantTypeDa.Fill(getTenantTypeDt);
                if (getTenantTypeDt.Rows.Count > 0)
                {
                    txt_En_Tenant_Type_Name.Text = getTenantTypeDt.Rows[0]["Tenant_English_Type"].ToString();
                    txt_Ar_Tenant_Type_Name.Text = getTenantTypeDt.Rows[0]["Tenant_Arabic_Type"].ToString();
                    if (Session["Langues"].ToString() == "1") { lbl_Name_Of_Tenant_Type.Text = getTenantTypeDt.Rows[0]["Tenant_English_Type"].ToString(); }
                    else { lbl_Name_Of_Tenant_Type.Text = getTenantTypeDt.Rows[0]["Tenant_Arabic_Type"].ToString(); }
                        
                }

                _sqlCon.Close();
            }
        }

        protected void btn_Back_To_Tenant_Type_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tenant_Type_List.aspx");
        }

        protected void btn_Edit_Tenant_Type_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string tenantTypeId = Request.QueryString["Id"];
                string updateTenantTypeQuary =
                    "UPDATE Tenant_Type SET Tenant_English_Type=@Tenant_English_Type , Tenant_Arabic_Type=@Tenant_Arabic_Type  WHERE Tenant_Type_id=@ID ";
                _sqlCon.Open();
                MySqlCommand updateTenantTypeCmd = new MySqlCommand(updateTenantTypeQuary, _sqlCon);
                updateTenantTypeCmd.Parameters.AddWithValue("@ID", tenantTypeId);
                updateTenantTypeCmd.Parameters.AddWithValue("@Tenant_English_Type", txt_En_Tenant_Type_Name.Text);
                updateTenantTypeCmd.Parameters.AddWithValue("@Tenant_Arabic_Type", txt_Ar_Tenant_Type_Name.Text);
                updateTenantTypeCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_New_Tenant_Type.Text = "Edit successfully";
                Response.Redirect("Tenant_Type_List.aspx");
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
                    lbl_titel_Edit_New_Tenant_Type.Text = Dt.Rows[93]["EN"].ToString();
                    lbl_En_Tenant_Type_Name.Text = Dt.Rows[90]["EN"].ToString();
                    lbl_Ar_Tenant_Type_Name.Text = Dt.Rows[91]["EN"].ToString();
                    btn_Edit_Tenant_Type.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_Tenant_Type_List.Text = Dt.Rows[92]["EN"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";


                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Edit_New_Tenant_Type.Text = Dt.Rows[93]["AR"].ToString();
                    lbl_En_Tenant_Type_Name.Text = Dt.Rows[90]["AR"].ToString();
                    lbl_Ar_Tenant_Type_Name.Text = Dt.Rows[91]["AR"].ToString();
                    btn_Edit_Tenant_Type.Text = Dt.Rows[57]["AR"].ToString();
                    btn_Back_To_Tenant_Type_List.Text = Dt.Rows[92]["AR"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "إنكليزي فقط";
                    RegularExpressionValidator2.ErrorMessage = "عربي فقط";

                    reqFuild1.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator1.ErrorMessage = "* مطلوب";

                }
            }
            _sqlCon.Close();

        }
    }
}