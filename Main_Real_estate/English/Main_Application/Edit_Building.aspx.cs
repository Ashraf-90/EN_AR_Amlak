using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Edit_Building : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "properties", 0, "R");
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "properties", 2, "E");
                Utilities.Roles.Delete_permission_With_Reason(_sqlCon, Session["Role"].ToString(), "properties", Delete_Building, Delete_Reason);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_Building_Photo);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_Plan);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_Statement);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_Maps);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_Permit);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_certificate_of_completion);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_Entrance_picture);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "properties", Remove_Link_Image);
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();
                // Fill Year &Mounth  DropDownList
                int year = DateTime.Now.Year; int Mounth = DateTime.Now.Month;
                for (int i = year - 50; i <= year + 10; i++)
                {
                    ListItem li = new ListItem(i.ToString());
                    Construction_Completion_Date_DropDownList.Items.Add(li);
                }
                Construction_Completion_Date_DropDownList.Items.FindByText(year.ToString()).Selected = true;
              

                string buildingId = Request.QueryString["Id"];
                DataTable getBuildingDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getBuildingCmd =
                    new MySqlCommand("SELECT * FROM building WHERE Building_Id = @ID", _sqlCon);
                MySqlDataAdapter getBuildingDa = new MySqlDataAdapter(getBuildingCmd);
                getBuildingCmd.Parameters.AddWithValue("@ID", buildingId);
                getBuildingDa.Fill(getBuildingDt);
                if (getBuildingDt.Rows.Count > 0)
                {
                    
                    if (Session["Langues"].ToString() == "1")
                    {
                        txt_En_Bilding_Name.Text = getBuildingDt.Rows[0]["Building_English_Name"].ToString();
                        lbl_Name_Of_Building.Text = getBuildingDt.Rows[0]["Building_English_Name"].ToString();
                        txt_Ar_Bilding_Name.Text = getBuildingDt.Rows[0]["Building_Arabic_Name"].ToString();
                    }
                    else
                    {
                        txt_En_Bilding_Name.Text = getBuildingDt.Rows[0]["Building_English_Name"].ToString();
                        lbl_Name_Of_Building.Text = getBuildingDt.Rows[0]["Building_Arabic_Name"].ToString();
                        txt_Ar_Bilding_Name.Text = getBuildingDt.Rows[0]["Building_Arabic_Name"].ToString();
                    }
                        txt_electricity_meter.Text = getBuildingDt.Rows[0]["electricity_meter"].ToString();
                    txt_Water_meter.Text = getBuildingDt.Rows[0]["Water_meter"].ToString();
                    txt_Building_NO.Text = getBuildingDt.Rows[0]["Building_NO"].ToString();
                    txt_Construction_Area.Text = getBuildingDt.Rows[0]["Construction_Area"].ToString();
                    txt_Maintenance_status.Text = getBuildingDt.Rows[0]["Maintenance_status"].ToString();
                    txt_Building_Value.Text = getBuildingDt.Rows[0]["Building_Value"].ToString();
                    Construction_Completion_Date_DropDownList.SelectedItem.Text= getBuildingDt.Rows[0]["Construction_Completion_Date"].ToString();

                    Building_Condition_DropDownList.SelectedValue = getBuildingDt.Rows[0]["building_condition_Building_Condition_Id"].ToString();
                    Building_Type_DropDownList.SelectedValue =getBuildingDt.Rows[0]["building_type_Building_Type_Id"].ToString();
                    ownership_Name_DropDownList.SelectedValue =getBuildingDt.Rows[0]["owner_ship_Owner_Ship_Id"].ToString();

                    Building_Photo.Text = getBuildingDt.Rows[0]["Building_Photo"].ToString();
                    Building_Photo_Path.Text = getBuildingDt.Rows[0]["Building_Photo_Path"].ToString();
                    Plan.Text = getBuildingDt.Rows[0]["Plan"].ToString();
                    Plan_Path.Text = getBuildingDt.Rows[0]["Plano_Path"].ToString();
                    Statement.Text = getBuildingDt.Rows[0]["Statement"].ToString();
                    Statement_Path.Text = getBuildingDt.Rows[0]["Statement_Path"].ToString();
                    Maps.Text = getBuildingDt.Rows[0]["Map"].ToString();
                    Maps_Path.Text = getBuildingDt.Rows[0]["Map_path"].ToString();
                    Building_Permit.Text = getBuildingDt.Rows[0]["Building_Permit"].ToString();
                    Building_Permit_Path.Text = getBuildingDt.Rows[0]["Building_Permit_Path"].ToString();
                    certificate_of_completion.Text = getBuildingDt.Rows[0]["certificate_of_completion"].ToString();
                    certificate_of_completion_Path.Text =  getBuildingDt.Rows[0]["certificate_of_completion_Path"].ToString();
                    Entrance_picture.Text = getBuildingDt.Rows[0]["Entrance_Photo"].ToString();
                    Entrance_picture_Path.Text = getBuildingDt.Rows[0]["Entrance_Photo_Path"].ToString();
                    Image.Text = getBuildingDt.Rows[0]["Image"].ToString();
                    Image_Path.Text = getBuildingDt.Rows[0]["Image_Path"].ToString();







                    if (getBuildingDt.Rows[0]["Building_Photo"].ToString() != "No File") { Building_Photo_Div.Visible = true; }
                    else { Building_Photo_Div.Visible = false; }

                    if (getBuildingDt.Rows[0]["Plan"].ToString() != "No File") { Plan_Div.Visible = true; }
                    else { Plan_Div.Visible = false; }

                    if (getBuildingDt.Rows[0]["Statement"].ToString() != "No File") { Statement_Div.Visible = true; }
                    else { Statement_Div.Visible = false; }

                    if (getBuildingDt.Rows[0]["Map"].ToString() != "No File") { Maps_Div.Visible = true; }
                    else { Maps_Div.Visible = false; }

                    if (getBuildingDt.Rows[0]["Building_Permit"].ToString() != "No File") { Permit_Div.Visible = true; }
                    else { Permit_Div.Visible = false; }

                    if (getBuildingDt.Rows[0]["certificate_of_completion"].ToString() != "No File") { certificate_of_completion_Div.Visible = true; }
                    else { certificate_of_completion_Div.Visible = false; }

                    if (getBuildingDt.Rows[0]["Entrance_Photo"].ToString() != "No File") { Entrance_picture_Div.Visible = true; }
                    else { Entrance_picture_Div.Visible = false; }

                    if (getBuildingDt.Rows[0]["Image"].ToString() != "No File") { Image_Div.Visible = true; }
                    else { Image_Div.Visible = false; }


                    lbl_Link_Building_Photo.Text = getBuildingDt.Rows[0]["Building_Photo"].ToString();
                    Link_Building_Photo.HRef = getBuildingDt.Rows[0]["Building_Photo_Path"].ToString();
                    Link_Building_Photo.Target = "_blank";


                    lbl_Link_Plan.Text = getBuildingDt.Rows[0]["Plan"].ToString();
                    Link_Plan.HRef = getBuildingDt.Rows[0]["Plano_Path"].ToString();
                    Link_Plan.Target = "_blank";

                    lbl_Link_Statement.Text = getBuildingDt.Rows[0]["Statement"].ToString();
                    Link_Statement.HRef = getBuildingDt.Rows[0]["Statement_Path"].ToString();
                    Link_Statement.Target = "_blank";


                    lbl_Link_Maps.Text = getBuildingDt.Rows[0]["Map"].ToString();
                    Link_Maps.HRef = getBuildingDt.Rows[0]["Map_path"].ToString();
                    Link_Maps.Target = "_blank";


                    lbl_Link_Permit.Text = getBuildingDt.Rows[0]["Building_Permit"].ToString();
                    Link_Permit.HRef = getBuildingDt.Rows[0]["Building_Permit_Path"].ToString();
                    Link_Permit.Target = "_blank";

                    lbl_Link_certificate_of_completion.Text = getBuildingDt.Rows[0]["certificate_of_completion"].ToString();
                    Link_certificate_of_completion.HRef = getBuildingDt.Rows[0]["certificate_of_completion_Path"].ToString();
                    Link_certificate_of_completion.Target = "_blank";

                    lbl_Link_Entrance_picture.Text = getBuildingDt.Rows[0]["Entrance_Photo"].ToString();
                    Link_Entrance_picture.HRef = getBuildingDt.Rows[0]["Entrance_Photo_Path"].ToString();
                    Link_Entrance_picture.Target = "_blank";


                    lbl_Link_Image.Text = getBuildingDt.Rows[0]["Image"].ToString();
                    Link_Imagee.HRef = getBuildingDt.Rows[0]["Image_Path"].ToString();
                    Link_Imagee.Target = "_blank";
                }
                _sqlCon.Close();

                Zone_Street();

                if (Session["Langues"].ToString() == "1")
                {
                    if (Session["B_Back"].ToString() == "1")
                    {
                        btn_Back_To_Building.Text = "Back To Building List";
                    }
                    
                    else if (Session["B_Back"].ToString() == "3")
                    {
                        btn_Back_To_Building.Text = "Back To Missing Fields";
                    }
                    else
                    {
                        btn_Back_To_Building.Text = "Back To Building List";
                    }
                }
                else
                {
                    if (Session["B_Back"].ToString() == "1")
                    {
                        btn_Back_To_Building.Text = "العودة لقائمة الأبنية";
                    }
                   
                    else if (Session["B_Back"].ToString() == "3")
                    {
                        btn_Back_To_Building.Text = "العودة لكشف النواقص";
                    }
                    else
                    {
                        btn_Back_To_Building.Text = "العودة لقائمة الأبنية";
                    }
                }
                    
            }
        }

        protected void btn_Add_Building_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string buildingId = Request.QueryString["ID"];
                _sqlCon.Open();
                MySqlCommand cmd = new MySqlCommand("Edit_Building", _sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", buildingId);
                cmd.Parameters.AddWithValue("@Building_English_Name", txt_En_Bilding_Name.Text);
                cmd.Parameters.AddWithValue("@Building_Arabic_Name", txt_Ar_Bilding_Name.Text);
                cmd.Parameters.AddWithValue("@electricity_meter", txt_electricity_meter.Text);
                cmd.Parameters.AddWithValue("@Water_meter", txt_Water_meter.Text);
                cmd.Parameters.AddWithValue("@Building_NO", txt_Building_NO.Text);
                cmd.Parameters.AddWithValue("@Construction_Area", txt_Construction_Area.Text);
                cmd.Parameters.AddWithValue("@Maintenance_status", txt_Maintenance_status.Text);
                cmd.Parameters.AddWithValue("@Building_Value", txt_Building_Value.Text);
                cmd.Parameters.AddWithValue("@Construction_Completion_Date", Construction_Completion_Date_DropDownList.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@owner_ship_Owner_Ship_Id", ownership_Name_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@building_condition_Building_Condition_Id", Building_Condition_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@building_type_Building_Type_Id", Building_Type_DropDownList.SelectedValue);

                if (Building_Photo_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Building_Photo_FileUpload.PostedFile.FileName);
                    Building_Photo_FileUpload.PostedFile.SaveAs(
                        Server.MapPath("/English/Main_Application/Building_File/Building_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Building_Photo", fileName1);
                    cmd.Parameters.AddWithValue("@Building_Photo_Path",
                        "/English/Main_Application/Building_File/Building_Photo/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Building_Photo", Building_Photo.Text);
                    cmd.Parameters.AddWithValue("@Building_Photo_Path", Building_Photo_Path.Text);
                }

                //**********************************************************************************************************************************************************
                if (Statement_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Statement_FileUpload.PostedFile.FileName);
                    Statement_FileUpload.PostedFile.SaveAs(
                        Server.MapPath("/English/Main_Application/Building_File/Statement/") + fileName1);
                    cmd.Parameters.AddWithValue("@Statement", fileName1);
                    cmd.Parameters.AddWithValue("@Statement_Path",
                        "/English/Main_Application/Building_File/Statement/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Statement", Statement.Text);
                    cmd.Parameters.AddWithValue("@Statement_Path", Statement_Path.Text);
                }

                //**********************************************************************************************************************************************************
                if (Building_Permit_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Building_Permit_FileUpload.PostedFile.FileName);
                    Building_Permit_FileUpload.PostedFile.SaveAs(
                        Server.MapPath("/English/Main_Application/Building_File/Building_Permit/") + fileName1);
                    cmd.Parameters.AddWithValue("@Building_Permit", fileName1);
                    cmd.Parameters.AddWithValue("@Building_Permit_Path",
                        "/English/Main_Application/Building_File/Building_Permit/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Building_Permit", Building_Permit.Text);
                    cmd.Parameters.AddWithValue("@Building_Permit_Path", Building_Permit_Path.Text);
                }

                //**********************************************************************************************************************************************************
                if (certificate_of_completion_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(certificate_of_completion_FileUpload.PostedFile.FileName);
                    certificate_of_completion_FileUpload.PostedFile.SaveAs(
                        Server.MapPath("/English/Main_Application/Building_File/certificate_completion/") + fileName1);
                    cmd.Parameters.AddWithValue("@certificate_of_completion", fileName1);
                    cmd.Parameters.AddWithValue("@certificate_of_completion_Path",
                        "/English/Main_Application/Building_File/certificate_completion/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@certificate_of_completion",
                        certificate_of_completion.Text);
                    cmd.Parameters.AddWithValue("@certificate_of_completion_Path",
                        certificate_of_completion_Path.Text);
                }

                //**********************************************************************************************************************************************************
                if (Image_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Image_FileUpload.PostedFile.FileName);
                    Image_FileUpload.PostedFile.SaveAs(
                        Server.MapPath("/English/Main_Application/Building_File/Image/") + fileName1);
                    cmd.Parameters.AddWithValue("@Image", fileName1);
                    cmd.Parameters.AddWithValue("@Image_Path",
                        "/English/Main_Application/Building_File/Image/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Image", Image.Text);
                    cmd.Parameters.AddWithValue("@Image_Path", Image_Path.Text);
                }

                //**********************************************************************************************************************************************************
                if (Maps_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Maps_FileUpload.PostedFile.FileName);
                    Maps_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Building_File/Map/") +
                                                      fileName1);
                    cmd.Parameters.AddWithValue("@Map", fileName1);
                    cmd.Parameters.AddWithValue("@Map_Path",
                        "/English/Main_Application/Building_File/Map/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Map", Maps.Text);
                    cmd.Parameters.AddWithValue("@Map_Path", Maps_Path.Text);
                }

                //**********************************************************************************************************************************************************
                if (Plan_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Plan_FileUpload.PostedFile.FileName);
                    Plan_FileUpload.PostedFile.SaveAs(
                        Server.MapPath("/English/Main_Application/Building_File/Building_Plan/") + fileName1);
                    cmd.Parameters.AddWithValue("@Plan", fileName1);
                    cmd.Parameters.AddWithValue("@Plano_Path",
                        "/English/Main_Application/Building_File/Building_Plan/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Plan", Plan.Text);
                    cmd.Parameters.AddWithValue("@Plano_Path", Plan_Path.Text);
                }

                //**********************************************************************************************************************************************************
                if (Entrance_picture_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Entrance_picture_FileUpload.PostedFile.FileName);
                    Entrance_picture_FileUpload.PostedFile.SaveAs(
                        Server.MapPath("/English/Main_Application/Building_File/Entrace_Photo/") + fileName1);
                    cmd.Parameters.AddWithValue("@Entrance_Photo", fileName1);
                    cmd.Parameters.AddWithValue("@Entrance_Photo_Path",
                        "/English/Main_Application/Building_File/Entrace_Photo/" + fileName1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Entrance_Photo", Entrance_picture.Text);
                    cmd.Parameters.AddWithValue("@Entrance_Photo_Path", Entrance_picture_Path.Text);
                }

                cmd.ExecuteNonQuery();
                _sqlCon.Close();
                if (Session["Langues"].ToString() == "1"){ lbl_Success_Add_Building.Text = "Edit Successfully"; }
                else { lbl_Success_Add_Building.Text = "تم التعديل بنجاح"; }
                
            }
        }

        protected void btn_Back_To_Building_Click(object sender, EventArgs e)
        {
            if (Session["B_Back"].ToString() == "1")
            {
                Response.Redirect("Building_List.aspx");
            }
            else if (Session["B_Back"].ToString() == "2")
            {
                Response.Redirect("Test_4.aspx?Id=2");
            }
            else if (Session["B_Back"].ToString() == "3")
            {
                Response.Redirect("Missing_Fields.aspx");
            }
            else
            {
                Response.Redirect("Building_List.aspx");
            }
            
        }

        protected void Btn_Remove_Link_Image_Click(object sender, EventArgs e)
        {
            string Building_Id = Request.QueryString["ID"];

            string Remove_Building_Att_Query = "UPDATE building SET " +
                                                " Image=@Image ," +
                                                " Image_Path=@Image_Path  " +
                                                "WHERE Building_Id=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Building_Att_Cmd = new MySqlCommand(Remove_Building_Att_Query, _sqlCon);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@ID", Building_Id);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Image", "No File");
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Image_Path", "No File");
            Remove_Building_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Building.aspx?Id=" + Building_Id);
        }

        protected void Btn_Remove_Link_Entrance_picture_Click(object sender, EventArgs e)
        {
            string Building_Id = Request.QueryString["ID"];

            string Remove_Building_Att_Query = "UPDATE building SET " +
                                                " Entrance_Photo=@Entrance_Photo ," +
                                                " Entrance_Photo_Path=@Entrance_Photo_Path  " +
                                                "WHERE Building_Id=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Building_Att_Cmd = new MySqlCommand(Remove_Building_Att_Query, _sqlCon);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@ID", Building_Id);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Entrance_Photo", "No File");
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Entrance_Photo_Path", "No File");
            Remove_Building_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Building.aspx?Id=" + Building_Id);
        }

        protected void Btn_Remove_Link_certificate_of_completion_Click(object sender, EventArgs e)
        {
            string Building_Id = Request.QueryString["ID"];

            string Remove_Building_Att_Query = "UPDATE building SET " +
                                                " certificate_of_completion=@certificate_of_completion ," +
                                                " certificate_of_completion_Path=@certificate_of_completion_Path  " +
                                                "WHERE Building_Id=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Building_Att_Cmd = new MySqlCommand(Remove_Building_Att_Query, _sqlCon);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@ID", Building_Id);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@certificate_of_completion", "No File");
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@certificate_of_completion_Path", "No File");
            Remove_Building_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Building.aspx?Id=" + Building_Id);
        }

        protected void Btn_Remove_Link_Permit_Click(object sender, EventArgs e)
        {
            string Building_Id = Request.QueryString["ID"];

            string Remove_Building_Att_Query = "UPDATE building SET " +
                                                " Building_Permit=@Building_Permit ," +
                                                " Building_Permit_Path=@Building_Permit_Path  " +
                                                "WHERE Building_Id=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Building_Att_Cmd = new MySqlCommand(Remove_Building_Att_Query, _sqlCon);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@ID", Building_Id);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Building_Permit", "No File");
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Building_Permit_Path", "No File");
            Remove_Building_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Building.aspx?Id=" + Building_Id);
        }

        protected void Btn_Remove_Link_Maps_Click(object sender, EventArgs e)
        {
            string Building_Id = Request.QueryString["ID"];

            string Remove_Building_Att_Query = "UPDATE building SET " +
                                                " Map=@Map ," +
                                                " Map_path=@Map_path  " +
                                                "WHERE Building_Id=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Building_Att_Cmd = new MySqlCommand(Remove_Building_Att_Query, _sqlCon);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@ID", Building_Id);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Map", "No File");
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Map_path", "No File");
            Remove_Building_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Building.aspx?Id=" + Building_Id);
        }

        protected void Btn_Remove_Link_Statement_Click(object sender, EventArgs e)
        {
            string Building_Id = Request.QueryString["ID"];

            string Remove_Building_Att_Query = "UPDATE building SET " +
                                                " Statement=@Statement ," +
                                                " Statement_Path=@Statement_Path  " +
                                                "WHERE Building_Id=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Building_Att_Cmd = new MySqlCommand(Remove_Building_Att_Query, _sqlCon);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@ID", Building_Id);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Statement", "No File");
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Statement_Path", "No File");
            Remove_Building_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Building.aspx?Id=" + Building_Id);
        }

        protected void Btn_Remove_Link_Plan_Click(object sender, EventArgs e)
        {
            string Building_Id = Request.QueryString["ID"];

            string Remove_Building_Att_Query = "UPDATE building SET " +
                                                " Plan=@Plan ," +
                                                " Plano_Path=@Plano_Path  " +
                                                "WHERE Building_Id=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Building_Att_Cmd = new MySqlCommand(Remove_Building_Att_Query, _sqlCon);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@ID", Building_Id);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Plan", "No File");
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Plano_Path", "No File");
            Remove_Building_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Building.aspx?Id=" + Building_Id);
        }

        protected void Btn_Remove_Link_Building_Photo_Click(object sender, EventArgs e)
        {
            string Building_Id = Request.QueryString["ID"];

            string Remove_Building_Att_Query = "UPDATE building SET " +
                                                " Building_Photo=@Building_Photo ," +
                                                " Building_Photo_Path=@Building_Photo_Path  " +
                                                "WHERE Building_Id=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Building_Att_Cmd = new MySqlCommand(Remove_Building_Att_Query, _sqlCon);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@ID", Building_Id);
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Building_Photo", "No File");
            Remove_Building_Att_Cmd.Parameters.AddWithValue("@Building_Photo_Path", "No File");
            Remove_Building_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Building.aspx?Id=" + Building_Id);
        }

        protected void btn_Back_To_B_Lists_Click(object sender, EventArgs e)
        {
            Response.Redirect("lists.aspx");
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
                ownershipDetailsCmd.Parameters.AddWithValue("@Id", ownership_Name_DropDownList.SelectedValue);
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

        protected void Delete_Building_Click(object sender, EventArgs e)
        {
            string BuildingId = Request.QueryString["ID"];

            try
            {
                _sqlCon.Open();
                string deleteBuildingQuary = "DELETE FROM building WHERE Building_Id=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(deleteBuildingQuary, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", BuildingId);
                mySqlCmd.ExecuteNonQuery();



                string addArciveBuildingQuary = "Insert Into delete_archive " +
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
                MySqlCommand addArciveBuildingCmd = new MySqlCommand(addArciveBuildingQuary, _sqlCon);
                addArciveBuildingCmd.Parameters.AddWithValue("@User_Id", Session["user_ID"].ToString());
                addArciveBuildingCmd.Parameters.AddWithValue("@Delete_Date", DateTime.Now.ToString("dd/MM/yyyy"));
                addArciveBuildingCmd.Parameters.AddWithValue("@OS_B_U", "B");
                addArciveBuildingCmd.Parameters.AddWithValue("@Item_Id", BuildingId);
                addArciveBuildingCmd.Parameters.AddWithValue("@Reason_Delete", txt_Reason_Delete.Text);
                addArciveBuildingCmd.ExecuteNonQuery();


                Response.Redirect("Building_List.aspx");
            }
            catch
            {
                Response.Write(@"<script language='javascript'>alert('لا يمكن حذف هذه البناء لأنه يحتوي على  وحدات أو عقود ')</script>");
            };
            _sqlCon.Close();
        }




        




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
                    //************************************************* Building Labels ************************************************

                    //Get Building_Condition DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building_condition", _sqlCon, Building_Condition_DropDownList, "Building_English_Condition", "Building_Condition_Id");
                    Building_Condition_DropDownList.Items.Insert(0, "...............");

                    //Get Building_Type  DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building_type", _sqlCon, Building_Type_DropDownList, "Building_English_Type", "Building_Type_Id");
                    Building_Type_DropDownList.Items.Insert(0, "...............");

                    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, ownership_Name_DropDownList, "Owner_Ship_EN_Name", "Owner_Ship_Id");
                    ownership_Name_DropDownList.Items.Insert(0, "...............");


                    lbl_Add_New_Building.Text = Dt.Rows[99]["EN"].ToString();
                    lbl_Ar_Bildingp_Name.Text = Dt.Rows[59]["EN"].ToString() + "(Ar)";
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
                    lbl_Zone_No.Text = Dt.Rows[36]["EN"].ToString();
                    lbl_Street_No.Text = Dt.Rows[48]["EN"].ToString();
                    lbl_Building_Photo.Text = Dt.Rows[68]["EN"].ToString();
                    lbl_Plan.Text = Dt.Rows[69]["EN"].ToString();
                    lbl_Statement.Text = Dt.Rows[70]["EN"].ToString();
                    lbl_Maps.Text = Dt.Rows[71]["EN"].ToString();
                    lbl_Building_Permit.Text = Dt.Rows[72]["EN"].ToString();
                    lbl_certificate_of_completion.Text = Dt.Rows[73]["EN"].ToString();
                    lbl_Entrance_picture.Text = Dt.Rows[74]["EN"].ToString();
                    lbl_Image.Text = "Another image";
                    lbl_Reason_Delete.Text = "Reason Of Delete";
                    lbl_Building_Att.Text = "Building Attachments";
                    btn_Add_Building.Text = Dt.Rows[99]["EN"].ToString();
                    btn_Back_To_Building.Text = Dt.Rows[78]["EN"].ToString();


                    Reg_Exp_En_Bilding_Name.ErrorMessage = Dt.Rows[56]["EN"].ToString();
                    Reg_Ex_Ar_Bilding_Name.ErrorMessage = Dt.Rows[57]["EN"].ToString();
                    Reg_Exp_Building_Value.ErrorMessage = Dt.Rows[58]["EN"].ToString();
                    Delete_ReqFieVal.ErrorMessage = "The reason for the deletion must be explained";

                    Req_Val_Ar_Bilding_Name.ErrorMessage = "* Required ";
                    Req_Val_En_Bilding_Name.ErrorMessage = "* Required ";
                    Building_Condition_Req_Val.ErrorMessage = "* Required ";
                    Building_Type_Req_Val.ErrorMessage = "* Required ";
                    Building_Value_Req_Field_Val.ErrorMessage = "* Required ";
                    ownership_Name_Req_Val.ErrorMessage = "* Required ";
                }
                else
                {

                    //************************************************* Building Labels ************************************************

                    //Get Building_Condition DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building_condition", _sqlCon, Building_Condition_DropDownList, "Building_Arabic_Condition", "Building_Condition_Id");
                    Building_Condition_DropDownList.Items.Insert(0, "...............");

                    //Get Building_Type  DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building_type", _sqlCon, Building_Type_DropDownList, "Building_Arabic_Type", "Building_Type_Id");
                    Building_Type_DropDownList.Items.Insert(0, "...............");

                    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, ownership_Name_DropDownList, "Owner_Ship_AR_Name", "Owner_Ship_Id");
                    ownership_Name_DropDownList.Items.Insert(0, "...............");

                    lbl_Add_New_Building.Text = Dt.Rows[99]["AR"].ToString();
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
                    lbl_Zone_No.Text = Dt.Rows[36]["AR"].ToString();
                    lbl_Street_No.Text = Dt.Rows[48]["AR"].ToString();
                    lbl_Building_Photo.Text = Dt.Rows[68]["AR"].ToString();
                    lbl_Plan.Text = Dt.Rows[69]["AR"].ToString();
                    lbl_Statement.Text = Dt.Rows[70]["AR"].ToString();
                    lbl_Maps.Text = Dt.Rows[71]["AR"].ToString();
                    lbl_Building_Permit.Text = Dt.Rows[72]["AR"].ToString();
                    lbl_certificate_of_completion.Text = Dt.Rows[73]["AR"].ToString();
                    lbl_Entrance_picture.Text = Dt.Rows[74]["AR"].ToString();
                    lbl_Image.Text = "Another image";
                    lbl_Building_Att.Text = "مرفقات البناء";
                    lbl_Reason_Delete.Text = "سبب الحذف";
                    btn_Add_Building.Text = Dt.Rows[99]["AR"].ToString();
                    btn_Back_To_Building.Text = Dt.Rows[78]["AR"].ToString();

                    Reg_Exp_En_Bilding_Name.ErrorMessage = Dt.Rows[56]["AR"].ToString();
                    Reg_Ex_Ar_Bilding_Name.ErrorMessage = Dt.Rows[57]["AR"].ToString();
                    Reg_Exp_Building_Value.ErrorMessage = Dt.Rows[58]["AR"].ToString();
                    Delete_ReqFieVal.ErrorMessage = "يجب توضيح سبب الحذف";

                    Req_Val_Ar_Bilding_Name.ErrorMessage = "* حقل مطلوب ";
                    Req_Val_En_Bilding_Name.ErrorMessage = "* حقل مطلوب ";
                    Building_Condition_Req_Val.ErrorMessage = "* حقل مطلوب ";
                    Building_Type_Req_Val.ErrorMessage = "* حقل مطلوب ";
                    Building_Value_Req_Field_Val.ErrorMessage = "* حقل مطلوب ";
                    ownership_Name_Req_Val.ErrorMessage = "* حقل مطلوب ";
                }
            }
            _sqlCon.Close();
        }
    }
}