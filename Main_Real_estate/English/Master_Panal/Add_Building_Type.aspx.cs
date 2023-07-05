using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Building_Type : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Building_Type_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addBuildingTypeQuary =
                    "Insert Into Building_Type (Building_English_Type,Building_Arabic_Type) VALUES(@Building_English_Type,@Building_Arabic_Type)";
                _sqlCon.Open();
                MySqlCommand addBuildingTypeCmd = new MySqlCommand(addBuildingTypeQuary, _sqlCon);
                addBuildingTypeCmd.Parameters.AddWithValue("@Building_English_Type", txt_En_Building_Type_Name.Text);
                addBuildingTypeCmd.Parameters.AddWithValue("@Building_Arabic_Type", txt_Ar_Building_Type_Name.Text);
                addBuildingTypeCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Building_Type.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("Building_Type_List.aspx");
            }
        }

        protected void btn_Back_To_Ownership_statu_List_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Building_Type_List.aspx");
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
                    lbl_titel_Add_New_Building_Type.Text = Dt.Rows[64]["EN"].ToString();
                    lbl_En_Building_Type_Name.Text = Dt.Rows[65]["EN"].ToString();
                    lbl_Ar_Building_Type_Name.Text = Dt.Rows[66]["EN"].ToString();
                    btn_Add_Building_Type.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Building_Type_List.Text = Dt.Rows[67]["EN"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";
                }
                else
                {
                    lbl_titel_Add_New_Building_Type.Text = Dt.Rows[64]["AR"].ToString();
                    lbl_En_Building_Type_Name.Text = Dt.Rows[65]["AR"].ToString();
                    lbl_Ar_Building_Type_Name.Text = Dt.Rows[66]["AR"].ToString();
                    btn_Add_Building_Type.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Building_Type_List.Text = Dt.Rows[67]["AR"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "فقط إنكليزي";
                    RegularExpressionValidator2.ErrorMessage = "فقط عربي";

                    reqFuild1.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator1.ErrorMessage = "* مطلوب";

                }
            }
            _sqlCon.Close();

        }
    }
}