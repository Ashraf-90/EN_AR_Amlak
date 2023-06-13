using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Crmf;
using System;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Main_Real_estate.English.Main_Application
{
    public partial class M_Ownership_List : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Add_permission(_sqlCon, Session["Role"].ToString(), "properties", Add);
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();
                BindData();
            }
        }
        protected void Edit_Click(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            //Response.Redirect("M_Ownership_List.aspx?Id=" + id);
            Label2.Text = id;
            DataTable Dt = new DataTable();
            _sqlCon.Open();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM mortgaged_wonership WHERE Mortgaged_Wonership_Id = @ID", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Cmd.Parameters.AddWithValue("@ID", Label2.Text);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                ownership_Name_DropDownList.SelectedValue = Dt.Rows[0]["Ownership_Id"].ToString();
                Bank_Name_DropDownList.SelectedValue = Dt.Rows[0]["Bank_Id"].ToString();
                txt_Mortgage_Value.Text = Dt.Rows[0]["Mortgage_Value"].ToString();
                if (Dt.Rows[0]["Paymen_Type"].ToString() == "Monthly" || Dt.Rows[0]["Paymen_Type"].ToString() == "شهري") { Paymen_Type_DropDownList.SelectedValue = "1"; }
                else if (Dt.Rows[0]["Paymen_Type"].ToString() == "Quarterly" || Dt.Rows[0]["Paymen_Type"].ToString() == "ربع سنوي") { Paymen_Type_DropDownList.SelectedValue = "2"; }
                txt_Installment_Value.Text = Dt.Rows[0]["Installment_Value"].ToString();
                txt_Start_Date.Text = Dt.Rows[0]["Start_Date"].ToString();
                txt_End_Date.Text = Dt.Rows[0]["End_Date"].ToString();

            }
            _sqlCon.Close();

        }
        protected void btn_Add_M_OwnerShip_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string add_M_OwnerShip_Quary =  "Insert Into mortgaged_wonership " +
                                                "(Ownership_Id , Bank_Id , Mortgage_Value , Installment_Value , Start_Date , End_Date , Paymen_Type) " +
                                                "VALUES" +
                                                "(@Ownership_Id , @Bank_Id , @Mortgage_Value , @Installment_Value , @Start_Date , @End_Date , @Paymen_Type)";
                _sqlCon.Open();
                MySqlCommand add_M_OwnerShip_Cmd = new MySqlCommand(add_M_OwnerShip_Quary, _sqlCon);
                add_M_OwnerShip_Cmd.Parameters.AddWithValue("@Ownership_Id", ownership_Name_DropDownList.SelectedValue);
                add_M_OwnerShip_Cmd.Parameters.AddWithValue("@Bank_Id", Bank_Name_DropDownList.SelectedValue);
                add_M_OwnerShip_Cmd.Parameters.AddWithValue("@Mortgage_Value", txt_Mortgage_Value.Text);
                add_M_OwnerShip_Cmd.Parameters.AddWithValue("@Installment_Value", txt_Installment_Value.Text);
                add_M_OwnerShip_Cmd.Parameters.AddWithValue("@Start_Date", txt_Start_Date.Text);
                add_M_OwnerShip_Cmd.Parameters.AddWithValue("@End_Date", txt_End_Date.Text);
                add_M_OwnerShip_Cmd.Parameters.AddWithValue("@Paymen_Type", Paymen_Type_DropDownList.SelectedItem.Text);
                add_M_OwnerShip_Cmd.ExecuteNonQuery();
                _sqlCon.Close();
                Response.Redirect("M_Ownership_List.aspx");
            }
        }
        protected void btn_Edit_M_OwnerShip_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Quary =
                    "UPDATE mortgaged_wonership SET " +
                    "Ownership_Id=@Ownership_Id , " +
                    "Bank_Id=@Bank_Id , " +
                    "Mortgage_Value=@Mortgage_Value , " +
                    "Installment_Value=@Installment_Value , " +
                    "Paymen_Type=@Paymen_Type , " +
                    "Start_Date=@Start_Date , " +
                    "End_Date=@End_Date " +
                    "WHERE Mortgaged_Wonership_Id=@ID ";
                _sqlCon.Open();
                MySqlCommand Cmd = new MySqlCommand(Quary, _sqlCon);
                Cmd.Parameters.AddWithValue("@ID", Label2.Text);
                Cmd.Parameters.AddWithValue("@Ownership_Id", ownership_Name_DropDownList.SelectedValue);
                Cmd.Parameters.AddWithValue("@Bank_Id", Bank_Name_DropDownList.SelectedValue);
                Cmd.Parameters.AddWithValue("@Mortgage_Value", txt_Mortgage_Value.Text);
                Cmd.Parameters.AddWithValue("@Installment_Value", txt_Installment_Value.Text);
                Cmd.Parameters.AddWithValue("@Paymen_Type", Paymen_Type_DropDownList.SelectedItem.Text.Trim());
                Cmd.Parameters.AddWithValue("@Start_Date", txt_Start_Date.Text);
                Cmd.Parameters.AddWithValue("@End_Date", txt_End_Date.Text);
                Cmd.ExecuteNonQuery();
                _sqlCon.Close();
            }
            Response.Redirect(Request.RawUrl);
        }
        protected void Delete(object sender, EventArgs e)
        {
            try
            {
                string id = (sender as LinkButton).CommandArgument;
                _sqlCon.Open();
                string quary1 = "DELETE FROM mortgaged_wonership WHERE Mortgaged_Wonership_Id=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(quary1, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", id);
                mySqlCmd.ExecuteNonQuery();
                _sqlCon.Close();
                Response.Redirect(Request.RawUrl);
            }
            catch
            {
                if (Session["Langues"].ToString() == "1") { Response.Write(@"<script language='javascript'>alert('Cannot delete')</script>"); }
                else { Response.Write(@"<script language='javascript'>alert('لا يمكن الحذف')</script>"); }

            };
        }



        protected void BindData(string sortExpression = null)
        {
            
            using (MySqlCommand cmd = new MySqlCommand("M_OwnerShip", _sqlCon))
            {
                using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    M_Ownership_Repeater.DataSource = dt;
                    M_Ownership_Repeater.DataBind();
                }
            }
        }

        



        //**************************************************** Clanders **************************************************************************
        //******************  Start_Date ***************************************************
        protected void Start_Date_Calendar_SelectionChanged2(object sender, EventArgs e)
        {
            string Start_Dat = DateTime.Parse(Start_Date_Calendar.SelectedDate.ToString()).ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            txt_Start_Date.Text = Start_Dat;
            if (txt_Start_Date.Text != "")
            {
                Start_Date_Div.Visible = false;
                ImageButton2.Visible = false;
            }
        }
        protected void Start_Date_Chosee_Click(object sender, EventArgs e)
        { Utilities.Helper.Date_Chosee_Click(ImageButton2, Start_Date_Div); }
        protected void ImageButton2_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        { Utilities.Helper.cal_Close(ImageButton2, Start_Date_Div); }

        //******************  End_Date ***************************************************
        protected void End_Date_Chosee_Click(object sender, EventArgs e)
        { Utilities.Helper.Date_Chosee_Click(ImageButton3, End_Date_Div); }
        protected void ImageButton3_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        { Utilities.Helper.cal_Close(ImageButton3, End_Date_Div); }

        protected void End_Date_Calendar_SelectionChanged1(object sender, EventArgs e)
        {
            string End_Date = DateTime.Parse(End_Date_Calendar.SelectedDate.ToString()).ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
            txt_End_Date.Text = End_Date;
            if (txt_End_Date.Text != "")
            {
                End_Date_Div.Visible = false;
                ImageButton3.Visible = false;
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
                    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship ", _sqlCon, ownership_Name_DropDownList, "Owner_Ship_EN_Name", "Owner_Ship_Id");
                    ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Bank Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM bank", _sqlCon, Bank_Name_DropDownList, "Bank_English_Name", "Bank_Id");
                    Bank_Name_DropDownList.Items.Insert(0, "...............");


                    //Get Paymen_Type_DropDownList DropDownList
                    Paymen_Type_DropDownList.Items.Clear();
                    Paymen_Type_DropDownList.Items.Add(new ListItem("Monthly", "1"));
                    Paymen_Type_DropDownList.Items.Add(new ListItem("Quarterly", "2"));
                    Paymen_Type_DropDownList.Items.Insert(0, "...............");

                    lbl_Titel_Add_M_Ownership.Text = "Add a Mortgage";
                    lbl_ownership_Name.Text = Dt.Rows[44]["EN"].ToString();
                    lbl_Bank_Name.Text = Dt.Rows[108]["EN"].ToString();
                    lbl_Mortgage_Value.Text = Dt.Rows[107]["EN"].ToString();
                    lbl_Paymen_Type.Text = Dt.Rows[106]["EN"].ToString();
                    lbl_Installment_Value.Text = Dt.Rows[105]["EN"].ToString();
                    lbl_Start_Date.Text = Dt.Rows[103]["EN"].ToString();
                    lbl_End_Date.Text = Dt.Rows[102]["EN"].ToString();
                    Add.Text = "Add";
                    Edit.Text = "Edit";
                    Start_Date_Chosee.Text= Dt.Rows[109]["EN"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[109]["EN"].ToString();
                    Label1.Text = Dt.Rows[101]["EN"].ToString();

                    ownership_Name_Req_Field_Val.ErrorMessage = "* Required ";
                    Bank_Name_Req_Field_Val.ErrorMessage = "* Required ";
                    Mortgage_Value_Req_Field_Val.ErrorMessage = "* Required ";
                    Paymen_Type_Req_Field_Val.ErrorMessage = "* Required ";
                    Installment_Value_Req_Field_Val.ErrorMessage = "* Required ";
                    Start_Date_Req_Field_Val.ErrorMessage = "* Required ";
                    End_Date_Req_Field_Val.ErrorMessage = "* Required ";

                    Installment_Value_Reg_Exp_Vali.ErrorMessage = Dt.Rows[58]["EN"].ToString();
                    Mortgage_Value_Reg_Exp_Vali.ErrorMessage = Dt.Rows[58]["EN"].ToString();


                }
                else
                {

                    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship ", _sqlCon, ownership_Name_DropDownList, "Owner_Ship_AR_Name", "Owner_Ship_Id");
                    ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //Fill Bank Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM bank", _sqlCon, Bank_Name_DropDownList, "Bank_Arabic_Name", "Bank_Id");
                    Bank_Name_DropDownList.Items.Insert(0, "...............");

                    //Get Paymen_Type_DropDownList DropDownList
                    Paymen_Type_DropDownList.Items.Clear();
                    Paymen_Type_DropDownList.Items.Add(new ListItem("شهري", "1"));
                    Paymen_Type_DropDownList.Items.Add(new ListItem("ربع سنوي", "2"));
                    Paymen_Type_DropDownList.Items.Insert(0, "...............");

                    lbl_Titel_Add_M_Ownership.Text = "إضافة رهن ";
                    lbl_ownership_Name.Text = Dt.Rows[44]["AR"].ToString();
                    lbl_Bank_Name.Text = Dt.Rows[108]["AR"].ToString();
                    lbl_Mortgage_Value.Text = Dt.Rows[107]["AR"].ToString();
                    lbl_Paymen_Type.Text = Dt.Rows[106]["AR"].ToString();
                    lbl_Installment_Value.Text = Dt.Rows[105]["AR"].ToString();
                    lbl_Start_Date.Text = Dt.Rows[103]["AR"].ToString();
                    lbl_End_Date.Text = Dt.Rows[102]["AR"].ToString();
                    Add.Text = "إضافة";
                    Edit.Text = "تعديل";
                    Start_Date_Chosee.Text = Dt.Rows[109]["AR"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[109]["AR"].ToString();
                    Label1.Text = Dt.Rows[101]["AR"].ToString();

                    ownership_Name_Req_Field_Val.ErrorMessage = "* حقل مطلوب ";
                    Bank_Name_Req_Field_Val.ErrorMessage = "* حقل مطلوب ";
                    Mortgage_Value_Req_Field_Val.ErrorMessage = "* حقل مطلوب ";
                    Paymen_Type_Req_Field_Val.ErrorMessage = "* Required ";
                    Installment_Value_Req_Field_Val.ErrorMessage = "* حقل مطلوب ";
                    Start_Date_Req_Field_Val.ErrorMessage = "* حقل مطلوب ";
                    End_Date_Req_Field_Val.ErrorMessage = "* حقل مطلوب ";

                    Installment_Value_Reg_Exp_Vali.ErrorMessage = Dt.Rows[58]["AR"].ToString();
                    Mortgage_Value_Reg_Exp_Vali.ErrorMessage = Dt.Rows[58]["AR"].ToString();
                }
            }
            _sqlCon.Close();
        }

        protected void M_Ownership_Repeater_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            ScriptManager scriptMan = ScriptManager.GetCurrent(this);
            LinkButton btn = e.Item.FindControl("Edit") as LinkButton;
            if (btn != null)
            {
                btn.Click += Edit_Click;
                scriptMan.RegisterAsyncPostBackControl(btn);
            }
        }

        protected void M_Ownership_Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
            var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");
            var lbl_Bank_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Bank_Arabic_Name");
            var lbl_Bank_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Bank_English_Name");
            var lbl_Paymen_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Paymen_Type");



            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                LinkButton Edit = e.Item.FindControl("Edit") as LinkButton;
                Utilities.Roles.Edit_permission(_sqlCon, Session["Role"].ToString(), "properties", Edit);
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                    lbl_Bank_Arabic_Name.Visible = false; lbl_Bank_English_Name.Visible = true;

                    if(lbl_Paymen_Type.Text== "شهري") { lbl_Paymen_Type.Text = "Monthly"; }
                    if (lbl_Paymen_Type.Text == "ربع سنوي") { lbl_Paymen_Type.Text = "Quarterly"; }

                }
                else
                {
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_Bank_Arabic_Name.Visible = true; lbl_Bank_English_Name.Visible = false;

                    if (lbl_Paymen_Type.Text == "Monthly") { lbl_Paymen_Type.Text = "شهري"; }
                    if (lbl_Paymen_Type.Text == "Quarterly") { lbl_Paymen_Type.Text = "ربع سنوي"; }
                }
            }

            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_OwnerShip_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_OwnerShip_Name");
                var lbl_Titel_Bank_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Bank_Name");
                var lbl_Titel_Mortgage_Value = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Mortgage_Value");
                var lbl_Titel_Installment_Value = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Installment_Value");
                var lbl_Titel_Payment_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Payment_Type");
                var lbl_Titel_Amount_Paid = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Amount_Paid");
                var lbl_Titel_Remaining_Amount = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Remaining_Amount");
                var lbl_Titel_Remaining_Installments = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Remaining_Installments");
                var lbl_Titel_Start_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_Start_Date");
                var lbl_Titel_End_Date = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Titel_End_Date");





                _sqlCon.Open();
                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_OwnerShip_Name.Text = Dt.Rows[44]["EN"].ToString();
                        lbl_Titel_Bank_Name.Text = Dt.Rows[108]["EN"].ToString();
                        lbl_Titel_Mortgage_Value.Text = Dt.Rows[107]["EN"].ToString();
                        lbl_Titel_Installment_Value.Text = Dt.Rows[105]["EN"].ToString();
                        lbl_Titel_Payment_Type.Text = Dt.Rows[106]["EN"].ToString();
                        lbl_Titel_Amount_Paid.Text = Dt.Rows[112]["EN"].ToString();
                        lbl_Titel_Remaining_Amount.Text = Dt.Rows[111]["EN"].ToString();
                        lbl_Titel_Remaining_Installments.Text = "Remaining Installments";
                        lbl_Titel_Start_Date.Text = Dt.Rows[103]["EN"].ToString();
                        lbl_Titel_End_Date.Text = Dt.Rows[102]["EN"].ToString();
                    }
                    else
                    {
                        lbl_OwnerShip_Name.Text = Dt.Rows[44]["AR"].ToString();
                        lbl_Titel_Bank_Name.Text = Dt.Rows[108]["AR"].ToString();
                        lbl_Titel_Mortgage_Value.Text = Dt.Rows[107]["AR"].ToString();
                        lbl_Titel_Installment_Value.Text = Dt.Rows[105]["AR"].ToString();
                        lbl_Titel_Payment_Type.Text = Dt.Rows[106]["AR"].ToString();
                        lbl_Titel_Amount_Paid.Text = Dt.Rows[112]["AR"].ToString();
                        lbl_Titel_Remaining_Amount.Text = Dt.Rows[111]["AR"].ToString();
                        lbl_Titel_Remaining_Installments.Text = "الأقساط المتبقية";
                        lbl_Titel_Start_Date.Text = Dt.Rows[103]["AR"].ToString();
                        lbl_Titel_End_Date.Text = Dt.Rows[102]["AR"].ToString();
                    }
                }
                _sqlCon.Close();
            }
        }
    }
}