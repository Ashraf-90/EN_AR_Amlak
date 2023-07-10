using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Accordin_Add_Ownership : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "properties", 0, "R");
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "properties", 1, "A");
            }
            catch { Response.Redirect("Log_In.aspx"); }

            if (!this.IsPostBack)
            {
                // Fill Year &Mounth  DropDownList
                int year = DateTime.Now.Year; int Mounth = DateTime.Now.Month;
                for (int i = year - 50; i <= year + 10; i++)
                {
                    ListItem li = new ListItem(i.ToString());
                    Construction_Completion_Date_DropDownList.Items.Add(li);
                }
                Construction_Completion_Date_DropDownList.Items.FindByText(year.ToString()).Selected = true;
                language();
            }
        }

        protected void txt_PIN_Number_TextChanged(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine(txt_PIN_Number.Text);

            try
            {
                char[] pinNumber = txt_PIN_Number.Text.ToCharArray();
                if (pinNumber.Length == 7)
                {
                    string zoneNo = (pinNumber[0]).ToString();
                    _sqlCon.EnhancedOpen();
                    MySqlDataAdapter Check_Zone_NO_DA =new MySqlDataAdapter("Select * from zone where zone_number='" + zoneNo + "'", _sqlCon);
                    DataTable Check_Zone_NO_dt = new DataTable();
                    Check_Zone_NO_DA.Fill(Check_Zone_NO_dt);
                    if (Check_Zone_NO_dt.Rows.Count > 0)
                    {
                        

                        if (Session["Langues"].ToString() == "1") 
                        { Helper.LoadDropDownList("SELECT * FROM zone where zone_number = '" + zoneNo + "'", _sqlCon, Zone_Name_DropDownList, "zone_English_name", "zone_Id"); }
                        else 
                        { Helper.LoadDropDownList("SELECT * FROM zone where zone_number = '" + zoneNo + "'", _sqlCon, Zone_Name_DropDownList, "zone_Arabic_name", "zone_Id"); }

                        Pin_No_Worrnig.Visible = false;
                    }
                    else
                    {
                        

                        if (Session["Langues"].ToString() == "1")
                        {
                            Helper.LoadDropDownList("SELECT * FROM zone", _sqlCon, Zone_Name_DropDownList, "zone_English_name", "zone_Id");
                            Zone_Name_DropDownList.Items.Insert(0, "...............");
                        }
                        else
                        {
                            Helper.LoadDropDownList("SELECT * FROM zone", _sqlCon, Zone_Name_DropDownList, "zone_Arabic_name", "zone_Id");
                            Zone_Name_DropDownList.Items.Insert(0, "...............");
                        }

                        Pin_No_Worrnig.Visible = true;
                        if (Session["Langues"].ToString() == "1") { Pin_No_Worrnig.Text = "There Is No Zone For This Bin ... Select Manually"; }
                        else { Pin_No_Worrnig.Text = "لم يتم إدراج منطقة لهذا الرقم المساحي ... أختر يدوياً إذا أردت"; }
                            
                    }

                    _sqlCon.EnhancedClose();
                }
                else if (pinNumber.Length == 8)
                {
                    string zoneNo = (pinNumber[0]).ToString() + (pinNumber[1]).ToString();
                    _sqlCon.EnhancedOpen();
                    MySqlDataAdapter Check_Zone_NO_DA = new MySqlDataAdapter("Select * from zone where zone_number='" + zoneNo + "'", _sqlCon);
                    DataTable Check_Zone_NO_dt = new DataTable();
                    Check_Zone_NO_DA.Fill(Check_Zone_NO_dt);
                    if (Check_Zone_NO_dt.Rows.Count > 0)
                    {
                        if (Session["Langues"].ToString() == "1")
                        { Helper.LoadDropDownList("SELECT * FROM zone where zone_number = '" + zoneNo + "'", _sqlCon, Zone_Name_DropDownList, "zone_English_name", "zone_Id"); }
                        else
                        { Helper.LoadDropDownList("SELECT * FROM zone where zone_number = '" + zoneNo + "'", _sqlCon, Zone_Name_DropDownList, "zone_Arabic_name", "zone_Id"); }
                        Pin_No_Worrnig.Visible = false;
                    }
                    else
                    {
                        if (Session["Langues"].ToString() == "1")
                        {
                            Helper.LoadDropDownList("SELECT * FROM zone", _sqlCon, Zone_Name_DropDownList, "zone_English_name", "zone_Id");
                            Zone_Name_DropDownList.Items.Insert(0, "...............");
                        }
                        else
                        {
                            Helper.LoadDropDownList("SELECT * FROM zone", _sqlCon, Zone_Name_DropDownList, "zone_Arabic_name", "zone_Id");
                            Zone_Name_DropDownList.Items.Insert(0, "...............");
                        }

                        Pin_No_Worrnig.Visible = true;
                        if (Session["Langues"].ToString() == "1") { Pin_No_Worrnig.Text = "There Is No Zone For This Bin ... Select Manually"; }
                        else { Pin_No_Worrnig.Text = "لم يتم إدراج منطقة لهذا الرقم المساحي ... أختر يدوياً إذا أردت"; }
                    }

                    _sqlCon.EnhancedClose();
                }
                else
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        Helper.LoadDropDownList("SELECT * FROM zone", _sqlCon, Zone_Name_DropDownList, "zone_English_name", "zone_Id");
                        Zone_Name_DropDownList.Items.Insert(0, "...............");
                    }
                    else
                    {
                        Helper.LoadDropDownList("SELECT * FROM zone", _sqlCon, Zone_Name_DropDownList, "zone_Arabic_name", "zone_Id");
                        Zone_Name_DropDownList.Items.Insert(0, "...............");
                    }

                    Pin_No_Worrnig.Visible = true;
                    
                    if (Session["Langues"].ToString() == "1") { Pin_No_Worrnig.Text = "Make Sure The BIN Is Correct"; }
                    else { Pin_No_Worrnig.Text = "تأكد من صحة الرقم المساحي"; }
                }
            }
            catch
            {
                Response.Write(@"<script language='javascript'>alert('الرجاء التأكد من صحة الرقم المساحي')</script>");
            }
        }

        protected void Zone_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pin_No_Worrnig.Visible = false;
        }

        protected void Btn_Add_Ownership_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                _sqlCon.Open();
                MySqlCommand cmd = new MySqlCommand("Add_OwnerShip", _sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("owner_Owner_Id", Owner_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("zone_zone_Id", Zone_Name_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("Owner_Ship_EN_Name", txt_En_Ownership_Name.Text);
                cmd.Parameters.AddWithValue("Owner_Ship_AR_Name", txt_Ar_Ownership_Name.Text);
                cmd.Parameters.AddWithValue("ownership_NO", txt_Ownership_Number.Text);
                cmd.Parameters.AddWithValue("Parcel_Area", txt_Parcel_Area.Text);
                cmd.Parameters.AddWithValue("Bond_NO", txt_Bond_No.Text);
                cmd.Parameters.AddWithValue("Bond_Date", txt_bond_Date.Text);
                cmd.Parameters.AddWithValue("Street_NO", txt_Street_No.Text);
                cmd.Parameters.AddWithValue("Street_Name", txt_Street_Name.Text);
                cmd.Parameters.AddWithValue("Land_Value", txt_Lande_Value.Text);
                cmd.Parameters.AddWithValue("IsRealEsataeInvesment", "0");
                cmd.Parameters.AddWithValue("Active", "0");

                if (txt_Map_Url.Text == "") { cmd.Parameters.AddWithValue("Mab_Url", "No File"); }
                else { cmd.Parameters.AddWithValue("Mab_Url", txt_Map_Url.Text); }
                //************************** Appreciation_octagon ****************************************************************

                if (CheckBox_Appreciation.Checked) { cmd.Parameters.AddWithValue("Appreciation_octagon", "تقديري"); }
                else if (CheckBox_octagon.Checked) { cmd.Parameters.AddWithValue("Appreciation_octagon", "مثمن"); }
                else { cmd.Parameters.AddWithValue("Appreciation_octagon", " "); }
                //************************** PIN_Number & owner_ship_Code ****************************************************************
                char[] spaceNumberWords = txt_PIN_Number.Text.ToCharArray();
                if (spaceNumberWords.Length == 8)
                {
                    cmd.Parameters.AddWithValue("PIN_Number", txt_PIN_Number.Text);
                    cmd.Parameters.AddWithValue("owner_ship_Code", spaceNumberWords[0].ToString() + spaceNumberWords[1].ToString() + "/" + txt_Ownership_Number.Text);
                }
                else
                {
                    int numberDifference = 8 - spaceNumberWords.Length;
                    string countOfZeros = new string('0', numberDifference);
                    cmd.Parameters.AddWithValue("PIN_Number", countOfZeros + txt_PIN_Number.Text);
                    cmd.Parameters.AddWithValue("owner_ship_Code", spaceNumberWords[0].ToString() + "/" + txt_Ownership_Number.Text);
                }
                //*********************************** Files ************************************************

                if (Ownership_Certificate_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Ownership_Certificate_FileUpload.PostedFile.FileName);
                    Ownership_Certificate_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Ownership_Images/Ownership_Certificate/") + fileName1);
                    cmd.Parameters.AddWithValue("owner_ship_Certificate_Image", fileName1);
                    cmd.Parameters.AddWithValue("owner_ship_Certificate_Image_Path", "/English/Main_Application/Ownership_Images/Ownership_Certificate/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("owner_ship_Certificate_Image", "No File");
                    cmd.Parameters.AddWithValue("owner_ship_Certificate_Image_Path", "No File");
                }

                // *************************************************************************************************************
                if (Property_Scheme_FileUpload.HasFile)
                {
                    string fileName3 = Path.GetFileName(Property_Scheme_FileUpload.PostedFile.FileName);
                    Property_Scheme_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Ownership_Images/Property_Scheme/") + fileName3);
                    cmd.Parameters.AddWithValue("Property_Scheme_Image", fileName3);
                    cmd.Parameters.AddWithValue("Property_Scheme_Image_Path", "/English/Main_Application/Ownership_Images/Property_Scheme/" + fileName3);
                }
                else
                {
                    cmd.Parameters.AddWithValue("Property_Scheme_Image", "No File");
                    cmd.Parameters.AddWithValue("Property_Scheme_Image_Path", "No File");
                }
                cmd.ExecuteNonQuery();
                lbl_Success_Add_New_Ownership.Visible = true;
                //Button1.Visible = true; Button2.Visible = true;

                //********************************* Get Ownership ID To  Using it in New Building *******************************************
                using (MySqlCommand Get_Ownership_ID = new MySqlCommand("SELECT MAX(Owner_Ship_Id) AS LastInsertedID from owner_ship ", _sqlCon))
                {
                    Get_Ownership_ID.CommandType = CommandType.Text;
                    object Ownership_ID = Get_Ownership_ID.ExecuteScalar();
                    if (Ownership_ID != null) { Added_Ownership_Id.Text = Ownership_ID.ToString(); }
                }

                if (Session["Langues"].ToString() == "1") { lbl_Add_New_Building.Text = "Add BBuilding To Property :" + txt_En_Ownership_Name.Text; }
                else { lbl_Add_New_Building.Text = " إضافة بناء للملكية : " + txt_Ar_Ownership_Name.Text; }
                    
                Page.SetFocus(Button1.ClientID);
                _sqlCon.Close();

            }
        }

        //***************************************************      Add Building    *************************************************************************************************
        protected void Btn_Add_Building_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                _sqlCon.Open();
                MySqlCommand cmd = new MySqlCommand("Add_Building", _sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("Building_English_Name", txt_En_Bilding_Name.Text);
                cmd.Parameters.AddWithValue("Building_Arabic_Name", txt_Ar_Bilding_Name.Text);
                cmd.Parameters.AddWithValue("electricity_meter", txt_electricity_meter.Text);
                cmd.Parameters.AddWithValue("Water_meter", txt_Water_meter.Text);
                cmd.Parameters.AddWithValue("Building_NO", txt_Building_NO.Text);
                cmd.Parameters.AddWithValue("Construction_Area", txt_Construction_Area.Text);
                cmd.Parameters.AddWithValue("Maintenance_status", txt_Maintenance_status.Text);
                cmd.Parameters.AddWithValue("Building_Value", txt_Building_Value.Text);
                cmd.Parameters.AddWithValue("Construction_Completion_Date", Construction_Completion_Date_DropDownList.SelectedItem.Text);
                cmd.Parameters.AddWithValue("owner_ship_Owner_Ship_Id", Added_Ownership_Id.Text);
                cmd.Parameters.AddWithValue("building_condition_Building_Condition_Id", Building_Condition_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("building_type_Building_Type_Id", Building_Type_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("Active", "1");
                cmd.Parameters.AddWithValue("IsRealEsataeInvesment", "0");

                //*************************************** Add The File Uploads ************************************************************************************************
                if (Building_Photo_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Building_Photo_FileUpload.PostedFile.FileName);
                    Building_Photo_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Building_File/Building_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Building_Photo", fileName1);
                    cmd.Parameters.AddWithValue("@Building_Photo_Path", "/English/Main_Application/Building_File/Building_Photo/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Building_Photo", "No File");
                    cmd.Parameters.AddWithValue("@Building_Photo_Path", "No File");
                }

                //**********************************************************************************************************************************************************
                if (Statement_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Statement_FileUpload.PostedFile.FileName);
                    Statement_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Building_File/Statement/") + fileName1);
                    cmd.Parameters.AddWithValue("@Statement", fileName1);
                    cmd.Parameters.AddWithValue("@Statement_Path", "/English/Main_Application/Building_File/Statement/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Statement", "No File");
                    cmd.Parameters.AddWithValue("@Statement_Path", "No File");
                }

                //**********************************************************************************************************************************************************
                if (Building_Permit_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Building_Permit_FileUpload.PostedFile.FileName);
                    Building_Permit_FileUpload.PostedFile.SaveAs( Server.MapPath("/English/Main_Application/Building_File/Building_Permit/") + fileName1);
                    cmd.Parameters.AddWithValue("@Building_Permit", fileName1);
                    cmd.Parameters.AddWithValue("@Building_Permit_Path", "/English/Main_Application/Building_File/Building_Permit/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Building_Permit", "No File");
                    cmd.Parameters.AddWithValue("@Building_Permit_Path", "No File");
                }

                //**********************************************************************************************************************************************************
                if (certificate_of_completion_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(certificate_of_completion_FileUpload.PostedFile.FileName);
                    certificate_of_completion_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Building_File/certificate_completion/") + fileName1);
                    cmd.Parameters.AddWithValue("@certificate_of_completion", fileName1);
                    cmd.Parameters.AddWithValue("@certificate_of_completion_Path","/English/Main_Application/Building_File/certificate_completion/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@certificate_of_completion", "No File");
                    cmd.Parameters.AddWithValue("@certificate_of_completion_Path", "No File");
                }

                //**********************************************************************************************************************************************************
                if (Image_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Image_FileUpload.PostedFile.FileName);
                    Image_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Building_File/Image/") + fileName1);
                    cmd.Parameters.AddWithValue("@Image", fileName1);
                    cmd.Parameters.AddWithValue("@Image_Path","/English/Main_Application/Building_File/Image/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Image", "No File");
                    cmd.Parameters.AddWithValue("@Image_Path", "No File");
                }

                //**********************************************************************************************************************************************************
                if (Maps_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Maps_FileUpload.PostedFile.FileName);
                    Maps_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Building_File/Map/") + fileName1);
                    cmd.Parameters.AddWithValue("@Map", fileName1);
                    cmd.Parameters.AddWithValue("@Map_Path","/English/Main_Application/Building_File/Map/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Map", "No File");
                    cmd.Parameters.AddWithValue("@Map_Path", "No File");
                }

                //**********************************************************************************************************************************************************
                if (Plan_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Plan_FileUpload.PostedFile.FileName);
                    Plan_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Building_File/Building_Plan/") + fileName1);
                    cmd.Parameters.AddWithValue("@Plan", fileName1);
                    cmd.Parameters.AddWithValue("@Plano_Path","/English/Main_Application/Building_File/Building_Plan/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Plan", "No File");
                    cmd.Parameters.AddWithValue("@Plano_Path", "No File");
                }

                //**********************************************************************************************************************************************************
                if (Entrance_picture_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Entrance_picture_FileUpload.PostedFile.FileName);

                    Entrance_picture_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Building_File/Entrace_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Entrance_Photo", fileName1);
                    cmd.Parameters.AddWithValue("@Entrance_Photo_Path","/English/Main_Application/Building_File/Entrace_Photo/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Entrance_Photo", "No File");
                    cmd.Parameters.AddWithValue("@Entrance_Photo_Path", "No File");
                }
                cmd.ExecuteNonQuery();

                //********************************* Get Building ID To Add it in Half_Building_ID Col and Using it in New Units *******************************************
                using (MySqlCommand Get_Building_ID = new MySqlCommand("SELECT MAX(Building_Id) AS LastInsertedID from building ", _sqlCon))
                {
                    Get_Building_ID.CommandType = CommandType.Text;
                    object Building_ID = Get_Building_ID.ExecuteScalar();
                    if (Building_ID != null) {Building_id.Text = Building_ID.ToString(); }
                }

                string updateHalf_Building_IdQuary = "UPDATE building SET Half_Building_ID=@Half_Building_ID  WHERE Building_Id=@ID ";
                MySqlCommand updateHalf_Building_IdCmd = new MySqlCommand(updateHalf_Building_IdQuary, _sqlCon);
                updateHalf_Building_IdCmd.Parameters.AddWithValue("@ID", Building_id.Text);
                updateHalf_Building_IdCmd.Parameters.AddWithValue("@Half_Building_ID", Building_id.Text);
                updateHalf_Building_IdCmd.ExecuteNonQuery();
                
                
                _sqlCon.Close();
                if (Session["Langues"].ToString() == "1") { lbl_Success_Add_Building.Text = "Building Added Successfully";  }
                else { lbl_Success_Add_Building.Text = "تمت إضافة البناء بنجاح"; }
                    
            }
            //**********************************************************************************************************************************************************
            if (Session["Langues"].ToString() == "1") { lbl_Add_New_Unit.Text = "Add Units To Building" + txt_En_Bilding_Name.Text; }
            else { lbl_Add_New_Unit.Text = " إضافة وحدة لبناء : " + txt_En_Bilding_Name.Text; }

            Button3.Visible = true;
            Button4.Visible = true;
            Page.SetFocus(Button3.ClientID);
            _sqlCon.Close();
            Zone_Sterrt_BuildingNO();

        }

        protected void btn_Add_Unit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                _sqlCon.Open();
                MySqlCommand cmd = new MySqlCommand("Add_Unit", _sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Unit_Number", txt_Unit_NO.Text);
                cmd.Parameters.AddWithValue("@Floor_Number", txt_Floor_NO.Text);
                cmd.Parameters.AddWithValue("@Unit_Space", txt_Unit_Space.Text);
                cmd.Parameters.AddWithValue("@current_situation", txt_current_situation.Text);
                cmd.Parameters.AddWithValue("@Oreedo_Number", txt_Oreedo_Number.Text);
                cmd.Parameters.AddWithValue("@Electricityt_Number", txt_Electricityt_Number.Text);
                cmd.Parameters.AddWithValue("@Water_Number", txt_Water_Number.Text);
                cmd.Parameters.AddWithValue("@virtual_Value", txt_virtual_Value.Text);
                cmd.Parameters.AddWithValue("@Half", "0");
                cmd.Parameters.AddWithValue("@Active", "0");
                if (
                   Unit_Type_DropDownList.SelectedValue == "1" || Unit_Type_DropDownList.SelectedValue == "4" ||
                   Unit_Type_DropDownList.SelectedValue == "5" || Unit_Type_DropDownList.SelectedValue == "6" ||
                   Unit_Type_DropDownList.SelectedValue == "8" || Unit_Type_DropDownList.SelectedValue == "10"
                   )
                {
                    cmd.Parameters.AddWithValue("@furniture_case_Furniture_case_Id", Furniture_case_DropDownList.SelectedValue);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@furniture_case_Furniture_case_Id", "1");
                }
                cmd.Parameters.AddWithValue("@unit_condition_Unit_Condition_Id",Unit_Condition_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@unit_detail_Unit_Detail_Id", Unit_Detail_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@unit_type_Unit_Type_Id", Unit_Type_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@building_Building_Id", Building_id.Text);

                //*************************************** Add The File Uploads ************************************************************************************************
                if (Image_One_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Image_One_FileUpload.PostedFile.FileName);
                    Image_One_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/units_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Image_One", fileName1);
                    cmd.Parameters.AddWithValue("@Image_One_Path","/English/Main_Application/units_Photo/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Image_One", "No File");
                    cmd.Parameters.AddWithValue("@Image_One_Path", "No File");
                }

                //**********************************************************************************************************************************************************
                if (Image_Two_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Image_Two_FileUpload.PostedFile.FileName);
                    Image_Two_FileUpload.PostedFile.SaveAs( Server.MapPath("/English/Main_Application/units_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Image_Two", fileName1);
                    cmd.Parameters.AddWithValue("@Image_Two_Path","/English/Main_Application/units_Photo/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Image_Two", "No File");
                    cmd.Parameters.AddWithValue("@Image_Two_Path", "No File");
                }

                //**********************************************************************************************************************************************************
                if (Image_Three_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Image_Three_FileUpload.PostedFile.FileName);
                    Image_Three_FileUpload.PostedFile.SaveAs( Server.MapPath("/English/Main_Application/units_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Image_Three", fileName1);
                    cmd.Parameters.AddWithValue("@Image_Three_Path", "/English/Main_Application/units_Photo/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Image_Three", "No File");
                    cmd.Parameters.AddWithValue("@Image_Three_Path", "No File");
                }

                //**********************************************************************************************************************************************************
                if (Image_Four_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Image_Four_FileUpload.PostedFile.FileName);
                    Image_Four_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/units_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Image_Four", fileName1);
                    cmd.Parameters.AddWithValue("@Image_Four_Path","/English/Main_Application/units_Photo/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Image_Four", "No File");
                    cmd.Parameters.AddWithValue("@Image_Four_Path", "No File");
                }

                cmd.ExecuteNonQuery();
                
                _sqlCon.Close();

                if (Session["Langues"].ToString() == "1") { lbl_Success_Add_Unit.Text = "Unit Added Successfully"; }
                else { lbl_Success_Add_Unit.Text = "تمت إضافة الوحدة بنجاح"; }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.SetFocus(Building_Photo_FileUpload.ClientID);
            Buidling_Panel.Visible = true;
            lbl_Success_Add_New_Ownership.Visible = false;
            txt_En_Ownership_Name.ReadOnly = true;
            txt_Ar_Ownership_Name.ReadOnly = true;
            txt_Ownership_Number.ReadOnly = true;
            txt_Bond_No.ReadOnly = true;
            txt_Lande_Value.ReadOnly = true;
            txt_Parcel_Area.ReadOnly = true;
            txt_PIN_Number.ReadOnly = true;
            txt_Street_No.ReadOnly = true;
            Owner_DropDownList.Enabled = false;
            Zone_Name_DropDownList.Enabled = false;
            btn_Add_Ownership.Enabled = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Accordin_Add_Ownership.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Unit_Panel.Visible = true;
            lbl_Success_Add_Building.Visible = false;
            txt_En_Bilding_Name.ReadOnly = true;
            txt_Ar_Bilding_Name.ReadOnly = true;
            txt_Building_NO.ReadOnly = true;
            txt_Construction_Area.ReadOnly = true;
            txt_Maintenance_status.ReadOnly = true;
            txt_electricity_meter.ReadOnly = true;
            txt_Water_meter.ReadOnly = true;
            Building_Condition_DropDownList.Enabled = false;
            Building_Type_DropDownList.Enabled = false;
            btn_Add_Building.Enabled = false;
            Page.SetFocus(Image_One_FileUpload.ClientID);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Unit_Panel.Visible = false;
            Button3.Visible = false;
            Button4.Visible = false;
            lbl_Success_Add_Building.Visible = false;
            txt_En_Bilding_Name.ReadOnly = false;
            txt_Ar_Bilding_Name.ReadOnly = false;
            txt_Building_NO.ReadOnly = false;
            txt_Construction_Area.ReadOnly = false;
            txt_Maintenance_status.ReadOnly = false;
            txt_electricity_meter.ReadOnly = false;
            txt_Water_meter.ReadOnly = false;
            Building_Condition_DropDownList.Enabled = true;
            Building_Type_DropDownList.Enabled = true;
            btn_Add_Building.Enabled = true;

            txt_En_Bilding_Name.Text = "";
            txt_Ar_Bilding_Name.Text = "";
            txt_Building_NO.Text = "";
            txt_Construction_Area.Text = "";
            txt_Maintenance_status.Text = "";
            txt_electricity_meter.Text = "";
            txt_Water_meter.Text = "";

            //Get Building_Condition DropDownList
            Helper.LoadDropDownList("SELECT * FROM building_condition", _sqlCon, Building_Condition_DropDownList,"Building_Arabic_Condition", "Building_Condition_Id");

           //Get Building_Type  DropDownList
            Helper.LoadDropDownList("SELECT * FROM building_type", _sqlCon, Building_Type_DropDownList, "Building_Arabic_Type", "Building_Type_Id");
        }

        protected void btn_Back_To_OwnerShip_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ownership_List.aspx");
        }

        protected void btn_Back_To_Building_Click(object sender, EventArgs e)
        {
            Response.Redirect("Building_List.aspx");
        }

        protected void btn_Back_To_Unit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Units_List.aspx");
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox_Appreciation.Checked)
            {
                CheckBox_octagon.Checked = false;
            }
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox_octagon.Checked)
            {
                CheckBox_Appreciation.Checked = false;
            }
        }

        protected void Unit_Type_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (
                Unit_Type_DropDownList.SelectedValue == "1" || Unit_Type_DropDownList.SelectedValue == "4" ||
                Unit_Type_DropDownList.SelectedValue == "5" || Unit_Type_DropDownList.SelectedValue == "6" ||
                Unit_Type_DropDownList.SelectedValue == "8" || Unit_Type_DropDownList.SelectedValue == "10"
            )
            {
                div_Furniture_case.Visible = true;
            }
            else
            {
                div_Furniture_case.Visible = false;
            }
        }


        protected void ownership_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Zone_Street();
        }


        protected void Zone_Street()
        {
            _sqlCon.Open();
            using (MySqlCommand ownershipDetailsCmd = new MySqlCommand("Ownership_Details", _sqlCon))
            {
                ownershipDetailsCmd.CommandType = CommandType.StoredProcedure;
                ownershipDetailsCmd.Parameters.AddWithValue("@Id", Added_Ownership_Id.Text);
                using (MySqlDataAdapter ownershipDetailsSda = new MySqlDataAdapter(ownershipDetailsCmd))
                {
                    DataTable ownershipDetailsDt = new DataTable();
                    ownershipDetailsSda.Fill(ownershipDetailsDt);


                    txt_Street_No.Text = ownershipDetailsDt.Rows[0]["Street_NO"].ToString();
                    txt_Zone_No.Text = ownershipDetailsDt.Rows[0]["zone_number"].ToString();
                }
            }
            _sqlCon.Close();
        }

        protected void Building_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Zone_Sterrt_BuildingNO();
        }
        protected void Zone_Sterrt_BuildingNO()
        {
            _sqlCon.Open();
            using (MySqlCommand buildingDetailsCmd = new MySqlCommand("Building_Details", _sqlCon))
            {
                buildingDetailsCmd.CommandType = CommandType.StoredProcedure;
                buildingDetailsCmd.Parameters.AddWithValue("@Id", Building_id.Text);
                using (MySqlDataAdapter buildingDetailsSda = new MySqlDataAdapter(buildingDetailsCmd))
                {
                    DataTable bulidingDetailsDt = new DataTable();
                    buildingDetailsSda.Fill(bulidingDetailsDt);

                    txt_Building_NO.Text = bulidingDetailsDt.Rows[0]["Building_NO"].ToString();
                    txt_Street_No.Text = bulidingDetailsDt.Rows[0]["Street_NO"].ToString();
                    txt_Zone_No.Text = bulidingDetailsDt.Rows[0]["zone_number"].ToString();
                }
            }
            _sqlCon.Close();
        }




        //******************************************************************************************************************************************
        //************************************************** languages ****************************************************************
        //******************************************************************************************************************************************

        protected void language()
        {

            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            _sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //************************************************* Ownership Labels ************************************************

                   //Get Owner DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner", _sqlCon, Owner_DropDownList, "Owner_English_name", "Owner_Id");
                    Owner_DropDownList.Items.Insert(0, "...............");
                    //Get Zone Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM zone", _sqlCon, Zone_Name_DropDownList, "zone_English_name", "zone_Id");
                    Zone_Name_DropDownList.Items.Insert(0, "...............");

                    lbl_titel_Add_New_Ownership.Text = Dt.Rows[35]["EN"].ToString();
                    lbl_En_Ownership_Name.Text = Dt.Rows[44]["EN"].ToString() + "(EN)"; ;
                    lbl_Ar_Ownership_Name.Text = Dt.Rows[44]["EN"].ToString() + "(Ar)"; ;
                    lbl_Ownership_Number.Text = Dt.Rows[46]["EN"].ToString();
                    lbl_Bond_No.Text = Dt.Rows[41]["EN"].ToString();
                    lbl_PIN_Number.Text = Dt.Rows[39]["EN"].ToString();
                    lbl_Zone_Name.Text = Dt.Rows[36]["EN"].ToString();
                    lbl_Owner_Name.Text = Dt.Rows[38]["EN"].ToString();
                    lbl_Parcel_Area.Text = Dt.Rows[40]["EN"].ToString();
                    lbl_Lande_Value.Text = Dt.Rows[47]["EN"].ToString();
                    lbl_Street_No.Text = Dt.Rows[48]["EN"].ToString();
                    lbl_Street_Name.Text = Dt.Rows[49]["EN"].ToString();
                    lbl_bond_Date.Text = Dt.Rows[50]["EN"].ToString();
                    lbl_Ownership_Certificates.Text = Dt.Rows[51]["EN"].ToString();
                    lbl_Property_Scheme.Text = Dt.Rows[52]["EN"].ToString();
                    btn_Add_Ownership.Text = Dt.Rows[53]["EN"].ToString();
                    btn_Back_To_OwnerShip_List.Text = Dt.Rows[54]["EN"].ToString();
                    Button1.Text = "Adding a building to the previous property";
                    Button2.Text = Dt.Rows[53]["EN"].ToString();
                    lbl_Success_Add_New_Ownership.Text = Dt.Rows[55]["EN"].ToString();
                    CheckBox_Appreciation.Text = "Estimated";
                    CheckBox_octagon.Text = "Octagonal";

                    Reg_Ex_En_Ownership_Name.ErrorMessage = Dt.Rows[56]["EN"].ToString();
                    Reg_Ex_Ar_Ownership_Name.ErrorMessage = Dt.Rows[57]["EN"].ToString();
                    Reg_Exp_Ownership_Number.ErrorMessage = Dt.Rows[58]["EN"].ToString();
                    Reg_Exp_PIN_Number.ErrorMessage = Dt.Rows[58]["EN"].ToString();
                    Reg_Exp_Land_Vaue.ErrorMessage = Dt.Rows[58]["EN"].ToString();

                    Req_Val_En_Ownership_Name.ErrorMessage = "* Required ";
                    Req_Val_Ar_Ownership_Name.ErrorMessage = "* Required ";
                    Req_Val_Ownership_Number.ErrorMessage = "* Required ";
                    Req_Val_PIN_Number.ErrorMessage = "* Required ";
                    Zone_Name_Req_Val.ErrorMessage = "* Required ";
                    Owner_Name_Req_dVal.ErrorMessage = "* Required ";
                    Lande_Value_Req_Field_Val.ErrorMessage = "* Required ";

                    

                    //************************************************* Building Labels ************************************************

                    //Get Building_Condition DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building_condition", _sqlCon, Building_Condition_DropDownList, "Building_English_Condition", "Building_Condition_Id");
                    Building_Condition_DropDownList.Items.Insert(0, "...............");

                    //Get Building_Type  DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building_type", _sqlCon, Building_Type_DropDownList, "Building_English_Type", "Building_Type_Id");
                    Building_Type_DropDownList.Items.Insert(0, "...............");

                    lbl_Ar_Bildingp_Name.Text = Dt.Rows[59]["EN"].ToString()+"(Ar)";
                    lbl_En_Bilding_Name.Text = Dt.Rows[59]["EN"].ToString() + "(En)";
                    lbl_Construction_Area.Text = Dt.Rows[60]["EN"].ToString();
                    lbl_Building_Condition.Text = Dt.Rows[61]["EN"].ToString();
                    lbl_Building_Type.Text = Dt.Rows[62]["EN"].ToString();
                    lbl_Maintenance_status.Text = Dt.Rows[63]["EN"].ToString();
                    lbl_Water_meter.Text = Dt.Rows[64]["EN"].ToString();
                    lbl_electricity_meter.Text = Dt.Rows[65]["EN"].ToString();
                    lbl_Building_Value.Text = Dt.Rows[76]["EN"].ToString();
                    lbl_Construction_Completion_Date.Text = Dt.Rows[66]["EN"].ToString();
                    lbl_ownership_Name.Text = Dt.Rows[44]["EN"].ToString();
                    lbl_Building_NO.Text = Dt.Rows[67]["EN"].ToString();
                    lbl_Street.Text = Dt.Rows[49]["EN"].ToString();
                    txt_Zone_No.Text = Dt.Rows[48]["EN"].ToString();
                    lbl_Building_Photo.Text = Dt.Rows[68]["EN"].ToString();
                    lbl_Plan.Text = Dt.Rows[69]["EN"].ToString();
                    lbl_Statement.Text = Dt.Rows[70]["EN"].ToString();
                    lbl_Maps.Text = Dt.Rows[71]["EN"].ToString();
                    lbl_Building_Permit.Text = Dt.Rows[72]["EN"].ToString();
                    lbl_certificate_of_completion.Text = Dt.Rows[73]["EN"].ToString();
                    lbl_Entrance_picture.Text = Dt.Rows[74]["EN"].ToString();
                    lbl_Image.Text = "Another image";
                    lbl_Success_Add_Building.Text = Dt.Rows[77]["EN"].ToString();
                    lbl_Building_File.Text = "Building Attachments";
                    btn_Add_Building.Text = Dt.Rows[75]["EN"].ToString();
                    btn_Back_To_Building.Text = Dt.Rows[78]["EN"].ToString();
                    Button3.Text = "Adding a Unit to the previous Building";
                    Button4.Text = Dt.Rows[75]["EN"].ToString();


                    Reg_Exp_En_Bilding_Name.ErrorMessage = Dt.Rows[56]["EN"].ToString();
                    Reg_Ex_Ar_Bilding_Name.ErrorMessage = Dt.Rows[57]["EN"].ToString();
                    Reg_Exp_Building_Value.ErrorMessage = Dt.Rows[58]["EN"].ToString();

                    Req_Val_Ar_Bilding_Name.ErrorMessage = "* Required ";
                    Req_Val_En_Bilding_Name.ErrorMessage = "* Required ";
                    Building_Condition_Req_Val.ErrorMessage = "* Required ";
                    Building_Type_Req_Val.ErrorMessage = "* Required ";
                    Building_Value_Req_Field_Val.ErrorMessage = "* Required ";
                    ownership_Name_Req_Val.ErrorMessage = "* Required ";

                    //************************************************* Unit Labels ************************************************
                    //Get unit_condition DropDownList
                    Helper.LoadDropDownList("SELECT * FROM unit_condition", _sqlCon, Unit_Condition_DropDownList, "Unit_English_Condition", "Unit_Condition_Id");
                    Unit_Condition_DropDownList.Items.Insert(0, "...............");
                    Unit_Condition_DropDownList.SelectedValue = "2";

                    //Get unit_Type DropDownList
                    Helper.LoadDropDownList("SELECT * FROM unit_type", _sqlCon, Unit_Type_DropDownList, "Unit_English_Type", "Unit_Type_Id");
                    Unit_Type_DropDownList.Items.Insert(0, "...............");

                    //Get unit_Detail DropDownList
                    Helper.LoadDropDownList("SELECT * FROM unit_detail", _sqlCon, Unit_Detail_DropDownList, "Unit_English_Detail", "Unit_Detail_Id");
                    Unit_Detail_DropDownList.Items.Insert(0, "...............");

                    //Get Furniture_case_DropDownList DropDownList
                    Furniture_case_DropDownList.Items.Clear();
                    Furniture_case_DropDownList.Items.Add(new ListItem("Furnished", "1"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("Semi Furnished", "2"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("Unfurnished", "3"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("Undefined", "4"));
                    Furniture_case_DropDownList.Items[3].Attributes["disabled"] = "disabled";
                    Furniture_case_DropDownList.Items.Insert(0, "...............");

                    _sqlCon.Close();

                    lbl_Unit_Type.Text = Dt.Rows[79]["EN"].ToString();
                    lbl_Unit_Condition.Text = Dt.Rows[80]["EN"].ToString();
                    lbl_Unit_Detail.Text = Dt.Rows[81]["EN"].ToString();
                    lbl_Furniture_case.Text = Dt.Rows[90]["EN"].ToString();
                    lbl_Unit_Space.Text = Dt.Rows[82]["EN"].ToString();
                    lbl_current_situation.Text = Dt.Rows[83]["EN"].ToString();
                    lbl_virtual_Value.Text = Dt.Rows[84]["EN"].ToString();
                    lbl_Oreedo_Number.Text = Dt.Rows[85]["EN"].ToString();
                    lbl_Electricityt_Number.Text = Dt.Rows[65]["EN"].ToString();
                    lbl_Water_Number.Text = Dt.Rows[64]["EN"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[67]["EN"].ToString();
                    lbl_Unit_NO.Text = Dt.Rows[86]["EN"].ToString();
                    lbl_Floor_NO.Text = Dt.Rows[87]["EN"].ToString();
                    Label2.Text = Dt.Rows[67]["EN"].ToString();
                    Label3.Text = Dt.Rows[48]["EN"].ToString();
                    Label4.Text = Dt.Rows[36]["EN"].ToString();
                    lbl_Image_One.Text = "Image One";
                    lbl_Image_Two.Text = "Image Two";
                    lbl_Image_Three.Text = "Image Three";
                    lbl_Image_Four.Text = "Image Four";
                    lbl_Success_Add_Unit.Text = Dt.Rows[91]["EN"].ToString();
                    lbl_Unit_File.Text = "Unit Attachments";
                    btn_Add_Unit.Text = Dt.Rows[88]["EN"].ToString();
                    btn_Back_To_Unit.Text = Dt.Rows[89]["EN"].ToString();


                    Unit_Space_Reg_Ex.ErrorMessage = Dt.Rows[58]["EN"].ToString();
                    virtual_Value_Reg_Exp_Val.ErrorMessage = Dt.Rows[58]["EN"].ToString();


                    Unit_Type_Req_Val.ErrorMessage = "* Required ";
                    Unit_Condition_Req_Val.ErrorMessage = "* Required ";
                    Unit_Detail_Req_Val.ErrorMessage = "* Required ";
                    Furniture_case_RequiredFieldValidator.ErrorMessage = "* Required ";
                    virtual_ValueReq_Field_Val.ErrorMessage = "* Required ";
                    Building_Name_Req_Val.ErrorMessage = "* Required ";
                    Unit_NO_Req_Val.ErrorMessage = "* Required ";
                    Floor_NO_Req_Val.ErrorMessage = "* Required ";




                }
                else
                {
                    //************************************************* Ownership Labels ************************************************

                    //Get Owner DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner", _sqlCon, Owner_DropDownList, "Owner_Arabic_name", "Owner_Id");
                    Owner_DropDownList.Items.Insert(0, "...............");
                    //Get Zone Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM zone", _sqlCon, Zone_Name_DropDownList, "zone_Arabic_name", "zone_Id");
                    Zone_Name_DropDownList.Items.Insert(0, "...............");

                    lbl_titel_Add_New_Ownership.Text = Dt.Rows[35]["AR"].ToString();
                    lbl_En_Ownership_Name.Text = Dt.Rows[44]["AR"].ToString() + "(بالإنكليزية)";
                    lbl_Ar_Ownership_Name.Text = Dt.Rows[44]["AR"].ToString() + "(بالعربية)";
                    lbl_Ownership_Number.Text = Dt.Rows[46]["AR"].ToString();
                    lbl_Bond_No.Text = Dt.Rows[41]["AR"].ToString();
                    lbl_PIN_Number.Text = Dt.Rows[39]["AR"].ToString();
                    lbl_Zone_Name.Text = Dt.Rows[36]["AR"].ToString();
                    lbl_Owner_Name.Text = Dt.Rows[38]["AR"].ToString();
                    lbl_Parcel_Area.Text = Dt.Rows[40]["AR"].ToString();
                    lbl_Lande_Value.Text = Dt.Rows[47]["AR"].ToString();
                    lbl_Street_No.Text = Dt.Rows[48]["AR"].ToString();
                    lbl_Street_Name.Text = Dt.Rows[49]["AR"].ToString();
                    lbl_bond_Date.Text = Dt.Rows[50]["AR"].ToString();
                    lbl_Ownership_Certificates.Text = Dt.Rows[51]["AR"].ToString();
                    lbl_Property_Scheme.Text = Dt.Rows[52]["AR"].ToString();
                    btn_Add_Ownership.Text = Dt.Rows[53]["AR"].ToString();
                    btn_Back_To_OwnerShip_List.Text = Dt.Rows[54]["AR"].ToString();
                    Button1.Text = "إضافة بناء للملكية السابقة";
                    Button2.Text = Dt.Rows[53]["AR"].ToString();
                    lbl_Success_Add_New_Ownership.Text = Dt.Rows[55]["AR"].ToString();
                    CheckBox_Appreciation.Text = "تقديري";
                    CheckBox_octagon.Text = "مثمن";

                    Reg_Ex_En_Ownership_Name.ErrorMessage = Dt.Rows[56]["AR"].ToString();
                    Reg_Ex_Ar_Ownership_Name.ErrorMessage = Dt.Rows[57]["AR"].ToString();
                    Reg_Exp_Ownership_Number.ErrorMessage = Dt.Rows[58]["AR"].ToString();
                    Reg_Exp_PIN_Number.ErrorMessage = Dt.Rows[58]["AR"].ToString();
                    Reg_Exp_Land_Vaue.ErrorMessage = Dt.Rows[58]["AR"].ToString();

                    Req_Val_En_Ownership_Name.ErrorMessage = "* حقل مطلوب ";
                    Req_Val_Ar_Ownership_Name.ErrorMessage = "* حقل مطلوب ";
                    Req_Val_Ownership_Number.ErrorMessage = "* حقل مطلوب ";
                    Req_Val_PIN_Number.ErrorMessage = "* حقل مطلوب ";
                    Zone_Name_Req_Val.ErrorMessage = "* حقل مطلوب ";
                    Owner_Name_Req_dVal.ErrorMessage = "* حقل مطلوب ";
                    Lande_Value_Req_Field_Val.ErrorMessage = "* حقل مطلوب ";

                    

                    //************************************************* Building Labels ************************************************

                    //Get Building_Condition DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building_condition", _sqlCon, Building_Condition_DropDownList, "Building_Arabic_Condition", "Building_Condition_Id");
                    Building_Condition_DropDownList.Items.Insert(0, "...............");

                    //Get Building_Type  DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building_type", _sqlCon, Building_Type_DropDownList, "Building_Arabic_Type", "Building_Type_Id");
                    Building_Type_DropDownList.Items.Insert(0, "...............");

                    lbl_Ar_Bildingp_Name.Text = Dt.Rows[59]["AR"].ToString() + "(بالعربية)";
                    lbl_En_Bilding_Name.Text = Dt.Rows[59]["AR"].ToString() + "(بالإنكليزية)";
                    lbl_Construction_Area.Text = Dt.Rows[60]["AR"].ToString();
                    lbl_Building_Condition.Text = Dt.Rows[61]["AR"].ToString();
                    lbl_Building_Type.Text = Dt.Rows[62]["AR"].ToString();
                    lbl_Maintenance_status.Text = Dt.Rows[63]["AR"].ToString();
                    lbl_Water_meter.Text = Dt.Rows[64]["AR"].ToString();
                    lbl_electricity_meter.Text = Dt.Rows[65]["AR"].ToString();
                    lbl_Building_Value.Text = Dt.Rows[76]["AR"].ToString();
                    lbl_Construction_Completion_Date.Text = Dt.Rows[66]["AR"].ToString();
                    lbl_ownership_Name.Text = Dt.Rows[44]["AR"].ToString();
                    lbl_Building_NO.Text = Dt.Rows[67]["AR"].ToString();
                    lbl_Street.Text = Dt.Rows[49]["AR"].ToString();
                    txt_Zone_No.Text = Dt.Rows[48]["AR"].ToString();
                    lbl_Building_Photo.Text = Dt.Rows[68]["AR"].ToString();
                    lbl_Plan.Text = Dt.Rows[69]["AR"].ToString();
                    lbl_Statement.Text = Dt.Rows[70]["AR"].ToString();
                    lbl_Maps.Text = Dt.Rows[71]["AR"].ToString();
                    lbl_Building_Permit.Text = Dt.Rows[72]["AR"].ToString();
                    lbl_certificate_of_completion.Text = Dt.Rows[73]["AR"].ToString();
                    lbl_Entrance_picture.Text = Dt.Rows[74]["AR"].ToString();
                    lbl_Image.Text = "Another image";
                    lbl_Success_Add_Building.Text = Dt.Rows[77]["AR"].ToString();
                    lbl_Building_File.Text = "مرفقات البناء";
                    btn_Add_Building.Text = Dt.Rows[75]["AR"].ToString();
                    btn_Back_To_Building.Text = Dt.Rows[78]["AR"].ToString();
                    Button3.Text = "إضافة وحدة للبناء السابق";
                    Button4.Text = Dt.Rows[75]["AR"].ToString();

                    Reg_Exp_En_Bilding_Name.ErrorMessage = Dt.Rows[56]["AR"].ToString();
                    Reg_Ex_Ar_Bilding_Name.ErrorMessage = Dt.Rows[57]["AR"].ToString();
                    Reg_Exp_Building_Value.ErrorMessage = Dt.Rows[58]["AR"].ToString();

                    Req_Val_Ar_Bilding_Name.ErrorMessage = "* حقل مطلوب ";
                    Req_Val_En_Bilding_Name.ErrorMessage = "* حقل مطلوب ";
                    Building_Condition_Req_Val.ErrorMessage = "* حقل مطلوب ";
                    Building_Type_Req_Val.ErrorMessage = "* حقل مطلوب ";
                    Building_Value_Req_Field_Val.ErrorMessage = "* حقل مطلوب ";
                    ownership_Name_Req_Val.ErrorMessage = "* حقل مطلوب ";

                    //************************************************* Unit Labels ************************************************
                    //Get unit_condition DropDownList
                    Helper.LoadDropDownList("SELECT * FROM unit_condition", _sqlCon, Unit_Condition_DropDownList, "Unit_Arabic_Condition", "Unit_Condition_Id");
                    Unit_Condition_DropDownList.Items.Insert(0, "...............");
                    Unit_Condition_DropDownList.SelectedValue = "2";

                    //Get unit_Type DropDownList
                    Helper.LoadDropDownList("SELECT * FROM unit_type", _sqlCon, Unit_Type_DropDownList, "Unit_Arabic_Type", "Unit_Type_Id");
                    Unit_Type_DropDownList.Items.Insert(0, "...............");

                    //Get unit_Detail DropDownList
                    Helper.LoadDropDownList("SELECT * FROM unit_detail", _sqlCon, Unit_Detail_DropDownList, "Unit_Arabic_Detail", "Unit_Detail_Id");
                    Unit_Detail_DropDownList.Items.Insert(0, "...............");

                    //Get Furniture_case_DropDownList DropDownList
                    Furniture_case_DropDownList.Items.Clear();
                    Furniture_case_DropDownList.Items.Add(new ListItem("مفروش", "1"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("نصف مفروش", "2"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("غير مفروش", "3"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("غير محدد", "4"));
                    Furniture_case_DropDownList.Items[3].Attributes["disabled"] = "disabled";
                    Furniture_case_DropDownList.Items.Insert(0, "...............");

                    _sqlCon.Close();

                    lbl_Unit_Type.Text = Dt.Rows[79]["AR"].ToString();
                    lbl_Unit_Condition.Text = Dt.Rows[80]["AR"].ToString();
                    lbl_Unit_Detail.Text = Dt.Rows[81]["AR"].ToString();
                    lbl_Furniture_case.Text = Dt.Rows[90]["AR"].ToString();
                    lbl_Unit_Space.Text = Dt.Rows[82]["AR"].ToString();
                    lbl_current_situation.Text = Dt.Rows[83]["AR"].ToString();
                    lbl_virtual_Value.Text = Dt.Rows[84]["AR"].ToString();
                    lbl_Oreedo_Number.Text = Dt.Rows[85]["AR"].ToString();
                    lbl_Electricityt_Number.Text = Dt.Rows[65]["AR"].ToString();
                    lbl_Water_Number.Text = Dt.Rows[64]["AR"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[67]["AR"].ToString();
                    lbl_Unit_NO.Text = Dt.Rows[86]["AR"].ToString();
                    lbl_Floor_NO.Text = Dt.Rows[87]["AR"].ToString();
                    Label2.Text = Dt.Rows[67]["AR"].ToString();
                    Label3.Text = Dt.Rows[48]["AR"].ToString();
                    Label4.Text = Dt.Rows[36]["AR"].ToString();
                    lbl_Image_One.Text = "Image One";
                    lbl_Image_Two.Text = "Image Two";
                    lbl_Image_Three.Text = "Image Three";
                    lbl_Image_Four.Text = "Image Four";
                    lbl_Success_Add_Unit.Text = Dt.Rows[91]["AR"].ToString();
                    lbl_Unit_File.Text = "مرفقات الوحدة";
                    btn_Add_Unit.Text = Dt.Rows[88]["AR"].ToString();
                    btn_Back_To_Unit.Text = Dt.Rows[89]["AR"].ToString();


                    Unit_Space_Reg_Ex.ErrorMessage = Dt.Rows[58]["AR"].ToString();
                    virtual_Value_Reg_Exp_Val.ErrorMessage = Dt.Rows[58]["AR"].ToString();


                    Unit_Type_Req_Val.ErrorMessage = "* حقل مطلوب ";
                    Unit_Condition_Req_Val.ErrorMessage = "* حقل مطلوب ";
                    Unit_Detail_Req_Val.ErrorMessage = "* Required ";
                    Furniture_case_RequiredFieldValidator.ErrorMessage = "* حقل مطلوب ";
                    virtual_ValueReq_Field_Val.ErrorMessage = "* حقل مطلوب ";
                    Building_Name_Req_Val.ErrorMessage = "* حقل مطلوب ";
                    Unit_NO_Req_Val.ErrorMessage = "* حقل مطلوب ";
                    Floor_NO_Req_Val.ErrorMessage = "* حقل مطلوب ";


                }
            }
            _sqlCon.Close();
        }
    }
}