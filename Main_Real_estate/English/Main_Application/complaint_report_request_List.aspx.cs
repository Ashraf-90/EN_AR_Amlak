using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class complaint_report_request_List : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Add_permission(_sqlCon, Session["Role"].ToString(), "Asset_Management", Add);
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Asset_Management", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!IsPostBack)
            {
                language();
                Request_List_BindData();
            }
        }
        protected void Request_List_BindData(string sortExpression = null)
        {
            try
            {
                using (MySqlCommand cmd = new MySqlCommand("complaint_report_request", _sqlCon))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        request_List.DataSource = dt;
                        request_List.DataBind();
                    }
                }
            }
            catch
            {
                Response.Write(
                    @"<script language='javascript'>alert('OOPS!!! The Building List Cannt Display')</script>");
            }
        }

        

        protected void Edit_Request(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;

            DataTable Dt = new DataTable();
            _sqlCon.Open();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM roles WHERE Role_ID = @ID", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Cmd.Parameters.AddWithValue("@ID", Session["Role"].ToString());
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                string[] Page = Dt.Rows[0]["Asset_Management"].ToString().Split(',');
                if (Page[2] == "E") { Response.Redirect("Edit_complaint_report_request.aspx?Id=" + id); }
            }
            _sqlCon.Close();
        }

        protected void Details_Request(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("complaint_report_request_Details.aspx?Id=" + id);
        }

        protected void request_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label Priority_Danger = null;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Priority_Danger = e.Item.FindControl("lbl_priority_Danger") as Label;
                HtmlTableRow tr = e.Item.FindControl("row") as HtmlTableRow;

                if (Priority_Danger.Text == "1")
                {
                    tr.Attributes.Add("style", "background-color: #faced2; color:#000000;");
                }

                else if (Priority_Danger.Text == "2")
                {
                    tr.Attributes.Add("style", "background-color: #fbde9f; color:#000000;");
                }
                else if (Priority_Danger.Text == "3")
                {
                    tr.Attributes.Add("style", "background-color: #c5f8eb; color:#000000;");
                }
            }

            //******************** Langueges *********************************************************
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_No = e.Item.FindControl("lbl_No") as Label;
                var lbl_Source = e.Item.FindControl("lbl_Source") as Label;
                var lbl_Tenant = e.Item.FindControl("lbl_Tenant") as Label;
                var lbl_Employee = e.Item.FindControl("lbl_Employee") as Label;
                var lbl_Adress = e.Item.FindControl("lbl_Adress") as Label;
                var lbl_Classification = e.Item.FindControl("lbl_Classification") as Label;
                var lbl_Type = e.Item.FindControl("lbl_Type") as Label;
                var lbl_Direction = e.Item.FindControl("lbl_Direction") as Label;
                var lbl_Date = e.Item.FindControl("lbl_Date") as Label;
                var lbl_Status = e.Item.FindControl("lbl_Status") as Label;
                


                _sqlCon.Open();
                DataTable Dt1 = new DataTable();
                MySqlCommand Cmd1 = new MySqlCommand("SELECT * FROM languages_maintenance", _sqlCon);
                MySqlDataAdapter Da1 = new MySqlDataAdapter(Cmd1);
                Da1.Fill(Dt1);
                if (Dt1.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Source.Text = Dt1.Rows[2]["EN"].ToString();
                        lbl_Tenant.Text = Dt1.Rows[3]["EN"].ToString();
                        lbl_Employee.Text = Dt1.Rows[44]["EN"].ToString();
                        lbl_Adress.Text = Dt1.Rows[45]["EN"].ToString();
                        lbl_Classification.Text = Dt1.Rows[6]["EN"].ToString();
                        lbl_Type.Text = Dt1.Rows[9]["EN"].ToString();
                        lbl_Direction.Text = Dt1.Rows[10]["EN"].ToString();
                        lbl_Date.Text = Dt1.Rows[15]["EN"].ToString();
                        lbl_Status.Text = Dt1.Rows[18]["EN"].ToString();
                       

                    }
                    else
                    {
                        lbl_Source.Text = Dt1.Rows[2]["AR"].ToString();
                        lbl_Tenant.Text = Dt1.Rows[3]["AR"].ToString();
                        lbl_Employee.Text = Dt1.Rows[44]["AR"].ToString();
                        lbl_Adress.Text = Dt1.Rows[45]["AR"].ToString();
                        lbl_Classification.Text = Dt1.Rows[6]["AR"].ToString();
                        lbl_Type.Text = Dt1.Rows[9]["AR"].ToString();
                        lbl_Direction.Text = Dt1.Rows[10]["AR"].ToString();
                        lbl_Date.Text = Dt1.Rows[15]["AR"].ToString();
                        lbl_Status.Text = Dt1.Rows[18]["AR"].ToString();
                    }
                }
                _sqlCon.Close();
            }
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_source = e.Item.FindControl("lbl_source") as Label;
                var lbl_Order_Classification = e.Item.FindControl("lbl_Order_Classification") as Label;
                var lbl_Report_Type = e.Item.FindControl("lbl_Report_Type") as Label;
                var lbl_Report_Direction = e.Item.FindControl("lbl_Report_Direction") as Label;
                var lbl_Activ = e.Item.FindControl("lbl_Activ") as Label;

                var lbl_Tenants_Arabic_Name = e.Item.FindControl("lbl_Tenants_Arabic_Name") as Label;
                var lbl_Tenants_English_Name = e.Item.FindControl("lbl_Tenants_English_Name") as Label;

                var lbl_Employee_Arabic_name = e.Item.FindControl("lbl_Employee_Arabic_name") as Label;
                var lbl_Employee_English_name = e.Item.FindControl("lbl_Employee_English_name") as Label;

                var lbl_Building_Arabic_Name = e.Item.FindControl("lbl_Building_Arabic_Name") as Label;
                var lbl_Building_English_Name = e.Item.FindControl("lbl_Building_English_Name") as Label;



                if (Session["Langues"].ToString() == "1")
                {
                    if (lbl_source.Text == "عميل") { lbl_source.Text = "Tenant"; } 
                    else if (lbl_source.Text == "رقابة") { lbl_source.Text = "Censorship"; }
                    else if (lbl_source.Text == "أخرى") { lbl_source.Text = "Other"; }

                    if (lbl_Order_Classification.Text == "بلاغ") { lbl_Order_Classification.Text = "Report"; }
                    else if (lbl_Order_Classification.Text == "شكوى") { lbl_Order_Classification.Text = "Complaint"; }

                    if (lbl_Report_Type.Text == "صيانة") { lbl_Report_Type.Text = "Maintenance"; }
                    else if (lbl_Report_Type.Text == "نظافة") { lbl_Report_Type.Text = "Cleanliness"; }
                    else if (lbl_Report_Type.Text == "مخالفة") { lbl_Report_Type.Text = "Breaking The Rules"; }

                    if (lbl_Report_Direction.Text == "الرقابة") { lbl_Report_Direction.Text = "Censorship"; }
                    else if (lbl_Report_Direction.Text == "شؤون العملاء") { lbl_Report_Direction.Text = "Customer Affairs"; }

                    if (lbl_Activ.Text == "معلق") { lbl_Activ.Text = "On Hold"; }
                    else if (lbl_Activ.Text == "منجز") { lbl_Activ.Text = "Done"; }
                    else if (lbl_Activ.Text == "تحت الإجراء") { lbl_Activ.Text = "Under The Procedure"; }
                    //----------------------------------------------------------------------------------
                    lbl_Tenants_Arabic_Name.Visible = false; lbl_Tenants_English_Name.Visible = true;
                    lbl_Employee_Arabic_name.Visible = false; lbl_Employee_English_name.Visible = true;
                    lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                }
                else
                {

                    if (lbl_source.Text == "Tenant") { lbl_source.Text = "عميل"; }
                    else if (lbl_source.Text == "Censorship") { lbl_source.Text = "رقابة"; }
                    else if (lbl_source.Text == "Other") { lbl_source.Text = "أخرى"; }

                    if (lbl_Order_Classification.Text == "Report") { lbl_Order_Classification.Text = "بلاغ"; }
                    else if (lbl_Order_Classification.Text == "Complaint") { lbl_Order_Classification.Text = "شكوى"; }


                    if (lbl_Report_Type.Text == "Maintenance") { lbl_Report_Type.Text = "صيانة"; }
                    else if (lbl_Report_Type.Text == "Cleanliness") { lbl_Report_Type.Text = "نظافة"; }
                    else if (lbl_Report_Type.Text == "Breaking The Rules") { lbl_Report_Type.Text = "مخالفة"; }

                    if (lbl_Report_Direction.Text == "Censorship") { lbl_Report_Direction.Text = "الرقابة"; }
                    else if (lbl_Report_Direction.Text == "Customer Affairs") { lbl_Report_Direction.Text = "شؤون العملاء"; }



                    if (lbl_Activ.Text == "On Hold") { lbl_Activ.Text = "معلق"; }
                    else if (lbl_Activ.Text == "Done") { lbl_Activ.Text = "منجز"; }
                    else if (lbl_Activ.Text == "Under The Procedure") { lbl_Activ.Text = "تحت الإجراء"; }
                    //----------------------------------------------------------------------------------
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;
                    lbl_Employee_Arabic_name.Visible = true; lbl_Employee_English_name.Visible = false;
                    lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;
                }
            }



        }


        

        protected void btn_P_1_Click(object sender, EventArgs e)
        {
            Request_List_BindData();
            Label Priority_Danger = null;
            foreach (RepeaterItem ri in request_List.Items)
            {
                Priority_Danger = ri.FindControl("lbl_priority_Danger") as Label;

                HtmlTableRow tr = ri.FindControl("row") as HtmlTableRow;

                if (Priority_Danger.Text != "1")
                {
                    tr.Attributes.Add("style", "display:none;");
                }

            }
        }

        protected void btn_P_2_Click(object sender, EventArgs e)
        {
            Request_List_BindData();
            Label Priority_Danger = null;
            foreach (RepeaterItem ri in request_List.Items)
            {
                Priority_Danger = ri.FindControl("lbl_priority_Danger") as Label;

                HtmlTableRow tr = ri.FindControl("row") as HtmlTableRow;

                if (Priority_Danger.Text != "2")
                {
                    tr.Attributes.Add("style", "display:none;");
                }

            }
        }

        protected void btn_P_3_Click(object sender, EventArgs e)
        {
            Request_List_BindData();
            Label Priority_Danger = null;
            foreach (RepeaterItem ri in request_List.Items)
            {
                Priority_Danger = ri.FindControl("lbl_priority_Danger") as Label;

                HtmlTableRow tr = ri.FindControl("row") as HtmlTableRow;

                if (Priority_Danger.Text != "3")
                {
                    tr.Attributes.Add("style", "display:none;");
                }

            }
        }

        protected void btn_all_Click(object sender, EventArgs e)
        {
            Request_List_BindData();
        }

        protected void Filter_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Request_List_BindData();
            Label lbl_Activ = null;
            foreach (RepeaterItem ri in request_List.Items)
            {
                lbl_Activ = ri.FindControl("lbl_Activ") as Label;

                HtmlTableRow tr = ri.FindControl("row") as HtmlTableRow;



                if(Filter_DropDownList.SelectedValue== "2") 
                {
                    if (lbl_Activ.Text != "معلق")
                    {
                        tr.Attributes.Add("style", "display:none;");
                    }
                }
                else if (Filter_DropDownList.SelectedValue == "3")
                {
                    if (lbl_Activ.Text != "تم أنجازه")
                    {
                        tr.Attributes.Add("style", "display:none;");
                    }
                }
                else if (Filter_DropDownList.SelectedValue == "4")
                {
                    if (lbl_Activ.Text != "تحت الإجراء")
                    {
                        tr.Attributes.Add("style", "display:none;");
                    }
                }
               




            }
        }

        protected void LinK_Complaint_Report_Request_Click(object sender, EventArgs e)
        {

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

                    //Fill Complainte_Source_DropDownList
                    Filter_DropDownList.Items.Clear();
                    Filter_DropDownList.Items.Add(new ListItem("All", "1"));
                    Filter_DropDownList.Items.Add(new ListItem("On Hold", "2"));
                    Filter_DropDownList.Items.Add(new ListItem("Done", "3"));
                    Filter_DropDownList.Items.Add(new ListItem("Under The Procedure", "4"));
                    Filter_DropDownList.SelectedValue = "1";




                    lbl_titel_complaint_report_request_List.Text = Dt.Rows[37]["En"].ToString();
                    lbl_Level_All.Text = Dt.Rows[38]["En"].ToString();
                    lbl_Level_One.Text = Dt.Rows[39]["En"].ToString();
                    lbl_Level_Two.Text = Dt.Rows[40]["En"].ToString();
                    lbl_Level_Three.Text = Dt.Rows[41]["En"].ToString();
                    lbl_Complainte_Satus.Text = Dt.Rows[42]["En"].ToString();
                    Add.Text = Dt.Rows[20]["En"].ToString();
                }
                else
                {
                    //Fill Complainte_Source_DropDownList
                    Filter_DropDownList.Items.Clear();
                    Filter_DropDownList.Items.Add(new ListItem("الكل", "1"));
                    Filter_DropDownList.Items.Add(new ListItem("معلق", "2"));
                    Filter_DropDownList.Items.Add(new ListItem("منجز", "3"));
                    Filter_DropDownList.Items.Add(new ListItem("تحت الإجراء", "4"));
                    Filter_DropDownList.SelectedValue = "1";




                    lbl_titel_complaint_report_request_List.Text = Dt.Rows[37]["AR"].ToString();
                    lbl_Level_All.Text = Dt.Rows[38]["AR"].ToString();
                    lbl_Level_One.Text = Dt.Rows[39]["AR"].ToString();
                    lbl_Level_Two.Text = Dt.Rows[40]["AR"].ToString();
                    lbl_Level_Three.Text = Dt.Rows[41]["AR"].ToString();
                    lbl_Complainte_Satus.Text = Dt.Rows[42]["AR"].ToString();
                    Add.Text = Dt.Rows[20]["AR"].ToString();
                }
            }
            _sqlCon.Close();
        }
    }
}