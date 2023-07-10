using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Asset_Details : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            language();
            _sqlCon.Open();
            string AssettId = Request.QueryString["Id"];
            using (MySqlCommand AssetDetailsCmd = new MySqlCommand("Asset_Detail", _sqlCon))
            {
                AssetDetailsCmd.CommandType = CommandType.StoredProcedure;
                AssetDetailsCmd.Parameters.AddWithValue("@Id", AssettId);
                using (MySqlDataAdapter AssetDetailsSda = new MySqlDataAdapter(AssetDetailsCmd))
                {
                    DataTable AssetDetailsDt = new DataTable();
                    AssetDetailsSda.Fill(AssetDetailsDt);

                    lbl_Serial_Number.Text = AssetDetailsDt.Rows[0]["Serial_Number"].ToString();
                    lbl_Assets_Arabic_Name.Text = AssetDetailsDt.Rows[0]["Assets_Arabic_Name"].ToString();
                    lbl_Assets_English_Name.Text = AssetDetailsDt.Rows[0]["Assets_English_Name"].ToString();
                    lbl_Assets_Value.Text = AssetDetailsDt.Rows[0]["Assets_Value"].ToString();
                    lbl_Description.Text = AssetDetailsDt.Rows[0]["Description"].ToString();
                    if (AssetDetailsDt.Rows[0]["How_To_Get"].ToString() == "ضمن مشروع" || AssetDetailsDt.Rows[0]["How_To_Get"].ToString() == "Within a Project")
                    {
                        Contractor_Div.Visible = true;
                        Vendor_Div.Visible = true;
                        Contractor_Waranty_Div.Visible = true;
                        Contractor_Waranty_Remaining_Days_Div.Visible = true;
                        Buyer_Div.Visible = false;
                    }
                    else
                    {
                        Contractor_Div.Visible = false;
                        Vendor_Div.Visible = true;
                        Contractor_Waranty_Div.Visible = false;
                        Contractor_Waranty_Remaining_Days_Div.Visible = false;
                        Buyer_Div.Visible = true;
                    }

                    if (AssetDetailsDt.Rows[0]["Contractor_Waranty_Period"].ToString() != "")
                    {
                        if (AssetDetailsDt.Rows[0]["Purchase_Date"].ToString() != "")
                        {
                            DateTime Today = DateTime.Now;
                            DateTime Purchase_Date = Convert.ToDateTime(AssetDetailsDt.Rows[0]["Purchase_Date"].ToString());

                            int Contractor_Waranty_Period = Convert.ToInt32(AssetDetailsDt.Rows[0]["Contractor_Waranty_Period"].ToString());

                            int difference_between_dates = (int)(Today - Purchase_Date).TotalDays;
                            int Remaining_Day = Contractor_Waranty_Period - difference_between_dates;
                            if (Remaining_Day > 0)
                            {
                                if (Session["Langues"].ToString() == "1") { lbl_Contractor_Waranty_Remaining_Days.Text = Remaining_Day.ToString() + "Days"; }
                                else { lbl_Contractor_Waranty_Remaining_Days.Text = Remaining_Day.ToString() + "يوم"; }
                                    
                            }
                            else
                            {
                                if (Session["Langues"].ToString() == "1") { lbl_Contractor_Waranty_Remaining_Days.Text = " Expired"; }
                                else { lbl_Contractor_Waranty_Remaining_Days.Text = " منتهية"; }
                                    
                                lbl_Contractor_Waranty_Remaining_Days.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                        else
                        {
                            if (Session["Langues"].ToString() == "1") { lbl_Contractor_Waranty_Remaining_Days.Text = "Unknown (You must specify the date of purchase)"; }
                            else { lbl_Contractor_Waranty_Remaining_Days.Text = "غير معروفة(يجب تحديد تاريخ الشراء)"; }
                                
                        }
                        
                    }
                    if (AssetDetailsDt.Rows[0]["Waranty_Period"].ToString() != "")
                    {
                        if (AssetDetailsDt.Rows[0]["Waranty_Start_Date"].ToString() != "")
                        {
                            DateTime Today = DateTime.Now;
                            DateTime Waranty_Start_Date = Convert.ToDateTime(AssetDetailsDt.Rows[0]["Waranty_Start_Date"].ToString());
                            int Waranty_Period = Convert.ToInt32(AssetDetailsDt.Rows[0]["Waranty_Period"].ToString());
                            int difference_between_dates = (int)(Today - Waranty_Start_Date).TotalDays;
                            int Remaining_Day = Waranty_Period - difference_between_dates;


                            if (Remaining_Day > 0)
                            {
                                if (Session["Langues"].ToString() == "1") { lbl_Waranty_Remaining_Days.Text = Remaining_Day.ToString() + "Days"; }
                                else { lbl_Waranty_Remaining_Days.Text = Remaining_Day.ToString() + "يوم"; }
                                    
                            }
                            else
                            {
                                if (Session["Langues"].ToString() == "1") { lbl_Waranty_Remaining_Days.Text = " Expired"; }
                                else { lbl_Waranty_Remaining_Days.Text = " منتهية"; }
                                    
                                lbl_Waranty_Remaining_Days.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                        else
                        {
                            if (Session["Langues"].ToString() == "1") { lbl_Waranty_Remaining_Days.Text = "Unknown (You must specify the warranty start date)"; }
                            else { lbl_Waranty_Remaining_Days.Text = "غير معروفة(يجب تحديد تاريخ بدء الضمان)"; }
                                
                        }

                           
                    }



                    if (Session["Langues"].ToString() == "1")
                    {
                        if(AssetDetailsDt.Rows[0]["How_To_Get"].ToString()== "ضمن مشروع") { lbl_How_To_Get.Text = "Within a Project"; }
                        else if (AssetDetailsDt.Rows[0]["How_To_Get"].ToString() == "شراء") { lbl_How_To_Get.Text = "Buying"; }
                    }
                    else
                    {
                        if (AssetDetailsDt.Rows[0]["How_To_Get"].ToString() == "Within a Project") { lbl_How_To_Get.Text = "ضمن مشروع"; }
                        else if (AssetDetailsDt.Rows[0]["How_To_Get"].ToString() == "Buying") { lbl_How_To_Get.Text = "شراء"; }
                    }
                    if (Session["Langues"].ToString() == "1") 
                    {
                        lbl_Contractor.Text = AssetDetailsDt.Rows[0]["Contractor_En_Name"].ToString();
                        lbl_Buyer.Text = AssetDetailsDt.Rows[0]["Employee_English_name"].ToString();
                        lbl_Vendor_Arabic_Type.Text = AssetDetailsDt.Rows[0]["Vendor_English_Type"].ToString();
                        lbl_Asset_Arabic_Condition.Text = AssetDetailsDt.Rows[0]["Asset_English_Condition"].ToString();
                        lbl_Contractor_Waranty_Period.Text = AssetDetailsDt.Rows[0]["Contractor_Waranty_Period"].ToString() + "Days";

                        if (AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "ملكية") { lbl_Main_Place.Text = "Property"; }
                        else if (AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "بناء") { lbl_Main_Place.Text = "Building"; }
                        else if (AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "وحدة") { lbl_Main_Place.Text = "Unit"; }
                        else if (AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "مخزن") { lbl_Main_Place.Text = "Stor"; }


                        if (AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "مخزن" || AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "Stor")
                        {
                            lbl_Location_Details.Text = AssetDetailsDt.Rows[0]["Inventory_English_name"].ToString() + "/" + AssetDetailsDt.Rows[0]["Inventory_Location"].ToString();
                        }
                        else
                        {
                            lbl_Location_Details.Text = AssetDetailsDt.Rows[0]["Owner_Ship_En_Name"].ToString() + "/" +
                            AssetDetailsDt.Rows[0]["Building_English_Name"].ToString() + "/" +
                            AssetDetailsDt.Rows[0]["Unit_Number"].ToString();
                        }
                    }
                    else 
                    {
                        lbl_Contractor.Text = AssetDetailsDt.Rows[0]["Contractor_Ar_Name"].ToString();
                        lbl_Buyer.Text = AssetDetailsDt.Rows[0]["Employee_Arabic_name"].ToString();
                        lbl_Vendor_Arabic_Type.Text = AssetDetailsDt.Rows[0]["Vendor_Arabic_Type"].ToString();
                        lbl_Asset_Arabic_Condition.Text = AssetDetailsDt.Rows[0]["Asset_Arabic_Condition"].ToString();
                        lbl_Contractor_Waranty_Period.Text = AssetDetailsDt.Rows[0]["Contractor_Waranty_Period"].ToString() + "يوم";

                        if (AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "Property") { lbl_Main_Place.Text = "ملكية"; }
                        else if (AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "Building") { lbl_Main_Place.Text = "بناء"; }
                        else if (AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "Unit") { lbl_Main_Place.Text = "وحدة"; }
                        else if (AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "Stor") { lbl_Main_Place.Text = "مخزن"; }


                        if (AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "مخزن" || AssetDetailsDt.Rows[0]["Main_Place"].ToString() == "Stor")
                        {
                            lbl_Location_Details.Text = AssetDetailsDt.Rows[0]["Inventory_Arabic_name"].ToString() + "/" + AssetDetailsDt.Rows[0]["Inventory_Location"].ToString();
                        }
                        else
                        {
                            lbl_Location_Details.Text = AssetDetailsDt.Rows[0]["Owner_Ship_AR_Name"].ToString() + "/" +
                            AssetDetailsDt.Rows[0]["Building_Arabic_Name"].ToString() + "/" +
                            AssetDetailsDt.Rows[0]["Unit_Number"].ToString();
                        }
                    }
                    
                    lbl_Purchase_Date.Text = AssetDetailsDt.Rows[0]["Purchase_Date"].ToString();
                    lbl_Waranty_Period.Text = AssetDetailsDt.Rows[0]["Waranty_Period"].ToString();
                    lbl_Waranty_Start_Date.Text = AssetDetailsDt.Rows[0]["Waranty_Start_Date"].ToString();
                    lbl_Waranty_End_Date.Text = AssetDetailsDt.Rows[0]["Waranty_End_Date"].ToString();


                    string Waranty_Certificate_Path = AssetDetailsDt.Rows[0]["Waranty_Certificate_Path"].ToString();
                    if (Waranty_Certificate_Path == "No File")
                    {
                        Link_Waranty_Certificate_Path.Visible = false;
                    }
                    else
                    {
                        lbl_Link_Waranty_Certificate.Text = AssetDetailsDt.Rows[0]["Waranty_Certificate"].ToString();
                        Link_Waranty_Certificate_Path.HRef = AssetDetailsDt.Rows[0]["Waranty_Certificate_Path"].ToString();
                    }

                    Link_Waranty_Certificate_Path.Target = "_blank";

                }
            }
        }

        protected void btn_Back_To_Asset_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Asset_List.aspx");
        }





        //******************************************************************************************************************************************
        //************************************************** languages ****************************************************************
        //******************************************************************************************************************************************

        protected void language()
        {

            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            _sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_master", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_1.Text = Dt.Rows[282]["EN"].ToString();
                    lbl_2.Text = Dt.Rows[283]["EN"].ToString();
                    lbl_3.Text = Dt.Rows[284]["EN"].ToString();
                    lbl_4.Text = Dt.Rows[157]["EN"].ToString();
                    lbl_5.Text = Dt.Rows[156]["EN"].ToString();
                    lbl_6.Text = Dt.Rows[161]["EN"].ToString();
                    lbl_7.Text = Dt.Rows[162]["EN"].ToString();
                    lbl_8.Text = Dt.Rows[151]["EN"].ToString();
                    lbl_9.Text = Dt.Rows[152]["EN"].ToString();
                    lbl_10.Text = Dt.Rows[153]["EN"].ToString();
                    lbl_11.Text = Dt.Rows[154]["EN"].ToString();
                    lbl_12.Text = Dt.Rows[155]["EN"].ToString();
                    lbl_13.Text = Dt.Rows[285]["EN"].ToString();
                    lbl_14.Text = Dt.Rows[159]["EN"].ToString();
                    lbl_15.Text = Dt.Rows[147]["EN"].ToString();
                    lbl_16.Text = Dt.Rows[286]["EN"].ToString();
                    lbl_17.Text = Dt.Rows[287]["EN"].ToString();
                    lbl_18.Text = Dt.Rows[288]["EN"].ToString();
                    lbl_19.Text = Dt.Rows[165]["EN"].ToString();
                    lbl_20.Text = Dt.Rows[166]["EN"].ToString();
                    lbl_21.Text = Dt.Rows[285]["EN"].ToString();
                    lbl_22.Text = Dt.Rows[167]["EN"].ToString();
                    btn_Back_To_Asset_List.Text= Dt.Rows[174]["EN"].ToString();
                }
                else
                {
                    lbl_1.Text = Dt.Rows[282]["AR"].ToString();
                    lbl_2.Text = Dt.Rows[283]["AR"].ToString();
                    lbl_3.Text = Dt.Rows[284]["AR"].ToString();
                    lbl_4.Text = Dt.Rows[157]["AR"].ToString();
                    lbl_5.Text = Dt.Rows[156]["AR"].ToString();
                    lbl_6.Text = Dt.Rows[161]["AR"].ToString();
                    lbl_7.Text = Dt.Rows[162]["AR"].ToString();
                    lbl_8.Text = Dt.Rows[151]["AR"].ToString();
                    lbl_9.Text = Dt.Rows[152]["AR"].ToString();
                    lbl_10.Text = Dt.Rows[153]["AR"].ToString();
                    lbl_11.Text = Dt.Rows[154]["AR"].ToString();
                    lbl_12.Text = Dt.Rows[155]["AR"].ToString();
                    lbl_13.Text = Dt.Rows[285]["AR"].ToString();
                    lbl_14.Text = Dt.Rows[159]["AR"].ToString();
                    lbl_15.Text = Dt.Rows[147]["AR"].ToString();
                    lbl_16.Text = Dt.Rows[286]["AR"].ToString();
                    lbl_17.Text = Dt.Rows[287]["AR"].ToString();
                    lbl_18.Text = Dt.Rows[288]["AR"].ToString();
                    lbl_19.Text = Dt.Rows[165]["AR"].ToString();
                    lbl_20.Text = Dt.Rows[166]["AR"].ToString();
                    lbl_21.Text = Dt.Rows[285]["AR"].ToString();
                    lbl_22.Text = Dt.Rows[167]["AR"].ToString();
                    btn_Back_To_Asset_List.Text = Dt.Rows[174]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}