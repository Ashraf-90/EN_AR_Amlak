using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class All_Income : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                language();
                BindData_All_Cheuqe();
                BindData_All_Transformation();
                BindData_All_Cash();

                
            }
        }
        protected void BindData_All_Cheuqe(string sortExpression = null)
        {
            string Type_e = ""; string Datee = "";
            if (Singel_Multi_DropDownList.SelectedValue == "1") { Type_e = ""; }
            else if (Singel_Multi_DropDownList.SelectedValue == "2") { Type_e = "A"; }
            else { Type_e = "B"; }

            if (Date_Filter_DropDownList.SelectedValue == "1") { Datee = ""; } else { Datee = DateTime.Now.ToString("dd/MM/yyyy"); }
            //++++++++++++++++++++++++++ All_Cheuqes ++++++++++++++++++++++++++++++++++
            using (MySqlCommand cmd = new MySqlCommand("All_Avilabel_Cheuqe", _sqlCon))
            {
                cmd.Parameters.AddWithValue("@Type_e", Type_e);
                cmd.Parameters.AddWithValue("@Datee", Datee);
                using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Avilabel_Cheuqes.DataSource = dt;
                    Avilabel_Cheuqes.DataBind();
                }
            }
        }
        protected void BindData_All_Transformation(string sortExpression = null)
        {
            string Type_e = ""; string Datee = "";
            if (Singel_Multi_DropDownList.SelectedValue == "1") { Type_e = ""; }
            else if (Singel_Multi_DropDownList.SelectedValue == "2") { Type_e = "A"; }
            else { Type_e = "B"; }

            if (Date_Filter_DropDownList.SelectedValue == "1") { Datee = ""; } else { Datee = DateTime.Now.ToString("dd/MM/yyyy"); }
            using (MySqlCommand cmd = new MySqlCommand("All_Trasformatios", _sqlCon))
            {
                cmd.Parameters.AddWithValue("@Type_e", Type_e);
                cmd.Parameters.AddWithValue("@Datee", Datee);
                using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
            }
        }
        protected void BindData_All_Cash(string sortExpression = null)
        {
            string Type_e = ""; string Datee = "";
            if (Singel_Multi_DropDownList.SelectedValue == "1") { Type_e = ""; }
            else if (Singel_Multi_DropDownList.SelectedValue == "2") { Type_e = "A"; }
            else { Type_e = "B"; }

            if (Date_Filter_DropDownList.SelectedValue == "1") { Datee = ""; } else { Datee = DateTime.Now.ToString("dd/MM/yyyy"); }
            using (MySqlCommand cmd = new MySqlCommand("All_Cash", _sqlCon))
            {
                cmd.Parameters.AddWithValue("@Type_e", Type_e);
                cmd.Parameters.AddWithValue("@Datee", Datee);
                using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    Repeater2.DataSource = dt;
                    Repeater2.DataBind();
                }
            }
        }

        //************************************************************** Filtrin Functions ******************************************************************
        //********************  Cheques , Transformation , Cash Filter ************************************
        protected void A_1_ServerClick(object sender, EventArgs e)
        {
            Cheuqe.Visible = true; Transformation.Visible = false; Cash.Visible = false;
        }
        protected void A_2_ServerClick(object sender, EventArgs e)
        {
            Cheuqe.Visible = false; Transformation.Visible = true; Cash.Visible = false;
        }
        protected void A_3_ServerClick(object sender, EventArgs e)
        {
            Cheuqe.Visible = false; Transformation.Visible = false; Cash.Visible = true;
        }
        protected void A_4_ServerClick(object sender, EventArgs e)
        {
            Cheuqe.Visible = true; Transformation.Visible = true; Cash.Visible = true;
        }
        //********************  Collected , Not Collected Filter ************************************
        protected void Collected_Or_NotCollected_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData_All_Cheuqe();
            BindData_All_Transformation();
            BindData_All_Cash();
        }
        //********************  Today Or All Filter ************************************
        protected void Date_Filter_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData_All_Cheuqe();
            BindData_All_Transformation();
            BindData_All_Cash();
        }
        //********************  Singel Multi Filter ************************************
        protected void Singel_Multi_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData_All_Cheuqe();
            BindData_All_Transformation();
            BindData_All_Cash();

            if (Session["Langues"].ToString() == "1")
            {
                if (Singel_Multi_DropDownList.SelectedValue == "1") { lbl_Cash.Text = "All Cash"; lbl_Transformation.Text = "All Trasformation"; lbl_Cheques.Text = "All Cheque"; }
                else if (Singel_Multi_DropDownList.SelectedValue == "2") { lbl_Cash.Text = "Singel Contect Cash"; lbl_Transformation.Text = "Singel Contect Trasformation"; lbl_Cheques.Text = "Singel Contect Cheque"; }
                else if (Singel_Multi_DropDownList.SelectedValue == "3") { lbl_Cash.Text = "Multi Contect Cash"; lbl_Transformation.Text = "Multi Contect Trasformation"; lbl_Cheques.Text = "Multi Contect Cheque"; }
            }
            else
            {
                if (Singel_Multi_DropDownList.SelectedValue == "1") { lbl_Cash.Text = "كافة الدفعات"; lbl_Transformation.Text = "كافة الحوالات"; lbl_Cheques.Text = "كافة الشيكات"; }
                else if (Singel_Multi_DropDownList.SelectedValue == "2") { lbl_Cash.Text = "دفعات العقود المفردة"; lbl_Transformation.Text = "حوالات العقود المفردة"; lbl_Cheques.Text = "شيكات العقود المفردة"; }
                else if (Singel_Multi_DropDownList.SelectedValue == "3") { lbl_Cash.Text = "دفعات العقود المجملة"; lbl_Transformation.Text = "حوالات العقود المجملة"; lbl_Cheques.Text = "شيكات العقود المجملة"; }
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
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_contract", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //Get Collected_Or_NotCollected_DropDownList 
                    Collected_Or_NotCollected_DropDownList.Items.Clear();
                    Collected_Or_NotCollected_DropDownList.Items.Add(new ListItem("All", "1"));
                    Collected_Or_NotCollected_DropDownList.Items.Add(new ListItem("Collected", "2"));
                    Collected_Or_NotCollected_DropDownList.Items.Add(new ListItem("Uncollected", "3"));

                    //Get Singel_Multi_DropDownList 
                    Singel_Multi_DropDownList.Items.Clear();
                    Singel_Multi_DropDownList.Items.Add(new ListItem("All", "1"));
                    Singel_Multi_DropDownList.Items.Add(new ListItem("Single", "2"));
                    Singel_Multi_DropDownList.Items.Add(new ListItem("Multi", "3"));

                    //Get Date_Filter_DropDownList 
                    Date_Filter_DropDownList.Items.Clear();
                    Date_Filter_DropDownList.Items.Add(new ListItem("All", "1"));
                    Date_Filter_DropDownList.Items.Add(new ListItem("Today", "2"));


                    lbl_titel_Incomes_New_List.Text = Dt.Rows[70]["EN"].ToString();
                    lbl_Cheque.Text = Dt.Rows[71]["EN"].ToString();
                    lbl_Trans.Text = Dt.Rows[72]["EN"].ToString();
                    lbl_Cashe.Text = Dt.Rows[73]["EN"].ToString();
                    lbl_All.Text = Dt.Rows[74]["EN"].ToString();
                    lbl_Collected_NotCollected.Text = Dt.Rows[75]["EN"].ToString();
                    lbl_Singel_Multi.Text = Dt.Rows[76]["EN"].ToString();
                    lbl_Date_Filter.Text = Dt.Rows[77]["EN"].ToString();
                    lbl_Cash.Text = "All Cashes";
                    lbl_Transformation.Text = "All Trasfromations";
                    lbl_Cheques.Text = "All Cheque";
                }
                else
                {
                    //Get Collected_Or_NotCollected_DropDownList 
                    Collected_Or_NotCollected_DropDownList.Items.Clear();
                    Collected_Or_NotCollected_DropDownList.Items.Add(new ListItem("الكل", "1"));
                    Collected_Or_NotCollected_DropDownList.Items.Add(new ListItem("محصل", "2"));
                    Collected_Or_NotCollected_DropDownList.Items.Add(new ListItem("غير محصل", "3"));

                    //Get Singel_Multi_DropDownList 
                    Singel_Multi_DropDownList.Items.Clear();
                    Singel_Multi_DropDownList.Items.Add(new ListItem("الكل", "1"));
                    Singel_Multi_DropDownList.Items.Add(new ListItem("مفرد", "2"));
                    Singel_Multi_DropDownList.Items.Add(new ListItem("مجمل", "3"));

                    //Get Date_Filter_DropDownList 
                    Date_Filter_DropDownList.Items.Clear();
                    Date_Filter_DropDownList.Items.Add(new ListItem("الكل", "1"));
                    Date_Filter_DropDownList.Items.Add(new ListItem("تاريخ اليوم", "2"));


                    lbl_titel_Incomes_New_List.Text = Dt.Rows[70]["AR"].ToString();
                    lbl_Cheque.Text = Dt.Rows[71]["AR"].ToString();
                    lbl_Trans.Text = Dt.Rows[72]["AR"].ToString();
                    lbl_Cashe.Text = Dt.Rows[73]["AR"].ToString();
                    lbl_All.Text = Dt.Rows[74]["AR"].ToString();
                    lbl_Collected_NotCollected.Text = Dt.Rows[75]["AR"].ToString();
                    lbl_Singel_Multi.Text = Dt.Rows[76]["AR"].ToString();
                    lbl_Date_Filter.Text = Dt.Rows[77]["AR"].ToString();

                    lbl_Cash.Text = "كافة الدفعات";
                    lbl_Transformation.Text = "كافة الحوالات";
                    lbl_Cheques.Text = "كافة الشيكات";
                }
            }
            _sqlCon.Close();

        }

        protected void Avilabel_Cheuqes_ItemDataBound1(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lbl_Che_T_Code = (e.Item.FindControl("lbl_Che_T_Code") as Label);
                Label lbl_Che_T_ownership = (e.Item.FindControl("lbl_Che_T_ownership") as Label);
                Label lbl_Che_T_Building_Unit = (e.Item.FindControl("lbl_Che_T_Building_Unit") as Label);
                Label lbl_Che_T_Tenant = (e.Item.FindControl("lbl_Che_T_Tenant") as Label);
                Label lbl_Che_T_NO = (e.Item.FindControl("lbl_Che_T_NO") as Label);
                Label lbl_Che_T_Date = (e.Item.FindControl("lbl_Che_T_Date") as Label);
                Label lbl_Che_T_Value = (e.Item.FindControl("lbl_Che_T_Value") as Label);
                Label lbl_Che_T_Owner = (e.Item.FindControl("lbl_Che_T_Owner") as Label);
                Label lbl_Che_T_Beneficiary = (e.Item.FindControl("lbl_Che_T_Beneficiary") as Label);
                Label lbl_Che_T_Bank = (e.Item.FindControl("lbl_Che_T_Bank") as Label);
                Label lbl_Che_T_satuts = (e.Item.FindControl("lbl_Che_T_satuts") as Label);
                Label lbl_Che_T_Collect_Date = (e.Item.FindControl("lbl_Che_T_Collect_Date") as Label);


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_contract", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Che_T_Code.Text = Dt.Rows[55]["EN"].ToString();
                        lbl_Che_T_ownership.Text = Dt.Rows[4]["EN"].ToString();
                        lbl_Che_T_Building_Unit.Text = Dt.Rows[5]["EN"].ToString() + "/" + Dt.Rows[6]["EN"].ToString();
                        lbl_Che_T_Tenant.Text = Dt.Rows[2]["EN"].ToString();
                        lbl_Che_T_NO.Text = Dt.Rows[22]["EN"].ToString();
                        lbl_Che_T_Date.Text = Dt.Rows[23]["EN"].ToString();
                        lbl_Che_T_Value.Text = Dt.Rows[24]["EN"].ToString();
                        lbl_Che_T_Owner.Text = Dt.Rows[27]["EN"].ToString();
                        lbl_Che_T_Beneficiary.Text = Dt.Rows[28]["EN"].ToString();
                        lbl_Che_T_Bank.Text = Dt.Rows[26]["EN"].ToString();
                        lbl_Che_T_satuts.Text = Dt.Rows[78]["EN"].ToString();
                        lbl_Che_T_Collect_Date.Text = Dt.Rows[79]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Che_T_Code.Text = Dt.Rows[55]["AR"].ToString();
                        lbl_Che_T_ownership.Text = Dt.Rows[4]["AR"].ToString();
                        lbl_Che_T_Building_Unit.Text = Dt.Rows[5]["AR"].ToString() + "/" + Dt.Rows[6]["AR"].ToString();
                        lbl_Che_T_Tenant.Text = Dt.Rows[2]["AR"].ToString();
                        lbl_Che_T_NO.Text = Dt.Rows[22]["AR"].ToString();
                        lbl_Che_T_Date.Text = Dt.Rows[23]["AR"].ToString();
                        lbl_Che_T_Value.Text = Dt.Rows[24]["AR"].ToString();
                        lbl_Che_T_Owner.Text = Dt.Rows[27]["AR"].ToString();
                        lbl_Che_T_Beneficiary.Text = Dt.Rows[28]["AR"].ToString();
                        lbl_Che_T_Bank.Text = Dt.Rows[26]["AR"].ToString();
                        lbl_Che_T_satuts.Text = Dt.Rows[78]["AR"].ToString();
                        lbl_Che_T_Collect_Date.Text = Dt.Rows[79]["AR"].ToString();

                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                
                HtmlTableRow row = e.Item.FindControl("row") as HtmlTableRow;
                Label lbl_cheque_Status = (e.Item.FindControl("lbl_cheque_Status") as Label);

                string Filter = Collected_Or_NotCollected_DropDownList.SelectedValue;
                if (lbl_cheque_Status.Text == "محصل" || lbl_cheque_Status.Text == "محصل بالشيك" || lbl_cheque_Status.Text == "محصل بالتحويل" || lbl_cheque_Status.Text == "محصل نقداً" ||
                    lbl_cheque_Status.Text == "Collected" || lbl_cheque_Status.Text == "Collected By Cheque" || lbl_cheque_Status.Text == "Collected By Transformation" || lbl_cheque_Status.Text == "Collected By Cash")
                {
                    row.Attributes.Add("style", "background-color:#c5f8eb; ");
                }


                if (Filter == "3")
                {
                    if (lbl_cheque_Status.Text == "محصل" || lbl_cheque_Status.Text == "محصل بالشيك" || lbl_cheque_Status.Text == "محصل بالتحويل" || lbl_cheque_Status.Text == "محصل نقداً" ||
                    lbl_cheque_Status.Text == "Collected" || lbl_cheque_Status.Text == "Collected By Cheque" || lbl_cheque_Status.Text == "Collected By Transformation" || lbl_cheque_Status.Text == "Collected By Cash")
                    {
                        row.Visible = false;
                    }
                }
                else if (Filter == "2")
                {
                    if (lbl_cheque_Status.Text == "غير محصل" || lbl_cheque_Status.Text == "مؤجل" || lbl_cheque_Status.Text == "مرتجع" ||
                        lbl_cheque_Status.Text == "Uncollected" || lbl_cheque_Status.Text == "Delayed" || lbl_cheque_Status.Text == "Back")
                    {
                        row.Visible = false;
                    }
                }
                else { row.Visible = true; }
                //******************************************************************************************

                var XXXX = (System.Web.UI.WebControls.Label)e.Item.FindControl("XXXX");
                var YYYY = (System.Web.UI.WebControls.Label)e.Item.FindControl("YYYY");
                var lbl_AR_U_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_AR_U_NO");
                var lbl_EN_U_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_EN_U_NO");
                var lbl_Tenants_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_Arabic_Name");
                var lbl_Tenants_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_English_Name");
                var lbl_Bank_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Bank_Arabic_Name");
                var lbl_Bank_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Bank_English_Name");


                if (Session["Langues"].ToString() == "1")
                {
                    XXXX.Visible = false; YYYY.Visible = true;
                    lbl_AR_U_NO.Visible = false; lbl_EN_U_NO.Visible = true;
                    lbl_Tenants_Arabic_Name.Visible = false; lbl_Tenants_English_Name.Visible = true;
                    lbl_Bank_Arabic_Name.Visible = false; lbl_Bank_English_Name.Visible = true;

                    if (lbl_cheque_Status.Text == "مودع") { lbl_cheque_Status.Text = "Deposited"; }
                    else if (lbl_cheque_Status.Text == "غير مودع") { lbl_cheque_Status.Text = "Not Deposited"; }
                    else if (lbl_cheque_Status.Text == "محصل") { lbl_cheque_Status.Text = "Collected"; }
                    else if (lbl_cheque_Status.Text == "غير محصل") { lbl_cheque_Status.Text = "Uncollected"; }
                    else if (lbl_cheque_Status.Text == "مؤجل") { lbl_cheque_Status.Text = "Delayed"; }
                    else if (lbl_cheque_Status.Text == "مرتجع") { lbl_cheque_Status.Text = "Back"; }
                    else if (lbl_cheque_Status.Text == "مستبدل بالتحويل") { lbl_cheque_Status.Text = "Replaced By Transformation"; }
                    else if (lbl_cheque_Status.Text == "مستبدل نقداً") { lbl_cheque_Status.Text = "Replaced By Cash"; }
                    else if (lbl_cheque_Status.Text == "مستبدل بشيك اخر") { lbl_cheque_Status.Text = "Replaced By Onther Cheque"; }
                }
                else
                {
                    XXXX.Visible = true; YYYY.Visible = false;
                    lbl_AR_U_NO.Visible = true; lbl_EN_U_NO.Visible = false;
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;
                    lbl_Bank_Arabic_Name.Visible = true; lbl_Bank_English_Name.Visible = false;


                    if (lbl_cheque_Status.Text == "Deposited") { lbl_cheque_Status.Text = "مودع"; }
                    else if (lbl_cheque_Status.Text == "Not Deposited") { lbl_cheque_Status.Text = "غير مودع"; }
                    else if (lbl_cheque_Status.Text == "Collected") { lbl_cheque_Status.Text = "محصل"; }
                    else if (lbl_cheque_Status.Text == "Uncollected") { lbl_cheque_Status.Text = "غير محصل"; }
                    else if (lbl_cheque_Status.Text == "Delayed") { lbl_cheque_Status.Text = "مؤجل"; }
                    else if (lbl_cheque_Status.Text == "Back") { lbl_cheque_Status.Text = "مرتجع"; }
                    else if (lbl_cheque_Status.Text == "Replaced By Transformation") { lbl_cheque_Status.Text = "مستبدل بالتحويل"; }
                    else if (lbl_cheque_Status.Text == "Replaced By Cash") { lbl_cheque_Status.Text = "مستبدل نقداً"; }
                    else if (lbl_cheque_Status.Text == "Replaced By Onther Cheque") { lbl_cheque_Status.Text = "مستبدل بشيك اخر"; }
                }
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lbl_Tr_T_Code = (e.Item.FindControl("lbl_Tr_T_Code") as Label);
                Label lbl_Tr_T_ownership = (e.Item.FindControl("lbl_Tr_T_ownership") as Label);
                Label lbl_Tr_T_Building_Unit = (e.Item.FindControl("lbl_Tr_T_Building_Unit") as Label);
                Label lbl_Tr_T_Tenant = (e.Item.FindControl("lbl_Tr_T_Tenant") as Label);
                Label lbl_Tr_T_NO = (e.Item.FindControl("lbl_Tr_T_NO") as Label);
                Label lbl_Tr_T_Date = (e.Item.FindControl("lbl_Tr_T_Date") as Label);
                Label lbl_Tr_T_Value = (e.Item.FindControl("lbl_Tr_T_Value") as Label);
                Label lbl_Tr_T_Beneficiary = (e.Item.FindControl("lbl_Tr_T_Beneficiary") as Label);
                Label lbl_Tr_T_Bank = (e.Item.FindControl("lbl_Tr_T_Bank") as Label);
                Label lbl_Tr_T_satuts = (e.Item.FindControl("lbl_Tr_T_satuts") as Label);
                Label lbl_Tr_T_Collect_Date = (e.Item.FindControl("lbl_Tr_T_Collect_Date") as Label);
                Label lbl_Tr_T_Account_No = (e.Item.FindControl("lbl_Tr_T_Account_No") as Label);
                Label lbl_Tr_T_Soft_Code = (e.Item.FindControl("lbl_Tr_T_Soft_Code") as Label);


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_contract", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Tr_T_Code.Text = Dt.Rows[55]["EN"].ToString();
                        lbl_Tr_T_ownership.Text = Dt.Rows[4]["EN"].ToString();
                        lbl_Tr_T_Building_Unit.Text = Dt.Rows[5]["EN"].ToString() + "/" + Dt.Rows[6]["EN"].ToString();
                        lbl_Tr_T_Tenant.Text = Dt.Rows[2]["EN"].ToString();
                        lbl_Tr_T_NO.Text = Dt.Rows[29]["EN"].ToString();
                        lbl_Tr_T_Date.Text = Dt.Rows[30]["EN"].ToString();
                        lbl_Tr_T_Value.Text = Dt.Rows[31]["EN"].ToString();
                        lbl_Tr_T_Beneficiary.Text = Dt.Rows[28]["EN"].ToString();
                        lbl_Tr_T_Bank.Text = Dt.Rows[26]["EN"].ToString();
                        lbl_Tr_T_satuts.Text = Dt.Rows[78]["EN"].ToString();
                        lbl_Tr_T_Collect_Date.Text = Dt.Rows[79]["EN"].ToString();

                        lbl_Tr_T_Account_No.Text = Dt.Rows[80]["EN"].ToString();
                        lbl_Tr_T_Soft_Code.Text = Dt.Rows[81]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Tr_T_Code.Text = Dt.Rows[55]["AR"].ToString();
                        lbl_Tr_T_ownership.Text = Dt.Rows[4]["AR"].ToString();
                        lbl_Tr_T_Building_Unit.Text = Dt.Rows[5]["AR"].ToString() + "/" + Dt.Rows[6]["AR"].ToString();
                        lbl_Tr_T_Tenant.Text = Dt.Rows[2]["AR"].ToString();
                        lbl_Tr_T_NO.Text = Dt.Rows[29]["AR"].ToString();
                        lbl_Tr_T_Date.Text = Dt.Rows[30]["AR"].ToString();
                        lbl_Tr_T_Value.Text = Dt.Rows[31]["AR"].ToString();
                        lbl_Tr_T_Beneficiary.Text = Dt.Rows[28]["AR"].ToString();
                        lbl_Tr_T_Bank.Text = Dt.Rows[26]["AR"].ToString();
                        lbl_Tr_T_satuts.Text = Dt.Rows[78]["AR"].ToString();
                        lbl_Tr_T_Collect_Date.Text = Dt.Rows[79]["AR"].ToString();

                        lbl_Tr_T_Account_No.Text = Dt.Rows[80]["AR"].ToString();
                        lbl_Tr_T_Soft_Code.Text = Dt.Rows[81]["AR"].ToString();
                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HtmlTableRow row = e.Item.FindControl("row") as HtmlTableRow;
                Label lbl_cheque_Status = (e.Item.FindControl("lbl_cheque_Status") as Label);

                string Filter = Collected_Or_NotCollected_DropDownList.SelectedValue;
                if (lbl_cheque_Status.Text == "محصل" || lbl_cheque_Status.Text == "Collected")
                {
                    row.Attributes.Add("style", "background-color:#c5f8eb; ");
                }


                if (Filter == "3")
                {
                    if (lbl_cheque_Status.Text == "محصل" || lbl_cheque_Status.Text == "Collected")
                    {
                        row.Visible = false;
                    }
                }
                else if (Filter == "2")
                {
                    if (lbl_cheque_Status.Text == "غير محصل" || lbl_cheque_Status.Text == "Uncollected")
                    {
                        row.Visible = false;
                    }
                }
                else { row.Visible = true; }
                //******************************************************************************************

                var XXXX = (System.Web.UI.WebControls.Label)e.Item.FindControl("XXXX");
                var YYYY = (System.Web.UI.WebControls.Label)e.Item.FindControl("YYYY");
                var lbl_AR_U_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_AR_U_NO");
                var lbl_EN_U_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_EN_U_NO");
                var lbl_Tenants_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_Arabic_Name");
                var lbl_Tenants_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_English_Name");
                var lbl_Bank_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Bank_Arabic_Name");
                var lbl_Bank_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Bank_English_Name");

                var lbl_beneficiary_person = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_beneficiary_person");
                var lbl_EN_beneficiary_person = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_EN_beneficiary_person");


                if (Session["Langues"].ToString() == "1")
                {
                    XXXX.Visible = false; YYYY.Visible = true;
                    lbl_AR_U_NO.Visible = false; lbl_EN_U_NO.Visible = true;
                    lbl_Tenants_Arabic_Name.Visible = false; lbl_Tenants_English_Name.Visible = true;
                    lbl_Bank_Arabic_Name.Visible = false; lbl_Bank_English_Name.Visible = true;
                    lbl_beneficiary_person.Visible = false; lbl_EN_beneficiary_person.Visible = true;

                    if (lbl_cheque_Status.Text == "محصل") { lbl_cheque_Status.Text = "Collected"; }
                    else if (lbl_cheque_Status.Text == "غير محصل") { lbl_cheque_Status.Text = "Uncollected"; }
                    
                }
                else
                {
                    XXXX.Visible = true; YYYY.Visible = false;
                    lbl_AR_U_NO.Visible = true; lbl_EN_U_NO.Visible = false;
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;
                    lbl_Bank_Arabic_Name.Visible = true; lbl_Bank_English_Name.Visible = false;
                    lbl_beneficiary_person.Visible = true; lbl_EN_beneficiary_person.Visible = false;

                    if (lbl_cheque_Status.Text == "Collected") { lbl_cheque_Status.Text = "محصل"; }
                    else if (lbl_cheque_Status.Text == "Uncollected") { lbl_cheque_Status.Text = "غير محصل"; }
                    
                }
            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lbl_Ca_T_Code = (e.Item.FindControl("lbl_Ca_T_Code") as Label);
                Label lbl_Ca_T_ownership = (e.Item.FindControl("lbl_Ca_T_ownership") as Label);
                Label lbl_Ca_T_Building_Unit = (e.Item.FindControl("lbl_Ca_T_Building_Unit") as Label);
                Label lbl_Ca_T_Tenant = (e.Item.FindControl("lbl_Ca_T_Tenant") as Label);
                Label lbl_Ca_T_Date = (e.Item.FindControl("lbl_Ca_T_Date") as Label);
                Label lbl_Ca_T_Value = (e.Item.FindControl("lbl_Ca_T_Value") as Label);
                Label lbl_Ca_T_satuts = (e.Item.FindControl("lbl_Ca_T_satuts") as Label);
                Label lbl_Ca_T_Collect_Date = (e.Item.FindControl("lbl_Ca_T_Collect_Date") as Label);


                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_contract", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Ca_T_Code.Text = Dt.Rows[55]["EN"].ToString();
                        lbl_Ca_T_ownership.Text = Dt.Rows[4]["EN"].ToString();
                        lbl_Ca_T_Building_Unit.Text = Dt.Rows[5]["EN"].ToString() + "/" + Dt.Rows[6]["EN"].ToString();
                        lbl_Ca_T_Tenant.Text = Dt.Rows[2]["EN"].ToString();
                        lbl_Ca_T_Date.Text = Dt.Rows[33]["EN"].ToString();
                        lbl_Ca_T_Value.Text = Dt.Rows[32]["EN"].ToString();
                        lbl_Ca_T_satuts.Text = Dt.Rows[78]["EN"].ToString();
                        lbl_Ca_T_Collect_Date.Text = Dt.Rows[79]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Ca_T_Code.Text = Dt.Rows[55]["AR"].ToString();
                        lbl_Ca_T_ownership.Text = Dt.Rows[4]["AR"].ToString();
                        lbl_Ca_T_Building_Unit.Text = Dt.Rows[5]["AR"].ToString() + "/" + Dt.Rows[6]["AR"].ToString();
                        lbl_Ca_T_Tenant.Text = Dt.Rows[2]["AR"].ToString();
                        lbl_Ca_T_Date.Text = Dt.Rows[33]["AR"].ToString();
                        lbl_Ca_T_Value.Text = Dt.Rows[32]["AR"].ToString();
                        lbl_Ca_T_satuts.Text = Dt.Rows[78]["AR"].ToString();
                        lbl_Ca_T_Collect_Date.Text = Dt.Rows[79]["AR"].ToString();
                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                HtmlTableRow row = e.Item.FindControl("row") as HtmlTableRow;
                Label lbl_cheque_Status = (e.Item.FindControl("lbl_cheque_Status") as Label);

                string Filter = Collected_Or_NotCollected_DropDownList.SelectedValue;
                if (lbl_cheque_Status.Text == "محصل" || lbl_cheque_Status.Text == "Collected")
                {
                    row.Attributes.Add("style", "background-color:#c5f8eb; ");
                }


                if (Filter == "3")
                {
                    if (lbl_cheque_Status.Text == "محصل" || lbl_cheque_Status.Text == "Collected")
                    {
                        row.Visible = false;
                    }
                }
                else if (Filter == "2")
                {
                    if (lbl_cheque_Status.Text == "غير محصل" || lbl_cheque_Status.Text == "Uncollected")
                    {
                        row.Visible = false;
                    }
                }
                else { row.Visible = true; }
                //******************************************************************************************

                var XXXX = (System.Web.UI.WebControls.Label)e.Item.FindControl("XXXX");
                var YYYY = (System.Web.UI.WebControls.Label)e.Item.FindControl("YYYY");
                var lbl_AR_U_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_AR_U_NO");
                var lbl_EN_U_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_EN_U_NO");
                var lbl_Tenants_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_Arabic_Name");
                var lbl_Tenants_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_English_Name");



                if (Session["Langues"].ToString() == "1")
                {
                    XXXX.Visible = false; YYYY.Visible = true;
                    lbl_AR_U_NO.Visible = false; lbl_EN_U_NO.Visible = true;
                    lbl_Tenants_Arabic_Name.Visible = false; lbl_Tenants_English_Name.Visible = true;

                    if (lbl_cheque_Status.Text == "محصل") { lbl_cheque_Status.Text = "Collected"; }
                    else if (lbl_cheque_Status.Text == "غير محصل") { lbl_cheque_Status.Text = "Uncollected"; }

                }
                else
                {
                    XXXX.Visible = true; YYYY.Visible = false;
                    lbl_AR_U_NO.Visible = true; lbl_EN_U_NO.Visible = false;
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;

                    if (lbl_cheque_Status.Text == "Collected") { lbl_cheque_Status.Text = "محصل"; }
                    else if (lbl_cheque_Status.Text == "Uncollected") { lbl_cheque_Status.Text = "غير محصل"; }

                }
            }
        }
    }
}