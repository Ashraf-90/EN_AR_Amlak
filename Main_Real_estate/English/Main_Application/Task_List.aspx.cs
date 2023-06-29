using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Drawing;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Task_List : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            language();
            BindData();
        }
        protected void BindData(string sortExpression = null)
        {
            try
            {
                string get_Task_Quari = "SELECT " +
                    "TM.* , " +
                    "D.Department_Arabic_Name , D.Department_English_Name ," +
                    "E.Employee_Arabic_name , E.Employee_English_name " +
                    "FROM task_management TM " +
                    "left join department D on(TM.Department_Id = D.Department_Id) " +
                    "left join employee E on(TM.Employee_Id = E.Employee_Id) ORDER BY Task_Priority;";

                MySqlCommand get_Task_Cmd = new MySqlCommand(get_Task_Quari, _sqlCon);
                MySqlDataAdapter get_Task_Dt = new MySqlDataAdapter(get_Task_Cmd);
                get_Task_Cmd.Connection = _sqlCon;
                _sqlCon.Open();
                get_Task_Dt.SelectCommand = get_Task_Cmd;
                DataTable get_Task_DataTable = new DataTable();
                get_Task_Dt.Fill(get_Task_DataTable);
                Task_List_R.DataSource = get_Task_DataTable;
                Task_List_R.DataBind();
                _sqlCon.Close();
        }
            catch
            {
                Response.Write(
                    @"<script language='javascript'>alert('OOPS!!! SomeThing Wrong')</script>");
            }
}
       

        protected void Edit_Task(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Edit_Task.aspx?Id=" + id);
        }

        protected void Task_List_R_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lbl_titel_Prioroty = (e.Item.FindControl("lbl_titel_Prioroty") as Label);
                Label lbl_titel_Task = (e.Item.FindControl("lbl_titel_Task") as Label);
                Label lbl_titel_Department = (e.Item.FindControl("lbl_titel_Department") as Label);
                Label lbl_titel_Emplyee = (e.Item.FindControl("lbl_titel_Emplyee") as Label);
                Label lbl_titel_Descrioption = (e.Item.FindControl("lbl_titel_Descrioption") as Label);
                Label lbl_titel_Start = (e.Item.FindControl("lbl_titel_Start") as Label);
                Label lbl_titel_End = (e.Item.FindControl("lbl_titel_End") as Label);
                Label lbl_titel_Acual_End = (e.Item.FindControl("lbl_titel_Acual_End") as Label);
                Label lbl_titel_Status = (e.Item.FindControl("lbl_titel_Status") as Label);

                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_task", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_titel_Prioroty.Text = Dt.Rows[7]["EN"].ToString();
                        lbl_titel_Task.Text = Dt.Rows[0]["EN"].ToString();
                        lbl_titel_Department.Text = Dt.Rows[13]["EN"].ToString();
                        lbl_titel_Emplyee.Text = Dt.Rows[2]["EN"].ToString();
                        lbl_titel_Descrioption.Text = Dt.Rows[3]["EN"].ToString();
                        lbl_titel_Start.Text = Dt.Rows[4]["EN"].ToString();
                        lbl_titel_End.Text = Dt.Rows[5]["EN"].ToString();
                        lbl_titel_Acual_End.Text = Dt.Rows[14]["EN"].ToString();
                        lbl_titel_Status.Text = Dt.Rows[15]["EN"].ToString();

                    }
                    else
                    {
                        lbl_titel_Prioroty.Text = Dt.Rows[7]["AR"].ToString();
                        lbl_titel_Task.Text = Dt.Rows[0]["AR"].ToString();
                        lbl_titel_Department.Text = Dt.Rows[13]["AR"].ToString();
                        lbl_titel_Emplyee.Text = Dt.Rows[2]["AR"].ToString();
                        lbl_titel_Descrioption.Text = Dt.Rows[3]["AR"].ToString();
                        lbl_titel_Start.Text = Dt.Rows[4]["AR"].ToString();
                        lbl_titel_End.Text = Dt.Rows[5]["AR"].ToString();
                        lbl_titel_Acual_End.Text = Dt.Rows[14]["AR"].ToString();
                        lbl_titel_Status.Text = Dt.Rows[15]["AR"].ToString();
                    }
                }

            }



            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton Edit = e.Item.FindControl("Edit") as LinkButton;
                _sqlCon.Close();
                Utilities.Roles.Edit_permission(_sqlCon, Session["Role"].ToString(), "Task_Management", Edit);



                Button But_Priority = (e.Item.FindControl("But_Priority") as Button);
                Label lbl_Task_Priority_Word = (e.Item.FindControl("lbl_Task_Priority_Word") as Label);
                Label lbl_Task_Priority = (e.Item.FindControl("lbl_Task_Priority") as Label);
                HtmlTableRow tr = e.Item.FindControl("row") as HtmlTableRow;
                Label lbl_Task_Status = (e.Item.FindControl("lbl_Task_Status") as Label);


                if (lbl_Task_Priority.Text == "1")
                {
                    //But_Priority.BackColor = Color.Red; 
                    //lbl_Task_Priority_Word.ForeColor = Color.Red; 
                    But_Priority.Attributes.Add("style", "background-color: #da4453");
                    lbl_Task_Priority_Word.Attributes.Add("style", "color: #da4453");
                }
                else if (lbl_Task_Priority.Text == "2")
                {
                    //But_Priority.BackColor = Color.Orange; 
                    //lbl_Task_Priority_Word.ForeColor = Color.Orange; 
                    But_Priority.Attributes.Add("style", "background-color: #e8563f");
                    lbl_Task_Priority_Word.Attributes.Add("style", "color: #e8563f");
                }
                else if (lbl_Task_Priority.Text == "3")
                {
                    //But_Priority.BackColor = Color.Yellow; 
                    //lbl_Task_Priority_Word.ForeColor = Color.Yellow; 
                    But_Priority.Attributes.Add("style", "background-color: #fcbb42");
                    lbl_Task_Priority_Word.Attributes.Add("style", "color: #fcbb42");
                }
                else if (lbl_Task_Priority.Text == "4")
                {
                    //But_Priority.BackColor = Color.Green; 
                    //lbl_Task_Priority_Word.ForeColor = Color.Green; 
                    But_Priority.Attributes.Add("style", "background-color: #37bc9b");
                    lbl_Task_Priority_Word.Attributes.Add("style", "color: #37bc9b");
                }

                else if (lbl_Task_Priority.Text == "5")
                {
                    //But_Priority.BackColor = Color.LightGreen; 
                    //lbl_Task_Priority_Word.ForeColor = Color.LightGreen; 
                    But_Priority.Attributes.Add("style", "background-color: #62ddbd");
                    lbl_Task_Priority_Word.Attributes.Add("style", "color: #62ddbd");

                }
                else if (lbl_Task_Priority.Text == "6")
                {
                    //But_Priority.BackColor = Color.Blue; 
                    //lbl_Task_Priority_Word.ForeColor = Color.Blue; 
                    But_Priority.Attributes.Add("style", "background-color: #3bafda");
                    lbl_Task_Priority_Word.Attributes.Add("style", "color: #3bafda");
                }






                Label lbl_Department_Arabic_Name = (e.Item.FindControl("lbl_Department_Arabic_Name") as Label);
                Label lbl_Department_English_Name = (e.Item.FindControl("lbl_Department_English_Name") as Label);
                Label lbl_Employee_Arabic_name = (e.Item.FindControl("lbl_Employee_Arabic_name") as Label);
                Label lbl_Employee_English_name = (e.Item.FindControl("lbl_Employee_English_name") as Label);



                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Department_Arabic_Name.Visible= false; lbl_Department_English_Name.Visible = true;
                    lbl_Employee_Arabic_name.Visible = false; lbl_Employee_English_name.Visible = true;


                    if (lbl_Task_Priority_Word.Text == "اولوية من الدرجة الأولى") { lbl_Task_Priority_Word.Text = "First Level "; }
                    else if (lbl_Task_Priority_Word.Text == "اولوية من الدرجة الثانية") { lbl_Task_Priority_Word.Text = "Second Level "; }
                    else if (lbl_Task_Priority_Word.Text == "اولوية من الدرجة الثالثة") { lbl_Task_Priority_Word.Text = "Third Level "; }
                    else if (lbl_Task_Priority_Word.Text == "اولوية من الدرجة الرابعة") { lbl_Task_Priority_Word.Text = "Fourth Level "; }
                    else if (lbl_Task_Priority_Word.Text == "اولوية من الدرجة الخامسة") { lbl_Task_Priority_Word.Text = "Fifth Level "; }




                    if (lbl_Task_Status.Text == "معلقة") { lbl_Task_Status.Text = "On Hold"; }
                    else if (lbl_Task_Status.Text == "إنتظار") { lbl_Task_Status.Text = "Waiting"; }
                    else if (lbl_Task_Status.Text == "منتهية") { lbl_Task_Status.Text = "Done"; }
                }
                else
                {
                    lbl_Department_Arabic_Name.Visible = true; lbl_Department_English_Name.Visible = false;
                    lbl_Employee_Arabic_name.Visible = true; lbl_Employee_English_name.Visible = false;



                    if (lbl_Task_Priority_Word.Text == "First Level ") { lbl_Task_Priority_Word.Text = "اولوية من الدرجة الأولى"; }
                    else if (lbl_Task_Priority_Word.Text == "Second Level ") { lbl_Task_Priority_Word.Text = "اولوية من الدرجة الثانية"; }
                    else if (lbl_Task_Priority_Word.Text == "Third Level ") { lbl_Task_Priority_Word.Text = "اولوية من الدرجة الثالثة"; }
                    else if (lbl_Task_Priority_Word.Text == "Fourth Level ") { lbl_Task_Priority_Word.Text = "اولوية من الدرجة الرابعة"; }
                    else if (lbl_Task_Priority_Word.Text == "Fifth Level ") { lbl_Task_Priority_Word.Text = "اولوية من الدرجة الخامسة"; }



                    if (lbl_Task_Status.Text == "On Hold") { lbl_Task_Status.Text = "معلقة"; }
                    else if (lbl_Task_Status.Text == "Waiting") { lbl_Task_Status.Text = "إنتظار"; }
                    else if (lbl_Task_Status.Text == "Done") { lbl_Task_Status.Text = "منتهية"; }
                }
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
                    lbl_titel_Task_List.Text = Dt.Rows[12]["EN"].ToString();
                    Add.Text = Dt.Rows[8]["EN"].ToString();
                }
                else
                {
                    lbl_titel_Task_List.Text = Dt.Rows[12]["AR"].ToString();
                    Add.Text = Dt.Rows[8]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}