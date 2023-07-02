using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Unit_List_Status : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            string Status_ID = Request.QueryString["Id"];
            Get_Unit_List_status_BindData();
        }
        protected void Get_Unit_List_status_BindData()
        {
            try
            {
                string Status_ID = Request.QueryString["Id"];
                string getUnit_List_statusQuari = "SELECT  " +
                    "U.* ,  " +
                    "U.Image_One_Path ,  " +
                    " U.Image_Two_Path ,  " +
                    "U.Image_Three_Path , " +
                    "U.Image_Four_Path ,   " +
                    " UT.*  , " +
                    "UC.* , " +
                    " UD.* ,  " +
                    " B.Building_Arabic_Name , " +
                    " B.Building_English_Name , " +
                    " B.Building_NO , " +
                    " O.Owner_Ship_AR_Name, " +
                    " O.Owner_Ship_EN_Name, " +
                    " O.Street_NO, " +
                    " O.Street_Name " +
                    " FROM units U " +
                    " left join unit_type UT on(U.unit_type_Unit_Type_Id = UT.Unit_Type_Id) " +
                    " left join unit_condition UC on(U.unit_condition_Unit_Condition_Id = UC.Unit_Condition_Id) " +
                    " left join unit_detail UD on(U.unit_detail_Unit_Detail_Id = UD.Unit_Detail_Id) " +
                    " left join building B on(U.building_Building_Id = B.Building_Id) " +
                    " left join owner_ship O on(B.owner_ship_Owner_Ship_Id = O.Owner_Ship_Id) " +
                    " where U.unit_condition_Unit_Condition_Id = '"+Status_ID+"' And U.Half = '0' ; ";

                MySqlCommand getUnit_List_statusCmd = new MySqlCommand(getUnit_List_statusQuari, _sqlCon);
                MySqlDataAdapter getUnit_List_statusDt = new MySqlDataAdapter(getUnit_List_statusCmd);
                getUnit_List_statusCmd.Connection = _sqlCon;
                _sqlCon.Open();
                getUnit_List_statusDt.SelectCommand = getUnit_List_statusCmd;
                DataTable getUnit_List_statusDataTable = new DataTable();
                getUnit_List_statusDt.Fill(getUnit_List_statusDataTable);
                eeeee.DataSource = getUnit_List_statusDataTable;
                eeeee.DataBind();
                _sqlCon.Close();
            }
            catch (Exception ex)
            {
            }
        }

        protected void eeeee_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Titel_Unit_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Unit_NO");
                var lbl_Titel_Unit_Space = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Unit_Space");
                var lbl_Titel_Floor_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Floor_Number");
                var lbl_Titel_current_situation = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_current_situation");
                var lbl_Titel_Unit_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Unit_Type");
                var lbl_Titel_Unit_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Unit_Condition");
                var lbl_Titel_virtual_Value = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_virtual_Value");
                var lbl_Titel_Unit_Detail = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Unit_Detail");
                var lbl_Titel_Owner_Ship = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Owner_Ship");
                var lbl_Titel_Building = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building");



                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages ", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Owner_Ship.Text = Dt.Rows[44]["EN"].ToString();
                        lbl_Titel_Building.Text = Dt.Rows[59]["EN"].ToString();
                        lbl_Titel_Unit_NO.Text = Dt.Rows[86]["EN"].ToString();
                        lbl_Titel_Unit_Space.Text = Dt.Rows[82]["EN"].ToString();
                        lbl_Titel_Floor_Number.Text = Dt.Rows[87]["EN"].ToString();
                        lbl_Titel_current_situation.Text = Dt.Rows[83]["EN"].ToString();
                        lbl_Titel_Unit_Type.Text = Dt.Rows[79]["EN"].ToString();
                        lbl_Titel_Unit_Condition.Text = Dt.Rows[80]["EN"].ToString();
                        lbl_Titel_virtual_Value.Text = Dt.Rows[84]["EN"].ToString();
                        lbl_Titel_Unit_Detail.Text = Dt.Rows[81]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Titel_Owner_Ship.Text = Dt.Rows[44]["AR"].ToString();
                        lbl_Titel_Building.Text = Dt.Rows[59]["AR"].ToString();
                        lbl_Titel_Unit_NO.Text = Dt.Rows[86]["AR"].ToString();
                        lbl_Titel_Unit_Space.Text = Dt.Rows[82]["AR"].ToString();
                        lbl_Titel_Floor_Number.Text = Dt.Rows[87]["AR"].ToString();
                        lbl_Titel_current_situation.Text = Dt.Rows[83]["AR"].ToString();
                        lbl_Titel_Unit_Type.Text = Dt.Rows[79]["AR"].ToString();
                        lbl_Titel_Unit_Condition.Text = Dt.Rows[80]["AR"].ToString();
                        lbl_Titel_virtual_Value.Text = Dt.Rows[84]["AR"].ToString();
                        lbl_Titel_Unit_Detail.Text = Dt.Rows[81]["AR"].ToString();

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
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");
                var lbl_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Name");
                var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Unit_Arabic_Type.Visible= false; lbl_Unit_English_Type.Visible = true;
                    lbl_Unit_Arabic_Condition.Visible = false; lbl_Unit_English_Condition.Visible = true;
                    lbl_Unit_Arabic_Detail.Visible = false; lbl_Unit_English_Detail.Visible = true;
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                    lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                }
                else
                {
                    lbl_Unit_Arabic_Type.Visible = true; lbl_Unit_English_Type.Visible = false;
                    lbl_Unit_Arabic_Condition.Visible = true; lbl_Unit_English_Condition.Visible = false;
                    lbl_Unit_Arabic_Detail.Visible = true; lbl_Unit_English_Detail.Visible = false;
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;

                }


            }
        }
    }
}