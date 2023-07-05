using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Unit_Details : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Unit_Detail_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addUnitDetailsQuary =
                    "Insert Into Unit_Detail (Unit_English_Detail,Unit_Arabic_Detail) VALUES(@Unit_English_Detail,@Unit_Arabic_Detail)";
                _sqlCon.Open();
                MySqlCommand addUnitDetailsCmd = new MySqlCommand(addUnitDetailsQuary, _sqlCon);
                addUnitDetailsCmd.Parameters.AddWithValue("@Unit_English_Detail", txt_En_Unit_Detail_Name.Text);
                addUnitDetailsCmd.Parameters.AddWithValue("@Unit_Arabic_Detail", txt_Ar_Unit_Detail_Name.Text);
                addUnitDetailsCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Unit_Detail.Text = "Added successfully";

                _sqlCon.Close();
                Response.Redirect("Unit_Details_List.aspx");
            }
        }

        protected void btn_Back_To_Unit_Detail_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Unit_Details_List.aspx");
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
                    lbl_titel_Add_New_Unit_Detail.Text = Dt.Rows[79]["EN"].ToString();
                    lbl_En_Unit_Detail_Name.Text = Dt.Rows[80]["EN"].ToString();
                    lbl_Ar_Unit_Detail_Name.Text = Dt.Rows[81]["EN"].ToString();
                    btn_Add_Unit_Detail.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Unit_Detail_List.Text = Dt.Rows[82]["EN"].ToString();

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Add_New_Unit_Detail.Text = Dt.Rows[79]["AR"].ToString();
                    lbl_En_Unit_Detail_Name.Text = Dt.Rows[80]["AR"].ToString();
                    lbl_Ar_Unit_Detail_Name.Text = Dt.Rows[81]["AR"].ToString();
                    btn_Add_Unit_Detail.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Unit_Detail_List.Text = Dt.Rows[82]["AR"].ToString();

                    reqFuild1.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator1.ErrorMessage = "* مطلوب";

                }
            }
            _sqlCon.Close();

        }
    }
}