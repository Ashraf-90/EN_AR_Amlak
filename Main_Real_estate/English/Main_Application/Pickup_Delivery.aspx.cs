using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Pickup_Delivery : System.Web.UI.Page
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
                //    //Fill Units Name DropDownList
                Helper.LoadDropDownList("SELECT * FROM units Where Half ='0'", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
                Units_DropDownList.Items.Insert(0, "...............");
            }
                
        }

        protected void btn_Pickup_Delivery_Click(object sender, EventArgs e)
        {
            string addPickup_DeliveryQuary = "Insert Into pickup_delivery " +
                "(Unit_Id , Type , Status , Note , Date , Prosses , Tenant_ID) " +
                "VALUES" +
                "(@Unit_Id , @Type , @Status , @Note , @Date ,  @Prosses , @Tenant_ID)";

            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd = new MySqlCommand(addPickup_DeliveryQuary, _sqlCon);
            addPickup_DeliveryCmd.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd.Parameters.AddWithValue("@Type", "المفاتيح");
            addPickup_DeliveryCmd.Parameters.AddWithValue("@Status", Key_Radio.SelectedValue);
            addPickup_DeliveryCmd.Parameters.AddWithValue("@Note", txt_Key.Text);
            addPickup_DeliveryCmd.Parameters.AddWithValue("@Date",txt_Sign_Date.Text);
            addPickup_DeliveryCmd.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd.ExecuteNonQuery();
            _sqlCon.Close();


            
            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd_2 = new MySqlCommand(addPickup_DeliveryQuary, _sqlCon);
            addPickup_DeliveryCmd_2.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_2.Parameters.AddWithValue("@Type", "الأثاث");
            addPickup_DeliveryCmd_2.Parameters.AddWithValue("@Status", Ferneture_Radio.SelectedValue);
            addPickup_DeliveryCmd_2.Parameters.AddWithValue("@Note", txt_Ferneture.Text);
            addPickup_DeliveryCmd_2.Parameters.AddWithValue("@Date", txt_Sign_Date.Text);
            addPickup_DeliveryCmd_2.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_2.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_2.ExecuteNonQuery();
            _sqlCon.Close();


            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd_3 = new MySqlCommand(addPickup_DeliveryQuary, _sqlCon);
            addPickup_DeliveryCmd_3.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_3.Parameters.AddWithValue("@Type", "الأجهزة المنزلية");
            addPickup_DeliveryCmd_3.Parameters.AddWithValue("@Status", Device_Radio.SelectedValue);
            addPickup_DeliveryCmd_3.Parameters.AddWithValue("@Note", txt_Device.Text);
            addPickup_DeliveryCmd_3.Parameters.AddWithValue("@Date", txt_Sign_Date.Text);
            addPickup_DeliveryCmd_3.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_3.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_3.ExecuteNonQuery();
            _sqlCon.Close();


            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd_4 = new MySqlCommand(addPickup_DeliveryQuary, _sqlCon);
            addPickup_DeliveryCmd_4.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_4.Parameters.AddWithValue("@Type", "المطبخ");
            addPickup_DeliveryCmd_4.Parameters.AddWithValue("@Status", kitchen_Radio.SelectedValue);
            addPickup_DeliveryCmd_4.Parameters.AddWithValue("@Note", txt_kitchen.Text);
            addPickup_DeliveryCmd_4.Parameters.AddWithValue("@Date", txt_Sign_Date.Text);
            addPickup_DeliveryCmd_4.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_4.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_4.ExecuteNonQuery();
            _sqlCon.Close();



            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd_5 = new MySqlCommand(addPickup_DeliveryQuary, _sqlCon);
            addPickup_DeliveryCmd_5.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_5.Parameters.AddWithValue("@Type", "المنافذ الكهربائية");
            addPickup_DeliveryCmd_5.Parameters.AddWithValue("@Status", electricity_Radio.SelectedValue);
            addPickup_DeliveryCmd_5.Parameters.AddWithValue("@Note", txt_electricity.Text);
            addPickup_DeliveryCmd_5.Parameters.AddWithValue("@Date", txt_Sign_Date.Text);
            addPickup_DeliveryCmd_5.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_5.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_5.ExecuteNonQuery();
            _sqlCon.Close();



            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd_6 = new MySqlCommand(addPickup_DeliveryQuary, _sqlCon);
            addPickup_DeliveryCmd_6.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_6.Parameters.AddWithValue("@Type", "الأرضيات");
            addPickup_DeliveryCmd_6.Parameters.AddWithValue("@Status", Floor_Radio.SelectedValue);
            addPickup_DeliveryCmd_6.Parameters.AddWithValue("@Note", txt_Floor.Text);
            addPickup_DeliveryCmd_6.Parameters.AddWithValue("@Date", txt_Sign_Date.Text);
            addPickup_DeliveryCmd_6.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_6.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_6.ExecuteNonQuery();
            _sqlCon.Close();



            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd_7 = new MySqlCommand(addPickup_DeliveryQuary, _sqlCon);
            addPickup_DeliveryCmd_7.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_7.Parameters.AddWithValue("@Type", "الحمامات / غرف الغسيل");
            addPickup_DeliveryCmd_7.Parameters.AddWithValue("@Status", Pathroom_Radio.SelectedValue);
            addPickup_DeliveryCmd_7.Parameters.AddWithValue("@Note", txt_Pathroom.Text);
            addPickup_DeliveryCmd_7.Parameters.AddWithValue("@Date", txt_Sign_Date.Text);
            addPickup_DeliveryCmd_7.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_7.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_7.ExecuteNonQuery();
            _sqlCon.Close();


            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd_8 = new MySqlCommand(addPickup_DeliveryQuary, _sqlCon);
            addPickup_DeliveryCmd_8.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_8.Parameters.AddWithValue("@Type", "الجدران و الأسقف");
            addPickup_DeliveryCmd_8.Parameters.AddWithValue("@Status", Wall_Radio.SelectedValue);
            addPickup_DeliveryCmd_8.Parameters.AddWithValue("@Note", txt_Wall.Text);
            addPickup_DeliveryCmd_8.Parameters.AddWithValue("@Date", txt_Sign_Date.Text);
            addPickup_DeliveryCmd_8.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_8.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_8.ExecuteNonQuery();
            _sqlCon.Close();


            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd_9 = new MySqlCommand(addPickup_DeliveryQuary, _sqlCon);
            addPickup_DeliveryCmd_9.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_9.Parameters.AddWithValue("@Type", "الأبواب");
            addPickup_DeliveryCmd_9.Parameters.AddWithValue("@Status", Door_Radio.SelectedValue);
            addPickup_DeliveryCmd_9.Parameters.AddWithValue("@Note", txt_Dor.Text);
            addPickup_DeliveryCmd_9.Parameters.AddWithValue("@Date", txt_Sign_Date.Text);
            addPickup_DeliveryCmd_9.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_9.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_9.ExecuteNonQuery();
            _sqlCon.Close();



            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd_10 = new MySqlCommand(addPickup_DeliveryQuary, _sqlCon);
            addPickup_DeliveryCmd_10.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_10.Parameters.AddWithValue("@Type", "النوافذ");
            addPickup_DeliveryCmd_10.Parameters.AddWithValue("@Status", Window_Radio.SelectedValue);
            addPickup_DeliveryCmd_10.Parameters.AddWithValue("@Note", txt_Window.Text);
            addPickup_DeliveryCmd_10.Parameters.AddWithValue("@Date", txt_Sign_Date.Text);
            addPickup_DeliveryCmd_10.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_10.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_10.ExecuteNonQuery();
            _sqlCon.Close();



            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd_11 = new MySqlCommand(addPickup_DeliveryQuary, _sqlCon);
            addPickup_DeliveryCmd_11.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_11.Parameters.AddWithValue("@Type", "المكيفات");
            addPickup_DeliveryCmd_11.Parameters.AddWithValue("@Status", AC_Radio.SelectedValue);
            addPickup_DeliveryCmd_11.Parameters.AddWithValue("@Note", txt_AC.Text);
            addPickup_DeliveryCmd_11.Parameters.AddWithValue("@Date", txt_Sign_Date.Text);
            addPickup_DeliveryCmd_11.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_11.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_11.ExecuteNonQuery();
            _sqlCon.Close();





            string addPickup_DeliveryQuary_Dis = "Insert Into pickup_delivery " +
                "(Unit_Id , Type , Status ,  Date , Prosses , Discription , Tenant_ID) " +
                "VALUES" +
                "(@Unit_Id , @Type , @Status ,  @Date ,  @Prosses , @Discription , @Tenant_ID)";
            _sqlCon.Open();
            MySqlCommand addPickup_DeliveryCmd_Dis = new MySqlCommand(addPickup_DeliveryQuary_Dis, _sqlCon);
            addPickup_DeliveryCmd_Dis.Parameters.AddWithValue("@Unit_Id", Units_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_Dis.Parameters.AddWithValue("@Type", "ملاحظات");
            addPickup_DeliveryCmd_Dis.Parameters.AddWithValue("@Status", "0");
            addPickup_DeliveryCmd_Dis.Parameters.AddWithValue("@Discription", txt_Discription.Text);
            addPickup_DeliveryCmd_Dis.Parameters.AddWithValue("@Date", txt_Sign_Date.Text);
            addPickup_DeliveryCmd_Dis.Parameters.AddWithValue("@Prosses", Prosees_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_Dis.Parameters.AddWithValue("@Tenant_ID", Tenan_Name_DropDownList.SelectedValue);
            addPickup_DeliveryCmd_Dis.ExecuteNonQuery();
            _sqlCon.Close();

        }





























        //******************  Get The Building Of Selected Ownership ***************************************************
        protected void Ownership_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["Langues"].ToString() == "1")
            {
                //Fill Buildings Name DropDownList
                Helper.LoadDropDownList(
                "SELECT * FROM building where Active ='1' and owner_ship_Owner_Ship_Id = '" +
                Ownership_Name_DropDownList.SelectedValue + "'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                Building_Name_DropDownList.Items.Insert(0, "...............");
            }
            else
            {
                //Fill Buildings Name DropDownList
                Helper.LoadDropDownList(
                "SELECT * FROM building where Active ='1' and owner_ship_Owner_Ship_Id = '" +
                Ownership_Name_DropDownList.SelectedValue + "'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                Building_Name_DropDownList.Items.Insert(0, "...............");
            }
                   
        }

        //******************  Get The Units Of Selected Building ***************************************************
        protected void Building_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //    //Fill units Name DropDownList
            Helper.LoadDropDownList("SELECT * FROM units where Half ='0' and building_Building_Id = '" + Building_Name_DropDownList.SelectedValue + "'", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
            Units_DropDownList.Items.Insert(0, "...............");
        }

        //******************  Date ***************************************************
        protected void Sign_Date_Calendar_SelectionChanged1(object sender, EventArgs e)
        {
            txt_Sign_Date.Text = Sign_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Sign_Date.Text != "")
            {
                Sign_Date_divCalendar.Visible = false;
                ImageButton1.Visible = false;
            }
        }

        protected void Date_Chosee_Click(object sender, EventArgs e)
        {
            Sign_Date_divCalendar.Visible = true;
            ImageButton1.Visible = true;
        }

        protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Sign_Date_divCalendar.Visible = false;
            ImageButton1.Visible = false;
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
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList,  "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");




                    //Prosees_DropDownList 
                    Prosees_DropDownList.Items.Clear();
                    Prosees_DropDownList.Items.Add(new ListItem("Handing", "2"));
                    Prosees_DropDownList.Items.Add(new ListItem("Receive", "1"));
                    Prosees_DropDownList.Items.Insert(0, "...............");



                    //Key_Radio 
                    Key_Radio.Items.Clear();
                    Key_Radio.Items.Add(new ListItem("Complete", "1"));
                    Key_Radio.Items.Add(new ListItem("Incomplete", "2"));

                    //Ferneture_Radio 
                    Ferneture_Radio.Items.Clear();
                    Ferneture_Radio.Items.Add(new ListItem("Intact", "1"));
                    Ferneture_Radio.Items.Add(new ListItem("Damaged", "2"));


                    //Device_Radio 
                    Device_Radio.Items.Clear();
                    Device_Radio.Items.Add(new ListItem("Intact", "1"));
                    Device_Radio.Items.Add(new ListItem("Damaged", "2"));

                    //kitchen_Radio 
                    kitchen_Radio.Items.Clear();
                    kitchen_Radio.Items.Add(new ListItem("Intact", "1"));
                    kitchen_Radio.Items.Add(new ListItem("Damaged", "2"));

                    //electricity_Radio 
                    electricity_Radio.Items.Clear();
                    electricity_Radio.Items.Add(new ListItem("Intact", "1"));
                    electricity_Radio.Items.Add(new ListItem("Damaged", "2"));

                    //Floor_Radio 
                    Floor_Radio.Items.Clear();
                    Floor_Radio.Items.Add(new ListItem("Intact", "1"));
                    Floor_Radio.Items.Add(new ListItem("Damaged", "2"));

                    //Pathroom_Radio 
                    Pathroom_Radio.Items.Clear();
                    Pathroom_Radio.Items.Add(new ListItem("Intact", "1"));
                    Pathroom_Radio.Items.Add(new ListItem("Damaged", "2"));

                    //Wall_Radio 
                    Wall_Radio.Items.Clear();
                    Wall_Radio.Items.Add(new ListItem("Intact", "1"));
                    Wall_Radio.Items.Add(new ListItem("Damaged", "2"));

                    //Door_Radio 
                    Door_Radio.Items.Clear();
                    Door_Radio.Items.Add(new ListItem("Intact", "1"));
                    Door_Radio.Items.Add(new ListItem("Damaged", "2"));

                    //Window_Radio 
                    Window_Radio.Items.Clear();
                    Window_Radio.Items.Add(new ListItem("Intact", "1"));
                    Window_Radio.Items.Add(new ListItem("Damaged", "2"));

                    //AC_Radio 
                    AC_Radio.Items.Clear();
                    AC_Radio.Items.Add(new ListItem("Intact", "1"));
                    AC_Radio.Items.Add(new ListItem("Damaged", "2"));



                    lbl_Titel.Text = Dt.Rows[85]["EN"].ToString();
                    lbl_Tenan_Name.Text = Dt.Rows[3]["EN"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[83]["EN"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[7]["EN"].ToString();
                    lbl_Units.Text = Dt.Rows[8]["EN"].ToString();
                    lbl_Prosees.Text = Dt.Rows[84]["EN"].ToString();
                    lbl_Sign_Date.Text = Dt.Rows[64]["EN"].ToString();
                    Sign_Date_Chosee.Text = Dt.Rows[67]["EN"].ToString();
                    btn_Pickup_Delivery.Text = "Submit";

                    lbl_Titel_List.Text = Dt.Rows[69]["EN"].ToString() ;
                    lbl_Titel_Status.Text = Dt.Rows[70]["EN"].ToString() ;
                    lbl_Titel_Note.Text = Dt.Rows[71]["EN"].ToString() ;
                    lbl_Key.Text = Dt.Rows[72]["EN"].ToString() ;
                    lbl_Ferneture.Text = Dt.Rows[73]["EN"].ToString() ;
                    lbl_Device.Text = Dt.Rows[74]["EN"].ToString() ;
                    lbl_kitchen.Text = Dt.Rows[75]["EN"].ToString() ;
                    lbl_electricity.Text = Dt.Rows[76]["EN"].ToString() ;
                    lbl_Floor.Text = Dt.Rows[77]["EN"].ToString() ;
                    lbl_Pathroom.Text = Dt.Rows[78]["EN"].ToString() ;
                    lbl_Wall.Text = Dt.Rows[79]["EN"].ToString() ;
                    lbl_Door.Text = Dt.Rows[80]["EN"].ToString() ;
                    lbl_Window.Text = Dt.Rows[81]["EN"].ToString() ;
                    lbl_AC.Text = Dt.Rows[82]["EN"].ToString() ;
                    lbl_Discription.Text = Dt.Rows[71]["EN"].ToString() ;


                    Tenan_Name_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Ownership_Name_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Building_Name_RequiredFieldValidator.ErrorMessage = "* Required ";
                    RequiredFieldValidator1.ErrorMessage = "* Required ";
                    RequiredFieldValidator2.ErrorMessage = "* Required ";

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
                    Prosees_DropDownList.Items.Add(new ListItem("تسليم", "2"));
                    Prosees_DropDownList.Items.Add(new ListItem("إستلام", "1"));
                    Prosees_DropDownList.Items.Insert(0, "...............");




                    //Key_Radio 
                    Key_Radio.Items.Clear();
                    Key_Radio.Items.Add(new ListItem("كاملة", "1"));
                    Key_Radio.Items.Add(new ListItem("ناقصة", "2"));

                    //Ferneture_Radio 
                    Ferneture_Radio.Items.Clear();
                    Ferneture_Radio.Items.Add(new ListItem("سليم", "1"));
                    Ferneture_Radio.Items.Add(new ListItem("متضرر", "2"));


                    //Device_Radio 
                    Device_Radio.Items.Clear();
                    Device_Radio.Items.Add(new ListItem("سليم", "1"));
                    Device_Radio.Items.Add(new ListItem("متضرر", "2"));

                    //kitchen_Radio 
                    kitchen_Radio.Items.Clear();
                    kitchen_Radio.Items.Add(new ListItem("سليم", "1"));
                    kitchen_Radio.Items.Add(new ListItem("متضرر", "2"));

                    //electricity_Radio 
                    electricity_Radio.Items.Clear();
                    electricity_Radio.Items.Add(new ListItem("سليم", "1"));
                    electricity_Radio.Items.Add(new ListItem("متضرر", "2"));

                    //Floor_Radio 
                    Floor_Radio.Items.Clear();
                    Floor_Radio.Items.Add(new ListItem("سليم", "1"));
                    Floor_Radio.Items.Add(new ListItem("متضرر", "2"));

                    //Pathroom_Radio 
                    Pathroom_Radio.Items.Clear();
                    Pathroom_Radio.Items.Add(new ListItem("سليم", "1"));
                    Pathroom_Radio.Items.Add(new ListItem("متضرر", "2"));

                    //Wall_Radio 
                    Wall_Radio.Items.Clear();
                    Wall_Radio.Items.Add(new ListItem("سليم", "1"));
                    Wall_Radio.Items.Add(new ListItem("متضرر", "2"));

                    //Door_Radio 
                    Door_Radio.Items.Clear();
                    Door_Radio.Items.Add(new ListItem("سليم", "1"));
                    Door_Radio.Items.Add(new ListItem("متضرر", "2"));

                    //Window_Radio 
                    Window_Radio.Items.Clear();
                    Window_Radio.Items.Add(new ListItem("سليم", "1"));
                    Window_Radio.Items.Add(new ListItem("متضرر", "2"));

                    //AC_Radio 
                    AC_Radio.Items.Clear();
                    AC_Radio.Items.Add(new ListItem("سليم", "1"));
                    AC_Radio.Items.Add(new ListItem("متضرر", "2"));

                    lbl_Titel.Text = Dt.Rows[85]["AR"].ToString();
                    lbl_Tenan_Name.Text = Dt.Rows[3]["AR"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[83]["AR"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[7]["AR"].ToString();
                    lbl_Units.Text = Dt.Rows[8]["AR"].ToString();
                    lbl_Prosees.Text = Dt.Rows[84]["AR"].ToString();
                    lbl_Sign_Date.Text = Dt.Rows[64]["AR"].ToString();
                    Sign_Date_Chosee.Text = Dt.Rows[67]["AR"].ToString();
                    btn_Pickup_Delivery.Text = "إضافة";


                    lbl_Titel_List.Text = Dt.Rows[69]["AR"].ToString();
                    lbl_Titel_Status.Text = Dt.Rows[70]["AR"].ToString();
                    lbl_Titel_Note.Text = Dt.Rows[71]["AR"].ToString();
                    lbl_Key.Text = Dt.Rows[72]["AR"].ToString();
                    lbl_Ferneture.Text = Dt.Rows[73]["AR"].ToString();
                    lbl_Device.Text = Dt.Rows[74]["AR"].ToString();
                    lbl_kitchen.Text = Dt.Rows[75]["AR"].ToString();
                    lbl_electricity.Text = Dt.Rows[76]["AR"].ToString();
                    lbl_Floor.Text = Dt.Rows[77]["AR"].ToString();
                    lbl_Pathroom.Text = Dt.Rows[78]["AR"].ToString();
                    lbl_Wall.Text = Dt.Rows[79]["AR"].ToString();
                    lbl_Door.Text = Dt.Rows[80]["AR"].ToString();
                    lbl_Window.Text = Dt.Rows[81]["AR"].ToString();
                    lbl_AC.Text = Dt.Rows[82]["AR"].ToString();
                    lbl_Discription.Text = Dt.Rows[71]["AR"].ToString();


                    Tenan_Name_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Ownership_Name_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Building_Name_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    RequiredFieldValidator1.ErrorMessage = "*مطلوب ";
                    RequiredFieldValidator2.ErrorMessage = "*مطلوب ";

                }
            }
            _sqlCon.Close();

        }
    }
}