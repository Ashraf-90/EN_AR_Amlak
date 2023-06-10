using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Main_Real_estate.English.Master_Panal;

namespace Main_Real_estate.English.Main_Application
{
    public partial class OwnerShip_DTL : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "properties", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }

            if (!this.IsPostBack)
            {
                language();
                Statment();
                Building_List_BindData();
                string ownershipId = Request.QueryString["Id"];
                using (MySqlCommand ownershipDetailsCmd = new MySqlCommand("Ownership_Details", _sqlCon))
                {
                    ownershipDetailsCmd.CommandType = CommandType.StoredProcedure;
                    ownershipDetailsCmd.Parameters.AddWithValue("@Id", ownershipId);
                    using (MySqlDataAdapter ownershipDetailsSda = new MySqlDataAdapter(ownershipDetailsCmd))
                    {
                        DataTable ownershipDetailsDt = new DataTable();
                        ownershipDetailsSda.Fill(ownershipDetailsDt);
                        

                        if (Session["Langues"].ToString() == "1") { lbl_Details_ownership_Name.Text = "Details Of Property :" + ownershipDetailsDt.Rows[0]["Owner_Ship_EN_Name"].ToString(); }
                        else { lbl_Details_ownership_Name.Text = "تفاصيل الملكية : " + ownershipDetailsDt.Rows[0]["Owner_Ship_AR_Name"].ToString(); }

                        lbl_Dtl_Parcel_Area.Text = ownershipDetailsDt.Rows[0]["Parcel_Area"].ToString();
                        lbl_Dtl_Bond_No.Text = ownershipDetailsDt.Rows[0]["Bond_NO"].ToString();
                        lbl_Dtl_Street_NO.Text = ownershipDetailsDt.Rows[0]["Street_NO"].ToString();
                        lbl_Dtl_Street_Name.Text = ownershipDetailsDt.Rows[0]["Street_Name"].ToString();
                        lbl_Dtl_Land_Value.Text = ownershipDetailsDt.Rows[0]["Land_Value"].ToString();
                        lbl_Dtl_PIN.Text = ownershipDetailsDt.Rows[0]["PIN_Number"].ToString();
                        lbl_Dtl_Code.Text = ownershipDetailsDt.Rows[0]["owner_ship_Code"].ToString();
                        


                        if (Session["Langues"].ToString() == "1") { lbl_Dtl_Zone_Name.Text = ownershipDetailsDt.Rows[0]["zone_English_name"].ToString(); }
                        else { lbl_Dtl_Zone_Name.Text = ownershipDetailsDt.Rows[0]["zone_arabic_name"].ToString();  }


                            Link_Ownership_Certificate_Pdf.HRef = ownershipDetailsDt.Rows[0]["owner_ship_Certificate_Image_Path"].ToString();
                        Link_Ownership_Certificate_Pdf.Target = "_blank";

                        Link_Property_Scheme.HRef = ownershipDetailsDt.Rows[0]["Property_Scheme_Image_Path"].ToString();
                        Link_Property_Scheme.Target = "_blank";

                        Link_Stetmant.HRef = ownershipDetailsDt.Rows[0]["Statment_Id"].ToString();
                        Link_Stetmant.Target = "_blank";

                        if (ownershipDetailsDt.Rows[0]["owner_ship_Certificate_Image_Path"].ToString() == "No File")
                        {
                            Link_Ownership_Certificate_Pdf.Visible = false;
                        }

                        if (ownershipDetailsDt.Rows[0]["Property_Scheme_Image_Path"].ToString() == "No File")
                        {
                            Link_Property_Scheme.Visible = false;
                        }

                        if (ownershipDetailsDt.Rows[0]["Statment_Id"].ToString() == "")
                        {
                            Link_Stetmant.Visible = false;
                            

                            if (Session["Langues"].ToString() == "1") { lbl_No_Statment.Text = "There Is No Statments"; }
                            else { lbl_No_Statment.Text = "لم يتم إرفاق أي إفادات"; }
                        }
                    }
                }
            }
               
        }

        protected void Statment()
        {
            string getStatmentQuari = "SELECT * FROM ownership_statment where Ownership_Id = '" + Request.QueryString["ID"] + "'";
            MySqlCommand getStatmentCmd = new MySqlCommand(getStatmentQuari, _sqlCon);
            MySqlDataAdapter getStatmentDt = new MySqlDataAdapter(getStatmentCmd);
            getStatmentCmd.Connection = _sqlCon;
            _sqlCon.Open();
            getStatmentDt.SelectCommand = getStatmentCmd;
            DataTable getStatmentDataTable = new DataTable();
            getStatmentDt.Fill(getStatmentDataTable);
            Statment_List.DataSource = getStatmentDataTable;
            Statment_List.DataBind();
            _sqlCon.Close();
        }

        protected void Building_List_BindData(string sortExpression = null)
        {
            try
            {
                _sqlCon.Open();
                string ownershipId = Request.QueryString["Id"];
                using (MySqlCommand bulidingDetailsCmd = new MySqlCommand("Building_List_In_Ownership_Details", _sqlCon))
                {
                    bulidingDetailsCmd.CommandType = CommandType.StoredProcedure;
                    bulidingDetailsCmd.Parameters.AddWithValue("@Id", ownershipId);
                    MySqlDataAdapter bulidingDetailsSda = new MySqlDataAdapter(bulidingDetailsCmd);

                    DataTable bulidingDetailsDt = new DataTable();
                    bulidingDetailsSda.Fill(bulidingDetailsDt);
                    bulidingDetailsCmd.CommandType = CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    bulidingDetailsSda.Fill(dt);
                    building_List.DataSource = dt;
                    building_List.DataBind();
                    _sqlCon.Close();
                }
        }
            catch { Response.Write(@"<script language='javascript'>alert('لا يمكن عرض هذه الصفحة')</script>"); }
}

        protected void building_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Titel_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Arabic_Name");
                var lbl_Titel_Building_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_NO");
                var lbl_Titel_Construction_Area = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Construction_Area");
                var lbl_Titel_Maintenance_status = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Maintenance_status");
                var lbl_Titel_Building_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Condition");
                var lbl_Titel_Building_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Type");
                var lbl_Titel_Building_Value = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Value");
                





                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages ", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Building_Arabic_Name.Text = Dt.Rows[59]["EN"].ToString();
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["EN"].ToString();
                        lbl_Titel_Construction_Area.Text = Dt.Rows[60]["EN"].ToString();
                        lbl_Titel_Maintenance_status.Text = Dt.Rows[63]["EN"].ToString();
                        lbl_Titel_Building_Condition.Text = Dt.Rows[61]["EN"].ToString();
                        lbl_Titel_Building_Type.Text = Dt.Rows[62]["EN"].ToString();
                        lbl_Titel_Building_Value.Text = Dt.Rows[76]["EN"].ToString();
                        
                    }
                    else
                    {
                        lbl_Titel_Building_Arabic_Name.Text = Dt.Rows[59]["AR"].ToString();
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["AR"].ToString();
                        lbl_Titel_Construction_Area.Text = Dt.Rows[60]["AR"].ToString();
                        lbl_Titel_Maintenance_status.Text = Dt.Rows[63]["AR"].ToString();
                        lbl_Titel_Building_Condition.Text = Dt.Rows[61]["AR"].ToString();
                        lbl_Titel_Building_Type.Text = Dt.Rows[62]["AR"].ToString();
                        lbl_Titel_Building_Value.Text = Dt.Rows[76]["AR"].ToString();

                    }
                }
                _sqlCon.Close();
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Building_Arabic_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Condition");
                var lbl_Building_Engils_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Engils_Condition");
                var lbl_Building_Arabic_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Type");
                var lbl_Building_English_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Type");
                var lbl_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Name");
                var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                    lbl_Building_Arabic_Condition.Visible = false; lbl_Building_Arabic_Type.Visible = false;
                    lbl_Building_Engils_Condition.Visible = true; lbl_Building_English_Type.Visible=true;
                }
                else
                {
                    lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;
                    lbl_Building_Arabic_Condition.Visible = true; lbl_Building_Arabic_Type.Visible = true;
                    lbl_Building_Engils_Condition.Visible = false; lbl_Building_English_Type.Visible = false;
                }
            }
        }
        protected void Building_Details(object sender, EventArgs e)
        {
            
            if (Session["Langues"].ToString() == "1") { T_B_D.Text = "Building Details"; }
            else { T_B_D.Text = "تفاصيل البناء"; }
                btn_Close.Visible = true;
            string buildingId = (sender as LinkButton).CommandArgument;
            using (MySqlCommand bulidingDetailsCmd = new MySqlCommand("Building_Details", _sqlCon))
            {
                bulidingDetailsCmd.CommandType = CommandType.StoredProcedure;
                bulidingDetailsCmd.Parameters.AddWithValue("@Id", buildingId);
                MySqlDataAdapter bulidingDetailsSda = new MySqlDataAdapter(bulidingDetailsCmd);

                DataTable bulidingDetailsDt = new DataTable();
                bulidingDetailsSda.Fill(bulidingDetailsDt);
                bulidingDetailsCmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                bulidingDetailsSda.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                _sqlCon.Close();
            }
            //***************************************************************************
            _sqlCon.Open();
            using (MySqlCommand unitDetailsCmd = new MySqlCommand("Unit_List_In_Building_Details", _sqlCon))
            {
                unitDetailsCmd.CommandType = CommandType.StoredProcedure;
                unitDetailsCmd.Parameters.AddWithValue("@Id", buildingId);
                MySqlDataAdapter unitDetailsSda = new MySqlDataAdapter(unitDetailsCmd);

                DataTable unitDetailsDt = new DataTable();
                unitDetailsSda.Fill(unitDetailsDt);
                unitDetailsCmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                unitDetailsSda.Fill(dt);
                eeeee.DataSource = dt;
                eeeee.DataBind();
            }
            _sqlCon.Close();

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Titel_Building_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_NO");
                var lbl_Titel_Water_meter = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Water_meter");
                var lbl_Titel_electricity_meter = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_electricity_meter");
                var lbl_Titel_Construction_Area = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Construction_Area");
                var lbl_Titel_Building_Value = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Value");
                var lbl_Titel_Building_Arabic_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Arabic_Condition");
                var lbl_Titel_Building_Arabic_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Arabic_Type");
                var lbl_Titel_Maintenance_status = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Maintenance_status");
                var lbl_Titel_Unit_Connt = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Unit_Connt");
                var lbl_Titel_Building_Permit_Path = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Permit_Path");
                var lbl_Titel_certificate_of_completion_Path = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_certificate_of_completion_Path");
                var lbl_Titel_Map_path = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Map_path");
                var lbl_Titel_Building_Photo = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Photo");
                var lbl_Titel_Entrance_Photo = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Entrance_Photo");
                var lbl_Titel_Plano = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Plano");


                var lbl_Dtl_Building_Arabic_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Dtl_Building_Arabic_Condition");
                var lbl_Dtl_Building_English_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Dtl_Building_English_Condition");
                var lbl_Dtl_Building_Arabic_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Dtl_Building_Arabic_Type");
                var lbl_Dtl_Building_English_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Dtl_Building_English_Type");


                var Bu_No = (System.Web.UI.WebControls.Label)e.Item.FindControl("Bu_No");
                var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["EN"].ToString();
                        lbl_Titel_Water_meter.Text = Dt.Rows[64]["EN"].ToString();
                        lbl_Titel_electricity_meter.Text = Dt.Rows[65]["EN"].ToString();
                        lbl_Titel_Construction_Area.Text = Dt.Rows[60]["EN"].ToString();
                        lbl_Titel_Building_Value.Text = Dt.Rows[76]["EN"].ToString();
                        lbl_Titel_Building_Arabic_Condition.Text = Dt.Rows[61]["EN"].ToString();
                        lbl_Titel_Building_Arabic_Type.Text = Dt.Rows[62]["EN"].ToString();
                        lbl_Titel_Maintenance_status.Text = Dt.Rows[63]["EN"].ToString();
                        lbl_Titel_Unit_Connt.Text = Dt.Rows[98]["EN"].ToString();
                        lbl_Titel_Building_Permit_Path.Text = "License";
                        lbl_Titel_certificate_of_completion_Path.Text = "Completion";
                        lbl_Titel_Map_path.Text = Dt.Rows[71]["EN"].ToString();
                        lbl_Titel_Building_Photo.Text = Dt.Rows[68]["EN"].ToString();
                        lbl_Titel_Entrance_Photo.Text = "Entrance";
                        lbl_Titel_Plano.Text = Dt.Rows[52]["EN"].ToString();


                        lbl_Dtl_Building_Arabic_Condition.Visible=false; lbl_Dtl_Building_English_Condition.Visible=true;
                        lbl_Dtl_Building_Arabic_Type.Visible = false; lbl_Dtl_Building_English_Type.Visible = true;
                        Bu_No.Visible = false; lbl_Building_English_Name.Visible = true;
                    }
                    else
                    {
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["AR"].ToString();
                        lbl_Titel_Water_meter.Text = Dt.Rows[64]["AR"].ToString();
                        lbl_Titel_electricity_meter.Text = Dt.Rows[65]["AR"].ToString();
                        lbl_Titel_Construction_Area.Text = Dt.Rows[60]["AR"].ToString();
                        lbl_Titel_Building_Value.Text = Dt.Rows[76]["AR"].ToString();
                        lbl_Titel_Building_Arabic_Condition.Text = Dt.Rows[61]["AR"].ToString();
                        lbl_Titel_Building_Arabic_Type.Text = Dt.Rows[62]["AR"].ToString();
                        lbl_Titel_Maintenance_status.Text = Dt.Rows[63]["AR"].ToString();
                        lbl_Titel_Unit_Connt.Text = Dt.Rows[98]["AR"].ToString();
                        lbl_Titel_Building_Permit_Path.Text = Dt.Rows[72]["AR"].ToString();
                        lbl_Titel_certificate_of_completion_Path.Text = Dt.Rows[73]["AR"].ToString();
                        lbl_Titel_Map_path.Text = Dt.Rows[71]["AR"].ToString();
                        lbl_Titel_Building_Photo.Text = Dt.Rows[68]["AR"].ToString();
                        lbl_Titel_Entrance_Photo.Text = Dt.Rows[74]["AR"].ToString();
                        lbl_Titel_Plano.Text = Dt.Rows[52]["AR"].ToString();

                        lbl_Dtl_Building_Arabic_Condition.Visible = true; lbl_Dtl_Building_English_Condition.Visible = false;
                        lbl_Dtl_Building_Arabic_Type.Visible = true; lbl_Dtl_Building_English_Type.Visible = false;
                        Bu_No.Visible = true; lbl_Building_English_Name.Visible = false;
                    }
                }

            }
        }

        protected void btn_Close_Click(object sender, EventArgs e)
        {

            T_B_D.Text = string.Empty;

            eeeee.DataSource = null;
            eeeee.DataSourceID = null;
            eeeee.DataBind();

            Repeater1.DataSource = null;
            Repeater1.DataSourceID = null;
            Repeater1.DataBind();


            btn_Close.Visible = false;
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
                    lbl_Dtl_Code.Text = Dt.Rows[37]["EN"].ToString();
                    lbl_Titel_Land_Space.Text = Dt.Rows[40]["EN"].ToString();
                    lbl_Titel_PIN.Text = Dt.Rows[39]["EN"].ToString();
                    lbl_Titel_Bond_No.Text = Dt.Rows[41]["EN"].ToString();
                    lbl_Titel_Zone_Name.Text = Dt.Rows[36]["EN"].ToString();
                    lbl_Titel_Land_Value.Text = Dt.Rows[47]["EN"].ToString();
                    lbl_Titel_Street.Text = Dt.Rows[49]["EN"].ToString();
                    lbl_Titel_Certificate.Text = Dt.Rows[51]["EN"].ToString();
                    lbl_Property_Scheme.Text = Dt.Rows[52]["EN"].ToString();
                    lbl_Stetmant.Text = Dt.Rows[70]["EN"].ToString();
                    btn_Back_To_OwnerShip_List.Text = Dt.Rows[54]["EN"].ToString();
                    lbl_Titel_Building_List.Text = "Buildings List";

                    btn_Close.Text = "Close";

                }
                else
                {
                    //************************************************* Ownership Labels ************************************************
                    lbl_Dtl_Code.Text = Dt.Rows[37]["AR"].ToString();
                    lbl_Titel_Land_Space.Text = Dt.Rows[40]["AR"].ToString();
                    lbl_Titel_PIN.Text = Dt.Rows[39]["AR"].ToString();
                    lbl_Titel_Bond_No.Text = Dt.Rows[41]["AR"].ToString();
                    lbl_Titel_Zone_Name.Text = Dt.Rows[36]["AR"].ToString();
                    lbl_Titel_Land_Value.Text = Dt.Rows[47]["AR"].ToString();
                    lbl_Titel_Street.Text = Dt.Rows[49]["AR"].ToString();
                    lbl_Titel_Certificate.Text = Dt.Rows[51]["AR"].ToString();
                    lbl_Property_Scheme.Text = Dt.Rows[52]["AR"].ToString();
                    lbl_Stetmant.Text = Dt.Rows[70]["AR"].ToString();
                    btn_Back_To_OwnerShip_List.Text = Dt.Rows[54]["AR"].ToString();
                    lbl_Titel_Building_List.Text = "قائمة الأبنية";

                    btn_Close.Text = "إغلاق";

                }
            }
            _sqlCon.Close();
        }

        protected void eeeee_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Titel_Unit_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Unit_Number");
                var lbl_Titel_Unit_Space = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Unit_Space");
                var lbl_Titel_Floor_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Floor_Number");
                var lbl_Titel_current_situation = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_current_situation");
                var lbl_Unit_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Type");
                var lbl_Unit_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Condition");
                var lbl_Titel_virtual_Value = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_virtual_Value");
                var lbl_Unit_Detail = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Detail");
                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages ", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Unit_Number.Text = Dt.Rows[86]["EN"].ToString();
                        lbl_Titel_Unit_Space.Text = Dt.Rows[82]["EN"].ToString();
                        lbl_Titel_Floor_Number.Text = Dt.Rows[87]["EN"].ToString();
                        lbl_Titel_current_situation.Text = Dt.Rows[83]["EN"].ToString();
                        lbl_Unit_Type.Text = Dt.Rows[79]["EN"].ToString();
                        lbl_Unit_Condition.Text = Dt.Rows[80]["EN"].ToString();
                        lbl_Titel_virtual_Value.Text = Dt.Rows[84]["EN"].ToString();
                        lbl_Unit_Detail.Text = Dt.Rows[81]["EN"].ToString();

                    }
                    else
                    {
                        lbl_Titel_Unit_Number.Text = Dt.Rows[86]["AR"].ToString();
                        lbl_Titel_Unit_Space.Text = Dt.Rows[82]["AR"].ToString();
                        lbl_Titel_Floor_Number.Text = Dt.Rows[87]["AR"].ToString();
                        lbl_Titel_current_situation.Text = Dt.Rows[83]["AR"].ToString();
                        lbl_Unit_Type.Text = Dt.Rows[79]["AR"].ToString();
                        lbl_Unit_Condition.Text = Dt.Rows[80]["AR"].ToString();
                        lbl_Titel_virtual_Value.Text = Dt.Rows[84]["AR"].ToString();
                        lbl_Unit_Detail.Text = Dt.Rows[81]["AR"].ToString();

                    }
                }
               
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Unit_Arabic_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Arabic_Type");
                var lbl_Unit_English_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_English_Type");
                var lbl_Unit_Arabic_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Arabic_Condition");
                var lbl_Unit_English_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_English_Condition");
                var lbl_Unit_Arabic_Detail = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Arabic_Detail");
                var lbl_Unit_English_Detail = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_English_Detail");

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Unit_Arabic_Type.Visible = false;        lbl_Unit_English_Type.Visible = true;
                    lbl_Unit_Arabic_Condition.Visible = false;   lbl_Unit_English_Condition.Visible = true;
                    lbl_Unit_Arabic_Detail.Visible = false;      lbl_Unit_English_Detail.Visible = true;

                }
                else
                {
                    lbl_Unit_Arabic_Type.Visible = true; lbl_Unit_English_Type.Visible = false;
                    lbl_Unit_Arabic_Condition.Visible = true; lbl_Unit_English_Condition.Visible = false;
                    lbl_Unit_Arabic_Detail.Visible = true; lbl_Unit_English_Detail.Visible = false;

                }
            }
        }
    }
}