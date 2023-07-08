using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Asset : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                language();


                // Get The All Asset Data From DataBase
                string assetId = Request.QueryString["Id"];
                DataTable getAssetDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getAssetCmd = new MySqlCommand("SELECT * FROM assets WHERE Assets_Id = @ID", _sqlCon);
                MySqlDataAdapter getAssetDa = new MySqlDataAdapter(getAssetCmd);
                getAssetCmd.Parameters.AddWithValue("@ID", assetId);
                getAssetDa.Fill(getAssetDt);
                if (getAssetDt.Rows.Count > 0)
                {
                    if (getAssetDt.Rows[0]["Main_Place"].ToString() == "ملكية"|| getAssetDt.Rows[0]["Main_Place"].ToString() == "Property")
                    {
                        Ownership_Building_Unit_Div.Visible = true; Inventory_Div.Visible = false; Units_DropDownList.Enabled = false; Building_Name_DropDownList.Enabled = false;
                        Ownership_Building_Unit_DropDownList.SelectedValue = "1";
                        Ownership_Name_DropDownList.SelectedValue = getAssetDt.Rows[0]["OwnerShip_Id"].ToString();
                        Asset_Location_DropDownList.SelectedValue = getAssetDt.Rows[0]["asset_location_Asset_Location_Id"].ToString();
                    }
                    else if (getAssetDt.Rows[0]["Main_Place"].ToString() == "بناء" || getAssetDt.Rows[0]["Main_Place"].ToString() == "Building")
                    {
                        Ownership_Building_Unit_Div.Visible = true; Inventory_Div.Visible = false; Units_DropDownList.Enabled = false; Building_Name_DropDownList.Enabled = true;
                        Ownership_Building_Unit_DropDownList.SelectedValue = "2";
                        Ownership_Name_DropDownList.SelectedValue = getAssetDt.Rows[0]["OwnerShip_Id"].ToString();
                        Building_Name_DropDownList.SelectedValue = getAssetDt.Rows[0]["Building_ID"].ToString();
                        Asset_Location_DropDownList.SelectedValue = getAssetDt.Rows[0]["asset_location_Asset_Location_Id"].ToString();
                    }
                    else if (getAssetDt.Rows[0]["Main_Place"].ToString() == "وحدة" || getAssetDt.Rows[0]["Main_Place"].ToString() == "Unit")
                    {
                        Ownership_Building_Unit_Div.Visible = true; Inventory_Div.Visible = false; Units_DropDownList.Enabled = true; Building_Name_DropDownList.Enabled = true;
                        Ownership_Building_Unit_DropDownList.SelectedValue = "3";
                        Ownership_Name_DropDownList.SelectedValue = getAssetDt.Rows[0]["OwnerShip_Id"].ToString();
                        Building_Name_DropDownList.SelectedValue = getAssetDt.Rows[0]["Building_ID"].ToString();
                        Units_DropDownList.SelectedValue = getAssetDt.Rows[0]["Unit_Id"].ToString();
                        Asset_Location_DropDownList.SelectedValue = getAssetDt.Rows[0]["asset_location_Asset_Location_Id"].ToString();
                    }
                    else
                    {
                        Ownership_Building_Unit_Div.Visible = false; Inventory_Div.Visible = true;
                        Ownership_Building_Unit_DropDownList.SelectedValue = "4";
                        Inventory_DropDownList.SelectedValue = getAssetDt.Rows[0]["Inventory_Id"].ToString();
                    }

                    Asset_Condition_DropDownList.SelectedValue = getAssetDt.Rows[0]["asset_condition_Asset_Condition_Id"].ToString();
                    Asset_SubType_DropDownList.SelectedValue = getAssetDt.Rows[0]["maintenance_categoty_Categoty_Id"].ToString();
                    txt_En_Asset_Name.Text = getAssetDt.Rows[0]["Assets_English_Name"].ToString();
                    txt_Ar_Asset_Name.Text = getAssetDt.Rows[0]["Assets_Arabic_Name"].ToString();
                    txt_Serial_Number.Text = getAssetDt.Rows[0]["Serial_Number"].ToString();
                    txt_purchase_Date.Text = getAssetDt.Rows[0]["Purchase_Date"].ToString();
                    txt_Asset_Value.Text = getAssetDt.Rows[0]["Assets_Value"].ToString();
                    txt_Asset_Description.Text = getAssetDt.Rows[0]["Description"].ToString();
                    txt_Warranty_Period.Text = getAssetDt.Rows[0]["Waranty_Period"].ToString();
                    txt_Start_Date.Text = getAssetDt.Rows[0]["Waranty_Start_Date"].ToString();
                    txt_End_Date.Text = getAssetDt.Rows[0]["Waranty_End_Date"].ToString();
                    Waranty_Image_FileName.Text = getAssetDt.Rows[0]["Waranty_Certificate"].ToString();
                    Waranty_Image_Path.Text = getAssetDt.Rows[0]["Waranty_Certificate_Path"].ToString();


                    DataTable getCatigoryDt = new DataTable();
                    MySqlCommand getCatigoryCmd = new MySqlCommand("SELECT Main_Categoty FROM maintenance_categoty WHERE Categoty_Id = @ID", _sqlCon);
                    MySqlDataAdapter getCatigoryDa = new MySqlDataAdapter(getCatigoryCmd);
                    getCatigoryCmd.Parameters.AddWithValue("@ID", Asset_SubType_DropDownList.SelectedValue);
                    getCatigoryDa.Fill(getCatigoryDt);
                    if (getCatigoryDt.Rows.Count > 0)
                    {
                        Asset_Type_DropDownList.SelectedValue = getCatigoryDt.Rows[0]["Main_Categoty"].ToString();
                    }



                    if (getAssetDt.Rows[0]["How_To_Get"].ToString() == "ضمن مشروع" || getAssetDt.Rows[0]["How_To_Get"].ToString() == "Within a Project")
                    {
                        How_To_Get_DropDownList.SelectedValue = "1";
                        Contractor_Div.Visible = true; Contractor_DropDownList.SelectedValue = getAssetDt.Rows[0]["Contractor"].ToString();
                        Asset_Vendor_DropDownList.SelectedValue = getAssetDt.Rows[0]["vendor_type_Vendor_Type_Id"].ToString();
                        Contractor_Warranty_Period_Div.Visible = true; txt_Contractor_Warranty_Period.Text = getAssetDt.Rows[0]["Contractor_Waranty_Period"].ToString();
                        Buyer_Div.Visible = false;
                    }
                    else
                    {
                        How_To_Get_DropDownList.SelectedValue = "2";
                        Contractor_Div.Visible = false;
                        Asset_Vendor_DropDownList.SelectedValue = getAssetDt.Rows[0]["vendor_type_Vendor_Type_Id"].ToString();
                        Contractor_Warranty_Period_Div.Visible = false;
                        Buyer_Div.Visible = true; Buyer_DropDownList.SelectedValue = getAssetDt.Rows[0]["Buyer"].ToString();
                    }


                    if (getAssetDt.Rows[0]["Waranty_Period"].ToString() != "")
                    {
                        Warenty_CheckBox.Checked = true;
                        Waranty_Div.Visible = true;
                    }
                    else
                    {
                        Warenty_CheckBox.Checked = false;
                        Waranty_Div.Visible = false;

                    }
                }

                _sqlCon.Close();
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

        protected void btn_Edit_Asset_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string assetId = Request.QueryString["ID"];
                string updateAssetQuery = "UPDATE assets SET " +
                                          "asset_location_Asset_Location_Id=@asset_location_Asset_Location_Id ," +
                                          "vendor_type_Vendor_Type_Id=@vendor_type_Vendor_Type_Id ," +
                                          "asset_condition_Asset_Condition_Id=@asset_condition_Asset_Condition_Id ," +
                                          "maintenance_categoty_Categoty_Id=@maintenance_categoty_Categoty_Id ," +
                                          "Assets_English_Name=@Assets_English_Name ," +
                                          "Assets_Arabic_Name=@Assets_Arabic_Name ," +
                                          "Assets_Value=@Assets_Value ," +
                                          "Purchase_Date=@Purchase_Date ," +
                                          "Description=@Description ," +
                                          "Serial_Number=@Serial_Number ," +
                                          "Main_Place=@Main_Place ," +
                                          "How_To_Get=@How_To_Get ," +
                                          "Contractor=@Contractor ," +
                                          "Buyer=@Buyer  ," +
                                          "Contractor_Waranty_Period=@Contractor_Waranty_Period ," +
                                          "Waranty_Period=@Waranty_Period ," +
                                          "Waranty_Start_Date=@Waranty_Start_Date ," +
                                          "Waranty_End_Date=@Waranty_End_Date ," +
                                          "Waranty_Certificate=@Waranty_Certificate ," +
                                          "Waranty_Certificate_Path=@Waranty_Certificate_Path ," +
                                          "Inventory_Id=@Inventory_Id ," +
                                          "OwnerShip_Id=@OwnerShip_Id ," +
                                          "Building_ID=@Building_ID ," +
                                          "Unit_Id=@Unit_Id " +
                                          "WHERE Assets_Id=@ID ";
                _sqlCon.Open();
                using (MySqlCommand updateAssetCmd = new MySqlCommand(updateAssetQuery, _sqlCon))
                {
                    updateAssetCmd.Parameters.AddWithValue("@ID", assetId);

                    // Main Place Cases 
                    updateAssetCmd.Parameters.AddWithValue("@Main_Place", Ownership_Building_Unit_DropDownList.SelectedItem.Text.Trim());
                    if (Ownership_Building_Unit_DropDownList.SelectedValue == "1")
                    {
                        updateAssetCmd.Parameters.AddWithValue("@OwnerShip_Id", Ownership_Name_DropDownList.SelectedValue);
                        updateAssetCmd.Parameters.AddWithValue("@Building_ID", "");
                        updateAssetCmd.Parameters.AddWithValue("@Unit_Id", "");
                        updateAssetCmd.Parameters.AddWithValue("@asset_location_Asset_Location_Id", Asset_Location_DropDownList.SelectedValue);
                        updateAssetCmd.Parameters.AddWithValue("@Inventory_Id", "1");
                    }
                    else if (Ownership_Building_Unit_DropDownList.SelectedValue == "2")
                    {
                        updateAssetCmd.Parameters.AddWithValue("@OwnerShip_Id", Ownership_Name_DropDownList.SelectedValue);
                        updateAssetCmd.Parameters.AddWithValue("@Building_ID", Building_Name_DropDownList.SelectedValue);
                        updateAssetCmd.Parameters.AddWithValue("@Unit_Id", "");
                        updateAssetCmd.Parameters.AddWithValue("@asset_location_Asset_Location_Id", Asset_Location_DropDownList.SelectedValue);
                        updateAssetCmd.Parameters.AddWithValue("@Inventory_Id", "1");
                    }
                    else if (Ownership_Building_Unit_DropDownList.SelectedValue == "3")
                    {
                        updateAssetCmd.Parameters.AddWithValue("@OwnerShip_Id", Ownership_Name_DropDownList.SelectedValue);
                        updateAssetCmd.Parameters.AddWithValue("@Building_ID", Building_Name_DropDownList.SelectedValue);
                        updateAssetCmd.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
                        updateAssetCmd.Parameters.AddWithValue("@asset_location_Asset_Location_Id", Asset_Location_DropDownList.SelectedValue);
                        updateAssetCmd.Parameters.AddWithValue("@Inventory_Id", "1");
                    }
                    else
                    {
                        updateAssetCmd.Parameters.AddWithValue("@OwnerShip_Id", "");
                        updateAssetCmd.Parameters.AddWithValue("@Building_ID", "");
                        updateAssetCmd.Parameters.AddWithValue("@Unit_Id", "");
                        updateAssetCmd.Parameters.AddWithValue("@asset_location_Asset_Location_Id", "1");
                        updateAssetCmd.Parameters.AddWithValue("@Inventory_Id", Inventory_DropDownList.SelectedValue);
                    }

                    // How To Get Cases
                    updateAssetCmd.Parameters.AddWithValue("@How_To_Get", How_To_Get_DropDownList.SelectedItem.Text.Trim());
                    if (How_To_Get_DropDownList.SelectedValue == "1")
                    {
                        updateAssetCmd.Parameters.AddWithValue("@Contractor", Contractor_DropDownList.Text);
                        updateAssetCmd.Parameters.AddWithValue("@Contractor_Waranty_Period", txt_Contractor_Warranty_Period.Text);
                        updateAssetCmd.Parameters.AddWithValue("@vendor_type_Vendor_Type_Id", Asset_Vendor_DropDownList.SelectedValue);
                        updateAssetCmd.Parameters.AddWithValue("@Buyer", "");
                    }
                    else
                    {
                        updateAssetCmd.Parameters.AddWithValue("@Contractor", "");
                        updateAssetCmd.Parameters.AddWithValue("@Contractor_Waranty_Period", "");
                        updateAssetCmd.Parameters.AddWithValue("@vendor_type_Vendor_Type_Id", Asset_Vendor_DropDownList.SelectedValue);
                        updateAssetCmd.Parameters.AddWithValue("@Buyer", Buyer_DropDownList.SelectedValue);
                    }


                    updateAssetCmd.Parameters.AddWithValue("@asset_condition_Asset_Condition_Id", Asset_Condition_DropDownList.Text);
                    updateAssetCmd.Parameters.AddWithValue("@maintenance_categoty_Categoty_Id", Asset_SubType_DropDownList.Text);
                    updateAssetCmd.Parameters.AddWithValue("@Assets_English_Name", txt_En_Asset_Name.Text);
                    updateAssetCmd.Parameters.AddWithValue("@Assets_Arabic_Name", txt_Ar_Asset_Name.Text);
                    updateAssetCmd.Parameters.AddWithValue("@Assets_Value", txt_Asset_Value.Text);
                    updateAssetCmd.Parameters.AddWithValue("@Purchase_Date", txt_purchase_Date.Text);
                    updateAssetCmd.Parameters.AddWithValue("@Description", txt_Asset_Description.Text);
                    updateAssetCmd.Parameters.AddWithValue("@Serial_Number", txt_Serial_Number.Text);




                    updateAssetCmd.Parameters.AddWithValue("@Waranty_Period", txt_Warranty_Period.Text);
                    updateAssetCmd.Parameters.AddWithValue("@Waranty_Start_Date", txt_Start_Date.Text);
                    updateAssetCmd.Parameters.AddWithValue("@Waranty_End_Date", txt_End_Date.Text);

                    if (Waranty_Image_FileUpload.HasFile)
                    {
                        string fileName1 = Path.GetFileName(Waranty_Image_FileUpload.PostedFile.FileName);
                        Waranty_Image_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Master_Panal/Waranty_Images/") + fileName1);
                        updateAssetCmd.Parameters.AddWithValue("@Waranty_Certificate", fileName1);
                        updateAssetCmd.Parameters.AddWithValue("@Waranty_Certificate_Path", "/English/Master_Panal/Waranty_Images/" + fileName1);
                    }
                    else
                    {
                        updateAssetCmd.Parameters.AddWithValue("@Waranty_Certificate", Waranty_Image_FileName.Text);
                        updateAssetCmd.Parameters.AddWithValue("@Waranty_Certificate_Path", Waranty_Image_Path.Text);
                    }
                    updateAssetCmd.ExecuteNonQuery();
                    if (Ownership_Building_Unit_DropDownList.SelectedValue != "4" && Asset_SubType_DropDownList.SelectedValue != "13" || Asset_SubType_DropDownList.SelectedValue != "15" || Asset_SubType_DropDownList.SelectedValue != "36")
                    {
                        int year = DateTime.Now.Year;
                        //MySqlConnection SqlCon = Helper.GetConnection();
                        MySqlConnection sqlCon = Helper.GetConnection();
                        MySqlDataAdapter Sda = new MySqlDataAdapter("Select Asset_ID from periodic_maintenence where Asset_ID='" + assetId + "'", sqlCon);
                        DataTable dt = new DataTable();
                        Sda.Fill(dt);
                        if (dt.Rows.Count == 0)
                        {
                            string sql = "";
                            sql += "INSERT INTO periodic_maintenence (Asset_ID , Year ) Values ('" + assetId + "','" + year + "')";
                            MySqlCommand cmd = new MySqlCommand(sql, _sqlCon);
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                        }
                    }
                    _sqlCon.Close();
                }

                Response.Redirect("Asset_List.aspx");
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
                    Helper.LoadDropDownList("SELECT * FROM maintenance_categoty where Main_Categoty !=0", _sqlCon, Asset_SubType_DropDownList, "Categoty_EN", "Categoty_Id");
                    Asset_SubType_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Building_Name_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Units_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM units", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
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



                    lbl_titel_Edit_Asset.Text = Dt.Rows[170]["EN"].ToString();
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
                    btn_Edit_Asset.Text = Dt.Rows[57]["EN"].ToString();
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
                    Helper.LoadDropDownList("SELECT * FROM maintenance_categoty where Main_Categoty !=0", _sqlCon, Asset_SubType_DropDownList, "Categoty_AR", "Categoty_Id");
                    Asset_SubType_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Building_Name_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    // get Value=0 for the Units_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM units", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
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



                    lbl_titel_Edit_Asset.Text = Dt.Rows[170]["AR"].ToString();
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
                    btn_Edit_Asset.Text = Dt.Rows[57]["AR"].ToString();
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