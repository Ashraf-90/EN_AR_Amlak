using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Diagnostics;
using System.EnterpriseServices;
using System.IO;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Contact_With_Tenant : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Customer_Affairs", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();


                DataTable Ch_Dt = new DataTable();
                Ch_Dt.Columns.AddRange(new DataColumn[2]
                {
                    new DataColumn("tenant_Name"),
                    new DataColumn("ID"),
                });
                ViewState["Cash_Customers"] = Ch_Dt;
                this.BindGrid();


                Tenant_List_BindData();


            }
        }

        private void BindGrid()
        {
            Cheque_GridView.DataSource = (DataTable)ViewState["Cash_Customers"];
            Cheque_GridView.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt1 = (DataTable)ViewState["Cash_Customers"];
            dt1.Rows.Add
            (
                DropDownList1.SelectedItem.Text.Trim(),
                DropDownList1.SelectedValue
            );
            ViewState["Cash_Customers"] = dt1;
            this.BindGrid();
        }

        protected void Cheque_GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["Cash_Customers"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["Cash_Customers"] = dt;
            BindGrid();
        }



        protected void btn_Send_Sms_Click(object sender, EventArgs e)
        {
            lbl_Send_Sussefilly.Text = "تم الإرسال لجميع العملاء بنجاح";
            if (Level_DropDownList.SelectedValue == "1")
            {
                string tenantListQuery = "SELECT Tenants_ID , Tenants_Mobile From tenants";
                MySqlCommand tenantListCmd = new MySqlCommand(tenantListQuery, _sqlCon);
                MySqlDataAdapter tenantListDt = new MySqlDataAdapter(tenantListCmd);
                tenantListCmd.Connection = _sqlCon;
                _sqlCon.Open();
                tenantListDt.SelectCommand = tenantListCmd;
                DataTable tenantListDataTable = new DataTable();
                tenantListDt.Fill(tenantListDataTable);
                for (int i = 0;i < tenantListDataTable.Rows.Count; i++)
                {
                    Utilities.Helper.SendSms(tenantListDataTable.Rows[i]["Tenants_Mobile"].ToString(),txt_tenant_Sms.Text);
                }
                
                _sqlCon.Close();
                // ******************  Get User Name *****************************************************************************

                string UserNameQuery = "SELECT Users_Ar_First_Name , Users_Name  From users Where user_ID = '" + Session["user_ID"].ToString() + "'";
                MySqlCommand UserNameCmd = new MySqlCommand(UserNameQuery, _sqlCon);
                MySqlDataAdapter UserNameDt = new MySqlDataAdapter(UserNameCmd);
                UserNameCmd.Connection = _sqlCon;
                _sqlCon.Open();
                UserNameDt.SelectCommand = UserNameCmd;
                DataTable UserNameDataTable = new DataTable();
                UserNameDt.Fill(UserNameDataTable);
                _sqlCon.Close();






                string addSMSQuary =
                   "Insert Into tenant_sending (" +
                   "Level , " +
                   "EN_Level , " +
                   "Type , " +
                   "EN_Type , " +
                   "Mounth , " +
                   "Year , " +
                   "User_Name , " +
                   "User_EN_Name , " +
                   "SMS) " +
                   "VALUES(" +
                   "@Level , " +
                   "@EN_Level , " +
                   "@Type , " +
                   "@EN_Type , " +
                   "@Mounth , " +
                   "@Year , " +
                   "@User_Name , " +
                   "@User_EN_Name , " +
                   "@SMS)";
                _sqlCon.Open();
                MySqlCommand addSMSCmd = new MySqlCommand(addSMSQuary, _sqlCon);
                addSMSCmd.Parameters.AddWithValue("@Level", "جميع العملاء");
                addSMSCmd.Parameters.AddWithValue("@EN_Level", "All Tenants");
                addSMSCmd.Parameters.AddWithValue("@Type", "رسالة SMS");
                addSMSCmd.Parameters.AddWithValue("@EN_Type", " SMS");
                addSMSCmd.Parameters.AddWithValue("@Mounth", DateTime.Now.Month.ToString());
                addSMSCmd.Parameters.AddWithValue("@Year", DateTime.Now.Year.ToString());
                addSMSCmd.Parameters.AddWithValue("@User_Name", UserNameDataTable.Rows[0]["Users_Ar_First_Name"].ToString());
                addSMSCmd.Parameters.AddWithValue("@User_EN_Name", UserNameDataTable.Rows[0]["Users_Name"].ToString());
                addSMSCmd.Parameters.AddWithValue("@SMS", txt_tenant_Sms.Text);
                addSMSCmd.ExecuteNonQuery();
                _sqlCon.Close();

            }
            else if (Level_DropDownList.SelectedValue == "3")
            {
                Utilities.Helper.SendSms(txt_tenant_NO.Text, txt_tenant_Sms.Text);
                lbl_Send_Sussefilly.Text = "تم الإرسال للعميل بنجاح";



                string UserNameQuery = "SELECT Users_Ar_First_Name , Users_Name  From users Where user_ID = '" + Session["user_ID"].ToString() + "'";
                MySqlCommand UserNameCmd = new MySqlCommand(UserNameQuery, _sqlCon);
                MySqlDataAdapter UserNameDt = new MySqlDataAdapter(UserNameCmd);
                UserNameCmd.Connection = _sqlCon;
                _sqlCon.Open();
                UserNameDt.SelectCommand = UserNameCmd;
                DataTable UserNameDataTable = new DataTable();
                UserNameDt.Fill(UserNameDataTable);
                _sqlCon.Close();




                string addSMSQuary =
                   "Insert Into tenant_sending (" +
                   "Level , " +
                   "EN_Level , " +
                   "Type , " +
                   "EN_Type , " +
                   "Mounth , " +
                   "Year , " +
                   "User_Name , " +
                   "User_EN_Name , " +
                   "Tenant_Tenant_Id , " +
                   "SMS ) " +
                   "VALUES(" +
                   "@Level , " +
                   "@EN_Level , " +
                   "@Type , " +
                   "@EN_Type , " +
                   "@Mounth , " +
                   "@Year , " +
                   "@User_Name , " +
                   "@User_EN_Name , " +
                   "@Tenant_Tenant_Id , " +
                   "@SMS)";
                _sqlCon.Open();
                MySqlCommand addSMSCmd = new MySqlCommand(addSMSQuary, _sqlCon);
                addSMSCmd.Parameters.AddWithValue("@Level", "عميل محدد");
                addSMSCmd.Parameters.AddWithValue("@EN_Level", "Specific Tenant");
                addSMSCmd.Parameters.AddWithValue("@Type", "رسالة SMS");
                addSMSCmd.Parameters.AddWithValue("@EN_Type", " SMS");
                addSMSCmd.Parameters.AddWithValue("@Mounth", DateTime.Now.Month.ToString());
                addSMSCmd.Parameters.AddWithValue("@Year", DateTime.Now.Year.ToString());
                addSMSCmd.Parameters.AddWithValue("@User_Name", UserNameDataTable.Rows[0]["Users_Ar_First_Name"].ToString());
                addSMSCmd.Parameters.AddWithValue("@User_EN_Name", UserNameDataTable.Rows[0]["Users_Name"].ToString());
                addSMSCmd.Parameters.AddWithValue("@Tenant_Tenant_Id", Tenant_Name_DropDownList.SelectedValue);
                addSMSCmd.Parameters.AddWithValue("@SMS", txt_tenant_Sms.Text);
                addSMSCmd.ExecuteNonQuery();
                _sqlCon.Close();
            }
            else  if (Level_DropDownList.SelectedValue == "4")
            {
                foreach (GridViewRow g1 in Cheque_GridView.Rows)
                {
                    Utilities.Helper.SendSms(g1.Cells[1].Text, txt_tenant_Sms.Text);
                }
                string UserNameQuery = "SELECT Users_Ar_First_Name , Users_Name  From users Where user_ID = '" + Session["user_ID"].ToString() + "'";
                MySqlCommand UserNameCmd = new MySqlCommand(UserNameQuery, _sqlCon);
                MySqlDataAdapter UserNameDt = new MySqlDataAdapter(UserNameCmd);
                UserNameCmd.Connection = _sqlCon;
                _sqlCon.Open();
                UserNameDt.SelectCommand = UserNameCmd;
                DataTable UserNameDataTable = new DataTable();
                UserNameDt.Fill(UserNameDataTable);
                _sqlCon.Close();

                string addSMSQuary =
                  "Insert Into tenant_sending (" +
                  "Level , " +
                   "EN_Level , " +
                   "Type , " +
                   "EN_Type , " +
                  "Mounth , " +
                  "Year , " +
                  "User_Name , " +
                  "User_EN_Name , " +
                  "SMS ) " +
                  "VALUES(" +
                  "@Level , " +
                   "@EN_Level , " +
                   "@Type , " +
                   "@EN_Type , " +
                  "@Mounth , " +
                  "@Year , " +
                  "@User_Name , " +
                  "@User_EN_Name , " +
                  "@SMS)";
                _sqlCon.Open();
                MySqlCommand addSMSCmd = new MySqlCommand(addSMSQuary, _sqlCon);
                addSMSCmd.Parameters.AddWithValue("@Level", "مجموعة عملاء");
                addSMSCmd.Parameters.AddWithValue("@EN_Level", "Group Of Tenants");
                addSMSCmd.Parameters.AddWithValue("@Type", "رسالة SMS");
                addSMSCmd.Parameters.AddWithValue("@EN_Type", " SMS");
                addSMSCmd.Parameters.AddWithValue("@Mounth", DateTime.Now.Month.ToString());
                addSMSCmd.Parameters.AddWithValue("@Year", DateTime.Now.Year.ToString());
                addSMSCmd.Parameters.AddWithValue("@User_Name", UserNameDataTable.Rows[0]["Users_Ar_First_Name"].ToString());
                addSMSCmd.Parameters.AddWithValue("@User_EN_Name", UserNameDataTable.Rows[0]["Users_Name"].ToString());
                addSMSCmd.Parameters.AddWithValue("@SMS", txt_tenant_Sms.Text);
                addSMSCmd.ExecuteNonQuery();
                _sqlCon.Close();


            }
                Response.Redirect(Request.RawUrl);
        }

        protected void btn_Att_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Level = ""; string Type = ""; string EN_Level = ""; string EN_Type = ""; string Tenant_Tenant_Id ="";

                if (Att_Level_DropDownList.SelectedValue == "1")
                {
                    Level = "كافة العملاء";
                    EN_Level = "All Tenants";

                    Type = "مرفق";
                    EN_Type = "Attachments";
                    Tenant_Tenant_Id = ""; 
                    
                }
                else if (Att_Level_DropDownList.SelectedValue == "2")
                {
                    Level = "عملاء في بناء محدد";
                    EN_Level = "Tenants In Specific Building";

                    Type = "مرفق";
                    EN_Type = "Attachments";
                    Tenant_Tenant_Id = "";
                }
                else
                {
                    Level = "عميل محدد";
                    EN_Level = "Specific Tenant";

                    Type = "مرفق";
                    EN_Type = "Attachments";
                    Tenant_Tenant_Id = Tenant_Name_DropDownList.SelectedValue;
                }








                string UserNameQuery = "SELECT Users_Ar_First_Name , Users_En_First_Name From users Where user_ID = '" + Session["user_ID"].ToString() + "'";
                MySqlCommand UserNameCmd = new MySqlCommand(UserNameQuery, _sqlCon);
                MySqlDataAdapter UserNameDt = new MySqlDataAdapter(UserNameCmd);
                UserNameCmd.Connection = _sqlCon;
                _sqlCon.Open();
                UserNameDt.SelectCommand = UserNameCmd;
                DataTable UserNameDataTable = new DataTable();
                UserNameDt.Fill(UserNameDataTable);
                _sqlCon.Close();


                string addAttQuary =
                   "Insert Into tenant_sending (" +
                   "Level , " +
                   "EN_Level , " +
                   "Type , " +
                   "EN_Type , " +
                   "Mounth , " +
                   "Year , " +
                   "User_Name , " +
                   "User_EN_Name , " +
                   "User_EN_Name , " +
                   "Tenant_Tenant_Id , " +
                   "Attatchment_File_Name , " +
                   "Attatchment_File_Path , " +
                   "Discription) " +
                   "VALUES(" +
                   "@Level , " +
                   "@EN_Level , " +
                   "@Type , " +
                   "@EN_Type , " +
                   "@Mounth , " +
                   "@Year , " +
                   "@User_Name , " +
                   "@User_EN_Name , " +
                   "@Tenant_Tenant_Id , " +
                   "@Attatchment_File_Name , " +
                   "@Attatchment_File_Path , " +
                   "@Discription)";
                _sqlCon.Open();
                MySqlCommand addAttCmd = new MySqlCommand(addAttQuary, _sqlCon);
                addAttCmd.Parameters.AddWithValue("@Level", Level);
                addAttCmd.Parameters.AddWithValue("@EN_Level", EN_Level);
                addAttCmd.Parameters.AddWithValue("@Type", Type);
                addAttCmd.Parameters.AddWithValue("@EN_Type", EN_Type);
                addAttCmd.Parameters.AddWithValue("@Mounth", DateTime.Now.Month.ToString());
                addAttCmd.Parameters.AddWithValue("@Year", DateTime.Now.Year.ToString());
                addAttCmd.Parameters.AddWithValue("@User_Name", UserNameDataTable.Rows[0]["Users_Ar_First_Name"].ToString());
                addAttCmd.Parameters.AddWithValue("@User_EN_Name", UserNameDataTable.Rows[0]["Users_Name"].ToString());
                addAttCmd.Parameters.AddWithValue("@Tenant_Tenant_Id", Tenant_Tenant_Id);
                addAttCmd.Parameters.AddWithValue("@Discription", txt_Att_Discription.Text);

                if (Att_FileUpload.HasFile)
                {
                    string fileName1 = Path.GetFileName(Att_FileUpload.PostedFile.FileName);
                    Att_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Tenant_Att/") + fileName1);
                    addAttCmd.Parameters.AddWithValue("@Attatchment_File_Name", fileName1);
                    addAttCmd.Parameters.AddWithValue("@Attatchment_File_Path", "/English/Main_Application/Tenant_Att/" + fileName1);
                }
                else
                {
                    addAttCmd.Parameters.AddWithValue("@Attatchment_File_Name", "No File");
                    addAttCmd.Parameters.AddWithValue("@Attatchment_File_Path", "No File");
                }
                addAttCmd.ExecuteNonQuery();
                _sqlCon.Close();





            }
            Response.Redirect(Request.RawUrl);
        }

        protected void Tenant_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable getSMS_NODt = new DataTable();
            _sqlCon.Open();
            MySqlCommand getSMS_NOCmd = new MySqlCommand("SELECT Tenants_Mobile FROM tenants WHERE Tenants_ID = @ID", _sqlCon);
            MySqlDataAdapter getSMS_NODa = new MySqlDataAdapter(getSMS_NOCmd);
            getSMS_NOCmd.Parameters.AddWithValue("@ID", Tenant_Name_DropDownList.SelectedValue);
            getSMS_NODa.Fill(getSMS_NODt);
            if (getSMS_NODt.Rows.Count > 0)
            {
                txt_tenant_NO.Text = getSMS_NODt.Rows[0]["Tenants_Mobile"].ToString();
            }

            _sqlCon.Close();
        }





        protected void Tenant_List_BindData()
        {
            string Tenant = ""; string Type = "";
            if (Tenan_DropDownList.SelectedItem.Text != "...............") { Tenant = " and TS.Tenant_Tenant_Id = " + Tenan_DropDownList.SelectedValue; } else { Tenant = ""; }
            if (Type_DropDownList.SelectedItem.Text != "...............") { Type = " and TS.Type = '" + Type_DropDownList.SelectedItem.Text.Trim() + "'"; } else { Type = ""; }

            string tenantListQuery = "SELECT TS.* , T.* " +
                                     "FROM tenant_sending TS " +
                                     "left join  tenants T on (TS.Tenant_Tenant_Id = T.Tenants_ID)  " +
                                     "where TS.Tenant_Sending_Id > 0  " + Tenant + "  " + Type + "    ";



            MySqlCommand tenantListCmd = new MySqlCommand(tenantListQuery, _sqlCon);
            MySqlDataAdapter tenantListDt = new MySqlDataAdapter(tenantListCmd);
            tenantListCmd.Connection = _sqlCon;
            _sqlCon.Open();
            tenantListDt.SelectCommand = tenantListCmd;
            DataTable tenantListDataTable = new DataTable();
            tenantListDt.Fill(tenantListDataTable);
            tenant_List.DataSource = tenantListDataTable;
            tenant_List.DataBind();
            _sqlCon.Close();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void Level_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Level_DropDownList.SelectedValue == "1")
            {
                Building_div.Visible=false; Tenant_div.Visible= false; Tenant_NO_div.Visible= false; Div1.Visible = false;
            }
            else if (Level_DropDownList.SelectedValue == "2")
            {
                Building_div.Visible = true; Tenant_div.Visible = false; Tenant_NO_div.Visible = false; Div1.Visible = false;
            }
            else  if (Level_DropDownList.SelectedValue == "3")
            {
                Building_div.Visible = false; Tenant_div.Visible = true; Tenant_NO_div.Visible = true; Div1.Visible = false;
            }
            else
            {
                Building_div.Visible = false; Tenant_div.Visible = false; Tenant_NO_div.Visible = false; Div1.Visible = true;
            }
        }

        protected void Att_Level_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Att_Level_DropDownList.SelectedValue == "1")
            {
                Att_Building_div.Visible = false; Att_Tenant_div.Visible = false; 
            }
            else if (Att_Level_DropDownList.SelectedValue == "2")
            {
                Att_Building_div.Visible = true; Att_Tenant_div.Visible = false;
            }
            else
            {
                Att_Building_div.Visible = false; Att_Tenant_div.Visible = true; 
            }
        }

        protected void Tenan_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Tenant_List_BindData();
        }

        protected void Type_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Tenant_List_BindData();
        }





















        //******************************************************************************************************************************************
        //************************************************** languages ****************************************************************
        //******************************************************************************************************************************************

        protected void language()
        {

            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            _sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_tenant", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenan_DropDownList, "Tenants_English_Name", "Tenants_ID");
                    Tenan_DropDownList.Items.Insert(0, "...............");

                    Type_DropDownList.Items.Insert(0, "...............");




                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenant_Name_DropDownList, "Tenants_English_Name", "Tenants_ID");
                    Tenant_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Att_Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Att_Building_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Att_Tenant_Name_DropDownList, "Tenants_English_Name", "Tenants_ID");
                    Att_Tenant_Name_DropDownList.Items.Insert(0, "...............");


                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, DropDownList1, "Tenants_English_Name", "Tenants_Mobile");
                    DropDownList1.Items.Insert(0, "...............");


                    Cheque_GridView.Columns[0].HeaderText = Dt.Rows[35]["EN"].ToString();
                    Cheque_GridView.Columns[1].HeaderText = Dt.Rows[13]["EN"].ToString();


                    //Get Level_DropDownList 
                    Level_DropDownList.Items.Clear();
                    Level_DropDownList.Items.Add(new ListItem("Send To All Tenants", "1"));
                    Level_DropDownList.Items.Add(new ListItem("Send To Tenants in a Specific Building", "2"));
                    Level_DropDownList.Items.Add(new ListItem("Send To a Specific Tenants", "3"));
                    Level_DropDownList.Items.Add(new ListItem("Send To a Group of Tenants", "4"));
                    Level_DropDownList.Items.Insert(0, "...............");

                    //Get Att_Level_DropDownList 
                    Att_Level_DropDownList.Items.Clear();
                    Att_Level_DropDownList.Items.Add(new ListItem("All Tenants", "1"));
                    Att_Level_DropDownList.Items.Add(new ListItem("Tenants in a Specific Building", "2"));
                    Att_Level_DropDownList.Items.Add(new ListItem("Specific Tenants", "3"));
                    Att_Level_DropDownList.Items.Insert(0, "...............");





                    lbl_Titel_SMS.Text = Dt.Rows[45]["EN"].ToString();
                    lbl_Level.Text = Dt.Rows[47]["EN"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[49]["EN"].ToString();
                    lbl_Tenant_Name.Text = Dt.Rows[35]["EN"].ToString();
                    lbl_tenant_NO.Text = Dt.Rows[13]["EN"].ToString();
                    lbl_Tenant_Name_2.Text = Dt.Rows[35]["EN"].ToString();
                    lbl_Text_Sms.Text = Dt.Rows[50]["EN"].ToString();
                    lbl_Titel_Att.Text = Dt.Rows[46]["EN"].ToString();
                    lbl_Att_Level.Text = Dt.Rows[48]["EN"].ToString();
                    lbl_Att_Building_Name.Text = Dt.Rows[49]["EN"].ToString();
                    lbl_Att_Tenant_Name.Text = Dt.Rows[35]["EN"].ToString();
                    lbl_Att.Text = Dt.Rows[51]["EN"].ToString();
                    lbl_Att_Discription.Text = Dt.Rows[52]["EN"].ToString();
                    lbl_Tenan.Text = Dt.Rows[35]["EN"].ToString();
                    lbl_Type.Text = Dt.Rows[53]["EN"].ToString();

                    btn_Send_Sms.Text = Dt.Rows[54]["EN"].ToString();
                    btn_Att.Text = Dt.Rows[55]["EN"].ToString();
                }
                else
                {
                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenan_DropDownList, "Tenants_Arabic_Name", "Tenants_ID");
                    Tenan_DropDownList.Items.Insert(0, "...............");

                    Type_DropDownList.Items.Insert(0, "...............");




                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenant_Name_DropDownList, "Tenants_Arabic_Name", "Tenants_ID");
                    Tenant_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Att_Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Att_Building_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Att_Tenant_Name_DropDownList, "Tenants_Arabic_Name", "Tenants_ID");
                    Att_Tenant_Name_DropDownList.Items.Insert(0, "...............");


                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, DropDownList1, "Tenants_Arabic_Name", "Tenants_Mobile");
                    DropDownList1.Items.Insert(0, "...............");


                    Cheque_GridView.Columns[0].HeaderText = Dt.Rows[35]["AR"].ToString();
                    Cheque_GridView.Columns[1].HeaderText = Dt.Rows[13]["AR"].ToString();


                    //Get Level_DropDownList 
                    Level_DropDownList.Items.Clear();
                    Level_DropDownList.Items.Add(new ListItem("مراسلة كافة العملاء", "1"));
                    Level_DropDownList.Items.Add(new ListItem("مراسلة عملاء في بناء محدد", "2"));
                    Level_DropDownList.Items.Add(new ListItem("مراسلة عميل محدد", "3"));
                    Level_DropDownList.Items.Add(new ListItem("مجموعة عملاء", "4"));
                    Level_DropDownList.Items.Insert(0, "...............");



                    //Get Att_Level_DropDownList 
                    Att_Level_DropDownList.Items.Clear();
                    Att_Level_DropDownList.Items.Add(new ListItem("كافة العملاء", "1"));
                    Att_Level_DropDownList.Items.Add(new ListItem("عملاء في بناء محدد", "2"));
                    Att_Level_DropDownList.Items.Add(new ListItem("عميل محدد", "3"));
                    Att_Level_DropDownList.Items.Insert(0, "...............");



                    lbl_Titel_SMS.Text = Dt.Rows[45]["AR"].ToString();
                    lbl_Level.Text = Dt.Rows[47]["AR"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[49]["AR"].ToString();
                    lbl_Tenant_Name.Text = Dt.Rows[35]["AR"].ToString();
                    lbl_tenant_NO.Text = Dt.Rows[13]["AR"].ToString();
                    lbl_Tenant_Name_2.Text = Dt.Rows[35]["AR"].ToString();
                    lbl_Text_Sms.Text = Dt.Rows[50]["AR"].ToString();
                    lbl_Titel_Att.Text = Dt.Rows[46]["AR"].ToString();
                    lbl_Att_Level.Text = Dt.Rows[48]["AR"].ToString();
                    lbl_Att_Building_Name.Text = Dt.Rows[49]["AR"].ToString();
                    lbl_Att_Tenant_Name.Text = Dt.Rows[35]["AR"].ToString();
                    lbl_Att.Text = Dt.Rows[51]["EN"].ToString();
                    lbl_Att_Discription.Text = Dt.Rows[52]["AR"].ToString();
                    lbl_Tenan.Text = Dt.Rows[35]["AR"].ToString();
                    lbl_Type.Text = Dt.Rows[53]["AR"].ToString();

                    btn_Send_Sms.Text = Dt.Rows[54]["AR"].ToString();
                    btn_Att.Text = Dt.Rows[55]["AR"].ToString();
                }
            }
            _sqlCon.Close();
        }

        protected void tenant_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Titel_Tenants_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Tenants_Name");
                var lbl_Titel_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Type");
                var lbl_Titel_Mounth = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Mounth");
                var lbl_Titel_Year = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Year");
                var lbl_Titel_from = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_from");
                var lbl_Titel_sms = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_sms");
                var lbl_Titel_Att = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Att");
                var lbl_Titel_Not = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Not");



                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_tenant ", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Tenants_Name.Text = Dt.Rows[35]["EN"].ToString();
                        lbl_Titel_Type.Text = Dt.Rows[53]["EN"].ToString();
                        lbl_Titel_Mounth.Text = "Month";
                        lbl_Titel_Year.Text = "Year";
                        lbl_Titel_from.Text = "From";
                        lbl_Titel_sms.Text = Dt.Rows[50]["EN"].ToString();
                        lbl_Titel_Att.Text = Dt.Rows[56]["EN"].ToString();
                        lbl_Titel_Not.Text = Dt.Rows[52]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Titel_Tenants_Name.Text = Dt.Rows[35]["AR"].ToString();
                        lbl_Titel_Type.Text = Dt.Rows[53]["AR"].ToString();
                        lbl_Titel_Mounth.Text = "الشهر";
                        lbl_Titel_Year.Text = "السنة";
                        lbl_Titel_from.Text = "من قبل";
                        lbl_Titel_sms.Text = Dt.Rows[50]["AR"].ToString();
                        lbl_Titel_Att.Text = Dt.Rows[56]["AR"].ToString();
                        lbl_Titel_Not.Text = Dt.Rows[52]["AR"].ToString();
                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Tenants_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_Arabic_Name");
                var lbl_Tenants_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_English_Name");
                var lbl_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Type");
                var lbl_EN_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_EN_Type");
                var lbl_User_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_User_Name");
                var lbl_EN_User_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_EN_User_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Tenants_Arabic_Name.Visible= false; lbl_Tenants_English_Name.Visible= true;
                    lbl_Type.Visible = false; lbl_EN_Type.Visible = true;
                    lbl_User_Name.Visible = false; lbl_EN_User_Name.Visible = true;
                }
                else
                {
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;
                    lbl_Type.Visible = true; lbl_EN_Type.Visible = false;
                    lbl_User_Name.Visible = true; lbl_EN_User_Name.Visible = false;
                }
            }
        }
    }
}