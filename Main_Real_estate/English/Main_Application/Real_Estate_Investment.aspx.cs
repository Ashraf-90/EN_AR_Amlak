using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Real_Estate_Investment : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Financial_Statements", 0, "R");
                Utilities.Roles.Add_permission(_sqlCon, Session["Role"].ToString(), "Financial_Statements", Add);
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                // Fill Year &Mounth  DropDownList
                int year = DateTime.Now.Year; int Mounth = DateTime.Now.Month;
                for (int i = year - 5; i <= year + 10; i++)
                {
                    ListItem li = new ListItem(i.ToString());
                    Year_DropDownList.Items.Add(li);
                }
                Year_DropDownList.Items.FindByText(year.ToString()).Selected = true;
                //************************************************************************


                language();


                Get_ERI_BindData();
            }
                
        }

        protected void btn_Add_Contract_Click(object sender, EventArgs e)
        {
            _sqlCon.Open();
            if (Page.IsValid)
            {
                string addERIQuary = "Insert Into real_estate_investment" +
                                      "(Year,Value,Name) " +
                                      "VALUES" +
                                      "(@Year,@Value,@Name)";
                MySqlCommand addERICmd = new MySqlCommand(addERIQuary, _sqlCon);
                addERICmd.Parameters.AddWithValue("@Year", Year_DropDownList.SelectedValue);
                addERICmd.Parameters.AddWithValue("@Value", txt_REI_Value.Text);
                addERICmd.Parameters.AddWithValue("@Name", txt_REI_Name.Text);
                addERICmd.ExecuteNonQuery();
                //****************** Chang IsRealEsataeInvesment column in Ownership Or Building table

                if (Ownership_Or_Building_DropDownList.SelectedValue == "1")
                {
                    string Id = Ownership_Name_DropDownList.SelectedValue;
                    string quari = "UPDATE owner_ship SET IsRealEsataeInvesment=@IsRealEsataeInvesment   WHERE Owner_Ship_Id=@ID ";
                    MySqlCommand Cmd1 = new MySqlCommand(quari, _sqlCon);
                    Cmd1.Parameters.AddWithValue("@ID", Id);
                    Cmd1.Parameters.AddWithValue("@IsRealEsataeInvesment", "1");
                    Cmd1.ExecuteNonQuery();
                }
                else if (Ownership_Or_Building_DropDownList.SelectedValue == "2")
                {
                    string Id = Building_Name_DropDownList.SelectedValue;
                    string quari = "UPDATE building SET IsRealEsataeInvesment=@IsRealEsataeInvesment   WHERE Building_Id=@ID ";
                    MySqlCommand Cmd1 = new MySqlCommand(quari, _sqlCon);
                    Cmd1.Parameters.AddWithValue("@ID", Id);
                    Cmd1.Parameters.AddWithValue("@IsRealEsataeInvesment", "1");
                    Cmd1.ExecuteNonQuery();
                }
            }
            _sqlCon.Close();
            Response.Redirect("Real_Estate_Investment.aspx");
        }

        protected void Get_ERI_BindData()
        {
            //try
            //{
            string getERIQuari = "SELECT * FROM real_estate_investment";
            MySqlCommand getERICmd = new MySqlCommand(getERIQuari, _sqlCon);
            MySqlDataAdapter getERIDt = new MySqlDataAdapter(getERICmd);
            getERICmd.Connection = _sqlCon;
            _sqlCon.Open();
            getERIDt.SelectCommand = getERICmd;
            DataTable getERIDataTable = new DataTable();
            getERIDt.Fill(getERIDataTable);
            ERI_GridView1.DataSource = getERIDataTable;
            ERI_GridView1.DataBind();
            _sqlCon.Close();
            //}
            //catch (Exception ex)
            //{
            //}
        }


        protected void Delete_investment(object sender, EventArgs e)
        {
            try
            {
                string investmentRowId = (sender as LinkButton).CommandArgument;
                _sqlCon.Open();
                string deleteinvestmentQuary = "DELETE FROM real_estate_investment WHERE Id=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(deleteinvestmentQuary, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", investmentRowId);
                mySqlCmd.ExecuteNonQuery();
                _sqlCon.Close();
                Response.Redirect(Request.RawUrl);
            }
            catch
            {
                Response.Write(
                    @"<script language='javascript'>alert('This investment Cannot Be Deleted ')</script>");
            }

           ;
        }

        protected void ERI_GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            _sqlCon.Close();
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton btn_investment_Delete = (e.Row.FindControl("btn_investment_Delete") as LinkButton);
                Utilities.Roles.Delete_permission(_sqlCon, Session["Role"].ToString(), "Financial_Statements", btn_investment_Delete);
            }
        }

        protected void Ownership_Or_Building_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Ownership_Or_Building_DropDownList.SelectedValue == "1") {Ownership.Visible= true; Building.Visible= false;}
            else { Ownership.Visible = true; Building.Visible = true; }
        }

        protected void Ownership_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Ownership_Id = Ownership_Name_DropDownList.SelectedValue;
            if (Ownership_Or_Building_DropDownList.SelectedValue == "1")
            {
                txt_REI_Name.Text = Ownership_Name_DropDownList.SelectedItem.Text.Trim();
            }
            else
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1' and owner_ship_Owner_Ship_Id = '" + Ownership_Id + "'",
                    _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");
                }
                else
                {
                    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1' and owner_ship_Owner_Ship_Id = '"+ Ownership_Id + "'", 
                    _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                Building_Name_DropDownList.Items.Insert(0, "...............");
                }

                    
            }
        }

        protected void Building_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_REI_Name.Text = Building_Name_DropDownList.SelectedItem.Text.Trim();
        }


















        //******************************************************************************************************************************************
        //************************************************** languages ****************************************************************
        //******************************************************************************************************************************************

        protected void language()
        {

            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            _sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_expensess", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_EN_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");



                    //Get Ownership_Or_Building_DropDownList 
                    Ownership_Or_Building_DropDownList.Items.Clear();
                    Ownership_Or_Building_DropDownList.Items.Add(new ListItem("Property", "1"));
                    Ownership_Or_Building_DropDownList.Items.Add(new ListItem("Building", "2"));
                    Ownership_Or_Building_DropDownList.Items.Insert(0, "...............");


                    lbl_titel_Add_New_REI.Text = Dt.Rows[13]["EN"].ToString();
                    lbl_Ownership_Or_Building.Text = Dt.Rows[14]["EN"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[4]["EN"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[5]["EN"].ToString();
                    lbl_REI_Value.Text = Dt.Rows[15]["EN"].ToString();
                    lbl_Year.Text = Dt.Rows[3]["EN"].ToString();
                    lbl_REI_Name.Text = Dt.Rows[16]["EN"].ToString();
                    Add.Text = Dt.Rows[12]["EN"].ToString();

                    Ownership_Or_Building_RequiredFieldValidator.ErrorMessage = Dt.Rows[11]["EN"].ToString();
                    Ownership_Name_RequiredFieldValidator.ErrorMessage = Dt.Rows[11]["EN"].ToString();
                    Building_Name_RequiredFieldValidator.ErrorMessage = Dt.Rows[11]["EN"].ToString();
                    REI_Req_Fuild.ErrorMessage = Dt.Rows[11]["EN"].ToString();
                    RequiredFieldValidator2.ErrorMessage = Dt.Rows[11]["EN"].ToString();
                    REI_Req_Fiel.ErrorMessage = Dt.Rows[11]["EN"].ToString();

                    ERI_GridView1.Columns[0].HeaderText = Dt.Rows[16]["EN"].ToString();
                    ERI_GridView1.Columns[1].HeaderText = Dt.Rows[15]["EN"].ToString();
                    ERI_GridView1.Columns[2].HeaderText = Dt.Rows[3]["EN"].ToString();
                }
                else
                {
                    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_AR_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "................");




                    //Get Ownership_Or_Building_DropDownList 
                    Ownership_Or_Building_DropDownList.Items.Clear();
                    Ownership_Or_Building_DropDownList.Items.Add(new ListItem("ملكية", "1"));
                    Ownership_Or_Building_DropDownList.Items.Add(new ListItem("بناء", "2"));
                    Ownership_Or_Building_DropDownList.Items.Insert(0, "...............");


                    lbl_titel_Add_New_REI.Text = Dt.Rows[13]["AR"].ToString();
                    lbl_Ownership_Or_Building.Text = Dt.Rows[14]["AR"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[4]["AR"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[5]["AR"].ToString();
                    lbl_REI_Value.Text = Dt.Rows[15]["AR"].ToString();
                    lbl_Year.Text = Dt.Rows[3]["AR"].ToString();
                    lbl_REI_Name.Text = Dt.Rows[16]["AR"].ToString();
                    Add.Text = Dt.Rows[12]["AR"].ToString();

                    Ownership_Or_Building_RequiredFieldValidator.ErrorMessage = Dt.Rows[11]["AR"].ToString();
                    Ownership_Name_RequiredFieldValidator.ErrorMessage = Dt.Rows[11]["AR"].ToString();
                    Building_Name_RequiredFieldValidator.ErrorMessage = Dt.Rows[11]["AR"].ToString();
                    REI_Req_Fuild.ErrorMessage = Dt.Rows[11]["AR"].ToString();
                    RequiredFieldValidator2.ErrorMessage = Dt.Rows[11]["AR"].ToString();
                    REI_Req_Fiel.ErrorMessage = Dt.Rows[11]["AR"].ToString();




                    ERI_GridView1.Columns[0].HeaderText = Dt.Rows[16]["AR"].ToString();
                    ERI_GridView1.Columns[1].HeaderText = Dt.Rows[15]["AR"].ToString();
                    ERI_GridView1.Columns[2].HeaderText = Dt.Rows[3]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}