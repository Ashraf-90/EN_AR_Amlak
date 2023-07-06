using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Company_Rep : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();
                //**********************************************************************************************************************
                string Com_RepId = Request.QueryString["Id"];
                DataTable getCom_RepDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getCom_RepCmd =
                    new MySqlCommand(
                        "SELECT * FROM company_representative WHERE Company_representative_Id = @ID",
                        _sqlCon);
                MySqlDataAdapter getCom_RepDa = new MySqlDataAdapter(getCom_RepCmd);

                getCom_RepCmd.Parameters.AddWithValue("@ID", Com_RepId);
                getCom_RepDa.Fill(getCom_RepDt);
                if (getCom_RepDt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1") { Rep_Name.Text = getCom_RepDt.Rows[0]["Com_rep_Ar_Name"].ToString(); }
                    else { Rep_Name.Text = getCom_RepDt.Rows[0]["Com_rep_En_Name"].ToString(); }
                        
                    txt_Ar_Com_rep_Name.Text = getCom_RepDt.Rows[0]["Com_rep_Ar_Name"].ToString();
                    txt_En_Com_rep_Name.Text = getCom_RepDt.Rows[0]["Com_rep_En_Name"].ToString();
                    txt_Com_Rep_Mobile.Text = getCom_RepDt.Rows[0]["Com_rep_Mobile"].ToString();
                    txt_Com_Rep_Email.Text = getCom_RepDt.Rows[0]["Com_rep_Email"].ToString();
                    txt_Com_Rep_Qid_No.Text = getCom_RepDt.Rows[0]["Com_rep_QID_NO"].ToString();
                    Qid_Path.Text = getCom_RepDt.Rows[0]["Com_rep_QID_Path"].ToString();
                    Qid_File_Name.Text = getCom_RepDt.Rows[0]["Com_rep_QID"].ToString();
                    Nationality_DropDownList.SelectedValue = getCom_RepDt.Rows[0]["nationality_nationality_ID"].ToString();
                    Company_Name_DropDownList.SelectedValue = getCom_RepDt.Rows[0]["tenants_Tenants_ID"].ToString();
                }

                _sqlCon.Close();
            }
        }

        protected void btn_ُEdit_Com_rep_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Com_RepId = Request.QueryString["Id"];

                string updateCom_RepQuary =
                    "UPDATE company_representative SET " +
                    "Com_rep_Ar_Name=@Com_rep_Ar_Name , " +
                    "Com_rep_En_Name=@Com_rep_En_Name , " +
                    "Com_rep_Mobile=@Com_rep_Mobile ," +
                    "Com_rep_Email=@Com_rep_Email , " +
                    "Com_rep_QID_NO=@Com_rep_QID_NO , " +
                    "Com_rep_QID=@Com_rep_QID , " +
                    "Com_rep_QID_Path=@Com_rep_QID_Path , " +
                    "tenants_Tenants_ID=@tenants_Tenants_ID , " +
                    "nationality_nationality_ID =@nationality_nationality_ID " +

                    "WHERE Company_representative_Id=@ID "; 
                _sqlCon.Open();
                MySqlCommand updateCom_RepCmd = new MySqlCommand(updateCom_RepQuary, _sqlCon);
                updateCom_RepCmd.Parameters.AddWithValue("@ID", Com_RepId);
                updateCom_RepCmd.Parameters.AddWithValue("@Com_rep_Ar_Name", lbl_Ar_Com_rep_Name.Text);
                updateCom_RepCmd.Parameters.AddWithValue("@Com_rep_En_Name", txt_En_Com_rep_Name.Text);
                updateCom_RepCmd.Parameters.AddWithValue("@Com_rep_Mobile", txt_Com_Rep_Mobile.Text);
                updateCom_RepCmd.Parameters.AddWithValue("@Com_rep_Email", txt_Com_Rep_Email.Text);
                updateCom_RepCmd.Parameters.AddWithValue("@Com_rep_QID_NO", txt_Com_Rep_Qid_No.Text);
                updateCom_RepCmd.Parameters.AddWithValue("@nationality_nationality_ID", Nationality_DropDownList.SelectedValue);
                updateCom_RepCmd.Parameters.AddWithValue("@tenants_Tenants_ID", Company_Name_DropDownList.SelectedValue);

                if (Com_Rep_Qid_File_FileUpload.HasFile)
                {
                    string fileName = Path.GetFileName(Com_Rep_Qid_File_FileUpload.PostedFile.FileName);
                    Com_Rep_Qid_File_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Master_Panal/Com_reps_QID/") + fileName);
                    updateCom_RepCmd.Parameters.AddWithValue("@Com_rep_QID", fileName);
                    updateCom_RepCmd.Parameters.AddWithValue("@Com_rep_QID_Path", "/English/Master_Panal/Com_reps_QID/" + fileName);
                }
                else
                {
                    string fileName = Path.GetFileName(Com_Rep_Qid_File_FileUpload.PostedFile.FileName);
                    updateCom_RepCmd.Parameters.AddWithValue("@Com_rep_QID", Qid_File_Name.Text);
                    updateCom_RepCmd.Parameters.AddWithValue("@Com_rep_QID_Path", Qid_Path.Text);
                }

                updateCom_RepCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_Com_rep.Text = "تم التعديل بنجاح";
                Response.Redirect("Company_rep_List.aspx");
            }
        }

        protected void btn_Back_To_Com_rep_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Company_rep_List.aspx");
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
                    Helper.LoadDropDownList("SELECT * FROM nationality", _sqlCon, Nationality_DropDownList, "English_nationality", "nationality_ID");
                    Nationality_DropDownList.Items.Insert(0, "...............");

                    Helper.LoadDropDownList("SELECT * FROM tenants where tenant_type_Tenant_Type_Id = 2", _sqlCon, Company_Name_DropDownList, "Tenants_English_Name", "Tenants_ID");
                    Company_Name_DropDownList.Items.Insert(0, "...............");

                    lbl_TTitel_Edit_Com_rep.Text = Dt.Rows[101]["EN"].ToString();
                    lbl_En_Com_rep_Name.Text = Dt.Rows[94]["EN"].ToString();
                    lbl_Ar_Com_rep_Name.Text = Dt.Rows[95]["EN"].ToString();
                    lbl_Nationality.Text = Dt.Rows[96]["EN"].ToString();
                    lbl_Company_Name.Text = Dt.Rows[97]["EN"].ToString();
                    lbl_Com_Rep_Qid_No.Text = Dt.Rows[98]["EN"].ToString();
                    lbl_Com_Rep_Qid_File.Text = Dt.Rows[53]["EN"].ToString();
                    lbl_Com_Rep_Mobile.Text = Dt.Rows[50]["EN"].ToString();
                    lbl_Com_Rep_Email.Text = Dt.Rows[51]["EN"].ToString();
                    btn_ُEdit_Com_rep.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_Com_rep_List.Text = Dt.Rows[99]["EN"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "English Only";
                    RegularExpressionValidator2.ErrorMessage = "Arabic Only";
                    RegularExpressionValidator3.ErrorMessage = "Only Numbers";
                    RegularExpressionValidator4.ErrorMessage = "Invalid Email";
                    RegularExpressionValidator5.ErrorMessage = "Only Numbers";

                    nationality_RequiredFieldValidator.ErrorMessage = "* Required";
                    Company_Name_RequiredFieldValidator.ErrorMessage = "* Required";
                    RequiredFieldValidator2.ErrorMessage = "* Required";

                }
                else
                {
                    Helper.LoadDropDownList("SELECT * FROM nationality", _sqlCon, Nationality_DropDownList, "Arabic_nationality", "nationality_ID");
                    Nationality_DropDownList.Items.Insert(0, "...............");

                    Helper.LoadDropDownList("SELECT * FROM tenants where tenant_type_Tenant_Type_Id = 2", _sqlCon, Company_Name_DropDownList, "Tenants_Arabic_Name", "Tenants_ID");
                    Company_Name_DropDownList.Items.Insert(0, "...............");


                    lbl_TTitel_Edit_Com_rep.Text = Dt.Rows[101]["EN"].ToString();
                    lbl_En_Com_rep_Name.Text = Dt.Rows[94]["AR"].ToString();
                    lbl_Ar_Com_rep_Name.Text = Dt.Rows[95]["AR"].ToString();
                    lbl_Nationality.Text = Dt.Rows[96]["AR"].ToString();
                    lbl_Company_Name.Text = Dt.Rows[97]["AR"].ToString();
                    lbl_Com_Rep_Qid_No.Text = Dt.Rows[98]["AR"].ToString();
                    lbl_Com_Rep_Qid_File.Text = Dt.Rows[53]["AR"].ToString();
                    lbl_Com_Rep_Mobile.Text = Dt.Rows[50]["AR"].ToString();
                    lbl_Com_Rep_Email.Text = Dt.Rows[51]["AR"].ToString();
                    btn_ُEdit_Com_rep.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_Com_rep_List.Text = Dt.Rows[99]["AR"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "إنكليزي فقط";
                    RegularExpressionValidator2.ErrorMessage = "عربي فقط";
                    RegularExpressionValidator3.ErrorMessage = "أرقام فقط";
                    RegularExpressionValidator4.ErrorMessage = "بريد إلكتروني غير صالح";
                    RegularExpressionValidator5.ErrorMessage = "أرقام فقط";

                    nationality_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    Company_Name_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator2.ErrorMessage = "* مطلوب";

                }
            }
            _sqlCon.Close();

        }
    }
}