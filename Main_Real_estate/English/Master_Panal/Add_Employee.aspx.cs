using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Employee : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                language();
            }
        }

        protected void btn_Add_Employee_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addEmployeeQuary = "Insert Into employee (" +
                                            "Employee_Photo," +
                                            "Employee_Photo_Path," +
                                            "Employee_English_name," +
                                            "Employee_Arabic_name," +
                                            "Employee_Mobile," +
                                            "Employee_Tell," +
                                            "Employee_Designation," +
                                            "department_Department_Id," +
                                            "employee_level_Employee_Level_Id) " +
                                            "VALUES(" +
                                            "@Employee_Photo ," +
                                            "@Employee_Photo_Path , " +
                                            "@Employee_English_name," +
                                            "@Employee_Arabic_name," +
                                            "@Employee_Mobile," +
                                            "@Employee_Tell," +
                                            "@Employee_Designation," +
                                            "@department_Department_Id," +
                                            "@employee_level_Employee_Level_Id)";
                _sqlCon.Open();
                MySqlCommand addEmployeeCmd = new MySqlCommand(addEmployeeQuary, _sqlCon);

                addEmployeeCmd.Parameters.AddWithValue("@department_Department_Id", Employee_Department_DropDownList.SelectedValue);
                addEmployeeCmd.Parameters.AddWithValue("@employee_level_Employee_Level_Id", Employee_Level_DropDownList.SelectedValue);
                addEmployeeCmd.Parameters.AddWithValue("@Employee_English_name", txt_En_Employee_Name.Text);
                addEmployeeCmd.Parameters.AddWithValue("@Employee_Arabic_name", txt_Ar_Employee_Name.Text);
                addEmployeeCmd.Parameters.AddWithValue("@Employee_Mobile", txt_Employee_Mobile.Text);
                addEmployeeCmd.Parameters.AddWithValue("@Employee_Tell", txt_Employee_Mobile.Text);
                addEmployeeCmd.Parameters.AddWithValue("@Employee_Designation", txt_Employee_Designation.Text);


                if (FUL_Employee_Photo.HasFile)
                {
                    string fileName1 = Path.GetFileName(FUL_Employee_Photo.PostedFile.FileName);
                    FUL_Employee_Photo.PostedFile.SaveAs(Server.MapPath("/English/Master_Panal/Employee_Photo/") + fileName1);
                    addEmployeeCmd.Parameters.AddWithValue("@Employee_Photo", fileName1);
                    addEmployeeCmd.Parameters.AddWithValue("@Employee_Photo_Path", "/English/Master_Panal/Employee_Photo/" + fileName1);
                }
                else
                {
                    addEmployeeCmd.Parameters.AddWithValue("@Employee_Photo", "User.png");
                    addEmployeeCmd.Parameters.AddWithValue("@Employee_Photo_Path", "/English/Main_Application/Main_Image/User.png");
                }




                addEmployeeCmd.ExecuteNonQuery();



                _sqlCon.Close();
                lbl_Success_Add_New_Employee.Text = "تمت الإضافة بنجاح";

                Response.Redirect("Employee_List.aspx");
            }
        }

        protected void btn_Back_To_Employee_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employee_List.aspx");
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
                    //Fill Contractor_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM department", _sqlCon, Employee_Department_DropDownList, "Department_English_Name", "Department_Id");
                    Employee_Department_DropDownList.Items.Insert(0, "...............");

                    //Fill Contractor_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee_level", _sqlCon, Employee_Level_DropDownList, "Employee_English_Level", "Employee_Level_Id");
                    Employee_Level_DropDownList.Items.Insert(0, "...............");

                    lbl_titel_Add_New_Employee.Text = Dt.Rows[213]["EN"].ToString();
                    lbl_En_Employee_Name.Text = Dt.Rows[214]["EN"].ToString();
                    lbl_Ar_Employee_Name.Text = Dt.Rows[215]["EN"].ToString();
                    lbl_Employee_tell.Text = Dt.Rows[47]["EN"].ToString();
                    lbl_Employee_Mobile.Text = Dt.Rows[50]["EN"].ToString();
                    lbl_Employee_Designation.Text = Dt.Rows[216]["EN"].ToString();
                    lbl_Employee_Department.Text = Dt.Rows[217]["EN"].ToString();
                    lbl_Employee_Level.Text = Dt.Rows[218]["EN"].ToString();
                    lbl_Employee_Photo.Text = Dt.Rows[219]["EN"].ToString();
                    btn_Add_Employee.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Employee_List.Text = Dt.Rows[220]["EN"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";
                    RegularExpressionValidator3.ErrorMessage = "Only Numbers";
                    RegularExpressionValidator4.ErrorMessage = "Only Numbers";


                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";
                    reqFuild3.ErrorMessage = "* Required";
                    RequiredFieldValidator2.ErrorMessage = "* Required";
                    RequiredFieldValidator4.ErrorMessage = "* Required";
                    Ownership_Status_RequiredFieldValidator.ErrorMessage = "* Required";
                    RequiredFieldValidator3.ErrorMessage = "* Required";
                }
                else
                {

                    //Fill Contractor_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM department", _sqlCon, Employee_Department_DropDownList, "Department_Arabic_Name", "Department_Id");
                    Employee_Department_DropDownList.Items.Insert(0, "...............");

                    //Fill Contractor_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee_level", _sqlCon, Employee_Level_DropDownList, "Employee_Arabic_Level", "Employee_Level_Id");
                    Employee_Level_DropDownList.Items.Insert(0, "...............");



                    lbl_titel_Add_New_Employee.Text = Dt.Rows[213]["AR"].ToString();
                    lbl_En_Employee_Name.Text = Dt.Rows[214]["AR"].ToString();
                    lbl_Ar_Employee_Name.Text = Dt.Rows[215]["AR"].ToString();
                    lbl_Employee_tell.Text = Dt.Rows[47]["AR"].ToString();
                    lbl_Employee_Mobile.Text = Dt.Rows[50]["AR"].ToString();
                    lbl_Employee_Designation.Text = Dt.Rows[216]["AR"].ToString();
                    lbl_Employee_Department.Text = Dt.Rows[217]["AR"].ToString();
                    lbl_Employee_Level.Text = Dt.Rows[218]["AR"].ToString();
                    lbl_Employee_Photo.Text = Dt.Rows[219]["AR"].ToString();
                    btn_Add_Employee.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Employee_List.Text = Dt.Rows[220]["AR"].ToString();


                    RegularExpressionValidator1.ErrorMessage = "إنكليزي فقط";
                    RegularExpressionValidator2.ErrorMessage = "عربي فقط";
                    RegularExpressionValidator3.ErrorMessage = "أرقام فقط";
                    RegularExpressionValidator4.ErrorMessage = "أرقام فقط";


                    reqFuild1.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator1.ErrorMessage = "* مطلوب";
                    reqFuild3.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator2.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator4.ErrorMessage = "* مطلوب";
                    Ownership_Status_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator3.ErrorMessage = "* مطلوب";
                }
            }
            _sqlCon.Close();

        }
    }
}