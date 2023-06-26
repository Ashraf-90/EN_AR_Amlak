using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Globalization;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Collect_Singl_Transformation : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Collecting", 0, "R");
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();
                Singl_Transformation();
            }
        }


        protected void Singl_Transformation()
        {
            string TransformationId = Request.QueryString["Id"];
            string getSingl_TransformationQuari = "SELECT " +
                "tr_tb.*,   " +
                "B.* , " +
                " T.Tenants_Arabic_Name , " +
                "T.Tenants_ID, " +
                "(select units_Unit_ID from contract where Contract_Id = tr_tb.Contract_Id )U_ID , " +
                " (select building_Building_Id from units where Unit_ID=U_ID ) B_ID, " +
                "(select owner_ship_Owner_Ship_Id from building where Building_Id=B_ID ) O_ID, " +
                "(select Unit_Number from units where Unit_ID=U_ID)U_NO, " +
                "(select Building_Arabic_Name from building where Building_Id=B_ID)B_Name, " +
                "(select Owner_Ship_AR_Name  from owner_ship where Owner_Ship_Id=O_ID)O_Name , " +
                "(select owner_ship_Code from owner_ship where Owner_Ship_Id=O_ID)O_Code " +
                "FROM  transformation_table tr_tb " +
                "left join  transformation_bank B on (tr_tb.transformation_Bank_ID = B.transformation_Bank_ID) " +
                " left join  tenants T on (tr_tb.tenant_Id = T.Tenants_ID) Where transformation_Table_ID = '" + TransformationId + "'";

            MySqlCommand getSingl_TransformationCmd = new MySqlCommand(getSingl_TransformationQuari, _sqlCon);
            MySqlDataAdapter getSingl_TransformationDt = new MySqlDataAdapter(getSingl_TransformationCmd);
            getSingl_TransformationCmd.Connection = _sqlCon;
            _sqlCon.Open();
            getSingl_TransformationDt.SelectCommand = getSingl_TransformationCmd;
            DataTable getSingl_TransformationDataTable = new DataTable();
            getSingl_TransformationDt.Fill(getSingl_TransformationDataTable);
            if (getSingl_TransformationDataTable.Rows.Count > 0)
            {
                O_ID.Text = getSingl_TransformationDataTable.Rows[0]["O_ID"].ToString();
                B_ID.Text = getSingl_TransformationDataTable.Rows[0]["B_ID"].ToString();
                U_ID.Text = getSingl_TransformationDataTable.Rows[0]["U_NO"].ToString();
                Tenant_ID.Text = getSingl_TransformationDataTable.Rows[0]["Tenants_ID"].ToString();
                Month.Text = Convert.ToString(Convert.ToDateTime(getSingl_TransformationDataTable.Rows[0]["transformation_Date"].ToString()).Month);
                Year.Text = Convert.ToString(Convert.ToDateTime(getSingl_TransformationDataTable.Rows[0]["transformation_Date"].ToString()).Year);




                txt_Cheuqe_NO.Text = getSingl_TransformationDataTable.Rows[0]["transformation_No"].ToString();
                txt_Transformation_Date.Text = getSingl_TransformationDataTable.Rows[0]["transformation_Date"].ToString();
                txt_Acount_No.Text = getSingl_TransformationDataTable.Rows[0]["Account_No"].ToString();
                ltxt_Soft_Cde.Text = getSingl_TransformationDataTable.Rows[0]["Soaft_Code_No"].ToString();

                if(getSingl_TransformationDataTable.Rows[0]["Status"].ToString()== "Uncollected" || 
                getSingl_TransformationDataTable.Rows[0]["Status"].ToString() == "غير محصل")
                {
                    Collect_Type_DropDownList.SelectedValue = "1";
                }
                else { Collect_Type_DropDownList.SelectedValue = "2"; }
                txt_transformation_Amount.Text = getSingl_TransformationDataTable.Rows[0]["Amount"].ToString();
            }
        }

        //******************  Collect_Date ***************************************************
        protected void Collect_Calendar_SelectionChanged(object sender, EventArgs e)
        {
            txt_Collect_Date.Text = Collect_Calendar.SelectedDate.ToShortDateString();
            if (txt_Collect_Date.Text != "")
            {
                Collect_Date_divCalendar.Visible = false;
                ImageButton2.Visible = false;
            }
        }
        protected void Collect_Date_Chosee_Click(object sender, EventArgs e)
        {
            Collect_Date_divCalendar.Visible = true;
            ImageButton2.Visible = true;
        }
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Collect_Date_divCalendar.Visible = false;
            ImageButton2.Visible = false;
        }

        protected void btn_Sumit_Collect_Click(object sender, EventArgs e)
        {
            // Record The Income In Collection Talble
            if (Collect_Type_DropDownList.SelectedValue == "2")
            {
                string Quary = "Select Collection From collection_table Where " +
                               "Ownersip_Id='" + O_ID.Text + "' And Building_Id='" + B_ID.Text + "' And Unit_Id='" + U_ID.Text + "' " +
                               "And Mounth='" + Month.Text + "' And Year='" + Year.Text + "'";
                MySqlDataAdapter CollectionSda = new MySqlDataAdapter(Quary, _sqlCon);
                DataTable getCollectionDt = new DataTable();
                CollectionSda.Fill(getCollectionDt);
                if (getCollectionDt.Rows.Count > 0)
                {
                    string UPDATECollectionQuary = "UPDATE collection_table SET " +
                                                   " Collection = @Collection Where " +
                                                   "Ownersip_Id='" + O_ID.Text + "' And Building_Id='" + B_ID.Text + "' And Unit_Id='" + U_ID.Text + "' " +
                                                   "And Mounth='" + Month.Text + "' And Year='" + Year.Text + "'";

                    _sqlCon.Open();
                    MySqlCommand UPDATECollectionCmd = new MySqlCommand(UPDATECollectionQuary, _sqlCon);
                    UPDATECollectionCmd.Parameters.AddWithValue("@Collection", txt_transformation_Amount.Text);
                    UPDATECollectionCmd.ExecuteNonQuery();
                    _sqlCon.Close();
                }
                else
                {
                    string AddCollectionQuary = "Insert Into collection_table" +
                                           " (Ownersip_Id,Building_Id,Unit_Id,Mounth,Year,Collection) " +
                                           "VALUES" +
                                           "(@Ownersip_Id,@Building_Id,@Unit_Id,@Mounth,@Year,@Collection)";
                    _sqlCon.Open();
                    MySqlCommand addCollectionCmd = new MySqlCommand(AddCollectionQuary, _sqlCon);
                    addCollectionCmd.Parameters.AddWithValue("@Ownersip_Id", O_ID.Text);
                    addCollectionCmd.Parameters.AddWithValue("@Building_Id", B_ID.Text);
                    addCollectionCmd.Parameters.AddWithValue("@Unit_Id", U_ID.Text);
                    addCollectionCmd.Parameters.AddWithValue("@Mounth", Month.Text);
                    addCollectionCmd.Parameters.AddWithValue("@Year", Year.Text);
                    addCollectionCmd.Parameters.AddWithValue("@Collection", txt_transformation_Amount.Text);
                    addCollectionCmd.ExecuteNonQuery();
                    _sqlCon.Close();
                }
                _sqlCon.Close();
            }
            else
            {
                string Quary = "Select Collection From collection_table Where " +
                               "Ownersip_Id='" + O_ID.Text + "' And Building_Id='" + B_ID.Text + "' And Unit_Id='" + U_ID.Text + "' " +
                               "And Mounth='" + Month.Text + "' And Year='" + Year.Text + "'";
                MySqlDataAdapter CollectionSda = new MySqlDataAdapter(Quary, _sqlCon);
                DataTable getCollectionDt = new DataTable();
                CollectionSda.Fill(getCollectionDt);
                if (getCollectionDt.Rows.Count > 0)
                {
                    string UPDATECollectionQuary = "UPDATE collection_table SET " +
                                                   " Collection = @Collection Where " +
                                                   "Ownersip_Id='" + O_ID.Text + "' And Building_Id='" + B_ID.Text + "' And Unit_Id='" + U_ID.Text + "' " +
                                                   "And Mounth='" + Month.Text + "' And Year='" + Year.Text + "'";

                    _sqlCon.Open();
                    MySqlCommand UPDATECollectionCmd = new MySqlCommand(UPDATECollectionQuary, _sqlCon);
                    UPDATECollectionCmd.Parameters.AddWithValue("@Collection", "");
                    UPDATECollectionCmd.ExecuteNonQuery();
                    _sqlCon.Close();
                }
            }



            string TransformationId = Request.QueryString["Id"];
            string query = "UPDATE transformation_table" +
                        " SET " +
                        "Status = @Status , " +
                        "Collection_Date=@Collection_Date" +
                        " WHERE transformation_Table_ID = @transformation_Table_ID";
            using (MySqlCommand cmd = new MySqlCommand(query, _sqlCon))
            {
                cmd.Parameters.AddWithValue("@transformation_Table_ID", TransformationId);
                cmd.Parameters.AddWithValue("@Status", Collect_Type_DropDownList.SelectedItem.Text.Trim());



                //if (CollectionDate_Calendar != "01/01/0001") { cmd.Parameters.AddWithValue("@Collection_Date", CollectionDate_Calendar); }
                //else { cmd.Parameters.AddWithValue("@Collection_Date", lbl_Collection_Date.Text); }



                if (Collect_Type_DropDownList.SelectedValue == "1")
                {
                    cmd.Parameters.AddWithValue("@Collection_Date", "");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Collection_Date", txt_Collect_Date.Text);
                }

                _sqlCon.Open(); cmd.ExecuteNonQuery();
            }
            Response.Redirect("Income_New.aspx");
        }


        protected void btn_Back_Click(object sender, EventArgs e)
        {
            string Cq_T_Ca = Request.QueryString["Cq_T_Ca"];
            string Collection = Request.QueryString["Collection"];
            string Singel_Multi = Request.QueryString["Singel_Multi"];
            Response.Redirect("Income_New.aspx?Cq_T_Ca=" + Cq_T_Ca + "&Collection=" + Collection + "&Singel_Multi=" + Singel_Multi);
        }







        //******************************************************************************************************************************************
        //************************************************** languages ****************************************************************
        //******************************************************************************************************************************************

        protected void language()
        {

            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            _sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_contract", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //Get Collect_Type_DropDownList
                    Collect_Type_DropDownList.Items.Clear();
                    Collect_Type_DropDownList.Items.Add(new ListItem("Uncollected", "1"));
                    Collect_Type_DropDownList.Items.Add(new ListItem("Collected", "2"));
                    Collect_Type_DropDownList.Items.Insert(0, "...............");

                    lbl_Transformation_NO.Text = Dt.Rows[29]["EN"].ToString();
                    lbl_Transformation_Date.Text = Dt.Rows[30]["EN"].ToString();
                    lbl_transformation_Amount.Text = Dt.Rows[31]["EN"].ToString();
                    lbl_Acount_No.Text = Dt.Rows[80]["EN"].ToString();
                    lbl_Soft_Cde.Text = Dt.Rows[81]["EN"].ToString();
                    lbl_Collect_Type.Text = Dt.Rows[82]["EN"].ToString();
                    lbl_Collect_Date.Text = Dt.Rows[79]["EN"].ToString();
                    Collect_Date_Chosee.Text = Dt.Rows[21]["EN"].ToString();
                    btn_Sumit_Collect.Text = Dt.Rows[83]["EN"].ToString();
                    btn_Back.Text = Dt.Rows[84]["EN"].ToString();

                    Collect_Type_Req_Fiel_dVal.ErrorMessage = "* Required ";
                }
                else
                {
                    //Get Collect_Type_DropDownList
                    Collect_Type_DropDownList.Items.Clear();
                    Collect_Type_DropDownList.Items.Add(new ListItem("غير محصل", "1"));
                    Collect_Type_DropDownList.Items.Add(new ListItem("محصل", "2"));
                    Collect_Type_DropDownList.Items.Insert(0, "...............");

                    lbl_Transformation_NO.Text = Dt.Rows[29]["AR"].ToString();
                    lbl_Transformation_Date.Text = Dt.Rows[30]["AR"].ToString();
                    lbl_transformation_Amount.Text = Dt.Rows[31]["AR"].ToString();
                    lbl_Acount_No.Text = Dt.Rows[80]["AR"].ToString();
                    lbl_Soft_Cde.Text = Dt.Rows[81]["AR"].ToString();
                    lbl_Collect_Type.Text = Dt.Rows[82]["AR"].ToString();
                    lbl_Collect_Date.Text = Dt.Rows[79]["AR"].ToString();
                    Collect_Date_Chosee.Text = Dt.Rows[21]["AR"].ToString();
                    btn_Sumit_Collect.Text = Dt.Rows[83]["AR"].ToString();
                    btn_Back.Text = Dt.Rows[84]["AR"].ToString();

                    Collect_Type_Req_Fiel_dVal.ErrorMessage = "* مطلوب ";

                }
            }
            _sqlCon.Close();

        }
    }
}