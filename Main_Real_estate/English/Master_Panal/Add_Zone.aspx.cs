using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal.Owners_QID
{
    public partial class Add_Zone : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Back_To_Zone_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Zone_List.aspx");
        }

        protected void btn_Add_Zone_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addZoneQuary =
                    "Insert Into zone (zone_English_name,zone_arabic_name,zone_number) VALUES(@zone_English_name,@zone_arabic_name,@zone_number)";
                _sqlCon.Open();
                MySqlCommand addZoneCmd = new MySqlCommand(addZoneQuary, _sqlCon);
                addZoneCmd.Parameters.AddWithValue("@zone_English_name", txt_En_Zone_Name.Text);
                addZoneCmd.Parameters.AddWithValue("@zone_arabic_name", txt_Ar_Zone_Name.Text);
                addZoneCmd.Parameters.AddWithValue("@zone_number", Convert.ToInt32(txt_Zone_Number.Text));
                addZoneCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Zone.Text = "Added successfully";
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
                    lbl_titel_Add_New_Zone.Text = Dt.Rows[58]["EN"].ToString();
                    lbl_En_Zone_Name.Text = Dt.Rows[59]["EN"].ToString();
                    lbl_Ar_Zone_Name.Text = Dt.Rows[60]["EN"].ToString();
                    lbl_Zone_Number.Text = Dt.Rows[61]["EN"].ToString();
                    btn_Add_Zone.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Zone_List.Text = Dt.Rows[62]["EN"].ToString();


                    En_Zone_Name_Reg_Exp_Vali.ErrorMessage = "Only English";
                    Ar_Zone_Name_Reg_Exp_Vali.ErrorMessage = "Only Arabic";
                    Zone_Number_Reg_Exp_Vali.ErrorMessage = "Only Numbers";


                    En_Zone_Name_reqFuild.ErrorMessage = "* Required";
                    Ar_Zone_Name_reqFuild.ErrorMessage = "* Required";
                    Zone_Number_reqFuild.ErrorMessage = "* Required";
                }
                else
                {
                    lbl_titel_Add_New_Zone.Text = Dt.Rows[58]["AR"].ToString();
                    lbl_En_Zone_Name.Text = Dt.Rows[59]["AR"].ToString();
                    lbl_Ar_Zone_Name.Text = Dt.Rows[60]["AR"].ToString();
                    lbl_Zone_Number.Text = Dt.Rows[61]["AR"].ToString();
                    btn_Add_Zone.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Zone_List.Text = Dt.Rows[62]["AR"].ToString();


                    En_Zone_Name_Reg_Exp_Vali.ErrorMessage = "إنكليزي فقط";
                    Ar_Zone_Name_Reg_Exp_Vali.ErrorMessage = "عربي فقط";
                    Zone_Number_Reg_Exp_Vali.ErrorMessage = "أرقام فقط";


                    En_Zone_Name_reqFuild.ErrorMessage = "* مطلوب";
                    Ar_Zone_Name_reqFuild.ErrorMessage = "* مطلوب";
                    Zone_Number_reqFuild.ErrorMessage = "* مطلوب";
                }
            }
            _sqlCon.Close();

        }

    }
}