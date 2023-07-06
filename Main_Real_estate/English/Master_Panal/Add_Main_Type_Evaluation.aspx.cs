using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Security.Policy;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Main_Type_Evaluation : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();
                _sqlCon.Open();
                string getMain_Type_Evaluation_Wghit_Qury = "select (Select Sum(Main_Weight) from main_type_evaluation)  Sum_Main_Weight";
                DataTable getMain_Type_Evaluation_WghitDt = new DataTable();
                MySqlCommand getMain_Type_Evaluation_WghitCmd = new MySqlCommand(getMain_Type_Evaluation_Wghit_Qury, _sqlCon);
                MySqlDataAdapter getMain_Type_Evaluation_WghitDa = new MySqlDataAdapter(getMain_Type_Evaluation_WghitCmd);
                getMain_Type_Evaluation_WghitDa.Fill(getMain_Type_Evaluation_WghitDt);
                if (getMain_Type_Evaluation_WghitDt.Rows.Count > 0)
                {
                    string Wghit = (100 - (Convert.ToDouble(getMain_Type_Evaluation_WghitDt.Rows[0]["Sum_Main_Weight"].ToString()))).ToString();
                    txt_Main_Type_Evaluation_Number.Attributes.Add("max", Wghit);
                }
                _sqlCon.Close();
            }
                
        }

        protected void btn_Add_Main_Type_Evaluation_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addMain_Type_EvaluationQuary =
                    "Insert Into main_type_evaluation (" +
                    "Ar_Name , " +
                    "EN_Name , " +
                    "Main_Weight) " +
                    "VALUES( " +
                    "@Ar_Name , " +
                    "@EN_Name , " +
                    "@Main_Weight)";
                _sqlCon.Open();
                MySqlCommand addMain_Type_EvaluationCmd = new MySqlCommand(addMain_Type_EvaluationQuary, _sqlCon);
                addMain_Type_EvaluationCmd.Parameters.AddWithValue("@EN_Name", txt_En_Main_Type_Evaluation_Name.Text);
                addMain_Type_EvaluationCmd.Parameters.AddWithValue("@Ar_Name", txt_Ar_Main_Type_Evaluation_Name.Text);
                addMain_Type_EvaluationCmd.Parameters.AddWithValue("@Main_Weight", txt_Main_Type_Evaluation_Number.Text);
                addMain_Type_EvaluationCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Main_Type_Evaluation.Text = "تمت الإضافة بنجاح";
            }
        }

        protected void btn_Back_To_Main_Type_Evaluation_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Main_Type_Evaluation_List.aspx");
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
                    lbl_titel_Add_New_Main_Type_Evaluation.Text = Dt.Rows[102]["EN"].ToString();
                    lbl_En_Main_Type_Evaluation_Name.Text = Dt.Rows[103]["EN"].ToString();
                    lbl_Ar_Main_Type_Evaluation_Name.Text = Dt.Rows[104]["EN"].ToString();
                    lbl_Main_Type_Evaluation_Number.Text = Dt.Rows[105]["EN"].ToString();
                    btn_Add_Main_Type_Evaluation.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Main_Type_Evaluation_List.Text = Dt.Rows[106]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";
                    RegularExpressionValidator3.ErrorMessage = "Olny Numbers";

                    reqFuild1.ErrorMessage = "* Required";
                    reqFuild2.ErrorMessage = "* Required";
                    reqFuild3.ErrorMessage = "* Required";

                }
                else
                {
                    lbl_titel_Add_New_Main_Type_Evaluation.Text = Dt.Rows[102]["AR"].ToString();
                    lbl_En_Main_Type_Evaluation_Name.Text = Dt.Rows[103]["AR"].ToString();
                    lbl_Ar_Main_Type_Evaluation_Name.Text = Dt.Rows[104]["AR"].ToString();
                    lbl_Main_Type_Evaluation_Number.Text = Dt.Rows[105]["AR"].ToString();
                    btn_Add_Main_Type_Evaluation.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Main_Type_Evaluation_List.Text = Dt.Rows[106]["AR"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "إنكليزي فقط";
                    RegularExpressionValidator2.ErrorMessage = "عربي فقط";
                    RegularExpressionValidator3.ErrorMessage = "أرقام فقط";

                    reqFuild1.ErrorMessage = "* مطلوب";
                    reqFuild2.ErrorMessage = "* مطلوب";
                    reqFuild3.ErrorMessage = "* مطلوب";

                }
            }
            _sqlCon.Close();

        }
    }
}