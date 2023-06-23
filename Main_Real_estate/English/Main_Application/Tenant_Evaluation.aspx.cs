using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static iTextSharp.text.pdf.AcroFields;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Tenant_Evaluation : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Customer_Affairs", 0, "R");
            Utilities.Roles.Add_permission(_sqlCon, Session["Role"].ToString(), "Customer_Affairs", Add);
            if (!this.IsPostBack)
            {
                Label3.Text = "";
                language();
                Get_Evaluation_BindData();
                Get_Cases_BindData();
            }
        }

        protected void Main_Type_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["Langues"].ToString() == "1")
            {
                //Fill Sub Type DropDownList
                Helper.LoadDropDownList("SELECT * FROM sub_type_evaluation where Main_Type_Evaluation_Id = '" + Main_Type_DropDownList.SelectedValue + "'", _sqlCon, Sub_Type_DropDownList, "En_Name", "Sub_Type_Evaluation_Id");
                Sub_Type_DropDownList.Items.Insert(0, "...............");
            }
            else
            {
                //Fill Sub Type DropDownList
                Helper.LoadDropDownList("SELECT * FROM sub_type_evaluation where Main_Type_Evaluation_Id = '" + Main_Type_DropDownList.SelectedValue + "'", _sqlCon, Sub_Type_DropDownList, "Ar_Name", "Sub_Type_Evaluation_Id");
                Sub_Type_DropDownList.Items.Insert(0, "...............");
            }
                
        }

        protected void btn_Add_T_E_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addEvaluationQuary =
                    "Insert Into tenant_evaluation (" +
                    "Tenant_Id," +
                    "Main_Type_Id," +
                    "Weight," +
                    "Sup_Type_Id , Date) " +
                    "VALUES(" +
                    "@Tenant_Id," +
                    "@Main_Type_Id," +
                    "@Weight," +
                    "@Sup_Type_Id , @Date)";
                _sqlCon.Open();
                MySqlCommand addEvaluationCmd = new MySqlCommand(addEvaluationQuary, _sqlCon);
                addEvaluationCmd.Parameters.AddWithValue("@Tenant_Id", Tenant_Name_DropDownList.SelectedValue);
                addEvaluationCmd.Parameters.AddWithValue("@Main_Type_Id", Main_Type_DropDownList.SelectedValue);
                addEvaluationCmd.Parameters.AddWithValue("@Sup_Type_Id", Sub_Type_DropDownList.SelectedValue);
                addEvaluationCmd.Parameters.AddWithValue("@Weight", Label3.Text);
                addEvaluationCmd.Parameters.AddWithValue("@Date", DateTime.Now.ToString("dd/MM/yyyy"));
                addEvaluationCmd.ExecuteNonQuery();
                _sqlCon.Close();


                Response.Redirect(Request.RawUrl);
            }
        }

        protected void Delete(object sender, EventArgs e)
        {
            try
            {
                string id = (sender as LinkButton).CommandArgument;
                _sqlCon.Open();
                string quary1 = "DELETE FROM tenant_evaluation WHERE Tenant_Evaluation_Id=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(quary1, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", id);
                mySqlCmd.ExecuteNonQuery();
                _sqlCon.Close();
                Response.Redirect(Request.RawUrl);
            }
            catch
            {
                Response.Write(@"<script language='javascript'>alert('لا يمكن الحذف')</script>");
            };
        }

        protected void Get_Evaluation_BindData()
        {
            string tenant_ID = ""; string Persenteg = "";
            if (Tenant_DropDownList.SelectedItem.Text == "...............") { tenant_ID = ""; } else { tenant_ID = Tenant_DropDownList.SelectedValue; }




            string tenantListQuery = "SELECT TE.* , sum(TE.Weight) Persenteg ,  " +
                    "T.Tenants_Arabic_Name , T.Tenants_English_Name , T.Tenants_Tell , T.Tenants_Mobile , " +
                    "TN.Arabic_nationality , TN.English_nationality " +
                    "FROM tenant_evaluation TE " +
                    "left join tenants T on(TE.Tenant_Id = T.Tenants_ID) " +
                    "left join nationality TN on(T.nationality_nationality_ID = TN.nationality_ID) " +
                    "where Tenant_Id like CONCAT('%', '" + tenant_ID + "', '%') " +
                    "group by Tenant_Id";

            try { Helper.GetDataReader(tenantListQuery, _sqlCon, tenant_List); }
            catch { Response.Write(@"<script language='javascript'>alert('لا يمكن عرض هذه الصفحة')</script>"); };
        }
        protected void Get_Cases_BindData()
        {
            foreach (RepeaterItem item in tenant_List.Items)
            {
                Repeater Cases_Repeater = item.FindControl("Cases_Repeater") as Repeater;
                Label Tenant_Id = item.FindControl("Tenant_Id") as Label;

                string CasestQuery = "select TE.Tenant_Evaluation_Id , TE.Sup_Type_Id , TE.Date  , STE.Ar_Name , STE.En_Name " +
                    "from tenant_evaluation TE  " +
                    "left join sub_type_evaluation STE on(TE.Sup_Type_Id = STE.Sub_Type_Evaluation_Id) where Tenant_Id = '" + Tenant_Id.Text + "';";

                //try { Helper.GetDataReader(CasestQuery, _sqlCon, Cases_Repeater); }
                //catch { Response.Write(@"<script language='javascript'>alert('لا يمكن عرض هذه الصفحة')</script>"); };
                Helper.GetDataReader(CasestQuery, _sqlCon, Cases_Repeater);
            }
        }

        protected void Sub_Type_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable getWeightDt = new DataTable();
            _sqlCon.Open();
            MySqlCommand getWeightCmd = new MySqlCommand(
                "SELECT R_Sub_Weight  FROM sub_type_evaluation WHERE Sub_Type_Evaluation_Id = @ID",
                _sqlCon);
            MySqlDataAdapter getWeightDa = new MySqlDataAdapter(getWeightCmd);

            getWeightCmd.Parameters.AddWithValue("@ID", Sub_Type_DropDownList.SelectedValue);
            getWeightDa.Fill(getWeightDt);
            if (getWeightDt.Rows.Count > 0)
            {
                Label3.Text = getWeightDt.Rows[0]["R_Sub_Weight"].ToString();
            }

            _sqlCon.Close();
        }

        protected void Tenant_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Get_Evaluation_BindData();
            Get_Cases_BindData();
        }

        protected void Level_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Get_Evaluation_BindData();
            Get_Cases_BindData();
        }

        protected void tenant_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            foreach (RepeaterItem item in tenant_List.Items)
            {
                Label lbl_Persenteg = item.FindControl("lbl_Persenteg") as Label;
                Label Label5 = item.FindControl("Label5") as Label;
                double Dbl_lbl_Persenteg = 100 - Convert.ToDouble(lbl_Persenteg.Text);
                HtmlTableRow tr = item.FindControl("row") as HtmlTableRow;


                if (Dbl_lbl_Persenteg >= 80 && Dbl_lbl_Persenteg <= 100)
                {
                    Label5.Text = "A";
                }
                else if (Dbl_lbl_Persenteg >= 60 && Dbl_lbl_Persenteg <= 79)
                {
                    Label5.Text = "B";
                    //Tenant_Repeater.Visible= false;
                }
                else if (Dbl_lbl_Persenteg >= 40 && Dbl_lbl_Persenteg <= 59)
                {
                    Label5.Text = "C";
                }
                else if (Dbl_lbl_Persenteg >= 20 && Dbl_lbl_Persenteg <= 39)
                {
                    Label5.Text = "D";
                }
                else
                {
                    Label5.Text = "E";
                }

            }

            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lbl_Titel_1_Name = e.Item.FindControl("lbl_Titel_1_Name") as Label;
                Label lbl_Titel_1_Mobile = e.Item.FindControl("lbl_Titel_1_Mobile") as Label;
                Label lbl_Titel_1_Tell = e.Item.FindControl("lbl_Titel_1_Tell") as Label;
                Label lbl_Titel_1_Email = e.Item.FindControl("lbl_Titel_1_Email") as Label;
                Label lbl_Titel_1_EV = e.Item.FindControl("lbl_Titel_1_EV") as Label;
                Label lbl_Titel_1_EVV = e.Item.FindControl("lbl_Titel_1_EVV") as Label;

                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_tenant", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_1_Name.Text = Dt.Rows[35]["EN"].ToString();
                        lbl_Titel_1_Mobile.Text = Dt.Rows[13]["EN"].ToString();
                        lbl_Titel_1_Tell.Text = Dt.Rows[12]["EN"].ToString();
                        lbl_Titel_1_Email.Text = Dt.Rows[15]["EN"].ToString();
                        lbl_Titel_1_EV.Text = Dt.Rows[36]["EN"].ToString();
                        lbl_Titel_1_EVV.Text = Dt.Rows[36]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Titel_1_Name.Text = Dt.Rows[35]["AR"].ToString();
                        lbl_Titel_1_Mobile.Text = Dt.Rows[13]["AR"].ToString();
                        lbl_Titel_1_Tell.Text = Dt.Rows[12]["AR"].ToString();
                        lbl_Titel_1_Email.Text = Dt.Rows[15]["AR"].ToString();
                        lbl_Titel_1_EV.Text = Dt.Rows[36]["AR"].ToString();
                        lbl_Titel_1_EVV.Text = Dt.Rows[36]["AR"].ToString();

                    }
                }
            }
        



            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl_Tenants_Arabic_Name = e.Item.FindControl("lbl_Tenants_Arabic_Name") as Label;
                Label lbl_Tenants_English_Name = e.Item.FindControl("lbl_Tenants_English_Name") as Label;
                Label lbl_Arabic_nationality = e.Item.FindControl("lbl_Arabic_nationality") as Label;
                Label lbl_English_nationality = e.Item.FindControl("lbl_English_nationality") as Label;


                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Tenants_Arabic_Name.Visible= false; lbl_Tenants_English_Name.Visible= true;
                    lbl_Arabic_nationality.Visible = false; lbl_English_nationality.Visible = true;
                }
                else
                {
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;
                    lbl_Arabic_nationality.Visible = true; lbl_English_nationality.Visible = false;
                }

            }


        }



        protected void Cases_Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lbl_Titel_2_Satus = e.Item.FindControl("lbl_Titel_2_Satus") as Label;
                Label lbl_Titel_2_Date = e.Item.FindControl("lbl_Titel_2_Date") as Label;

                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_tenant", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Titel_2_Satus.Text = Dt.Rows[39]["EN"].ToString();
                        lbl_Titel_2_Date.Text = Dt.Rows[40]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Titel_2_Satus.Text = Dt.Rows[39]["AR"].ToString();
                        lbl_Titel_2_Date.Text = Dt.Rows[40]["AR"].ToString();
                    }
                }
            }




            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl_E_Ar_Name = e.Item.FindControl("lbl_E_Ar_Name") as Label;
                Label lbl_E_En_Name = e.Item.FindControl("lbl_E_En_Name") as Label;


                if (Session["Langues"].ToString() == "1")
                {
                    lbl_E_Ar_Name.Visible = false; lbl_E_En_Name.Visible = true;
                }
                else
                {
                    lbl_E_Ar_Name.Visible = true; lbl_E_En_Name.Visible = false;
                }

            }
        }



        //*****************************************************************************************************************************************************

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
                    //Fill Main Type  DropDownList
                    Helper.LoadDropDownList("SELECT * FROM main_type_evaluation", _sqlCon, Main_Type_DropDownList, "En_Name", "Main_Type_Evaluation_Id");
                    Main_Type_DropDownList.Items.Insert(0, "...............");

                    //Fill Sub Type DropDownList
                    Helper.LoadDropDownList("SELECT * FROM sub_type_evaluation", _sqlCon, Sub_Type_DropDownList, "En_Name", "Sub_Type_Evaluation_Id");
                    Sub_Type_DropDownList.Items.Insert(0, "...............");

                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenant_Name_DropDownList, "Tenants_English_Name", "Tenants_ID");
                    Tenant_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenant_DropDownList, "Tenants_English_Name", "Tenants_ID");
                    Tenant_DropDownList.Items.Insert(0, "...............");

                    lbl_Titel.Text = Dt.Rows[36]["EN"].ToString();
                    lbl_Tenant_Name.Text = Dt.Rows[35]["EN"].ToString();
                    lbl_Tenant.Text = Dt.Rows[35]["EN"].ToString();
                    lbl_Main_Type.Text = Dt.Rows[37]["EN"].ToString();
                    lbl_Sub_Type.Text = Dt.Rows[38]["EN"].ToString();
                    Add.Text = "Add";

                    Tenant_Name_Req_Field_Val.ErrorMessage = "* Required ";
                    Main_Type_Req_Field_Val.ErrorMessage = "* Required ";
                    Sub_Type_Req_Field_Val.ErrorMessage = "* Required ";
                }
                else
                {
                    //Fill Main Type  DropDownList
                    Helper.LoadDropDownList("SELECT * FROM main_type_evaluation", _sqlCon, Main_Type_DropDownList, "Ar_Name", "Main_Type_Evaluation_Id");
                    Main_Type_DropDownList.Items.Insert(0, "...............");

                    //Fill Sub Type DropDownList
                    Helper.LoadDropDownList("SELECT * FROM sub_type_evaluation", _sqlCon, Sub_Type_DropDownList, "Ar_Name", "Sub_Type_Evaluation_Id");
                    Sub_Type_DropDownList.Items.Insert(0, "...............");

                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenant_Name_DropDownList, "Tenants_Arabic_Name", "Tenants_ID");
                    Tenant_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Tenant _Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenant_DropDownList, "Tenants_Arabic_Name", "Tenants_ID");
                    Tenant_DropDownList.Items.Insert(0, "...............");


                    lbl_Titel.Text = Dt.Rows[36]["AR"].ToString();
                    lbl_Tenant_Name.Text = Dt.Rows[35]["AR"].ToString();
                    lbl_Tenant.Text = Dt.Rows[35]["AR"].ToString();
                    lbl_Main_Type.Text = Dt.Rows[37]["AR"].ToString();
                    lbl_Sub_Type.Text = Dt.Rows[38]["AR"].ToString();
                    Add.Text = "إضافة";

                    Tenant_Name_Req_Field_Val.ErrorMessage = "* مطلوب ";
                    Main_Type_Req_Field_Val.ErrorMessage = "* مطلوب ";
                    Sub_Type_Req_Field_Val.ErrorMessage = "* مطلوب ";

                }
            }
            _sqlCon.Close();

        }

        
    }
}