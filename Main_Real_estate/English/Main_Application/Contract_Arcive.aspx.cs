using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Diagnostics.Contracts;
using System.Web.Services.Description;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Contract_Arcive : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Contracting", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }


            language();
            Get_OS_Arcive_BindData();
            Get_B_Arcive_BindData();
        }


        protected void Get_OS_Arcive_BindData()
        {

            string getOS_ArciveQuari = "select DA.* , UN.Users_Ar_First_Name , UN.Users_Name , " +
                "C.Contract_Id , C.Date_Of_Sgin , C.Start_Date , C.End_Date , C.Payment_Amount ,  " +
                "T.Tenants_Arabic_Name , " +
                "U.Unit_ID , U.Unit_Number ,  " +
                "B.Building_Id , B.Building_Arabic_Name , B.Building_English_Name , " +
                "O.Owner_Ship_AR_Name , O.Owner_Ship_EN_Name ,  O.owner_ship_Code " +
                " from delete_archive DA " +
                "left join arcive_contract C on(DA.Item_Id = C.Contract_Id) " +
                "left join tenants T on(C.tenants_Tenants_ID = T.Tenants_ID) " +
                "left join arcive_units U on(C.units_Unit_ID = U.Unit_ID) " +
                "left join arcive_building B on(U.building_Building_Id = B.Building_Id) " +
                "left join arcive_ownership O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) " +
                "left join users UN on(DA.User_Id = UN.user_ID) where DA.OS_B_U = 'C'";





            MySqlCommand getOS_ArciveCmd = new MySqlCommand(getOS_ArciveQuari, _sqlCon);
            MySqlDataAdapter getOS_ArciveDt = new MySqlDataAdapter(getOS_ArciveCmd);
            getOS_ArciveCmd.Connection = _sqlCon;
            _sqlCon.Open();
            getOS_ArciveDt.SelectCommand = getOS_ArciveCmd;
            DataTable getOS_ArciveDataTable = new DataTable();
            getOS_ArciveDt.Fill(getOS_ArciveDataTable);
            Ownership_GridView.DataSource = getOS_ArciveDataTable;
            Ownership_GridView.DataBind();
            _sqlCon.Close();

        }


        protected void Get_B_Arcive_BindData()
        {

            string getB_ArciveQuari = "select DA.* , UN.Users_Ar_First_Name , UN.Users_Name , " +
                "C.Contract_Id , C.Date_Of_Sgin , C.Start_Date , C.End_Date , C.Payment_Amount , " +
                "T.Tenants_Arabic_Name , " +
                "B.Building_Id , B.Building_Arabic_Name ,  B.Building_English_Name ,  " +
                "O.Owner_Ship_AR_Name , O.Owner_Ship_EN_Name , O.owner_ship_Code " +
                "from delete_archive DA " +
                "left join arcive_building_contract C on(DA.Item_Id = C.Contract_Id) " +
                "left join tenants T on(C.tenants_Tenants_ID = T.Tenants_ID) " +
                "left join arcive_building B on(C.building_Building_Id = B.Building_Id) " +
                "left join arcive_ownership O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) " +
                "left join users UN on(DA.User_Id = UN.user_ID) " +
                "where DA.OS_B_U = 'BC'";


            MySqlCommand getB_ArciveCmd = new MySqlCommand(getB_ArciveQuari, _sqlCon);
            MySqlDataAdapter getB_ArciveDt = new MySqlDataAdapter(getB_ArciveCmd);
            getB_ArciveCmd.Connection = _sqlCon;
            _sqlCon.Open();
            getB_ArciveDt.SelectCommand = getB_ArciveCmd;
            DataTable getB_ArciveDataTable = new DataTable();
            getB_ArciveDt.Fill(getB_ArciveDataTable);
            Building_GridView.DataSource = getB_ArciveDataTable;
            Building_GridView.DataBind();
            _sqlCon.Close();

        }

        protected void A_1_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible = true;
            B_Arcive.Visible = false;
            if (Session["Langues"].ToString() == "1") { lbl_titel_Contracts_List.Text = "Contract Archives (Single Contracts)"; } else { lbl_titel_Contracts_List.Text = "أرشيف العقود المفردة"; }
        }

        protected void A_2_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible = false;
            B_Arcive.Visible = true;
            if (Session["Langues"].ToString() == "1") { lbl_titel_Contracts_List.Text = "Contract Archives (Multiple Contracts)"; } else { lbl_titel_Contracts_List.Text = "أرشيف العقود المجملة"; }
        }

        protected void A_3_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible = false;
            B_Arcive.Visible = false;
            if (Session["Langues"].ToString() == "1") { lbl_titel_Contracts_List.Text = "Contract Archives (All Contracts)"; } else { lbl_titel_Contracts_List.Text = "أرشيف كافة العقود"; }
        }

        protected void A_4_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible = true;
            B_Arcive.Visible = true;
            if (Session["Langues"].ToString() == "1") { lbl_titel_Contracts_List.Text = "Contract Archives (All Contracts)"; } else { lbl_titel_Contracts_List.Text = "أرشيف كافة العقود"; }
                
        }





        //******************************************************************************************************************************************
        //************************************************** languages ****************************************************************
        //******************************************************************************************************************************************
        protected void language()
        {

            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            _sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_contract", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_A_1.Text = "Contract Archives (Single Contracts)";
                    lbl_A_2.Text = "Contract Archives (Multiple Contracts)";
                    lbl_A_3.Text = "Contract Archives (All Contracts)";
                    lbl_titel_Contracts_List.Text = "Contract Archives (All Contracts)";
                }
                else
                {

                    lbl_A_1.Text = "أرشيف  العقود المفردة";
                    lbl_A_2.Text = "أرشيف مؤجرات  المجملة";
                    lbl_A_3.Text = "أرشيف  للكل";
                    lbl_titel_Contracts_List.Text = "أرشيف كافة العقود";
                }
            }
            _sqlCon.Close();

        }

        protected void Ownership_GridView_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            //_sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_contract", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (e.Item.ItemType == ListItemType.Header)
                {
                    var lbl_User_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_User_Name");
                    var lbl_Delete_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Delete_Name");
                    var lbl_Property = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Property");
                    var lbl_Property_Code = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Property_Code");
                    var lbl_Building = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building");
                    var lbl_Unit = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit");
                    var lbl_Start = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Start");
                    var lbl_End = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_End");
                    var lbl_Amount = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Amount");
                    var lbl_Resone = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Resone");
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_User_Name.Text = Dt.Rows[65]["EN"].ToString();
                        lbl_Delete_Name.Text = Dt.Rows[66]["EN"].ToString();
                        lbl_Property.Text = Dt.Rows[4]["EN"].ToString();
                        lbl_Property_Code.Text = Dt.Rows[55]["EN"].ToString();
                        lbl_Building.Text = Dt.Rows[5]["EN"].ToString();
                        lbl_Unit.Text = Dt.Rows[6]["EN"].ToString();
                        lbl_Start.Text = Dt.Rows[10]["EN"].ToString();
                        lbl_End.Text = Dt.Rows[11]["EN"].ToString();
                        lbl_Amount.Text = Dt.Rows[58]["EN"].ToString();
                        lbl_Resone.Text = "Reason For Deletion";
                    }
                    else
                    {
                        lbl_User_Name.Text = Dt.Rows[65]["AR"].ToString();
                        lbl_Delete_Name.Text = Dt.Rows[66]["AR"].ToString();
                        lbl_Property.Text = Dt.Rows[4]["AR"].ToString();
                        lbl_Property_Code.Text = Dt.Rows[55]["AR"].ToString();
                        lbl_Building.Text = Dt.Rows[5]["AR"].ToString();
                        lbl_Unit.Text = Dt.Rows[6]["AR"].ToString();
                        lbl_Start.Text = Dt.Rows[10]["AR"].ToString();
                        lbl_End.Text = Dt.Rows[11]["AR"].ToString();
                        lbl_Amount.Text = Dt.Rows[58]["AR"].ToString();
                        lbl_Resone.Text = "سبب الحذف";

                    }
                }


                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    var lbl_Users_Ar_First_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_Ar_First_Name");
                    var lbl_Users_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_Name");
                    var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                    var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");
                    var lbl_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Name");
                    var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Users_Ar_First_Name.Visible= false; lbl_Users_Name.Visible = true;
                        lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                        lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                    }
                    else
                    {
                        lbl_Users_Ar_First_Name.Visible = true; lbl_Users_Name.Visible = false;
                        lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                        lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;

                    }
                }



            }
            _sqlCon.Close();
        }

        protected void Building_GridView_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            //_sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_contract", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (e.Item.ItemType == ListItemType.Header)
                {
                    var lbl_User_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_User_Name");
                    var lbl_Delete_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Delete_Name");
                    var lbl_Property = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Property");
                    var lbl_Property_Code = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Property_Code");
                    var lbl_Building = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building");
                    var lbl_Start = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Start");
                    var lbl_End = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_End");
                    var lbl_Amount = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Amount");
                    var lbl_Resone = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Resone");

                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_User_Name.Text = Dt.Rows[65]["EN"].ToString();
                        lbl_Delete_Name.Text = Dt.Rows[66]["EN"].ToString();
                        lbl_Property.Text = Dt.Rows[4]["EN"].ToString();
                        lbl_Property_Code.Text = Dt.Rows[55]["EN"].ToString();
                        lbl_Building.Text = Dt.Rows[5]["EN"].ToString();
                        lbl_Start.Text = Dt.Rows[10]["EN"].ToString();
                        lbl_End.Text = Dt.Rows[11]["EN"].ToString();
                        lbl_Amount.Text = Dt.Rows[58]["EN"].ToString();
                        lbl_Resone.Text = "Reason For Deletion";
                    }
                    else
                    {
                        lbl_User_Name.Text = Dt.Rows[65]["AR"].ToString();
                        lbl_Delete_Name.Text = Dt.Rows[66]["AR"].ToString();
                        lbl_Property.Text = Dt.Rows[4]["AR"].ToString();
                        lbl_Property_Code.Text = Dt.Rows[55]["AR"].ToString();
                        lbl_Building.Text = Dt.Rows[5]["AR"].ToString();
                        lbl_Start.Text = Dt.Rows[10]["AR"].ToString();
                        lbl_End.Text = Dt.Rows[11]["AR"].ToString();
                        lbl_Amount.Text = Dt.Rows[58]["AR"].ToString();
                        lbl_Resone.Text = "سبب الحذف";

                    }
                }


                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    var lbl_Users_Ar_First_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_Ar_First_Name");
                    var lbl_Users_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_Name");
                    var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                    var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");
                    var lbl_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Name");
                    var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Users_Ar_First_Name.Visible = false; lbl_Users_Name.Visible = true;
                        lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                        lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                    }
                    else
                    {
                        lbl_Users_Ar_First_Name.Visible = true; lbl_Users_Name.Visible = false;
                        lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                        lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;

                    }
                }
            }
            _sqlCon.Close();
        }
    }
}