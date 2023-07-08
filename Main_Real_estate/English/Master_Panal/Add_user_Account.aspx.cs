using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_user_Account : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                language();
            }
        }

        protected void btn_Add_user_Account_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var key = "b14ca5898a4e4133bbce2ea2315a1916";
                string Orginal = txt_Password.Text;
                string Moshfar = Utilities.AesOperation.EncryptString(key, txt_Password.Text);



                string Add_user_Account_Query = "Insert Into users ( Emploee_Id , Users_Name ,  Users_Ar_First_Name , Users_Ar_Last_Name , Users_password , Role , Photo , Photo_Path ) " +
                                            "VALUES  ( @Emploee_Id , @Users_Name ,  @Users_Ar_First_Name , @Users_Ar_Last_Name , @Users_password , Role , @Photo , @Photo_Path ) ";
                _sqlCon.Open();
                using (MySqlCommand user_Account_Cmd = new MySqlCommand(Add_user_Account_Query, _sqlCon))
                {
                    user_Account_Cmd.Parameters.AddWithValue("@Emploee_Id", Employe_DropDownList.SelectedValue);
                    user_Account_Cmd.Parameters.AddWithValue("@Users_Name", txt_User_Name.Text);
                    user_Account_Cmd.Parameters.AddWithValue("@Users_Ar_First_Name", txt_Ar_First_Name.Text);
                    user_Account_Cmd.Parameters.AddWithValue("@Users_Ar_Last_Name", txt_Ar_Last_Name.Text);
                    user_Account_Cmd.Parameters.AddWithValue("@Users_password", Moshfar);
                    user_Account_Cmd.Parameters.AddWithValue("@Role", Role_DropDownList.SelectedValue);
                    user_Account_Cmd.Parameters.AddWithValue("@Photo", Photo_FileName.Text);
                    user_Account_Cmd.Parameters.AddWithValue("@Photo_Path", Photo_FilePath.Text);


                    user_Account_Cmd.ExecuteNonQuery();
                }
                _sqlCon.Close();
                lbl_Success_Add_user_Account.Text = "تمت إضافة الوحدة بنجاح";


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

                    lbl_titel_Add_user_Account.Text = Dt.Rows[222]["EN"].ToString();
                    lbl_Employee.Text = Dt.Rows[223]["EN"].ToString();
                    lbl_Ar_First_Name.Text = Dt.Rows[224]["EN"].ToString();
                    lbl_Ar_Last_Name.Text = Dt.Rows[225]["EN"].ToString();
                    lbl_User_Name.Text = Dt.Rows[226]["EN"].ToString();
                    lbl_Password.Text = Dt.Rows[227]["EN"].ToString();
                    lbl_Confirm_Password.Text = Dt.Rows[228]["EN"].ToString();
                    lbl_Rull.Text = Dt.Rows[229]["EN"].ToString();
                    btn_Add_user_Account.Text = Dt.Rows[54]["EN"].ToString();
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



                    lbl_titel_Add_user_Account.Text = Dt.Rows[222]["AR"].ToString();
                    lbl_Employee.Text = Dt.Rows[223]["AR"].ToString();
                    lbl_Ar_First_Name.Text = Dt.Rows[224]["AR"].ToString();
                    lbl_Ar_Last_Name.Text = Dt.Rows[225]["AR"].ToString();
                    lbl_User_Name.Text = Dt.Rows[226]["AR"].ToString();
                    lbl_Password.Text = Dt.Rows[227]["AR"].ToString();
                    lbl_Confirm_Password.Text = Dt.Rows[228]["AR"].ToString();
                    lbl_Rull.Text = Dt.Rows[229]["AR"].ToString();
                    btn_Add_user_Account.Text = Dt.Rows[54]["AR"].ToString();
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