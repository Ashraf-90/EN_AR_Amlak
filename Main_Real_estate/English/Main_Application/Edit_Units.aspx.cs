using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Units_List : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "properties", 0, "R");
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "properties", 2, "E");
                Utilities.Roles.Delete_permission_With_Reason(_sqlCon, Session["Role"].ToString(), "properties", Delete_Unit, Delete_Reason);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_Image_One);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_Image_Two);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_Image_Three);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_Image_Four);
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();
                
                string unitId = Request.QueryString["Id"];
                DataTable getUnitDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getUnitCmd = new MySqlCommand("SELECT * FROM units WHERE Unit_ID = @ID", _sqlCon);
                MySqlDataAdapter getUnitDa = new MySqlDataAdapter(getUnitCmd);
                getUnitCmd.Parameters.AddWithValue("@ID", unitId);
                getUnitDa.Fill(getUnitDt);
                if (getUnitDt.Rows.Count > 0)
                {
                    txt_Unit_NO.Text = getUnitDt.Rows[0]["Unit_Number"].ToString();
                    txt_Floor_NO.Text = getUnitDt.Rows[0]["Floor_Number"].ToString();
                    txt_Unit_Space.Text = getUnitDt.Rows[0]["Unit_Space"].ToString();
                    txt_current_situation.Text = getUnitDt.Rows[0]["current_situation"].ToString();
                    txt_Oreedo_Number.Text = getUnitDt.Rows[0]["Oreedo_Number"].ToString();
                    txt_Electricityt_Number.Text = getUnitDt.Rows[0]["Electricityt_Number"].ToString();
                    txt_Water_Number.Text = getUnitDt.Rows[0]["Water_Number"].ToString();
                    txt_virtual_Value.Text = getUnitDt.Rows[0]["virtual_Value"].ToString();
                    Furniture_case_DropDownList.SelectedValue = getUnitDt.Rows[0]["furniture_case_Furniture_case_Id"].ToString();
                    lbl_Name_Of_Unit.Text = getUnitDt.Rows[0]["Unit_Number"].ToString();

                    Image_One.Text = getUnitDt.Rows[0]["Image_One"].ToString();
                    Image_One_Pathe.Text = getUnitDt.Rows[0]["Image_One_Path"].ToString();

                    Image_Two.Text = getUnitDt.Rows[0]["Image_Two"].ToString();
                    Image_Two_Pathe.Text = getUnitDt.Rows[0]["Image_Two_Path"].ToString();

                    Image_Three.Text = getUnitDt.Rows[0]["Image_Three"].ToString();
                    Image_Three_Pathe.Text = getUnitDt.Rows[0]["Image_Three_Path"].ToString();

                    Image_Four.Text = getUnitDt.Rows[0]["Image_Four"].ToString();
                    Image_Four_Pathe.Text = getUnitDt.Rows[0]["Image_Four_Path"].ToString();

                    Unit_Condition_DropDownList.SelectedValue =
                        getUnitDt.Rows[0]["unit_condition_Unit_Condition_Id"].ToString();
                    Unit_Detail_DropDownList.SelectedValue =
                        getUnitDt.Rows[0]["unit_detail_Unit_Detail_Id"].ToString();
                    Unit_Type_DropDownList.SelectedValue = getUnitDt.Rows[0]["unit_type_Unit_Type_Id"].ToString();
                    Building_Name_DropDownList.SelectedValue = getUnitDt.Rows[0]["building_Building_Id"].ToString();

                    if (
                        getUnitDt.Rows[0]["unit_type_Unit_Type_Id"].ToString() == "1" ||
                        getUnitDt.Rows[0]["unit_type_Unit_Type_Id"].ToString() == "4" ||
                        getUnitDt.Rows[0]["unit_type_Unit_Type_Id"].ToString() == "5" ||
                        getUnitDt.Rows[0]["unit_type_Unit_Type_Id"].ToString() == "6" ||
                        getUnitDt.Rows[0]["unit_type_Unit_Type_Id"].ToString() == "8" ||
                        getUnitDt.Rows[0]["unit_type_Unit_Type_Id"].ToString() == "10"
                    )
                    {
                        div_Furniture_case.Visible = true;
                    }
                    else
                    {
                        div_Furniture_case.Visible = false;
                    }
                }



                if (getUnitDt.Rows[0]["Image_One"].ToString() != "No File") { Image_One_Div.Visible = true; }
                else { Image_One_Div.Visible = false; }

                if (getUnitDt.Rows[0]["Image_Two"].ToString() != "No File") { Image_Two_Div.Visible = true; }
                else { Image_Two_Div.Visible = false; }

                if (getUnitDt.Rows[0]["Image_Three"].ToString() != "No File") { Image_Three_Div.Visible = true; }
                else { Image_Three_Div.Visible = false; }

                if (getUnitDt.Rows[0]["Image_Four"].ToString() != "No File") { Image_Four_Div.Visible = true; }
                else { Image_Four_Div.Visible = false; }



                lbl_Link_Image_One.Text = getUnitDt.Rows[0]["Image_One"].ToString();
                Link_Image_One.HRef = getUnitDt.Rows[0]["Image_One_Path"].ToString();
                Link_Image_One.Target = "_blank";


                lbl_Link_Image_Two.Text = getUnitDt.Rows[0]["Image_Two"].ToString();
                Link_Image_Two.HRef = getUnitDt.Rows[0]["Image_Two_Path"].ToString();
                Link_Image_Two.Target = "_blank";

                lbl_Link_Image_Three.Text = getUnitDt.Rows[0]["Image_Three"].ToString();
                Link_Image_Three.HRef = getUnitDt.Rows[0]["Image_Three_Path"].ToString();
                Link_Image_Three.Target = "_blank";


                lbl_Link_Image_Four.Text = getUnitDt.Rows[0]["Image_Four"].ToString();
                Link_Image_Four.HRef = getUnitDt.Rows[0]["Image_Four_path"].ToString();
                Link_Image_Four.Target = "_blank";



                _sqlCon.Close();

                //Zone_Sterrt_BuildingNO();

                if (Session["Langues"].ToString() == "1")
                {
                    if (Session["U_Back"].ToString() == "1")
                    {
                        btn_Back_To_Unit.Text = "Back To Units List";
                    }
                    else if (Session["U_Back"].ToString() == "3")
                    {
                        btn_Back_To_Unit.Text = "Back To Missing Fields List";
                    }
                    else
                    {
                        btn_Back_To_Unit.Text = "Back To Units List";
                    }
                }
                else
                {
                    if (Session["U_Back"].ToString() == "1")
                    {
                        btn_Back_To_Unit.Text = "العودة لقائمة الوحدات";
                    }
                    else if (Session["U_Back"].ToString() == "3")
                    {
                        btn_Back_To_Unit.Text = "العودة لكشف النواقص";
                    }
                    else
                    {
                        btn_Back_To_Unit.Text = "العودة لقائمة الوحدات";
                    }
                }

                Zone_Sterrt_BuildingNO();
            }
        }

        protected void btn_Back_To_Unit_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Units_List.aspx");
        }

        protected void btn_Add_Unit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string unitId = Request.QueryString["ID"];
                _sqlCon.Open();
                MySqlCommand cmd = new MySqlCommand("Edit_Unit", _sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ID", unitId);
                //Fill The Database with All DropDownLists Items
                cmd.Parameters.AddWithValue("@Unit_Number", txt_Unit_NO.Text);
                cmd.Parameters.AddWithValue("@Floor_Number", txt_Floor_NO.Text);
                cmd.Parameters.AddWithValue("@Unit_Space", txt_Unit_Space.Text);
                cmd.Parameters.AddWithValue("@current_situation", txt_current_situation.Text);
                cmd.Parameters.AddWithValue("@Oreedo_Number", txt_Oreedo_Number.Text);
                cmd.Parameters.AddWithValue("@Electricityt_Number", txt_Electricityt_Number.Text);
                cmd.Parameters.AddWithValue("@Water_Number", txt_Water_Number.Text);
                cmd.Parameters.AddWithValue("@virtual_Value", txt_virtual_Value.Text);

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
                cmd.Parameters.AddWithValue("@unit_detail_Unit_Detail_Id",  Unit_Detail_DropDownList.SelectedValue);
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
                    cmd.Parameters.AddWithValue("@Image_One", Image_One.Text);
                    cmd.Parameters.AddWithValue("@Image_One_Path", Image_One_Pathe.Text);
                }

                //**********************************************************************************************************************************************************
                if (Image_Two_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Image_Two_FileUpload.PostedFile.FileName);
                    Image_Two_FileUpload.PostedFile.SaveAs( Server.MapPath("/English/Main_Application/units_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Image_Two", fileName1);
                    cmd.Parameters.AddWithValue("@Image_Two_Path", "/English/Main_Application/units_Photo/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Image_Two", Image_Two.Text);
                    cmd.Parameters.AddWithValue("@Image_Two_Path", Image_Two_Pathe.Text);
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
                    cmd.Parameters.AddWithValue("@Image_Three", Image_Three.Text);
                    cmd.Parameters.AddWithValue("@Image_Three_Path", Image_Three_Pathe.Text);
                }

                //**********************************************************************************************************************************************************
                if (Image_Four_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Image_Four_FileUpload.PostedFile.FileName);
                    Image_Four_FileUpload.PostedFile.SaveAs( Server.MapPath("/English/Main_Application/units_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Image_Four", fileName1);
                    cmd.Parameters.AddWithValue("@Image_Four_Path","/English/Main_Application/units_Photo/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Image_Four", Image_Four.Text);
                    cmd.Parameters.AddWithValue("@Image_Four_Path", Image_Four_Pathe.Text);
                }


                cmd.ExecuteNonQuery();
                _sqlCon.Close();

                if (Session["Langues"].ToString() == "1") { lbl_Success_Edit_New_Unit.Text = "Unit Edited successfully"; }
                else { lbl_Success_Edit_New_Unit.Text = "تم التعديل بنجاح"; }
            }
        }

        protected void btn_Back_To_Unit_Click(object sender, EventArgs e)
        
        {
            if (Session["U_Back"].ToString() == "1")
            {
                Response.Redirect("Units_List.aspx");
            }
            else if (Session["U_Back"].ToString() == "2")
            {
                Response.Redirect("Test_4.aspx?Id=2");
            }
            else if (Session["U_Back"].ToString() == "3")
            {
                Response.Redirect("Missing_Fields.aspx");
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
            else
            {
                div_Furniture_case.Visible = false;
            }
        }

        protected void Btn_Remove_Link_Image_One_Click(object sender, EventArgs e)
        {
            string Uint_Id = Request.QueryString["ID"];

            string Remove_Unit_Att_Query = "UPDATE units SET " +
                                            " Image_One=@Image_One ," +
                                            " Image_One_Path=@Image_One_Path  " +
                                            "WHERE Unit_ID=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Unit_Att_Cmd = new MySqlCommand(Remove_Unit_Att_Query, _sqlCon);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@ID", Uint_Id);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_One", "No File");
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_One_Path", "No File");
            Remove_Unit_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Units.aspx?Id=" + Uint_Id);
        }

        protected void Btn_Remove_Link_Image_Two_Click(object sender, EventArgs e)
        {
            string Uint_Id = Request.QueryString["ID"];

            string Remove_Unit_Att_Query = "UPDATE units SET " +
                                            " Image_Two=@Image_Two ," +
                                            " Image_Two_Path=@Image_Two_Path  " +
                                            "WHERE Unit_ID=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Unit_Att_Cmd = new MySqlCommand(Remove_Unit_Att_Query, _sqlCon);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@ID", Uint_Id);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_Two", "No File");
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_Two_Path", "No File");
            Remove_Unit_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Units.aspx?Id=" + Uint_Id);
        }

        protected void Btn_Remove_Link_Image_Three_Click(object sender, EventArgs e)
        {
            string Uint_Id = Request.QueryString["ID"];

            string Remove_Unit_Att_Query = "UPDATE units SET " +
                                            " Image_Three=@Image_Three ," +
                                            " Image_Three_Path=@Image_Three_Path  " +
                                            "WHERE Unit_ID=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Unit_Att_Cmd = new MySqlCommand(Remove_Unit_Att_Query, _sqlCon);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@ID", Uint_Id);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_Three", "No File");
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_Three_Path", "No File");
            Remove_Unit_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Units.aspx?Id=" + Uint_Id);
        }

        protected void Btn_Remove_Link_Image_Four_Click(object sender, EventArgs e)
        {
            string Uint_Id = Request.QueryString["ID"];

            string Remove_Unit_Att_Query = "UPDATE units SET " +
                                            " Image_Four=@Image_Four ," +
                                            " Image_Four_Path=@Image_Four_Path  " +
                                            "WHERE Unit_ID=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Unit_Att_Cmd = new MySqlCommand(Remove_Unit_Att_Query, _sqlCon);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@ID", Uint_Id);
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_Four", "No File");
            Remove_Unit_Att_Cmd.Parameters.AddWithValue("@Image_Four_Path", "No File");
            Remove_Unit_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Units.aspx?Id=" + Uint_Id);
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

        protected void Delete_Unit_Click(object sender, EventArgs e)
        {
            string UnitId = Request.QueryString["ID"];

            try
            {
                _sqlCon.Open();
                string deleteUnitQuary = "DELETE FROM units WHERE Unit_ID=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(deleteUnitQuary, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", UnitId);
                mySqlCmd.ExecuteNonQuery();



                string addArciveUnitQuary = "Insert Into delete_archive " +
                                                            "(User_Id," +
                                                            "Delete_Date," +
                                                            "OS_B_U," +
                                                            "Item_Id," +
                                                            "Reason_Delete) " +
                                                            "VALUES" +
                                                            "(@User_Id," +
                                                            "@Delete_Date," +
                                                            "@OS_B_U," +
                                                            "@Item_Id," +
                                                            "@Reason_Delete)";
                MySqlCommand addArciveUnitCmd = new MySqlCommand(addArciveUnitQuary, _sqlCon);
                addArciveUnitCmd.Parameters.AddWithValue("@User_Id", Session["user_ID"].ToString());
                addArciveUnitCmd.Parameters.AddWithValue("@Delete_Date", DateTime.Now.ToString("dd/MM/yyyy"));
                addArciveUnitCmd.Parameters.AddWithValue("@OS_B_U", "U");
                addArciveUnitCmd.Parameters.AddWithValue("@Item_Id", UnitId);
                addArciveUnitCmd.Parameters.AddWithValue("@Reason_Delete", txt_Reason_Delete.Text);
                addArciveUnitCmd.ExecuteNonQuery();


                Response.Redirect("Units_List.aspx");
            }
            catch
            {
                if (Session["Langues"].ToString() == "1") { Response.Write(@"<script language='javascript'>alert('This Unit Cannot BBe Deleted')</script>"); }
                else { Response.Write(@"<script language='javascript'>alert('لا يمكن حذف هذه الوحدة لأنها تحتوي على عقود ')</script>"); }
                    
            };
            _sqlCon.Close();
        }
        //************************************************************************************************************************************************************
        //********************************************************* language ********************************************************************************
        //************************************************************************************************************************************************************

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

                    lbl_titel_Edit_New_Unit.Text = Dt.Rows[100]["EN"].ToString();
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
                    lbl_Reason_Deletion.Text = "Reason Of Deletion";
                    btn_Add_Unit.Text = Dt.Rows[100]["EN"].ToString();
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
                    Delete_ReqFieVal.ErrorMessage = "* The reason for the deletion must be explained";




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

                    lbl_titel_Edit_New_Unit.Text = Dt.Rows[100]["AR"].ToString();
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
                    lbl_Reason_Deletion.Text = "سبب الحذف";
                    btn_Add_Unit.Text = Dt.Rows[100]["AR"].ToString();
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
                    Delete_ReqFieVal.ErrorMessage = "* يجب توضيح سبب الحذف";


                }
            }
            _sqlCon.Close();
        }
    }
}