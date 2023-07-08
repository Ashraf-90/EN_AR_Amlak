using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Contractor : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_contractor_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addcontractorQuary =
                    "Insert Into contractor (" +
                    "Contractor_Ar_Name," +
                    "Contractor_En_Name," +
                    "Contractor_Company_Name," +
                    "Contractor_Company_Address," +
                    "Contractor_Phon) " +
                    "VALUES(" +
                    "@Contractor_Ar_Name," +
                    "@Contractor_En_Name," +
                    "@Contractor_Company_Name," +
                    "@Contractor_Company_Address," +
                    "@Contractor_Phon) ";
                _sqlCon.Open();
                using (MySqlCommand addcontractorCmd = new MySqlCommand(addcontractorQuary, _sqlCon))
                {
                    addcontractorCmd.Parameters.AddWithValue("@Contractor_Ar_Name", txt_Ar_contractor_Name.Text);
                    addcontractorCmd.Parameters.AddWithValue("@Contractor_En_Name", txt_En_contractor_Name.Text);
                    addcontractorCmd.Parameters.AddWithValue("@Contractor_Company_Name", txt_Company_Name.Text);
                    addcontractorCmd.Parameters.AddWithValue("@Contractor_Company_Address", txt_Company_Address.Text);
                    addcontractorCmd.Parameters.AddWithValue("@Contractor_Phon", txt_contractor_tell.Text);


                    addcontractorCmd.ExecuteNonQuery();
                    _sqlCon.Close();
                    lbl_Success_Add_New_contractor.Text = "تمت الإضافة بنجاح";
                    Response.Redirect("contractor_List.aspx");
                }
            }
        }

        protected void btn_Back_To_contractor_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("contractor_List.aspx");
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
                    lbl_titel_Add_New_contractor.Text = Dt.Rows[193]["EN"].ToString();
                    lbl_En_contractor_Name.Text = Dt.Rows[194]["EN"].ToString();
                    lbl_Ar_contractor_Name.Text = Dt.Rows[195]["EN"].ToString();
                    lbl_contractor_tell.Text = Dt.Rows[196]["EN"].ToString();
                    lbl_Company_Name.Text = Dt.Rows[197]["EN"].ToString();
                    lbl_Company_Address.Text = Dt.Rows[198]["EN"].ToString();
                    btn_Add_contractor.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_contractor_List.Text = Dt.Rows[199]["EN"].ToString();

                    En_contractor_Name_RegularExpressionValidator.ErrorMessage = "Only English";
                    Ar_contractor_Name_RegularExpressionValidator.ErrorMessage = "Only Arabic";
                    contractor_tell_RegularExpressionValidator.ErrorMessage = "Only Numbers";

                }
                else
                {
                    lbl_titel_Add_New_contractor.Text = Dt.Rows[193]["AR"].ToString();
                    lbl_En_contractor_Name.Text = Dt.Rows[194]["AR"].ToString();
                    lbl_Ar_contractor_Name.Text = Dt.Rows[195]["AR"].ToString();
                    lbl_contractor_tell.Text = Dt.Rows[196]["AR"].ToString();
                    lbl_Company_Name.Text = Dt.Rows[197]["AR"].ToString();
                    lbl_Company_Address.Text = Dt.Rows[198]["AR"].ToString();
                    btn_Add_contractor.Text = Dt.Rows[54]["AR"].ToString();
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