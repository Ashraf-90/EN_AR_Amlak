using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.Services.Description;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class OS_B_U_Arcive : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "properties", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }

            language();
            Get_OS_Arcive_BindData();
            Get_B_Arcive_BindData();
            Get_U_Arcive_BindData();
        }




        protected void Get_OS_Arcive_BindData()
        {
            
                string getOS_ArciveQuari = "select DA.* , UN.Users_Ar_First_Name , UN.Users_Name ,  OS.Owner_Ship_AR_Name , OS.Owner_Ship_EN_Name , OS.owner_ship_Code " +
                                            "from delete_archive DA " +
                                            "left join arcive_ownership OS on (DA.Item_Id = OS.Owner_Ship_Id) " +
                                            "left join users UN on (DA.User_Id = UN.user_ID) " +
                                            "where DA.OS_B_U = 'OS'";
                MySqlCommand getOS_ArciveCmd = new MySqlCommand(getOS_ArciveQuari, _sqlCon);
                MySqlDataAdapter getOS_ArciveDt = new MySqlDataAdapter(getOS_ArciveCmd);
                getOS_ArciveCmd.Connection = _sqlCon;
                _sqlCon.Open();
                getOS_ArciveDt.SelectCommand = getOS_ArciveCmd;
                DataTable getOS_ArciveDataTable = new DataTable();
                getOS_ArciveDt.Fill(getOS_ArciveDataTable);
                if (getOS_ArciveDataTable.Rows.Count > 0)
                {
                    Ownership_GridView.DataSource = getOS_ArciveDataTable;
                    Ownership_GridView.DataBind();
                }
            
                
                _sqlCon.Close();
            
        }



        protected void Get_B_Arcive_BindData()
        {
           
                string getB_ArciveQuari = "select DA.* , " +
                "UN.Users_Ar_First_Name , UN.Users_Name , OS.Owner_Ship_AR_Name , OS.Owner_Ship_EN_Name , OS.owner_ship_Code ,  B.Building_Arabic_Name , B.Building_English_Name , B.Building_NO " +
                "from delete_archive DA " +
                "left join arcive_ownership OS on (DA.Item_Id = OS.Owner_Ship_Id) " +
                " left join arcive_building B on (DA.Item_Id = B.Building_Id) " +
                "left join users UN on (DA.User_Id = UN.user_ID) " +
                "where DA.OS_B_U = 'B'; ";
            MySqlCommand getB_ArciveCmd = new MySqlCommand(getB_ArciveQuari, _sqlCon);
                MySqlDataAdapter getB_ArciveDt = new MySqlDataAdapter(getB_ArciveCmd);
                getB_ArciveCmd.Connection = _sqlCon;
                _sqlCon.Open();
                getB_ArciveDt.SelectCommand = getB_ArciveCmd;
                DataTable getB_ArciveDataTable = new DataTable();
                getB_ArciveDt.Fill(getB_ArciveDataTable);
            if (getB_ArciveDataTable.Rows.Count > 0)
            {
                Building_Table.DataSource = getB_ArciveDataTable;
                Building_Table.DataBind();
            }
            
                
                _sqlCon.Close();
           
        }



        protected void Get_U_Arcive_BindData()
        {

            string getB_ArciveQuari = "select DA.* ,  " +
                                    "UN.Users_Ar_First_Name , UN.Users_Name , " +
                                    "OS.Owner_Ship_AR_Name , OS.Owner_Ship_EN_Name , OS.owner_ship_Code , " +
                                    " B.Building_Arabic_Name , B.Building_English_Name , B.Building_NO , " +
                                    "U.Unit_Number " +
                                    "from delete_archive DA " +
                                    "left join arcive_ownership OS on(DA.Item_Id = OS.Owner_Ship_Id) " +
                                    "left join arcive_building B on(DA.Item_Id = B.Building_Id) " +
                                    "left join arcive_units U on(DA.Item_Id = U.Unit_ID) " +
                                    "left join users UN on(DA.User_Id = UN.user_ID) " +
                                    "where DA.OS_B_U = 'U'; ";




            MySqlCommand getB_ArciveCmd = new MySqlCommand(getB_ArciveQuari, _sqlCon);
            MySqlDataAdapter getB_ArciveDt = new MySqlDataAdapter(getB_ArciveCmd);
            getB_ArciveCmd.Connection = _sqlCon;
            _sqlCon.Open();
            getB_ArciveDt.SelectCommand = getB_ArciveCmd;
            DataTable getB_ArciveDataTable = new DataTable();
            getB_ArciveDt.Fill(getB_ArciveDataTable);
            if (getB_ArciveDataTable.Rows.Count > 0)
            {
                Unit_Table.DataSource = getB_ArciveDataTable;
                Unit_Table.DataBind();
            }
                
            _sqlCon.Close();

        }

        protected void A_1_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible= true;
            B_Arcive.Visible = false;
            U_Arcive.Visible = false;
        }

        protected void A_2_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible = false;
            B_Arcive.Visible = true;
            U_Arcive.Visible = false;
        }

        protected void A_3_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible = false;
            B_Arcive.Visible = false;
            U_Arcive.Visible = true;
        }

        protected void A_4_ServerClick(object sender, EventArgs e)
        {
            OS_Arcive.Visible = true;
            B_Arcive.Visible = true;
            U_Arcive.Visible = true;
        }

        protected void Ownership_GridView_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Users_Ar_First_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_Ar_First_Name");
                var lbl_Delete_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Delete_Date");
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_owner_ship_Code = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_owner_ship_Code");
                var lbl_Reason_Delete = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Reason_Delete");


                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Users_Ar_First_Name.Text = "User Name";
                    lbl_Delete_Date.Text = "Delete Date";
                    lbl_Owner_Ship_AR_Name.Text = "Property Name";
                    lbl_owner_ship_Code.Text = "Property Code";
                    lbl_Reason_Delete.Text= "Reason Of Delete";
                }
                else
                {
                    lbl_Users_Ar_First_Name.Text = "اسم المستخدم";
                    lbl_Delete_Date.Text = "تاريخ الحذف";
                    lbl_Owner_Ship_AR_Name.Text = "اسم الملكية";
                    lbl_owner_ship_Code.Text = "كود الملكية";
                    lbl_Reason_Delete.Text = "سبب الحذف";
                }
            }


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Users_Ar_First_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_Ar_First_Name");
                var lbl_Users_EN_First_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_EN_First_Name");
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Users_Ar_First_Name.Visible= false; lbl_Users_EN_First_Name.Visible= true;
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                }
                else
                {
                    lbl_Users_Ar_First_Name.Visible = true; lbl_Users_EN_First_Name.Visible = false;
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                }
            }
        }

        protected void Building_GridView_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Users_Ar_First_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_Ar_First_Name");
                var lbl_Delete_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Delete_Date");
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_owner_ship_Code = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_owner_ship_Code");
                var lbl_Building_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Name");
                var lbl_Building_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_NO");
                var lbl_Reason_Delete = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Reason_Delete");


                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Users_Ar_First_Name.Text = "User Name";
                    lbl_Delete_Date.Text = "Delete Date";
                    lbl_Owner_Ship_AR_Name.Text = "Property Name";
                    lbl_owner_ship_Code.Text = "Property Code";
                    lbl_Reason_Delete.Text = "Reason Of Delete";
                    lbl_Building_Name.Text = "Building Name";
                    lbl_Building_NO.Text = "Building NO";
                }
                else
                {
                    lbl_Users_Ar_First_Name.Text = "اسم المستخدم";
                    lbl_Delete_Date.Text = "تاريخ الحذف";
                    lbl_Owner_Ship_AR_Name.Text = "اسم الملكية";
                    lbl_owner_ship_Code.Text = "كود الملكية";
                    lbl_Reason_Delete.Text = "سبب الحذف";
                    lbl_Building_Name.Text = "اسم البناء";
                    lbl_Building_NO.Text = "رقم البناء";
                }
            }


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Users_Ar_First_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_Ar_First_Name");
                var lbl_Users_EN_First_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_EN_First_Name");
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");

                var lbl_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Name");
                var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Users_Ar_First_Name.Visible = false; lbl_Users_EN_First_Name.Visible = true;
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                    lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                }
                else
                {
                    lbl_Users_Ar_First_Name.Visible = true; lbl_Users_EN_First_Name.Visible = false;
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;
                }
            }
        }

        protected void Unit_Table_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Users_Ar_First_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_Ar_First_Name");
                var lbl_Delete_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Delete_Date");
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_owner_ship_Code = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_owner_ship_Code");
                var lbl_Building_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Name");
                var lbl_Building_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_NO");
                var lbl_Unit_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Number");
                var lbl_Reason_Delete = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Reason_Delete");


                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Users_Ar_First_Name.Text = "User Name";
                    lbl_Delete_Date.Text = "Delete Date";
                    lbl_Owner_Ship_AR_Name.Text = "Property Name";
                    lbl_owner_ship_Code.Text = "Property Code";
                    lbl_Reason_Delete.Text = "Reason Of Delete";
                    lbl_Building_Name.Text = "Building Name";
                    lbl_Building_NO.Text = "Building NO";
                    lbl_Unit_Number.Text = "Unit NO";
                }
                else
                {
                    lbl_Users_Ar_First_Name.Text = "اسم المستخدم";
                    lbl_Delete_Date.Text = "تاريخ الحذف";
                    lbl_Owner_Ship_AR_Name.Text = "اسم الملكية";
                    lbl_owner_ship_Code.Text = "كود الملكية";
                    lbl_Reason_Delete.Text = "سبب الحذف";
                    lbl_Building_Name.Text = "اسم البناء";
                    lbl_Building_NO.Text = "رقم البناء";
                    lbl_Unit_Number.Text = "رقم الوحدة";
                }
            }


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Users_Ar_First_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_Ar_First_Name");
                var lbl_Users_EN_First_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Users_EN_First_Name");
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");

                var lbl_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Name");
                var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Users_Ar_First_Name.Visible = false; lbl_Users_EN_First_Name.Visible = true;
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                    lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                }
                else
                {
                    lbl_Users_Ar_First_Name.Visible = true; lbl_Users_EN_First_Name.Visible = false;
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;
                }
            }
        }




        protected void language()
        {

            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            if (Session["Langues"].ToString() == "1")
            {

                lbl_Property.Text = "Properties Archive";
                lbl_Building.Text = "Building Archive";
                lbl_Unit.Text = "Units Archive";
                lbl_All.Text = "ALL";
                lbl_titel_Property.Text = "Properties Archive";
                lbl_titel_Builidng.Text = "Building Archive";
                lbl_titel_unit.Text = "Units Archive";
            }
            else
            {
                lbl_Property.Text = "أرشيف الملكيات";
                lbl_Building.Text = "أرشيف الأبنية";
                lbl_Unit.Text = "أرشيف الوحدات";
                lbl_All.Text = "الكل";
                lbl_titel_Property.Text = "أرشيف الملكيات";
                lbl_titel_Builidng.Text = "أرشيف الأبنية";
                lbl_titel_unit.Text = "أرشيف الوحدات";
            }
            
        }
    }
}