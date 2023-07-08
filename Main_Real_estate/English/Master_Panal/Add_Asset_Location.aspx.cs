using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Asset_Location : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Asset_location_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addAssetLocationQuary =
                    "Insert Into asset_location (Asset_English_location,Asset_Arabic_location) VALUES(@Asset_English_location,@Asset_Arabic_location)";
                _sqlCon.Open();
                MySqlCommand addAssetLocationCmd = new MySqlCommand(addAssetLocationQuary, _sqlCon);
                addAssetLocationCmd.Parameters.AddWithValue("@Asset_English_location",
                    txt_En_Asset_location_Name.Text);
                addAssetLocationCmd.Parameters.AddWithValue("@Asset_Arabic_location",
                    txt_Ar_Asset_location_Name.Text);
                addAssetLocationCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Asset_location.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("Asset_location_List.aspx");
            }
        }

        protected void btn_Back_To_Asset_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Asset_location_List.aspx");
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
                    lbl_titel_Add_New_Asset_location.Text = Dt.Rows[181]["EN"].ToString();
                    lbl_En_Asset_location_Name.Text = Dt.Rows[182]["EN"].ToString();
                    lbl_Ar_Asset_location_Name.Text = Dt.Rows[183]["EN"].ToString();
                    btn_Add_Asset_location.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Asset_location_List.Text = Dt.Rows[184]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Add_New_Asset_location.Text = Dt.Rows[181]["AR"].ToString();
                    lbl_En_Asset_location_Name.Text = Dt.Rows[182]["AR"].ToString();
                    lbl_Ar_Asset_location_Name.Text = Dt.Rows[183]["AR"].ToString();
                    btn_Add_Asset_location.Text = Dt.Rows[54]["AR"].ToString();
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