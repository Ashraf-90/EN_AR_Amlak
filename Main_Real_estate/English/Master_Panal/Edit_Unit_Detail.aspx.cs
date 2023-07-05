using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Unit_Detail : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();
                string unitDetailId = Request.QueryString["Id"];
                DataTable getUnitDetailIdDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getUnitDetailIdCmd =
                    new MySqlCommand(
                        "SELECT Unit_Detail_id , Unit_English_Detail , Unit_Arabic_Detail  FROM Unit_Detail WHERE Unit_Detail_id = @ID",
                        _sqlCon);
                MySqlDataAdapter getUnitDetailIdDa = new MySqlDataAdapter(getUnitDetailIdCmd);

                getUnitDetailIdCmd.Parameters.AddWithValue("@ID", unitDetailId);
                getUnitDetailIdDa.Fill(getUnitDetailIdDt);
                if (getUnitDetailIdDt.Rows.Count > 0)
                {
                    txt_En_Unit_Detail_Name.Text = getUnitDetailIdDt.Rows[0]["Unit_English_Detail"].ToString();
                    txt_Ar_Unit_Detail_Name.Text = getUnitDetailIdDt.Rows[0]["Unit_Arabic_Detail"].ToString();
                    if (Session["Langues"].ToString() == "1") { lbl_Name_Of_Unit_Detail.Text = getUnitDetailIdDt.Rows[0]["Unit_English_Detail"].ToString(); }
                    else { lbl_Name_Of_Unit_Detail.Text = getUnitDetailIdDt.Rows[0]["Unit_Arabic_Detail"].ToString(); }    
                        
                }

                _sqlCon.Close();
            }
        }

        protected void btn_Back_To_Unit_Detail_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Unit_Details_List.aspx");
        }

        protected void btn_Edit_Unit_Detail_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string unitDetailId = Request.QueryString["Id"];
                string updateUnitDetailQuary =
                    "UPDATE Unit_Detail SET Unit_English_Detail=@Unit_English_Detail , Unit_Arabic_Detail=@Unit_Arabic_Detail  WHERE Unit_Detail_id=@ID ";
                _sqlCon.Open();
                MySqlCommand updateUnitDetailCmd = new MySqlCommand(updateUnitDetailQuary, _sqlCon);
                updateUnitDetailCmd.Parameters.AddWithValue("@ID", unitDetailId);
                updateUnitDetailCmd.Parameters.AddWithValue("@Unit_English_Detail", txt_En_Unit_Detail_Name.Text);
                updateUnitDetailCmd.Parameters.AddWithValue("@Unit_Arabic_Detail", txt_Ar_Unit_Detail_Name.Text);
                updateUnitDetailCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_New_Unit_Detail.Text = "Edit successfully";
                Response.Redirect("Unit_Details_List.aspx");
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
                    lbl_titel_Edit_New_Unit_Detail.Text = Dt.Rows[83]["EN"].ToString();
                    lbl_En_Unit_Detail_Name.Text = Dt.Rows[80]["EN"].ToString();
                    lbl_Ar_Unit_Detail_Name.Text = Dt.Rows[81]["EN"].ToString();
                    btn_Edit_Unit_Detail.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_Unit_Detail_List.Text = Dt.Rows[82]["EN"].ToString();


                }
                else
                {
                    lbl_titel_Edit_New_Unit_Detail.Text = Dt.Rows[83]["AR"].ToString();
                    lbl_En_Unit_Detail_Name.Text = Dt.Rows[80]["AR"].ToString();
                    lbl_Ar_Unit_Detail_Name.Text = Dt.Rows[81]["AR"].ToString();
                    btn_Edit_Unit_Detail.Text = Dt.Rows[57]["AR"].ToString();
                    btn_Back_To_Unit_Detail_List.Text = Dt.Rows[82]["AR"].ToString();


                }
            }
            _sqlCon.Close();

        }
    }
}