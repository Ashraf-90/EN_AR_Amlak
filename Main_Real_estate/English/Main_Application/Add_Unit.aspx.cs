using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Add_Unit : System.Web.UI.Page
    {
        // Database Connection String
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
                Helper.LoadDropDownList("SELECT * FROM unit_condition", _sqlCon, Unit_Condition_DropDownList, "Unit_Arabic_Condition", "Unit_Condition_Id");
                Unit_Condition_DropDownList.Items.Insert(0, "إختر حالة الوحدة ....");
                Unit_Condition_DropDownList.SelectedValue = "2";

                language();
            }
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
                cmd.Parameters.AddWithValue("@unit_condition_Unit_Condition_Id", Unit_Condition_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@unit_detail_Unit_Detail_Id", Unit_Detail_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@unit_type_Unit_Type_Id", Unit_Type_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@building_Building_Id", Building_Name_DropDownList.SelectedValue);

                //*************************************** Add The File Uploads ************************************************************************************************
                if (Image_One_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Image_One_FileUpload.PostedFile.FileName);
                    Image_One_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/units_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Image_One", fileName1);
                    cmd.Parameters.AddWithValue("@Image_One_Path", "/English/Main_Application/units_Photo/" + fileName1);
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
                    Image_Two_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/units_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Image_Two", fileName1);
                    cmd.Parameters.AddWithValue("@Image_Two_Path", "/English/Main_Application/units_Photo/" + fileName1);
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
                    Image_Three_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/units_Photo/") + fileName1);
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
                    cmd.Parameters.AddWithValue("@Image_Four_Path", "/English/Main_Application/units_Photo/" + fileName1);
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

        protected void btn_Back_To_Unit_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] != null)
            {
                Response.Redirect("Test_4.aspx");
            }
            else
            {
                Response.Redirect("Units_List.aspx");
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
            else { div_Furniture_case.Visible = false; }
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
                buildingDetailsCmd.Parameters.AddWithValue("@Id", Building_Name_DropDownList.SelectedValue);
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

                    //Get Building DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building where Active = '1'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    //Get Furniture_case_DropDownList DropDownList
                    Furniture_case_DropDownList.Items.Clear();
                    Furniture_case_DropDownList.Items.Add(new ListItem("Furnished", "1"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("Semi Furnished", "2"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("Unfurnished", "3"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("Undefined", "4"));
                    Furniture_case_DropDownList.Items[3].Attributes["disabled"] = "disabled";
                    Furniture_case_DropDownList.Items.Insert(0, "...............");

                    //_sqlCon.Close();

                    lbl_Add_New_Unit.Text = Dt.Rows[88]["EN"].ToString();
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
                    lbl_Building_Name.Text = Dt.Rows[59]["EN"].ToString();
                    lbl_Unit_NO.Text = Dt.Rows[86]["EN"].ToString();
                    lbl_Floor_NO.Text = Dt.Rows[87]["EN"].ToString();
                    lbl_Building_NO.Text = Dt.Rows[67]["EN"].ToString();
                    lbl_Street_No.Text = Dt.Rows[48]["EN"].ToString();
                    lbl_Zone_No.Text = Dt.Rows[36]["EN"].ToString();
                    lbl_Image_One.Text = "Image One";
                    lbl_Image_Two.Text = "Image Two";
                    lbl_Image_Three.Text = "Image Three";
                    lbl_Image_Four.Text = "Image Four";
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

                    //Get Building DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building where Active = '1'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    //Get Furniture_case_DropDownList DropDownList
                    Furniture_case_DropDownList.Items.Clear();
                    Furniture_case_DropDownList.Items.Add(new ListItem("مفروش", "1"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("نصف مفروش", "2"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("غير مفروش", "3"));
                    Furniture_case_DropDownList.Items.Add(new ListItem("غير محدد", "4"));
                    Furniture_case_DropDownList.Items[3].Attributes["disabled"] = "disabled";
                    Furniture_case_DropDownList.Items.Insert(0, "...............");

                    //_sqlCon.Close();

                    lbl_Add_New_Unit.Text = Dt.Rows[88]["AR"].ToString();
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
                    lbl_Building_Name.Text = Dt.Rows[59]["AR"].ToString();
                    lbl_Unit_NO.Text = Dt.Rows[86]["AR"].ToString();
                    lbl_Floor_NO.Text = Dt.Rows[87]["AR"].ToString();
                    lbl_Building_NO.Text = Dt.Rows[67]["AR"].ToString();
                    lbl_Street_No.Text = Dt.Rows[48]["AR"].ToString();
                    lbl_Zone_No.Text = Dt.Rows[36]["AR"].ToString();
                    lbl_Image_One.Text = "صورة أولى";
                    lbl_Image_Two.Text = "صورة ثانية ";
                    lbl_Image_Three.Text = "صورة ثالثة";
                    lbl_Image_Four.Text = "صورة رابعة";
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