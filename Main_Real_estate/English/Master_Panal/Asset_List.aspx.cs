using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;


namespace Main_Real_estate.English.Master_Panal
{
    public partial class Assset_List : System.Web.UI.Page
    {
        //MySqlConnection SqlCon = Helper.GetConnection();
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                language();
                Asset_List_BindData();
            }
        }
        protected void Asset_List_BindData(string sortExpression = null)
        {
            using (MySqlCommand cmd = new MySqlCommand("Asset_List", _sqlCon))
            {
                using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Assset_List_1.DataSource = dt;
                    Assset_List_1.DataBind();
                }
            }
        }

        protected void Asset_Details(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Asset_Details.aspx?Id=" + id);
        }
        protected void Edit_Asset(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Edit_Asset.aspx?Id=" + id);
        }
        protected void Delete_Asset(object sender, EventArgs e)
        {
            try
            {
                string id = (sender as LinkButton).CommandArgument;
                _sqlCon.Open();
                string quary1 = "DELETE FROM assets WHERE Assets_Id=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(quary1, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", id);
                mySqlCmd.ExecuteNonQuery();




                string PM_quary = "DELETE FROM periodic_maintenence WHERE Asset_ID=@ID ";
                MySqlCommand PM_mySqlCmd = new MySqlCommand(PM_quary, _sqlCon);
                PM_mySqlCmd.Parameters.AddWithValue("@ID", id);
                PM_mySqlCmd.ExecuteNonQuery();
                _sqlCon.Close();
                Response.Redirect(Request.RawUrl);
            }
            catch
            {
                Response.Write(
                    @"<script language='javascript'>alert('عذراً لا يمكن حذف هذا الأصل')</script>");
            }

        }




        protected void The_Table_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lbl_1 = (e.Item.FindControl("lbl_1") as Label);
                Label lbl_2 = (e.Item.FindControl("lbl_2") as Label);
                Label lbl_3 = (e.Item.FindControl("lbl_3") as Label);
                Label lbl_4 = (e.Item.FindControl("lbl_4") as Label);
                Label lbl_5 = (e.Item.FindControl("lbl_5") as Label);
                Label lbl_6 = (e.Item.FindControl("lbl_6") as Label);
                Label lbl_7 = (e.Item.FindControl("lbl_7") as Label);

                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_master", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_1.Text = Dt.Rows[281]["EN"].ToString();
                        lbl_2.Text = "Name";
                        lbl_3.Text = Dt.Rows[158]["EN"].ToString();
                        lbl_4.Text = Dt.Rows[147]["EN"].ToString();
                        lbl_5.Text = "Main Location";
                        lbl_6.Text = Dt.Rows[169]["EN"].ToString();
                        lbl_7.Text = Dt.Rows[154]["EN"].ToString();
                    }
                    else
                    {
                        lbl_1.Text = Dt.Rows[281]["AR"].ToString();
                        lbl_2.Text = "الاسم";
                        lbl_3.Text = Dt.Rows[158]["AR"].ToString();
                        lbl_4.Text = Dt.Rows[147]["AR"].ToString();
                        lbl_5.Text = "الموقع العام";
                        lbl_6.Text = Dt.Rows[169]["AR"].ToString();
                        lbl_7.Text = Dt.Rows[154]["AR"].ToString();
                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl_Categoty_AR = (e.Item.FindControl("lbl_Categoty_AR") as Label);
                Label lbl_Categoty_EN = (e.Item.FindControl("lbl_Categoty_EN") as Label);
                Label lbl_Assets_Arabic_Name = (e.Item.FindControl("lbl_Assets_Arabic_Name") as Label);
                Label lbl_Assets_English_Name = (e.Item.FindControl("lbl_Assets_English_Name") as Label);
                Label lbl_Asset_Arabic_Condition = (e.Item.FindControl("lbl_Asset_Arabic_Condition") as Label);
                Label lbl_Asset_English_Condition = (e.Item.FindControl("lbl_Asset_English_Condition") as Label);
                Label lbl_Asset_Arabic_Location = (e.Item.FindControl("lbl_Asset_Arabic_Location") as Label);
                Label lbl_Asset_English_Location = (e.Item.FindControl("lbl_Asset_English_Location") as Label);
                Label lbl_Vendor_Arabic_Type = (e.Item.FindControl("lbl_Vendor_Arabic_Type") as Label);
                Label lbl_Vendor_English_Type = (e.Item.FindControl("lbl_Vendor_English_Type") as Label);
                Label lbl_Main_Place = (e.Item.FindControl("lbl_Main_Place") as Label);

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Categoty_AR.Visible = false; lbl_Categoty_EN.Visible = true;
                    lbl_Assets_Arabic_Name.Visible = false; lbl_Assets_English_Name.Visible = true;
                    lbl_Asset_Arabic_Condition.Visible = false; lbl_Asset_English_Condition.Visible = true;
                    lbl_Asset_Arabic_Location.Visible = false; lbl_Asset_English_Location.Visible = true;
                    lbl_Vendor_Arabic_Type.Visible = false; lbl_Vendor_English_Type.Visible = true;

                    if (lbl_Main_Place.Text == "ملكية") { lbl_Main_Place.Text = "Property"; }
                    else if (lbl_Main_Place.Text == "بناء") { lbl_Main_Place.Text = "Building"; }
                    else if (lbl_Main_Place.Text == "وحدة") { lbl_Main_Place.Text = "Unit"; }
                }
                else
                {
                    lbl_Categoty_AR.Visible = true; lbl_Categoty_EN.Visible = false;
                    lbl_Assets_Arabic_Name.Visible = true; lbl_Assets_English_Name.Visible = false;
                    lbl_Asset_Arabic_Condition.Visible = true; lbl_Asset_English_Condition.Visible = false;
                    lbl_Asset_Arabic_Location.Visible = true; lbl_Asset_English_Location.Visible = false;
                    lbl_Vendor_Arabic_Type.Visible = true; lbl_Vendor_English_Type.Visible = false;

                    if (lbl_Main_Place.Text == "Property") { lbl_Main_Place.Text = "ملكية"; }
                    else if (lbl_Main_Place.Text == "Building") { lbl_Main_Place.Text = "بناء"; }
                    else if (lbl_Main_Place.Text == "Unit") { lbl_Main_Place.Text = "وحدة"; }
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
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_master", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_titel.Text = Dt.Rows[280]["EN"].ToString();
                    ADD.Text = Dt.Rows[54]["EN"].ToString();
                }
                else
                {
                    lbl_titel.Text = Dt.Rows[280]["AR"].ToString();
                    ADD.Text = Dt.Rows[54]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}