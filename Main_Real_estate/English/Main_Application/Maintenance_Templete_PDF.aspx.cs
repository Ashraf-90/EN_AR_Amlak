using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.EnterpriseServices;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Maintenance_Templete_PDF : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Asset_Management", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();


                Helper.LoadDropDownList("SELECT * FROM maintenece_templete  GROUP BY Date",
               _sqlCon, date_DropDownList, "Date", "Maintenece_Templete_Id");
                date_DropDownList.Items.Insert(0, "...............");


                Pickup_Delivery_Listt();
            }
        }
        //******************  Get The Building Of Selected Ownership ***************************************************
        protected void Ownership_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (Session["Langues"].ToString() == "1")
            {
                if (Ownership_Name_DropDownList.SelectedItem.Text == "...............")
                {
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList,
                        "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");
                }
                else
                {
                    Helper.LoadDropDownList(
                   "SELECT * FROM building where Active ='1' and owner_ship_Owner_Ship_Id = '" +
                   Ownership_Name_DropDownList.SelectedValue + "'", _sqlCon, Building_Name_DropDownList,
                   "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");
                }
            }
            else
            {
                if (Ownership_Name_DropDownList.SelectedItem.Text == "...............")
                {
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList,
                        "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");
                }
                else
                {
                    Helper.LoadDropDownList(
                   "SELECT * FROM building where Active ='1' and owner_ship_Owner_Ship_Id = '" +
                   Ownership_Name_DropDownList.SelectedValue + "'", _sqlCon, Building_Name_DropDownList,
                   "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");
                }
            }

                
            Pickup_Delivery_Listt();
        }

        protected void Building_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Building_Name_DropDownList.SelectedItem.Text == "...............")
            {
                Helper.LoadDropDownList("SELECT * FROM maintenece_templete  GROUP BY Date",
               _sqlCon, date_DropDownList, "Date", "Maintenece_Templete_Id");
                date_DropDownList.Items.Insert(0, "...............");
            }
            else
            {
                Helper.LoadDropDownList("SELECT * FROM maintenece_templete where Building_ID = '" + Building_Name_DropDownList.SelectedValue + "' GROUP BY Building_ID",
                _sqlCon, date_DropDownList, "Date", "Maintenece_Templete_Id");
                date_DropDownList.Items.Insert(0, "...............");
            }
            Pickup_Delivery_Listt();
        }

        protected void Employee_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pickup_Delivery_Listt();
        }
        protected void date_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pickup_Delivery_Listt();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string getZoneQuari = "SELECT MT.* , T.Tenants_Arabic_Name , B.Building_Arabic_Name , " +
                "(SELECT IF(Clean= 1, '✔', '')) R_Clean  , " +
                "(SELECT IF(Save= 1, '✔', '')) R_Save  , " +
                "(SELECT IF(Maintenece= 1, '✔', '')) R_Maintenece  , " +
                "(SELECT IF(disclaimer= 1, '✔', '')) R_disclaimer ,  " +
                "(SELECT IF(Last_Maintenece_Type= 1, 'دورية', 'حادثة')) R_Last_Maintenece_Type , " +
                "(SELECT IF(Last_Clean_Type= 1, 'دورية', 'حادثة')) R_Last_Clean_Type  " +
                "FROM maintenece_templete MT " +
                " left join tenants T on (MT.Employee_ID = T.Tenants_ID) " +
                "left join building B on (MT.Building_ID = B.Building_Id) " +
                "where Employee_ID = '"+Employee_Name_DropDownList.SelectedValue+"' " +
                "and MT.Building_ID = '"+Building_Name_DropDownList.SelectedValue+"' and Date='"+date_DropDownList.SelectedItem.Text.Trim()+"'";
            
            
            
            
            MySqlCommand getZoneCmd = new MySqlCommand(getZoneQuari, _sqlCon);
            MySqlDataAdapter getZoneDt = new MySqlDataAdapter(getZoneCmd);
            getZoneCmd.Connection = _sqlCon;
            _sqlCon.Open();
            getZoneDt.SelectCommand = getZoneCmd;
            DataTable getZoneDataTable = new DataTable();
            getZoneDt.Fill(getZoneDataTable);
            Repeater1.DataSource = getZoneDataTable;
            Repeater1.DataBind();
            _sqlCon.Close();

            printt.Visible = true;
        }

        








        protected void Pickup_Delivery_Listt()
        {
            string OS_ID = ""; string B_ID = ""; ; string Date = ""; string Employee = "";

            if (Ownership_Name_DropDownList.SelectedItem.Text != "...............") { OS_ID = " and O.Owner_Ship_Id = " + Ownership_Name_DropDownList.SelectedValue; } else { OS_ID = ""; }
            if (Building_Name_DropDownList.SelectedItem.Text != "...............") { B_ID = " and B.Building_Id = " + Building_Name_DropDownList.SelectedValue; } else { B_ID = ""; }
            if (date_DropDownList.SelectedItem.Text != "...............") { Date = " and Date = '" + date_DropDownList.SelectedItem.Text.Trim() + "'"; } else { Date = ""; }
            if (Employee_Name_DropDownList.SelectedItem.Text != "...............") { Employee = " and MT.Employee_ID = " + Employee_Name_DropDownList.SelectedValue; } else { Employee = ""; }

            string getpickup_deliveryQuari = "SELECT MT.* , E.Employee_Arabic_name , E.Employee_English_name , " +
                " B.Building_Arabic_Name , B.Building_English_Name , B.Building_Id , " +
                " O. Owner_Ship_AR_Name , O. Owner_Ship_EN_Name , O.Owner_Ship_Id " +
                " FROM maintenece_templete MT " +
                "left join building B on (MT.Building_ID = B.Building_Id) " +
                "left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) " +
            "left join employee E on (MT.Employee_ID = E.Employee_Id) " +
            "where MT.Building_ID > 0  " + OS_ID + "  " + B_ID + "      " + Employee + "  " + Date + " " +
            "group by  MT.Building_ID ";


            MySqlCommand getpickup_deliveryCmd = new MySqlCommand(getpickup_deliveryQuari, _sqlCon);
            MySqlDataAdapter getpickup_deliveryDt = new MySqlDataAdapter(getpickup_deliveryCmd);
            getpickup_deliveryCmd.Connection = _sqlCon;
            _sqlCon.Open();
            getpickup_deliveryDt.SelectCommand = getpickup_deliveryCmd;
            DataTable getpickup_deliveryDataTable = new DataTable();
            getpickup_deliveryDt.Fill(getpickup_deliveryDataTable);
            Maintenance_Templete_List.DataSource = getpickup_deliveryDataTable;
            Maintenance_Templete_List.DataBind();
            _sqlCon.Close();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;

            string QQ = "SELECT MT.* , E.Employee_Arabic_name , E.Employee_English_name , E.Employee_ID , B.Building_Arabic_Name , B.Building_English_Name , B.Building_Id " +
                "FROM maintenece_templete MT   " +
                "left join employee E on (MT.Employee_ID = E.Employee_Id)   " +
                "left join building B on (MT.Building_ID = B.Building_Id)   " +
                "WHERE Maintenece_Templete_Id = @ID";

            DataTable getpickup_deliveryDt = new DataTable();
            _sqlCon.Open();
            MySqlCommand getpickup_deliveryCmd = new MySqlCommand(QQ, _sqlCon);
            MySqlDataAdapter getpickup_deliveryDa = new MySqlDataAdapter(getpickup_deliveryCmd);
            getpickup_deliveryCmd.Parameters.AddWithValue("@ID", id);
            getpickup_deliveryDa.Fill(getpickup_deliveryDt);
            if (getpickup_deliveryDt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    string Employee_Id = getpickup_deliveryDt.Rows[0]["Employee_ID"].ToString();
                    string Employee_Name = getpickup_deliveryDt.Rows[0]["Employee_English_name"].ToString();
                    string Building_Id = getpickup_deliveryDt.Rows[0]["Building_Id"].ToString();
                    string Building_Name = getpickup_deliveryDt.Rows[0]["Building_English_Name"].ToString();
                    string Date = getpickup_deliveryDt.Rows[0]["Date"].ToString();
                    Label1.Text = Employee_Id;
                    Label2.Text = Employee_Name;
                    Label3.Text = Building_Id;
                    Label4.Text = Building_Name;
                    Label5.Text = Date;
                }
                else
                {
                    string Employee_Id = getpickup_deliveryDt.Rows[0]["Employee_ID"].ToString();
                    string Employee_Name = getpickup_deliveryDt.Rows[0]["Employee_Arabic_name"].ToString();
                    string Building_Id = getpickup_deliveryDt.Rows[0]["Building_Id"].ToString();
                    string Building_Name = getpickup_deliveryDt.Rows[0]["Building_Arabic_Name"].ToString();
                    string Date = getpickup_deliveryDt.Rows[0]["Date"].ToString();
                    Label1.Text = Employee_Id;
                    Label2.Text = Employee_Name;
                    Label3.Text = Building_Id;
                    Label4.Text = Building_Name;
                    Label5.Text = Date;
                }
                    


                












                string getZoneQuari = "SELECT MT.* , T.Tenants_Arabic_Name , B.Building_Arabic_Name , " +
                "(SELECT IF(Clean= 1, '✔', '')) R_Clean  , " +
                "(SELECT IF(Save= 1, '✔', '')) R_Save  , " +
                "(SELECT IF(Maintenece= 1, '✔', '')) R_Maintenece  , " +
                "(SELECT IF(disclaimer= 1, '✔', '')) R_disclaimer ,  " +
                "(SELECT IF(Last_Maintenece_Type= 1, 'دورية', 'حادثة')) R_Last_Maintenece_Type , " +
                "(SELECT IF(Last_Clean_Type= 1, 'دورية', 'حادثة')) R_Last_Clean_Type  " +
                "FROM maintenece_templete MT " +
                " left join tenants T on (MT.Employee_ID = T.Tenants_ID) " +
                "left join building B on (MT.Building_ID = B.Building_Id) " +
                "where Employee_ID = '" + Label1.Text + "' " +
                "and MT.Building_ID = '" + Label3.Text + "' and Date='" + Label5.Text + "'";




                MySqlCommand getZoneCmd = new MySqlCommand(getZoneQuari, _sqlCon);
                MySqlDataAdapter getZoneDt = new MySqlDataAdapter(getZoneCmd);
                getZoneCmd.Connection = _sqlCon;
                getZoneDt.SelectCommand = getZoneCmd;
                DataTable getZoneDataTable = new DataTable();
                getZoneDt.Fill(getZoneDataTable);
                Repeater1.DataSource = getZoneDataTable;
                Repeater1.DataBind();

                printt.Visible = true;


                _sqlCon.Close();

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
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_maintenance", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_EN_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Employee Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Employee_Name_DropDownList, "Employee_English_name", "Employee_Id");
                    Employee_Name_DropDownList.Items.Insert(0, "...............");


                    lbl_Titel.Text = Dt.Rows[111]["EN"].ToString();
                    lbl_Employee_Name.Text = Dt.Rows[44]["EN"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[83]["EN"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[7]["EN"].ToString();
                    lbl_date.Text = Dt.Rows[64]["EN"].ToString();


                }
                else
                {

                    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_AR_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Employee Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, Employee_Name_DropDownList, "Employee_Arabic_name", "Employee_Id");
                    Employee_Name_DropDownList.Items.Insert(0, "...............");





                    lbl_Titel.Text = Dt.Rows[111]["AR"].ToString();
                    lbl_Employee_Name.Text = Dt.Rows[44]["AR"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[83]["AR"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[7]["AR"].ToString();
                    lbl_date.Text = Dt.Rows[64]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }

        protected void Maintenance_Templete_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Tbl_H_Ownership = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tbl_H_Ownership");
                var lbl_Tbl_H_Building = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tbl_H_Building");
                var lbl_Tbl_H_Observer = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tbl_H_Observer");
                var lbl_Tbl_H_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tbl_H_Date");

                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_maintenance", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Tbl_H_Ownership.Text = Dt.Rows[83]["EN"].ToString();
                        lbl_Tbl_H_Building.Text = Dt.Rows[7]["EN"].ToString();
                        lbl_Tbl_H_Observer.Text = Dt.Rows[8]["EN"].ToString();
                        lbl_Tbl_H_Date.Text = Dt.Rows[64]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Tbl_H_Ownership.Text = Dt.Rows[83]["AR"].ToString();
                        lbl_Tbl_H_Building.Text = Dt.Rows[7]["AR"].ToString();
                        lbl_Tbl_H_Observer.Text = Dt.Rows[8]["AR"].ToString();
                        lbl_Tbl_H_Date.Text = Dt.Rows[64]["AR"].ToString();
                    }
                }
                
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");
                var lbl_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Name");
                var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");
                var lbl_Employee_Arabic_name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Employee_Arabic_name");
                var lbl_Employee_English_name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Employee_English_name");


                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Owner_Ship_AR_Name.Visible= false; lbl_Owner_Ship_EN_Name.Visible = true;
                    lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                    lbl_Employee_Arabic_name.Visible = false; lbl_Employee_English_name.Visible = true;
                }
                else
                {
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;
                    lbl_Employee_Arabic_name.Visible = true; lbl_Employee_English_name.Visible = false;
                }
            }
        }




        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Com_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Com_Name");
                var lbl_Temp_Titel = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Temp_Titel");
                var lbl_Titel_Employee = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Employee");
                var lbl_Titel_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Date");
                var lbl_Titel_Building = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building");
                var lbl_Titel_Location_Ifo = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Location_Ifo");
                var lbl_Titel_One = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_One");
                var lbl_Titel_Two = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Two");
                var lbl_Titel_Three = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Three");
                var lbl_Titel_Four = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Four");
                var lbl_Titel_Five = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Five");
                var lbl_Titel_Six = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Six");



                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_maintenance", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Com_Name.Text = Dt.Rows[47]["EN"].ToString();
                        lbl_Temp_Titel.Text = Dt.Rows[111]["EN"].ToString();
                        lbl_Titel_Employee.Text = Dt.Rows[28]["EN"].ToString();
                        lbl_Titel_Date.Text = Dt.Rows[64]["EN"].ToString();
                        lbl_Titel_Building.Text = Dt.Rows[7]["EN"].ToString();
                        lbl_Titel_Location_Ifo.Text = Dt.Rows[88]["EN"].ToString();
                        lbl_Titel_One.Text = Dt.Rows[89]["EN"].ToString();
                        lbl_Titel_Two.Text = Dt.Rows[90]["EN"].ToString();
                        lbl_Titel_Three.Text = Dt.Rows[91]["EN"].ToString();
                        lbl_Titel_Four.Text = Dt.Rows[92]["EN"].ToString();
                        lbl_Titel_Five.Text = Dt.Rows[93]["EN"].ToString();
                        lbl_Titel_Six.Text = Dt.Rows[71]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Com_Name.Text = Dt.Rows[47]["AR"].ToString();
                        lbl_Temp_Titel.Text = Dt.Rows[111]["AR"].ToString();
                        lbl_Titel_Employee.Text = Dt.Rows[28]["AR"].ToString();
                        lbl_Titel_Date.Text = Dt.Rows[64]["AR"].ToString();
                        lbl_Titel_Building.Text = Dt.Rows[7]["AR"].ToString();
                        lbl_Titel_Location_Ifo.Text = Dt.Rows[88]["AR"].ToString();
                        lbl_Titel_One.Text = Dt.Rows[89]["AR"].ToString();
                        lbl_Titel_Two.Text = Dt.Rows[90]["AR"].ToString();
                        lbl_Titel_Three.Text = Dt.Rows[91]["AR"].ToString();
                        lbl_Titel_Four.Text = Dt.Rows[92]["AR"].ToString();
                        lbl_Titel_Five.Text = Dt.Rows[93]["AR"].ToString();
                        lbl_Titel_Six.Text = Dt.Rows[71]["AR"].ToString();

                    }
                }
            }



                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Label lbl_Titel_LastMaintenance_Date = (e.Item.FindControl("lbl_Titel_LastMaintenance_Date") as Label);
                    Label lbl_T_Last_Maintenece_Type = (e.Item.FindControl("lbl_T_Last_Maintenece_Type") as Label);
                    Label lbl_Titel_Last_Clean_Date = (e.Item.FindControl("lbl_Titel_Last_Clean_Date") as Label);
                    Label lbl_T_Last_Clean_Type = (e.Item.FindControl("lbl_T_Last_Clean_Type") as Label);
                    Label lbl_T_Discription = (e.Item.FindControl("lbl_T_Discription") as Label);

                Label lbl_Last_Maintenece_Date = (e.Item.FindControl("lbl_Last_Maintenece_Date") as Label);
                    HtmlTableRow tr2 = e.Item.FindControl("row2") as HtmlTableRow;
                    if (lbl_Last_Maintenece_Date.Text == "") { tr2.Visible = false; }




                    Label lbl_Discription = (e.Item.FindControl("lbl_Discription") as Label);
                    HtmlTableRow Tr2 = e.Item.FindControl("Tr2") as HtmlTableRow;
                    if (lbl_Discription.Text == "") { Tr2.Visible = false; }




                    Label lbl_Type = (e.Item.FindControl("lbl_Type") as Label);
                    HtmlTableRow row = e.Item.FindControl("row") as HtmlTableRow;
                    if (lbl_Type.Text == "معلومات") { row.Visible = false; }

                    DataTable Dt = new DataTable();
                    MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_maintenance", _sqlCon);
                    MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                    Da.Fill(Dt);
                    if (Dt.Rows.Count > 0)
                    {
                        if (Session["Langues"].ToString() == "1")
                        {
                            if (lbl_Type.Text == "مواقف") { lbl_Type.Text = Dt.Rows[94]["EN"].ToString(); }
                            else if (lbl_Type.Text == "مداخل") { lbl_Type.Text = Dt.Rows[95]["EN"].ToString(); }
                            else if (lbl_Type.Text == "الدرج") { lbl_Type.Text = Dt.Rows[96]["EN"].ToString(); }
                            else if (lbl_Type.Text == "السطح") { lbl_Type.Text = Dt.Rows[97]["EN"].ToString(); }
                            else if (lbl_Type.Text == "القبو") { lbl_Type.Text = Dt.Rows[98]["EN"].ToString(); }
                            else if (lbl_Type.Text == "غرفة المولد") { lbl_Type.Text = Dt.Rows[99]["EN"].ToString(); }
                            else if (lbl_Type.Text == "غرفة الكهرباء") { lbl_Type.Text = Dt.Rows[100]["EN"].ToString(); }
                            else if (lbl_Type.Text == "غرفة الدفاع المدني") { lbl_Type.Text = Dt.Rows[101]["EN"].ToString(); }
                            else if (lbl_Type.Text == "مكب القمامة") { lbl_Type.Text = Dt.Rows[102]["EN"].ToString(); }
                            else if (lbl_Type.Text == "المصاعد") { lbl_Type.Text = Dt.Rows[103]["EN"].ToString(); }
                            else if (lbl_Type.Text == "الممرات") { lbl_Type.Text = Dt.Rows[104]["EN"].ToString(); }
                            else if (lbl_Type.Text == "أجهزة عامة / أثاث عام") { lbl_Type.Text = Dt.Rows[105]["EN"].ToString(); }

                            lbl_Titel_LastMaintenance_Date.Text = Dt.Rows[106]["EN"].ToString();
                            lbl_T_Last_Maintenece_Type.Text = Dt.Rows[108]["EN"].ToString();
                            lbl_Titel_Last_Clean_Date.Text = Dt.Rows[107]["EN"].ToString();
                            lbl_T_Last_Clean_Type.Text = Dt.Rows[108]["EN"].ToString();
                            lbl_T_Discription.Text = Dt.Rows[65]["EN"].ToString();
                        }
                        else
                        {
                            lbl_Titel_LastMaintenance_Date.Text = Dt.Rows[106]["AR"].ToString();
                            lbl_T_Last_Maintenece_Type.Text = Dt.Rows[108]["AR"].ToString();
                            lbl_Titel_Last_Clean_Date.Text = Dt.Rows[107]["AR"].ToString();
                            lbl_T_Last_Clean_Type.Text = Dt.Rows[108]["AR"].ToString();
                            lbl_T_Discription.Text = Dt.Rows[65]["AR"].ToString();      
                        }
                       
                    }






                    Label lbl_R_Last_Maintenece_Type = (e.Item.FindControl("lbl_R_Last_Maintenece_Type") as Label);
                    Label lbl_R_Last_Clean_Type = (e.Item.FindControl("lbl_R_Last_Clean_Type") as Label);

                    if (Session["Langues"].ToString() == "1")
                    {
                        if (lbl_R_Last_Maintenece_Type.Text == "1") { lbl_R_Last_Maintenece_Type.Text = "Periodically"; } else { lbl_R_Last_Maintenece_Type.Text = "Non-Periodic"; }
                        if (lbl_R_Last_Clean_Type.Text == "1") { lbl_R_Last_Clean_Type.Text = "Periodically"; } else { lbl_R_Last_Clean_Type.Text = "Non-Periodic"; }
                    }
                    else
                    {
                        if (lbl_R_Last_Maintenece_Type.Text == "1") { lbl_R_Last_Maintenece_Type.Text = "دورية"; } else { lbl_R_Last_Maintenece_Type.Text = "حادثة"; }
                        if (lbl_R_Last_Clean_Type.Text == "1") { lbl_R_Last_Clean_Type.Text = "دورية"; } else { lbl_R_Last_Clean_Type.Text = "حادثة"; }
                    }
                    







                    Control HeaderTemplate = Repeater1.Controls[0].Controls[0]; //lbl_Type
                    Label lbl_Employee = HeaderTemplate.FindControl("lbl_Employee") as Label;
                    Label lbl_Date = HeaderTemplate.FindControl("lbl_Date") as Label;
                    Label lbl_Building = HeaderTemplate.FindControl("lbl_Building") as Label;

                    lbl_Building.Text = Label4.Text;
                    lbl_Date.Text = Label5.Text;
                    lbl_Employee.Text = Label2.Text;










                }
            
        }
    }
}