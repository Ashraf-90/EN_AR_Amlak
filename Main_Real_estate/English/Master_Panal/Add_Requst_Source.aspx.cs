using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Requst_Source : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Requst_Source_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addRequstSourceQuary =
                    "Insert Into requst_source (Ar_Requst_Source,En_Requst_Source) VALUES(@Ar_Requst_Source,@En_Requst_Source)";
                _sqlCon.Open();
                MySqlCommand addRequstSourceCmd = new MySqlCommand(addRequstSourceQuary, _sqlCon);
                addRequstSourceCmd.Parameters.AddWithValue("@Ar_Requst_Source", txt_Ar_Requst_Source_Name.Text);
                addRequstSourceCmd.Parameters.AddWithValue("@En_Requst_Source", txt_En_Requst_Source_Name.Text);
                addRequstSourceCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Requst_Source_Type.Text = "تمت الإضافة بنجاح";

                _sqlCon.Close();
                Response.Redirect("Requst_Source_List.aspx");
            }
        }

        protected void btn_Back_To_Requst_Source_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Requst_Source_List.aspx");
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
                    lbl_titel_Add_New_Requst_Source_Type.Text = Dt.Rows[137]["EN"].ToString();
                    lbl_Ar_Requst_Source_Name.Text = Dt.Rows[138]["EN"].ToString();
                    lbl_En_Requst_Source_Name.Text = Dt.Rows[139]["EN"].ToString();
                    btn_Add_Requst_Source.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Requst_Source_List.Text = Dt.Rows[140]["EN"].ToString();

                }
                else
                {
                    lbl_titel_Add_New_Requst_Source_Type.Text = Dt.Rows[137]["AR"].ToString();
                    lbl_Ar_Requst_Source_Name.Text = Dt.Rows[138]["AR"].ToString();
                    lbl_En_Requst_Source_Name.Text = Dt.Rows[139]["AR"].ToString();
                    btn_Add_Requst_Source.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Requst_Source_List.Text = Dt.Rows[140]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}