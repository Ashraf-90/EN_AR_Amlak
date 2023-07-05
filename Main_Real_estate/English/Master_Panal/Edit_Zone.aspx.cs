using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Zone : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();


                string zoneId = Request.QueryString["Id"];
                DataTable getZoneDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getZoneCmd =  new MySqlCommand(  "SELECT zone_Id , zone_English_name , zone_arabic_name , zone_number FROM zone WHERE zone_Id = @ID",  _sqlCon);
                MySqlDataAdapter getZoneDa = new MySqlDataAdapter(getZoneCmd);
                getZoneCmd.Parameters.AddWithValue("@ID", zoneId);
                getZoneDa.Fill(getZoneDt);
                if (getZoneDt.Rows.Count > 0)
                {
                    txt_En_Zone_Name.Text = getZoneDt.Rows[0]["zone_English_name"].ToString();
                    txt_Ar_Zone_Name.Text = getZoneDt.Rows[0]["zone_arabic_name"].ToString();
                    txt_Zone_Number.Text = getZoneDt.Rows[0]["zone_number"].ToString();

                    if (Session["Langues"].ToString() == "1") { lbl_titel_Name_Edit_Zone.Text = getZoneDt.Rows[0]["zone_English_name"].ToString(); }
                    else { lbl_titel_Name_Edit_Zone.Text = getZoneDt.Rows[0]["zone_arabic_name"].ToString(); }
                        
                }

                _sqlCon.Close();
            }
        }

        protected void btn_Back_To_Zone_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Zone_List.aspx");
        }

        protected void btn_Add_Zone_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string zoneId = Request.QueryString["Id"];
                string updateZoneQuary =
                    "UPDATE zone SET zone_English_name=@zone_English_name , zone_arabic_name=@zone_arabic_name , zone_number=@zone_number WHERE zone_Id=@ID ";
                _sqlCon.Open();
                MySqlCommand updateZoneCmd = new MySqlCommand(updateZoneQuary, _sqlCon);
                updateZoneCmd.Parameters.AddWithValue("@ID", zoneId);
                updateZoneCmd.Parameters.AddWithValue("@zone_English_name", txt_En_Zone_Name.Text);
                updateZoneCmd.Parameters.AddWithValue("@zone_arabic_name", txt_Ar_Zone_Name.Text);
                updateZoneCmd.Parameters.AddWithValue("@zone_number", txt_Zone_Number.Text);
                updateZoneCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_Zone.Text = "Edit successfully";
                Response.Redirect("Zone_List.aspx");
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
                    lbl_titel_Edit_Zone.Text = Dt.Rows[63]["EN"].ToString();
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
                    lbl_titel_Edit_Zone.Text = Dt.Rows[63]["AR"].ToString();
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