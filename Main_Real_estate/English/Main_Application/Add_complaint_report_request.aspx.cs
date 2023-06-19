using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Add_complaint_report_request : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Asset_Management", 0, "R");
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Asset_Management", 1, "A");
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();
                txt_Report_Date.Text = DateTime.Now.ToString("dd/MM/yyyy");
                //--------------------------------------- Fill Maintenance GridView with Added Maintenance --------------------------------------------------------------
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[15]
                {
                    new DataColumn("Maintenance_Type"),
                    new DataColumn("Maintenance_SubType"), new DataColumn("maintenance_subtypes_Maintenance_Subtypes_Id"),
                    new DataColumn("Asset"), new DataColumn("assets_Assets_Id"),
                    new DataColumn("Executing_Agency"), new DataColumn("Cost_Direction"),
                    new DataColumn("technical") ,new DataColumn("Technical_ID"),
                    new DataColumn("watcher"), new DataColumn("Watcher_ID"),
                    new DataColumn("Start_Date"),new DataColumn("End_Date"),new DataColumn("Cost"),
                    new DataColumn("Act")
                });
                ViewState["Customers"] = dt;
                this.BindGrid();

            }
        }
        protected void Add_Maintenane_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt1 = (DataTable)ViewState["Customers"];
            dt1.Rows.Add
            (
                Maintenance_Type_DropDownList.SelectedItem.Text.Trim(),
                Maintenance_SubType_DropDownList.SelectedItem.Text.Trim(), Maintenance_SubType_DropDownList.SelectedValue,
                Asset_DropDownList.SelectedItem.Text.Trim(), Asset_DropDownList.SelectedValue,
                Executing_Agency_DropDownList.SelectedItem.Text.Trim(), Maintenance_Guarantor_DropDownList.SelectedItem.Text.Trim(),
                Technical_DropDownList.SelectedItem.Text.Trim(), Technical_DropDownList.SelectedValue,
                Observer_DropDownList.SelectedItem.Text.Trim(), Observer_DropDownList.SelectedValue,
                txt_Start_Date.Text.Trim(), txt_End_Date.Text.Trim(), txt_Cost.Text.Trim(),
                Maintenance_Status_DropDownList.SelectedItem.Text.Trim()
            );
            ViewState["Customers"] = dt1;
            this.BindGrid();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
        }
        protected void BindGrid()
        {
            Maintenance_GridView.DataSource = (DataTable)ViewState["Customers"];
            Maintenance_GridView.DataBind();
        }
        protected void Complainte_Source_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Complainte_Source_DropDownList.SelectedValue == "1")
            {
                Employee_Tenant_Div.Visible = true; Other_Div.Visible=false;
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

            //Fill units Name DropDownList
            Helper.LoadDropDownList("SELECT * FROM units where Half !='1' and building_Building_Id = '" + Building_Name_DropDownList.SelectedValue + "'", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
            Units_DropDownList.Items.Insert(0, "..............");
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

        protected void btn_Add_Request_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //Fill The Request Table With Data From View
                string addRequestQuery = "Insert Into complaint_report_request (" +
                                       "building_Building_Id , " +
                                       "Unit_Id , " +
                                       "source , " +
                                       "Tenant_ID  , " +
                                       "Employee_ID        , " +
                                       "Order_Classification       , " +
                                       "Report_Type         , " +
                                       "Report_Direction           , " +
                                       "urgent           , " +
                                       "Danger           , " +
                                       "priority_Danger   , " +
                                       "Date , " +
                                       "Report_Text , " +
                                       "Report_Description , " +
                                       "precaution , " +

                                       "Image_Befor_FileName , " +
                                       "Image_Befor_Path , " +
                                       "Image_After_FileName , " +
                                       "Image_After_Path , " +


                                       "Activ) " +
                                       "VALUES( " +
                                       "@building_Building_Id , " +
                                       "@Unit_Id , " +
                                       "@source , " +
                                       "@Tenant_ID  , " +
                                       "@Employee_ID        , " +
                                       "@Order_Classification       , " +
                                       "@Report_Type         , " +
                                       "@Report_Direction           , " +
                                       "@urgent           , " +
                                       "@Danger           , " +
                                       "@priority_Danger   , " +
                                        "@Date , " +
                                       "@Report_Text , " +
                                       "@Report_Description , " +
                                       "@precaution , " +


                                        "@Image_Befor_FileName , " +
                                       "@Image_Befor_Path , " +
                                       "@Image_After_FileName , " +
                                       "@Image_After_Path , " +


                                       "@Activ ) ";
                _sqlCon.Open();
                using (MySqlCommand addRequestCmd = new MySqlCommand(addRequestQuery, _sqlCon))
                {
                    string Priority = Order_priority_DropDownList.SelectedValue;
                    string Danger = Danger_Magnitude_DropDownList.SelectedValue;

                    //Fill The Database with All DropDownLists Items
                    if (Complainte_Source_DropDownList.SelectedValue == "1")
                    {
                        addRequestCmd.Parameters.AddWithValue("@source", Complainte_Source_DropDownList.SelectedItem.Text.Trim());
                    }
                    else if (Complainte_Source_DropDownList.SelectedValue == "2")
                    {
                        addRequestCmd.Parameters.AddWithValue("@source", Complainte_Source_DropDownList.SelectedItem.Text.Trim());
                    }
                    else
                    {
                        addRequestCmd.Parameters.AddWithValue("@source", txt_Souorce_Name.Text);
                    }
                    
                    if (Building_Or_unit_DropDownList.SelectedValue == "1")
                    {
                        addRequestCmd.Parameters.AddWithValue("@building_Building_Id", Building_Name_DropDownList.SelectedValue);
                        addRequestCmd.Parameters.AddWithValue("@Unit_Id", "");
                    }
                    else
                    {
                        addRequestCmd.Parameters.AddWithValue("@building_Building_Id", Building_Name_DropDownList.SelectedValue);
                        addRequestCmd.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
                    }

                    addRequestCmd.Parameters.AddWithValue("@Order_Classification", Request_Classification_DropDownList.SelectedItem.Text.Trim());
                    addRequestCmd.Parameters.AddWithValue("@Report_Type", Request_Type_DropDownList.SelectedItem.Text.Trim());
                    addRequestCmd.Parameters.AddWithValue("@Report_Direction", Order_Direction_DropDownList.SelectedItem.Text.Trim());
                    addRequestCmd.Parameters.AddWithValue("@urgent", Order_priority_DropDownList.SelectedItem.Text.Trim());
                    addRequestCmd.Parameters.AddWithValue("@Danger", Danger_Magnitude_DropDownList.SelectedItem.Text.Trim());

                    if (Priority == "1" && Danger == "1")
                    { addRequestCmd.Parameters.AddWithValue("@priority_Danger", "1"); }
                    else if (Priority == "1" && Danger == "2")
                    { addRequestCmd.Parameters.AddWithValue("@priority_Danger", "1"); }
                    else if (Priority == "1" && Danger == "3")
                    { addRequestCmd.Parameters.AddWithValue("@priority_Danger", "2"); }


                    else if (Priority == "2" && Danger == "1")
                    { addRequestCmd.Parameters.AddWithValue("@priority_Danger", "1"); }
                    else if (Priority == "2" && Danger == "2")
                    { addRequestCmd.Parameters.AddWithValue("@priority_Danger", "2"); }
                    else if (Priority == "2" && Danger == "3")
                    { addRequestCmd.Parameters.AddWithValue("@priority_Danger", "3"); }


                    else if (Priority == "3" && Danger == "1")
                    { addRequestCmd.Parameters.AddWithValue("@priority_Danger", "2"); }
                    else if (Priority == "3" && Danger == "2")
                    { addRequestCmd.Parameters.AddWithValue("@priority_Danger", "3"); }
                    else if (Priority == "3" && Danger == "3")
                    { addRequestCmd.Parameters.AddWithValue("@priority_Danger", "3"); }


                    addRequestCmd.Parameters.AddWithValue("@Date", txt_Report_Date.Text);
                    addRequestCmd.Parameters.AddWithValue("@Report_Text", txt_Rreport_Text.Text);
                    addRequestCmd.Parameters.AddWithValue("@Report_Description", txt_Inspection_Report_Description.Text);
                    addRequestCmd.Parameters.AddWithValue("@precaution", txt_precaution.Text);
                    addRequestCmd.Parameters.AddWithValue("@Activ", Achievement_Verification_RadioButtonList.SelectedItem.Text.Trim());

                    if (Complainte_Source_DropDownList.SelectedValue == "1")
                    {
                        addRequestCmd.Parameters.AddWithValue("@Tenant_ID", Employee_Tenant_DropDownList.SelectedValue);
                        addRequestCmd.Parameters.AddWithValue("@Employee_ID", "");
                    }
                    else if (Complainte_Source_DropDownList.SelectedValue == "2")
                    {
                        addRequestCmd.Parameters.AddWithValue("@Tenant_ID", "");
                        addRequestCmd.Parameters.AddWithValue("@Employee_ID", Employee_Tenant_DropDownList.SelectedValue);
                    }
                    else
                    {
                        addRequestCmd.Parameters.AddWithValue("@Tenant_ID", "");
                        addRequestCmd.Parameters.AddWithValue("@Employee_ID", "");
                    }





                    if (Image_Befor_FileUpload.HasFile)
                    {
                        string fileName1 = Path.GetFileName(Image_Befor_FileUpload.PostedFile.FileName);
                        Image_Befor_FileUpload.PostedFile.SaveAs( Server.MapPath("/English/Main_Application/Maintenance_Image/") + fileName1);
                        addRequestCmd.Parameters.AddWithValue("@Image_Befor_FileName", fileName1);
                        addRequestCmd.Parameters.AddWithValue("@Image_Befor_Path", "/English/Main_Application/Maintenance_Image/" + fileName1);
                    }
                    else
                    {
                        addRequestCmd.Parameters.AddWithValue("@Image_Befor_FileName", "No File");
                        addRequestCmd.Parameters.AddWithValue("@Image_Befor_Path", "No File");
                    }



                    if (Image_After_FileUpload.HasFile)
                    {
                        string fileName1 = Path.GetFileName(Image_After_FileUpload.PostedFile.FileName);
                        Image_After_FileUpload.PostedFile.SaveAs(  Server.MapPath("/English/Main_Application/Maintenance_Image/") + fileName1);
                        addRequestCmd.Parameters.AddWithValue("@Image_After_FileName", fileName1);
                        addRequestCmd.Parameters.AddWithValue("@Image_After_Path", "/English/Main_Application/Maintenance_Image/" + fileName1);
                    }
                    else
                    {
                        addRequestCmd.Parameters.AddWithValue("@Image_After_FileName", "No File");
                        addRequestCmd.Parameters.AddWithValue("@Image_After_Path", "No File");
                    }


                    addRequestCmd.ExecuteNonQuery();
                    _sqlCon.Close();
                }
                //    Get The Added Request Id
                using (MySqlCommand Get_Request_ID = new MySqlCommand("SELECT MAX(Complaint_Report_Request_Id) AS LastInsertedID from complaint_report_request", _sqlCon))
                {
                    _sqlCon.Open();
                    Get_Request_ID.CommandType = CommandType.Text;
                    object Request_ID = Get_Request_ID.ExecuteScalar();
                    if (Request_ID != null)
                    {
                        Request_id.Text = Request_ID.ToString();
                    }

                    _sqlCon.Close();
                }
                //    insert The Cheques Information in Cheques Tabel in DB
                if (Request_Type_DropDownList.SelectedValue == "1")
                {
                    MySqlCommand com;
                    foreach (GridViewRow g1 in Maintenance_GridView.Rows)
                    {
                        _sqlCon.Open();
                        com = new
                            MySqlCommand("INSERT INTO maintenance_request (" +
                                        "Cost_Direction," +
                                        "Executing_Agency," +
                                        "Technical," +
                                        "Watcher," +
                                        "Activ," +
                                        "Cost," +
                                         "End_Date," +
                                         "Start_Date," +
                                         "assets_Assets_Id  , " +
                                         "maintenance_categoty_Categoty_Id  , " +
                                         "complaint_report_request_Complaint_Report_Request_Id)  " +
                                         "VALUES(" +
                                         "'" + g1.Cells[6].Text + "' ," +
                                         "'" + g1.Cells[7].Text + "' ," +
                                         "'" + Convert.ToInt32(g1.Cells[9].Text) + "' , " +
                                         "'" + Convert.ToInt32(g1.Cells[11].Text) + "' , " +
                                         "'" + g1.Cells[15].Text + "' ," +
                                         "'" + g1.Cells[14].Text + "' ," +
                                         "'" + g1.Cells[13].Text + "' ," +
                                         "'" + g1.Cells[12].Text + "' ," +
                                         "'" + Convert.ToInt32(g1.Cells[5].Text) + "' , " +
                                         "'" + Convert.ToInt32(g1.Cells[3].Text) + "' ," +
                                         "'" + Convert.ToInt32(Request_id.Text) + "')", _sqlCon);
                        com.ExecuteNonQuery();
                        _sqlCon.Close();
                    }
                }
                lbl_Success_Add_New_Maintenance.Text = "تمت الإضافة بنجاح";
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

                Label3.Text = Unitg_ID;
                Label4.Text = MST;


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

        protected void Maintenance_GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["Customers"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["Customers"] = dt;
            BindGrid();
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

                    //Get Maintenance_Guarantor_DropDownList 
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



                    lbl_titel_Add_New_Maintenance.Text = Dt.Rows[0]["EN"].ToString();
                    lbl_Success_Add_New_Maintenance.Text = Dt.Rows[1]["EN"].ToString();
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
                    btn_Add_Request.Text = Dt.Rows[0]["EN"].ToString();
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

                    Start_Date_RegularExpressionValidator.ErrorMessage = " dd/MM/yyyy ";
                    End_Date_RegularExpressionValidator.ErrorMessage = " dd/MM/yyyy  ";




                    Maintenance_GridView.Columns[1].HeaderText = Dt.Rows[22]["EN"].ToString();
                    Maintenance_GridView.Columns[2].HeaderText = Dt.Rows[23]["EN"].ToString();
                    Maintenance_GridView.Columns[4].HeaderText = Dt.Rows[24]["EN"].ToString();
                    Maintenance_GridView.Columns[6].HeaderText = Dt.Rows[25]["EN"].ToString();
                    Maintenance_GridView.Columns[7].HeaderText = Dt.Rows[26]["EN"].ToString();
                    Maintenance_GridView.Columns[8].HeaderText = Dt.Rows[27]["EN"].ToString();
                    Maintenance_GridView.Columns[10].HeaderText = Dt.Rows[28]["EN"].ToString();
                    Maintenance_GridView.Columns[12].HeaderText = Dt.Rows[29]["EN"].ToString();
                    Maintenance_GridView.Columns[13].HeaderText = Dt.Rows[30]["EN"].ToString();
                    Maintenance_GridView.Columns[14].HeaderText = Dt.Rows[31]["EN"].ToString();
                    Maintenance_GridView.Columns[15].HeaderText = Dt.Rows[21]["EN"].ToString();
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
                    Order_Direction_DropDownList.Items.Add(new ListItem("رقابة", "1"));
                    Order_Direction_DropDownList.Items.Add(new ListItem("شؤون العملاء", "2"));
                    Order_Direction_DropDownList.Items.Insert(0, "...............");

                    //Get Order_priority_DropDownList 
                    Order_priority_DropDownList.Items.Clear();
                    Order_priority_DropDownList.Items.Add(new ListItem("تعطيل", "1"));
                    Order_priority_DropDownList.Items.Add(new ListItem("إزعاج مؤقت", "2"));
                    Order_priority_DropDownList.Items.Add(new ListItem("إزعاج عابر", "3"));
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
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("مقاول", "1"));
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("مورد", "2"));
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("مالك", "3"));
                    Maintenance_Guarantor_DropDownList.Items.Add(new ListItem("عميل", "4"));
                    Maintenance_Guarantor_DropDownList.Items.Insert(0, "...............");

                    //Get Executing_Agency_DropDownList 
                    Executing_Agency_DropDownList.Items.Clear();
                    Executing_Agency_DropDownList.Items.Add(new ListItem("فريق الصيانة", "1"));
                    Executing_Agency_DropDownList.Items.Add(new ListItem("مقاول", "2"));
                    Executing_Agency_DropDownList.Items.Add(new ListItem("مورد", "3"));
                    Executing_Agency_DropDownList.Items.Insert(0, "...............");



                    lbl_titel_Add_New_Maintenance.Text = Dt.Rows[0]["AR"].ToString();
                    lbl_Success_Add_New_Maintenance.Text = Dt.Rows[1]["AR"].ToString();
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
                    btn_Add_Request.Text = Dt.Rows[0]["AR"].ToString();
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

                    Start_Date_RegularExpressionValidator.ErrorMessage = " dd/MM/yyyy ";
                    End_Date_RegularExpressionValidator.ErrorMessage = " dd/MM/yyyy  ";


                    Maintenance_GridView.Columns[1].HeaderText = Dt.Rows[22]["AR"].ToString();
                    Maintenance_GridView.Columns[2].HeaderText = Dt.Rows[23]["AR"].ToString();
                    Maintenance_GridView.Columns[4].HeaderText = Dt.Rows[24]["AR"].ToString();
                    Maintenance_GridView.Columns[6].HeaderText = Dt.Rows[25]["AR"].ToString();
                    Maintenance_GridView.Columns[7].HeaderText = Dt.Rows[26]["AR"].ToString();
                    Maintenance_GridView.Columns[8].HeaderText = Dt.Rows[27]["AR"].ToString();
                    Maintenance_GridView.Columns[10].HeaderText = Dt.Rows[28]["AR"].ToString();
                    Maintenance_GridView.Columns[12].HeaderText = Dt.Rows[29]["AR"].ToString();
                    Maintenance_GridView.Columns[13].HeaderText = Dt.Rows[30]["AR"].ToString();
                    Maintenance_GridView.Columns[14].HeaderText = Dt.Rows[31]["AR"].ToString();
                    Maintenance_GridView.Columns[15].HeaderText = Dt.Rows[21]["AR"].ToString();
                }
            }
            _sqlCon.Close();
        }
    }
}