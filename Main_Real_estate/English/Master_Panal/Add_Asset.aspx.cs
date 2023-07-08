using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Asset : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                language();
            }
        }
        //******************  purchase_Date ***************************************************
        protected void purchase_Date_Calendar_SelectionChanged1(object sender, EventArgs e)
        {
            txt_purchase_Date.Text = purchase_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_purchase_Date.Text != "") { purchase_Date_divCalendar.Visible = false; ImageButton1.Visible = false; }
        }
        protected void Date_Chosee_Click(object sender, EventArgs e)
        { purchase_Date_divCalendar.Visible = true; ImageButton1.Visible = true; }
        protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        { purchase_Date_divCalendar.Visible = false; ImageButton1.Visible = false; }
        //******************  Start_Date ***************************************************
        protected void Start_Date_Calendar_SelectionChanged2(object sender, EventArgs e)
        {
            txt_Start_Date.Text = Start_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Start_Date.Text != "")
            { Start_Date_Div.Visible = false; ImageButton2.Visible = false; }
        }

        protected void Start_Date_Chosee_Click(object sender, EventArgs e)
        { Start_Date_Div.Visible = true; ImageButton2.Visible = true; }

        protected void ImageButton2_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        { Start_Date_Div.Visible = false; ImageButton2.Visible = false; }

        //******************  End_Date ***************************************************
        protected void End_Date_Chosee_Click(object sender, EventArgs e)
        { End_Date_Div.Visible = true; ImageButton3.Visible = true; }
        protected void ImageButton3_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        { End_Date_Div.Visible = false; ImageButton3.Visible = false; }
        protected void End_Date_Calendar_SelectionChanged1(object sender, EventArgs e)
        {
            txt_End_Date.Text = End_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_End_Date.Text != "")
            { End_Date_Div.Visible = false; ImageButton3.Visible = false; }
        }

        protected void Asset_Type_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Asset_Type_ID = Asset_Type_DropDownList.SelectedValue;
            Asset_SubType_DropDownList.Enabled = true;


            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            if (Session["Langues"].ToString() == "1")
            {
                //Fill Asset_SubType_DropDownList
                Helper.LoadDropDownList("SELECT * FROM maintenance_categoty where  Main_Categoty = '" + Asset_Type_ID + "'", _sqlCon, Asset_SubType_DropDownList, "Categoty_EN", "Categoty_Id");
                Asset_SubType_DropDownList.Items.Insert(0, "...............");
            }
            else 
            {
                //Fill Asset_SubType_DropDownList
                Helper.LoadDropDownList("SELECT * FROM maintenance_categoty where  Main_Categoty = '" + Asset_Type_ID + "'", _sqlCon, Asset_SubType_DropDownList, "Categoty_AR", "Categoty_Id");
                Asset_SubType_DropDownList.Items.Insert(0, "...............");
            }
                
        }

        protected void Ownership_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

            string Ownership_Name_ID = Ownership_Name_DropDownList.SelectedValue;


            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            if (Session["Langues"].ToString() == "1")
            {
                //Fill Building_Name_DropDownList
                Helper.LoadDropDownList("SELECT * FROM building where owner_ship_Owner_Ship_Id = '" + Ownership_Name_ID + "'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                Building_Name_DropDownList.Items.Insert(0, "...............");
            }
            else
            {
                //Fill Building_Name_DropDownList
                Helper.LoadDropDownList("SELECT * FROM building where owner_ship_Owner_Ship_Id = '" + Ownership_Name_ID + "'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                Building_Name_DropDownList.Items.Insert(0, "...............");
            }
                
        }

        protected void Building_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

            string Building_Name_ID = Building_Name_DropDownList.SelectedValue;

            //Fill Building_Name_DropDownList
            Helper.LoadDropDownList("SELECT * FROM units where building_Building_Id = '" + Building_Name_ID + "'", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
            Units_DropDownList.Items.Insert(0, "...............");
        }

        protected void How_To_Get_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (How_To_Get_DropDownList.SelectedValue == "1")
            {
                Contractor_Warranty_Period_Div.Visible = true;
                Contractor_Div.Visible = true;
                Buyer_Div.Visible = false;
            }
            else
            {
                Contractor_Warranty_Period_Div.Visible = false;
                Contractor_Div.Visible = false;
                Buyer_Div.Visible = true;
            }
        }

        protected void Warenty_CheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (Warenty_CheckBox.Checked == true) { Waranty_Div.Visible = true; }
            else { Waranty_Div.Visible = false; }
        }

        protected void Ownership_Building_Unit_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Ownership_Building_Unit_DropDownList.SelectedValue == "1")
            {
                Ownership_Building_Unit_Div.Visible = true;
                Inventory_Div.Visible = false;
                Building_Name_DropDownList.Enabled = false;
                Units_DropDownList.Enabled = false;
            }
            else if (Ownership_Building_Unit_DropDownList.SelectedValue == "2")
            {
                Ownership_Building_Unit_Div.Visible = true;
                Inventory_Div.Visible = false;
                Building_Name_DropDownList.Enabled = true;
                Units_DropDownList.Enabled = false;
            }
            else if (Ownership_Building_Unit_DropDownList.SelectedValue == "3")
            {
                Ownership_Building_Unit_Div.Visible = true;
                Inventory_Div.Visible = false;
                Building_Name_DropDownList.Enabled = true;
                Units_DropDownList.Enabled = true;
            }
            else
            {
                Ownership_Building_Unit_Div.Visible = false;
                Inventory_Div.Visible = true;
            }
        }

        protected void btn_Add_Asset_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string AddAssetQuary = "Insert Into assets" +
                                       "(asset_location_Asset_Location_Id , " +
                                       "vendor_type_Vendor_Type_Id ," +
                                       "asset_condition_Asset_Condition_Id ," +
                                       "maintenance_categoty_Categoty_Id ," +
                                       "Assets_English_Name ," +
                                       "Assets_Arabic_Name ," +
                                       "Assets_Value ," +
                                       "Purchase_Date ," +
                                       "Description ," +
                                       "Serial_Number ," +
                                       "Main_Place ," +
                                       "How_To_Get ," +
                                       "Contractor ," +
                                       "Buyer ," +
                                       "Contractor_Waranty_Period ," +
                                       "Waranty_Period ," +
                                       "Waranty_Start_Date ," +
                                       "Waranty_End_Date ," +
                                       "Waranty_Certificate ," +
                                       "Waranty_Certificate_Path ," +
                                       "Inventory_Id ," +
                                       "OwnerShip_Id ," +
                                       "Building_ID , " +
                                       "Unit_Id)" +

                                       " VALUES" +

                                       "(@asset_location_Asset_Location_Id," +
                                       "@vendor_type_Vendor_Type_Id ," +
                                       "@asset_condition_Asset_Condition_Id ," +
                                       "@maintenance_categoty_Categoty_Id ," +
                                       "@Assets_English_Name ," +
                                       "@Assets_Arabic_Name ," +
                                       "@Assets_Value ," +
                                       "@Purchase_Date ," +
                                       "@Description ," +
                                       "@Serial_Number ," +
                                       "@Main_Place ," +
                                       "@How_To_Get ," +
                                       "@Contractor ," +
                                       "@Buyer ," +
                                       "@Contractor_Waranty_Period ," +
                                       "@Waranty_Period ," +
                                       "@Waranty_Start_Date ," +
                                       "@Waranty_End_Date ," +
                                       "@Waranty_Certificate ," +
                                       "@Waranty_Certificate_Path ," +
                                       "@Inventory_Id ," +
                                       "@OwnerShip_Id ," +
                                       "@Building_ID , " +
                                       "@Unit_Id)";
                _sqlCon.Open();
                using (MySqlCommand addAssetCmd = new MySqlCommand(AddAssetQuary, _sqlCon))
                {
                    // Main Place Cases 
                    addAssetCmd.Parameters.AddWithValue("@Main_Place", Ownership_Building_Unit_DropDownList.SelectedItem.Text.Trim());
                    if (Ownership_Building_Unit_DropDownList.SelectedValue == "1")
                    {
                        addAssetCmd.Parameters.AddWithValue("@OwnerShip_Id", Ownership_Name_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@Building_ID", "");
                        addAssetCmd.Parameters.AddWithValue("@Unit_Id", "");
                        addAssetCmd.Parameters.AddWithValue("@asset_location_Asset_Location_Id", Asset_Location_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@Inventory_Id", "1");
                    }
                    else if (Ownership_Building_Unit_DropDownList.SelectedValue == "2")
                    {
                        addAssetCmd.Parameters.AddWithValue("@OwnerShip_Id", Ownership_Name_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@Building_ID", Building_Name_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@Unit_Id", "");
                        addAssetCmd.Parameters.AddWithValue("@asset_location_Asset_Location_Id", Asset_Location_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@Inventory_Id", "1");
                    }
                    else if (Ownership_Building_Unit_DropDownList.SelectedValue == "3")
                    {
                        addAssetCmd.Parameters.AddWithValue("@OwnerShip_Id", Ownership_Name_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@Building_ID", Building_Name_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@asset_location_Asset_Location_Id", Asset_Location_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@Inventory_Id", "1");
                    }
                    else
                    {
                        addAssetCmd.Parameters.AddWithValue("@OwnerShip_Id", "");
                        addAssetCmd.Parameters.AddWithValue("@Building_ID", "");
                        addAssetCmd.Parameters.AddWithValue("@Unit_Id", "");
                        addAssetCmd.Parameters.AddWithValue("@asset_location_Asset_Location_Id", "1");
                        addAssetCmd.Parameters.AddWithValue("@Inventory_Id", Inventory_DropDownList.SelectedValue);
                    }
                    // How To Get Cases
                    addAssetCmd.Parameters.AddWithValue("@How_To_Get", How_To_Get_DropDownList.SelectedItem.Text.Trim());
                    if (How_To_Get_DropDownList.SelectedValue == "1")
                    {
                        addAssetCmd.Parameters.AddWithValue("@Contractor", Contractor_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@Contractor_Waranty_Period", txt_Contractor_Warranty_Period.Text);
                        addAssetCmd.Parameters.AddWithValue("@vendor_type_Vendor_Type_Id", Asset_Vendor_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@Buyer", "");
                    }
                    else
                    {
                        addAssetCmd.Parameters.AddWithValue("@Contractor", "");
                        addAssetCmd.Parameters.AddWithValue("@Contractor_Waranty_Period", "");
                        addAssetCmd.Parameters.AddWithValue("@vendor_type_Vendor_Type_Id", Asset_Vendor_DropDownList.SelectedValue);
                        addAssetCmd.Parameters.AddWithValue("@Buyer", Buyer_DropDownList.SelectedValue);
                    }


                    addAssetCmd.Parameters.AddWithValue("@asset_condition_Asset_Condition_Id", Asset_Condition_DropDownList.Text);
                    addAssetCmd.Parameters.AddWithValue("@maintenance_categoty_Categoty_Id", Asset_SubType_DropDownList.Text);
                    addAssetCmd.Parameters.AddWithValue("@Assets_English_Name", txt_En_Asset_Name.Text);
                    addAssetCmd.Parameters.AddWithValue("@Assets_Arabic_Name", txt_Ar_Asset_Name.Text);
                    addAssetCmd.Parameters.AddWithValue("@Assets_Value", txt_Asset_Value.Text);
                    addAssetCmd.Parameters.AddWithValue("@Purchase_Date", txt_purchase_Date.Text);
                    addAssetCmd.Parameters.AddWithValue("@Description", txt_Asset_Description.Text);
                    addAssetCmd.Parameters.AddWithValue("@Serial_Number", txt_Serial_Number.Text);




                    addAssetCmd.Parameters.AddWithValue("@Waranty_Period", txt_Warranty_Period.Text);
                    addAssetCmd.Parameters.AddWithValue("@Waranty_Start_Date", txt_Start_Date.Text);
                    addAssetCmd.Parameters.AddWithValue("@Waranty_End_Date", txt_End_Date.Text);

                    if (Waranty_Image_FileUpload.HasFile)
                    {
                        string fileName1 = Path.GetFileName(Waranty_Image_FileUpload.PostedFile.FileName);
                        Waranty_Image_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Master_Panal/Waranty_Images/") + fileName1);
                        addAssetCmd.Parameters.AddWithValue("@Waranty_Certificate", fileName1);
                        addAssetCmd.Parameters.AddWithValue("@Waranty_Certificate_Path", "/English/Master_Panal/Waranty_Images/" + fileName1);
                    }
                    else
                    {
                        addAssetCmd.Parameters.AddWithValue("@Waranty_Certificate", "No File");
                        addAssetCmd.Parameters.AddWithValue("@Waranty_Certificate_Path", "No File");
                    }

                    addAssetCmd.ExecuteNonQuery();
                    if (_sqlCon.State != ConnectionState.Closed)
                    {
                        _sqlCon.Close();
                    }
                    Response.Redirect("Asset_List.aspx");
                }


                ////    Get The Last Asset Id
                //using (MySqlCommand Last_Asset_ID_Cmd = new MySqlCommand("SELECT MAX(Assets_Id) AS LastInsertedID from assets", _sqlCon))
                //{
                //    _sqlCon.Open(); Last_Asset_ID_Cmd.CommandType = CommandType.Text;
                //    object Asset_ID = Last_Asset_ID_Cmd.ExecuteScalar();
                //    if (Asset_ID != null) { Last_Asset_ID.Text = Asset_ID.ToString(); }
                //    _sqlCon.Close();
                //}
                //if (Ownership_Building_Unit_DropDownList.SelectedValue != "4" && Asset_SubType_DropDownList.SelectedValue == "13" || Asset_SubType_DropDownList.SelectedValue == "15" || Asset_SubType_DropDownList.SelectedValue == "36")
                //{
                //    string AddAssetInPeriodicMaintenaneQuary = "Insert Into periodic_maintenence (Asset_ID , Year) VALUES (@Asset_ID , @Year)";
                //    _sqlCon.Open();
                //    using (MySqlCommand addAssetInPeriodicMaintenaneCmd = new MySqlCommand(AddAssetInPeriodicMaintenaneQuary, _sqlCon))
                //    {
                //        addAssetInPeriodicMaintenaneCmd.Parameters.AddWithValue("@Asset_ID", Last_Asset_ID.Text);
                //        addAssetInPeriodicMaintenaneCmd.Parameters.AddWithValue("@Year", Convert.ToString(DateTime.Now.Year));
                //        addAssetInPeriodicMaintenaneCmd.ExecuteNonQuery();
                //        if (_sqlCon.State != ConnectionState.Closed) { _sqlCon.Close(); }
                //    }
                //}
            }
        }

        protected void btn_Back_To_Asset_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Asset_List.aspx");
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
                    Helper.LoadDropDownList("SELECT * FROM contractor ", _sqlCon, Contractor_DropDownList, "Contractor_En_Name", "Contractor_ID");
                    Contractor_DropDownList.Items.Insert(0, "...............");

                    //Fill Buyer_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee ", _sqlCon, Buyer_DropDownList, "Employee_English_name", "Employee_Id");
                    Buyer_DropDownList.Items.Insert(0, "...............");

                    //Fill Inventory_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM inventory ", _sqlCon, Inventory_DropDownList, "Inventory_English_name", "Inventory_Id");
                    Inventory_DropDownList.Items.Insert(0, "...............");

                    //Fill Asset_Type_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM maintenance_categoty where Main_Categoty=0", _sqlCon, Asset_Type_DropDownList, "Categoty_EN", "Categoty_Id");
                    Asset_Type_DropDownList.Items.Insert(0, "...............");

                    //Fill Asset_Condition_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM asset_condition", _sqlCon, Asset_Condition_DropDownList, "Asset_English_Condition", "Asset_Condition_Id");
                    Asset_Condition_DropDownList.Items.Insert(0, "...............");


                    //Fill Asset_Vendor_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM vendor_typ ", _sqlCon, Asset_Vendor_DropDownList, "Vendor_English_Type", "Vendor_Type_Id");
                    Asset_Vendor_DropDownList.Items.Insert(0, "...............");

                    //Fill Ownership_Name_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_EN_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Asset_Location_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM asset_location where Asset_Location_Id != 1", _sqlCon, Asset_Location_DropDownList, "Asset_English_Location", "Asset_Location_Id");
                    Asset_Location_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Asset_SubType_DropDownList
                    Asset_SubType_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Building_Name_DropDownList
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Units_DropDownList
                    Units_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the How_To_Get_DropDownList
                    How_To_Get_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Ownership_Building_Unit_DropDownList
                    Ownership_Building_Unit_DropDownList.Items.Insert(0, "...............");




                    //Get Ownership_Building_Unit_DropDownList 
                    Ownership_Building_Unit_DropDownList.Items.Clear();
                    Ownership_Building_Unit_DropDownList.Items.Add(new ListItem("Property", "1"));
                    Ownership_Building_Unit_DropDownList.Items.Add(new ListItem("Building", "2"));
                    Ownership_Building_Unit_DropDownList.Items.Add(new ListItem("Unit", "3"));
                    Ownership_Building_Unit_DropDownList.Items.Add(new ListItem("Stor", "4"));
                    Ownership_Building_Unit_DropDownList.Items.Insert(0, "...............");


                    //Get How_To_Get_DropDownList 
                    How_To_Get_DropDownList.Items.Clear();
                    How_To_Get_DropDownList.Items.Add(new ListItem("Within a Project", "1"));
                    How_To_Get_DropDownList.Items.Add(new ListItem("Buying", "2"));
                    How_To_Get_DropDownList.Items.Insert(0, "...............");



                    lbl_titel_Add_New_Asset.Text = Dt.Rows[146]["EN"].ToString();
                    lbl_Ownership_Building_Unit.Text = Dt.Rows[142]["EN"].ToString();
                    lbl_Inventory.Text = Dt.Rows[143]["EN"].ToString();
                    lbl_Asset_Type.Text = Dt.Rows[144]["EN"].ToString();
                    lbl_Asset_SubType.Text = Dt.Rows[145]["EN"].ToString();
                    lbl_Asset_Condition.Text = Dt.Rows[147]["EN"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[148]["EN"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[149]["EN"].ToString();
                    lbl_Units.Text = Dt.Rows[150]["EN"].ToString();
                    lbl_Asset_Location.Text = Dt.Rows[169]["EN"].ToString();
                    lbl_How_To_Get.Text = Dt.Rows[151]["EN"].ToString();
                    lbl_Contractor.Text = Dt.Rows[152]["EN"].ToString();
                    lbl_Buyer.Text = Dt.Rows[153]["EN"].ToString();
                    lbl_Asset_Vendor.Text = Dt.Rows[154]["EN"].ToString();
                    lbl_Contractor_Warranty_Period.Text = Dt.Rows[155]["EN"].ToString();
                    lbl_En_Asset_Name.Text = Dt.Rows[156]["EN"].ToString();
                    lbl_Ar_Asset_Name.Text = Dt.Rows[157]["EN"].ToString();
                    lbl_Serial_Number.Text = Dt.Rows[158]["EN"].ToString();
                    lbl_purchase_Date.Text = Dt.Rows[159]["EN"].ToString();
                    lbl_Asset_Value.Text = Dt.Rows[161]["EN"].ToString();
                    lbl_Asset_Description.Text = Dt.Rows[162]["EN"].ToString();
                    Warenty_CheckBox.Text = Dt.Rows[163]["EN"].ToString();
                    lbl_Warranty_Period.Text = Dt.Rows[164]["EN"].ToString();
                    lbl_Start_Date.Text = Dt.Rows[165]["EN"].ToString();
                    lbl_End_Date.Text = Dt.Rows[166]["EN"].ToString();
                    purchase_Date_Chosee.Text = Dt.Rows[160]["EN"].ToString();
                    Start_Date_Chosee.Text = Dt.Rows[160]["EN"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[160]["EN"].ToString();
                    lbl_Waranty_Image.Text = Dt.Rows[167]["EN"].ToString();
                    btn_Add_Asset.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Back_To_Asset_List.Text = Dt.Rows[168]["EN"].ToString();



                    Ownership_Building_Unit_RequiredFieldValidator.ErrorMessage = "* Required";
                    Inventory_RequiredFieldValidator.ErrorMessage = "* Required";
                    Asset_Type_RequiredFieldValidator.ErrorMessage = "* Required";
                    Asset_SubType_RequiredFieldValidator.ErrorMessage = "* Required";
                    Asset_Condition_RequiredFieldValidator.ErrorMessage = "* Required";
                    Ownership_Name_RequiredFieldValidator.ErrorMessage = "* Required";
                    Building_Name_RequiredFieldValidator.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";
                    Asset_Location_RequiredFieldValidator.ErrorMessage = "* Required";
                    How_To_Get_RequiredFieldValidator.ErrorMessage = "* Required";
                    Asset_Vendor_RequiredFieldValidator.ErrorMessage = "* Required";
                    Asset_Name_reqFuild.ErrorMessage = "* Required";
                    Ar_Asset_Name_RequiredFieldValidator.ErrorMessage = "* Required";
                    Asset_Value_reqFuild.ErrorMessage = "* Required";
                    Asset_Description_RequiredFieldValidator.ErrorMessage = "* Required";
                    Warranty_Period_RequiredFieldValidator.ErrorMessage = "* Required";



                    Asset_Name_RegularExpressionValidator.ErrorMessage = "English Only";
                    Ar_Asset_Name_RegularExpressionValidator.ErrorMessage = "Arabic Only";
                    Date_Regular1.ErrorMessage = "dd/MM/yyyy";
                    Asset_Value_RegularExpressionValidator.ErrorMessage = "Only Number";
                    Date_Regular2.ErrorMessage = "dd/MM/yyyy"; 
                    Date_Regular3.ErrorMessage = "dd/MM/yyyy";


                }
                else
                {
                    //Fill Contractor_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM contractor ", _sqlCon, Contractor_DropDownList, "Contractor_Ar_Name", "Contractor_ID");
                    Contractor_DropDownList.Items.Insert(0, "...............");

                    //Fill Buyer_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee ", _sqlCon, Buyer_DropDownList, "Employee_Arabic_name", "Employee_Id");
                    Buyer_DropDownList.Items.Insert(0, "...............");

                    //Fill Inventory_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM inventory ", _sqlCon, Inventory_DropDownList, "Inventory_arabic_name", "Inventory_Id");
                    Inventory_DropDownList.Items.Insert(0, "...............");

                    //Fill Asset_Type_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM maintenance_categoty where Main_Categoty=0", _sqlCon, Asset_Type_DropDownList, "Categoty_AR", "Categoty_Id");
                    Asset_Type_DropDownList.Items.Insert(0, "...............");

                    //Fill Asset_Condition_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM asset_condition", _sqlCon, Asset_Condition_DropDownList, "Asset_Arabic_Condition", "Asset_Condition_Id");
                    Asset_Condition_DropDownList.Items.Insert(0, "...............");


                    //Fill Asset_Vendor_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM vendor_typ ", _sqlCon, Asset_Vendor_DropDownList, "Vendor_Arabic_Type", "Vendor_Type_Id");
                    Asset_Vendor_DropDownList.Items.Insert(0, "...............");

                    //Fill Ownership_Name_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_AR_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Asset_Location_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM asset_location where Asset_Location_Id != 1", _sqlCon, Asset_Location_DropDownList, "Asset_Arabic_Location", "Asset_Location_Id");
                    Asset_Location_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Asset_SubType_DropDownList
                    Asset_SubType_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Building_Name_DropDownList
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Units_DropDownList
                    Units_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the How_To_Get_DropDownList
                    How_To_Get_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Ownership_Building_Unit_DropDownList
                    Ownership_Building_Unit_DropDownList.Items.Insert(0, "...............");






                    //Get Ownership_Building_Unit_DropDownList 
                    Ownership_Building_Unit_DropDownList.Items.Clear();
                    Ownership_Building_Unit_DropDownList.Items.Add(new ListItem("ملكية", "1"));
                    Ownership_Building_Unit_DropDownList.Items.Add(new ListItem("بناء", "2"));
                    Ownership_Building_Unit_DropDownList.Items.Add(new ListItem("وحدة", "3"));
                    Ownership_Building_Unit_DropDownList.Items.Add(new ListItem("مخزن", "4"));
                    Ownership_Building_Unit_DropDownList.Items.Insert(0, "...............");


                    //Get How_To_Get_DropDownList 
                    How_To_Get_DropDownList.Items.Clear();
                    How_To_Get_DropDownList.Items.Add(new ListItem("ضمن مشروع", "1"));
                    How_To_Get_DropDownList.Items.Add(new ListItem("شراء", "2"));
                    How_To_Get_DropDownList.Items.Insert(0, "...............");



                    lbl_titel_Add_New_Asset.Text = Dt.Rows[146]["AR"].ToString();
                    lbl_Ownership_Building_Unit.Text = Dt.Rows[142]["AR"].ToString();
                    lbl_Inventory.Text = Dt.Rows[143]["AR"].ToString();
                    lbl_Asset_Type.Text = Dt.Rows[144]["AR"].ToString();
                    lbl_Asset_SubType.Text = Dt.Rows[145]["AR"].ToString();
                    lbl_Asset_Condition.Text = Dt.Rows[147]["AR"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[148]["AR"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[149]["AR"].ToString();
                    lbl_Units.Text = Dt.Rows[150]["AR"].ToString();
                    lbl_Asset_Location.Text = Dt.Rows[169]["AR"].ToString();
                    lbl_How_To_Get.Text = Dt.Rows[151]["AR"].ToString();
                    lbl_Contractor.Text = Dt.Rows[152]["AR"].ToString();
                    lbl_Buyer.Text = Dt.Rows[153]["AR"].ToString();
                    lbl_Asset_Vendor.Text = Dt.Rows[154]["AR"].ToString();
                    lbl_Contractor_Warranty_Period.Text = Dt.Rows[155]["AR"].ToString();
                    lbl_En_Asset_Name.Text = Dt.Rows[156]["AR"].ToString();
                    lbl_Ar_Asset_Name.Text = Dt.Rows[157]["AR"].ToString();
                    lbl_Serial_Number.Text = Dt.Rows[158]["AR"].ToString();
                    lbl_purchase_Date.Text = Dt.Rows[159]["AR"].ToString();
                    lbl_Asset_Value.Text = Dt.Rows[161]["AR"].ToString();
                    lbl_Asset_Description.Text = Dt.Rows[162]["AR"].ToString();
                    Warenty_CheckBox.Text = Dt.Rows[163]["AR"].ToString();
                    lbl_Warranty_Period.Text = Dt.Rows[164]["AR"].ToString();
                    lbl_Start_Date.Text = Dt.Rows[165]["AR"].ToString();
                    lbl_End_Date.Text = Dt.Rows[166]["AR"].ToString();
                    purchase_Date_Chosee.Text = Dt.Rows[160]["AR"].ToString();
                    Start_Date_Chosee.Text = Dt.Rows[160]["AR"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[160]["AR"].ToString();
                    lbl_Waranty_Image.Text = Dt.Rows[167]["AR"].ToString();
                    btn_Add_Asset.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Back_To_Asset_List.Text = Dt.Rows[168]["AR"].ToString();



                    Ownership_Building_Unit_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    Inventory_RequiredFieldValidator.ErrorMessage = "* Requمطلوبired";
                    Asset_Type_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    Asset_SubType_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    Asset_Condition_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    Ownership_Name_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    Building_Name_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator1.ErrorMessage = "* مطلوب";
                    Asset_Location_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    How_To_Get_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    Asset_Vendor_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    Asset_Name_reqFuild.ErrorMessage = "* مطلوب";
                    Ar_Asset_Name_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    Asset_Value_reqFuild.ErrorMessage = "* مطلوب";
                    Asset_Description_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    Warranty_Period_RequiredFieldValidator.ErrorMessage = "* مطلوب";



                    Asset_Name_RegularExpressionValidator.ErrorMessage = "إنكليزي فقط";
                    Ar_Asset_Name_RegularExpressionValidator.ErrorMessage = "عربي فقط";
                    Date_Regular1.ErrorMessage = "dd/MM/yyyy";
                    Asset_Value_RegularExpressionValidator.ErrorMessage = "أرقام فقط";
                    Date_Regular2.ErrorMessage = "dd/MM/yyyy";
                    Date_Regular3.ErrorMessage = "dd/MM/yyyy";
                }
            }
            _sqlCon.Close();

        }


    }

}