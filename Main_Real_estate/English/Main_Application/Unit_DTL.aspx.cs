using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Main_Real_estate.English.Master_Panal;
using iTextSharp.tool.xml.html;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Unit_DTL : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "properties", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            Unit_Detail();
            language();
        }

        protected void Unit_Detail()
        {
            
            string ID = Request.QueryString["Id"];
            using (MySqlCommand Cmd = new MySqlCommand("Unit_Details", _sqlCon))
            {
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("@Id", ID);
                MySqlDataAdapter DataAdapter = new MySqlDataAdapter(Cmd);
                DataTable DT = new DataTable();
                DataAdapter.Fill(DT);
                Unit_Details.DataSource = DT;
                Unit_Details.DataBind();
                _sqlCon.Close();
            }
        }

        protected void Unit_Details_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Titel_Floor_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Floor_Number");
                var lbl_Titel_Unit_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Unit_Number");
                var lbl_Titel_Water_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Water_Number");
                var lbl_Titel_Electrcity_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Electrcity_Number");
                var lbl_Titel_Oreedo_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Oreedo_Number");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Floor_Number.Text = Dt.Rows[87]["EN"].ToString();
                        lbl_Titel_Unit_Number.Text = Dt.Rows[86]["EN"].ToString();
                        lbl_Titel_Water_Number.Text = Dt.Rows[64]["EN"].ToString();
                        lbl_Titel_Electrcity_Number.Text = Dt.Rows[65]["EN"].ToString();
                        lbl_Titel_Oreedo_Number.Text = Dt.Rows[85]["EN"].ToString();

                    }
                    else
                    {
                        lbl_Titel_Floor_Number.Text = Dt.Rows[87]["AR"].ToString();
                        lbl_Titel_Unit_Number.Text = Dt.Rows[86]["AR"].ToString();
                        lbl_Titel_Water_Number.Text = Dt.Rows[64]["AR"].ToString();
                        lbl_Titel_Electrcity_Number.Text = Dt.Rows[65]["AR"].ToString();
                        lbl_Titel_Oreedo_Number.Text = Dt.Rows[85]["AR"].ToString();

                    }
                }
            }
        }

        protected void language()
        {
            if (Session["Langues"].ToString() == "1") { T_U_D.Text = "Details Of Unit :"; btn_Back_To_Building_List.Text = "Bacl To Units List"; }
            else { T_U_D.Text = "تفاصيل الوحدة :"; btn_Back_To_Building_List.Text = "العودة لقائمة الوحدات"; }
        }
    }
}