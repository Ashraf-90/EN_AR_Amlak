using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_user_Account : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                language();


                // Get User Info 
                string ID = Request.QueryString["Id"];
                DataTable Dt = new DataTable();
                _sqlCon.Open();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM users WHERE user_ID = @ID", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Cmd.Parameters.AddWithValue("@ID", ID);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    Employe_DropDownList.SelectedValue = Dt.Rows[0]["Emploee_Id"].ToString();
                    txt_Ar_First_Name.Text = Dt.Rows[0]["Users_Ar_First_Name"].ToString();
                    txt_Ar_Last_Name.Text = Dt.Rows[0]["Users_Ar_Last_Name"].ToString();
                    txt_User_Name.Text = Dt.Rows[0]["Users_Name"].ToString();


                    var key = "b14ca5898a4e4133bbce2ea2315a1916";
                    var decryptedString = Utilities.AesOperation.DecryptString(key, Dt.Rows[0]["Users_password"].ToString());



                    txt_Password.Text = decryptedString;
                    txt_Confirm_Password.Text = decryptedString;




                    Role_DropDownList.SelectedValue = Dt.Rows[0]["Role"].ToString();
                    Photo_FileName.Text = Dt.Rows[0]["Photo"].ToString();
                    Photo_FilePath.Text = Dt.Rows[0]["Photo_Path"].ToString();
                    lbl_user_Account_Name.Text = Dt.Rows[0]["Users_Name"].ToString();
                }

                _sqlCon.Close();
            }
            ViewState["Pwd"] = txt_Password.Text;
            txt_Password.Attributes.Add("value", ViewState["Pwd"].ToString());

            ViewState["ConfirmPwd"] = txt_Confirm_Password.Text;
            txt_Confirm_Password.Attributes.Add("value", ViewState["ConfirmPwd"].ToString());
        }

        protected void btn_Edit_user_Account_Click(object sender, EventArgs e)
        {
            var key = "b14ca5898a4e4133bbce2ea2315a1916";
            string Orginal = txt_Password.Text;
            string Moshfar = Utilities.AesOperation.EncryptString(key, txt_Password.Text);

            if (Page.IsValid)
            {
                string ID = Request.QueryString["Id"];
                string Edit_user_Account_Query = "UPDATE users SET " +
                                                 "Emploee_Id=@Emploee_Id , " +
                                                 "Users_Ar_First_Name=@Users_Ar_First_Name , " +
                                                 "Users_Ar_Last_Name=@Users_Ar_Last_Name , " +
                                                 "Users_Name=@Users_Name , " +
                                                 "Users_password=@Users_password , " +
                                                 "Role=@Role , " +
                                                 "Photo=@Photo , " +
                                                 "Photo_Path=@Photo_Path " +
                                                 "WHERE user_ID=@ID ";
                _sqlCon.Open();
                MySqlCommand Cmd = new MySqlCommand(Edit_user_Account_Query, _sqlCon);
                Cmd.Parameters.AddWithValue("@ID", ID);
                Cmd.Parameters.AddWithValue("@Emploee_Id", Employe_DropDownList.SelectedValue);
                Cmd.Parameters.AddWithValue("@Users_Ar_First_Name", txt_Ar_First_Name.Text);
                Cmd.Parameters.AddWithValue("@Users_Ar_Last_Name", txt_Ar_Last_Name.Text);
                Cmd.Parameters.AddWithValue("@Users_Name", txt_User_Name.Text);
                Cmd.Parameters.AddWithValue("@Users_password", Moshfar);
                Cmd.Parameters.AddWithValue("@Role", Role_DropDownList.SelectedValue);
                Cmd.Parameters.AddWithValue("@Photo", Photo_FileName.Text);
                Cmd.Parameters.AddWithValue("@Photo_Path", Photo_FilePath.Text);
                Cmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_user_Account.Text = "تم التعديل بنجاح";
                Response.Redirect("user_Account_List.aspx");
            }
        }
        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("user_Account_List.aspx");
        }

        protected void Employe_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable Dt = new DataTable();
            _sqlCon.Open();
            MySqlCommand Cmd = new MySqlCommand("SELECT Employee_Photo , Employee_Photo_Path FROM employee WHERE Employee_Id = @ID", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Cmd.Parameters.AddWithValue("@ID", Employe_DropDownList.SelectedValue);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                Photo_FileName.Text = Dt.Rows[0]["Employee_Photo"].ToString();
                Photo_FilePath.Text = Dt.Rows[0]["Employee_Photo_Path"].ToString();
            }

            _sqlCon.Close();
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked == true)
            {
                txt_Password.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                txt_Password.TextMode = TextBoxMode.Password;
            }
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox2.Checked == true)
            {
                txt_Confirm_Password.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                txt_Confirm_Password.TextMode = TextBoxMode.Password;
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
                    //Get Employe DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Employe_DropDownList, "Employee_English_name", "Employee_Id");
                    Employe_DropDownList.Items.Insert(0, "...............");

                    //Get Employe DropDownList
                    Helper.LoadDropDownList("SELECT * FROM roles", _sqlCon, Role_DropDownList, "Role_name", "Role_ID");
                    Role_DropDownList.Items.Insert(0, "...............");

                    lbl_titel_Edit_user_Account.Text = Dt.Rows[231]["EN"].ToString();
                    lbl_Employee.Text = Dt.Rows[223]["EN"].ToString();
                    lbl_Ar_First_Name.Text = Dt.Rows[224]["EN"].ToString();
                    lbl_Ar_Last_Name.Text = Dt.Rows[225]["EN"].ToString();
                    lbl_User_Name.Text = Dt.Rows[226]["EN"].ToString();
                    lbl_Password.Text = Dt.Rows[227]["EN"].ToString();
                    lbl_Confirm_Password.Text = Dt.Rows[228]["EN"].ToString();
                    lbl_Rull.Text = Dt.Rows[229]["EN"].ToString();
                    btn_Edit_user_Account.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back.Text = Dt.Rows[230]["EN"].ToString();


                    RegularExpressionValidator2.ErrorMessage = "Only English";
                    RegularExpressionValidator1.ErrorMessage = "Only Arabic";
                    RegularExpressionValidator3.ErrorMessage = "Only Arabic";



                    Employe_Req_Val.ErrorMessage = "* Required";
                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator2.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";
                    RequiredFieldValidator4.ErrorMessage = "* Required";
                    PassCOm.ErrorMessage = "* Password Does Not Match";
                    RequiredFieldValidator3.ErrorMessage = "* Required";
                }
                else
                {

                    //Get Employe DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Employe_DropDownList, "Employee_Arabic_name", "Employee_Id");
                    Employe_DropDownList.Items.Insert(0, "...............");

                    //Get Employe DropDownList
                    Helper.LoadDropDownList("SELECT * FROM roles", _sqlCon, Role_DropDownList, "Role_name", "Role_ID");
                    Role_DropDownList.Items.Insert(0, "...............");



                    lbl_titel_Edit_user_Account.Text = Dt.Rows[231]["AR"].ToString();
                    lbl_Employee.Text = Dt.Rows[223]["AR"].ToString();
                    lbl_Ar_First_Name.Text = Dt.Rows[224]["AR"].ToString();
                    lbl_Ar_Last_Name.Text = Dt.Rows[225]["AR"].ToString();
                    lbl_User_Name.Text = Dt.Rows[226]["AR"].ToString();
                    lbl_Password.Text = Dt.Rows[227]["AR"].ToString();
                    lbl_Confirm_Password.Text = Dt.Rows[228]["AR"].ToString();
                    lbl_Rull.Text = Dt.Rows[229]["AR"].ToString();
                    btn_Edit_user_Account.Text = Dt.Rows[57]["AR"].ToString();
                    btn_Back.Text = Dt.Rows[230]["AR"].ToString();


                    RegularExpressionValidator2.ErrorMessage = "إنكليزي فقط";
                    RegularExpressionValidator1.ErrorMessage = "عربي فقط";
                    RegularExpressionValidator3.ErrorMessage = "عربي فقط";



                    Employe_Req_Val.ErrorMessage = "* مطلوب";
                    reqFuild1.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator2.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator1.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator4.ErrorMessage = "* مطلوب";
                    PassCOm.ErrorMessage = "* كلمة السر غير مطابقة";
                    RequiredFieldValidator3.ErrorMessage = "* مطلوب";
                }
            }
            _sqlCon.Close();

        }
    }
}
