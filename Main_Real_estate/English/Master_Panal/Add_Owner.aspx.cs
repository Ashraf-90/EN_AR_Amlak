using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Owner : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
        }

        protected void btn_Add_Owner_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addOwnerQuary =
                    "Insert Into owner (Owner_QID,path,Owner_English_name,Owner_Arabic_name,Owner_Tell,Owner_Mobile,Owner_Email,Owner_Website,Owner_Notes , Salary) " +
                    "VALUES(@Owner_QID , @path , @Owner_English_name,@Owner_Arabic_name,@Owner_Tell,@Owner_Mobile,@Owner_Email,@Owner_Website,@Owner_Notes , @Salary)";
                _sqlCon.Open();
                using (MySqlCommand addOwnerCmd = new MySqlCommand(addOwnerQuary, _sqlCon))
                {
                    addOwnerCmd.Parameters.AddWithValue("@Owner_English_name", txt_En_Owner_Name.Text);
                    addOwnerCmd.Parameters.AddWithValue("@Owner_Arabic_name", txt_Ar_Owner_Name.Text);
                    addOwnerCmd.Parameters.AddWithValue("@Owner_Tell", txt_Owner_tell.Text);
                    addOwnerCmd.Parameters.AddWithValue("@Owner_Mobile", txt_Owner_Mobile.Text);
                    addOwnerCmd.Parameters.AddWithValue("@Owner_Email", txt_Owner_Email.Text);
                    addOwnerCmd.Parameters.AddWithValue("@Owner_Website", txt_Owner_Website.Text);
                    addOwnerCmd.Parameters.AddWithValue("@Owner_Notes", txt_Owner_Note.Text);
                    addOwnerCmd.Parameters.AddWithValue("@Salary", txt_Owner_Salary.Text);

                    if (FUL_Owner_QID.HasFile)
                    {
                        string fileName = Path.GetFileName(FUL_Owner_QID.PostedFile.FileName);
                        FUL_Owner_QID.PostedFile.SaveAs(Server.MapPath("/English/Master_Panal/Owners_QID/") + fileName);

                        addOwnerCmd.Parameters.AddWithValue("@Owner_QID", fileName);
                        addOwnerCmd.Parameters.AddWithValue("@path", "/English/Master_Panal/Owners_QID/" + fileName);
                    }
                    else
                    {
                        addOwnerCmd.Parameters.AddWithValue("@Owner_QID", "No File");
                        addOwnerCmd.Parameters.AddWithValue("@path", "No File");
                    }

                    addOwnerCmd.ExecuteNonQuery();
                    _sqlCon.Close();
                    lbl_Success_Add_New_Owner.Text = "Added successfully";
                    Response.Redirect("Owner_List.aspx");
                }
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
                    lbl_titel_Add_New_Owner.Text = Dt.Rows[44]["EN"].ToString();
                    lbl_En_Owner_Name.Text = Dt.Rows[45]["EN"].ToString();
                    lbl_Ar_Owner_Name.Text = Dt.Rows[46]["EN"].ToString();
                    lbl_Owner_tell.Text = Dt.Rows[47]["EN"].ToString();
                    lbl_Owner_Note.Text = Dt.Rows[48]["EN"].ToString();
                    lbl_Owner_Salary.Text = Dt.Rows[49]["EN"].ToString();
                    lbl_Owner_Mobile.Text = Dt.Rows[50]["EN"].ToString();
                    lbl_Owner_Email.Text = Dt.Rows[51]["EN"].ToString();
                    lbl_Owner_Website.Text = Dt.Rows[52]["EN"].ToString();
                    lbl_Owner_QID.Text = Dt.Rows[53]["EN"].ToString();
                    btn_Add_Owner.Text = Dt.Rows[54]["EN"].ToString();
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
                    lbl_titel_Add_New_Owner.Text = Dt.Rows[44]["AR"].ToString();
                    lbl_En_Owner_Name.Text = Dt.Rows[45]["AR"].ToString();
                    lbl_Ar_Owner_Name.Text = Dt.Rows[46]["AR"].ToString();
                    lbl_Owner_tell.Text = Dt.Rows[47]["AR"].ToString();
                    lbl_Owner_Note.Text = Dt.Rows[48]["AR"].ToString();
                    lbl_Owner_Salary.Text = Dt.Rows[49]["AR"].ToString();
                    lbl_Owner_Mobile.Text = Dt.Rows[50]["AR"].ToString();
                    lbl_Owner_Email.Text = Dt.Rows[51]["AR"].ToString();
                    lbl_Owner_Website.Text = Dt.Rows[52]["AR"].ToString();
                    lbl_Owner_QID.Text = Dt.Rows[53]["AR"].ToString();
                    btn_Add_Owner.Text = Dt.Rows[54]["AR"].ToString();
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