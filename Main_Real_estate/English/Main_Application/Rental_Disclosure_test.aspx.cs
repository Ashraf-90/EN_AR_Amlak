using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Diagnostics.Contracts;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Rental_Disclosure_test : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                language();
                Header_Repeater_DataBinder();
                Building_Repeater_DataBinder();
                Unit();
                
            }
        }
        protected void Header_Repeater_DataBinder()
        {
            string Where = ""; string typee = "";

            if (Ownershi_Code_DropDownList.SelectedItem.Text == "...............") { Where = ""; }
            else { Where = "and Owner_Ship_Id = '" + Ownershi_Code_DropDownList.SelectedValue + "' "; }

            if (Quari.Text == "1") { typee = ""; } else if (Quari.Text == "2") { typee = "and Typee = 'A'"; } else { typee = "and Typee = 'B'"; }

            string Header_Repeater_Quari = "select * from ( " +
                "SELECT  (SELECT CAST(CONCAT('A')as char))Typee , B.Building_Id  , B.Building_NO  , B.Building_Arabic_Name  ,  " +
                "O.Owner_Ship_Id  , O.owner_ship_Code  , O.Owner_Ship_AR_Name , O.Owner_Ship_EN_Name , O.Street_NO   ,  O.Street_Name  ,   " +
                "ONR.Owner_Arabic_name  , ONR.Owner_English_name  ,  " +
                "Z.zone_number   " +
                "FROM contract C    " +
                "left join units U on(C.units_Unit_ID = U.Unit_Id)  " +
                "left join building B on(U.building_Building_Id = B.building_Id)  " +
                "left join owner_ship O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)  " +
                "left join zone Z on(O.zone_zone_Id = Z.zone_Id)  " +
                "left join owner ONR on(O.owner_Owner_Id = ONR.Owner_Id)  " +
                "union  " +
                "SELECT   " +
                "(SELECT CAST(CONCAT('B')as char))Typee , B.Building_Id  , B.Building_NO  , B.Building_Arabic_Name  ,  " +
                "O.Owner_Ship_Id  , O.owner_ship_Code  , O.Owner_Ship_AR_Name , O.Owner_Ship_EN_Name , O.Street_NO   ,  O.Street_Name  ,   " +
                "ONR.Owner_Arabic_name  ,  ONR.Owner_English_name  , " +
                "Z.zone_number " +
                "FROM building_contract C  " +
                "left join building B on(C.building_Building_Id = B.building_Id)  " +
                "left join owner_ship O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)  " +
                "left join zone Z on(O.zone_zone_Id = Z.zone_Id)  " +
                "left join owner ONR on(O.owner_Owner_Id = ONR.Owner_Id) ) a  where Owner_Ship_Id > '0' " + typee + "  " + Where + "" +
                "GROUP BY Owner_Ship_Id " +
                "order by owner_ship_Code asc   ";
            MySqlCommand get_Header_Repeater_Cmd = new MySqlCommand(Header_Repeater_Quari, _sqlCon);
            MySqlDataAdapter get_Header_Repeater_Dt = new MySqlDataAdapter(get_Header_Repeater_Cmd);
            get_Header_Repeater_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_Header_Repeater_Dt.SelectCommand = get_Header_Repeater_Cmd;
            DataTable get_Header_Repeater_DataTable = new DataTable();
            get_Header_Repeater_Dt.Fill(get_Header_Repeater_DataTable);
            OWnershi_Repeater.DataSource = get_Header_Repeater_DataTable;
            OWnershi_Repeater.DataBind();
            _sqlCon.Close();

        }
        protected void Building_Repeater_DataBinder()
        {
            foreach (RepeaterItem item in OWnershi_Repeater.Items)
            {
                Repeater Buildingg_Repeater = item.FindControl("Buildingg_Repeater") as Repeater;
                Label lbl_Ownersihp_Id = item.FindControl("lbl_Ownersihp_Id") as Label;
                string Building_Repeater_Quari = "SELECT  " +
                    "B.Building_NO , B.Half_Building_ID FROM contract C " +
                    "left join units U on(C.units_Unit_ID = U.Unit_Id) " +
                    "left join building B on(U.building_Building_Id = B.building_Id) " +
                    "left join owner_ship O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) " +
                    "where O.Owner_Ship_Id = '" + lbl_Ownersihp_Id.Text + "' " +
                    "GROUP BY B.Half_Building_ID " +
                    "union " +
                    "SELECT " +
                    "B.Building_NO , B.Half_Building_ID FROM building_contract C " +
                    "left join building B on(C.building_Building_Id = B.building_Id) " +
                    "left join owner_ship O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) " +
                    "where O.Owner_Ship_Id = '" + lbl_Ownersihp_Id.Text + "' " +
                    "GROUP BY B.Half_Building_ID; ";
                MySqlCommand get_Building_Repeater_Cmd = new MySqlCommand(Building_Repeater_Quari, _sqlCon);
                MySqlDataAdapter get_Building_Repeater_Dt = new MySqlDataAdapter(get_Building_Repeater_Cmd);
                get_Building_Repeater_Cmd.Connection = _sqlCon;
                _sqlCon.Open();
                get_Building_Repeater_Dt.SelectCommand = get_Building_Repeater_Cmd;
                DataTable get_Building_Repeater_DataTable = new DataTable();
                get_Building_Repeater_Dt.Fill(get_Building_Repeater_DataTable);
                Buildingg_Repeater.DataSource = get_Building_Repeater_DataTable;
                Buildingg_Repeater.DataBind();
                _sqlCon.Close();
            }
        }
        protected void Unit()
        {
            string type_e = "";
            if (Quari.Text == "1") { type_e = ""; } else if (Quari.Text == "2") { type_e = "A"; } else { type_e = "B"; }

            foreach (RepeaterItem item in OWnershi_Repeater.Items)
            {
                Repeater Buildingg_Repeater = item.FindControl("Buildingg_Repeater") as Repeater;
                Label lbl_Ownersihp_Id = item.FindControl("lbl_Ownersihp_Id") as Label;
                foreach (RepeaterItem itm in Buildingg_Repeater.Items)
                {
                    Repeater Unit_Repeater = itm.FindControl("Unit_Repeater") as Repeater;
                    Label lbl_Building_Id = itm.FindControl("lbl_Building_Id") as Label;
                    using (MySqlCommand cmd = new MySqlCommand("All_Rental_Disclosure", _sqlCon))
                    {
                        cmd.Parameters.AddWithValue("@B_ID", lbl_Building_Id.Text);
                        cmd.Parameters.AddWithValue("@Type_e", type_e);
                        using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            Unit_Repeater.DataSource = dt;
                            Unit_Repeater.DataBind();
                        }
                    }
                }
            }
        }
        //****************************** Filtering Functions ***************************************

        //****************************** Singel Multi Filtering  ***************************************
        protected void A_1_ServerClick(object sender, EventArgs e)
        {
            Quari.Text = "2";
            if (Session["Langues"].ToString() == "1") { Typee.Text = "Rental Disclosure (Single Contracts)"; } else { Typee.Text = "كشف المؤجرات للعقود المفردة"; }
                
            Header_Repeater_DataBinder(); Building_Repeater_DataBinder(); Unit();
        }
        protected void A_2_ServerClick(object sender, EventArgs e)
        {
            Quari.Text = "3";
            if (Session["Langues"].ToString() == "1") { Typee.Text = "Rental Disclosure (Multiple Contracts)"; } else { Typee.Text = "كشف المؤجرات للعقود المجملة"; }
            Header_Repeater_DataBinder(); Building_Repeater_DataBinder(); Unit();
        }
        protected void A_3_ServerClick(object sender, EventArgs e)
        {
            Quari.Text = "1";
            if (Session["Langues"].ToString() == "1") { Typee.Text = "Rental Disclosure (All Contracts)"; } else { Typee.Text = "كشف المؤجرات للكل"; }
            Header_Repeater_DataBinder(); Building_Repeater_DataBinder(); Unit();
        }
        //****************************** DropDownList Filtering  ***************************************
        protected void Ownershi_Code_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string zoneId = Request.QueryString["Id"];
            DataTable getZoneDt = new DataTable();
            _sqlCon.Open();
            MySqlCommand getZoneCmd = new MySqlCommand("SELECT zone_zone_Id FROM owner_ship WHERE Owner_Ship_Id = '" + Ownershi_Code_DropDownList.SelectedValue + "'", _sqlCon);
            MySqlDataAdapter getZoneDa = new MySqlDataAdapter(getZoneCmd);
            getZoneCmd.Parameters.AddWithValue("@ID", zoneId);
            getZoneDa.Fill(getZoneDt);
            if (getZoneDt.Rows.Count > 0)
            {
                Zone_N_DropDownList.SelectedValue = getZoneDt.Rows[0]["zone_zone_Id"].ToString();
            }
            _sqlCon.Close();

            Ownershi_Name_DropDownList.SelectedValue = Ownershi_Code_DropDownList.SelectedValue;

            Header_Repeater_DataBinder(); Building_Repeater_DataBinder(); Unit();
        }
        protected void Ownershi_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string zoneId = Request.QueryString["Id"];
            DataTable getZoneDt = new DataTable();
            _sqlCon.Open();
            MySqlCommand getZoneCmd = new MySqlCommand("SELECT zone_zone_Id FROM owner_ship WHERE Owner_Ship_Id = '" + Ownershi_Name_DropDownList.SelectedValue + "'", _sqlCon);
            MySqlDataAdapter getZoneDa = new MySqlDataAdapter(getZoneCmd);
            getZoneCmd.Parameters.AddWithValue("@ID", zoneId);
            getZoneDa.Fill(getZoneDt);
            if (getZoneDt.Rows.Count > 0)
            {
                Zone_N_DropDownList.SelectedValue = getZoneDt.Rows[0]["zone_zone_Id"].ToString();
            }
            _sqlCon.Close();

            Ownershi_Code_DropDownList.SelectedValue = Ownershi_Name_DropDownList.SelectedValue;

            Header_Repeater_DataBinder(); Building_Repeater_DataBinder(); Unit();
        }
        protected void Zone_N_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Get Ownershi_Code_DropDownList
            Helper.LoadDropDownList("SELECT * FROM owner_ship where Active!='1' and zone_zone_Id = '" + Zone_N_DropDownList.SelectedValue + "'", _sqlCon, Ownershi_Code_DropDownList, "owner_ship_Code", "Owner_Ship_Id");
            Ownershi_Code_DropDownList.Items.Insert(0, "..... الكل .....");

            //Get Ownershi_Name_DropDownList
            Helper.LoadDropDownList("SELECT * FROM owner_ship where Active!='1' and zone_zone_Id = '" + Zone_N_DropDownList.SelectedValue + "'", _sqlCon, Ownershi_Name_DropDownList, "Owner_Ship_AR_Name", "Owner_Ship_Id");
            Ownershi_Name_DropDownList.Items.Insert(0, "..... الكل .....");

            Header_Repeater_DataBinder(); Building_Repeater_DataBinder(); Unit();
        }

        protected void OWnershi_Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Owner_Ship_AR_Name = e.Item.FindControl("lbl_Owner_Ship_AR_Name") as Label;
                var lbl_Owner_Ship_EN_Name = e.Item.FindControl("lbl_Owner_Ship_EN_Name") as Label;
                var lbl_Owner_Arabic_name = e.Item.FindControl("lbl_Owner_Arabic_name") as Label;
                var lbl_Owner_English_name = e.Item.FindControl("lbl_Owner_English_name") as Label;
                var lbl_Owner_Name = e.Item.FindControl("lbl_Owner_Name") as Label;
                var lbl_Street = e.Item.FindControl("lbl_Street") as Label;
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                    lbl_Owner_Arabic_name.Visible = false; lbl_Owner_English_name.Visible = true;
                    lbl_Owner_Name.Text = "Owner :"; lbl_Street.Text = "In Street :";
                }
                else
                {
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_Owner_Arabic_name.Visible = true; lbl_Owner_English_name.Visible = false;
                    lbl_Owner_Name.Text = "المالك :"; lbl_Street.Text = "في شارع :";
                }
            }
        }

        protected void Buildingg_Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Building = e.Item.FindControl("lbl_Building") as Label;

                var lbl_No_Type = e.Item.FindControl("lbl_No_Type") as Label;
                var lbl_Details = e.Item.FindControl("lbl_Details") as Label;
                var lbl_Condition = e.Item.FindControl("lbl_Condition") as Label;
                var lbl_Elec = e.Item.FindControl("lbl_Elec") as Label;
                var lbl_Water = e.Item.FindControl("lbl_Water") as Label;
                var lbl_Tenant = e.Item.FindControl("lbl_Tenant") as Label;
                var lbl_Phon = e.Item.FindControl("lbl_Phon") as Label;
                var lbl_post = e.Item.FindControl("lbl_post") as Label;
                var lbl_period = e.Item.FindControl("lbl_period") as Label;
                var lbl_Start = e.Item.FindControl("lbl_Start") as Label;
                var lbl_End = e.Item.FindControl("lbl_End") as Label;
                var lbl_Amount = e.Item.FindControl("lbl_Amount") as Label;
                var lbl_Method = e.Item.FindControl("lbl_Method") as Label;
                var lbl_Notic = e.Item.FindControl("lbl_Notic") as Label;



                //_sqlCon.Open();
                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_contract", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Building.Text = "Building NO :";

                        lbl_No_Type.Text = Dt.Rows[36]["EN"].ToString()+"/"+ Dt.Rows[37]["EN"].ToString();
                        lbl_Details.Text = Dt.Rows[59]["EN"].ToString();
                        lbl_Condition.Text = Dt.Rows[40]["EN"].ToString();
                        lbl_Elec.Text = Dt.Rows[42]["EN"].ToString();
                        lbl_Water.Text = Dt.Rows[43]["EN"].ToString();
                        lbl_Tenant.Text = Dt.Rows[2]["EN"].ToString();
                        lbl_Phon.Text = Dt.Rows[60]["EN"].ToString();
                        lbl_post.Text = Dt.Rows[61]["EN"].ToString();
                        lbl_period.Text = Dt.Rows[62]["EN"].ToString();
                        lbl_Start.Text = Dt.Rows[10]["EN"].ToString();
                        lbl_End.Text = Dt.Rows[11]["EN"].ToString();
                        lbl_Amount.Text = Dt.Rows[63]["EN"].ToString();
                        lbl_Method.Text = Dt.Rows[20]["EN"].ToString();
                        lbl_Notic.Text = Dt.Rows[64]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Building.Text = "عقار رقم :";

                        lbl_No_Type.Text = Dt.Rows[36]["AR"].ToString() + "/" + Dt.Rows[37]["AR"].ToString();
                        lbl_Details.Text = Dt.Rows[59]["AR"].ToString();
                        lbl_Condition.Text = Dt.Rows[40]["AR"].ToString();
                        lbl_Elec.Text = Dt.Rows[42]["AR"].ToString();
                        lbl_Water.Text = Dt.Rows[43]["AR"].ToString();
                        lbl_Tenant.Text = Dt.Rows[2]["AR"].ToString();
                        lbl_Phon.Text = Dt.Rows[60]["AR"].ToString();
                        lbl_post.Text = Dt.Rows[61]["AR"].ToString();
                        lbl_period.Text = Dt.Rows[62]["AR"].ToString();
                        lbl_Start.Text = Dt.Rows[10]["AR"].ToString();
                        lbl_End.Text = Dt.Rows[11]["AR"].ToString();
                        lbl_Amount.Text = Dt.Rows[63]["AR"].ToString();
                        lbl_Method.Text = Dt.Rows[20]["AR"].ToString();
                        lbl_Notic.Text = Dt.Rows[64]["AR"].ToString();
                    }
                }
                _sqlCon.Close();


                
            }
        }

        protected void Unit_Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Unit_Arabic_Type = e.Item.FindControl("lbl_Unit_Arabic_Type") as Label;
                var lbl_Unit_English_Type = e.Item.FindControl("lbl_Unit_English_Type") as Label;
                var lbl_Unit_Arabic_Detail = e.Item.FindControl("lbl_Unit_Arabic_Detail") as Label;
                var lbl_Unit_English_Detail = e.Item.FindControl("lbl_Unit_English_Detail") as Label;
                var lbl_Unit_Arabic_Condition = e.Item.FindControl("lbl_Unit_Arabic_Condition") as Label;
                var lbl_Unit_English_Condition = e.Item.FindControl("lbl_Unit_English_Condition") as Label;
                var lbl_Tenants_Arabic_Name = e.Item.FindControl("lbl_Tenants_Arabic_Name") as Label;
                var lbl_Tenants_English_Name = e.Item.FindControl("lbl_Tenants_English_Name") as Label;
                var lbl_Paymen_Method = e.Item.FindControl("lbl_Paymen_Method") as Label;
                

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Unit_Arabic_Type.Visible= false; lbl_Unit_English_Type.Visible = true;
                    lbl_Unit_Arabic_Detail.Visible = false; lbl_Unit_English_Detail.Visible = true;
                    lbl_Unit_Arabic_Condition.Visible = false; lbl_Unit_English_Condition.Visible = true;
                    lbl_Tenants_Arabic_Name.Visible = false; lbl_Tenants_English_Name.Visible = true;

                    if(lbl_Paymen_Method.Text == "شيك") { lbl_Paymen_Method.Text = "Cheques"; }
                    else if (lbl_Paymen_Method.Text == "تحويل") { lbl_Paymen_Method.Text = "Transformation"; }
                    else if (lbl_Paymen_Method.Text == "نقداً") { lbl_Paymen_Method.Text = "Cash"; }
                }
                else
                {
                    lbl_Unit_Arabic_Type.Visible = true; lbl_Unit_English_Type.Visible = false;
                    lbl_Unit_Arabic_Detail.Visible = true; lbl_Unit_English_Detail.Visible = false;
                    lbl_Unit_Arabic_Condition.Visible = true; lbl_Unit_English_Condition.Visible = false;
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;

                    if (lbl_Paymen_Method.Text == "Cheques") { lbl_Paymen_Method.Text = "شيك"; }
                    else if (lbl_Paymen_Method.Text == "Transformation") { lbl_Paymen_Method.Text = "تحويل"; }
                    else if (lbl_Paymen_Method.Text == "Cash") { lbl_Paymen_Method.Text = "نقداً"; }
                }

            }
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
                    //Get Ownershi_Code_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active!='1'", _sqlCon, Ownershi_Code_DropDownList, "owner_ship_Code", "Owner_Ship_Id");
                    Ownershi_Code_DropDownList.Items.Insert(0, "...............");

                    //Get Ownershi_Name_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active!='1'", _sqlCon, Ownershi_Name_DropDownList, "Owner_Ship_EN_Name", "Owner_Ship_Id");
                    Ownershi_Name_DropDownList.Items.Insert(0, "...............");

                    lbl_A_1.Text = "Rental Disclosure (Single Contracts)";
                    lbl_A_2.Text = "Rental Disclosure (Multiple Contracts)";
                    lbl_A_3.Text = "Rental Disclosure (All Contracts)";
                    lbl_Ownershi_Code.Text = Dt.Rows[55]["EN"].ToString();
                    lbl_wnershi_Name.Text = Dt.Rows[4]["EN"].ToString();

                    Typee.Text = "Rental Disclosure All Contracts";
                }
                else
                {
                    //Get Ownershi_Code_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active!='1'", _sqlCon, Ownershi_Code_DropDownList, "owner_ship_Code", "Owner_Ship_Id");
                    Ownershi_Code_DropDownList.Items.Insert(0, "...............");

                    //Get Ownershi_Name_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active!='1'", _sqlCon, Ownershi_Name_DropDownList, "Owner_Ship_AR_Name", "Owner_Ship_Id");
                    Ownershi_Name_DropDownList.Items.Insert(0, "...............");

                    lbl_A_1.Text = "كشف مؤجرات العقود المفردة";
                    lbl_A_2.Text = "كشف مؤجرات العقود المجملة";
                    lbl_A_3.Text = "كشف مؤجرات للكل";
                    lbl_Ownershi_Code.Text = Dt.Rows[55]["AR"].ToString();
                    lbl_wnershi_Name.Text = Dt.Rows[4]["AR"].ToString();

                    Typee.Text = "كشف مؤجرات للكل";
                }
            }
            _sqlCon.Close();

        }
    }
}