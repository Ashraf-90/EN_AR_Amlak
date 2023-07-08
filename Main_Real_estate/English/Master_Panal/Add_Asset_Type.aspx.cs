using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Asset_Type : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Back_To_Asset_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Asset_Type_List.aspx");
        }

        protected void btn_Add_Asset_Type_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addAssetTypeQuary =
                    "Insert Into asset_type (Asset_English_Type,Asset_Arabic_Type) VALUES(@Asset_English_Type,@Asset_Arabic_Type)";
                _sqlCon.Open();
                MySqlCommand addAssetTypeCmd = new MySqlCommand(addAssetTypeQuary, _sqlCon);
                addAssetTypeCmd.Parameters.AddWithValue("@Asset_English_Type", txt_En_Asset_Type_Name.Text);
                addAssetTypeCmd.Parameters.AddWithValue("@Asset_Arabic_Type", txt_Ar_Asset_Type_Name.Text);
                addAssetTypeCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Asset_Type.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("Asset_Type_List.aspx");
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
                    lbl_titel_Add_New_Asset_Type.Text = Dt.Rows[171]["EN"].ToString();
                    lbl_En_Asset_Type_Name.Text = Dt.Rows[172]["EN"].ToString();
                    lbl_Ar_Asset_Type_Name.Text = Dt.Rows[173]["EN"].ToString();
                    btn_Add_Asset_Type.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Asset_Type_List.Text = Dt.Rows[174]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Add_New_Asset_Type.Text = Dt.Rows[171]["AR"].ToString();
                    lbl_En_Asset_Type_Name.Text = Dt.Rows[172]["AR"].ToString();
                    lbl_Ar_Asset_Type_Name.Text = Dt.Rows[173]["AR"].ToString();
                    btn_Add_Asset_Type.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Asset_Type_List.Text = Dt.Rows[174]["AR"].ToString();

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