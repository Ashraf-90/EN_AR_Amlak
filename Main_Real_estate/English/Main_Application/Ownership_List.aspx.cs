using iTextSharp.tool.xml.html;
using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using Syncfusion.JavaScript.DataVisualization.Models.Diagram;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Ownership_List : System.Web.UI.Page
    {
        private int _size = 0;
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
                Ownership_List_BindData();
                language();
            }
        }

        protected void Ownership_List_BindData(string sortExpression = null)
        {
            //try
            //{
                using (MySqlCommand cmd = new MySqlCommand("Details_All_ownership", _sqlCon))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ownership_List.DataSource = dt;
                        ownership_List.DataBind();
                    }
                }
            //}
            //catch
            //{
            //    Response.Write(
            //        @"<script language='javascript'>alert('OOPS!!! The Ownership List Cannt Display')</script>");
            //}
        }

        protected void Edit_Ownership(object sender, EventArgs e)
        {
            Session["OW_Back"] = "1";

            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Edit_Ownership.aspx?Id=" + id);
        }

        protected void Details_Ownership(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("OwnerShip_DTL.aspx?Id=" + id);
        }

        protected void ownership_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
            var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");
            var lbl_zone_arabic_name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_zone_arabic_name");
            var lbl_zone_English_name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_zone_English_name");
            var lbl_Owner_Arabic_name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Arabic_name");
            var lbl_Owner_English_name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_English_name");
            var lbl_Unit_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Type");
            var lbl_EN_Unit_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_EN_Unit_Type");
            var lbl_Bonnd_Link = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Bonnd_Link");
            var lbl_Scheme_Link = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Scheme_Link");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton Edit = e.Item.FindControl("Edit") as LinkButton;
                Utilities.Roles.Edit_permission(_sqlCon, Session["Role"].ToString(), "properties", Edit);
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Owner_Ship_AR_Name.Visible = false;  lbl_Owner_Ship_EN_Name.Visible=true;
                    lbl_zone_arabic_name.Visible = false; lbl_zone_English_name.Visible = true;
                    lbl_Owner_Arabic_name.Visible = false;  lbl_Owner_English_name.Visible = true;
                    lbl_Unit_Type.Visible = false;  lbl_EN_Unit_Type.Visible = true;
                    lbl_Bonnd_Link.Text = "Bond"; lbl_Scheme_Link.Text = "Scheme";

                }
                else
                {
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_zone_arabic_name.Visible = true; lbl_zone_English_name.Visible = false;
                    lbl_Owner_Arabic_name.Visible = true; lbl_Owner_English_name.Visible = false;
                    lbl_Unit_Type.Visible = true; lbl_EN_Unit_Type.Visible = false;
                    lbl_Bonnd_Link.Text = "سند الملكية"; lbl_Scheme_Link.Text = "المخطط";
                }
            }

            if (e.Item.ItemType == ListItemType.Header )
            {
                var Titel_Zone = (System.Web.UI.WebControls.Label)e.Item.FindControl("Titel_Zone");
                var Titel_Code = (System.Web.UI.WebControls.Label)e.Item.FindControl("Titel_Code");
                var Titel_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("Titel_Name");
                var Titel_Owner = (System.Web.UI.WebControls.Label)e.Item.FindControl("Titel_Owner");
                var Titel_BIN = (System.Web.UI.WebControls.Label)e.Item.FindControl("Titel_BIN");
                var Titel_Area = (System.Web.UI.WebControls.Label)e.Item.FindControl("Titel_Area");
                var Titel_Bond_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("Titel_Bond_NO");
                var Titel_buildingCount = (System.Web.UI.WebControls.Label)e.Item.FindControl("Titel_buildingCount");
                var Titel_Unit_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("Titel_Unit_Type");

                



                _sqlCon.Open();
                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages where ID between 36 and 46", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        Titel_Zone.Text = Dt.Rows[1]["EN"].ToString();
                        Titel_Code.Text = Dt.Rows[2]["EN"].ToString();
                        Titel_Name.Text = Dt.Rows[9]["EN"].ToString();
                        Titel_Owner.Text = Dt.Rows[3]["EN"].ToString();
                        Titel_BIN.Text = Dt.Rows[4]["EN"].ToString();
                        Titel_Area.Text = Dt.Rows[5]["EN"].ToString();
                        Titel_Bond_NO.Text = Dt.Rows[6]["EN"].ToString();
                        Titel_buildingCount.Text = Dt.Rows[7]["EN"].ToString();
                        Titel_Unit_Type.Text = Dt.Rows[8]["EN"].ToString();
                    }
                    else
                    {
                        Titel_Zone.Text = Dt.Rows[1]["AR"].ToString();
                        Titel_Code.Text = Dt.Rows[2]["AR"].ToString();
                        Titel_Name.Text = Dt.Rows[9]["AR"].ToString();
                        Titel_Owner.Text = Dt.Rows[3]["AR"].ToString();
                        Titel_BIN.Text = Dt.Rows[4]["AR"].ToString();
                        Titel_Area.Text = Dt.Rows[5]["AR"].ToString();
                        Titel_Bond_NO.Text = Dt.Rows[6]["AR"].ToString();
                        Titel_buildingCount.Text = Dt.Rows[7]["AR"].ToString();
                        Titel_Unit_Type.Text = Dt.Rows[8]["AR"].ToString();
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
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages  where ID between 36 and 46", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                { 
                    lbl_titel_Ownership_List.Text = Dt.Rows[10]["EN"].ToString();
                    Add.Text = Dt.Rows[0]["EN"].ToString();
                }
                else
                { 
                    lbl_titel_Ownership_List.Text = Dt.Rows[10]["AR"].ToString();
                    Add.Text = Dt.Rows[0]["EN"].ToString();
                }
            }
            _sqlCon.Close();
        }
    }
}