using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Employee : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();

                string employeeId = Request.QueryString["Id"];
                DataTable getEmployeeDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getEmployeeCmd =
                    new MySqlCommand("SELECT * FROM employee WHERE Employee_Id = @ID", _sqlCon);
                MySqlDataAdapter getEmployeeDa = new MySqlDataAdapter(getEmployeeCmd);
                getEmployeeCmd.Parameters.AddWithValue("@ID", employeeId);
                getEmployeeDa.Fill(getEmployeeDt);
                if (getEmployeeDt.Rows.Count > 0)
                {
                    txt_En_Employee_Name.Text = getEmployeeDt.Rows[0]["Employee_English_name"].ToString();
                    txt_Ar_Employee_Name.Text = getEmployeeDt.Rows[0]["Employee_Arabic_name"].ToString();
                    txt_Employee_Mobile.Text = getEmployeeDt.Rows[0]["Employee_Mobile"].ToString();
                    txt_Employee_tell.Text = getEmployeeDt.Rows[0]["Employee_Tell"].ToString();
                    txt_Employee_Designation.Text = getEmployeeDt.Rows[0]["Employee_Designation"].ToString();

                    Employee_Department_DropDownList.SelectedValue =
                        getEmployeeDt.Rows[0]["department_Department_Id"].ToString();
                    Employee_Level_DropDownList.SelectedValue =
                        getEmployeeDt.Rows[0]["employee_level_Employee_Level_Id"].ToString();

                    if (Session["Langues"].ToString() == "1") { lbl_titel_Name_Edit_Employee.Text = getEmployeeDt.Rows[0]["Employee_English_name"].ToString(); }
                    else { lbl_titel_Name_Edit_Employee.Text = getEmployeeDt.Rows[0]["Employee_Arabic_name"].ToString(); }
                        
                    Photo_Name.Text = getEmployeeDt.Rows[0]["Employee_Photo"].ToString();
                    lbl_path.Text = getEmployeeDt.Rows[0]["Employee_Photo_path"].ToString();
                    Employee_Photo.ImageUrl = lbl_path.Text;
                }

                _sqlCon.Close();
            }
        }

        protected void btn_Edit_Employee_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string employeeId = Request.QueryString["Id"];

                string updateEmployeeQuary = "UPDATE employee SET " +
                                               "Employee_Photo=@Employee_Photo , " +
                                               "Employee_Photo_path=@Employee_Photo_Path , " +
                                               "Employee_English_name=@Employee_English_name, " +
                                               "Employee_Arabic_name=@Employee_Arabic_name , " +
                                               "Employee_Mobile=@Employee_Mobile , " +
                                               "Employee_Tell=@Employee_Tell , " +
                                               "Employee_Designation=@Employee_Designation , " +
                                               "department_Department_Id=@department_Department_Id , " +
                                               "employee_level_Employee_Level_Id=@employee_level_Employee_Level_Id " +
                                               "WHERE Employee_Id=@ID ";
                _sqlCon.Open();
                MySqlCommand updateEmployeeCmd = new MySqlCommand(updateEmployeeQuary, _sqlCon);
                updateEmployeeCmd.Parameters.AddWithValue("@ID", employeeId);
                updateEmployeeCmd.Parameters.AddWithValue("@Employee_English_name", txt_En_Employee_Name.Text);
                updateEmployeeCmd.Parameters.AddWithValue("@Employee_Arabic_name", txt_Ar_Employee_Name.Text);
                updateEmployeeCmd.Parameters.AddWithValue("@Employee_Mobile", txt_Employee_Mobile.Text);
                updateEmployeeCmd.Parameters.AddWithValue("@Employee_Tell", txt_Employee_tell.Text);
                updateEmployeeCmd.Parameters.AddWithValue("@Employee_Designation", txt_Employee_Designation.Text);
                updateEmployeeCmd.Parameters.AddWithValue("@department_Department_Id",
                    Employee_Department_DropDownList.SelectedValue);
                updateEmployeeCmd.Parameters.AddWithValue("@employee_level_Employee_Level_Id",
                    Employee_Level_DropDownList.SelectedValue);

                if (FUL_Employee_Photo.HasFile)
                {
                    string fileName = Path.GetFileName(FUL_Employee_Photo.PostedFile.FileName);
                    FUL_Employee_Photo.PostedFile.SaveAs(Server.MapPath("/English/Master_Panal/Employee_Photo/") +
                                                         fileName);
                    updateEmployeeCmd.Parameters.AddWithValue("@Employee_Photo", fileName);
                    updateEmployeeCmd.Parameters.AddWithValue("@Employee_Photo_Path",
                        "/English/Master_Panal/Employee_Photo/" + fileName);
                }
                else
                {
                    string fileName = Path.GetFileName(FUL_Employee_Photo.PostedFile.FileName);
                    updateEmployeeCmd.Parameters.AddWithValue("@Employee_Photo", Photo_Name.Text);
                    updateEmployeeCmd.Parameters.AddWithValue("@Employee_Photo_Path", lbl_path.Text);
                }

                updateEmployeeCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_Employee.Text = "تم التعديل بنجاح";
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


                    lbl_titel_Edit_New_Employee.Text = Dt.Rows[221]["EN"].ToString();
                    lbl_En_Employee_Name.Text = Dt.Rows[214]["EN"].ToString();
                    lbl_Ar_Employee_Name.Text = Dt.Rows[215]["EN"].ToString();
                    lbl_Employee_tell.Text = Dt.Rows[47]["EN"].ToString();
                    lbl_Employee_Mobile.Text = Dt.Rows[50]["EN"].ToString();
                    lbl_Employee_Designation.Text = Dt.Rows[216]["EN"].ToString();
                    lbl_Employee_Department.Text = Dt.Rows[217]["EN"].ToString();
                    lbl_Employee_Level.Text = Dt.Rows[218]["EN"].ToString();
                    lbl_Employee_Photo.Text = Dt.Rows[219]["EN"].ToString();
                    btn_Edit_Employee.Text = Dt.Rows[57]["EN"].ToString();
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



                    lbl_titel_Edit_New_Employee.Text = Dt.Rows[221]["AR"].ToString();
                    lbl_En_Employee_Name.Text = Dt.Rows[214]["AR"].ToString();
                    lbl_Ar_Employee_Name.Text = Dt.Rows[215]["AR"].ToString();
                    lbl_Employee_tell.Text = Dt.Rows[47]["AR"].ToString();
                    lbl_Employee_Mobile.Text = Dt.Rows[50]["AR"].ToString();
                    lbl_Employee_Designation.Text = Dt.Rows[216]["AR"].ToString();
                    lbl_Employee_Department.Text = Dt.Rows[217]["AR"].ToString();
                    lbl_Employee_Level.Text = Dt.Rows[218]["AR"].ToString();
                    lbl_Employee_Photo.Text = Dt.Rows[219]["AR"].ToString();
                    btn_Edit_Employee.Text = Dt.Rows[57]["AR"].ToString();
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