using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Main_Real_estate.English.Master_Panal;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Building_Dtl : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "properties", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            Building_Details();
            Unit_list();

            if (Session["Langues"].ToString() == "1") 
            { btn_Back_To_Building_List.Text = "Back To Building List"; lbl_Unit_List.Text = "Units List"; } 
            else { btn_Back_To_Building_List.Text = "العوحدة لقائمة الأبنية"; lbl_Unit_List.Text = " قائمة الوحدات"; }
        }
        protected void Building_Details()
        {
            
            if (Session["Langues"].ToString() == "1") { T_B_D.Text = "Detais Of Building :"; } else { T_B_D.Text = "تفاصيل البناء :"; }
                string buildingId = Request.QueryString["Id"];
            using (MySqlCommand bulidingDetailsCmd = new MySqlCommand("Building_Details", _sqlCon))
            {
                bulidingDetailsCmd.CommandType = CommandType.StoredProcedure;
                bulidingDetailsCmd.Parameters.AddWithValue("@Id", buildingId);
                MySqlDataAdapter bulidingDetailsSda = new MySqlDataAdapter(bulidingDetailsCmd);

                DataTable bulidingDetailsDt = new DataTable();
                bulidingDetailsSda.Fill(bulidingDetailsDt);
                bulidingDetailsCmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                bulidingDetailsSda.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                _sqlCon.Close();
            }
        }
        protected void Unit_list()
        {
            string buildingId = Request.QueryString["Id"];
            _sqlCon.Open();
            using (MySqlCommand unitDetailsCmd = new MySqlCommand("Unit_List_In_Building_Details", _sqlCon))
            {
                unitDetailsCmd.CommandType = CommandType.StoredProcedure;
                unitDetailsCmd.Parameters.AddWithValue("@Id", buildingId);
                MySqlDataAdapter unitDetailsSda = new MySqlDataAdapter(unitDetailsCmd);

                DataTable unitDetailsDt = new DataTable();
                unitDetailsSda.Fill(unitDetailsDt);
                unitDetailsCmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                unitDetailsSda.Fill(dt);
                eeeee.DataSource = dt;
                eeeee.DataBind();
            }
            _sqlCon.Close();
        }

        protected void Details_Unit(object sender, EventArgs e)
        {
            T_U_D.Text = "تفاصيل الوحدة :";
            btn_Close.Visible = true;
            string ID = (sender as LinkButton).CommandArgument;
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
        protected void btn_Close_Click(object sender, EventArgs e)
        {

            T_U_D.Text = string.Empty;

            Unit_Details.DataSource = null;
            Unit_Details.DataSourceID = null;
            Unit_Details.DataBind();


            btn_Close.Visible = false;
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Titel_Building_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_NO");
                var lbl_Titel_Water_meter = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Water_meter");
                var lbl_Titel_electricity_meter = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_electricity_meter");
                var lbl_Titel_Construction_Area = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Construction_Area");
                var lbl_Titel_Building_Value = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Value");
                var lbl_Titel_Building_Arabic_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Arabic_Condition");
                var lbl_Titel_Building_Arabic_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Arabic_Type");
                var lbl_Titel_Maintenance_status = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Maintenance_status");
                var lbl_Titel_Unit_Connt = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Unit_Connt");
                var lbl_Titel_Building_Permit_Path = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Permit_Path");
                var lbl_Titel_certificate_of_completion_Path = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_certificate_of_completion_Path");
                var lbl_Titel_Map_path = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Map_path");
                var lbl_Titel_Building_Photo = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Building_Photo");
                var lbl_Titel_Entrance_Photo = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Entrance_Photo");
                var lbl_Titel_Plano = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Plano");


                var lbl_Dtl_Building_Arabic_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Dtl_Building_Arabic_Condition");
                var lbl_Dtl_Building_English_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Dtl_Building_English_Condition");
                var lbl_Dtl_Building_Arabic_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Dtl_Building_Arabic_Type");
                var lbl_Dtl_Building_English_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Dtl_Building_English_Type");


                var Bu_No = (System.Web.UI.WebControls.Label)e.Item.FindControl("Bu_No");
                var lbl_Building_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Building_English_Name");


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["EN"].ToString();
                        lbl_Titel_Water_meter.Text = Dt.Rows[64]["EN"].ToString();
                        lbl_Titel_electricity_meter.Text = Dt.Rows[65]["EN"].ToString();
                        lbl_Titel_Construction_Area.Text = Dt.Rows[60]["EN"].ToString();
                        lbl_Titel_Building_Value.Text = Dt.Rows[76]["EN"].ToString();
                        lbl_Titel_Building_Arabic_Condition.Text = Dt.Rows[61]["EN"].ToString();
                        lbl_Titel_Building_Arabic_Type.Text = Dt.Rows[62]["EN"].ToString();
                        lbl_Titel_Maintenance_status.Text = Dt.Rows[63]["EN"].ToString();
                        lbl_Titel_Unit_Connt.Text = Dt.Rows[98]["EN"].ToString();
                        lbl_Titel_Building_Permit_Path.Text = "License";
                        lbl_Titel_certificate_of_completion_Path.Text = "Completion";
                        lbl_Titel_Map_path.Text = Dt.Rows[71]["EN"].ToString();
                        lbl_Titel_Building_Photo.Text = Dt.Rows[68]["EN"].ToString();
                        lbl_Titel_Entrance_Photo.Text = "Entrance";
                        lbl_Titel_Plano.Text = Dt.Rows[52]["EN"].ToString();


                        lbl_Dtl_Building_Arabic_Condition.Visible = false; lbl_Dtl_Building_English_Condition.Visible = true;
                        lbl_Dtl_Building_Arabic_Type.Visible = false; lbl_Dtl_Building_English_Type.Visible = true;
                        Bu_No.Visible = false; lbl_Building_English_Name.Visible = true;
                    }
                    else
                    {
                        lbl_Titel_Building_NO.Text = Dt.Rows[67]["AR"].ToString();
                        lbl_Titel_Water_meter.Text = Dt.Rows[64]["AR"].ToString();
                        lbl_Titel_electricity_meter.Text = Dt.Rows[65]["AR"].ToString();
                        lbl_Titel_Construction_Area.Text = Dt.Rows[60]["AR"].ToString();
                        lbl_Titel_Building_Value.Text = Dt.Rows[76]["AR"].ToString();
                        lbl_Titel_Building_Arabic_Condition.Text = Dt.Rows[61]["AR"].ToString();
                        lbl_Titel_Building_Arabic_Type.Text = Dt.Rows[62]["AR"].ToString();
                        lbl_Titel_Maintenance_status.Text = Dt.Rows[63]["AR"].ToString();
                        lbl_Titel_Unit_Connt.Text = Dt.Rows[98]["AR"].ToString();
                        lbl_Titel_Building_Permit_Path.Text = Dt.Rows[72]["AR"].ToString();
                        lbl_Titel_certificate_of_completion_Path.Text = Dt.Rows[73]["AR"].ToString();
                        lbl_Titel_Map_path.Text = Dt.Rows[71]["AR"].ToString();
                        lbl_Titel_Building_Photo.Text = Dt.Rows[68]["AR"].ToString();
                        lbl_Titel_Entrance_Photo.Text = Dt.Rows[74]["AR"].ToString();
                        lbl_Titel_Plano.Text = Dt.Rows[52]["AR"].ToString();

                        lbl_Dtl_Building_Arabic_Condition.Visible = true; lbl_Dtl_Building_English_Condition.Visible = false;
                        lbl_Dtl_Building_Arabic_Type.Visible = true; lbl_Dtl_Building_English_Type.Visible = false;
                        Bu_No.Visible = true; lbl_Building_English_Name.Visible = false;
                    }
                }

            }
        }

        protected void eeeee_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
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

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_Unit_Arabic_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Arabic_Type");
                var lbl_Unit_English_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_English_Type");
                var lbl_Unit_Arabic_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Arabic_Condition");
                var lbl_Unit_English_Condition = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_English_Condition");
                var lbl_Unit_Arabic_Detail = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_Arabic_Detail");
                var lbl_Unit_English_Detail = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Unit_English_Detail");

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Unit_Arabic_Type.Visible = false; lbl_Unit_English_Type.Visible = true;
                    lbl_Unit_Arabic_Condition.Visible = false; lbl_Unit_English_Condition.Visible = true;
                    lbl_Unit_Arabic_Detail.Visible = false; lbl_Unit_English_Detail.Visible = true;

                }
                else
                {
                    lbl_Unit_Arabic_Type.Visible = true; lbl_Unit_English_Type.Visible = false;
                    lbl_Unit_Arabic_Condition.Visible = true; lbl_Unit_English_Condition.Visible = false;
                    lbl_Unit_Arabic_Detail.Visible = true; lbl_Unit_English_Detail.Visible = false;

                }
            }
        }
    }
}