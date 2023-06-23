using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;
using static iTextSharp.text.pdf.AcroFields;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Tenant_List : System.Web.UI.Page
    {
        private int _size = 0;
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Add_permission(_sqlCon, Session["Role"].ToString(), "Customer_Affairs", Add);
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!IsPostBack)
            {
                language();
                Tenant_List_BindData();
            }
        }

        protected void Tenant_List_BindData()
        {
            string tenantListQuery = "SELECT T.* , " +
                "(select Sum(Weight)  FROM  tenant_evaluation where Tenant_Id =  T.Tenants_ID )Points , " +
                "(SELECT IF(Points !=0, Points, 0))R_Points , " +
                "(SELECT IF((100 - R_Points) !=0, (100 - R_Points), 0)) Persenteg " +
                " FROM  tenants T";





            MySqlCommand tenantListCmd = new MySqlCommand(tenantListQuery, _sqlCon);
            MySqlDataAdapter tenantListDt = new MySqlDataAdapter(tenantListCmd);
            tenantListCmd.Connection = _sqlCon;
            _sqlCon.Open();
            tenantListDt.SelectCommand = tenantListCmd;
            DataTable tenantListDataTable = new DataTable();
            tenantListDt.Fill(tenantListDataTable);
            tenant_List.DataSource = tenantListDataTable;
            tenant_List.DataBind();
            _sqlCon.Close();
        }
       

        protected void Details_Tenant(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Tenant_Datials.aspx?Id=" + id);
        }

        protected void Tenant_Type_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (Tenant_Type_DropDownList.SelectedValue == "1")
            {
                Tenant_List_BindData();
            }
            else if (Tenant_Type_DropDownList.SelectedValue == "2")
            {




                string tenantListQuery = "SELECT T.* , " +
                "(select Sum(Weight)  FROM  tenant_evaluation where Tenant_Id =  T.Tenants_ID )Points , " +
                "(SELECT IF(Points !=0, Points, 0))R_Points , " +
                "(SELECT IF((100 - R_Points) !=0, (100 - R_Points), 0)) Persenteg " +
                " FROM  tenants T where tenant_type_Tenant_Type_Id = 2";





                MySqlCommand tenantListCmd = new MySqlCommand(tenantListQuery, _sqlCon);
                MySqlDataAdapter tenantListDt = new MySqlDataAdapter(tenantListCmd);
                tenantListCmd.Connection = _sqlCon;
                _sqlCon.Open();
                tenantListDt.SelectCommand = tenantListCmd;
                DataTable tenantListDataTable = new DataTable();
                tenantListDt.Fill(tenantListDataTable);
                tenant_List.DataSource = tenantListDataTable;
                tenant_List.DataBind();
                _sqlCon.Close();
            }
            else
            {
                string tenantListQuery = "SELECT T.* , " +
                "(select Sum(Weight)  FROM  tenant_evaluation where Tenant_Id =  T.Tenants_ID )Points , " +
                "(SELECT IF(Points !=0, Points, 0))R_Points , " +
                "(SELECT IF((100 - R_Points) !=0, (100 - R_Points), 0)) Persenteg " +
                " FROM  tenants T where tenant_type_Tenant_Type_Id = 1";
                MySqlCommand tenantListCmd = new MySqlCommand(tenantListQuery, _sqlCon);
                MySqlDataAdapter tenantListDt = new MySqlDataAdapter(tenantListCmd);
                tenantListCmd.Connection = _sqlCon;
                _sqlCon.Open();
                tenantListDt.SelectCommand = tenantListCmd;
                DataTable tenantListDataTable = new DataTable();
                tenantListDt.Fill(tenantListDataTable);
                tenant_List.DataSource = tenantListDataTable;
                tenant_List.DataBind();
                _sqlCon.Close();
            }



                
        }

        protected void tenant_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lbl_TItel_Name = (e.Item.FindControl("lbl_TItel_Name") as Label);
                Label lbl_TItel_Mobile = (e.Item.FindControl("lbl_TItel_Mobile") as Label);
                Label lbl_TItel_Tell = (e.Item.FindControl("lbl_TItel_Tell") as Label);
                Label lbl_TItel_Email = (e.Item.FindControl("lbl_TItel_Email") as Label);
                Label lbl_TItel_EV = (e.Item.FindControl("lbl_TItel_EV") as Label);


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_tenant", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_TItel_Name.Text = Dt.Rows[35]["EN"].ToString();
                        lbl_TItel_Mobile.Text = Dt.Rows[13]["EN"].ToString();
                        lbl_TItel_Tell.Text = Dt.Rows[12]["EN"].ToString();
                        lbl_TItel_Email.Text = Dt.Rows[15]["EN"].ToString();
                        lbl_TItel_EV.Text = Dt.Rows[34]["EN"].ToString();
                    }
                    else
                    {
                        lbl_TItel_Name.Text = Dt.Rows[35]["AR"].ToString();
                        lbl_TItel_Mobile.Text = Dt.Rows[13]["AR"].ToString();
                        lbl_TItel_Tell.Text = Dt.Rows[12]["AR"].ToString();
                        lbl_TItel_Email.Text = Dt.Rows[15]["AR"].ToString();
                        lbl_TItel_EV.Text = Dt.Rows[34]["AR"].ToString();
                    }
                }
            }



            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RepeaterItem item = e.Item;
                Label lbl_Persenteg = (item.FindControl("lbl_Persenteg") as Label);

                LinkButton lbl_Tenants_Arabic_Name = (item.FindControl("lbl_Tenants_Arabic_Name") as LinkButton);
                LinkButton lbl_Tenants_English_Name = (item.FindControl("lbl_Tenants_English_Name") as LinkButton);

                double Dbl_lbl_Persenteg = Convert.ToDouble(lbl_Persenteg.Text);


                if (Dbl_lbl_Persenteg >= 80 && Dbl_lbl_Persenteg<=100)
                {
                    lbl_Persenteg.Text = "A";
                }
                else if (Dbl_lbl_Persenteg >= 60 && Dbl_lbl_Persenteg <= 79)
                {
                    lbl_Persenteg.Text = "B";
                }
                else if (Dbl_lbl_Persenteg >= 40 && Dbl_lbl_Persenteg <= 59)
                {
                    lbl_Persenteg.Text = "C";
                }
                else if (Dbl_lbl_Persenteg >= 20 && Dbl_lbl_Persenteg <= 39)
                {
                    lbl_Persenteg.Text = "D";
                }
                else
                {
                    lbl_Persenteg.Text = "E";
                }





                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Tenants_Arabic_Name.Visible=false; lbl_Tenants_English_Name.Visible= true;
                }
                else
                {
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;
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
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_tenant", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                   

                    //Get Tenant_Type_DropDownList 
                    Tenant_Type_DropDownList.Items.Clear();
                    Tenant_Type_DropDownList.Items.Add(new ListItem("All", "1"));
                    Tenant_Type_DropDownList.Items.Add(new ListItem("Companies", "2"));
                    Tenant_Type_DropDownList.Items.Add(new ListItem("People", "3"));

                    lbl_titel_Tenant_List.Text = Dt.Rows[33]["EN"].ToString();
                    lbl_Tenant_Type.Text = Dt.Rows[3]["EN"].ToString();
                    Add.Text = Dt.Rows[0]["EN"].ToString();
                }
                else
                {
                    //Get Tenant_Type_DropDownList 
                    Tenant_Type_DropDownList.Items.Clear();
                    Tenant_Type_DropDownList.Items.Add(new ListItem("الكل", "1"));
                    Tenant_Type_DropDownList.Items.Add(new ListItem("شركات", "2"));
                    Tenant_Type_DropDownList.Items.Add(new ListItem("أفراد", "3"));


                    lbl_titel_Tenant_List.Text = Dt.Rows[33]["AR"].ToString();
                    lbl_Tenant_Type.Text = Dt.Rows[3]["AR"].ToString();
                    Add.Text = Dt.Rows[0]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}