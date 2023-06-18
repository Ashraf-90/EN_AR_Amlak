using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Edit_complaint_report_request : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Asset_Management", 0, "R");
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Asset_Management", 2, "E");
                Utilities.Roles.Delete_permission_With_Reason(_sqlCon, Session["Role"].ToString(), "Asset_Management", Delete_Request, Delete_Div);
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();
                BindGrid_Contract_Cheque_List();
                //---------------------------------------------------------------------------------------------------------------------------------
                

                //*************** Get The Data Of Requst From Database *****************************************************************************************************************
                string RequstId = Request.QueryString["Id"];
                DataTable getRequstDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getRequstCmd = new MySqlCommand("SELECT * FROM complaint_report_request WHERE Complaint_Report_Request_Id = @ID", _sqlCon);
                MySqlDataAdapter getRequstDa = new MySqlDataAdapter(getRequstCmd);
                getRequstCmd.Parameters.AddWithValue("@ID", RequstId);
                getRequstDa.Fill(getRequstDt);
                if (getRequstDt.Rows.Count > 0)
                {
                    if (getRequstDt.Rows[0]["Report_Type"].ToString() == "صيانة" || getRequstDt.Rows[0]["Report_Type"].ToString() == "Maintenance") { Maintenance_Panel.Visible = true; }
                    else { Maintenance_Panel.Visible = false; }
                    if (getRequstDt.Rows[0]["Unit_Id"].ToString() != "")
                    {
                        Unit_Div.Visible = true;
                        Building_Or_unit_DropDownList.SelectedValue = "2";
                    }
                    else
                    {
                        Unit_Div.Visible = false;
                        Building_Or_unit_DropDownList.SelectedValue = "1";
                    }

                    if (getRequstDt.Rows[0]["source"].ToString() == "عميل" || getRequstDt.Rows[0]["source"].ToString() == "Tenant") 
                    {
                        Complainte_Source_DropDownList.SelectedValue = "1";
                        Employee_Tenant_Div.Visible=true; Other_Div.Visible=false;   
                    } 
                    else if (getRequstDt.Rows[0]["source"].ToString() == "رقابة" || getRequstDt.Rows[0]["source"].ToString() == "Censorship")
                    {
                        Complainte_Source_DropDownList.SelectedValue = "2";
                        Employee_Tenant_Div.Visible = true; Other_Div.Visible = false;
                    }
                    else
                    {
                        txt_Souorce_Name.Text = getRequstDt.Rows[0]["source"].ToString();
                        Employee_Tenant_Div.Visible = false; Other_Div.Visible = true;
                    }


                    if (getRequstDt.Rows[0]["Order_Classification"].ToString() == "بلاغ" || getRequstDt.Rows[0]["Order_Classification"].ToString() == "Report") 
                    { Request_Classification_DropDownList.SelectedValue = "1"; } 
                    else { Request_Classification_DropDownList.SelectedValue = "2"; }

                    if (getRequstDt.Rows[0]["Report_Type"].ToString() == "صيانة" || getRequstDt.Rows[0]["Report_Type"].ToString() == "Maintenance") 
                    { Request_Type_DropDownList.SelectedValue = "1"; }
                    else if (getRequstDt.Rows[0]["Report_Type"].ToString() == "نظافة" || getRequstDt.Rows[0]["Report_Type"].ToString() == "Cleanliness") 
                    { Request_Type_DropDownList.SelectedValue = "2"; }
                    else { Request_Type_DropDownList.SelectedValue = "3"; }

                    if (getRequstDt.Rows[0]["Report_Direction"].ToString() == "الرقابة" || getRequstDt.Rows[0]["Report_Direction"].ToString() == "Censorship") 
                    { Order_Direction_DropDownList.SelectedValue = "1"; } 
                    else { Order_Direction_DropDownList.SelectedValue = "2"; }


                    if (getRequstDt.Rows[0]["urgent"].ToString() == "إزعاج عابر" || getRequstDt.Rows[0]["urgent"].ToString() == "Transient Nuisance") 
                    { Order_priority_DropDownList.SelectedValue = "3"; }
                    else if (getRequstDt.Rows[0]["urgent"].ToString() == "إزعاج مؤقت" || getRequstDt.Rows[0]["urgent"].ToString() == "Temporary Inconvenience") 
                    { Order_priority_DropDownList.SelectedValue = "2"; }
                    else { Order_priority_DropDownList.SelectedValue = "1"; }


                    if (getRequstDt.Rows[0]["Danger"].ToString() == "خطورة قليلة الإحتمالية" || getRequstDt.Rows[0]["Danger"].ToString() == "Low Risk Risk") 
                    { Danger_Magnitude_DropDownList.SelectedValue = "3"; }
                    else if (getRequstDt.Rows[0]["Danger"].ToString() == "خطورة على الممتلكات" || getRequstDt.Rows[0]["Danger"].ToString() == "Dangerous To Properties") 
                    { Danger_Magnitude_DropDownList.SelectedValue = "2"; }
                    else { Danger_Magnitude_DropDownList.SelectedValue = "1"; }

                    if (getRequstDt.Rows[0]["Activ"].ToString() == "معلق" || getRequstDt.Rows[0]["Activ"].ToString() == "On Hold") 
                    { Achievement_Verification_RadioButtonList.SelectedValue = "1"; }
                    else if (getRequstDt.Rows[0]["Activ"].ToString() == "تم أنجازه" || getRequstDt.Rows[0]["Activ"].ToString() == "Done") 
                    { Achievement_Verification_RadioButtonList.SelectedValue = "2"; }
                    else { Achievement_Verification_RadioButtonList.SelectedValue = "3"; }

                    Employee_Tenant_DropDownList.SelectedValue = getRequstDt.Rows[0]["Tenant_ID"].ToString();
                    Employee_Tenant_DropDownList.SelectedValue = getRequstDt.Rows[0]["Employee_ID"].ToString();
                    Building_Name_DropDownList.SelectedValue = getRequstDt.Rows[0]["building_Building_Id"].ToString();
                    Units_DropDownList.SelectedValue = getRequstDt.Rows[0]["Unit_Id"].ToString();

                    txt_Report_Date.Text = getRequstDt.Rows[0]["Date"].ToString();
                    txt_Rreport_Text.Text = getRequstDt.Rows[0]["Report_Text"].ToString();
                    txt_Inspection_Report_Description.Text = getRequstDt.Rows[0]["Report_Description"].ToString();
                    txt_precaution.Text = getRequstDt.Rows[0]["precaution"].ToString();



                    Image_Befor.Text = getRequstDt.Rows[0]["Image_Befor_FileName"].ToString();
                    Image_Befor_Pathe.Text = getRequstDt.Rows[0]["Image_Befor_Path"].ToString();

                    Image_After.Text = getRequstDt.Rows[0]["Image_After_FileName"].ToString();
                    Image_After_Pathe.Text = getRequstDt.Rows[0]["Image_After_Path"].ToString();




                    if (getRequstDt.Rows[0]["Image_Befor_FileName"].ToString() != "") { Image_Befor_Div.Visible = true; }
                    else { Image_Befor_Div.Visible = false; }

                    if (getRequstDt.Rows[0]["Image_After_FileName"].ToString() != "") { Image_After_Div.Visible = true; }
                    else { Image_After_Div.Visible = false; }





                    lbl_Link_Image_Befor.Text = getRequstDt.Rows[0]["Image_Befor_FileName"].ToString();
                    Link_Image_Befor.HRef = getRequstDt.Rows[0]["Image_Befor_Path"].ToString();
                    Link_Image_Befor.Target = "_blank";


                    lbl_Link_Image_After.Text = getRequstDt.Rows[0]["Image_After_FileName"].ToString();
                    Link_Image_After.HRef = getRequstDt.Rows[0]["Image_After_Path"].ToString();
                    Link_Image_After.Target = "_blank";

                    


                }
            }
        }
        protected void Complainte_Source_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Complainte_Source_DropDownList.SelectedValue == "1")
            {
                Employee_Tenant_Div.Visible = true; Other_Div.Visible = false;
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Employee_Tenant.Text = "Tenant Name";
                    //Fill Employee / Tenant DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Employee_Tenant_DropDownList, "Tenants_English_Name", "Tenants_ID");
                    Employee_Tenant_DropDownList.Items.Insert(0, "..............");
                }
                else
                {
                    lbl_Employee_Tenant.Text = "اسم المستاجر";
                    //Fill Employee / Tenant DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Employee_Tenant_DropDownList, "Tenants_Arabic_Name", "Tenants_ID");
                    Employee_Tenant_DropDownList.Items.Insert(0, "..............");
                }

            }
            else if (Complainte_Source_DropDownList.SelectedValue == "2")
            {
                Employee_Tenant_Div.Visible = true; Other_Div.Visible = false;
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Employee_Tenant.Text = "Employee Name";
                    //Fill Employee / Tenant DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Employee_Tenant_DropDownList, "Employee_English_name", "Employee_Id");
                    Employee_Tenant_DropDownList.Items.Insert(0, "..............");
                }
                else
                {
                    lbl_Employee_Tenant.Text = "اسم الموظف";
                    //Fill Employee / Tenant DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Employee_Tenant_DropDownList, "Employee_Arabic_name", "Employee_Id");
                    Employee_Tenant_DropDownList.Items.Insert(0, "..............");
                }
            }
            else
            {
                Employee_Tenant_Div.Visible = false; Other_Div.Visible = true;
                Building_Or_unit_DropDownList.Enabled = true;
            }
        }

        protected void Building_Or_unit_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Complainte_Source_DropDownList.SelectedValue == "1" && Building_Or_unit_DropDownList.SelectedValue == "1")
            {
                _sqlCon.Open();
                string spName = "maintenance_request_site";
                DataTable dt = new DataTable();
                MySqlCommand sqlCmd = new MySqlCommand(spName, _sqlCon);
                MySqlDataAdapter sqlDa = new MySqlDataAdapter(sqlCmd);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@ID", Employee_Tenant_DropDownList.SelectedValue);

                sqlDa.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        Building_Name_DropDownList.DataSource = dt;
                        Building_Name_DropDownList.DataTextField = "Building_English_Name";
                        Building_Name_DropDownList.DataValueField = "Building_Id";
                        Building_Name_DropDownList.DataBind();
                        Building_Name_DropDownList.Items.Insert(0, "..............");
                    }
                    else
                    {
                        Building_Name_DropDownList.DataSource = dt;
                        Building_Name_DropDownList.DataTextField = "Building_Arabic_Name";
                        Building_Name_DropDownList.DataValueField = "Building_Id";
                        Building_Name_DropDownList.DataBind();
                        Building_Name_DropDownList.Items.Insert(0, "..............");
                    }
                }
                Unit_Div.Visible = false;
            }
            else if (Complainte_Source_DropDownList.SelectedValue == "1" && Building_Or_unit_DropDownList.SelectedValue == "2")
            {
                _sqlCon.Open();
                string spName = "maintenance_request_site";
                DataTable dt = new DataTable();
                MySqlCommand sqlCmd = new MySqlCommand(spName, _sqlCon);
                MySqlDataAdapter sqlDa = new MySqlDataAdapter(sqlCmd);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@ID", Employee_Tenant_DropDownList.SelectedValue);

                sqlDa.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        Building_Name_DropDownList.DataSource = dt;
                        Building_Name_DropDownList.DataTextField = "Building_English_Name";
                        Building_Name_DropDownList.DataValueField = "Building_Id";
                        Building_Name_DropDownList.DataBind();
                        Building_Name_DropDownList.Items.Insert(0, "..............");
                    }
                    else
                    {
                        Building_Name_DropDownList.DataSource = dt;
                        Building_Name_DropDownList.DataTextField = "Building_Arabic_Name";
                        Building_Name_DropDownList.DataValueField = "Building_Id";
                        Building_Name_DropDownList.DataBind();
                        Building_Name_DropDownList.Items.Insert(0, "..............");
                    }
                }
                Unit_Div.Visible = true;
            }
            else if (Complainte_Source_DropDownList.SelectedValue == "2" && Building_Or_unit_DropDownList.SelectedValue == "1")
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //Fill Building DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "..............");
                }
                else
                {
                    //Fill Building DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "..............");
                }
                Unit_Div.Visible = false;
            }
            else
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //Fill Building DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "..............");
                }
                else
                {
                    //Fill Building DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "..............");
                }
                Unit_Div.Visible = true;
            }
        }
        protected void Building_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Complainte_Source_DropDownList.SelectedValue == "1" && Building_Or_unit_DropDownList.SelectedValue == "2")
            {
                _sqlCon.Open();
                string spName = "maintenance_request_site";
                DataTable dt = new DataTable();
                MySqlCommand sqlCmd = new MySqlCommand(spName, _sqlCon);
                MySqlDataAdapter sqlDa = new MySqlDataAdapter(sqlCmd);
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.AddWithValue("@ID", Employee_Tenant_DropDownList.SelectedValue);
                sqlDa.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Units_DropDownList.DataSource = dt;
                    Units_DropDownList.DataTextField = "Unit_Number";
                    Units_DropDownList.DataValueField = "units_Unit_ID";
                    Units_DropDownList.DataBind();
                    Units_DropDownList.Items.Insert(0, "..............");
                }
            }
            else if (Complainte_Source_DropDownList.SelectedValue == "2" && Building_Or_unit_DropDownList.SelectedValue == "2")
            {
                //Fill units Name DropDownList
                Helper.LoadDropDownList(
                    "SELECT * FROM units where building_Building_Id = '" + Building_Name_DropDownList.SelectedValue + "'",
                    _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
                Units_DropDownList.Items.Insert(0, "..............");
            }
        }
        //******************  Report_Date ***************************************************
        protected void Report_Date_Calendar_SelectionChanged1(object sender, EventArgs e)
        {
            txt_Report_Date.Text = Report_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Report_Date.Text != "")
            { Report_Date_divCalendar.Visible = false; ImageButton1.Visible = false; }
        }
        protected void Date_Chosee_Click(object sender, EventArgs e)
        { Report_Date_divCalendar.Visible = true; ImageButton1.Visible = true; }
        protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        { Report_Date_divCalendar.Visible = false; ImageButton1.Visible = false; }
        //******************  Maintenance_Panel ***************************************************
        protected void Request_Type_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Request_Type_DropDownList.SelectedValue == "1") { Maintenance_Panel.Visible = true; } else { Maintenance_Panel.Visible = false; }
        }

        protected void Maintenance_Type_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Maintenance_Type_ID = Maintenance_Type_DropDownList.SelectedValue;
            if (Session["Langues"].ToString() == "1")
            {
                //Fill Maintenance_Type_DropDownList
                Helper.LoadDropDownList("SELECT * FROM maintenance_categoty where Main_Categoty='" + Maintenance_Type_ID + "'", _sqlCon, Maintenance_SubType_DropDownList, "Categoty_EN", "Categoty_Id");
                Maintenance_SubType_DropDownList.Items.Insert(0, "..............");
            }
            else
            {
                //Fill Maintenance_Type_DropDownList
                Helper.LoadDropDownList("SELECT * FROM maintenance_categoty where Main_Categoty='" + Maintenance_Type_ID + "'", _sqlCon, Maintenance_SubType_DropDownList, "Categoty_AR", "Categoty_Id");
                Maintenance_SubType_DropDownList.Items.Insert(0, "..............");
            }
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
        }
        //******************  Start_Date ***************************************************
        protected void Start_Date_Calendar_SelectionChanged2(object sender, EventArgs e)
        {
            txt_Start_Date.Text = Start_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Start_Date.Text != "")
            {
                Start_Date_Div.Visible = false;
                ImageButton2.Visible = false;
            }
        }

        protected void Start_Date_Chosee_Click(object sender, EventArgs e)
        {
            Start_Date_Div.Visible = true;
            ImageButton2.Visible = true;
        }

        protected void ImageButton2_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Start_Date_Div.Visible = false;
            ImageButton2.Visible = false;
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

        protected void btn_Back_To_Request_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaint_report_request_List.aspx");
        }

        protected void Maintenance_SubType_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Building_Or_unit_DropDownList.SelectedValue == "1")
            {
                string Building_ID = Building_Name_DropDownList.SelectedValue;
                string MST = Maintenance_SubType_DropDownList.SelectedValue;
                if (Session["Langues"].ToString() == "1")
                {
                    //Fill Asset_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM assets Where Building_ID = '" + Building_ID + "' And maintenance_categoty_Categoty_Id = '" + MST + "'", _sqlCon, Asset_DropDownList, "Assets_English_Name", "Assets_Id");
                    Asset_DropDownList.Items.Insert(0, "..............");
                }
                else
                {
                    //Fill Asset_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM assets Where Building_ID = '" + Building_ID + "' And maintenance_categoty_Categoty_Id = '" + MST + "'", _sqlCon, Asset_DropDownList, "Assets_Arabic_Name", "Assets_Id");
                    Asset_DropDownList.Items.Insert(0, "..............");
                }
            }
            else if (Building_Or_unit_DropDownList.SelectedValue == "2")
            {


                string Unitg_ID = Units_DropDownList.SelectedValue;
                string MST = Maintenance_SubType_DropDownList.SelectedValue;



                if (Session["Langues"].ToString() == "1")
                {
                    //Fill Asset_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM assets Where Unit_Id = '" + Unitg_ID + "' And maintenance_categoty_Categoty_Id = '" + MST + "'", _sqlCon, Asset_DropDownList, "Assets_English_Name", "Assets_Id");
                    Asset_DropDownList.Items.Insert(0, "..............");
                }
                else
                {
                    //Fill Asset_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM assets Where Unit_Id = '" + Unitg_ID + "' And maintenance_categoty_Categoty_Id = '" + MST + "'", _sqlCon, Asset_DropDownList, "Assets_Arabic_Name", "Assets_Id");
                    Asset_DropDownList.Items.Insert(0, "..............");
                }
            }
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
        }
        protected void Employee_Tenant_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Building_Or_unit_DropDownList.Enabled = true;
        }

        protected void Asset_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
            _sqlCon.Open();
            string maintenance_request_Id = Asset_DropDownList.SelectedValue;
            using (MySqlCommand maintenance_requestDetailsCmd = new MySqlCommand("Asset_Detail", _sqlCon))
            {
                maintenance_requestDetailsCmd.CommandType = CommandType.StoredProcedure;
                maintenance_requestDetailsCmd.Parameters.AddWithValue("@Id", maintenance_request_Id);
                using (MySqlDataAdapter maintenance_requestDetailsSda = new MySqlDataAdapter(maintenance_requestDetailsCmd))
                {
                    DataTable maintenance_requestDetailsDt = new DataTable();
                    maintenance_requestDetailsSda.Fill(maintenance_requestDetailsDt);
                    if (maintenance_requestDetailsDt.Rows[0]["Contractor_Waranty_Period"].ToString() == "" && maintenance_requestDetailsDt.Rows[0]["Waranty_Period"].ToString() == "")
                    {
                        Maintenance_Guarantor_DropDownList.Items.Insert(0, "..............");
                    }
                    else if (maintenance_requestDetailsDt.Rows[0]["Contractor_Waranty_Period"].ToString() != "" && maintenance_requestDetailsDt.Rows[0]["Waranty_Period"].ToString() == "")
                    {
                        DateTime Today = DateTime.Now;
                        DateTime Purchase_Date = Convert.ToDateTime(maintenance_requestDetailsDt.Rows[0]["Purchase_Date"].ToString());
                        int Contractor_Waranty_Period = Convert.ToInt32(maintenance_requestDetailsDt.Rows[0]["Contractor_Waranty_Period"].ToString());
                        int difference_between_dates = (int)(Today - Purchase_Date).TotalDays;
                        int Remaining_Day = Contractor_Waranty_Period - difference_between_dates;
                        if (Remaining_Day > 0)
                        {
                            Maintenance_Guarantor_DropDownList.SelectedValue = "1";
                            Maintenance_Guarantor_DropDownList.Enabled = false;
                        }
                        else
                        {
                            Maintenance_Guarantor_DropDownList.Items.Insert(0, "..............");
                        }
                    }
                    else if (maintenance_requestDetailsDt.Rows[0]["Contractor_Waranty_Period"].ToString() == "" && maintenance_requestDetailsDt.Rows[0]["Waranty_Period"].ToString() != "")
                    {
                        DateTime Today = DateTime.Now;
                        DateTime Waranty_Start_Date = Convert.ToDateTime(maintenance_requestDetailsDt.Rows[0]["Waranty_Start_Date"].ToString());
                        int Waranty_Period = Convert.ToInt32(maintenance_requestDetailsDt.Rows[0]["Waranty_Period"].ToString());
                        int difference_between_dates = (int)(Today - Waranty_Start_Date).TotalDays;
                        int Remaining_Day = Waranty_Period - difference_between_dates;
                        if (Remaining_Day > 0)
                        {
                            Maintenance_Guarantor_DropDownList.SelectedValue = "2";
                            Maintenance_Guarantor_DropDownList.Enabled = false;
                        }
                        else
                        {
                            Maintenance_Guarantor_DropDownList.Items.Insert(0, "..............");
                        }
                    }
                    else
                    {
                        DateTime Today = DateTime.Now;
                        DateTime Purchase_Date = Convert.ToDateTime(maintenance_requestDetailsDt.Rows[0]["Purchase_Date"].ToString());
                        int Contractor_Waranty_Period = Convert.ToInt32(maintenance_requestDetailsDt.Rows[0]["Contractor_Waranty_Period"].ToString());
                        int difference_between_dates = (int)(Today - Purchase_Date).TotalDays;
                        int Remaining_Day = Contractor_Waranty_Period - difference_between_dates;
                        if (Remaining_Day > 0)
                        {
                            Maintenance_Guarantor_DropDownList.SelectedValue = "1";
                            Maintenance_Guarantor_DropDownList.Enabled = false;
                        }
                        else
                        {
                            DateTime Waranty_Start_Date = Convert.ToDateTime(maintenance_requestDetailsDt.Rows[0]["Waranty_Start_Date"].ToString());
                            int Waranty_Period = Convert.ToInt32(maintenance_requestDetailsDt.Rows[0]["Waranty_Period"].ToString());
                            int difference_between_Dates = (int)(Today - Waranty_Start_Date).TotalDays;
                            int Remaining_Days = Waranty_Period - difference_between_Dates;
                            if (Remaining_Days > 0)
                            {
                                Maintenance_Guarantor_DropDownList.SelectedValue = "2";
                                Maintenance_Guarantor_DropDownList.Enabled = false;
                            }
                            else
                            {
                                Maintenance_Guarantor_DropDownList.Items.Insert(0, "..............");
                            }
                        }
                    }
                }
            }
            _sqlCon.Close();
        }
        private void BindGrid_Contract_Cheque_List()
        {
            _sqlCon.Open();
            string ContractId = Request.QueryString["Id"];
            using (MySqlCommand Contract_ChequesCmd = new MySqlCommand("maintenance_request_List", _sqlCon))
            {
                Contract_ChequesCmd.CommandType = CommandType.StoredProcedure;
                Contract_ChequesCmd.Parameters.AddWithValue("@Id", ContractId);
                MySqlDataAdapter Contract_ChequesSda = new MySqlDataAdapter(Contract_ChequesCmd);

                DataTable Contract_ChequesDt = new DataTable();
                Contract_ChequesSda.Fill(Contract_ChequesDt);
                Contract_ChequesCmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                Contract_ChequesSda.Fill(dt);
                Maintenance_List.DataSource = dt;
                Maintenance_List.DataBind();
            }
            _sqlCon.Close();
        }


        

        

        protected void Maintenance_List_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt16(Maintenance_List.DataKeys[e.RowIndex].Values["Maintenance_Request_ID"].ToString());
            _sqlCon.Open();
            MySqlCommand cmd = new MySqlCommand("delete from maintenance_request where Maintenance_Request_ID =@Maintenance_Request_ID", _sqlCon);
            cmd.Parameters.AddWithValue("Maintenance_Request_ID", id);
            cmd.ExecuteNonQuery();
            _sqlCon.Close();
            BindGrid_Contract_Cheque_List();
        }

        protected void btn_Add_Request_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Page.IsValid)
                {
                    string RequestId = Request.QueryString["Id"];
                    //Fill The Request Table With Data From View
                    string UpdateRequestQuery = "UPDATE complaint_report_request SET " +
                                                   "source = @source ," +
                                                   "Tenant_ID = @Tenant_ID, " +
                                                   "Employee_ID = @Employee_ID, " +
                                                   "Order_Classification = @Order_Classification , " +
                                                   "Report_Type = @Report_Type, " +
                                                   "Report_Direction = @Report_Direction , " +
                                                   "priority_Danger = @priority_Danger , " +
                                                   "Date = @Date , " +
                                                   "Report_Text = @Report_Text , " +
                                                   "Report_Description = @Report_Description , " +
                                                   "Activ = @Activ , " +
                                                   "urgent = @urgent ," +
                                                   "Danger = @Danger ," +
                                                   "building_Building_Id = @building_Building_Id ," +
                                                   "Unit_Id = @Unit_Id ," +


                                                   "Image_Befor_FileName = @Image_Befor_FileName , " +
                                                   "Image_Befor_Path = @Image_Befor_Path , " +
                                                   "Image_After_FileName = @Image_After_FileName , " +
                                                   "Image_After_Path = @Image_After_Path " +



                                                   "WHERE Complaint_Report_Request_Id = @ID ";
                    _sqlCon.Open();
                    using (MySqlCommand UpdateRequestCmd = new MySqlCommand(UpdateRequestQuery, _sqlCon))
                    {
                        UpdateRequestCmd.Parameters.AddWithValue("@ID", RequestId);
                        string Priority = Order_priority_DropDownList.SelectedValue;
                        string Danger = Danger_Magnitude_DropDownList.SelectedValue;

                        //Fill The Database with All DropDownLists Items



                        //Fill The Database with All DropDownLists Items
                        if (Complainte_Source_DropDownList.SelectedValue == "1")
                        {
                            UpdateRequestCmd.Parameters.AddWithValue("@source", Complainte_Source_DropDownList.SelectedItem.Text.Trim());
                        }
                        else if (Complainte_Source_DropDownList.SelectedValue == "2")
                        {
                            UpdateRequestCmd.Parameters.AddWithValue("@source", Complainte_Source_DropDownList.SelectedItem.Text.Trim());
                        }
                        else
                        {
                            UpdateRequestCmd.Parameters.AddWithValue("@source", txt_Souorce_Name.Text);
                        }




                        if (Building_Or_unit_DropDownList.SelectedValue == "1")
                        {
                            UpdateRequestCmd.Parameters.AddWithValue("@building_Building_Id", Building_Name_DropDownList.SelectedValue);
                            UpdateRequestCmd.Parameters.AddWithValue("@Unit_Id", "");
                        }
                        else
                        {
                            UpdateRequestCmd.Parameters.AddWithValue("@building_Building_Id", Building_Name_DropDownList.SelectedValue);
                            UpdateRequestCmd.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
                        }

                        UpdateRequestCmd.Parameters.AddWithValue("@Order_Classification", Request_Classification_DropDownList.SelectedItem.Text.Trim());
                        UpdateRequestCmd.Parameters.AddWithValue("@Report_Type", Request_Type_DropDownList.SelectedItem.Text.Trim());
                        UpdateRequestCmd.Parameters.AddWithValue("@Report_Direction", Order_Direction_DropDownList.SelectedItem.Text.Trim());
                        UpdateRequestCmd.Parameters.AddWithValue("@urgent", Order_priority_DropDownList.SelectedItem.Text.Trim());
                        UpdateRequestCmd.Parameters.AddWithValue("@Danger", Danger_Magnitude_DropDownList.SelectedItem.Text.Trim());
                        if (Priority == "1" && Danger == "1")
                        { UpdateRequestCmd.Parameters.AddWithValue("@priority_Danger", "1"); }
                        else if (Priority == "1" && Danger == "2")
                        { UpdateRequestCmd.Parameters.AddWithValue("@priority_Danger", "1"); }
                        else if (Priority == "1" && Danger == "3")
                        { UpdateRequestCmd.Parameters.AddWithValue("@priority_Danger", "2"); }


                        else if (Priority == "2" && Danger == "1")
                        { UpdateRequestCmd.Parameters.AddWithValue("@priority_Danger", "1"); }
                        else if (Priority == "2" && Danger == "2")
                        { UpdateRequestCmd.Parameters.AddWithValue("@priority_Danger", "2"); }
                        else if (Priority == "2" && Danger == "3")
                        { UpdateRequestCmd.Parameters.AddWithValue("@priority_Danger", "3"); }


                        else if (Priority == "3" && Danger == "1")
                        { UpdateRequestCmd.Parameters.AddWithValue("@priority_Danger", "2"); }
                        else if (Priority == "3" && Danger == "2")
                        { UpdateRequestCmd.Parameters.AddWithValue("@priority_Danger", "3"); }
                        else if (Priority == "3" && Danger == "3")
                        { UpdateRequestCmd.Parameters.AddWithValue("@priority_Danger", "3"); }


                        UpdateRequestCmd.Parameters.AddWithValue("@Date", txt_Report_Date.Text);
                        UpdateRequestCmd.Parameters.AddWithValue("@Report_Text", txt_Rreport_Text.Text);
                        UpdateRequestCmd.Parameters.AddWithValue("@Report_Description", txt_Inspection_Report_Description.Text);
                        UpdateRequestCmd.Parameters.AddWithValue("@precaution", txt_precaution.Text);
                        UpdateRequestCmd.Parameters.AddWithValue("@Activ", Achievement_Verification_RadioButtonList.SelectedItem.Text.Trim());

                        if (Complainte_Source_DropDownList.SelectedValue == "1")
                        {
                            UpdateRequestCmd.Parameters.AddWithValue("@Tenant_ID", Employee_Tenant_DropDownList.SelectedValue);
                            UpdateRequestCmd.Parameters.AddWithValue("@Employee_ID", "");
                        }
                        else if (Complainte_Source_DropDownList.SelectedValue == "2")
                        {
                            UpdateRequestCmd.Parameters.AddWithValue("@Tenant_ID", "");
                            UpdateRequestCmd.Parameters.AddWithValue("@Employee_ID", Employee_Tenant_DropDownList.SelectedValue);
                        }
                        else
                        {
                            UpdateRequestCmd.Parameters.AddWithValue("@Tenant_ID", "");
                            UpdateRequestCmd.Parameters.AddWithValue("@Employee_ID", "");
                        }




                        if (Image_Befor_FileUpload.HasFile)
                        {
                            string fileName1 = Path.GetFileName(Image_Befor_FileUpload.PostedFile.FileName);
                            Image_Befor_FileUpload.PostedFile.SaveAs( Server.MapPath("/English/Main_Application/Maintenance_Image/") + fileName1);
                            UpdateRequestCmd.Parameters.AddWithValue("@Image_Befor_FileName", fileName1);
                            UpdateRequestCmd.Parameters.AddWithValue("@Image_Befor_Path", "/English/Main_Application/Maintenance_Image/" + fileName1);
                        }
                        else
                        {
                            UpdateRequestCmd.Parameters.AddWithValue("@Image_Befor_FileName", Image_Befor.Text);
                            UpdateRequestCmd.Parameters.AddWithValue("@Image_Befor_Path", Image_Befor_Pathe.Text);
                        }

                        //**********************************************************************************************************************************************************
                        if (Image_After_FileUpload.HasFile)
                        {
                            string fileName1 = Path.GetFileName(Image_After_FileUpload.PostedFile.FileName);
                            Image_After_FileUpload.PostedFile.SaveAs( Server.MapPath("/English/Main_Application/Maintenance_Image/") + fileName1);
                            UpdateRequestCmd.Parameters.AddWithValue("@Image_After_FileName", fileName1);
                            UpdateRequestCmd.Parameters.AddWithValue("@Image_After_Path", "/English/Main_Application/Maintenance_Image/" + fileName1);
                        }
                        else
                        {
                            UpdateRequestCmd.Parameters.AddWithValue("@Image_After_FileName", Image_After.Text);
                            UpdateRequestCmd.Parameters.AddWithValue("@Image_After_Path", Image_After_Pathe.Text);
                        }


                        UpdateRequestCmd.ExecuteNonQuery();
                        _sqlCon.Close();
                    }
                    if (Session["Langues"].ToString() == "1") { lbl_Success_Add_New_complaint_repor_Request.Text = "Request Edited Successfully"; }
                    else { lbl_Success_Add_New_complaint_repor_Request.Text = "تم تعديل الطلب بنجاح"; }
                        
                }
            }
        }

        protected void btn_Edit_Request_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaint_report_request_List.aspx");
        }

        protected void Add_Maintenane_Click(object sender, ImageClickEventArgs e)
        {
            string complaint_reportId = Request.QueryString["Id"];
            string Add_maintenance_In_Edit_omplaint_repor =
                                                "Insert Into maintenance_request (" +
                                                "complaint_report_request_Complaint_Report_Request_Id , " +
                                                "maintenance_categoty_Categoty_Id  , " +
                                                "assets_Assets_Id        , " +
                                                "Start_Date ," +
                                                "End_Date       , " +
                                                "Cost         , " +
                                                "Activ , " +
                                                "Cost_Direction , " +
                                                "Executing_Agency , " +
                                                "Technical , " +
                                                "Watcher ) " +
                                                "VALUES( " +
                                                "@complaint_report_request_Complaint_Report_Request_Id , " +
                                                "@maintenance_categoty_Categoty_Id  , " +
                                                "@assets_Assets_Id        , " +
                                                "@Start_Date ," +
                                                "@End_Date       , " +
                                                "@Cost         , " +
                                                "@Activ , " +
                                                "@Cost_Direction , " +
                                                "@Executing_Agency , " +
                                                "@Technical , " +
                                                "@Watcher ) ";
            _sqlCon.Open();
            using (MySqlCommand Add_Maintenance_In_Edit_complaint_repor_Cmd = new MySqlCommand(Add_maintenance_In_Edit_omplaint_repor, _sqlCon))
            {
                Add_Maintenance_In_Edit_complaint_repor_Cmd.Parameters.AddWithValue("@complaint_report_request_Complaint_Report_Request_Id", complaint_reportId);
                Add_Maintenance_In_Edit_complaint_repor_Cmd.Parameters.AddWithValue("@maintenance_categoty_Categoty_Id", Maintenance_SubType_DropDownList.SelectedValue);
                Add_Maintenance_In_Edit_complaint_repor_Cmd.Parameters.AddWithValue("@assets_Assets_Id", Asset_DropDownList.SelectedValue);
                Add_Maintenance_In_Edit_complaint_repor_Cmd.Parameters.AddWithValue("@Start_Date", txt_Start_Date.Text);
                Add_Maintenance_In_Edit_complaint_repor_Cmd.Parameters.AddWithValue("@End_Date", txt_End_Date.Text);
                Add_Maintenance_In_Edit_complaint_repor_Cmd.Parameters.AddWithValue("@Cost", txt_Cost.Text);
                Add_Maintenance_In_Edit_complaint_repor_Cmd.Parameters.AddWithValue("@Activ", Maintenance_Status_DropDownList.SelectedItem.Text.Trim());
                Add_Maintenance_In_Edit_complaint_repor_Cmd.Parameters.AddWithValue("@Cost_Direction", Maintenance_Guarantor_DropDownList.SelectedItem.Text.Trim());
                Add_Maintenance_In_Edit_complaint_repor_Cmd.Parameters.AddWithValue("@Executing_Agency", Executing_Agency_DropDownList.SelectedItem.Text.Trim());
                Add_Maintenance_In_Edit_complaint_repor_Cmd.Parameters.AddWithValue("@Technical", Technical_DropDownList.SelectedValue);
                Add_Maintenance_In_Edit_complaint_repor_Cmd.Parameters.AddWithValue("@Watcher", Observer_DropDownList.SelectedValue);

                Add_Maintenance_In_Edit_complaint_repor_Cmd.ExecuteNonQuery();
                _sqlCon.Close();
            }
            BindGrid_Contract_Cheque_List();

            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
        }

        protected void Delete_Request_Click(object sender, EventArgs e)
        {
            Delete_Div.Visible= true;
            try
            {
                string id = Request.QueryString["Id"];
                _sqlCon.Open();
                string quary1 = "DELETE FROM complaint_report_request WHERE Complaint_Report_Request_Id=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(quary1, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", id);
                mySqlCmd.ExecuteNonQuery();
                _sqlCon.Close();

                Response.Redirect("complaint_report_request_List.aspx");
            }
            catch
            {
                if (Session["Langues"].ToString() == "1") { Response.Write(@"<script language='javascript'>alert('This request cannot be deleted because it contains maintenance requests')</script>"); }
                else { Response.Write(@"<script language='javascript'>alert('لايمكن حذف هذا الطلب لأنو يحتوي على طلبات صيانة')</script>"); }
                    
            }
        }

        protected void Btn_Remove_Link_Image_Befor_Click(object sender, ImageClickEventArgs e)
        {
            string Uint_Id = Request.QueryString["ID"];

            string Remove_Unit_Att_Query = "UPDATE complaint_report_request SET " +
                                            " Image_Befor_FileName=@Image_Befor_FileName ," +
                                            " Image_Befor_Path=@Image_Befor_Path  " +
                                            "WHERE Complaint_Report_Request_Id=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Unit_Att_Cmd = new MySqlCommand(Remove_Unit_Att_Query, _sqlCon);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@ID", Uint_Id);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_Befor_FileName", "");
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_Befor_Path", "");
            Remove_Unit_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_complaint_report_request.aspx?Id=" + Uint_Id);
        }

        protected void Btn_Remove_Link_Image_After_Click(object sender, ImageClickEventArgs e)
        {
            string Uint_Id = Request.QueryString["ID"];

            string Remove_Unit_Att_Query = "UPDATE complaint_report_request SET " +
                                            " Image_After_FileName=@Image_After_FileName ," +
                                            " Image_After_Path=@Image_After_Path  " +
                                            "WHERE Complaint_Report_Request_Id=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Unit_Att_Cmd = new MySqlCommand(Remove_Unit_Att_Query, _sqlCon);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@ID", Uint_Id);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_After_FileName", "");
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_After_Path", "");
            Remove_Unit_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_complaint_report_request.aspx?Id=" + Uint_Id);
        }












        protected void language()
        {

            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            _sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_maintenance", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //Fill Employee / Tenant DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Employee_Tenant_DropDownList, "Tenants_English_Name", "Tenants_ID");
                    Employee_Tenant_DropDownList.Items.Insert(0, "...............");

                    //Fill Technical_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Technical_DropDownList, "Employee_English_name", "Employee_Id");
                    Technical_DropDownList.Items.Insert(0, "...............");

                    //Fill Technical_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Observer_DropDownList, "Employee_English_name", "Employee_Id");
                    Observer_DropDownList.Items.Insert(0, "................");

                    Building_Or_unit_DropDownList.Items.Insert(0, "................");
                    Request_Classification_DropDownList.Items.Insert(0, "................");
                    Request_Type_DropDownList.Items.Insert(0, "................");
                    Order_priority_DropDownList.Items.Insert(0, "................");
                    Danger_Magnitude_DropDownList.Items.Insert(0, "................");
                    Maintenance_Status_DropDownList.Items.Insert(0, "................");
                    Maintenance_Guarantor_DropDownList.Items.Insert(0, "................");
                    Executing_Agency_DropDownList.Items.Insert(0, "................");

                    //Fill Maintenance_Type_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM maintenance_categoty Where Main_Categoty = 0", _sqlCon, Maintenance_Type_DropDownList, "Categoty_EN", "Categoty_Id");
                    Maintenance_Type_DropDownList.Items.Insert(0, "................");

                    //Fill Maintenance_Type_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM maintenance_categoty Where Main_Categoty != 0", _sqlCon, Maintenance_SubType_DropDownList, "Categoty_EN", "Categoty_Id");
                    Maintenance_SubType_DropDownList.Items.Insert(0, "................");

                    //Fill Asset_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM assets", _sqlCon, Asset_DropDownList, "Assets_English_Name", "Assets_Id");
                    Asset_DropDownList.Items.Insert(0, "................");


                    //Fill Complainte_Source_DropDownList
                    Complainte_Source_DropDownList.Items.Clear();
                    Complainte_Source_DropDownList.Items.Add(new ListItem("Tenant", "1"));
                    Complainte_Source_DropDownList.Items.Add(new ListItem("Censorship", "2"));
                    Complainte_Source_DropDownList.Items.Add(new ListItem("Other", "3"));
                    Complainte_Source_DropDownList.SelectedValue = "1";

                    //Get Building_Or_unit_DropDownList 
                    Building_Or_unit_DropDownList.Items.Clear();
                    Building_Or_unit_DropDownList.Items.Add(new ListItem("Building", "1"));
                    Building_Or_unit_DropDownList.Items.Add(new ListItem("Unit", "2"));
                    Building_Or_unit_DropDownList.Items.Insert(0, "...............");

                    //Get Request_Classification_DropDownList 
                    Request_Classification_DropDownList.Items.Clear();
                    Request_Classification_DropDownList.Items.Add(new ListItem("Report", "1"));
                    Request_Classification_DropDownList.Items.Add(new ListItem("Complaint", "2"));
                    Request_Classification_DropDownList.Items.Insert(0, "...............");

                    //Get Request_Type_DropDownList 
                    Request_Type_DropDownList.Items.Clear();
                    Request_Type_DropDownList.Items.Add(new ListItem("Maintenance", "1"));
                    Request_Type_DropDownList.Items.Add(new ListItem("Cleanliness", "2"));
                    Request_Type_DropDownList.Items.Add(new ListItem("Breaking The Rules", "3"));
                    Request_Type_DropDownList.Items.Insert(0, "...............");

                    //Get Order_Direction_DropDownList 
                    Order_Direction_DropDownList.Items.Clear();
                    Order_Direction_DropDownList.Items.Add(new ListItem("Censorship", "1"));
                    Order_Direction_DropDownList.Items.Add(new ListItem("Customer Affairs", "2"));
                    Order_Direction_DropDownList.Items.Insert(0, "...............");

                    //Get Order_priority_DropDownList 
                    Order_priority_DropDownList.Items.Clear();
                    Order_priority_DropDownList.Items.Add(new ListItem("Disable", "1"));
                    Order_priority_DropDownList.Items.Add(new ListItem("Temporary Inconvenience", "2"));
                    Order_priority_DropDownList.Items.Add(new ListItem("Transient Nuisance", "3"));
                    Order_priority_DropDownList.Items.Insert(0, "...............");

                    //Get Danger_Magnitude_DropDownList 
                    Danger_Magnitude_DropDownList.Items.Clear();
                    Danger_Magnitude_DropDownList.Items.Add(new ListItem("Dangerous To Life", "1"));
                    Danger_Magnitude_DropDownList.Items.Add(new ListItem("Dangerous To Properties", "2"));
                    Danger_Magnitude_DropDownList.Items.Add(new ListItem("Low Risk Risk", "3"));
                    Danger_Magnitude_DropDownList.Items.Insert(0, "...............");

                    //Get Achievement_Verification_RadioButtonList 
                    Achievement_Verification_RadioButtonList.Items.Clear();
                    Achievement_Verification_RadioButtonList.Items.Add(new ListItem("On Hold", "1"));
                    Achievement_Verification_RadioButtonList.Items.Add(new ListItem("Done", "2"));
                    Achievement_Verification_RadioButtonList.Items.Add(new ListItem("Under The Procedure", "3"));

                    //Get Maintenance_Status_DropDownList 
                    Maintenance_Status_DropDownList.Items.Clear();
                    Maintenance_Status_DropDownList.Items.Add(new ListItem("On Hold", "1"));
                    Maintenance_Status_DropDownList.Items.Add(new ListItem("Under The Procedure", "2"));
                    Maintenance_Status_DropDownList.Items.Add(new ListItem("Done", "3"));
                    Maintenance_Status_DropDownList.Items.Insert(0, "...............");

                    //Get Maintenance_Guarantor_DropDownList   // هون
                    Maintenance_Guarantor_DropDownList.Items.Clear();
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("Contractor", "1"));
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("Supplier", "2"));
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("Owner", "3"));
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("Client", "4"));
                    Maintenance_Guarantor_DropDownList.Items.Insert(0, "...............");

                    //Get Executing_Agency_DropDownList 
                    Executing_Agency_DropDownList.Items.Clear();
                    Executing_Agency_DropDownList.Items.Add(new ListItem("Maintenance Team", "1"));
                    Executing_Agency_DropDownList.Items.Add(new ListItem("Contractor", "2"));
                    Executing_Agency_DropDownList.Items.Add(new ListItem("Supplier", "3"));
                    Executing_Agency_DropDownList.Items.Insert(0, "...............");



                    lbl_titel_Add_New_Maintenance.Text = Dt.Rows[36]["EN"].ToString();
                    lbl_Complainte_Source.Text = Dt.Rows[2]["EN"].ToString();
                    lbl_Employee_Tenant.Text = Dt.Rows[3]["EN"].ToString();
                    lbl_Souorce_Name.Text = Dt.Rows[4]["EN"].ToString();
                    lbl_Building_Or_unit.Text = Dt.Rows[5]["EN"].ToString();
                    lbl_Request_Classification.Text = Dt.Rows[6]["EN"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[7]["EN"].ToString();
                    lbl_Units.Text = Dt.Rows[8]["EN"].ToString();
                    lbl_Request_Type.Text = Dt.Rows[9]["EN"].ToString();
                    lbl_Order_Direction.Text = Dt.Rows[10]["EN"].ToString();
                    lbl_Rreport_Text.Text = Dt.Rows[11]["EN"].ToString();
                    lbl_Inspection_Report_Description.Text = Dt.Rows[12]["EN"].ToString();
                    lbl_Order_priority.Text = Dt.Rows[13]["EN"].ToString();
                    lbl_Danger_Magnitude.Text = Dt.Rows[14]["EN"].ToString();
                    lbl_Report_Date.Text = Dt.Rows[15]["EN"].ToString();
                    lbl_Image_One.Text = Dt.Rows[16]["EN"].ToString();
                    lbl_Image_Two.Text = Dt.Rows[17]["EN"].ToString();
                    lbl_Achievement_Verification.Text = Dt.Rows[18]["EN"].ToString();
                    lbl_precaution.Text = Dt.Rows[19]["EN"].ToString();
                    Add_Maintenace.Text = Dt.Rows[20]["EN"].ToString();
                    lbl_Maintenance_Status.Text = Dt.Rows[21]["EN"].ToString();
                    lbl_Maintenance_Type.Text = Dt.Rows[22]["EN"].ToString();
                    lbl_Maintenance_SubType.Text = Dt.Rows[23]["EN"].ToString();
                    lbl_Asset.Text = Dt.Rows[24]["EN"].ToString();
                    lbl_Maintenance_Guarantor.Text = Dt.Rows[25]["EN"].ToString();
                    lbl_Executing_Agency.Text = Dt.Rows[26]["EN"].ToString();
                    lbl_Technical.Text = Dt.Rows[27]["EN"].ToString();
                    lbl_Observer.Text = Dt.Rows[28]["EN"].ToString();
                    lbl_Start_Date.Text = Dt.Rows[29]["EN"].ToString();
                    lbl_End_Date.Text = Dt.Rows[30]["EN"].ToString();
                    lbl_Cost.Text = Dt.Rows[31]["EN"].ToString();
                    lbl_priority.Text = Dt.Rows[34]["EN"].ToString();
                    lbl_procedures.Text = Dt.Rows[35]["EN"].ToString();
                    lbl_Reason_Delete.Text = "Reason For Deletion";
                    btn_Edit_Request.Text = Dt.Rows[36]["EN"].ToString();
                    btn_Back_To_Request_List.Text = Dt.Rows[32]["EN"].ToString();
                    Report_Date_Chosee.Text = Dt.Rows[33]["EN"].ToString();
                    Start_Date_Chosee.Text = Dt.Rows[33]["EN"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[33]["EN"].ToString();

                    Complainte_Source_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Employee_Tenant_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Souorce_Name_ReqFieldVali.ErrorMessage = "* Required ";
                    Building_Or_unit_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Request_Classification_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Building_Name_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Units_DropDownList_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Request_Type_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Order_Direction_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Order_priority_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Danger_Magnitude_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Maintenance_Type_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Maintenance_SubType_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Asset_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Maintenance_Guarantor_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Executing_Agency_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Technical_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Observer_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Delete_ReqFieVal.ErrorMessage = "* The Reason For The Deletion Must Be Explained";
                    Start_Date_RegularExpressionValidator.ErrorMessage = " dd/MM/yyyy ";
                    End_Date_RegularExpressionValidator.ErrorMessage = " dd/MM/yyyy  ";




                    Maintenance_List.Columns[1].HeaderText = Dt.Rows[21]["EN"].ToString();
                    Maintenance_List.Columns[2].HeaderText = Dt.Rows[22]["EN"].ToString();
                    Maintenance_List.Columns[3].HeaderText = Dt.Rows[24]["EN"].ToString();
                    Maintenance_List.Columns[4].HeaderText = Dt.Rows[25]["EN"].ToString();
                    Maintenance_List.Columns[5].HeaderText = Dt.Rows[26]["EN"].ToString();
                    Maintenance_List.Columns[6].HeaderText = Dt.Rows[27]["EN"].ToString();
                    Maintenance_List.Columns[7].HeaderText = Dt.Rows[28]["EN"].ToString();
                    Maintenance_List.Columns[8].HeaderText = Dt.Rows[29]["EN"].ToString();
                    Maintenance_List.Columns[9].HeaderText = Dt.Rows[30]["EN"].ToString();
                    Maintenance_List.Columns[10].HeaderText = Dt.Rows[31]["EN"].ToString();
                }
                else
                {

                    //Fill Employee / Tenant DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Employee_Tenant_DropDownList, "Tenants_Arabic_Name", "Tenants_ID");
                    Employee_Tenant_DropDownList.Items.Insert(0, "...............");

                    //Fill Technical_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Technical_DropDownList, "Employee_Arabic_name", "Employee_Id");
                    Technical_DropDownList.Items.Insert(0, "...............");

                    //Fill Technical_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Observer_DropDownList, "Employee_Arabic_name", "Employee_Id");
                    Observer_DropDownList.Items.Insert(0, "................");

                    Building_Or_unit_DropDownList.Items.Insert(0, "................");
                    Request_Classification_DropDownList.Items.Insert(0, "................");
                    Request_Type_DropDownList.Items.Insert(0, "................");
                    Order_priority_DropDownList.Items.Insert(0, "................");
                    Danger_Magnitude_DropDownList.Items.Insert(0, "................");
                    Maintenance_Status_DropDownList.Items.Insert(0, "................");
                    Maintenance_Guarantor_DropDownList.Items.Insert(0, "................");
                    Executing_Agency_DropDownList.Items.Insert(0, "................");

                    //Fill Maintenance_Type_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM maintenance_categoty Where Main_Categoty = 0", _sqlCon, Maintenance_Type_DropDownList, "Categoty_AR", "Categoty_Id");
                    Maintenance_Type_DropDownList.Items.Insert(0, "................");

                    //Fill Maintenance_Type_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM maintenance_categoty Where Main_Categoty != 0", _sqlCon, Maintenance_SubType_DropDownList, "Categoty_AR", "Categoty_Id");
                    Maintenance_SubType_DropDownList.Items.Insert(0, "................");

                    //Fill Asset_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM assets", _sqlCon, Asset_DropDownList, "Assets_Arabic_Name", "Assets_Id");
                    Asset_DropDownList.Items.Insert(0, "................");

                    //Fill Complainte_Source_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM requst_source", _sqlCon, Complainte_Source_DropDownList, "Ar_Requst_Source", "Requst_Source_id");
                    Complainte_Source_DropDownList.SelectedValue = "1";


                    //Fill Complainte_Source_DropDownList
                    Complainte_Source_DropDownList.Items.Clear();
                    Complainte_Source_DropDownList.Items.Add(new ListItem("عميل", "1"));
                    Complainte_Source_DropDownList.Items.Add(new ListItem("رقابة", "2"));
                    Complainte_Source_DropDownList.Items.Add(new ListItem("أخرى", "3"));
                    Complainte_Source_DropDownList.SelectedValue = "1";

                    //Get Building_Or_unit_DropDownList 
                    Building_Or_unit_DropDownList.Items.Clear();
                    Building_Or_unit_DropDownList.Items.Add(new ListItem("بناء", "1"));
                    Building_Or_unit_DropDownList.Items.Add(new ListItem("وحدة", "2"));
                    Building_Or_unit_DropDownList.Items.Insert(0, "...............");

                    //Get Request_Classification_DropDownList 
                    Request_Classification_DropDownList.Items.Clear();
                    Request_Classification_DropDownList.Items.Add(new ListItem("بلاغ", "1"));
                    Request_Classification_DropDownList.Items.Add(new ListItem("شكوى", "2"));
                    Request_Classification_DropDownList.Items.Insert(0, "...............");

                    //Get Request_Type_DropDownList 
                    Request_Type_DropDownList.Items.Clear();
                    Request_Type_DropDownList.Items.Add(new ListItem("صيانة", "1"));
                    Request_Type_DropDownList.Items.Add(new ListItem("نظافة", "2"));
                    Request_Type_DropDownList.Items.Add(new ListItem("مخالفة", "3"));
                    Request_Type_DropDownList.Items.Insert(0, "...............");

                    //Get Order_Direction_DropDownList 
                    Order_Direction_DropDownList.Items.Clear();
                    Order_Direction_DropDownList.Items.Add(new ListItem("الرقابة", "1"));
                    Order_Direction_DropDownList.Items.Add(new ListItem("شؤون العملاء", "2"));
                    Order_Direction_DropDownList.Items.Insert(0, "...............");

                    //Get Order_priority_DropDownList 
                    Order_priority_DropDownList.Items.Clear();
                    Order_priority_DropDownList.Items.Add(new ListItem("Disable", "1"));
                    Order_priority_DropDownList.Items.Add(new ListItem("Temporary Inconvenience", "2"));
                    Order_priority_DropDownList.Items.Add(new ListItem("Transient Nuisance", "3"));
                    Order_priority_DropDownList.Items.Insert(0, "...............");

                    //Get Danger_Magnitude_DropDownList 
                    Danger_Magnitude_DropDownList.Items.Clear();
                    Danger_Magnitude_DropDownList.Items.Add(new ListItem("خطورة على الحياة", "1"));
                    Danger_Magnitude_DropDownList.Items.Add(new ListItem("خطورة على الممتلكات", "2"));
                    Danger_Magnitude_DropDownList.Items.Add(new ListItem("خطورة قليلة الإحتمالية", "3"));
                    Danger_Magnitude_DropDownList.Items.Insert(0, "...............");

                    //Get Achievement_Verification_RadioButtonList 
                    Achievement_Verification_RadioButtonList.Items.Clear();
                    Achievement_Verification_RadioButtonList.Items.Add(new ListItem("معلق", "1"));
                    Achievement_Verification_RadioButtonList.Items.Add(new ListItem("منجز", "2"));
                    Achievement_Verification_RadioButtonList.Items.Add(new ListItem("تحت الإجراء", "3"));

                    //Get Maintenance_Status_DropDownList 
                    Maintenance_Status_DropDownList.Items.Clear();
                    Maintenance_Status_DropDownList.Items.Add(new ListItem("معلق", "1"));
                    Maintenance_Status_DropDownList.Items.Add(new ListItem("تحت الإجراء", "2"));
                    Maintenance_Status_DropDownList.Items.Add(new ListItem("منجز", "3"));
                    Maintenance_Status_DropDownList.Items.Insert(0, "...............");

                    //Get Maintenance_Guarantor_DropDownList 
                    Maintenance_Guarantor_DropDownList.Items.Clear();
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("المقاول", "1"));
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("المورد", "2"));
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("مالك", "3"));
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("عميل", "4"));
                    Maintenance_Guarantor_DropDownList.Items.Insert(0, "...............");

                    //Get Executing_Agency_DropDownList 
                    Executing_Agency_DropDownList.Items.Clear();
                    Executing_Agency_DropDownList.Items.Add(new ListItem("فريق الصيانة", "1"));
                    Executing_Agency_DropDownList.Items.Add(new ListItem("المقاول", "2"));
                    Executing_Agency_DropDownList.Items.Add(new ListItem("المورد", "3"));
                    Executing_Agency_DropDownList.Items.Insert(0, "...............");



                    lbl_titel_Add_New_Maintenance.Text = Dt.Rows[36]["AR"].ToString();
                    lbl_Complainte_Source.Text = Dt.Rows[2]["AR"].ToString();
                    lbl_Employee_Tenant.Text = Dt.Rows[3]["AR"].ToString();
                    lbl_Souorce_Name.Text = Dt.Rows[4]["AR"].ToString();
                    lbl_Building_Or_unit.Text = Dt.Rows[5]["AR"].ToString();
                    lbl_Request_Classification.Text = Dt.Rows[6]["AR"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[7]["AR"].ToString();
                    lbl_Units.Text = Dt.Rows[8]["AR"].ToString();
                    lbl_Request_Type.Text = Dt.Rows[9]["AR"].ToString();
                    lbl_Order_Direction.Text = Dt.Rows[10]["AR"].ToString();
                    lbl_Rreport_Text.Text = Dt.Rows[11]["AR"].ToString();
                    lbl_Inspection_Report_Description.Text = Dt.Rows[12]["AR"].ToString();
                    lbl_Order_priority.Text = Dt.Rows[13]["AR"].ToString();
                    lbl_Danger_Magnitude.Text = Dt.Rows[14]["AR"].ToString();
                    lbl_Report_Date.Text = Dt.Rows[15]["AR"].ToString();
                    lbl_Image_One.Text = Dt.Rows[16]["AR"].ToString();
                    lbl_Image_Two.Text = Dt.Rows[17]["AR"].ToString();
                    lbl_Achievement_Verification.Text = Dt.Rows[18]["AR"].ToString();
                    lbl_precaution.Text = Dt.Rows[19]["AR"].ToString();
                    Add_Maintenace.Text = Dt.Rows[20]["AR"].ToString();
                    lbl_Maintenance_Status.Text = Dt.Rows[21]["AR"].ToString();
                    lbl_Maintenance_Type.Text = Dt.Rows[22]["AR"].ToString();
                    lbl_Maintenance_SubType.Text = Dt.Rows[23]["AR"].ToString();
                    lbl_Asset.Text = Dt.Rows[24]["AR"].ToString();
                    lbl_Maintenance_Guarantor.Text = Dt.Rows[25]["AR"].ToString();
                    lbl_Executing_Agency.Text = Dt.Rows[26]["AR"].ToString();
                    lbl_Technical.Text = Dt.Rows[27]["AR"].ToString();
                    lbl_Observer.Text = Dt.Rows[28]["AR"].ToString();
                    lbl_Start_Date.Text = Dt.Rows[29]["AR"].ToString();
                    lbl_End_Date.Text = Dt.Rows[30]["AR"].ToString();
                    lbl_Cost.Text = Dt.Rows[31]["AR"].ToString();
                    lbl_priority.Text= Dt.Rows[34]["AR"].ToString();
                    lbl_procedures.Text = Dt.Rows[35]["AR"].ToString();
                    lbl_Reason_Delete.Text = "سبب الحذف";
                    btn_Edit_Request.Text = Dt.Rows[36]["AR"].ToString();
                    btn_Back_To_Request_List.Text = Dt.Rows[32]["AR"].ToString();
                    Report_Date_Chosee.Text = Dt.Rows[33]["AR"].ToString();
                    Start_Date_Chosee.Text = Dt.Rows[33]["AR"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[33]["AR"].ToString();

                    Complainte_Source_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Employee_Tenant_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Souorce_Name_ReqFieldVali.ErrorMessage = "* مطلوب ";
                    Building_Or_unit_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Request_Classification_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Building_Name_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Units_DropDownList_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Request_Type_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Order_Direction_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Order_priority_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Danger_Magnitude_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Maintenance_Type_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Maintenance_SubType_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Asset_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Maintenance_Guarantor_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Executing_Agency_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Technical_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Observer_RequiredFieldValidator.ErrorMessage = "* مطلوب ";
                    Delete_ReqFieVal.ErrorMessage = "* يجب توضيح سبب الحذف ";

                    Start_Date_RegularExpressionValidator.ErrorMessage = " dd/MM/yyyy ";
                    End_Date_RegularExpressionValidator.ErrorMessage = " dd/MM/yyyy  ";


                    Maintenance_List.Columns[1].HeaderText = Dt.Rows[21]["AR"].ToString();
                    Maintenance_List.Columns[2].HeaderText = Dt.Rows[22]["AR"].ToString();
                    Maintenance_List.Columns[3].HeaderText = Dt.Rows[24]["AR"].ToString();
                    Maintenance_List.Columns[4].HeaderText = Dt.Rows[25]["AR"].ToString();
                    Maintenance_List.Columns[5].HeaderText = Dt.Rows[26]["AR"].ToString();
                    Maintenance_List.Columns[6].HeaderText = Dt.Rows[27]["AR"].ToString();
                    Maintenance_List.Columns[7].HeaderText = Dt.Rows[28]["AR"].ToString();
                    Maintenance_List.Columns[8].HeaderText = Dt.Rows[29]["AR"].ToString();
                    Maintenance_List.Columns[9].HeaderText = Dt.Rows[30]["AR"].ToString();
                    Maintenance_List.Columns[10].HeaderText = Dt.Rows[31]["AR"].ToString();
                }
            }
            _sqlCon.Close();
        }

       

        protected void Maintenance_List_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var lbl_Activ = ((Label)e.Row.FindControl("lbl_Activ"));
                var lbl_Cost_Direction = ((Label)e.Row.FindControl("lbl_Cost_Direction"));
                var lbl_Executing_Agency = ((Label)e.Row.FindControl("lbl_Executing_Agency"));


                var lbl_Categoty_AR = ((Label)e.Row.FindControl("lbl_Categoty_AR"));
                var lbl_Categoty_En = ((Label)e.Row.FindControl("lbl_Categoty_En"));
                var lbl_Assets_Arabic_Name = ((Label)e.Row.FindControl("lbl_Assets_Arabic_Name"));
                var lbl_Assets_English_Name = ((Label)e.Row.FindControl("lbl_Assets_English_Name"));
                var lbl_AR_T_echnical = ((Label)e.Row.FindControl("lbl_AR_T_echnical"));
                var lbl_EN_T_echnical = ((Label)e.Row.FindControl("lbl_EN_T_echnical"));
                var lbl_AR_W_atcher = ((Label)e.Row.FindControl("lbl_AR_W_atcher"));
                var lbl_EN_W_atcher = ((Label)e.Row.FindControl("lbl_EN_W_atcher"));

                if (Session["Langues"].ToString() == "1")
                {
                    if(lbl_Activ.Text== "معلق") { lbl_Activ.Text = "On Hold"; } 
                    else if (lbl_Activ.Text == "تحت الإجراء") { lbl_Activ.Text = "Under The Procedure"; }
                    else if (lbl_Activ.Text == "منجز") { lbl_Activ.Text = "Done"; }

                    if (lbl_Cost_Direction.Text == "المقاول") { lbl_Cost_Direction.Text = "Contractor"; }
                    else if (lbl_Cost_Direction.Text == "المورد") { lbl_Cost_Direction.Text = "Supplier"; }
                    else if (lbl_Cost_Direction.Text == "مالك") { lbl_Cost_Direction.Text = "Owner"; }
                    else if (lbl_Cost_Direction.Text == "عميل") { lbl_Cost_Direction.Text = "Client"; }

                    if (lbl_Executing_Agency.Text == "فريق الصيانة") { lbl_Executing_Agency.Text = "Maintenance Team"; }
                    else if (lbl_Executing_Agency.Text == "المقاول") { lbl_Executing_Agency.Text = "Contractor"; }
                    else if (lbl_Executing_Agency.Text == "المورد") { lbl_Executing_Agency.Text = "Supplier"; }

                    lbl_Categoty_AR.Visible= false;            lbl_Categoty_En.Visible=true;
                    lbl_Assets_Arabic_Name.Visible = false;    lbl_Assets_English_Name.Visible = true;
                    lbl_AR_T_echnical.Visible = false;         lbl_EN_T_echnical.Visible = true;
                    lbl_AR_W_atcher.Visible = false;           lbl_EN_W_atcher.Visible = true;
                }
                else
                {
                    if (lbl_Activ.Text == "On Hold") { lbl_Activ.Text = "معلق"; }
                    else if (lbl_Activ.Text == "Under The Procedure") { lbl_Activ.Text = "تحت الإجراء"; }
                    else if (lbl_Activ.Text == "Done") { lbl_Activ.Text = "منجز"; }

                    if (lbl_Cost_Direction.Text == "Contractor") { lbl_Cost_Direction.Text = "المقاول"; }
                    else if (lbl_Cost_Direction.Text == "Supplier") { lbl_Cost_Direction.Text = "المورد"; }
                    else if (lbl_Cost_Direction.Text == "Owner") { lbl_Cost_Direction.Text = "مالك"; }
                    else if (lbl_Cost_Direction.Text == "Client") { lbl_Cost_Direction.Text = "عميل"; }

                    if (lbl_Executing_Agency.Text == "Maintenance Team") { lbl_Executing_Agency.Text = "فريق الصيانة"; }
                    else if (lbl_Executing_Agency.Text == "Contractor") { lbl_Executing_Agency.Text = "المقاول"; }
                    else if (lbl_Executing_Agency.Text == "Supplier") { lbl_Executing_Agency.Text = "المورد"; }


                    lbl_Categoty_AR.Visible = true;          lbl_Categoty_En.Visible = false;
                    lbl_Assets_Arabic_Name.Visible = true;   lbl_Assets_English_Name.Visible = false;
                    lbl_AR_T_echnical.Visible = true;        lbl_EN_T_echnical.Visible = false;
                    lbl_AR_W_atcher.Visible = true;          lbl_EN_W_atcher.Visible = false;
                }
            }
        }














        //********************************************************************************  Edit Grid View *******************************************************************
        //********************************************************************************************************************************************************************
        //********************************************************************************************************************************************************************


        //protected void RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow && Maintenance_List.EditIndex == e.Row.RowIndex)
        //    {
        //        DropDownList ddl_Activ = (DropDownList)e.Row.FindControl("Activ_DropDownList");

        //        if (DataBinder.Eval(e.Row.DataItem, "Activ").ToString() == "معلق")
        //        { string selected_Activ = "1"; ddl_Activ.Items.FindByValue(selected_Activ).Selected = true; }
        //        else if (DataBinder.Eval(e.Row.DataItem, "Activ").ToString() == "قيد التنفيذ")
        //        { string selected_Activ = "2"; ddl_Activ.Items.FindByValue(selected_Activ).Selected = true; }
        //        else { string selected_Activ = "3"; ddl_Activ.Items.FindByValue(selected_Activ).Selected = true; }
        //    }

        //    if (e.Row.RowType == DataControlRowType.DataRow && Maintenance_List.EditIndex == e.Row.RowIndex)
        //    {
        //        DropDownList ddl_Categoty_AR = (DropDownList)e.Row.FindControl("Categoty_AR_DropDownList");
        //        string Categoty_Ar_query = "SELECT * FROM maintenance_categoty where Main_Categoty != 0";
        //        using (MySqlDataAdapter sda = new MySqlDataAdapter(Categoty_Ar_query, _sqlCon))
        //        {
        //            using (DataTable dt = new DataTable())
        //            {
        //                sda.Fill(dt);
        //                ddl_Categoty_AR.DataSource = dt;
        //                ddl_Categoty_AR.DataTextField = "Categoty_AR";
        //                ddl_Categoty_AR.DataValueField = "Categoty_Id";
        //                ddl_Categoty_AR.DataBind();
        //                string selected_Categoty_AR = DataBinder.Eval(e.Row.DataItem, "maintenance_categoty_Categoty_Id").ToString();
        //                ddl_Categoty_AR.Items.FindByValue(selected_Categoty_AR).Selected = true;
        //            }
        //        }
        //    }

        //    if (e.Row.RowType == DataControlRowType.DataRow && Maintenance_List.EditIndex == e.Row.RowIndex)
        //    {
        //        string Main_Place; string Building_ID; string Unit_Id;
        //        Main_Place = Building_Or_unit_DropDownList.SelectedValue;
        //        if (Main_Place == "2")
        //        {
        //            Building_ID = Building_Name_DropDownList.SelectedValue;
        //            DropDownList ddl_Assets_Arabic_Name = (DropDownList)e.Row.FindControl("Assets_Arabic_Name_DropDownList");
        //            string Assets_Arabic_Name_query = "SELECT * FROM assets where Building_ID = '" + Building_ID + "'";
        //            using (MySqlDataAdapter sda = new MySqlDataAdapter(Assets_Arabic_Name_query, _sqlCon))
        //            {
        //                using (DataTable dt = new DataTable())
        //                {
        //                    sda.Fill(dt);
        //                    ddl_Assets_Arabic_Name.DataSource = dt;
        //                    ddl_Assets_Arabic_Name.DataTextField = "Assets_Arabic_Name";
        //                    ddl_Assets_Arabic_Name.DataValueField = "Assets_Id";
        //                    ddl_Assets_Arabic_Name.DataBind();
        //                    string selected_Assets_Arabic_Name = DataBinder.Eval(e.Row.DataItem, "assets_Assets_Id").ToString();
        //                    ddl_Assets_Arabic_Name.Items.FindByValue(selected_Assets_Arabic_Name).Selected = true;
        //                }
        //            }
        //        }
        //        else if (Main_Place == "3")
        //        {
        //            Unit_Id = Units_DropDownList.SelectedValue;
        //            DropDownList ddl_Assets_Arabic_Name = (DropDownList)e.Row.FindControl("Assets_Arabic_Name_DropDownList");
        //            string Assets_Arabic_Name_query = "SELECT * FROM assets where Unit_Id = '" + Unit_Id + "'";
        //            using (MySqlDataAdapter sda = new MySqlDataAdapter(Assets_Arabic_Name_query, _sqlCon))
        //            {
        //                using (DataTable dt = new DataTable())
        //                {
        //                    sda.Fill(dt);
        //                    ddl_Assets_Arabic_Name.DataSource = dt;
        //                    ddl_Assets_Arabic_Name.DataTextField = "Assets_Arabic_Name";
        //                    ddl_Assets_Arabic_Name.DataValueField = "Assets_Id";
        //                    ddl_Assets_Arabic_Name.DataBind();
        //                    string selected_Assets_Arabic_Name = DataBinder.Eval(e.Row.DataItem, "assets_Assets_Id").ToString();
        //                    ddl_Assets_Arabic_Name.Items.FindByValue(selected_Assets_Arabic_Name).Selected = true;
        //                }
        //            }
        //        }


        //    }

        //    if (e.Row.RowType == DataControlRowType.DataRow && Maintenance_List.EditIndex == e.Row.RowIndex)
        //    {
        //        DropDownList ddl_Cost_Direction = (DropDownList)e.Row.FindControl("Cost_Direction_DropDownList");

        //        if (DataBinder.Eval(e.Row.DataItem, "Cost_Direction").ToString() == "المقاول")
        //        { string selected_Activ = "1"; ddl_Cost_Direction.Items.FindByValue(selected_Activ).Selected = true; }
        //        else if (DataBinder.Eval(e.Row.DataItem, "Cost_Direction").ToString() == "الموّرد")
        //        { string selected_Activ = "2"; ddl_Cost_Direction.Items.FindByValue(selected_Activ).Selected = true; }
        //        else if (DataBinder.Eval(e.Row.DataItem, "Cost_Direction").ToString() == "المالك")
        //        { string selected_Activ = "3"; ddl_Cost_Direction.Items.FindByValue(selected_Activ).Selected = true; }
        //        else { string selected_Activ = "4"; ddl_Cost_Direction.Items.FindByValue(selected_Activ).Selected = true; }
        //    }

        //    if (e.Row.RowType == DataControlRowType.DataRow && Maintenance_List.EditIndex == e.Row.RowIndex)
        //    {
        //        DropDownList ddl_Executing_Agency = (DropDownList)e.Row.FindControl("Executing_Agency_DropDownList");

        //        if (DataBinder.Eval(e.Row.DataItem, "Executing_Agency").ToString() == "فريق الصيانة")
        //        { string selected_Activ = "1"; ddl_Executing_Agency.Items.FindByValue(selected_Activ).Selected = true; }
        //        else if (DataBinder.Eval(e.Row.DataItem, "Executing_Agency").ToString() == "المقاول")
        //        { string selected_Activ = "2"; ddl_Executing_Agency.Items.FindByValue(selected_Activ).Selected = true; }
        //        else { string selected_Activ = "3"; ddl_Executing_Agency.Items.FindByValue(selected_Activ).Selected = true; }
        //    }

        //    if (e.Row.RowType == DataControlRowType.DataRow && Maintenance_List.EditIndex == e.Row.RowIndex)
        //    {
        //        DropDownList ddl_T_echnical = (DropDownList)e.Row.FindControl("T_echnical_DropDownList");
        //        string T_echnical_query = "SELECT * FROM employee ";
        //        using (MySqlDataAdapter sda = new MySqlDataAdapter(T_echnical_query, _sqlCon))
        //        {
        //            using (DataTable dt = new DataTable())
        //            {
        //                sda.Fill(dt);
        //                ddl_T_echnical.DataSource = dt;
        //                ddl_T_echnical.DataTextField = "Employee_Arabic_name";
        //                ddl_T_echnical.DataValueField = "Employee_Id";
        //                ddl_T_echnical.DataBind();
        //                string selected_T_echnical = DataBinder.Eval(e.Row.DataItem, "Technical").ToString();
        //                ddl_T_echnical.Items.FindByValue(selected_T_echnical).Selected = true;
        //            }
        //        }
        //    }

        //    if (e.Row.RowType == DataControlRowType.DataRow && Maintenance_List.EditIndex == e.Row.RowIndex)
        //    {
        //        DropDownList ddl_W_atcher_DropDownList = (DropDownList)e.Row.FindControl("W_atcher_DropDownList");
        //        string W_atcherl_query = "SELECT * FROM employee ";
        //        using (MySqlDataAdapter sda = new MySqlDataAdapter(W_atcherl_query, _sqlCon))
        //        {
        //            using (DataTable dt = new DataTable())
        //            {
        //                sda.Fill(dt);
        //                ddl_W_atcher_DropDownList.DataSource = dt;
        //                ddl_W_atcher_DropDownList.DataTextField = "Employee_Arabic_name";
        //                ddl_W_atcher_DropDownList.DataValueField = "Employee_Id";
        //                ddl_W_atcher_DropDownList.DataBind();
        //                string selected_W_atcherl = DataBinder.Eval(e.Row.DataItem, "Watcher").ToString();
        //                ddl_W_atcher_DropDownList.Items.FindByValue(selected_W_atcherl).Selected = true;
        //            }
        //        }
        //    }

        //}








        //protected void EditCustomer(object sender, GridViewEditEventArgs e)
        //{ Maintenance_List.EditIndex = e.NewEditIndex; this.BindGrid_Contract_Cheque_List(); }
        //protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
        //{ Maintenance_List.EditIndex = -1; this.BindGrid_Contract_Cheque_List(); }
        //protected void UpdateCustomer(object sender, GridViewUpdateEventArgs e)
        //{
        //    string Activ_DropDownList = (Maintenance_List.Rows[e.RowIndex].FindControl("Activ_DropDownList") as DropDownList).SelectedItem.Text.Trim();
        //    string Categoty_AR_DropDownList = (Maintenance_List.Rows[e.RowIndex].FindControl("Categoty_AR_DropDownList") as DropDownList).SelectedItem.Value;
        //    string Assets_Arabic_Name_DropDownList = (Maintenance_List.Rows[e.RowIndex].FindControl("Assets_Arabic_Name_DropDownList") as DropDownList).SelectedItem.Value;
        //    string Cost_Direction_DropDownList = (Maintenance_List.Rows[e.RowIndex].FindControl("Cost_Direction_DropDownList") as DropDownList).SelectedItem.Text.Trim();
        //    string Executing_Agency_DropDownList = (Maintenance_List.Rows[e.RowIndex].FindControl("Executing_Agency_DropDownList") as DropDownList).SelectedItem.Text.Trim();
        //    string T_echnical_DropDownList = (Maintenance_List.Rows[e.RowIndex].FindControl("T_echnical_DropDownList") as DropDownList).SelectedItem.Value;
        //    string W_atcher_DropDownList = (Maintenance_List.Rows[e.RowIndex].FindControl("W_atcher_DropDownList") as DropDownList).SelectedItem.Value;
        //    TextBox txt_Cost = (Maintenance_List.Rows[e.RowIndex].FindControl("txt_Cost") as TextBox);

        //    Calendar Start_Date_Calendar = (Maintenance_List.Rows[e.RowIndex]).FindControl("Start_Date_Calendar") as Calendar;
        //    string calendar1 = Start_Date_Calendar.SelectedDate.ToString("dd/MM/yyyy");
        //    Label lbl_Start_Date = (Maintenance_List.Rows[e.RowIndex].FindControl("lbl_Start_Date") as Label);

        //    Calendar End_Date_Calendar = (Maintenance_List.Rows[e.RowIndex]).FindControl("End_Date_Calendar") as Calendar;
        //    string calendar2 = Start_Date_Calendar.SelectedDate.ToString("dd/MM/yyyy");
        //    Label lbl_End_Date = (Maintenance_List.Rows[e.RowIndex].FindControl("lbl_End_Date") as Label);


        //    string Maintenance_Id = Maintenance_List.DataKeys[e.RowIndex].Value.ToString();

        //    string query = "UPDATE maintenance_request SET" +
        //                    " maintenance_categoty_Categoty_Id = @maintenance_categoty_Categoty_Id ," +
        //                    " assets_Assets_Id = @assets_Assets_Id ," +
        //                    " Start_Date = @Start_Date ," +
        //                    " End_Date = @End_Date ," +
        //                    " Cost = @Cost ," +
        //                    " Activ = @Activ ," +
        //                    " Cost_Direction = @Cost_Direction ," +
        //                    " Executing_Agency = @Executing_Agency ," +
        //                    " Technical = @Technical ," +
        //                    " Watcher = @Watcher " +
        //                    "WHERE Maintenance_Request_ID = @Maintenance_Request_ID";
        //    using (MySqlCommand cmd = new MySqlCommand(query, _sqlCon))
        //    {
        //        cmd.Parameters.AddWithValue("@Maintenance_Request_ID", Maintenance_Id);


        //        cmd.Parameters.AddWithValue("@maintenance_categoty_Categoty_Id", Categoty_AR_DropDownList);
        //        cmd.Parameters.AddWithValue("@assets_Assets_Id", Assets_Arabic_Name_DropDownList);
        //        cmd.Parameters.AddWithValue("@Cost", txt_Cost.Text);
        //        cmd.Parameters.AddWithValue("@Activ", Activ_DropDownList);
        //        cmd.Parameters.AddWithValue("@Cost_Direction", Cost_Direction_DropDownList);
        //        cmd.Parameters.AddWithValue("@Executing_Agency", Executing_Agency_DropDownList);
        //        cmd.Parameters.AddWithValue("@Technical", T_echnical_DropDownList);
        //        cmd.Parameters.AddWithValue("@Watcher", W_atcher_DropDownList);

        //        if (calendar1 != "01/01/0001") { cmd.Parameters.AddWithValue("@Start_Date", calendar1); }
        //        else { cmd.Parameters.AddWithValue("@Start_Date", lbl_Start_Date.Text); }

        //        if (calendar2 != "01/01/0001") { cmd.Parameters.AddWithValue("@End_Date", calendar2); }
        //        else { cmd.Parameters.AddWithValue("@End_Date", lbl_End_Date.Text); }


        //        _sqlCon.Open();
        //        cmd.ExecuteNonQuery();
        //        _sqlCon.Close();
        //        //Response.Redirect(Request.RawUrl);
        //        Maintenance_List.EditIndex = -1; this.BindGrid_Contract_Cheque_List();
        //    }
        //}
    }
}