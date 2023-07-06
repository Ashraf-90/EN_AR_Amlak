using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Maintenance_Type : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }
        protected void btn_Add_Maintenance_Type_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //string addMaintenanceTypesQuary =
                //    "Insert Into maintenance_type (Maintenance_English_Type,Maintenance_Arabic_Type) VALUES(@Maintenance_English_Type,@Maintenance_Arabic_Type)";


                string addMaintenanceTypesQuary =
                   "Insert Into maintenance_categoty (Categoty_AR,Categoty_En,Main_Categoty,Active) VALUES(@Categoty_AR,@Categoty_En,@Main_Categoty,@Active)";

                _sqlCon.Open();
                MySqlCommand addMaintenanceTypesCmd = new MySqlCommand(addMaintenanceTypesQuary, _sqlCon);
                addMaintenanceTypesCmd.Parameters.AddWithValue("@Categoty_En", txt_En_Maintenance_Type_Name.Text);
                addMaintenanceTypesCmd.Parameters.AddWithValue("@Categoty_AR", txt_Ar_Maintenance_Type_Name.Text);

                addMaintenanceTypesCmd.Parameters.AddWithValue("@Main_Categoty", 0);
                addMaintenanceTypesCmd.Parameters.AddWithValue("@Active", 1);

                addMaintenanceTypesCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Maintenance_Type.Text = "تمت الإضافة بنجاح";

                _sqlCon.Close();
                Response.Redirect("Maintenance_Type_List.aspx");
            }
        }

        protected void btn_Back_To_Maintenance_Type_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Maintenance_Type_List.aspx");
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
                    lbl_titel_Add_New_Maintenance_Type.Text = Dt.Rows[128]["EN"].ToString();
                    lbl_En_Maintenance_Type_Name.Text = Dt.Rows[129]["EN"].ToString();
                    lbl_Ar_Maintenance_Type_Name.Text = Dt.Rows[130]["EN"].ToString();
                    btn_Add_Maintenance_Type.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Maintenance_Type_List.Text = Dt.Rows[131]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";

                    reqFuild1.ErrorMessage = "* Required";
                    reqFuild2.ErrorMessage = "* Required";
                }
                else
                {
                    lbl_titel_Add_New_Maintenance_Type.Text = Dt.Rows[128]["AR"].ToString();
                    lbl_En_Maintenance_Type_Name.Text = Dt.Rows[129]["AR"].ToString();
                    lbl_Ar_Maintenance_Type_Name.Text = Dt.Rows[130]["AR"].ToString();
                    btn_Add_Maintenance_Type.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Maintenance_Type_List.Text = Dt.Rows[131]["AR"].ToString();

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