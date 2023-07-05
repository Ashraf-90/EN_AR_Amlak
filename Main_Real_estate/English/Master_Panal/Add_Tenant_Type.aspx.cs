using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal.Owners_QID
{
    public partial class Tenant_Type : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Tenant_Type_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addTenantTypeQuary =
                    "Insert Into Tenant_Type (Tenant_English_Type,Tenant_Arabic_Type) VALUES(@Tenant_English_Type,@Tenant_Arabic_Type)";
                _sqlCon.Open();
                MySqlCommand addTenantTypeCmd = new MySqlCommand(addTenantTypeQuary, _sqlCon);
                addTenantTypeCmd.Parameters.AddWithValue("@Tenant_English_Type", txt_En_Tenant_Type_Name.Text);
                addTenantTypeCmd.Parameters.AddWithValue("@Tenant_Arabic_Type", txt_Ar_Tenant_Type_Name.Text);
                addTenantTypeCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Tenant_Type.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("Tenant_Type_List.aspx");
            }
        }

        protected void btn_Back_To_Tenant_Type_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Tenant_Type_List.aspx");
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
                    lbl_titel_Add_New_Tenant_Type.Text = Dt.Rows[89]["EN"].ToString();
                    lbl_En_Tenant_Type_Name.Text = Dt.Rows[90]["EN"].ToString();
                    lbl_Ar_Tenant_Type_Name.Text = Dt.Rows[91]["EN"].ToString();
                    btn_Add_Tenant_Type.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Tenant_Type_List.Text = Dt.Rows[92]["EN"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";


                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Add_New_Tenant_Type.Text = Dt.Rows[89]["AR"].ToString();
                    lbl_En_Tenant_Type_Name.Text = Dt.Rows[90]["AR"].ToString();
                    lbl_Ar_Tenant_Type_Name.Text = Dt.Rows[91]["AR"].ToString();
                    btn_Add_Tenant_Type.Text = Dt.Rows[54]["AR"].ToString();
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