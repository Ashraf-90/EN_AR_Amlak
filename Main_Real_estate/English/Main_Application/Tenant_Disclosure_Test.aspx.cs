using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Diagnostics.Contracts;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Tenant_Disclosure_Test : System.Web.UI.Page
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
                Header_Repeater_DataBinder(); Body_Repeater_DataBinder();
            }
        }

        protected void Header_Repeater_DataBinder()
        {
            string Tenant = ""; string Type_e = ""; string Tenants_Name = "";
            if (Session["Langues"].ToString() == "1") { Tenants_Name = "Tenants_English_Name"; } else { Tenants_Name = "Tenants_Arabic_Name"; }



                if (Tenant_Name_DropDownList.SelectedItem.Text == "...............") { Tenant = ""; } else { Tenant = Tenant_Name_DropDownList.SelectedItem.Text; }
            if (Typee.Text == "1") { Type_e = ""; }else if (Typee.Text == "2") { Type_e = "A"; } else if (Typee.Text == "3") { Type_e = "B"; } else { Type_e = ""; }
            { Type_e = "B"; }

            string Header_Repeater_Quari = "" +
            "select * from " +
            "(select (SELECT CAST(CONCAT('A')as char))Typee ,  C.tenants_Tenants_ID , C.Contract_Id , T.Tenants_Arabic_Name , T.Tenants_English_Name , T.Tenants_Mobile ,TN.Arabic_nationality  , TN.English_nationality  , O.owner_ship_Code from contract C  " +
            " left join tenants T on(C.tenants_Tenants_ID = T.Tenants_ID)  " +
            " left join nationality TN on(T.nationality_nationality_ID = TN.nationality_ID)  " +
            "left join units U on (C.units_Unit_ID = U.Unit_ID) " +
            "left join building B on (U.building_Building_Id = B.building_Id) " +
            "left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id)   " +
            " union " +
            "select (SELECT CAST(CONCAT('B')as char))Typee ,  C.tenants_Tenants_ID , C.Contract_Id , T.Tenants_Arabic_Name , T.Tenants_English_Name , T.Tenants_Mobile ,TN.Arabic_nationality  , TN.English_nationality  , O.owner_ship_Code from building_contract C    " +
            "left join tenants T on(C.tenants_Tenants_ID = T.Tenants_ID)   " +
            "left join nationality TN on(T.nationality_nationality_ID = TN.nationality_ID)  " +
            " left join building B on (C.building_Building_Id = B.Building_Id) " +
            "left join owner_ship O on (B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id))a  " +
            " where "+ Tenants_Name + " like CONCAT('%', '"+ Tenant + "', '%') " +
            " GROUP BY tenants_Tenants_ID  order by owner_ship_Code asc ";
            MySqlCommand get_Header_Repeater_Cmd = new MySqlCommand(Header_Repeater_Quari, _sqlCon);
            MySqlDataAdapter get_Header_Repeater_Dt = new MySqlDataAdapter(get_Header_Repeater_Cmd);
            get_Header_Repeater_Cmd.Connection = _sqlCon;
            _sqlCon.Open();
            get_Header_Repeater_Dt.SelectCommand = get_Header_Repeater_Cmd;
            DataTable get_Header_Repeater_DataTable = new DataTable();
            get_Header_Repeater_Dt.Fill(get_Header_Repeater_DataTable);
            Header_Repeater.DataSource = get_Header_Repeater_DataTable;
            Header_Repeater.DataBind();
            _sqlCon.Close();
        }
        protected  void Body_Repeater_DataBinder()
        {
            string Type_e = "";
            if (Typee.Text == "1") { Type_e = ""; } else if (Typee.Text == "2") { Type_e = "A"; } else if (Typee.Text == "3") { Type_e = "B"; } else { Type_e = ""; }
            foreach (RepeaterItem item in Header_Repeater.Items)
            {
                Repeater Body_Repeater = item.FindControl("Body_Repeater") as Repeater;
                Label lbl_tenants_Tenants_ID = item.FindControl("lbl_tenants_Tenants_ID") as Label;


                using (MySqlCommand cmd = new MySqlCommand("All_Tenant_Disclosure", _sqlCon))
                {
                    cmd.Parameters.AddWithValue("@T_Id", lbl_tenants_Tenants_ID.Text);
                    cmd.Parameters.AddWithValue("@Type_e", Type_e);
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        Body_Repeater.DataSource = dt;
                        Body_Repeater.DataBind();
                    }
                }
            }
            
        }














        //************************ Filtering Functions ********************************************
        //************************ Singel Mulit Filtering Functions *******************************
        protected void A_3_ServerClick(object sender, EventArgs e)
        {
            Header_Repeater_DataBinder(); Body_Repeater_DataBinder();
            Typee.Text = "1";
            if (Session["Langues"].ToString() == "1") { lbl_titelt.Text = "Tenant Disclosure"; } else { lbl_titelt.Text = "كشف المستأجرين"; }
                
        }
        protected void A_1_ServerClick(object sender, EventArgs e)
        {
            Header_Repeater_DataBinder(); Body_Repeater_DataBinder();
            Typee.Text = "2";
            if (Session["Langues"].ToString() == "1") { lbl_titelt.Text = "Tenant Disclosure (Singel Contract )"; } else { lbl_titelt.Text = "كشف مستأجرين العقود المفردة"; }
        }
        protected void A_2_ServerClick(object sender, EventArgs e)
        {
            Header_Repeater_DataBinder(); Body_Repeater_DataBinder();
            Typee.Text = "3";
            if (Session["Langues"].ToString() == "1") { lbl_titelt.Text = "Tenant Disclosure (Multi Contract )"; } else { lbl_titelt.Text = "كشف مستأجرين العقود المجملة"; }
        }
        //************************ Tenant Name Filtering Functions **********************************
        protected void Tenant_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Header_Repeater_DataBinder(); Body_Repeater_DataBinder();
        }
        //************************ Export To Excel **************************************************
        protected void Excel_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename='"+ lbl_titelt.Text + "'.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Header_Repeater.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
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
                    //Fill Tenant Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenant_Name_DropDownList, "Tenants_English_Name", "Tenants_ID");
                    Tenant_Name_DropDownList.Items.Insert(0, "...............");


                    Filtter_All.Text = Dt.Rows[42]["EN"].ToString() ;
                    Filtter_Singel.Text = Dt.Rows[43]["EN"].ToString() ;
                    Filtter_Multi.Text = Dt.Rows[44]["EN"].ToString() ;
                    lbl_Tenant_Name.Text = Dt.Rows[35]["EN"].ToString();
                    lbl_titelt.Text = Dt.Rows[41]["EN"].ToString() ;
                    lbl_titel_Tenants_List.Text = Dt.Rows[41]["EN"].ToString();
                }
                else
                {

                    //Fill Tenant Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenant_Name_DropDownList, "Tenants_Arabic_Name", "Tenants_ID");
                    Tenant_Name_DropDownList.Items.Insert(0, "...............");

                    Filtter_All.Text = Dt.Rows[42]["AR"].ToString();
                    Filtter_Singel.Text = Dt.Rows[43]["AR"].ToString();
                    Filtter_Multi.Text = Dt.Rows[44]["AR"].ToString();
                    lbl_Tenant_Name.Text = Dt.Rows[35]["AR"].ToString();
                    lbl_titelt.Text = Dt.Rows[41]["AR"].ToString();
                    lbl_titel_Tenants_List.Text = Dt.Rows[41]["AR"].ToString();

                }
            }
            _sqlCon.Close();

        }

        protected void Header_Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.Header)
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Titel_1_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_1_Name");
                var lbl_Titel_1_Nationalty = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_1_Nationalty");
                var lbl_Titel_1_Mobile = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_1_Mobile");
                var lbl_Tenants_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_Arabic_Name");
                var lbl_Tenants_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_English_Name");
                var lbl_Arabic_nationality = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Arabic_nationality");
                var lbl_English_nationality = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_English_nationality");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_tenant", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_1_Name.Text = Dt.Rows[35]["EN"].ToString();
                        lbl_Titel_1_Nationalty.Text = Dt.Rows[6]["EN"].ToString();
                        lbl_Titel_1_Mobile.Text = Dt.Rows[12]["EN"].ToString();

                        lbl_Tenants_Arabic_Name.Visible = false; lbl_Tenants_English_Name.Visible = true;
                        lbl_Arabic_nationality.Visible = false; lbl_English_nationality.Visible = true;
                    }
                    else
                    {
                        lbl_Titel_1_Name.Text = Dt.Rows[35]["AR"].ToString();
                        lbl_Titel_1_Nationalty.Text = Dt.Rows[6]["AR"].ToString();
                        lbl_Titel_1_Mobile.Text = Dt.Rows[12]["AR"].ToString();

                        lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;
                        lbl_Arabic_nationality.Visible = true; lbl_English_nationality.Visible = false;
                    }
                }

            }
        }

        protected void Body_Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var Label1 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label1");
                var Label2 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label2");
                var Label3 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label3");
                var Label4 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label4");
                var Label5 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label5");
                var Label6 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label6");
                var Label7 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label7");
                var Label8 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label8");
                var Label9 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label9");
                var Label10 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label10");
                var Label11 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label11");
                var Label12 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label12");
                var Label13 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label13");
                var Label14 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label14");
                var Label15 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label15");



                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_contract", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        Label1.Text = Dt.Rows[67]["EN"].ToString();
                        Label2.Text = Dt.Rows[4]["EN"].ToString();
                        Label3.Text = Dt.Rows[5]["EN"].ToString();
                        Label4.Text = Dt.Rows[68]["EN"].ToString();
                        Label5.Text = Dt.Rows[37]["EN"].ToString() + "/" + Dt.Rows[36]["EN"].ToString();
                        Label6.Text = Dt.Rows[59]["EN"].ToString();
                        Label7.Text = Dt.Rows[39]["EN"].ToString();
                        Label8.Text = Dt.Rows[42]["EN"].ToString();
                        Label9.Text = Dt.Rows[43]["EN"].ToString();
                        Label10.Text = Dt.Rows[62]["EN"].ToString();
                        Label11.Text = Dt.Rows[10]["EN"].ToString();
                        Label12.Text = Dt.Rows[11]["EN"].ToString();
                        Label13.Text = Dt.Rows[58]["EN"].ToString();
                        Label14.Text = Dt.Rows[20]["EN"].ToString();
                        Label15.Text = Dt.Rows[64]["EN"].ToString();
                    }
                    else
                    {
                        Label1.Text = Dt.Rows[67]["AR"].ToString();
                        Label2.Text = Dt.Rows[4]["AR"].ToString();
                        Label3.Text = Dt.Rows[5]["AR"].ToString();
                        Label4.Text = Dt.Rows[68]["AR"].ToString();
                        Label5.Text = Dt.Rows[37]["AR"].ToString() + "/" + Dt.Rows[36]["AR"].ToString();
                        Label6.Text = Dt.Rows[59]["AR"].ToString();
                        Label7.Text = Dt.Rows[39]["AR"].ToString();
                        Label8.Text = Dt.Rows[42]["AR"].ToString();
                        Label9.Text = Dt.Rows[43]["AR"].ToString();
                        Label10.Text = Dt.Rows[62]["AR"].ToString();
                        Label11.Text = Dt.Rows[10]["AR"].ToString();
                        Label12.Text = Dt.Rows[11]["AR"].ToString();
                        Label13.Text = Dt.Rows[58]["AR"].ToString();
                        Label14.Text = Dt.Rows[20]["AR"].ToString();
                        Label15.Text = Dt.Rows[64]["AR"].ToString();
                    }
                }

            }



            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");

                var lbl_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Name");
                var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");

                var lbl_Unit_Arabic_Detail = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Arabic_Detail");
                var lbl_Unit_English_Detail = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_English_Detail");

                var lbl_Unit_Arabic_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Arabic_Condition");
                var lbl_Unit_English_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_English_Condition");

                var lbl_Paymen_Method = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Paymen_Method");



                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                    lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                    lbl_Unit_Arabic_Detail.Visible = false; lbl_Unit_English_Detail.Visible = true;
                    lbl_Unit_Arabic_Condition.Visible = false; lbl_Unit_English_Condition.Visible = true;


                    if (lbl_Paymen_Method.Text == "شيك") { lbl_Paymen_Method.Text = "Cheques"; }
                    else if (lbl_Paymen_Method.Text == "تحويل") { lbl_Paymen_Method.Text = "Transformation"; }
                    else if (lbl_Paymen_Method.Text == "نقداً") { lbl_Paymen_Method.Text = "Cash"; }
                }
                else
                {
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;
                    lbl_Unit_Arabic_Detail.Visible = true; lbl_Unit_English_Detail.Visible = false;
                    lbl_Unit_Arabic_Condition.Visible = true; lbl_Unit_English_Condition.Visible = false;


                    if (lbl_Paymen_Method.Text == "Cheques") { lbl_Paymen_Method.Text = "شيك"; }
                    else if (lbl_Paymen_Method.Text == "Transformation") { lbl_Paymen_Method.Text = "تحويل"; }
                    else if (lbl_Paymen_Method.Text == "Cash") { lbl_Paymen_Method.Text = "نقداً"; }
                }
            }
        }
    }
}