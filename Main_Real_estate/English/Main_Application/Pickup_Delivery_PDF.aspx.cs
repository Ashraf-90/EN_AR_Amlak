using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text;
using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Security.Policy;
using System.Web.Services.Description;
using Main_Real_estate.English.Master_Panal;


namespace Main_Real_estate.English.Main_Application
{
    public partial class Pickup_Delivery_PDF : System.Web.UI.Page
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

                //Fill Units Name DropDownList
                Helper.LoadDropDownList("SELECT * FROM units Where Half ='0'", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
                Units_DropDownList.Items.Insert(0, "...............");

                date_DropDownList.Items.Insert(0, "...............");

                Pickup_Delivery_Listt();
            }
        }
        protected void Tenan_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pickup_Delivery_Listt();
        }

        //******************  Get The Building Of Selected Ownership ***************************************************
        protected void Ownership_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(Ownership_Name_DropDownList.SelectedItem.Text == "...............")
            {
                if (Session["Langues"].ToString() == "1")
                {
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");
                }
                else
                {
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");
                }
                    
            }
            else
            {

                if (Session["Langues"].ToString() == "1")
                {
                    Helper.LoadDropDownList("SELECT * FROM building where Active ='1' and owner_ship_Owner_Ship_Id = '" +
                    Ownership_Name_DropDownList.SelectedValue + "'", _sqlCon, Building_Name_DropDownList,
                    "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");
                }
                else
                {
                    Helper.LoadDropDownList("SELECT * FROM building where Active ='1' and owner_ship_Owner_Ship_Id = '" +
                    Ownership_Name_DropDownList.SelectedValue + "'", _sqlCon, Building_Name_DropDownList,
                    "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");
                }

                    
            }
            Pickup_Delivery_Listt();
        }
        //******************  Get The Units Of Selected Building ***************************************************
        protected void Building_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

            if(Building_Name_DropDownList.SelectedItem.Text == "...............")
            {
                Helper.LoadDropDownList("SELECT * FROM units Where Half ='0'", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
                Units_DropDownList.Items.Insert(0, "...............");
            }
            else
            {
                Helper.LoadDropDownList("SELECT * FROM units where Half ='0' and building_Building_Id = '" + Building_Name_DropDownList.SelectedValue + "'", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
                Units_DropDownList.Items.Insert(0, "...............");
            }
            Pickup_Delivery_Listt();
        }
        protected void Units_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(Units_DropDownList.SelectedItem.Text == "...............")
            {
                Helper.LoadDropDownList("SELECT * FROM pickup_delivery group by Date ", _sqlCon, date_DropDownList, "Date", "Pickup_Delivery_Id");
                date_DropDownList.Items.Insert(0, "...............");

            }
            else
            {
                Helper.LoadDropDownList("SELECT * FROM pickup_delivery where Unit_Id = '" + Units_DropDownList.SelectedValue + "' GROUP BY Unit_Id",
                _sqlCon, date_DropDownList, "Date", "Pickup_Delivery_Id");
                date_DropDownList.Items.Insert(0, "...............");
            }
            Pickup_Delivery_Listt();
        }
        protected void Prosees_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pickup_Delivery_Listt();
        }
        protected void date_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pickup_Delivery_Listt();
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Control HeaderTemplate = Repeater1.Controls[0].Controls[0]; //lbl_Type
                Label lbl_Titel_One = HeaderTemplate.FindControl("lbl_Titel_One") as Label;
                Label lbl_Titel_Two = HeaderTemplate.FindControl("lbl_Titel_Two") as Label;
                Label lbl_Titel_Three = HeaderTemplate.FindControl("lbl_Titel_Three") as Label;
                Label lbl_Titel_Four = HeaderTemplate.FindControl("lbl_Titel_Four") as Label;
                Label lbl_Titel_Five = HeaderTemplate.FindControl("lbl_Titel_Five") as Label;
                Label lbl_List = HeaderTemplate.FindControl("lbl_List") as Label;
                Label lbl_Status = HeaderTemplate.FindControl("lbl_Status") as Label;
                Label lbl_Note = HeaderTemplate.FindControl("lbl_Note") as Label;
                Label lbl_Building = HeaderTemplate.FindControl("lbl_Building") as Label;
                Label lbl_Unit = HeaderTemplate.FindControl("lbl_Unit") as Label;
                Label lbl_Date = HeaderTemplate.FindControl("lbl_Date") as Label;
                Label lbl_Prosess = HeaderTemplate.FindControl("lbl_Prosess") as Label;
                lbl_Unit.Text = Label2.Text;
                lbl_Building.Text = Label5.Text;
                lbl_Date.Text = Label4.Text;
                lbl_Prosess.Text = Label3.Text;

                var lbl_Titel_Good = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Good");
                var lbl_Titel_Bad = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Bad");
                var lbl_Titel_Note = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Note");
                var lbl_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Type");



                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_maintenance", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_One.Text = Dt.Rows[47]["EN"].ToString();
                        lbl_Titel_Two.Text = Dt.Rows[85]["EN"].ToString();
                        lbl_Titel_Three.Text = Dt.Rows[45]["EN"].ToString();
                        lbl_Titel_Four.Text = Dt.Rows[64]["EN"].ToString();
                        lbl_Titel_Five.Text = Dt.Rows[84]["EN"].ToString();

                        lbl_List.Text = Dt.Rows[69]["EN"].ToString();
                        lbl_Status.Text = Dt.Rows[70]["EN"].ToString();
                        lbl_Note.Text = Dt.Rows[71]["EN"].ToString();

                        lbl_Titel_Good.Text = Dt.Rows[86]["EN"].ToString();
                        lbl_Titel_Bad.Text = Dt.Rows[87]["EN"].ToString();
                        lbl_Titel_Note.Text = Dt.Rows[71]["EN"].ToString();


                        if (lbl_Type.Text == "المفاتيح") { lbl_Type.Text = Dt.Rows[72]["EN"].ToString(); }
                        else if (lbl_Type.Text == "الأثاث") { lbl_Type.Text = Dt.Rows[73]["EN"].ToString(); }
                        else if (lbl_Type.Text == "الأجهزة المنزلية") { lbl_Type.Text = Dt.Rows[74]["EN"].ToString(); }
                        else if (lbl_Type.Text == "المطبخ") { lbl_Type.Text = Dt.Rows[75]["EN"].ToString(); }
                        else if (lbl_Type.Text == "المنافذ الكهربائية") { lbl_Type.Text = Dt.Rows[76]["EN"].ToString(); }
                        else if (lbl_Type.Text == "الأرضيات") { lbl_Type.Text = Dt.Rows[77]["EN"].ToString(); }
                        else if (lbl_Type.Text == "الحمامات / غرف الغسيل") { lbl_Type.Text = Dt.Rows[78]["EN"].ToString(); }
                        else if (lbl_Type.Text == "الجدران و الأسقف") { lbl_Type.Text = Dt.Rows[79]["EN"].ToString(); }
                        else if (lbl_Type.Text == "الأبواب") { lbl_Type.Text = Dt.Rows[80]["EN"].ToString(); }
                        else if (lbl_Type.Text == "النوافذ") { lbl_Type.Text = Dt.Rows[81]["EN"].ToString(); }
                        else if (lbl_Type.Text == "المكيفات") { lbl_Type.Text = Dt.Rows[82]["EN"].ToString(); }
                    }
                    else
                    {
                        lbl_Titel_One.Text = Dt.Rows[47]["AR"].ToString();
                        lbl_Titel_Two.Text = Dt.Rows[85]["AR"].ToString();
                        lbl_Titel_Three.Text = Dt.Rows[45]["AR"].ToString();
                        lbl_Titel_Four.Text = Dt.Rows[64]["AR"].ToString();
                        lbl_Titel_Five.Text = Dt.Rows[84]["AR"].ToString();

                        lbl_List.Text = Dt.Rows[69]["AR"].ToString();
                        lbl_Status.Text = Dt.Rows[70]["AR"].ToString();
                        lbl_Note.Text = Dt.Rows[71]["AR"].ToString();

                        lbl_Titel_Good.Text = Dt.Rows[86]["AR"].ToString();
                        lbl_Titel_Bad.Text = Dt.Rows[87]["AR"].ToString();
                        lbl_Titel_Note.Text = Dt.Rows[71]["AR"].ToString();
                    }
                }
            }



            foreach (RepeaterItem ri in Repeater1.Items)
            {
                Label lbl_Type = (ri.FindControl("lbl_Type") as Label);
                Label lbl_Discription = (ri.FindControl("lbl_Discription") as Label);
                HtmlTableRow tr = ri.FindControl("row") as HtmlTableRow;
                HtmlTableRow tr2 = ri.FindControl("row2") as HtmlTableRow;


                if (lbl_Type.Text == "ملاحظات") {  tr.Visible= false; }
                if (lbl_Discription.Text == "") { tr2.Visible = false; }
            }
        }


        protected void Pickup_Delivery_Listt()
        {
            string OS_ID = ""; string B_ID = ""; string U_ID = ""; string Date = ""; string Prosses = ""; string Tenant = "";
            if (Ownership_Name_DropDownList.SelectedItem.Text != "...............") { OS_ID = " and O.Owner_Ship_Id = " + Ownership_Name_DropDownList.SelectedValue; } else { OS_ID = ""; }
            if (Building_Name_DropDownList.SelectedItem.Text != "...............") { B_ID = " and B.Building_Id = " + Building_Name_DropDownList.SelectedValue; } else { B_ID = ""; }
            if (Units_DropDownList.SelectedItem.Text != "...............") { U_ID = " and U.Unit_ID = " + Units_DropDownList.SelectedValue; } else { U_ID = ""; }
            if (date_DropDownList.SelectedItem.Text != "...............") { Date = " and Date = '"+ date_DropDownList.SelectedItem.Text.Trim()+ "'"; } else { Date = ""; }
            if (Prosees_DropDownList.SelectedItem.Text != "...............") { Prosses = " and PD.Prosses = " + Prosees_DropDownList.SelectedValue; } else { Prosses = ""; }
            if (Tenan_Name_DropDownList.SelectedItem.Text != "...............") { Tenant = " and T.Tenants_ID = " + Tenan_Name_DropDownList.SelectedValue; } else { Tenant = ""; }

            string getpickup_deliveryQuari = "SELECT PD.* ,  " +
                "U.Unit_Number , U.Unit_ID , " +
                "B.Building_Arabic_Name , B.Building_English_Name , B.Building_Id , " +
                " O. Owner_Ship_AR_Name , O. Owner_Ship_EN_Name , O.Owner_Ship_Id ,  T.Tenants_Arabic_Name , T.Tenants_English_Name , T.Tenants_ID ," +
                "(SELECT IF(PD.Prosses = 1, 'تسليم', 'إستلام'))Prossess " +
                "FROM pickup_delivery PD " +
                "left join units U on (PD.Unit_Id = U.Unit_ID) " +
                "left join building B on (U.building_Building_Id = B.Building_Id) " +
                "left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) " +
                "left join tenants T on (PD.Tenant_ID = T.Tenants_ID) " +

                "where PD.Pickup_Delivery_Id > 0  " + OS_ID + "  "+ B_ID + "  "+ U_ID + " "+ Date + "   "+ Prosses + "  "+ Tenant + " " +
                "group by PD.Unit_Id ";


            MySqlCommand getpickup_deliveryCmd = new MySqlCommand(getpickup_deliveryQuari, _sqlCon);
            MySqlDataAdapter getpickup_deliveryDt = new MySqlDataAdapter(getpickup_deliveryCmd);
            getpickup_deliveryCmd.Connection = _sqlCon;
            _sqlCon.Open();
            getpickup_deliveryDt.SelectCommand = getpickup_deliveryCmd;
            DataTable getpickup_deliveryDataTable = new DataTable();
            getpickup_deliveryDt.Fill(getpickup_deliveryDataTable);
            Pickup_Delivery_List.DataSource = getpickup_deliveryDataTable;
            Pickup_Delivery_List.DataBind();
            _sqlCon.Close();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            string QQ = "SELECT PD.* , U.Unit_Number , U.Unit_ID , B.Building_Arabic_Name , B.Building_English_Name , B.Building_Id  " +
                "FROM pickup_delivery PD " +
                " left join units U on (PD.Unit_Id = U.Unit_ID) " +
                "left join building B on (U.building_Building_Id = B.Building_Id) " +
                "WHERE Pickup_Delivery_Id = @ID";

            DataTable getpickup_deliveryDt = new DataTable();
            _sqlCon.Open();
            MySqlCommand getpickup_deliveryCmd = new MySqlCommand(QQ, _sqlCon);
            MySqlDataAdapter getpickup_deliveryDa = new MySqlDataAdapter(getpickup_deliveryCmd);
            getpickup_deliveryCmd.Parameters.AddWithValue("@ID", id);
            getpickup_deliveryDa.Fill(getpickup_deliveryDt);
            if (getpickup_deliveryDt.Rows.Count > 0)
            {
                string Unit_Id = getpickup_deliveryDt.Rows[0]["Unit_ID"].ToString();

                string Unit_Number = getpickup_deliveryDt.Rows[0]["Unit_Number"].ToString();
                string Building_Arabic_Name = getpickup_deliveryDt.Rows[0]["Building_Arabic_Name"].ToString();
                string Building_English_Name = getpickup_deliveryDt.Rows[0]["Building_English_Name"].ToString();
                string Prosses = getpickup_deliveryDt.Rows[0]["Prosses"].ToString();
                string Date = getpickup_deliveryDt.Rows[0]["Date"].ToString();


                if (Session["Langues"].ToString() == "1")
                {
                    Label2.Text = Unit_Number;
                    Label5.Text = Building_English_Name;
                    if (Prosses == "1") { Label3.Text = "Receive"; }
                    else { Label3.Text = "Receive"; }
                    Label4.Text = Date;
                }
                else
                {
                    Label2.Text = Unit_Number;
                    Label5.Text = Building_Arabic_Name;
                    if (Prosses == "1") { Label3.Text = "تسليم"; }
                    else { Label3.Text = "إستلام"; }
                    Label4.Text = Date;
                }
                    



                string getZoneQuari = "SELECT PD.* , B.Building_Arabic_Name , O.Owner_Ship_AR_Name , Z.zone_arabic_name , " +
                "(SELECT IF(Status= 1, '✔', '')) good ,  " +
                "(SELECT IF(Status= 1, '', '✔')) bad  , " +
                "(SELECT IF(Prosses= 1, 'تسليم', 'إستلام')) Prossess   " +
                "FROM pickup_delivery PD " +
                "left join building B on (PD.Unit_Id = B.Building_Id)  " +
                "left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) " +
                "left join zone Z on (O.zone_zone_Id = Z.zone_Id) " +
                "where Unit_Id='" + Unit_Id + "' and Prosses='" + Prosses + "' and Date='" + Date + "'";
                MySqlCommand getZoneCmd = new MySqlCommand(getZoneQuari, _sqlCon);
                MySqlDataAdapter getZoneDt = new MySqlDataAdapter(getZoneCmd);
                getZoneCmd.Connection = _sqlCon;
                getZoneDt.SelectCommand = getZoneCmd;
                DataTable getZoneDataTable = new DataTable();
                getZoneDt.Fill(getZoneDataTable);
                Repeater1.DataSource = getZoneDataTable;
                Repeater1.DataBind();

                printt.Visible = true;
            }

            _sqlCon.Close();
        }






















        protected void Button1_Click1(object sender, EventArgs e)
        {
            string getZoneQuari = "SELECT PD.* , B.Building_Arabic_Name , O.Owner_Ship_AR_Name , Z.zone_arabic_name , " +
                "(SELECT IF(Status= 1, '✔', '')) good ,  " +
                "(SELECT IF(Status= 1, '', '✔')) bad  , " +
                "(SELECT IF(Prosses= 1, 'تسليم', 'إستلام')) Prossess   " +
                "FROM pickup_delivery PD " +
                "left join building B on (PD.Unit_Id = B.Building_Id)  " +
                "left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) " +
                "left join zone Z on (O.zone_zone_Id = Z.zone_Id) " +
                "where Unit_Id='" + Units_DropDownList.SelectedValue + "' and Prosses='" + Prosees_DropDownList.SelectedValue + "' and Date='" + date_DropDownList.SelectedItem.Text.Trim() + "'";
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

                    //Fill Tenant Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenan_Name_DropDownList, "Tenants_English_Name", "Tenants_ID");
                    Tenan_Name_DropDownList.Items.Insert(0, "...............");


                    //    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_EN_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");




                    //Prosees_DropDownList 
                    Prosees_DropDownList.Items.Clear();
                    Prosees_DropDownList.Items.Add(new System.Web.UI.WebControls.ListItem("Handing", "2"));
                    Prosees_DropDownList.Items.Add(new System.Web.UI.WebControls.ListItem("Receive", "1"));
                    Prosees_DropDownList.Items.Insert(0, "...............");


                    lbl_Titel.Text = Dt.Rows[85]["EN"].ToString();
                    lbl_Tenan_Name.Text = Dt.Rows[3]["EN"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[83]["EN"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[7]["EN"].ToString();
                    lbl_Units.Text = Dt.Rows[8]["EN"].ToString();
                    lbl_Prosees.Text = Dt.Rows[84]["EN"].ToString();
                    lbl_date.Text= Dt.Rows[64]["EN"].ToString();

                }
                else
                {
                    //Fill Tenant Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenan_Name_DropDownList, "Tenants_Arabic_Name", "Tenants_ID");
                    Tenan_Name_DropDownList.Items.Insert(0, "...............");


                    //    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_AR_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");




                    //Prosees_DropDownList 
                    Prosees_DropDownList.Items.Clear();
                    Prosees_DropDownList.Items.Add(new System.Web.UI.WebControls.ListItem("تسليم", "2"));
                    Prosees_DropDownList.Items.Add(new System.Web.UI.WebControls.ListItem("إستلام", "1"));
                    Prosees_DropDownList.Items.Insert(0, "...............");


                    lbl_Titel.Text = Dt.Rows[85]["AR"].ToString();
                    lbl_Tenan_Name.Text = Dt.Rows[3]["AR"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[83]["AR"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[7]["AR"].ToString();
                    lbl_Units.Text = Dt.Rows[8]["AR"].ToString();
                    lbl_Prosees.Text = Dt.Rows[84]["AR"].ToString();
                    lbl_date.Text = Dt.Rows[64]["AR"].ToString();

                }
            }
            _sqlCon.Close();

        }

        protected void Pickup_Delivery_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_tenant = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_tenant");
                var lbl_Ownership = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Ownership");
                var lbl_Building = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building");
                var lbl_Unit = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit");
                var lbl_Prosess = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Prosess");
                var lbl_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Date");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_maintenance", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_tenant.Text = Dt.Rows[3]["EN"].ToString();
                        lbl_Ownership.Text = Dt.Rows[83]["EN"].ToString();
                        lbl_Building.Text = Dt.Rows[7]["EN"].ToString();
                        lbl_Unit.Text = Dt.Rows[8]["EN"].ToString();
                        lbl_Prosess.Text = Dt.Rows[84]["EN"].ToString();
                        lbl_Date.Text = Dt.Rows[64]["EN"].ToString();
                        
                    }
                    else
                    {
                        lbl_tenant.Text = Dt.Rows[3]["EN"].ToString();
                        lbl_Ownership.Text = Dt.Rows[83]["EN"].ToString();
                        lbl_Building.Text = Dt.Rows[7]["EN"].ToString();
                        lbl_Unit.Text = Dt.Rows[8]["EN"].ToString();
                        lbl_Prosess.Text = Dt.Rows[84]["EN"].ToString();
                        lbl_Date.Text = Dt.Rows[64]["EN"].ToString();
                    }
                }
                _sqlCon.Close();
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Tenants_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_Arabic_Name");
                var lbl_Tenants_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_English_Name");
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");
                var lbl_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Name");
                var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");
                var lbl_Prossess = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Prossess");


                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Tenants_Arabic_Name.Visible= false; lbl_Tenants_English_Name.Visible = true;
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                    lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;

                    if (lbl_Prossess.Text == "تسليم") { lbl_Prossess.Text = "Handing"; }
                    else if (lbl_Prossess.Text == "إستلام") { lbl_Prossess.Text = "Receive"; }
                }
                else
                {
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;

                    if (lbl_Prossess.Text == "Handing") { lbl_Prossess.Text = "تسليم"; }
                    else if (lbl_Prossess.Text == "Receive") { lbl_Prossess.Text = "إستلام"; }
                }
            }
        }
    }
}