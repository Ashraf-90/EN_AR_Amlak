using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Asset_Location : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();
                string assetLocationId = Request.QueryString["Id"];
                DataTable getAssetLocationDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getAssetLocationCmd =
                    new MySqlCommand(
                        "SELECT Asset_location_id , Asset_English_location , Asset_Arabic_location  FROM asset_location WHERE Asset_Location_Id = @ID",
                        _sqlCon);
                MySqlDataAdapter getAssetLocationDa = new MySqlDataAdapter(getAssetLocationCmd);

                getAssetLocationCmd.Parameters.AddWithValue("@ID", assetLocationId);
                getAssetLocationDa.Fill(getAssetLocationDt);
                if (getAssetLocationDt.Rows.Count > 0)
                {
                    txt_En_Asset_location_Name.Text =
                        getAssetLocationDt.Rows[0]["Asset_English_location"].ToString();
                    txt_Ar_Asset_location_Name.Text = getAssetLocationDt.Rows[0]["Asset_Arabic_location"].ToString();
                    if (Session["Langues"].ToString() == "1") { lbl_Name_Of_Asset_location.Text = getAssetLocationDt.Rows[0]["Asset_English_location"].ToString(); }
                    else { lbl_Name_Of_Asset_location.Text = getAssetLocationDt.Rows[0]["Asset_Arabic_location"].ToString(); }    
                }

                _sqlCon.Close();
            }
        }

        protected void btn_Back_To_Asset_location_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Asset_location_List.aspx");
        }

        protected void btn_Edit_Asset_location_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string assetLocationId = Request.QueryString["Id"];
                string updateAssetTupeQuary =
                    "UPDATE asset_location SET Asset_English_location=@Asset_English_location , Asset_Arabic_location=@Asset_Arabic_location  WHERE Asset_location_id=@ID ";
                _sqlCon.Open();
                MySqlCommand updateAssetLocationCmd = new MySqlCommand(updateAssetTupeQuary, _sqlCon);
                updateAssetLocationCmd.Parameters.AddWithValue("@ID", assetLocationId);
                updateAssetLocationCmd.Parameters.AddWithValue("@Asset_English_location",
                    txt_En_Asset_location_Name.Text);
                updateAssetLocationCmd.Parameters.AddWithValue("@Asset_Arabic_location",
                    txt_Ar_Asset_location_Name.Text);
                updateAssetLocationCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_New_Asset_location.Text = "Edit successfully";
                Response.Redirect("Asset_location_List.aspx");
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
                    lbl_titel_Edit_New_Asset_location.Text = Dt.Rows[185]["EN"].ToString();
                    lbl_En_Asset_location_Name.Text = Dt.Rows[182]["EN"].ToString();
                    lbl_Ar_Asset_location_Name.Text = Dt.Rows[183]["EN"].ToString();
                    btn_Edit_Asset_location.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_Asset_location_List.Text = Dt.Rows[184]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Edit_New_Asset_location.Text = Dt.Rows[185]["AR"].ToString();
                    lbl_En_Asset_location_Name.Text = Dt.Rows[182]["AR"].ToString();
                    lbl_Ar_Asset_location_Name.Text = Dt.Rows[183]["AR"].ToString();
                    btn_Edit_Asset_location.Text = Dt.Rows[57]["AR"].ToString();
                    btn_Back_To_Asset_location_List.Text = Dt.Rows[184]["AR"].ToString();

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