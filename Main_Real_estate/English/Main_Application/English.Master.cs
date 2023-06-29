using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using Syncfusion.JavaScript.DataVisualization.Models;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English
{
    public partial class English : System.Web.UI.MasterPage
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Users_Name"] != null)
            {
                Utilities.Roles.Master_Page_permission(_sqlCon, Session["Role"].ToString(),
                Ownership_Div, Contract_Div, Tenant_Div, complaintreport_Div, Income_Expensess_Div,
                Financial_Statements_Div, Markting, Task_Managements_Div, lists_Div, Sitting_Div);
                Label1.Text = Session["Users_Name"].ToString();
                if (Session["Photo_Path"].ToString() != "") { user_Photo.Src = Session["Photo_Path"].ToString(); }
                else { user_Photo.Src = "Main_Image/user.jpg"; }

                BindData();
                Tenanat_Notification_BindData();
            }
            else { Response.Redirect("~/English/Main_Application/Log_In.aspx"); }

            if (!this.IsPostBack)
            {
                try {language(); }
                catch {Response.Redirect("~/English/Main_Application/Log_In.aspx"); }
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/English/Main_Application/Log_In.aspx");
        }
        //************************************** إشعارات العملاء **************************************************
        protected void Tenanat_Notification_BindData(string sortExpression = null)
        {
            // *********************************** جلب الإشعارات ضمن مربع الإشعارات ***************************************************************
            string get_Notification_Quari =
            "SELECT TN.* , T.Tenants_Arabic_Name , " +
            "(SELECT IF(TN.From_Who = '', TN.From_Who, CONCAT('تمت مشاهدته من قبل', TN.From_Who)))From_Whoo " +
            " FROM tenant_notification TN  " +
            "left join tenants T on (TN.Tenant_ID = T.Tenants_ID) ";

            MySqlCommand get_Notification_Cmd = new MySqlCommand(get_Notification_Quari, _sqlCon);
            MySqlDataAdapter get_Notification_Dt = new MySqlDataAdapter(get_Notification_Cmd);
            get_Notification_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_Notification_Dt.SelectCommand = get_Notification_Cmd;
            DataTable get_Notification_DataTable = new DataTable();
            get_Notification_Dt.Fill(get_Notification_DataTable);

            T_Notification_Repeater.DataSource = get_Notification_DataTable;
            T_Notification_Repeater.DataBind();

            _sqlCon.Close();

            // *********************************** جلب عدد الغشعارات ضمن مربع الإشعارات ***************************************************************

            string get_Notification_Count_Quari = "select * from tenant_notification where Seen = '0' ";

            MySqlCommand get_Notification_Count_Cmd = new MySqlCommand(get_Notification_Count_Quari, _sqlCon);
            MySqlDataAdapter get_Notification_Count_Dt = new MySqlDataAdapter(get_Notification_Count_Cmd);
            get_Notification_Count_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_Notification_Count_Dt.SelectCommand = get_Notification_Count_Cmd;
            DataTable get_Notification_Count_DataTable = new DataTable();
            get_Notification_Count_Dt.Fill(get_Notification_Count_DataTable);
            if (get_Notification_Count_DataTable.Rows.Count > 0)
            {
                T_Notification_Span.Visible = true;
                T_Notification_NO.Text = Convert.ToString(get_Notification_Count_DataTable.Rows.Count);
            }
            else
            {
                T_Notification_Span.Visible = false;
                T_Notification_NO.Text = "";
            }
            _sqlCon.Close();
        }
        protected void T_Notification_Link_Click(object sender, EventArgs e)
        {
            string updateNotification_ActivQuary = "UPDATE tenant_notification SET " +
                                                    "Seen=@Seen , From_Who=@From_Who ";
            _sqlCon.Open();
            MySqlCommand updateNotification_ActivCmd = new MySqlCommand(updateNotification_ActivQuary, _sqlCon);
            updateNotification_ActivCmd.Parameters.AddWithValue("@Seen", "1");
            updateNotification_ActivCmd.Parameters.AddWithValue("@From_Who", Session["Users_Name"].ToString());
            updateNotification_ActivCmd.ExecuteNonQuery();
            _sqlCon.Close();


            Response.Redirect("complaint_report_request_List.aspx");
        }








        protected void BindData(string sortExpression = null)
        {
            //try
            //{

            // *********************************** جلب المهام ضمن مربع الإشعارات ***************************************************************
            string get_Task_Quari = "SELECT " +
                "TM.* , " +
                "D.Department_Arabic_Name ," +
                "E.Employee_Arabic_name " +
                "FROM task_management TM " +
                "left join department D on(TM.Department_Id = D.Department_Id) " +
                "left join employee E on(TM.Employee_Id = E.Employee_Id) where TM.Employee_Id = '" + Session["Employee_Id"].ToString() + "' ;";

            MySqlCommand get_Task_Cmd = new MySqlCommand(get_Task_Quari, _sqlCon);
            MySqlDataAdapter get_Task_Dt = new MySqlDataAdapter(get_Task_Cmd);
            get_Task_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_Task_Dt.SelectCommand = get_Task_Cmd;
            DataTable get_Task_DataTable = new DataTable();
            get_Task_Dt.Fill(get_Task_DataTable);

            Notification_Repeater.DataSource = get_Task_DataTable;
            Notification_Repeater.DataBind();

            _sqlCon.Close();

            // *********************************** جلب عدد المهام ضمن مربع الإشعارات ***************************************************************
            string get_Task_Count_Quari = "select * from task_management where Employee_Id = '" + Session["Employee_Id"].ToString() + "'and Notification_Activ =1";

            MySqlCommand get_Task_Count_Cmd = new MySqlCommand(get_Task_Count_Quari, _sqlCon);
            MySqlDataAdapter get_Task_Count_Dt = new MySqlDataAdapter(get_Task_Count_Cmd);
            get_Task_Count_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_Task_Count_Dt.SelectCommand = get_Task_Count_Cmd;
            DataTable get_Task_Count_DataTable = new DataTable();
            get_Task_Count_Dt.Fill(get_Task_Count_DataTable);
            if (get_Task_Count_DataTable.Rows.Count > 0)
            {

                Notification_Span.Visible = true;
                lbl_Notification_Numberl.Text = Convert.ToString(get_Task_Count_DataTable.Rows.Count);

            }
            else
            {
                Notification_Span.Visible = false;
                lbl_Notification_Numberl.Text = "";
            }
            _sqlCon.Close();
            //}
            //catch
            //{
            //    Response.Write(
            //        @"<script language='javascript'>alert('OOPS!!! Some Thing Wrong')</script>");
            //}
        }


        protected void LinkButton2_Click(object sender, EventArgs e)
        {


            string updateNotification_ActivQuary = "UPDATE task_management SET " +
                                                    "Notification_Activ=@Notification_Activ " +
                                                    " WHERE Employee_Id = '" + Session["Employee_Id"].ToString() + "' ";
            _sqlCon.Open();
            MySqlCommand updateNotification_ActivCmd = new MySqlCommand(updateNotification_ActivQuary, _sqlCon);
            updateNotification_ActivCmd.Parameters.AddWithValue("@Notification_Activ", "0");
            updateNotification_ActivCmd.ExecuteNonQuery();
            _sqlCon.Close();


            Response.Redirect("E_Task_List.aspx");
        }





        //******************************************************************************************************************************************
        //************************************************** languages ****************************************************************
        //******************************************************************************************************************************************
        protected void Lan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Lan.SelectedValue == "1") {Session["Langues"] = "1"; }
            else{Session["Langues"] = "2";}
            Response.Redirect(Request.RawUrl);
        }


        protected void language()
        {
            if (Session["Langues"] == null) {Session["Langues"] = "1"; }
            if (Session["Langues"].ToString() == "1")
            {
                html.Attributes.Add("dir", "ltr");
                link1.Href = "../CSS/all.min.css";
                link2.Href = "../CSS/bootstrap.min.css";
                link3.Href = "../CSS/ruang-admin.min.css";
                Lan.SelectedValue = "1";
                language_logo.ImageUrl = "Main_Image/EN_Logo.png";


                Utilities.Helper.Lan(_sqlCon ,"1" , "EN" , lbl_Titel_Dashbard);
                lbl_Disclosure_properties.Text = "Full Properties Disclosure";

                Utilities.Helper.Lan(_sqlCon, "2", "EN", lbl_TitelOwnersip);
                Utilities.Helper.Lan(_sqlCon, "2", "EN", lbl_Ownersip);
                Utilities.Helper.Lan(_sqlCon, "3", "EN", lbl_building);
                Utilities.Helper.Lan(_sqlCon, "4", "EN", lbl_Units);
                Utilities.Helper.Lan(_sqlCon, "5", "EN", lbl_OS_B_U_Arcive);
                Utilities.Helper.Lan(_sqlCon, "6", "EN", lbl_M_Ownership);

                Utilities.Helper.Lan(_sqlCon, "7", "EN", lbl_Titel_Contracting);
                Utilities.Helper.Lan(_sqlCon, "8", "EN", lbl_Contract_List);
                Utilities.Helper.Lan(_sqlCon, "9", "EN", lbl_Rental_Disclosure);
                Utilities.Helper.Lan(_sqlCon, "10", "EN", lbl_Contract_Arcive);

                Utilities.Helper.Lan(_sqlCon, "11", "EN", lbl_TTitel_Tenants);
                Utilities.Helper.Lan(_sqlCon, "12", "EN", lbl_Tenant_List);
                Utilities.Helper.Lan(_sqlCon, "13", "EN", lbl_Tenant_Disclosure);
                Utilities.Helper.Lan(_sqlCon, "14", "EN", lbl_Contact_With_Tenant);
                Utilities.Helper.Lan(_sqlCon, "15", "EN", lbl_Tenant_Evaluation);

                Utilities.Helper.Lan(_sqlCon, "16", "EN", lbl_Titel_Asset);
                Utilities.Helper.Lan(_sqlCon, "17", "EN", lbl_complaint_report_request_List);
                Utilities.Helper.Lan(_sqlCon, "18", "EN", lbl_Periodec_Maintenance);
                Utilities.Helper.Lan(_sqlCon, "19", "EN", lbl_Pickup_Delivery);
                Utilities.Helper.Lan(_sqlCon, "20", "EN", lbl_Pickup_Delivery_PDF);
                Utilities.Helper.Lan(_sqlCon, "21", "EN", lbl_Maintenence_Templet);
                Utilities.Helper.Lan(_sqlCon, "22", "EN", lbl_Maintenance_Templete_PDF);

                Utilities.Helper.Lan(_sqlCon, "23", "EN", lbl_titel_Collection);
                Utilities.Helper.Lan(_sqlCon, "24", "EN", lbl_All_Income);
                Utilities.Helper.Lan(_sqlCon, "25", "EN", lbl_Income_New);

                Utilities.Helper.Lan(_sqlCon, "26", "EN", lbl_Financial_Statements);
                Utilities.Helper.Lan(_sqlCon, "26", "EN", lbl_expenses);
                Utilities.Helper.Lan(_sqlCon, "27", "EN", lbl_Real_Estate_Investment);

                Utilities.Helper.Lan(_sqlCon, "28", "EN", lbl_Marckting);

                Utilities.Helper.Lan(_sqlCon, "29", "EN", lbl_Titel_Task);
                Utilities.Helper.Lan(_sqlCon, "30", "EN", lbl_Task_List);
                Utilities.Helper.Lan(_sqlCon, "31", "EN", lbl_Add_Task);

                Utilities.Helper.Lan(_sqlCon, "32", "EN", lbl_Missing);
                Utilities.Helper.Lan(_sqlCon, "33", "EN", lbl_Setting);

                Utilities.Helper.Lan(_sqlCon, "34", "EN", lbl_Tenant_Toti);
                Utilities.Helper.Lan(_sqlCon, "35", "EN", lbl_Noti);
            }
            else
            {
                html.Attributes.Add("dir", "rtl");
                link1.Href = "../CSS/all-rtl.min.css";
                link2.Href = "../CSS/bootstrap-rtl.min.css";
                link3.Href = "../CSS/ruang-admin-rtl.min.css";
                Lan.SelectedValue = "2";
                language_logo.ImageUrl = "Main_Image/AR_Logo.png";

                Utilities.Helper.Lan(_sqlCon, "1", "AR", lbl_Titel_Dashbard);
                lbl_Disclosure_properties.Text = "كشف الملكيات الشامل";

                Utilities.Helper.Lan(_sqlCon, "2", "AR", lbl_TitelOwnersip);
                Utilities.Helper.Lan(_sqlCon, "2", "AR", lbl_Ownersip);
                Utilities.Helper.Lan(_sqlCon, "3", "AR", lbl_building);
                Utilities.Helper.Lan(_sqlCon, "4", "AR", lbl_Units);
                Utilities.Helper.Lan(_sqlCon, "5", "AR", lbl_OS_B_U_Arcive);
                Utilities.Helper.Lan(_sqlCon, "6", "AR", lbl_M_Ownership);

                Utilities.Helper.Lan(_sqlCon, "7", "AR", lbl_Titel_Contracting);
                Utilities.Helper.Lan(_sqlCon, "8", "AR", lbl_Contract_List);
                Utilities.Helper.Lan(_sqlCon, "9", "AR", lbl_Rental_Disclosure);
                Utilities.Helper.Lan(_sqlCon, "10", "AR", lbl_Contract_Arcive);

                Utilities.Helper.Lan(_sqlCon, "11", "AR", lbl_TTitel_Tenants);
                Utilities.Helper.Lan(_sqlCon, "12", "AR", lbl_Tenant_List);
                Utilities.Helper.Lan(_sqlCon, "13", "AR", lbl_Tenant_Disclosure);
                Utilities.Helper.Lan(_sqlCon, "14", "AR", lbl_Contact_With_Tenant);
                Utilities.Helper.Lan(_sqlCon, "15", "AR", lbl_Tenant_Evaluation);

                Utilities.Helper.Lan(_sqlCon, "16", "AR", lbl_Titel_Asset);
                Utilities.Helper.Lan(_sqlCon, "17", "AR", lbl_complaint_report_request_List);
                Utilities.Helper.Lan(_sqlCon, "18", "AR", lbl_Periodec_Maintenance);
                Utilities.Helper.Lan(_sqlCon, "19", "AR", lbl_Pickup_Delivery);
                Utilities.Helper.Lan(_sqlCon, "20", "AR", lbl_Pickup_Delivery_PDF);
                Utilities.Helper.Lan(_sqlCon, "21", "AR", lbl_Maintenence_Templet);
                Utilities.Helper.Lan(_sqlCon, "22", "AR", lbl_Maintenance_Templete_PDF);

                Utilities.Helper.Lan(_sqlCon, "23", "AR", lbl_titel_Collection);
                Utilities.Helper.Lan(_sqlCon, "24", "AR", lbl_All_Income);
                Utilities.Helper.Lan(_sqlCon, "25", "AR", lbl_Income_New);

                Utilities.Helper.Lan(_sqlCon, "26", "AR", lbl_Financial_Statements);
                Utilities.Helper.Lan(_sqlCon, "26", "AR", lbl_expenses);
                Utilities.Helper.Lan(_sqlCon, "27", "AR", lbl_Real_Estate_Investment);

                Utilities.Helper.Lan(_sqlCon, "28", "AR", lbl_Marckting);

                Utilities.Helper.Lan(_sqlCon, "29", "AR", lbl_Titel_Task);
                Utilities.Helper.Lan(_sqlCon, "30", "AR", lbl_Task_List);
                Utilities.Helper.Lan(_sqlCon, "31", "AR", lbl_Add_Task);

                Utilities.Helper.Lan(_sqlCon, "32", "AR", lbl_Missing);
                Utilities.Helper.Lan(_sqlCon, "33", "AR", lbl_Setting);

                Utilities.Helper.Lan(_sqlCon, "34", "AR", lbl_Tenant_Toti);
                Utilities.Helper.Lan(_sqlCon, "35", "AR", lbl_Noti);
            }
        }

    }
}