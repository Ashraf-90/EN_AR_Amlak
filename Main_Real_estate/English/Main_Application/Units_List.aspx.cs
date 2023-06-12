using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Units_List1 : System.Web.UI.Page
    {
        private int _size = 0;
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Add_permission(_sqlCon, Session["Role"].ToString(), "properties", Add);
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "properties", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!IsPostBack)
            {
                language();
                BindData();
            }
        }

        protected void BindData(string sortExpression = null)
        {
            
            using (MySqlCommand cmd = new MySqlCommand("Unit_List", _sqlCon))
            {
                using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    eeeee.DataSource = dt;
                    eeeee.DataBind();
                }
            }
        }


        protected void Edit_Unit(object sender, EventArgs e)
        {
            Session["U_Back"] = "1";
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Edit_Units.aspx?Id=" + id);
        }

        protected void Details_Unit(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Unit_DTL.aspx?Id=" + id);
        }

        protected void eeeee_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton Edit = e.Item.FindControl("Edit") as LinkButton;
                Utilities.Roles.Edit_permission(_sqlCon, Session["Role"].ToString(), "properties", Edit);



                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");
                var lbl_Building_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Arabic_Name");
                var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");
                var lbl_Unit_Arabic_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Arabic_Type");
                var lbl_Unit_English_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_English_Type");
                var lbl_Unit_Arabic_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Arabic_Condition");
                var lbl_Unit_English_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_English_Condition");
                var lbl_Unit_Arabic_Detail = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Arabic_Detail");
                var lbl_Unit_English_Detail = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_English_Detail");

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                    lbl_Building_Arabic_Name.Visible = false; lbl_Building_English_Name.Visible = true;
                    lbl_Unit_Arabic_Type.Visible = false; lbl_Unit_English_Type.Visible = true;
                    lbl_Unit_Arabic_Condition.Visible = false; lbl_Unit_English_Condition.Visible = true;
                    lbl_Unit_Arabic_Detail.Visible = false; lbl_Unit_English_Detail.Visible = true;

                }
                else
                {
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_Building_Arabic_Name.Visible = true; lbl_Building_English_Name.Visible = false;
                    lbl_Unit_Arabic_Type.Visible = true; lbl_Unit_English_Type.Visible = false;
                    lbl_Unit_Arabic_Condition.Visible = true; lbl_Unit_English_Condition.Visible = false;
                    lbl_Unit_Arabic_Detail.Visible = true; lbl_Unit_English_Detail.Visible = false;

                }
            }

            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_owner_ship_Code = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_owner_ship_Code");
                var lbl_Owner_Ship_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_Name");
                var lbl_Building_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_Name");
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
                        lbl_owner_ship_Code.Text = Dt.Rows[37]["EN"].ToString();
                        lbl_Owner_Ship_Name.Text = Dt.Rows[44]["EN"].ToString();
                        lbl_Building_Name.Text = Dt.Rows[59]["EN"].ToString();
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
                        lbl_owner_ship_Code.Text = Dt.Rows[37]["AR"].ToString();
                        lbl_Owner_Ship_Name.Text = Dt.Rows[44]["AR"].ToString();
                        lbl_Building_Name.Text = Dt.Rows[59]["AR"].ToString();
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
        }


        protected void language()
        {
            if (Session["Langues"].ToString() == "1") { lbl_titel_Unit_List.Text = "Units List"; Add.Text = "Add New Unit"; }
            else { lbl_titel_Unit_List.Text = "قائمة الوحدات"; Add.Text = "إضافة وحدة جديدة"; }
        }
    }
}