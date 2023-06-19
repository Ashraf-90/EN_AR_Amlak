using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class complaint_report_request_Details : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Asset_Management", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }

            
            _sqlCon.Open();
            string complaint_report_requestId = Request.QueryString["Id"];
            using (MySqlCommand complaint_report_requestDetailsCmd = new MySqlCommand("complaint_report_request_Details", _sqlCon))
            {
                complaint_report_requestDetailsCmd.CommandType = CommandType.StoredProcedure;
                complaint_report_requestDetailsCmd.Parameters.AddWithValue("@Id", complaint_report_requestId);
                using (MySqlDataAdapter complaint_report_requestDetailsSda = new MySqlDataAdapter(complaint_report_requestDetailsCmd))
                {
                    DataTable complaint_report_requestDetailsDt = new DataTable();
                    complaint_report_requestDetailsSda.Fill(complaint_report_requestDetailsDt);
                    lbl_source.Text = complaint_report_requestDetailsDt.Rows[0]["source"].ToString();
                    if (Session["Langues"].ToString() == "1") { lbl_Building_Name.Text = complaint_report_requestDetailsDt.Rows[0]["Building_English_Name"].ToString(); }
                    else { lbl_Building_Name.Text = complaint_report_requestDetailsDt.Rows[0]["Building_Arabic_Name"].ToString(); }
                    if (complaint_report_requestDetailsDt.Rows[0]["Unit_Number"].ToString() != "")
                    {
                        lbl_Unit_Number.Text = "/ " + complaint_report_requestDetailsDt.Rows[0]["Unit_Number"].ToString();
                    }
                    lbl_Date.Text = complaint_report_requestDetailsDt.Rows[0]["Date"].ToString();
                    lbl_Order_Classification.Text = complaint_report_requestDetailsDt.Rows[0]["Order_Classification"].ToString();
                    lbl_Report_Type.Text = complaint_report_requestDetailsDt.Rows[0]["Report_Type"].ToString();
                    lbl_Report_Direction.Text = complaint_report_requestDetailsDt.Rows[0]["Report_Direction"].ToString();
                    lbl_Report_Text.Text = complaint_report_requestDetailsDt.Rows[0]["Report_Text"].ToString();
                    lbl_Report_Description.Text = complaint_report_requestDetailsDt.Rows[0]["Report_Description"].ToString();
                    lbl_precaution.Text = complaint_report_requestDetailsDt.Rows[0]["precaution"].ToString();
                    lbl_Activ.Text = complaint_report_requestDetailsDt.Rows[0]["Activ"].ToString();
                    lbl_Priority.Text = complaint_report_requestDetailsDt.Rows[0]["urgent"].ToString();
                    lbl_Danger.Text = complaint_report_requestDetailsDt.Rows[0]["Danger"].ToString();


                    if (Session["Langues"].ToString() == "1")
                    {
                        if (complaint_report_requestDetailsDt.Rows[0]["priority_Danger"].ToString() == "1")
                        { lbl_Priority_Resut.Text = "Level One"; lbl_Priority_Resut.ForeColor = System.Drawing.Color.Red; lbl_Priority_Resut.BackColor = System.Drawing.Color.Black; }
                        else if (complaint_report_requestDetailsDt.Rows[0]["priority_Danger"].ToString() == "2")
                        { lbl_Priority_Resut.Text = "Level Two"; lbl_Priority_Resut.ForeColor = System.Drawing.Color.Yellow; lbl_Priority_Resut.BackColor = System.Drawing.Color.Black; }
                        else { lbl_Priority_Resut.Text = "Level Three"; lbl_Priority_Resut.ForeColor = System.Drawing.Color.Green; lbl_Priority_Resut.BackColor = System.Drawing.Color.Black; }
                    }
                    else
                    {
                        if (complaint_report_requestDetailsDt.Rows[0]["priority_Danger"].ToString() == "1")
                        { lbl_Priority_Resut.Text = "من الدرجة الأولى"; lbl_Priority_Resut.ForeColor = System.Drawing.Color.Red; lbl_Priority_Resut.BackColor = System.Drawing.Color.Black; }
                        else if (complaint_report_requestDetailsDt.Rows[0]["priority_Danger"].ToString() == "2")
                        { lbl_Priority_Resut.Text = "من الدرجة الثانية"; lbl_Priority_Resut.ForeColor = System.Drawing.Color.Yellow; lbl_Priority_Resut.BackColor = System.Drawing.Color.Black; }
                        else { lbl_Priority_Resut.Text = "من الدرجة الثالثة"; lbl_Priority_Resut.ForeColor = System.Drawing.Color.Green; lbl_Priority_Resut.BackColor = System.Drawing.Color.Black; }
                    }
                    if (complaint_report_requestDetailsDt.Rows[0]["Report_Type"].ToString() == "صيانة" || complaint_report_requestDetailsDt.Rows[0]["Report_Type"].ToString() == "Maintenance") 
                    { Maintenance_div.Visible = true; }
                    else { Maintenance_div.Visible = false; }





                    if (complaint_report_requestDetailsDt.Rows[0]["Image_Befor_Path"].ToString() == "No File")
                    {
                        Image_Befor.Visible = false;
                    }
                    else
                    {
                        Image_Befor.ImageUrl = complaint_report_requestDetailsDt.Rows[0]["Image_Befor_Path"].ToString();
                    }

                    //***********************************************************************************
                    if (complaint_report_requestDetailsDt.Rows[0]["Image_After_Path"].ToString() == "No File")
                    {
                        Image_After.Visible = false;
                    }
                    else
                    {
                        Image_After.ImageUrl = complaint_report_requestDetailsDt.Rows[0]["Image_After_Path"].ToString();
                    }
                }
                _sqlCon.Close();
            }
            BindData();
            language();
        }
        protected void BindData(string sortExpression = null)
        {
            string complaint_reportId = Request.QueryString["Id"];
            try
            {
                _sqlCon.Open();
                using (MySqlCommand Maintenance_RequestDetailsCmd = new MySqlCommand("maintenance_request_List", _sqlCon))
                {
                    Maintenance_RequestDetailsCmd.CommandType = CommandType.StoredProcedure;
                    Maintenance_RequestDetailsCmd.Parameters.AddWithValue("@Id", complaint_reportId);
                    MySqlDataAdapter Maintenance_RequestDetailsSda = new MySqlDataAdapter(Maintenance_RequestDetailsCmd);

                    DataTable Maintenance_RequestDetailsDt = new DataTable();
                    Maintenance_RequestDetailsSda.Fill(Maintenance_RequestDetailsDt);
                    Maintenance_RequestDetailsCmd.CommandType = CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    Maintenance_RequestDetailsSda.Fill(dt);
                    Maintenance_Request_Liist.DataSource = dt;
                    Maintenance_Request_Liist.DataBind();
                    _sqlCon.Close();
                }
            }
            catch { Response.Write(@"<script language='javascript'>alert('OOPS!!! The Maintenance List Cannt Display')</script>"); }
        }

        protected void Delete_Maintenance_Request(object sender, EventArgs e)
        {
            try
            {
                string id = (sender as LinkButton).CommandArgument;
                _sqlCon.Open();
                string quary1 = "DELETE FROM maintenance_request WHERE Maintenance_Request_ID=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(quary1, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", id);
                mySqlCmd.ExecuteNonQuery();
                _sqlCon.Close();

                Response.Redirect(Request.RawUrl);
            }
            catch
            {
                if (Session["Langues"].ToString() == "1") { Response.Write(@"<script language='javascript'>alert('Sorry... This request cannot be deleted')</script>"); }
                else { Response.Write(@"<script language='javascript'>alert('عذراً ... لايمكن حذف هذا الطلب')</script>"); }
                    
            }
        }
        protected void Details_Maintenance_Request(object sender, EventArgs e)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
            maintenance_request_Details_Div.Visible = true;
            _sqlCon.Open();
            string maintenance_request_Id = (sender as LinkButton).CommandArgument;
            using (MySqlCommand maintenance_requestDetailsCmd = new MySqlCommand("maintenance_request_Details", _sqlCon))
            {
                maintenance_requestDetailsCmd.CommandType = CommandType.StoredProcedure;
                maintenance_requestDetailsCmd.Parameters.AddWithValue("@Id", maintenance_request_Id);
                using (MySqlDataAdapter maintenance_requestDetailsSda = new MySqlDataAdapter(maintenance_requestDetailsCmd))
                {
                    DataTable maintenance_requestDetailsDt = new DataTable();
                    maintenance_requestDetailsSda.Fill(maintenance_requestDetailsDt);


                    lbl_Cost_Direction.Text = maintenance_requestDetailsDt.Rows[0]["Cost_Direction"].ToString();
                    lbl_Executing_Agency.Text = maintenance_requestDetailsDt.Rows[0]["Executing_Agency"].ToString();



                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Technical.Text = maintenance_requestDetailsDt.Rows[0]["EN_T_echnical"].ToString();
                        lbl_Watcher.Text = maintenance_requestDetailsDt.Rows[0]["EN_W_atcher"].ToString();
                        lbl_Asset.Text = maintenance_requestDetailsDt.Rows[0]["Assets_English_Name"].ToString();
                    }
                    else
                    {
                        lbl_Technical.Text = maintenance_requestDetailsDt.Rows[0]["T_echnical"].ToString();
                        lbl_Watcher.Text = maintenance_requestDetailsDt.Rows[0]["W_atcher"].ToString();
                        lbl_Asset.Text = maintenance_requestDetailsDt.Rows[0]["Assets_Arabic_Name"].ToString();
                    }
                    

                    if (maintenance_requestDetailsDt.Rows[0]["Contractor_Waranty_Period"].ToString() == "" && maintenance_requestDetailsDt.Rows[0]["Waranty_Period"].ToString() == "")
                    {
                        if (Session["Langues"].ToString() == "1")
                        {
                            lbl_Waranty.Text = "Not Valid";
                            lbl_Waranty_Direction.Text = "Not Specified";
                        }
                        else
                        {
                            lbl_Waranty.Text = "غير ساري";
                            lbl_Waranty_Direction.Text = "غير محددة";
                        }
                            
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
                            if (Session["Langues"].ToString() == "1")
                            {
                                lbl_Waranty.Text = "Valid";
                                lbl_Waranty_Direction.Text = "Contractor";
                            }
                            else
                            {
                                lbl_Waranty.Text = "ساري";
                                lbl_Waranty_Direction.Text = "المقاول";
                            }
                                
                        }
                        else
                        {
                            if (Session["Langues"].ToString() == "1")
                            {
                                lbl_Waranty.Text = "Not Valid";
                                lbl_Waranty_Direction.Text = "Not Specified";
                            }
                            else
                            {
                                lbl_Waranty.Text = "غير ساري";
                                lbl_Waranty_Direction.Text = "غير محدد";
                            }
                                
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
                            if (Session["Langues"].ToString() == "1")
                            {
                                lbl_Waranty.Text = "Valid";
                                lbl_Waranty_Direction.Text = "Supplier";
                            }
                            else
                            {
                                lbl_Waranty.Text = "ساري";
                                lbl_Waranty_Direction.Text = "المورد";
                            }
                                
                        }
                        else
                        {
                            if (Session["Langues"].ToString() == "1")
                            {
                                lbl_Waranty.Text = "Not Valid";
                                lbl_Waranty_Direction.Text = "Not Specified";
                            }
                            else
                            {
                                lbl_Waranty.Text = "غير ساري ";
                                lbl_Waranty_Direction.Text = "غير محدد";
                            }
                            
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
                            if (Session["Langues"].ToString() == "1")
                            {
                                lbl_Waranty.Text = "Valid";
                                lbl_Waranty_Direction.Text = "Contractor";
                            }
                            else
                            {
                                lbl_Waranty.Text = "ساري";
                                lbl_Waranty_Direction.Text = "المقاول";
                            }
                            
                        }
                        else
                        {
                            DateTime Waranty_Start_Date = Convert.ToDateTime(maintenance_requestDetailsDt.Rows[0]["Waranty_Start_Date"].ToString());
                            int Waranty_Period = Convert.ToInt32(maintenance_requestDetailsDt.Rows[0]["Waranty_Period"].ToString());
                            int difference_between_Dates = (int)(Today - Waranty_Start_Date).TotalDays;
                            int Remaining_Days = Waranty_Period - difference_between_Dates;


                            if (Remaining_Days > 0)
                            {
                                if (Session["Langues"].ToString() == "1")
                                {
                                    lbl_Waranty.Text = "Valid";
                                    lbl_Waranty_Direction.Text = "Supplier";
                                }
                                else
                                {
                                    lbl_Waranty.Text = "ساري";
                                    lbl_Waranty_Direction.Text = "المورد";
                                }
                                
                            }
                            else
                            {
                                if (Session["Langues"].ToString() == "1")
                                {
                                    lbl_Waranty.Text = "Not Valid";
                                    lbl_Waranty_Direction.Text = "Not Specified";
                                }
                                else
                                {
                                    lbl_Waranty.Text = "غير ساري ";
                                    lbl_Waranty_Direction.Text = "غير محدد";
                                }
                                
                            }
                        }
                    }
                }
            }
            _sqlCon.Close();
        }

        protected void btn_Close_Maintenance_Details_Click(object sender, EventArgs e)
        {
            maintenance_request_Details_Div.Visible = false;
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
        }

        protected void btn_Back_To_complaint_report_request_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaint_report_request_List.aspx");
        }

        protected void Image_Befor_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(Image_Befor.ImageUrl);
        }

        protected void Image_After_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect(Image_After.ImageUrl);
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

                    lbl_Titel_Customer_Affairs_Department.Text = Dt.Rows[46]["En"].ToString();
                    lbl_Titel_Company_Name.Text = Dt.Rows[47]["En"].ToString();
                    lbl_Red_Titel.Text = Dt.Rows[48]["En"].ToString();
                    lbl_Titel_source.Text = Dt.Rows[2]["En"].ToString();
                    lbl_Titel_Adress.Text = Dt.Rows[45]["En"].ToString();
                    lbl_Titel_Date.Text = Dt.Rows[15]["En"].ToString();
                    lbl_titel_Classification.Text = Dt.Rows[6]["En"].ToString();
                    lbl_titel_Type.Text = Dt.Rows[9]["En"].ToString();
                    lbl_titel_Direction.Text = Dt.Rows[10]["En"].ToString();
                    lbl_titel_Text.Text = Dt.Rows[11]["En"].ToString();
                    lbl_Titel_Priority.Text = Dt.Rows[13]["En"].ToString();
                    lbl_Titel_Danger.Text = Dt.Rows[14]["En"].ToString();
                    lbl_Titel_Priority_Resut.Text = Dt.Rows[34]["En"].ToString();
                    lbl_Titel_Description.Text = Dt.Rows[12]["En"].ToString();
                    lbl_Titel_precaution.Text = Dt.Rows[19]["En"].ToString();
                    lbl_Titel_Activ.Text = Dt.Rows[18]["En"].ToString();
                    lbl_Titel_Image_Befor.Text = Dt.Rows[16]["En"].ToString();
                    lbl_Titel_Image_After.Text = Dt.Rows[17]["En"].ToString();

                    lbl_titel_Maintenance_List.Text= "Maintenance List";
                    lbl_Titel_Asset_Manegement.Text = Dt.Rows[49]["En"].ToString();
                    lbl_Titel_Compant_Name.Text = Dt.Rows[47]["En"].ToString();
                    lbl_Titel_Maintenence_Request.Text = Dt.Rows[50]["En"].ToString();
                    lbl_Titel_Waranty.Text = Dt.Rows[51]["En"].ToString();
                    lbl_Titel_Waranty_Direction.Text = Dt.Rows[52]["En"].ToString();
                    lbl_Titel_Cost_Direction.Text = Dt.Rows[25]["En"].ToString();
                    lbl_Titel_Executing_Agency.Text = Dt.Rows[26]["En"].ToString();
                    lbl_Titel_Technical.Text = Dt.Rows[27]["En"].ToString();
                    lbl_Titel_Watcher.Text = Dt.Rows[28]["En"].ToString();
                    lbl_Titel_Asset.Text = Dt.Rows[24]["En"].ToString();
                    btn_Close_Maintenance_Details.Text = "Close";
                    btn_Back_To_complaint_report_request_List.Text = Dt.Rows[32]["En"].ToString();

                    if (lbl_source.Text == "عميل") { lbl_source.Text = "Tenant"; }
                    else if (lbl_source.Text == "رقابة") { lbl_source.Text = "Censorship"; }

                    if (lbl_Order_Classification.Text == "بلاغ") { lbl_Order_Classification.Text = "Report"; }
                    else if (lbl_Order_Classification.Text == "شكوى") { lbl_Order_Classification.Text = "Complaint"; }

                    if (lbl_Report_Type.Text == "صيانة") { lbl_Report_Type.Text = "Maintenance"; }
                    else if (lbl_Report_Type.Text == "نظافة") { lbl_Report_Type.Text = "Cleanliness"; }
                    else if (lbl_Report_Type.Text == "مخالفة") { lbl_Report_Type.Text = "Breaking The Rules"; }

                    if (lbl_Report_Direction.Text == "رقابة") { lbl_Report_Direction.Text = "Censorship"; }
                    else if (lbl_Report_Direction.Text == "شؤون العملاء") { lbl_Report_Direction.Text = "Customer Affairs"; }

                    if (lbl_Priority.Text == "تعطيل") { lbl_Priority.Text = "Disable"; }
                    else if (lbl_Priority.Text == "إزعاج مؤقت") { lbl_Priority.Text = "Temporary Inconvenience"; }
                    else if (lbl_Priority.Text == "إزعاج عابر") { lbl_Priority.Text = "Transient Nuisance"; }

                    if (lbl_Danger.Text == "خطورة على الحياة") { lbl_Danger.Text = "Dangerous To Life"; }
                    else if (lbl_Danger.Text == "خطورة على الممتلكات") { lbl_Danger.Text = "Dangerous To Properties"; }
                    else if (lbl_Danger.Text == "خطورة قليلة الإحتمالية") { lbl_Danger.Text = "Low Risk Risk"; }

                    if (lbl_Activ.Text == "معلق") { lbl_Activ.Text = "On Hold"; }
                    else if (lbl_Activ.Text == "تحت الإجراء") { lbl_Activ.Text = "Under The Procedure"; }
                    else if (lbl_Activ.Text == "منجز") { lbl_Activ.Text = "Done"; }


                    if (lbl_Cost_Direction.Text == "مقاول") { lbl_Cost_Direction.Text = "Contractor"; }
                    else if (lbl_Cost_Direction.Text == "مورد") { lbl_Cost_Direction.Text = "Supplier"; }
                    else if (lbl_Cost_Direction.Text == "مالك") { lbl_Cost_Direction.Text = "Owner"; }
                    else if (lbl_Cost_Direction.Text == "عميل") { lbl_Cost_Direction.Text = "Client"; }


                    if (lbl_Executing_Agency.Text == "فريق الصيانة") { lbl_Executing_Agency.Text = "Maintenance Team"; }
                    else if (lbl_Executing_Agency.Text == "مقاول") { lbl_Executing_Agency.Text = "Contractor"; }
                    else if (lbl_Executing_Agency.Text == "مورد") { lbl_Executing_Agency.Text = "Supplier"; }




                }
                else
                {
                    lbl_Titel_Customer_Affairs_Department.Text = Dt.Rows[46]["AR"].ToString();
                    lbl_Titel_Company_Name.Text = Dt.Rows[47]["AR"].ToString();
                    lbl_Red_Titel.Text = Dt.Rows[48]["AR"].ToString();
                    lbl_Titel_source.Text = Dt.Rows[2]["AR"].ToString();
                    lbl_Titel_Adress.Text = Dt.Rows[45]["AR"].ToString();
                    lbl_Titel_Date.Text = Dt.Rows[15]["AR"].ToString();
                    lbl_titel_Classification.Text = Dt.Rows[6]["AR"].ToString();
                    lbl_titel_Type.Text = Dt.Rows[9]["AR"].ToString();
                    lbl_titel_Direction.Text = Dt.Rows[10]["AR"].ToString();
                    lbl_titel_Text.Text = Dt.Rows[11]["AR"].ToString();
                    lbl_Titel_Priority.Text = Dt.Rows[13]["AR"].ToString();
                    lbl_Titel_Danger.Text = Dt.Rows[14]["AR"].ToString();
                    lbl_Titel_Priority_Resut.Text = Dt.Rows[34]["AR"].ToString();
                    lbl_Titel_Description.Text = Dt.Rows[12]["AR"].ToString();
                    lbl_Titel_precaution.Text = Dt.Rows[19]["AR"].ToString();
                    lbl_Titel_Activ.Text = Dt.Rows[18]["AR"].ToString();
                    lbl_Titel_Image_Befor.Text = Dt.Rows[16]["AR"].ToString();
                    lbl_Titel_Image_After.Text = Dt.Rows[17]["AR"].ToString();

                    lbl_titel_Maintenance_List.Text = "قائمة طلبات الصيانة";
                    lbl_Titel_Asset_Manegement.Text = Dt.Rows[49]["AR"].ToString();
                    lbl_Titel_Compant_Name.Text = Dt.Rows[47]["AR"].ToString();
                    lbl_Titel_Maintenence_Request.Text = Dt.Rows[50]["AR"].ToString();
                    lbl_Titel_Waranty.Text = Dt.Rows[51]["AR"].ToString();
                    lbl_Titel_Waranty_Direction.Text = Dt.Rows[52]["AR"].ToString();
                    lbl_Titel_Cost_Direction.Text = Dt.Rows[25]["AR"].ToString();
                    lbl_Titel_Executing_Agency.Text = Dt.Rows[26]["AR"].ToString();
                    lbl_Titel_Technical.Text = Dt.Rows[27]["AR"].ToString();
                    lbl_Titel_Watcher.Text = Dt.Rows[28]["AR"].ToString();
                    lbl_Titel_Asset.Text = Dt.Rows[24]["AR"].ToString();
                    btn_Close_Maintenance_Details.Text = "أغلاق";
                    btn_Back_To_complaint_report_request_List.Text = Dt.Rows[32]["AR"].ToString();



                    if (lbl_source.Text == "Tenant") { lbl_source.Text = "عميل"; }
                    else if (lbl_source.Text == "Censorship") { lbl_source.Text = "رقابة"; }

                    if (lbl_Order_Classification.Text == "Report") { lbl_Order_Classification.Text = "بلاغ"; }
                    else if (lbl_Order_Classification.Text == "Complaint") { lbl_Order_Classification.Text = "شكوى"; }

                    if (lbl_Report_Type.Text == "Maintenance") { lbl_Report_Type.Text = "صيانة"; }
                    else if (lbl_Report_Type.Text == "Cleanliness") { lbl_Report_Type.Text = "نظافة"; }
                    else if (lbl_Report_Type.Text == "Breaking The Rules") { lbl_Report_Type.Text = "مخالفة"; }

                    if (lbl_Report_Direction.Text == "Censorship") { lbl_Report_Direction.Text = "رقابة"; }
                    else if (lbl_Report_Direction.Text == "Customer Affairs") { lbl_Report_Direction.Text = "شؤون العملاء"; }

                    if (lbl_Priority.Text == "Disable") { lbl_Priority.Text = "تعطيل"; }
                    else if (lbl_Priority.Text == "Temporary Inconvenience") { lbl_Priority.Text = "زعاج مؤقت"; }
                    else if (lbl_Priority.Text == "Transient Nuisance") { lbl_Priority.Text = "إزعاج عابر"; }

                    if (lbl_Danger.Text == "Dangerous To Life") { lbl_Danger.Text = "خطورة على الحياة"; }
                    else if (lbl_Danger.Text == "Dangerous To Properties") { lbl_Danger.Text = "خطورة على الممتلكات"; }
                    else if (lbl_Danger.Text == "Low Risk Risk") { lbl_Danger.Text = "خطورة قليلة الإحتمالية"; }
                    
                    if (lbl_Activ.Text == "On Hold") { lbl_Activ.Text = "معلق"; }
                    else if (lbl_Activ.Text == "Under The Procedure") { lbl_Activ.Text = "تحت الإجراء"; }
                    else if (lbl_Activ.Text == "Done") { lbl_Activ.Text = "منجز"; }
                    
                    if (lbl_Cost_Direction.Text == "Contractor") { lbl_Cost_Direction.Text = "مقاول"; }
                    else if (lbl_Cost_Direction.Text == "Supplier") { lbl_Cost_Direction.Text = "مورد"; }
                    else if (lbl_Cost_Direction.Text == "Owner") { lbl_Cost_Direction.Text = "مالك"; }
                    else if (lbl_Cost_Direction.Text == "Client") { lbl_Cost_Direction.Text = "عميل"; }

                    if (lbl_Executing_Agency.Text == "Maintenance") { lbl_Executing_Agency.Text = "فريق الصيانة"; }
                    else if (lbl_Executing_Agency.Text == "Contractor") { lbl_Executing_Agency.Text = "مقاول"; }
                    else if (lbl_Executing_Agency.Text == "Supplier") { lbl_Executing_Agency.Text = "مورد"; }

                }
            }
            _sqlCon.Close();
        }

        protected void Maintenance_Request_Liist_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Type");
                var lbl_Strat = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Strat");
                var lbl_End = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_End");
                var lbl_Activ = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Activ");
                var lbl_Cost = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Cost");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_maintenance", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Type.Text = Dt.Rows[22]["EN"].ToString();
                        lbl_Strat.Text = Dt.Rows[29]["EN"].ToString();
                        lbl_End.Text = Dt.Rows[30]["EN"].ToString();
                        lbl_Activ.Text = Dt.Rows[21]["EN"].ToString();
                        lbl_Cost.Text = Dt.Rows[31]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Type.Text = Dt.Rows[22]["AR"].ToString();
                        lbl_Strat.Text = Dt.Rows[29]["AR"].ToString();
                        lbl_End.Text = Dt.Rows[30]["AR"].ToString();
                        lbl_Activ.Text = Dt.Rows[21]["AR"].ToString();
                        lbl_Cost.Text = Dt.Rows[31]["AR"].ToString();
                    }
                }
            }



            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Categoty_AR = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Categoty_AR");
                var lbl_Categoty_EN = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Categoty_EN");
                var lbl_Activ = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Activ");


                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Categoty_AR.Visible= false;     lbl_Categoty_EN.Visible= true;


                    if (lbl_Activ.Text == "معلق") { lbl_Activ.Text = "On Hold"; }
                    else if (lbl_Activ.Text == "تحت الإجراء") { lbl_Activ.Text = "Under The Procedure"; }
                    else if (lbl_Activ.Text == "منجز") { lbl_Activ.Text = "Done"; }
                }
                else
                {
                    lbl_Categoty_AR.Visible = true; lbl_Categoty_EN.Visible = false;


                    if (lbl_Activ.Text == "On Hold") { lbl_Activ.Text = "معلق"; }
                    else if (lbl_Activ.Text == "Under The Procedure") { lbl_Activ.Text = "تحت الإجراء"; }
                    else if (lbl_Activ.Text == "Done") { lbl_Activ.Text = "منجز"; }
                }
            }
        }
    }
}
