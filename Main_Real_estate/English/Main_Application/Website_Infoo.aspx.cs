using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Website_Infoo : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        private string Almanara_Host = System.Configuration.ConfigurationManager.AppSettings["Almanara_Host"];
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Marketing", 0, "R");
                Utilities.Roles.Add_permission(_sqlCon, Session["Role"].ToString(), "Marketing", Add);
                Utilities.Roles.Add_permission(_sqlCon, Session["Role"].ToString(), "Marketing", Add_Info);
                Utilities.Roles.Add_permission(_sqlCon, Session["Role"].ToString(), "Marketing", Add_Servic);
            }
            catch { Response.Redirect("Log_In.aspx"); }
            


            if (!Page.IsPostBack)
            {
                language();
                //***************************************************************************************************************************************
                DataTable get_Website_Dt = new DataTable();
                _sqlCon.Open();
                MySqlCommand get_Website_Cmd = new MySqlCommand("SELECT * FROM websit_info WHERE WebSit_Info_Id > 0", _sqlCon);
                MySqlDataAdapter get_Website_Da = new MySqlDataAdapter(get_Website_Cmd);
                get_Website_Da.Fill(get_Website_Dt);
                if (get_Website_Dt.Rows.Count > 0)
                {
                    txt_Ar_Who_Are_We.Text = get_Website_Dt.Rows[0]["Who_Are_We_Ar"].ToString();
                    txt_En_Who_Are_We.Text = get_Website_Dt.Rows[0]["Who_Are_We_En"].ToString();
                    txt_Ar_Address.Text = get_Website_Dt.Rows[0]["Adress_Ar"].ToString();
                    txt_En_Address.Text = get_Website_Dt.Rows[0]["Adress_En"].ToString();
                    txt_Phone.Text = get_Website_Dt.Rows[0]["Phone"].ToString();
                    txt_Email.Text = get_Website_Dt.Rows[0]["Email"].ToString();
                    txt_FaceBook.Text = get_Website_Dt.Rows[0]["Facebook"].ToString();
                    txt_Whatssapp.Text = get_Website_Dt.Rows[0]["Whatssapp"].ToString();
                }
                _sqlCon.Close();
                //*********************************************************************************************************************************************
                Services_DataBind();
                //*********************************************************************************************************************************************
                refreshdata();
            }





        }


        protected void Services_DataBind()
        {
            DataTable get_Service_Dt = new DataTable();
            _sqlCon.Open();
            MySqlCommand get_Service_Cmd = new MySqlCommand("SELECT * FROM website_servic_info WHERE Id > 0", _sqlCon);
            MySqlDataAdapter get_Service_Da = new MySqlDataAdapter(get_Service_Cmd);
            get_Service_Da.Fill(get_Service_Dt);
            if (get_Service_Dt.Rows.Count > 0)
            {
                Service_GridView.DataSource = get_Service_Dt;
                Service_GridView.DataBind();
            }
            _sqlCon.Close();
        }




        public void refreshdata()
        {
            using (MySqlCommand cmd = new MySqlCommand("Unit_List", _sqlCon))
            {
                using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        protected void ownership_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["Langues"].ToString() == "1")
            {
                //  Building_Name_DropDownList
                Helper.LoadDropDownList("SELECT * FROM building Where Active ='1' and owner_ship_Owner_Ship_Id = '" + ownership_Name_DropDownList.SelectedValue + "'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                Building_Name_DropDownList.Items.Insert(0, "...............");
            }
            else
            {
                //  Building_Name_DropDownList
                Helper.LoadDropDownList("SELECT * FROM building Where Active ='1' and owner_ship_Owner_Ship_Id = '" + ownership_Name_DropDownList.SelectedValue + "'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                Building_Name_DropDownList.Items.Insert(0, "...............");
            }
                
        }

        protected void Building_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string get_Unit_Photo_Quari = "SELECT " +
                    "U.* , UT.* , UC.* ,UD.* , B.* ,O.* , Z.* FROM units U " +
                    "left join unit_type UT on(U.unit_type_Unit_Type_Id = UT.Unit_Type_Id) " +
                    "left join unit_condition UC on(U.unit_condition_Unit_Condition_Id = UC.Unit_Condition_Id) " +
                    "left join unit_detail UD on(U.unit_detail_Unit_Detail_Id = UD.Unit_Detail_Id) " +
                    "left join building B on(U.building_Building_Id = B.Building_Id) " +
                    "left join owner_ship O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) " +
                    "left join zone Z on(O.zone_zone_Id = Z.zone_Id) " +
                    "where U.Half ='0' and building_Building_Id = '" + Building_Name_DropDownList.SelectedValue + "' ";

            MySqlCommand get_Unit_Photo_Cmd = new MySqlCommand(get_Unit_Photo_Quari, _sqlCon);
            MySqlDataAdapter get_Unit_Photo_Dt = new MySqlDataAdapter(get_Unit_Photo_Cmd);
            get_Unit_Photo_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_Unit_Photo_Dt.SelectCommand = get_Unit_Photo_Cmd;
            get_Unit_Photo_Cmd.Parameters.AddWithValue("@ID", "1");
            DataTable get_Unit_Photo_DataTable = new DataTable();
            get_Unit_Photo_Dt.Fill(get_Unit_Photo_DataTable);
            GridView1.DataSource = get_Unit_Photo_DataTable;
            GridView1.DataBind();
            _sqlCon.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                if (checkbox.Checked == true)
                {
                    var lbl_Image_One = gvrow.FindControl("lbl_Image_One") as Label;
                    var lbl_Image_Two = gvrow.FindControl("lbl_Image_Two") as Label;
                    var lbl_Image_Three = gvrow.FindControl("lbl_Image_Three") as Label;
                    var lbl_Image_Four = gvrow.FindControl("lbl_Image_Four") as Label;
                    var lbl_Unit_Id = gvrow.FindControl("lbl_Unit_Id") as Label;


                    MySqlCommand cmd = new MySqlCommand("UPDATE units SET " +
                                                        "Image_One_Path_Website = @Image_One_Path_Website ," +
                                                        "Image_Two_Path_Website = @Image_Two_Path_Website ," +
                                                        "Image_Three_Path_Website = @Image_Three_Path_Website ," +
                                                        "Image_Four_Path_Website = @Image_Four_Path_Website ," +
                                                        " Active=@Active " +
                                                        "WHERE Unit_ID ='" + lbl_Unit_Id.Text + "'", _sqlCon);

                    cmd.Parameters.AddWithValue("Image_One_Path_Website", Almanara_Host+"/English/Main_Application/units_Photo/" + lbl_Image_One.Text);
                    cmd.Parameters.AddWithValue("Image_Two_Path_Website", Almanara_Host+"/English/Main_Application/units_Photo/" + lbl_Image_Two.Text);
                    cmd.Parameters.AddWithValue("Image_Three_Path_Website", Almanara_Host +"/English/Main_Application/units_Photo/" + lbl_Image_Three.Text);
                    cmd.Parameters.AddWithValue("Image_Four_Path_Website", Almanara_Host +"/English/Main_Application/units_Photo/" + lbl_Image_Four.Text);
                    cmd.Parameters.AddWithValue("Active", "1");
                    _sqlCon.Open();
                    int i = cmd.ExecuteNonQuery();
                    _sqlCon.Close();
                    refreshdata();
                }
                else
                {
                    var lbl_Image_One = gvrow.FindControl("lbl_Image_One") as Label;
                    var lbl_Image_Two = gvrow.FindControl("lbl_Image_Two") as Label;
                    var lbl_Image_Three = gvrow.FindControl("lbl_Image_Three") as Label;
                    var lbl_Image_Four = gvrow.FindControl("lbl_Image_Four") as Label;
                    var lbl_Unit_Id = gvrow.FindControl("lbl_Unit_Id") as Label;


                    MySqlCommand cmd = new MySqlCommand("UPDATE units SET " +
                                                        "Image_One_Path_Website = @Image_One_Path_Website ," +
                                                        "Image_Two_Path_Website = @Image_Two_Path_Website ," +
                                                        "Image_Three_Path_Website = @Image_Three_Path_Website ," +
                                                        "Image_Four_Path_Website = @Image_Four_Path_Website ," +
                                                        " Active=@Active " +
                                                        "WHERE Unit_ID ='" + lbl_Unit_Id.Text + "'", _sqlCon);

                    cmd.Parameters.AddWithValue("Image_One_Path_Website", "");
                    cmd.Parameters.AddWithValue("Image_Two_Path_Website", "");
                    cmd.Parameters.AddWithValue("Image_Three_Path_Website", "");
                    cmd.Parameters.AddWithValue("Image_Four_Path_Website", "");
                    cmd.Parameters.AddWithValue("Active", "0");
                    _sqlCon.Open();
                    int i = cmd.ExecuteNonQuery();
                    _sqlCon.Close();
                    refreshdata();
                }
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string Active; CheckBox CB;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    Active = ((Label)e.Row.FindControl("lbl_Activ")).Text;
                    CB = ((CheckBox)e.Row.FindControl("CheckBox1"));
                    if (Active == "True")
                    {
                        e.Row.Attributes.Add("style", "color: #0779c9; background-color: #dfeef8;");
                        // e.Row.ForeColor = System.Drawing.Color.Blue;
                        //e.Row.BackColor = System.Drawing.Color.AliceBlue;
                        CB.Checked = true;
                    }
                }
                catch
                {
                    Active = "";
                }

                var lbl_Unit_Arabic_Type = ((Label)e.Row.FindControl("lbl_Unit_Arabic_Type"));
                var lbl_Unit_English_Type = ((Label)e.Row.FindControl("lbl_Unit_English_Type"));
                var lbl_Unit_Arabic_Detail = ((Label)e.Row.FindControl("lbl_Unit_Arabic_Detail"));
                var lbl_Unit_English_Detail = ((Label)e.Row.FindControl("lbl_Unit_English_Detail"));
                var lbl_Building_Arabic_Name = ((Label)e.Row.FindControl("lbl_Building_Arabic_Name"));
                var lbl_Building_English_Name = ((Label)e.Row.FindControl("lbl_Building_English_Name"));
                var lbl_Owner_Ship_AR_Name = ((Label)e.Row.FindControl("lbl_Owner_Ship_AR_Name"));
                var lbl_Owner_Ship_EN_Name = ((Label)e.Row.FindControl("lbl_Owner_Ship_EN_Name"));

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Unit_Arabic_Type.Visible= false; lbl_Unit_English_Type.Visible = true;
                    lbl_Unit_Arabic_Detail.Visible = false; lbl_Unit_English_Detail.Visible = true;
                    lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                }
                else
                {
                    lbl_Unit_Arabic_Type.Visible = true; lbl_Unit_English_Type.Visible = false;
                    lbl_Unit_Arabic_Detail.Visible = true; lbl_Unit_English_Detail.Visible = false;
                    lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;

                }

            }
        }

        protected void Add_website_Info_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) 
            {
                MySqlConnection con = Helper.GetConnection();
                MySqlDataAdapter sda = new MySqlDataAdapter("select * from websit_info", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    MySqlCommand Website_cmd = new MySqlCommand("UPDATE websit_info SET " +
                                                                "Who_Are_We_Ar = @Who_Are_We_Ar ," +
                                                                "Who_Are_We_En = @Who_Are_We_En ," +
                                                                "Adress_Ar = @Adress_Ar ," +
                                                                "Adress_En = @Adress_En ," +
                                                                "Phone=@Phone ," +
                                                                "Email=@Email ," +
                                                                "Facebook=@Facebook ," +
                                                                "Whatssapp=@Whatssapp, " +

                                                                "Email_From=@Email_From ," +
                                                                "Email_To=@Email_To ," +
                                                                "Email_STMP=@Email_STMP ," +
                                                                "Email_Port=@Email_Port ," +
                                                                "Email_Password=@Email_Password " +

                                                                "WHERE WebSit_Info_Id > 0", _sqlCon);

                    Website_cmd.Parameters.AddWithValue("@Who_Are_We_Ar", txt_Ar_Who_Are_We.Text);
                    Website_cmd.Parameters.AddWithValue("@Who_Are_We_En", txt_En_Who_Are_We.Text);
                    Website_cmd.Parameters.AddWithValue("@Adress_Ar", txt_Ar_Address.Text);
                    Website_cmd.Parameters.AddWithValue("@Adress_En", txt_En_Address.Text);
                    Website_cmd.Parameters.AddWithValue("@Phone", txt_Phone.Text);
                    Website_cmd.Parameters.AddWithValue("@Email", txt_Email.Text);
                    Website_cmd.Parameters.AddWithValue("@Facebook", txt_FaceBook.Text);
                    Website_cmd.Parameters.AddWithValue("@Whatssapp", txt_Whatssapp.Text);

                    Website_cmd.Parameters.AddWithValue("@Email_From", txt_Email_From.Text);
                    Website_cmd.Parameters.AddWithValue("@Email_To", txt_Email_To.Text);
                    Website_cmd.Parameters.AddWithValue("@Email_STMP", txt_Email_STMP.Text);
                    Website_cmd.Parameters.AddWithValue("@Email_Port", txt_Email_Port.Text);
                    Website_cmd.Parameters.AddWithValue("@Email_Password", txt_Email_Password.Text);
                    _sqlCon.Open();
                    Website_cmd.ExecuteNonQuery();
                    _sqlCon.Close();
                    if (Session["Langues"].ToString() == "1") { lbl_WebSite_Info.Text = "Added successfully"; }
                    else { lbl_WebSite_Info.Text = "تمت الإضافة بنجاح"; }
                        
                }
                else
                {
                    MySqlCommand Website_cmd = new MySqlCommand("Insert Into websit_info " +
                                                                "(Who_Are_We_Ar," +
                                                                "Who_Are_We_En," +
                                                                "Adress_Ar," +
                                                                "Adress_En," +
                                                                "Phone," +
                                                                "Email," +
                                                                "Facebook," +

                                                                "Email_From," +
                                                                "Email_To," +
                                                                "Email_STMP," +
                                                                "Email_Port," +
                                                                "Email_Password," +

                                                                "Whatssapp) " +
                                                                "VALUES " +
                                                                "(@Who_Are_We_Ar," +
                                                                "@Who_Are_We_En," +
                                                                "@Adress_Ar," +
                                                                "@Adress_En," +
                                                                "@Phone," +
                                                                "@Email," +
                                                                "@Facebook," +
                                                                "@Email_From," +
                                                                "@Email_To," +
                                                                "@Email_STMP," +
                                                                "@Email_Port," +
                                                                "@Email_Password," +
                                                                "@Whatssapp )", _sqlCon);

                    Website_cmd.Parameters.AddWithValue("@Who_Are_We_Ar", txt_Ar_Who_Are_We.Text);
                    Website_cmd.Parameters.AddWithValue("@Who_Are_We_En", txt_En_Who_Are_We.Text);
                    Website_cmd.Parameters.AddWithValue("@Adress_Ar", txt_Ar_Address.Text);
                    Website_cmd.Parameters.AddWithValue("@Adress_En", txt_En_Address.Text);
                    Website_cmd.Parameters.AddWithValue("@Phone", txt_Phone.Text);
                    Website_cmd.Parameters.AddWithValue("@Email", txt_Email.Text);
                    Website_cmd.Parameters.AddWithValue("@Facebook", txt_FaceBook.Text);
                    Website_cmd.Parameters.AddWithValue("@Whatssapp", txt_Whatssapp.Text);

                    Website_cmd.Parameters.AddWithValue("@Email_From", txt_Email_From.Text);
                    Website_cmd.Parameters.AddWithValue("@Email_To", txt_Email_To.Text);
                    Website_cmd.Parameters.AddWithValue("@Email_STMP", txt_Email_STMP.Text);
                    Website_cmd.Parameters.AddWithValue("@Email_Port", txt_Email_Port.Text);
                    Website_cmd.Parameters.AddWithValue("@Email_Password", txt_Email_Password.Text);
                    _sqlCon.Open();
                    Website_cmd.ExecuteNonQuery();
                    _sqlCon.Close();
                    if (Session["Langues"].ToString() == "1") { lbl_WebSite_Info.Text = "Added successfully"; }
                    else { lbl_WebSite_Info.Text = "تمت الإضافة بنجاح"; }
                        
                }
            }
                
        }
        protected void BTN_Add_Servic_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addServiceQuary = "Insert Into website_servic_info " +
                    "(Arabic_Titel , English_Titel ,Arabic_Description , English_Description , Servic_Image_Name , Servic_Image_Path , Servic_Image_Path_WebSite) " +
                    "VALUES" +
                    "(@Arabic_Titel , @English_Titel ,@Arabic_Description , @English_Description , @Servic_Image_Name , @Servic_Image_Path , @Servic_Image_Path_WebSite)";
                _sqlCon.Open();
                MySqlCommand addServiceCmd = new MySqlCommand(addServiceQuary, _sqlCon);
                addServiceCmd.Parameters.AddWithValue("@Arabic_Titel", txt_Servic_AR_Title.Text);
                addServiceCmd.Parameters.AddWithValue("@English_Titel", txt_Servic_EN_Title.Text);
                addServiceCmd.Parameters.AddWithValue("@Arabic_Description", txt_Servic_AR_Description.Text);
                addServiceCmd.Parameters.AddWithValue("@English_Description", txt_Servic_EN_Description.Text);


                if (FUL_Servic_Imag.HasFile)
                {
                    string fileName = Path.GetFileName(FUL_Servic_Imag.PostedFile.FileName);
                    FUL_Servic_Imag.PostedFile.SaveAs(Server.MapPath("/English/Master_Panal/Service_Image/") + fileName);
                    addServiceCmd.Parameters.AddWithValue("@Servic_Image_Name", fileName);
                    addServiceCmd.Parameters.AddWithValue("@Servic_Image_Path", "/English/Master_Panal/Service_Image/" + fileName);
                    addServiceCmd.Parameters.AddWithValue("@Servic_Image_Path_WebSite", Almanara_Host+"/English/Master_Panal/Service_Image/" + fileName);
                }
                else
                {
                    addServiceCmd.Parameters.AddWithValue("@Servic_Image_Name", "empty_Image");
                    addServiceCmd.Parameters.AddWithValue("@Servic_Image_Path", "/English/Main_Application/Main_Image/empty_Image.jpg/");
                    addServiceCmd.Parameters.AddWithValue("@Servic_Image_Path_WebSite", Almanara_Host+"/English/Main_Application/Main_Image/empty_Image.jpg/");
                }
                addServiceCmd.ExecuteNonQuery();
                _sqlCon.Close();
            }
            Response.Redirect("Website_Info.aspx");
        }

        protected void Delete_Servic(object sender, EventArgs e)
        {
            try
            {
                string ServicRowId = (sender as LinkButton).CommandArgument;
                _sqlCon.Open();
                string deleteServiceQuary = "DELETE FROM website_servic_info WHERE Id=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(deleteServiceQuary, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", ServicRowId);
                mySqlCmd.ExecuteNonQuery();
                _sqlCon.Close();
                Response.Redirect(Request.RawUrl);
            }
            catch { Response.Write(@"<script language='javascript'>alert('This Servic Cannot Be Deleted ')</script>"); };
        }

        protected void Service_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                _sqlCon.Close();
                LinkButton btn_Servic_Delete = (e.Row.FindControl("btn_Servic_Delete") as LinkButton);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "Marketing", btn_Servic_Delete);
            }
        }

        protected void Service_GridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Service_GridView.EditIndex = e.NewEditIndex; this.Services_DataBind();
        }

        protected void Service_GridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Service_GridView.EditIndex = -1; this.Services_DataBind();
        }

        protected void Service_GridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Page.SetFocus(Add_Servic.ClientID);
            string txt_Arabic_Titel = (Service_GridView.Rows[e.RowIndex].FindControl("txt_Arabic_Titel") as TextBox).Text;
            string txt_English_Titel = (Service_GridView.Rows[e.RowIndex].FindControl("txt_English_Titel") as TextBox).Text;
            string txt_Arabic_Description = (Service_GridView.Rows[e.RowIndex].FindControl("txt_Arabic_Description") as TextBox).Text;
            string txt_English_Description = (Service_GridView.Rows[e.RowIndex].FindControl("txt_English_Description") as TextBox).Text;
            FileUpload file = (Service_GridView.Rows[e.RowIndex].FindControl("fuEditFile") as FileUpload);
            string File_Old_path = (Service_GridView.Rows[e.RowIndex].FindControl("File_Old_path") as Label).Text;
            string File_Old_Name = (Service_GridView.Rows[e.RowIndex].FindControl("File_Old_Name") as Label).Text;
            string ID = Service_GridView.DataKeys[e.RowIndex].Value.ToString();


            string Quary = "UPDATE website_servic_info SET " +
                "Arabic_Titel=@Arabic_Titel , " +
                "English_Titel=@English_Titel , " +
                "Arabic_Description=@Arabic_Description , " +
                "English_Description=@English_Description  , " +
                "Servic_Image_Name=@Servic_Image_Name , " +
                "Servic_Image_Path=@Servic_Image_Path , " +
                "Servic_Image_Path_WebSite=@Servic_Image_Path_WebSite" +
                " WHERE Id=@ID ";
            _sqlCon.Open();
            MySqlCommand Cmd = new MySqlCommand(Quary, _sqlCon);
            Cmd.Parameters.AddWithValue("@ID", ID);
            Cmd.Parameters.AddWithValue("@Arabic_Titel", txt_Arabic_Titel);
            Cmd.Parameters.AddWithValue("@English_Titel", txt_English_Titel);
            Cmd.Parameters.AddWithValue("@Arabic_Description", txt_Arabic_Description);
            Cmd.Parameters.AddWithValue("@English_Description", txt_English_Description);


            if (file.HasFile)
            {
                string fileName = Path.GetFileName(file.PostedFile.FileName);
                file.PostedFile.SaveAs(Server.MapPath("/English/Master_Panal/Service_Image/") + fileName);
                Cmd.Parameters.AddWithValue("@Servic_Image_Name", fileName);
                Cmd.Parameters.AddWithValue("@Servic_Image_Path", "/English/Master_Panal/Service_Image/" + fileName);
                Cmd.Parameters.AddWithValue("@Servic_Image_Path_WebSite", Almanara_Host + "/English/Master_Panal/Service_Image/" + fileName);
            }
            else
            {
                if(File_Old_path!= "/English/Main_Application/Main_Image/empty_Image.jpg")
                {
                    Cmd.Parameters.AddWithValue("@Servic_Image_Name", File_Old_Name);
                    Cmd.Parameters.AddWithValue("@Servic_Image_Path", File_Old_path);
                    Cmd.Parameters.AddWithValue("@Servic_Image_Path_WebSite", Almanara_Host + File_Old_path);
                }
                else
                {
                    Cmd.Parameters.AddWithValue("@Servic_Image_Name", "empty_Image");
                    Cmd.Parameters.AddWithValue("@Servic_Image_Path", "/English/Main_Application/Main_Image/empty_Image.jpg");
                    Cmd.Parameters.AddWithValue("@Servic_Image_Path_WebSite", Almanara_Host + "/English/Main_Application/Main_Image/empty_Image.jpg");
                }
                
            }




            Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Service_GridView.EditIndex = -1;  this.Services_DataBind();
        }









        //******************************************************************************************************************************************
        //************************************************** languages ****************************************************************
        //******************************************************************************************************************************************

        protected void language()
        {

            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            _sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_expensess", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {

                    //  ownership_Name_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship", _sqlCon, ownership_Name_DropDownList, "Owner_Ship_EN_Name", "Owner_Ship_Id");
                    ownership_Name_DropDownList.Items.Insert(0, "...............");
                    //  Building_Name_DropDownList Defult Value
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    lbl_Add_Services.Text = Dt.Rows[17]["EN"].ToString();
                    lbl_Servic_EN_Title.Text = Dt.Rows[19]["EN"].ToString();
                    lbl_Servic_AR_Title.Text = Dt.Rows[18]["EN"].ToString();
                    lbl_Servic_EN_Description.Text = Dt.Rows[21]["EN"].ToString();
                    lbl_Servic_AR_Description.Text = Dt.Rows[20]["EN"].ToString();
                    lbl_Servic_Imag.Text = Dt.Rows[22]["EN"].ToString();
                    lbl_Main_Info.Text = Dt.Rows[23]["EN"].ToString();
                    lbl_AR_Who_Are_We.Text = Dt.Rows[24]["EN"].ToString();
                    lbl_En_Who_Are_We.Text = Dt.Rows[25]["EN"].ToString();
                    lbl_Phone.Text = Dt.Rows[26]["EN"].ToString();
                    lbl_En_Address.Text = Dt.Rows[28]["EN"].ToString();
                    lbl_AR_Address.Text = Dt.Rows[27]["EN"].ToString();
                    lbl_Email.Text = Dt.Rows[29]["EN"].ToString();
                    lbl_FaceBook.Text = Dt.Rows[30]["EN"].ToString();
                    lbl_Whatssapp.Text = Dt.Rows[31]["EN"].ToString();
                    lbl_Domain_Info.Text = Dt.Rows[32]["EN"].ToString();
                    lbl_Websit_Units.Text = Dt.Rows[33]["EN"].ToString();
                    lbl_ownership_Name.Text = Dt.Rows[4]["EN"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[5]["EN"].ToString();
                    Add.Text = Dt.Rows[34]["EN"].ToString();
                    Add_Info.Text = Dt.Rows[34]["EN"].ToString();
                    Add_Servic.Text = Dt.Rows[34]["EN"].ToString();



                    Service_GridView.Columns[0].HeaderText = Dt.Rows[18]["EN"].ToString();
                    Service_GridView.Columns[1].HeaderText = Dt.Rows[19]["EN"].ToString();
                    Service_GridView.Columns[2].HeaderText = Dt.Rows[20]["EN"].ToString();
                    Service_GridView.Columns[3].HeaderText = Dt.Rows[21]["EN"].ToString();
                    Service_GridView.Columns[4].HeaderText = Dt.Rows[22]["EN"].ToString();


                    GridView1.Columns[1].HeaderText = "Unit Number";
                    GridView1.Columns[2].HeaderText = "Area";
                    GridView1.Columns[3].HeaderText = "Type";
                    GridView1.Columns[4].HeaderText = "Details";
                    GridView1.Columns[5].HeaderText = "Building";
                    GridView1.Columns[6].HeaderText = "Building NO";
                    GridView1.Columns[7].HeaderText = "Property";
                    GridView1.Columns[8].HeaderText = "Street NO";
                    GridView1.Columns[9].HeaderText = "Street";
                    GridView1.Columns[10].HeaderText = "Floor";
                    GridView1.Columns[11].HeaderText = "Iamge";
                }
                else
                {
                    //  ownership_Name_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship", _sqlCon, ownership_Name_DropDownList, "Owner_Ship_AR_Name", "Owner_Ship_Id");
                    ownership_Name_DropDownList.Items.Insert(0, "...............");
                    //  Building_Name_DropDownList Defult Value
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    lbl_Add_Services.Text = Dt.Rows[17]["AR"].ToString();
                    lbl_Servic_EN_Title.Text = Dt.Rows[19]["AR"].ToString();
                    lbl_Servic_AR_Title.Text = Dt.Rows[18]["AR"].ToString();
                    lbl_Servic_EN_Description.Text = Dt.Rows[21]["AR"].ToString();
                    lbl_Servic_AR_Description.Text = Dt.Rows[20]["AR"].ToString();
                    lbl_Servic_Imag.Text = Dt.Rows[22]["AR"].ToString();
                    lbl_Main_Info.Text = Dt.Rows[23]["AR"].ToString();
                    lbl_AR_Who_Are_We.Text = Dt.Rows[24]["AR"].ToString();
                    lbl_En_Who_Are_We.Text = Dt.Rows[25]["AR"].ToString();
                    lbl_Phone.Text = Dt.Rows[26]["AR"].ToString();
                    lbl_En_Address.Text = Dt.Rows[28]["AR"].ToString();
                    lbl_AR_Address.Text = Dt.Rows[27]["AR"].ToString();
                    lbl_Email.Text = Dt.Rows[29]["AR"].ToString();
                    lbl_FaceBook.Text = Dt.Rows[30]["AR"].ToString();
                    lbl_Whatssapp.Text = Dt.Rows[31]["AR"].ToString();
                    lbl_Domain_Info.Text = Dt.Rows[32]["AR"].ToString();
                    lbl_Websit_Units.Text = Dt.Rows[33]["AR"].ToString();
                    lbl_ownership_Name.Text = Dt.Rows[4]["AR"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[5]["AR"].ToString();
                    Add.Text = Dt.Rows[34]["AR"].ToString();
                    Add_Info.Text = Dt.Rows[34]["AR"].ToString();
                    Add_Servic.Text = Dt.Rows[34]["AR"].ToString();



                    Service_GridView.Columns[0].HeaderText = Dt.Rows[18]["AR"].ToString();
                    Service_GridView.Columns[1].HeaderText = Dt.Rows[19]["AR"].ToString();
                    Service_GridView.Columns[2].HeaderText = Dt.Rows[20]["AR"].ToString();
                    Service_GridView.Columns[3].HeaderText = Dt.Rows[21]["AR"].ToString();
                    Service_GridView.Columns[4].HeaderText = Dt.Rows[22]["AR"].ToString();


                    GridView1.Columns[1].HeaderText = "رقم الوحدة";
                    GridView1.Columns[2].HeaderText = "المساحة";
                    GridView1.Columns[3].HeaderText = "النوع";
                    GridView1.Columns[4].HeaderText = "التفاصيل";
                    GridView1.Columns[5].HeaderText = "البناء";
                    GridView1.Columns[6].HeaderText = "رقم البناء";
                    GridView1.Columns[7].HeaderText = "الملكية";
                    GridView1.Columns[8].HeaderText = "رقم الشارع";
                    GridView1.Columns[9].HeaderText = "الشارع";
                    GridView1.Columns[10].HeaderText = "الطابق";
                    GridView1.Columns[11].HeaderText = "الصورة";
                }
            }
            _sqlCon.Close();

        }
    }
}