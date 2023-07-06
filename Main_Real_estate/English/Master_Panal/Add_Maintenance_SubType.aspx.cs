using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Maintenance_SubType : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                language();

                
            }
        }
        protected void btn_Add_Maintenance_Subtypes_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addMaintenanceSubTypesQuary =
                    "Insert Into maintenance_categoty (Categoty_AR , Categoty_En , Main_Categoty,Active) " +
                    "VALUES(@Categoty_AR, @Categoty_En , @Main_Categoty,@Active)";
                _sqlCon.Open();
                MySqlCommand addMaintenanceSubTypesCmd = new MySqlCommand(addMaintenanceSubTypesQuary, _sqlCon);
                addMaintenanceSubTypesCmd.Parameters.AddWithValue("@Categoty_En", txt_En_Maintenance_Subtypes_Name.Text);
                addMaintenanceSubTypesCmd.Parameters.AddWithValue("@Categoty_AR", txt_Ar_Maintenance_Subtypes_Name.Text);
                addMaintenanceSubTypesCmd.Parameters.AddWithValue("@Main_Categoty", Maintenance_Types_DropDownList.SelectedValue);
                addMaintenanceSubTypesCmd.Parameters.AddWithValue("@Active", 1);
                addMaintenanceSubTypesCmd.ExecuteNonQuery();
                lbl_Success_Add_New_Maintenance_Subtypes.Text = "تمت الإضافة بنجاح";
                _sqlCon.Close();
                Response.Redirect("Maintenance_SubType_List.aspx");
            }
        }
        protected void btn_Back_To_Maintenance_Subtypes_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Maintenance_SubType_List.aspx");
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
                    Helper.LoadDropDownList("SELECT * FROM maintenance_categoty where Main_Categoty = 0", _sqlCon, Maintenance_Types_DropDownList,
                    "Categoty_EN", "Categoty_Id");
                    Maintenance_Types_DropDownList.Items.Insert(0, "...............");


                    lbl_titel_Add_New_Maintenance_Subtypes.Text = Dt.Rows[134]["EN"].ToString();
                    lbl_Maintenance_Types.Text = Dt.Rows[133]["EN"].ToString();
                    lbl_En_Maintenance_Subtypes_Name.Text = Dt.Rows[129]["EN"].ToString();
                    lbl_Ar_Maintenance_Subtypes_Name.Text = Dt.Rows[130]["EN"].ToString();
                    btn_Add_Maintenance_Subtypes.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Maintenance_Subtypes_List.Text = Dt.Rows[135]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";

                    reqFuild1.ErrorMessage = "* Required";
                    reqFuild2.ErrorMessage = "* Required";
                }
                else
                {
                    Helper.LoadDropDownList("SELECT * FROM maintenance_categoty where Main_Categoty = 0", _sqlCon, Maintenance_Types_DropDownList,
                    "Categoty_AR", "Categoty_Id");
                    Maintenance_Types_DropDownList.Items.Insert(0, "...............");


                    lbl_titel_Add_New_Maintenance_Subtypes.Text = Dt.Rows[134]["AR"].ToString();
                    lbl_Maintenance_Types.Text = Dt.Rows[133]["AR"].ToString();
                    lbl_En_Maintenance_Subtypes_Name.Text = Dt.Rows[129]["AR"].ToString();
                    lbl_Ar_Maintenance_Subtypes_Name.Text = Dt.Rows[130]["AR"].ToString();
                    btn_Add_Maintenance_Subtypes.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Maintenance_Subtypes_List.Text = Dt.Rows[135]["AR"].ToString();

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