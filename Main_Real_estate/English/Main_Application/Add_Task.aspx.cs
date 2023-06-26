using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Add_Task : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Task_Management", 0, "R");
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Task_Management", 1, "A");
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();
                txt_Start_Date.Text = DateTime.Now.ToString("dd/MM/yyyy");
            }
           
        }

        //******************  End_Date ***************************************************
        protected void End_Date_Chosee_Click(object sender, EventArgs e)
        {
            End_Date_Div.Visible = true;
            ImageButton3.Visible = true;
        }

        protected void ImageButton3_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            End_Date_Div.Visible = false;
            ImageButton3.Visible = false;
        }

        protected void End_Date_Calendar_SelectionChanged1(object sender, EventArgs e)
        {
            txt_End_Date.Text = End_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_End_Date.Text != "")
            {
                End_Date_Div.Visible = false;
                ImageButton3.Visible = false;
            }
        }
        protected void btn_Back_To_Task_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Task_List.aspx");
        }

        protected void Department_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["Langues"].ToString() == "1")
            {
                //Fill Employee Name DropDownList
                Helper.LoadDropDownList("SELECT * FROM employee where department_Department_Id = '" + Department_DropDownList.SelectedValue + "'",
            _sqlCon, Employee_Name_DropDownList, "Employee_English_name", "Employee_Id");
                Employee_Name_DropDownList.Items.Insert(0, "...............");
            }
            else
            {
                //Fill Employee Name DropDownList
                Helper.LoadDropDownList("SELECT * FROM employee where department_Department_Id = '" + Department_DropDownList.SelectedValue + "'",
            _sqlCon, Employee_Name_DropDownList, "Employee_Arabic_name", "Employee_Id");
                Employee_Name_DropDownList.Items.Insert(0, "...............");
            }


                    
        }
        protected void btn_Add_Task_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addTaskQuary =
                    "Insert Into task_management " +
                    "(Task_Type ," +
                    "Department_Id," +
                    "Employee_Id," +
                    "Task_Descrioption," +
                    "Start_date," +
                    "End_Date," +
                    "Task_Status," +
                    "Task_Priority," +
                    "Task_Priority_Word," +
                    "Notification_Activ) " +
                    "VALUES" +
                    "(@Task_Type ," +
                    "@Department_Id," +
                    "@Employee_Id," +
                    "@Task_Descrioption," +
                    "@Start_date," +
                    "@End_Date," +
                    "@Task_Status," +
                    "@Task_Priority," +
                    "@Task_Priority_Word," +
                    "@Notification_Activ)";
                _sqlCon.Open();
                MySqlCommand addTaskCmd = new MySqlCommand(addTaskQuary, _sqlCon);
                addTaskCmd.Parameters.AddWithValue("@Task_Type", txt_Task_Type.Text);
                addTaskCmd.Parameters.AddWithValue("@Task_Descrioption", txt_Task_Discreption.Text);
                addTaskCmd.Parameters.AddWithValue("@Start_date", txt_Start_Date.Text);
                addTaskCmd.Parameters.AddWithValue("@End_Date", txt_End_Date.Text);
                addTaskCmd.Parameters.AddWithValue("@Task_Status", "معلقة");
                addTaskCmd.Parameters.AddWithValue("@Task_Priority", priority_DropDownList.SelectedValue);
                addTaskCmd.Parameters.AddWithValue("@Task_Priority_Word", priority_DropDownList.SelectedItem.Text.Trim());
                addTaskCmd.Parameters.AddWithValue("@Notification_Activ", "1");

                if (Department_DropDownList.SelectedItem.Text == "...............") { addTaskCmd.Parameters.AddWithValue("@Department_Id", "");}
                else { addTaskCmd.Parameters.AddWithValue("@Department_Id", Department_DropDownList.SelectedValue); }

                if(Employee_Name_DropDownList.SelectedItem.Text== "...............") { addTaskCmd.Parameters.AddWithValue("@Employee_Id", ""); }
                else { addTaskCmd.Parameters.AddWithValue("@Employee_Id", Employee_Name_DropDownList.SelectedValue); }

                addTaskCmd.ExecuteNonQuery();
                _sqlCon.Close();

                Response.Redirect("Task_list.aspx");


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
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_task", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //    //Fill department DropDownList
                    Helper.LoadDropDownList("SELECT * FROM department", _sqlCon, Department_DropDownList, "Department_English_Name", "Department_Id");
                    Department_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Employee Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Employee_Name_DropDownList, "Employee_English_name", "Employee_Id");
                    Employee_Name_DropDownList.Items.Insert(0, "...............");

                    //Get priority_DropDownList
                    priority_DropDownList.Items.Clear();
                    priority_DropDownList.Items.Add(new ListItem("First Level Priority", "1"));
                    priority_DropDownList.Items.Add(new ListItem("Second Level Priority", "2"));
                    priority_DropDownList.Items.Add(new ListItem("Third Level Priority", "3"));
                    priority_DropDownList.Items.Add(new ListItem("Fourth Level Priority", "4"));
                    priority_DropDownList.Items.Add(new ListItem("Fifth Level Priority", "5"));

                    lbl_Add_New_Task.Text = Dt.Rows[8]["EN"].ToString();
                    lbl_Task_Type.Text = Dt.Rows[0]["EN"].ToString();
                    lbl_Department.Text = Dt.Rows[1]["EN"].ToString();
                    lbl_Employee_Name.Text = Dt.Rows[2]["EN"].ToString();
                    lbl_Task_Discreption.Text = Dt.Rows[3]["EN"].ToString();
                    lbl_Start_Date.Text = Dt.Rows[4]["EN"].ToString();
                    lbl_End_Date.Text = Dt.Rows[5]["EN"].ToString();
                    lbl_priority.Text = Dt.Rows[7]["EN"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[6]["EN"].ToString();
                    btn_Add_Task.Text = Dt.Rows[8]["EN"].ToString();
                    btn_Back_To_Task_List.Text = Dt.Rows[9]["EN"].ToString();
                }
                else
                {
                    //    //Fill department DropDownList
                    Helper.LoadDropDownList("SELECT * FROM department", _sqlCon, Department_DropDownList, "Department_Arabic_Name", "Department_Id");
                    Department_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Employee Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Employee_Name_DropDownList, "Employee_Arabic_name", "Employee_Id");
                    Employee_Name_DropDownList.Items.Insert(0, "...............");


                    //Get priority_DropDownList
                    priority_DropDownList.Items.Clear();
                    priority_DropDownList.Items.Add(new ListItem("اولوية من الدرجة الأولى", "1"));
                    priority_DropDownList.Items.Add(new ListItem("اولوية من الدرجة الثانية", "2"));
                    priority_DropDownList.Items.Add(new ListItem("اولوية من الدرجة الثالثة", "3"));
                    priority_DropDownList.Items.Add(new ListItem("اولوية من الدرجة الرابعة", "4"));
                    priority_DropDownList.Items.Add(new ListItem("اولوية من الدرجة الخامسة", "5"));

                    lbl_Add_New_Task.Text = Dt.Rows[8]["AR"].ToString();
                    lbl_Task_Type.Text = Dt.Rows[0]["AR"].ToString();
                    lbl_Department.Text = Dt.Rows[1]["AR"].ToString();
                    lbl_Employee_Name.Text = Dt.Rows[2]["AR"].ToString();
                    lbl_Task_Discreption.Text = Dt.Rows[3]["AR"].ToString();
                    lbl_Start_Date.Text = Dt.Rows[4]["AR"].ToString();
                    lbl_End_Date.Text = Dt.Rows[5]["AR"].ToString();
                    lbl_priority.Text = Dt.Rows[7]["AR"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[6]["AR"].ToString();
                    btn_Add_Task.Text = Dt.Rows[8]["AR"].ToString();
                    btn_Back_To_Task_List.Text = Dt.Rows[9]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}