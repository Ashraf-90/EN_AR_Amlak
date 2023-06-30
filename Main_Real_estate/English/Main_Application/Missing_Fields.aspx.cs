using Antlr.Runtime.Misc;
using Main_Real_estate.English.Master_Panal;
using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.Services.Description;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Missing_Fields : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Deficiency_Detection", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();
                Ownership_All_List_BindData();
                Ownership_INFO_List_BindData();
                Ownership_Att_List_BindData();

                Building_All_List_BindData();
                Building_Info_List_BindData();
                Building_Att_List_BindData();

                Units_List_BindData();
            }
                
        }
        //-----------------------------------------------------------------------------------------
        protected void Ownership_All_List_BindData(string sortExpression = null)
        {
            string get_OwnerShip_Lists_Quari = "SELECT Owner_Ship_Id, Owner_Ship_AR_Name , Owner_Ship_EN_Name , owner_ship_Code , " +
                "Bond_NO , Parcel_Area , Street_Name , Street_NO , Bond_Date ,owner_ship_Certificate_Image , Property_Scheme_Image , " +
                "IF(Bond_NO !='', Bond_NO, '✘')R_Bond_NO , " +
                "IF(Parcel_Area !='', Parcel_Area, '✘')R_Parcel_Area , " +
                " IF(Bond_Date !='', Bond_Date, '✘')R_Bond_Date , " +
                " IF(Street_Name !='', Street_Name, '✘')R_Street_Name , " +
                " IF(Street_NO !='', Street_NO, '✘')R_Street_NO, " +
                " IF(owner_ship_Certificate_Image !='No File', owner_ship_Certificate_Image, '✘')R_owner_ship_Certificate_Image , " +
                "IF(Property_Scheme_Image !='No File', Property_Scheme_Image, '✘')R_Property_Scheme_Image " +
                "FROM owner_ship " +
                " where Bond_NO ='' or Parcel_Area = '' or Street_Name = '' or Street_NO = '' " +
                "or Bond_Date = '' or owner_ship_Certificate_Image ='No File' or Property_Scheme_Image = 'No File'";
            MySqlCommand get_OwnerShip_Lists_Cmd = new MySqlCommand(get_OwnerShip_Lists_Quari, _sqlCon);
            MySqlDataAdapter get_OwnerShip_Lists_Dt = new MySqlDataAdapter(get_OwnerShip_Lists_Cmd);
            get_OwnerShip_Lists_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_OwnerShip_Lists_Dt.SelectCommand = get_OwnerShip_Lists_Cmd;
            DataTable get_OwnerShip_Lists_DataTable = new DataTable();
            get_OwnerShip_Lists_Dt.Fill(get_OwnerShip_Lists_DataTable);
            Ownership_ALL.DataSource = get_OwnerShip_Lists_DataTable;
            Ownership_ALL.DataBind();
            _sqlCon.Close();

        }
        protected void Ownership_INFO_List_BindData(string sortExpression = null)
        {
                string get_OwnerShip_Lists_Quari = "SELECT Owner_Ship_Id , Owner_Ship_AR_Name , Owner_Ship_EN_Name , owner_ship_Code ,  Bond_NO , Parcel_Area , Street_Name , Street_NO , Bond_Date , " +
                "IF(Bond_NO !='', Bond_NO, '✘')R_Bond_NO , " +
                " IF(Parcel_Area !='', Parcel_Area, '✘')R_Parcel_Area , " +
                " IF(Bond_Date !='', Bond_Date, '✘')R_Bond_Date , " +
                "IF(Street_Name !='', Street_Name, '✘')R_Street_Name , " +
                " IF(Street_NO !='', Street_NO, '✘')R_Street_NO  " +
                "FROM owner_ship " +
                "where Bond_NO ='' or Parcel_Area = '' or Street_Name = '' or Street_NO = '' or Bond_Date = ''";
                MySqlCommand get_OwnerShip_Lists_Cmd = new MySqlCommand(get_OwnerShip_Lists_Quari, _sqlCon);
                MySqlDataAdapter get_OwnerShip_Lists_Dt = new MySqlDataAdapter(get_OwnerShip_Lists_Cmd);
                get_OwnerShip_Lists_Cmd.Connection = _sqlCon;
                _sqlCon.Open();
                get_OwnerShip_Lists_Dt.SelectCommand = get_OwnerShip_Lists_Cmd;
                DataTable get_OwnerShip_Lists_DataTable = new DataTable();
                get_OwnerShip_Lists_Dt.Fill(get_OwnerShip_Lists_DataTable);
                Ownership_Info_List.DataSource = get_OwnerShip_Lists_DataTable;
                Ownership_Info_List.DataBind();
            _sqlCon.Close();
        }
        protected void Ownership_Att_List_BindData(string sortExpression = null)
        {
            string get_OwnerShip_Lists_Quari = "SELECT Owner_Ship_Id, Owner_Ship_AR_Name , Owner_Ship_EN_Name , owner_ship_Code ,  owner_ship_Certificate_Image , Property_Scheme_Image , " +
                "IF(owner_ship_Certificate_Image !='No File', owner_ship_Certificate_Image, '✘')R_owner_ship_Certificate_Image , " +
                "IF(Property_Scheme_Image !='No File', Property_Scheme_Image, '✘')R_Property_Scheme_Image " +
                " FROM owner_ship " +
                "where owner_ship_Certificate_Image ='No File' or Property_Scheme_Image = 'No File'";
            MySqlCommand get_OwnerShip_Lists_Cmd = new MySqlCommand(get_OwnerShip_Lists_Quari, _sqlCon);
            MySqlDataAdapter get_OwnerShip_Lists_Dt = new MySqlDataAdapter(get_OwnerShip_Lists_Cmd);
            get_OwnerShip_Lists_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_OwnerShip_Lists_Dt.SelectCommand = get_OwnerShip_Lists_Cmd;
            DataTable get_OwnerShip_Lists_DataTable = new DataTable();
            get_OwnerShip_Lists_Dt.Fill(get_OwnerShip_Lists_DataTable);
            Ownership_Att_List.DataSource = get_OwnerShip_Lists_DataTable;
            Ownership_Att_List.DataBind();
            _sqlCon.Close();

        }
        
        protected void LinK_Owner_Ship_Arabic_Name_Click(object sender, EventArgs e)
        {
            DataTable Dt = new DataTable();
            _sqlCon.Open();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM roles WHERE Role_ID = @ID", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Cmd.Parameters.AddWithValue("@ID", Session["Role"].ToString());
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                string[] Page = Dt.Rows[0]["Deficiency_Detection"].ToString().Split(',');
                if (Page[2] == "E") 
                {
                    Session["OW_Back"] = "3";
                    string id = (sender as LinkButton).CommandArgument;
                    Response.Redirect("Edit_Ownership.aspx?Id=" + id);
                }
            }
            _sqlCon.Close();


           
        }
        //-----------------------------------------------------------------------------------------
        protected void Building_All_List_BindData(string sortExpression = null)
        {

            string get_Building_Lists_Quari = "select  Building_Arabic_Name , Building_English_Name , Building_Id , " +
                "IF(Building_NO != '', Building_NO, '✘')Building_NO ,  " +
                "IF(Construction_Area != '', Construction_Area, '✘')Construction_Area , " +
                " IF(Maintenance_status != '', Maintenance_status, '✘')Maintenance_status , " +
                "IF(electricity_meter != '', electricity_meter, '✘')electricity_meter , " +
                "IF(Water_meter != '', Water_meter, '✘')Water_meter , " +
                "IF(Construction_Completion_Date != '', Construction_Completion_Date, '✘')Construction_Completion_Date , " +
                "IF(Building_Photo != 'No File', Building_Photo, '✘')Building_Photo , " +
                "IF(Entrance_Photo != 'No File', Entrance_Photo, '✘')Entrance_Photo , " +
                "IF(Building_Permit != 'No File', Building_Permit, '✘')Building_Permit , " +
                "IF(certificate_of_completion != 'No File', certificate_of_completion, '✘')certificate_of_completion , " +
                "IF(Map != 'No File', Map, '✘')Map , " +
                "IF(Plan != 'No File', Plan, '✘')Plan " +
                " from building where Active != '0'  " +
                "and ( Building_NO='' or   Construction_Area='' or   Maintenance_status='' or   electricity_meter='' or   Water_meter='' or  " +
                "Construction_Completion_Date='' or   Building_Photo='No File' or   Entrance_Photo='No File' or  Building_Permit='No File' or  " +
                " certificate_of_completion='No File'" +
                " or   Map='No File' or Plan='No File'  )";
            MySqlCommand get_Building_Lists_Cmd = new MySqlCommand(get_Building_Lists_Quari, _sqlCon);
            MySqlDataAdapter get_Building_Lists_Dt = new MySqlDataAdapter(get_Building_Lists_Cmd);
            get_Building_Lists_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_Building_Lists_Dt.SelectCommand = get_Building_Lists_Cmd;
            DataTable get_Building_Lists_DataTable = new DataTable();
            get_Building_Lists_Dt.Fill(get_Building_Lists_DataTable);
            Building_All_List.DataSource = get_Building_Lists_DataTable;
            Building_All_List.DataBind();
            _sqlCon.Close();

        }
        protected void Building_Info_List_BindData(string sortExpression = null)
        {

            string get_Building_Lists_Quari = "select  Building_Arabic_Name , Building_English_Name , Building_Id , " +
                "IF(Building_NO != '', Building_NO, '✘')Building_NO , " +
                "IF(Construction_Area != '', Construction_Area, '✘')Construction_Area , " +
                "IF(Maintenance_status != '', Maintenance_status, '✘')Maintenance_status , " +
                " IF(electricity_meter != '', electricity_meter, '✘')electricity_meter , " +
                "IF(Water_meter != '', Water_meter, '✘')Water_meter , " +
                "IF(Construction_Completion_Date != '', Construction_Completion_Date, '✘')Construction_Completion_Date " +
                "from building where Active != '0' and(Building_NO = '' or Construction_Area = '' or " +
                "Maintenance_status = '' or electricity_meter = '' or " +
                "Water_meter = '' or Construction_Completion_Date = '')";
            MySqlCommand get_Building_Lists_Cmd = new MySqlCommand(get_Building_Lists_Quari, _sqlCon);
            MySqlDataAdapter get_Building_Lists_Dt = new MySqlDataAdapter(get_Building_Lists_Cmd);
            get_Building_Lists_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_Building_Lists_Dt.SelectCommand = get_Building_Lists_Cmd;
            DataTable get_Building_Lists_DataTable = new DataTable();
            get_Building_Lists_Dt.Fill(get_Building_Lists_DataTable);
            Building_Info_List.DataSource = get_Building_Lists_DataTable;
            Building_Info_List.DataBind();
            _sqlCon.Close();

        }
        protected void Building_Att_List_BindData(string sortExpression = null)
        {

            string get_Building_Lists_Quari = "select  Building_Arabic_Name , Building_English_Name , Building_Id , Building_NO ," +
                "IF(Building_Photo != 'No File', Building_Photo, '✘')Building_Photo , " +
                " IF(Entrance_Photo != 'No File', Entrance_Photo, '✘')Entrance_Photo , " +
                "IF(Building_Permit != 'No File', Building_Permit, '✘')Building_Permit , " +
                "IF(certificate_of_completion != 'No File', certificate_of_completion, '✘')certificate_of_completion , " +
                "IF(Map != 'No File', Map, '✘')Map , " +
                "IF(Plan != 'No File', Plan, '✘')Plan " +
                "from building where Active != '0' " +
                " and ( Building_Photo='No File' or   Entrance_Photo='No File' or " +
                "Building_Permit='No File' or   certificate_of_completion='No File' or " +
                " Map='No File' or   Plan='No File')";
            MySqlCommand get_Building_Lists_Cmd = new MySqlCommand(get_Building_Lists_Quari, _sqlCon);
            MySqlDataAdapter get_Building_Lists_Dt = new MySqlDataAdapter(get_Building_Lists_Cmd);
            get_Building_Lists_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_Building_Lists_Dt.SelectCommand = get_Building_Lists_Cmd;
            DataTable get_Building_Lists_DataTable = new DataTable();
            get_Building_Lists_Dt.Fill(get_Building_Lists_DataTable);
            Building_Att_List.DataSource = get_Building_Lists_DataTable;
            Building_Att_List.DataBind();
            _sqlCon.Close();

        }
        protected void LinK_Building_Arabic_Name_Click(object sender, EventArgs e)
        {

            DataTable Dt = new DataTable();
            _sqlCon.Open();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM roles WHERE Role_ID = @ID", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Cmd.Parameters.AddWithValue("@ID", Session["Role"].ToString());
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                string[] Page = Dt.Rows[0]["Deficiency_Detection"].ToString().Split(',');
                if (Page[2] == "E")
                {
                    Session["B_Back"] = "3";
                    string id = (sender as LinkButton).CommandArgument;
                    Response.Redirect("Edit_Building.aspx?Id=" + id);
                }
            }
            _sqlCon.Close();




            
        }
        //-----------------------------------------------------------------------------------------
        protected void Units_List_BindData(string sortExpression = null)
        {
            try
            {
                string get_Units_Lists_Quari = "select  Unit_ID , Unit_Number , " +
                    "IF(current_situation != '', current_situation, '✘')current_situation , " +
                    " IF(Oreedo_Number != '', Oreedo_Number, '✘')Oreedo_Number , " +
                    "IF(Electricityt_Number != '', Electricityt_Number, '✘')Electricityt_Number , " +
                    " IF(Water_Number != '', Water_Number, '✘')Water_Number , " +
                    "IF(virtual_Value != '0', virtual_Value, '✘')virtual_Value " +
                    "from units where Half != '1' and ( current_situation = '' or Oreedo_Number = '' or " +
                    "Electricityt_Number = '' or Water_Number = '' or virtual_Value = '') ";
                MySqlCommand get_Units_Lists_Cmd = new MySqlCommand(get_Units_Lists_Quari, _sqlCon);
                MySqlDataAdapter get_Units_Lists_Dt = new MySqlDataAdapter(get_Units_Lists_Cmd);
                get_Units_Lists_Cmd.Connection = _sqlCon;
                _sqlCon.Open();
                get_Units_Lists_Dt.SelectCommand = get_Units_Lists_Cmd;
                DataTable get_Units_Lists_DataTable = new DataTable();
                get_Units_Lists_Dt.Fill(get_Units_Lists_DataTable);
                Unit_List.DataSource = get_Units_Lists_DataTable;
                Unit_List.DataBind();
                _sqlCon.Close();
            }
            catch (Exception ex)
            {
            }
        }
        protected void LinK_Unit_Arabic_Name_Click(object sender, EventArgs e)
        {
            DataTable Dt = new DataTable();
            _sqlCon.Open();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM roles WHERE Role_ID = @ID", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Cmd.Parameters.AddWithValue("@ID", Session["Role"].ToString());
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                string[] Page = Dt.Rows[0]["Deficiency_Detection"].ToString().Split(',');
                if (Page[2] == "E")
                {
                    Session["U_Back"] = "3";
                    string id = (sender as LinkButton).CommandArgument;
                    Response.Redirect("Edit_Units.aspx?Id=" + id);
                }
            }
            _sqlCon.Close();




            
        }
        //-----------------------------------------------------------------------------------------
        protected void A_1_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible = true; B_Arcive.Visible=false; U_Arcive.Visible=false;
        }
        protected void A_2_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible = false; B_Arcive.Visible = true; U_Arcive.Visible = false;
        }
        protected void A_3_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible = false; B_Arcive.Visible = false; U_Arcive.Visible = true;
        }
        protected void A_4_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible = true; B_Arcive.Visible = true; U_Arcive.Visible = true;
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Filter_DropDownList.SelectedValue == "2")
            {
                Ownership_Info_Div.Visible= true; Ownership_Att_Div.Visible = false; Ownership_ALL_Div.Visible = false;
                Building_Info_Div.Visible= true; Building_Att_Div.Visible= false; Building_All_Div.Visible = false;
            }
            else if (Filter_DropDownList.SelectedValue == "3")
            {
                Ownership_Info_Div.Visible = false; Ownership_Att_Div.Visible = true; Ownership_ALL_Div.Visible = false;
                Building_Info_Div.Visible = false; Building_Att_Div.Visible = true; Building_All_Div.Visible = false;

                
            }
            else if (Filter_DropDownList.SelectedValue == "1")
            {
                Ownership_Info_Div.Visible = false; Ownership_Att_Div.Visible = false; Ownership_ALL_Div.Visible = true;
                Building_Info_Div.Visible = false; Building_Att_Div.Visible = false; Building_All_Div.Visible = true;

            }
        }

        protected void Ownership_Info_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_titel_Property_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Property_Name");
                var lbl_titel_Property_Code = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Property_Code");
                var lbl_titel_BIN = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_BIN");
                var lbl_titel_Area = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Area");
                var lbl_titel_Street_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Street_Name");
                var lbl_titel_Street_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Street_NO");
                var lbl_titel_Bond_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Bond_Date");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_titel_Property_Name.Text = Dt.Rows[44]["EN"].ToString();
                        lbl_titel_Property_Code.Text = Dt.Rows[37]["EN"].ToString();
                        lbl_titel_BIN.Text = Dt.Rows[39]["EN"].ToString();
                        lbl_titel_Area.Text = Dt.Rows[40]["EN"].ToString();
                        lbl_titel_Street_Name.Text = Dt.Rows[49]["EN"].ToString();
                        lbl_titel_Street_NO.Text = Dt.Rows[48]["EN"].ToString();
                        lbl_titel_Bond_Date.Text = Dt.Rows[50]["EN"].ToString();
                    }
                    else
                    {
                        lbl_titel_Property_Name.Text = Dt.Rows[44]["AR"].ToString();
                        lbl_titel_Property_Code.Text = Dt.Rows[37]["AR"].ToString();
                        lbl_titel_BIN.Text = Dt.Rows[39]["AR"].ToString();
                        lbl_titel_Area.Text = Dt.Rows[40]["AR"].ToString();
                        lbl_titel_Street_Name.Text = Dt.Rows[49]["AR"].ToString();
                        lbl_titel_Street_NO.Text = Dt.Rows[48]["AR"].ToString();
                        lbl_titel_Bond_Date.Text = Dt.Rows[50]["AR"].ToString();
                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var LinK_Owner_Ship_Arabic_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Owner_Ship_Arabic_Name");
                var LinK_Owner_Ship_English_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Owner_Ship_English_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    LinK_Owner_Ship_Arabic_Name.Visible= false; LinK_Owner_Ship_English_Name.Visible= true;
                }
                else
                {
                    LinK_Owner_Ship_Arabic_Name.Visible = true; LinK_Owner_Ship_English_Name.Visible = false;
                }
            }


        }

        protected void Ownership_Att_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_titel_Property_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Property_Name");
                var lbl_titel_Property_Code = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Property_Code");
                var lbl_titel_Property_Bond = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Property_Bond");
                var lbl_titel_Property_Scheme = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Property_Scheme");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_titel_Property_Name.Text = Dt.Rows[44]["EN"].ToString();
                        lbl_titel_Property_Code.Text = Dt.Rows[37]["EN"].ToString();
                        lbl_titel_Property_Bond.Text = Dt.Rows[51]["EN"].ToString();
                        lbl_titel_Property_Scheme.Text = Dt.Rows[52]["EN"].ToString();
                    }
                    else
                    {
                        lbl_titel_Property_Name.Text = Dt.Rows[44]["AR"].ToString();
                        lbl_titel_Property_Code.Text = Dt.Rows[37]["AR"].ToString();
                        lbl_titel_Property_Bond.Text = Dt.Rows[51]["AR"].ToString();
                        lbl_titel_Property_Scheme.Text = Dt.Rows[52]["AR"].ToString();
                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var LinK_Owner_Ship_Arabic_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Owner_Ship_Arabic_Name");
                var LinK_Owner_Ship_Englsih_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Owner_Ship_Englsih_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    LinK_Owner_Ship_Arabic_Name.Visible = false; LinK_Owner_Ship_Englsih_Name.Visible = true;
                }
                else
                {
                    LinK_Owner_Ship_Arabic_Name.Visible = true; LinK_Owner_Ship_Englsih_Name.Visible = false;
                }
            }
        }

        protected void Ownership_ALL_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_titel_Property_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Property_Name");
                var lbl_titel_Property_Code = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Property_Code");
                var lbl_titel_BIN = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_BIN");
                var lbl_titel_Area = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Area");
                var lbl_titel_Street_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Street_Name");
                var lbl_titel_Street_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Street_NO");
                var lbl_titel_Bond_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Bond_Date");
                var lbl_titel_Property_Bond = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Property_Bond");
                var lbl_titel_Property_Scheme = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_titel_Property_Scheme");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_titel_Property_Name.Text = Dt.Rows[44]["EN"].ToString();
                        lbl_titel_Property_Code.Text = Dt.Rows[37]["EN"].ToString();
                        lbl_titel_BIN.Text = Dt.Rows[39]["EN"].ToString();
                        lbl_titel_Area.Text = Dt.Rows[40]["EN"].ToString();
                        lbl_titel_Street_Name.Text = Dt.Rows[49]["EN"].ToString();
                        lbl_titel_Street_NO.Text = Dt.Rows[48]["EN"].ToString();
                        lbl_titel_Bond_Date.Text = Dt.Rows[50]["EN"].ToString();
                        lbl_titel_Property_Bond.Text = Dt.Rows[51]["EN"].ToString();
                        lbl_titel_Property_Scheme.Text = Dt.Rows[52]["EN"].ToString();
                    }
                    else
                    {
                        lbl_titel_Property_Name.Text = Dt.Rows[44]["AR"].ToString();
                        lbl_titel_Property_Code.Text = Dt.Rows[37]["AR"].ToString();
                        lbl_titel_BIN.Text = Dt.Rows[39]["AR"].ToString();
                        lbl_titel_Area.Text = Dt.Rows[40]["AR"].ToString();
                        lbl_titel_Street_Name.Text = Dt.Rows[49]["AR"].ToString();
                        lbl_titel_Street_NO.Text = Dt.Rows[48]["AR"].ToString();
                        lbl_titel_Bond_Date.Text = Dt.Rows[50]["AR"].ToString();
                        lbl_titel_Property_Bond.Text = Dt.Rows[51]["AR"].ToString();
                        lbl_titel_Property_Scheme.Text = Dt.Rows[52]["AR"].ToString();
                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var LinK_Owner_Ship_Arabic_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Owner_Ship_Arabic_Name");
                var LinK_Owner_Ship_Englsih_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Owner_Ship_Englsih_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    LinK_Owner_Ship_Arabic_Name.Visible = false; LinK_Owner_Ship_Englsih_Name.Visible = true;
                }
                else
                {
                    LinK_Owner_Ship_Arabic_Name.Visible = true; LinK_Owner_Ship_Englsih_Name.Visible = false;
                }
            }
        }


        //*******************************************************************************************************************************************

        protected void Building_Info_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Titel_Building_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Name");
                var lbl_Titel_Building_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_NO");
                var lbl_Titel_Building_Area = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Area");
                var lbl_Titel_Maintenance = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Maintenance");
                var lbl_Titel_Electricity = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Electricity");
                var lbl_Titel_Water = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Water");
                var lbl_Titel_Completion_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Completion_Date");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Building_Name.Text = Dt.Rows[59]["EN"].ToString();
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["EN"].ToString();
                        lbl_Titel_Building_Area.Text = Dt.Rows[60]["EN"].ToString();
                        lbl_Titel_Maintenance.Text = Dt.Rows[63]["EN"].ToString();
                        lbl_Titel_Electricity.Text = Dt.Rows[65]["EN"].ToString();
                        lbl_Titel_Water.Text = Dt.Rows[64]["EN"].ToString();
                        lbl_Titel_Completion_Date.Text = Dt.Rows[66]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Titel_Building_Name.Text = Dt.Rows[59]["AR"].ToString();
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["AR"].ToString();
                        lbl_Titel_Building_Area.Text = Dt.Rows[60]["AR"].ToString();
                        lbl_Titel_Maintenance.Text = Dt.Rows[63]["AR"].ToString();
                        lbl_Titel_Electricity.Text = Dt.Rows[65]["AR"].ToString();
                        lbl_Titel_Water.Text = Dt.Rows[64]["AR"].ToString();
                        lbl_Titel_Completion_Date.Text = Dt.Rows[66]["AR"].ToString();

                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var LinK_Building_Arabic_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Building_Arabic_Name");
                var LinK_Building_English_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Building_English_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    LinK_Building_Arabic_Name.Visible = false; LinK_Building_English_Name.Visible = true;
                }
                else
                {
                    LinK_Building_Arabic_Name.Visible = true; LinK_Building_English_Name.Visible = false;
                }
            }
        }

        protected void Building_Att_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Titel_Building_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Name");
                var lbl_Titel_Building_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_NO");

                var lbl_Titel_Building_Photo = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Photo");
                var lbl_Titel_Entrance_Photo = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Entrance_Photo");
                var lbl_Titel_Building_Permit = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Permit");
                var lbl_Titel_certificate_of_completion = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_certificate_of_completion");
                var lbl_Titel_Map = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Map");
                var lbl_Titel_Plan = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Plan");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Building_Name.Text = Dt.Rows[59]["EN"].ToString();
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["EN"].ToString();

                        lbl_Titel_Building_Photo.Text = Dt.Rows[68]["EN"].ToString();
                        lbl_Titel_Entrance_Photo.Text = Dt.Rows[74]["EN"].ToString();
                        lbl_Titel_Building_Permit.Text = Dt.Rows[72]["EN"].ToString();
                        lbl_Titel_certificate_of_completion.Text = Dt.Rows[73]["EN"].ToString();
                        lbl_Titel_Map.Text = Dt.Rows[71]["EN"].ToString();
                        lbl_Titel_Plan.Text = Dt.Rows[69]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Titel_Building_Name.Text = Dt.Rows[59]["AR"].ToString();
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["AR"].ToString();

                        lbl_Titel_Building_Photo.Text = Dt.Rows[68]["AR"].ToString();
                        lbl_Titel_Entrance_Photo.Text = Dt.Rows[74]["AR"].ToString();
                        lbl_Titel_Building_Permit.Text = Dt.Rows[72]["AR"].ToString();
                        lbl_Titel_certificate_of_completion.Text = Dt.Rows[73]["AR"].ToString();
                        lbl_Titel_Map.Text = Dt.Rows[71]["AR"].ToString();
                        lbl_Titel_Plan.Text = Dt.Rows[69]["AR"].ToString();

                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var LinK_Building_Arabic_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Building_Arabic_Name");
                var LinK_Building_English_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Building_English_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    LinK_Building_Arabic_Name.Visible = false; LinK_Building_English_Name.Visible = true;
                }
                else
                {
                    LinK_Building_Arabic_Name.Visible = true; LinK_Building_English_Name.Visible = false;
                }
            }
        }

        protected void Building_All_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Titel_Building_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Name");
                var lbl_Titel_Building_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_NO");

                var lbl_Titel_Building_Area = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Area");
                var lbl_Titel_Maintenance = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Maintenance");
                var lbl_Titel_Electricity = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Electricity");
                var lbl_Titel_Water = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Water");
                var lbl_Titel_Completion_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Completion_Date");

                var lbl_Titel_Building_Photo = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Photo");
                var lbl_Titel_Entrance_Photo = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Entrance_Photo");
                var lbl_Titel_Building_Permit = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Permit");
                var lbl_Titel_certificate_of_completion = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_certificate_of_completion");
                var lbl_Titel_Map = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Map");
                var lbl_Titel_Plan = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Plan");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Building_Name.Text = Dt.Rows[59]["EN"].ToString();
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["EN"].ToString();

                        lbl_Titel_Building_Area.Text = Dt.Rows[60]["EN"].ToString();
                        lbl_Titel_Maintenance.Text = Dt.Rows[63]["EN"].ToString();
                        lbl_Titel_Electricity.Text = Dt.Rows[65]["EN"].ToString();
                        lbl_Titel_Water.Text = Dt.Rows[64]["EN"].ToString();
                        lbl_Titel_Completion_Date.Text = Dt.Rows[66]["EN"].ToString();

                        lbl_Titel_Building_Photo.Text = Dt.Rows[68]["EN"].ToString();
                        lbl_Titel_Entrance_Photo.Text = Dt.Rows[74]["EN"].ToString();
                        lbl_Titel_Building_Permit.Text = Dt.Rows[72]["EN"].ToString();
                        lbl_Titel_certificate_of_completion.Text = Dt.Rows[73]["EN"].ToString();
                        lbl_Titel_Map.Text = Dt.Rows[71]["EN"].ToString();
                        lbl_Titel_Plan.Text = Dt.Rows[69]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Titel_Building_Name.Text = Dt.Rows[59]["AR"].ToString();
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["AR"].ToString();

                        lbl_Titel_Building_Area.Text = Dt.Rows[60]["AR"].ToString();
                        lbl_Titel_Maintenance.Text = Dt.Rows[63]["AR"].ToString();
                        lbl_Titel_Electricity.Text = Dt.Rows[65]["AR"].ToString();
                        lbl_Titel_Water.Text = Dt.Rows[64]["AR"].ToString();
                        lbl_Titel_Completion_Date.Text = Dt.Rows[66]["AR"].ToString();

                        lbl_Titel_Building_Photo.Text = Dt.Rows[68]["AR"].ToString();
                        lbl_Titel_Entrance_Photo.Text = Dt.Rows[74]["AR"].ToString();
                        lbl_Titel_Building_Permit.Text = Dt.Rows[72]["AR"].ToString();
                        lbl_Titel_certificate_of_completion.Text = Dt.Rows[73]["AR"].ToString();
                        lbl_Titel_Map.Text = Dt.Rows[71]["AR"].ToString();
                        lbl_Titel_Plan.Text = Dt.Rows[69]["AR"].ToString();

                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var LinK_Building_Arabic_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Building_Arabic_Name");
                var LinK_Building_English_Name = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("LinK_Building_English_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    LinK_Building_Arabic_Name.Visible = false; LinK_Building_English_Name.Visible = true;
                }
                else
                {
                    LinK_Building_Arabic_Name.Visible = true; LinK_Building_English_Name.Visible = false;
                }
            }
        }
        //*******************************************************************************************************************************************
        protected void Unit_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                

                var lbl_Titel_Unit_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Unit_Number");
                var lbl_Titel_current_situation = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_current_situation");
                var lbl_Titel_Oreedo_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Oreedo_Number");
                var lbl_Titel_Electricityt_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Electricityt_Number");
                var lbl_Titel_Water_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Water_Number");
                var lbl_Titel_virtual_Value = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_virtual_Value");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Unit_Number.Text = Dt.Rows[86]["EN"].ToString();
                        lbl_Titel_current_situation.Text = Dt.Rows[83]["EN"].ToString();
                        lbl_Titel_Oreedo_Number.Text = Dt.Rows[85]["EN"].ToString();
                        lbl_Titel_Electricityt_Number.Text = Dt.Rows[65]["EN"].ToString();
                        lbl_Titel_Water_Number.Text = Dt.Rows[64]["EN"].ToString();
                        lbl_Titel_virtual_Value.Text = Dt.Rows[84]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Titel_Unit_Number.Text = Dt.Rows[86]["AR"].ToString();
                        lbl_Titel_current_situation.Text = Dt.Rows[83]["AR"].ToString();
                        lbl_Titel_Oreedo_Number.Text = Dt.Rows[85]["AR"].ToString();
                        lbl_Titel_Electricityt_Number.Text = Dt.Rows[65]["AR"].ToString();
                        lbl_Titel_Water_Number.Text = Dt.Rows[64]["AR"].ToString();
                        lbl_Titel_virtual_Value.Text = Dt.Rows[84]["AR"].ToString();

                    }
                }
            }
        }



        //******************************************************************************************************************************************
        //************************************************** languages ****************************************************************
        //******************************************************************************************************************************************

        protected void language()
        {

            if (Session["Langues"] == null) { Session["Langues"] = "1"; }

            if (Session["Langues"].ToString() == "1")
            {
                //Get Filter_DropDownList 
                Filter_DropDownList.Items.Clear();
                Filter_DropDownList.Items.Add(new ListItem("All", "1"));
                Filter_DropDownList.Items.Add(new ListItem("Info", "2"));
                Filter_DropDownList.Items.Add(new ListItem("Att", "3"));




                lbl_titel_Missing_Fields_List.Text = "Missing Fields List";
                lbl_Properties.Text = "Properties";
                lbl_Buildings.Text = "Buildings";
                lbl_units.Text = "units";
                lbl_All.Text = "All";
                Label3.Text = "All / Info / Att";
                lbl_titel_Proreties_Missing_Fields.Text = "Properties Missing Fields";
                lbl_Info.Text = "Info Missing Fields";


                lbl_Att.Text = "Att Missing Fields";
                lbl_Alll.Text = "All Missing Fields";
                lbl_Building_Missing_Feild.Text = "Buildings Missing Fields";


                lbl_All_2.Text = "All Missing Fields";
                lbl_Unit_Missining_field.Text = "Units Missing Fields";
            }
            else
            {
                //Get Filter_DropDownList 
                Filter_DropDownList.Items.Clear();
                Filter_DropDownList.Items.Add(new ListItem("الكل", "1"));
                Filter_DropDownList.Items.Add(new ListItem("معلومات", "2"));
                Filter_DropDownList.Items.Add(new ListItem("مرفقات", "3"));

                lbl_titel_Missing_Fields_List.Text = "كشف النواقص";
                lbl_Properties.Text = "الملكيات";
                lbl_Buildings.Text = "الأبنية";
                lbl_units.Text = "الوحدات";
                lbl_All.Text = "الكل";
                Label3.Text = "الكل / معلومات / مرفقات";
                lbl_titel_Proreties_Missing_Fields.Text = "نواقص الملكيات";
                lbl_Info.Text = "نواقص المعلومات";


                lbl_Att.Text = "نواقص المرفقات";
                lbl_Alll.Text = "كل النواقص";
                lbl_Building_Missing_Feild.Text = "نواقص الأبنية";


                lbl_All_2.Text = "كل النواقص";
                lbl_Unit_Missining_field.Text = "نواقص الوحدات";
            }


        }
    }
}