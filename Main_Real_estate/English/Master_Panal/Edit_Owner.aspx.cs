using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Owner : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();
                string ownerId = Request.QueryString["Id"];
                DataTable getOwnerDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getOwnerCmd =
                    new MySqlCommand(
                        "SELECT * FROM owner WHERE Owner_Id = @ID",
                        _sqlCon);
                MySqlDataAdapter getOwnerDa = new MySqlDataAdapter(getOwnerCmd);

                getOwnerCmd.Parameters.AddWithValue("@ID", ownerId);
                getOwnerDa.Fill(getOwnerDt);
                if (getOwnerDt.Rows.Count > 0)
                {
                    txt_En_Owner_Name.Text = getOwnerDt.Rows[0]["Owner_English_name"].ToString();
                    txt_Ar_Owner_Name.Text = getOwnerDt.Rows[0]["Owner_Arabic_name"].ToString();
                    txt_Owner_tell.Text = getOwnerDt.Rows[0]["Owner_Tell"].ToString();
                    txt_Owner_Mobile.Text = getOwnerDt.Rows[0]["Owner_Mobile"].ToString();
                    txt_Owner_Email.Text = getOwnerDt.Rows[0]["Owner_Email"].ToString();
                    txt_Owner_Website.Text = getOwnerDt.Rows[0]["Owner_Website"].ToString();
                    txt_Owner_Note.Text = getOwnerDt.Rows[0]["Owner_Notes"].ToString();

                    txt_Owner_Salary.Text = getOwnerDt.Rows[0]["Salary"].ToString();

                    lbl_titel_Name_Edit_Owner.Text = getOwnerDt.Rows[0]["Owner_Arabic_name"].ToString();
                    QID_NAME.Text = getOwnerDt.Rows[0]["Owner_QID"].ToString();
                    lbl_path.Text = getOwnerDt.Rows[0]["path"].ToString();
                    Image1.ImageUrl = lbl_path.Text;
                }

                _sqlCon.Close();
            }
        }

        protected void btn_Update_Owner_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string ownerId = Request.QueryString["Id"];

                string updateOwnerQuary =
                    "UPDATE owner SET " +
                    "Owner_QID=@Owner_QID , " +
                    "path=@path , " +
                    "Owner_English_name=@Owner_English_name, " +
                    "Owner_Arabic_name=@Owner_Arabic_name ," +
                    " Owner_Tell=@Owner_Tell , " +
                    "Owner_Mobile=@Owner_Mobile , " +
                    "Owner_Email=@Owner_Email , " +
                    "Owner_Website=@Owner_Website ," +
                    " Owner_Notes=@Owner_Notes , " +
                     " Salary=@Salary " +
                    " WHERE Owner_Id=@ID ";

                _sqlCon.Open();
                MySqlCommand updateOwnerCmd = new MySqlCommand(updateOwnerQuary, _sqlCon);
                updateOwnerCmd.Parameters.AddWithValue("@ID", ownerId);
                updateOwnerCmd.Parameters.AddWithValue("@Owner_English_name", txt_En_Owner_Name.Text);
                updateOwnerCmd.Parameters.AddWithValue("@Owner_Arabic_name", txt_Ar_Owner_Name.Text);
                updateOwnerCmd.Parameters.AddWithValue("@Owner_Tell", txt_Owner_tell.Text);
                updateOwnerCmd.Parameters.AddWithValue("@Owner_Mobile", txt_Owner_Mobile.Text);
                updateOwnerCmd.Parameters.AddWithValue("@Owner_Email", txt_Owner_Email.Text);
                updateOwnerCmd.Parameters.AddWithValue("@Owner_Website", txt_Owner_Website.Text);
                updateOwnerCmd.Parameters.AddWithValue("@Owner_Notes", txt_Owner_Note.Text);
                updateOwnerCmd.Parameters.AddWithValue("@Salary", txt_Owner_Salary.Text);

                if (FileUpload1.HasFile)
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("/English/Master_Panal/Owners_QID/") + fileName);
                    updateOwnerCmd.Parameters.AddWithValue("@Owner_QID", fileName);
                    updateOwnerCmd.Parameters.AddWithValue("@path", "/English/Master_Panal/Owners_QID/" + fileName);
                }
                else
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    updateOwnerCmd.Parameters.AddWithValue("@Owner_QID", QID_NAME.Text);
                    updateOwnerCmd.Parameters.AddWithValue("@path", lbl_path.Text);
                }

                updateOwnerCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_Owner.Text = "Edit successfully";
                Response.Redirect("Owner_List.aspx");
            }
        }

        protected void btn_Back_To_Owner_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Owner_List.aspx");
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
                    lbl_titel_Edit_Owner.Text = Dt.Rows[56]["EN"].ToString();
                    lbl_En_Owner_Name.Text = Dt.Rows[45]["EN"].ToString();
                    lbl_Ar_Owner_Name.Text = Dt.Rows[46]["EN"].ToString();
                    lbl_Owner_tell.Text = Dt.Rows[47]["EN"].ToString();
                    lbl_Owner_Note.Text = Dt.Rows[48]["EN"].ToString();
                    lbl_Owner_Salary.Text = Dt.Rows[49]["EN"].ToString();
                    lbl_Owner_Mobile.Text = Dt.Rows[50]["EN"].ToString();
                    lbl_Owner_Email.Text = Dt.Rows[51]["EN"].ToString();
                    lbl_Owner_Website.Text = Dt.Rows[52]["EN"].ToString();
                    lbl_Owner_QID.Text = Dt.Rows[53]["EN"].ToString();
                    btn_Update_Owner.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_Owner_List.Text = Dt.Rows[55]["EN"].ToString();


                    En_Owner_Name_Reg_Exp_Val.ErrorMessage = "Only English";
                    Ar_Owner_Name_Reg_Exp_Val.ErrorMessage = "Only Arabic";
                    Owner_tell_Reg_Exp_Val.ErrorMessage = "Only Numbers";
                    Salary_Reg_Exp_Val.ErrorMessage = "Only Numbers";
                    Mobile_Reg_Exp_Val.ErrorMessage = "Only Numbers";
                    Email_Reg_Exp_Val.ErrorMessage = "Invalid Email";


                }
                else
                {
                    lbl_titel_Edit_Owner.Text = Dt.Rows[56]["AR"].ToString();
                    lbl_En_Owner_Name.Text = Dt.Rows[45]["AR"].ToString();
                    lbl_Ar_Owner_Name.Text = Dt.Rows[46]["AR"].ToString();
                    lbl_Owner_tell.Text = Dt.Rows[47]["AR"].ToString();
                    lbl_Owner_Note.Text = Dt.Rows[48]["AR"].ToString();
                    lbl_Owner_Salary.Text = Dt.Rows[49]["AR"].ToString();
                    lbl_Owner_Mobile.Text = Dt.Rows[50]["AR"].ToString();
                    lbl_Owner_Email.Text = Dt.Rows[51]["AR"].ToString();
                    lbl_Owner_Website.Text = Dt.Rows[52]["AR"].ToString();
                    lbl_Owner_QID.Text = Dt.Rows[53]["AR"].ToString();
                    btn_Update_Owner.Text = Dt.Rows[57]["AR"].ToString();
                    btn_Back_To_Owner_List.Text = Dt.Rows[55]["AR"].ToString();


                    En_Owner_Name_Reg_Exp_Val.ErrorMessage = "إنكليزي فقط";
                    Ar_Owner_Name_Reg_Exp_Val.ErrorMessage = "عربي فقط";
                    Owner_tell_Reg_Exp_Val.ErrorMessage = "أرقام فقط";
                    Salary_Reg_Exp_Val.ErrorMessage = "أرقام فقط";
                    Mobile_Reg_Exp_Val.ErrorMessage = "أرقام فقط";
                    Email_Reg_Exp_Val.ErrorMessage = "بريد إلكتروني غير صالح";

                }
            }
            _sqlCon.Close();

        }
    }
}