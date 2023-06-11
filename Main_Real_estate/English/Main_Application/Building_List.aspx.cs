using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Building_List : System.Web.UI.Page
    {
        private int _size = 0;

        //MySqlConnection SqlCon = Helper.GetConnection();
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Add_permission(_sqlCon, Session["Role"].ToString(), "properties", Add);
            }
            catch { Response.Redirect("Log_In.aspx"); }

            if (!IsPostBack)
            {
                language();
                Building_List_BindData();
            }
        }

        protected void Building_List_BindData(string sortExpression = null)
        {
            try
            {
                using (MySqlCommand cmd = new MySqlCommand("Buliding_list", _sqlCon))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        building_List.DataSource = dt;
                        building_List.DataBind();
                    }
                }
            }
            catch
            {
                Response.Write(
                    @"<script language='javascript'>alert('OOPS!!! The Building List Cannt Display')</script>");
            }
        }

        protected void Delete_Building(object sender, EventArgs e)
        {
            try
            {
                string buildingId = (sender as LinkButton).CommandArgument;
                _sqlCon.Open();
                string deleteBuildingQuary = "DELETE FROM building WHERE Building_Id=@ID ";
                MySqlCommand deleteBuildingCmd = new MySqlCommand(deleteBuildingQuary, _sqlCon);
                deleteBuildingCmd.Parameters.AddWithValue("@ID", buildingId);
                deleteBuildingCmd.ExecuteNonQuery();
                _sqlCon.Close();
                Response.Redirect(Request.RawUrl);
            }
            catch
            {
                Response.Write(
                    @"<script language='javascript'>alert('This Building Cannot Be Removed!!! Because It Contains  Units')</script>");
            }
        }

        protected void Edit_Building(object sender, EventArgs e)
        {
            Session["B_Back"] = "1";
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Edit_Building.aspx?Id=" + id);
        }

        protected void Details_Building(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Building_Dtl.aspx?Id=" + id);
        }

        protected void building_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");
                var lbl_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Name");
                var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");
                var Building_Arabic_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("Building_Arabic_Condition");
                var Building_English_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("Building_English_Condition");
                var lbl_Building_Arabic_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Type");
                var lbl_Building_English_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Type");
                var Label10 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label10");//رخصة بناء
                var Label1 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label1");// شهادة إتمام
                var Label2 = (System.Web.UI.WebControls.Label)e.Item.FindControl("Label2");// خرائط


                LinkButton Edit = e.Item.FindControl("Edit") as LinkButton;
                Utilities.Roles.Edit_permission(_sqlCon, Session["Role"].ToString(), "properties", Edit);

                Label lbl_Building_Image = e.Item.FindControl("lbl_Building_Image") as Label;
                Image Building_Image = e.Item.FindControl("Building_Image") as Image;
                if (lbl_Building_Image.Text == "No File") { Building_Image.Visible = false; } else { Building_Image.Visible = true; }



                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                    lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                    Building_Arabic_Condition.Visible = false; Building_English_Condition.Visible = true;
                    lbl_Building_Arabic_Type.Visible = false; lbl_Building_English_Type.Visible = true;
                    Label10.Text = "Building Permit"; Label1.Text = "Completion Certificate"; Label2.Text = "Maps";
                }
                else
                {
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;
                    Building_Arabic_Condition.Visible = true; Building_English_Condition.Visible = false;
                    lbl_Building_Arabic_Type.Visible = true; lbl_Building_English_Type.Visible = false;
                    Label10.Text = "رخصة بناء"; Label1.Text = "شهادة إتمام"; Label2.Text = "خرائط";
                }
            }


            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Titel_Owner_Ship_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Owner_Ship_Name");
                var lbl_Titel_Building_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Name");
                var lbl_Titel_Building_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_NO");
                var lbl_Titel_Building_Area = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Area");
                var lbl_Titel_Maintenance_status = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Maintenance_status");
                var lbl_Titel_Building_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Condition");
                var lbl_Titel_Building_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Type");
                var lbl_Titel_Building_Value = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Value");
                var lbl_Titel_Building_Photo = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Photo");





                _sqlCon.Open();
                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Owner_Ship_Name.Text = Dt.Rows[44]["EN"].ToString();
                        lbl_Titel_Building_Name.Text = Dt.Rows[59]["EN"].ToString();
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["EN"].ToString();
                        lbl_Titel_Building_Area.Text = Dt.Rows[60]["EN"].ToString();
                        lbl_Titel_Maintenance_status.Text = Dt.Rows[63]["EN"].ToString();
                        lbl_Titel_Building_Condition.Text = Dt.Rows[61]["EN"].ToString();
                        lbl_Titel_Building_Type.Text = Dt.Rows[62]["EN"].ToString();
                        lbl_Titel_Building_Value.Text = Dt.Rows[76]["EN"].ToString();
                        lbl_Titel_Building_Photo.Text = Dt.Rows[68]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Titel_Owner_Ship_Name.Text = Dt.Rows[44]["AR"].ToString();
                        lbl_Titel_Building_Name.Text = Dt.Rows[59]["AR"].ToString();
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["AR"].ToString();
                        lbl_Titel_Building_Area.Text = Dt.Rows[60]["AR"].ToString();
                        lbl_Titel_Maintenance_status.Text = Dt.Rows[63]["AR"].ToString();
                        lbl_Titel_Building_Condition.Text = Dt.Rows[61]["AR"].ToString();
                        lbl_Titel_Building_Type.Text = Dt.Rows[62]["AR"].ToString();
                        lbl_Titel_Building_Value.Text = Dt.Rows[76]["AR"].ToString();
                        lbl_Titel_Building_Photo.Text = Dt.Rows[68]["AR"].ToString();
                    }
                }
                _sqlCon.Close();
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
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_titel_Building_List.Text = Dt.Rows[2]["EN"].ToString() + " List";
                    Add.Text = Dt.Rows[75]["EN"].ToString();
                }
                else
                {
                    lbl_titel_Building_List.Text = " قائمة " + Dt.Rows[2]["AR"].ToString();
                    Add.Text = Dt.Rows[75]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}