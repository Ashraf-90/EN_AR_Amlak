using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Add_Contract1 : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Contracting", 0, "R");
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Contracting", 1, "A");
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();


                //--------------------------------------- Fill Cheque GridView with Added Cheques --------------------------------------------------------------
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[11]
                {
                    new DataColumn("Cheques_No"), new DataColumn("Cheques_Date"), new DataColumn("Cheques_Amount"),
                    new DataColumn("Cheque_Type"), new DataColumn("cheque_type_Cheque_Type_id"),
                    new DataColumn("Cheque_Bank_Name"),
                    new DataColumn("bank_Bank_Id"), new DataColumn("Tenant_Name"), new DataColumn("tenants_Tenants_ID"), new DataColumn("Cheque_Owner"), 
                    new DataColumn("beneficiary_person")
                });
                ViewState["Customers"] = dt;
                this.BindGrid();
                //**************************************************************************************************************************************************

                //--------------------------------------- Fill transformation GridView with Added transformation --------------------------------------------------------------
                DataTable Tr_Dt = new DataTable();
                Tr_Dt.Columns.AddRange(new DataColumn[7]
                {
                    new DataColumn("transformation_No"),
                    new DataColumn("Bank_Name"),new DataColumn("transformation_Bank_ID"), 
                    new DataColumn("transformation_Date"),
                    new DataColumn("Amount"), 
                    new DataColumn("tenant_Name"), new DataColumn("tenant_Id")
                });
                ViewState["transformation_Customers"] = Tr_Dt;
                this.BindGrid();
                //**************************************************************************************************************************************************

                //--------------------------------------- Fill Cash GridView with Added Cash --------------------------------------------------------------

                DataTable Ch_Dt = new DataTable();
                Ch_Dt.Columns.AddRange(new DataColumn[4]
                {
                    new DataColumn("Cash_Amount"),
                    new DataColumn("Cash_Date"),
                    new DataColumn("tenant_Name"), new DataColumn("tenant_Id")
                });
                ViewState["Cash_Customers"] = Ch_Dt;
                this.BindGrid();
               
            }
        }

        protected void BindGrid()
        {
            Cheque_GridView.DataSource = (DataTable)ViewState["Customers"];
            Cheque_GridView.DataBind();
        }


        protected void transformation_BindGrid()
        {
            transformation_GridView.DataSource = (DataTable)ViewState["transformation_Customers"];
            transformation_GridView.DataBind();
        }


        protected void Cash_BindGrid()
        {
            Cash_GridView.DataSource = (DataTable)ViewState["Cash_Customers"];
            Cash_GridView.DataBind();
        }

        //*****************************************************************************************************************
        //************************************   Buttons Events    **************************************************
        //*****************************************************************************************************************
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["Customers"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["Customers"] = dt;
            BindGrid();

           
        }
        protected void transformation_GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable Tr_Dt = ViewState["transformation_Customers"] as DataTable;
            Tr_Dt.Rows[index].Delete();
            ViewState["transformation_Customers"] = Tr_Dt;
            transformation_BindGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable Tr_Dt = ViewState["Cash_Customers"] as DataTable;
            Tr_Dt.Rows[index].Delete();
            ViewState["Cash_Customers"] = Tr_Dt;
            Cash_BindGrid();
        }

        //************************************** Add Cheques in the View  ***************************************************************************************

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            if (serial_CheckBox.Checked==true)
            {
                if (txt_Cheque_NO.Text != "" & txt_Cheque_Date.Text != ""
                && txt_Cheque_Value.Text != "" & Cheque_Type_DropDownList.SelectedItem.Text != "..............."
                && Bank_Cheque_Name_DropDownList.SelectedItem.Text != "..............." &&
                Tenan_Name_DropDownList.SelectedItem.Text != "..............." && Cheque_Owner.Text != "")
                {
                    for(int i = 0; i < Convert.ToInt32(txt_No_serial_Chques.Text); i++)
                    {
                        int Cheque_NO = Convert.ToInt32(txt_Cheque_NO.Text.Trim())+i;
                        DateTime Cheque_Date = Convert.ToDateTime(txt_Cheque_Date.Text.Trim()).AddMonths(i);
                        string String_Cheque_Date = Cheque_Date.ToString("dd/MM/yyyy");
                        DataTable dt1 = (DataTable)ViewState["Customers"];
                        dt1.Rows.Add
                        (
                            
                            Convert.ToString(Cheque_NO),
                            String_Cheque_Date,
                            txt_Cheque_Value.Text.Trim(),
                            Cheque_Type_DropDownList.SelectedItem.Text.Trim(),
                            Cheque_Type_DropDownList.SelectedValue,
                            Bank_Cheque_Name_DropDownList.SelectedItem.Text.Trim(),
                            Bank_Cheque_Name_DropDownList.SelectedValue,
                            Tenan_Name_DropDownList.SelectedItem.Text.Trim(),
                            Tenan_Name_DropDownList.SelectedValue,
                            Cheque_Owner.Text.Trim() ,
                            txt_beneficiary_person.Text.Trim()
                        ); ;
                        ViewState["Customers"] = dt1;
                        this.BindGrid();
                        lbl_Worrnig_Cheque.Visible = false;
                    }
                }
                else
                {
                    lbl_Worrnig_Cheque.Visible = true;
                }
            }
            else
            {
                if (txt_Cheque_NO.Text != "" & txt_Cheque_Date.Text != ""
               && txt_Cheque_Value.Text != "" & Cheque_Type_DropDownList.SelectedItem.Text != "..............."
               && Bank_Cheque_Name_DropDownList.SelectedItem.Text != "..............." &&
               Tenan_Name_DropDownList.SelectedItem.Text != "..............." && Cheque_Owner.Text != "")
                {
                    DataTable dt1 = (DataTable)ViewState["Customers"];
                    dt1.Rows.Add
                    (
                        txt_Cheque_NO.Text.Trim(),
                        txt_Cheque_Date.Text.Trim(),
                        txt_Cheque_Value.Text.Trim(),
                        Cheque_Type_DropDownList.SelectedItem.Text.Trim(),
                        Cheque_Type_DropDownList.SelectedValue,
                        Bank_Cheque_Name_DropDownList.SelectedItem.Text.Trim(),
                        Bank_Cheque_Name_DropDownList.SelectedValue,
                        Tenan_Name_DropDownList.SelectedItem.Text.Trim(),
                        Tenan_Name_DropDownList.SelectedValue,
                        Cheque_Owner.Text.Trim(),
                        txt_beneficiary_person.Text.Trim()
                    );
                    ViewState["Customers"] = dt1;
                    this.BindGrid();
                    lbl_Worrnig_Cheque.Visible = false;
                }
                else
                {
                    lbl_Worrnig_Cheque.Visible = true;
                }
            }
           

            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
        }


        //***********************************************************************************************************************************
        protected void btn_Add_Transformation_Click(object sender, ImageClickEventArgs e)
        {
            
                DataTable dt1 = (DataTable)ViewState["transformation_Customers"];
                dt1.Rows.Add
                (
                    txt_transformation_No.Text.Trim(),

                    transformation_Bank_DropDownList.SelectedItem.Text.Trim(),
                    transformation_Bank_DropDownList.SelectedValue,

                    txt_transformation_Date.Text.Trim() ,

                    txt_transformation_Amount.Text.Trim() ,

                    Tenan_Name_DropDownList.SelectedItem.Text.Trim(),
                    Tenan_Name_DropDownList.SelectedValue


                );
                ViewState["transformation_Customers"] = dt1;
                this.transformation_BindGrid();


            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);

        }
        //************************************************************************************************************************************************************************

        protected void Add_Cash_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt1 = (DataTable)ViewState["Cash_Customers"];
            dt1.Rows.Add
            (
                txt_Cash_Amount.Text.Trim(),
                txt_Cash_Date.Text.Trim(),
                Tenan_Name_DropDownList.SelectedItem.Text.Trim(),
                Tenan_Name_DropDownList.SelectedValue


            );
            ViewState["Cash_Customers"] = dt1;
            this.Cash_BindGrid();


            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
        }

        //*********************************  conclusion of the contract ***********************************************************************************************************
        protected void btn_Add_Contract_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Half_Contact_Tempelet();
                string PROCEDURE="";
                string contract;
                string Rented_Item = "";
                string Contract_Id;
                string cheques;
                string transformation;
                string Cash;

                //  insert The Contract Information in Contract Tabel in DB
                if (Contract_Templet_DropDownList.SelectedValue == "1")
                {
                    PROCEDURE = "Add_Singel_Contract";
                    contract = "contract";
                    Rented_Item = Units_DropDownList.SelectedValue;
                    Contract_Id = "contract_Contract_Id";
                    cheques = "cheques";
                    transformation = "transformation_table";
                    Cash = "cash_amount";
                }
                else if (Contract_Templet_DropDownList.SelectedValue == "2")
                {
                    PROCEDURE = "Add_Multi_Contract";
                    contract = "building_contract";
                    Rented_Item = Building_Name_DropDownList.SelectedValue;
                    Contract_Id = "building_contract_Contract_Id";
                    cheques = "building_cheques";
                    transformation = "building_transformation_table";
                    Cash = "building_cash_amount";
                }
                else
                {
                    PROCEDURE = "Add_Multi_Contract";
                    contract = "building_contract";
                    Rented_Item = Half_Building_id.Text;
                    Contract_Id = "building_contract_Contract_Id";
                    cheques = "building_cheques";
                    transformation = "building_transformation_table";
                    Cash = "building_cash_amount";
                }

                _sqlCon.Open();
                MySqlCommand cmd = new MySqlCommand(PROCEDURE, _sqlCon);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@contract_type_Contract_Type_Id", Contract_Type_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@contract_template_Contract_template_Id", Contract_Templet_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@tenants_Tenants_ID", Tenan_Name_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@payment_type_payment_type_Id", Payment_Type_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@Rented_Item", Rented_Item);
                cmd.Parameters.AddWithValue("@users_user_ID", Session["user_ID"]);
                cmd.Parameters.AddWithValue("@New_ReNewed_Expaired", "1");
                cmd.Parameters.AddWithValue("@reason_for_rent_Reason_For_Rent_Id", Reason_For_Rent_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@Start_Free_Period", txt_FREE_PERIOD.Text);
                cmd.Parameters.AddWithValue("@Duration_free_period", txt_Duration_Of_The_Free_Period.Text);
                cmd.Parameters.AddWithValue("@Com_rep", Com_Rep_DropDownList.SelectedValue);
                cmd.Parameters.AddWithValue("@maintenance", maintenance_RadioButtonList.SelectedValue);
                cmd.Parameters.AddWithValue("@Rental_allowed_Or_Not_allowed", Rental_allowed_Or_Not_allowed_RadioButtonList.SelectedValue);
                cmd.Parameters.AddWithValue("@Paymen_Method", Paymen_Method_RadioButtonList.SelectedItem.Text.Trim());
                //Fill The Database with All Textbox Items
                cmd.Parameters.AddWithValue("@Contract_Details", txt_Contract_Details.Text);
                cmd.Parameters.AddWithValue("@Payment_Amount", txt_Payment_Amount.Text);
                cmd.Parameters.AddWithValue("@Payment_Amount_L", txt_Payment_Amount_L.Text);
                cmd.Parameters.AddWithValue("@Date_Of_Sgin", txt_Sign_Date.Text);
                cmd.Parameters.AddWithValue("@Start_Date", txt_Start_Date.Text);
                cmd.Parameters.AddWithValue("@End_Date", txt_End_Date.Text);
                if (Contract_Type_DropDownList.SelectedValue == "1")
                {
                    cmd.Parameters.AddWithValue("@Number_Of_Years", txt_No_Of_Months_Or_Years.Text);
                    cmd.Parameters.AddWithValue("@Number_Of_Mounth", "");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Number_Of_Years", "");
                    cmd.Parameters.AddWithValue("@Number_Of_Mounth", txt_No_Of_Months_Or_Years.Text);
                }

                cmd.ExecuteNonQuery();
                _sqlCon.Close();
                if (Session["Langues"].ToString() == "1") { lbl_Success_Add_New_Contract.Text = "Contract Added Successfully"; }
                else { lbl_Success_Add_New_Contract.Text = "تمت إضافة العقد بنجاح"; }

                //*****************  Modify the unit_status from vacant to rented  *******************
                if (Contract_Templet_DropDownList.SelectedValue == "1")
                {
                    string unit_Id = Units_DropDownList.SelectedValue;
                    string update_unit_status_Quary =
                        "UPDATE units SET unit_condition_Unit_Condition_Id=@unit_condition_Unit_Condition_Id WHERE Unit_ID=@ID ";
                    _sqlCon.Open();
                    using (MySqlCommand update_unit_status_Cmd = new MySqlCommand(update_unit_status_Quary, _sqlCon))
                    {
                        update_unit_status_Cmd.Parameters.AddWithValue("@ID", unit_Id);
                        update_unit_status_Cmd.Parameters.AddWithValue("@unit_condition_Unit_Condition_Id", "1");
                        update_unit_status_Cmd.ExecuteNonQuery();
                        _sqlCon.Close();
                    }
                }
                else if (Contract_Templet_DropDownList.SelectedValue == "2")
                {
                    string Building_Id = Building_Name_DropDownList.SelectedValue;
                    string update_unit_status_Quary =
                        "UPDATE units SET unit_condition_Unit_Condition_Id=@unit_condition_Unit_Condition_Id WHERE building_Building_Id=@ID ";
                    _sqlCon.Open();
                    using (MySqlCommand update_unit_status_Cmd = new MySqlCommand(update_unit_status_Quary, _sqlCon))
                    {
                        update_unit_status_Cmd.Parameters.AddWithValue("@ID", Building_Id);
                        update_unit_status_Cmd.Parameters.AddWithValue("@unit_condition_Unit_Condition_Id", "1");
                        update_unit_status_Cmd.ExecuteNonQuery();
                        _sqlCon.Close();
                    }
                }

                //    Get The Added Contract Id
                using (MySqlCommand Get_Contract_ID = new MySqlCommand("SELECT MAX(Contract_Id) AS LastInsertedID from " + contract + "", _sqlCon))
                {
                    _sqlCon.Open();
                    Get_Contract_ID.CommandType = CommandType.Text;
                    object Contract_ID = Get_Contract_ID.ExecuteScalar();
                    if (Contract_ID != null)
                    {
                        Contract_id.Text = Contract_ID.ToString();
                    }

                    _sqlCon.Close();
                }



                if (Paymen_Method_RadioButtonList.SelectedValue == "1")
                {
                    string Defult_Chque_Status = "غير محصل";
                    MySqlCommand com;
                    foreach (GridViewRow g1 in Cheque_GridView.Rows)
                    {
                        _sqlCon.Open();
                        com = new
                            MySqlCommand("INSERT INTO " + cheques + " (" +
                                         "Cheques_No," +
                                         "Cheques_Date  , " +
                                         "Cheques_Amount," +
                                         "Cheque_Owner," +
                                         "beneficiary_person," +
                                         "Cheques_Status," +
                                         "cheque_type_Cheque_Type_id," +
                                         "bank_Bank_Id  , " +
                                         "tenants_Tenants_ID  , " +
                                         "" + Contract_Id + ")  " +
                                         "VALUES(" +
                                         "'" + g1.Cells[1].Text + "' ," +
                                         "'" + g1.Cells[2].Text + "' ," +
                                         "'" + g1.Cells[3].Text + "' ," +
                                         "'" + g1.Cells[11].Text + "' ," +
                                         "'" + g1.Cells[12].Text + "' ," +
                                         "'" + Defult_Chque_Status + "' ," +
                                         " '" + Convert.ToInt32(g1.Cells[6].Text) + "', " +
                                         "'" + Convert.ToInt32(g1.Cells[8].Text) + "' , " +
                                         "'" + Convert.ToInt32(g1.Cells[10].Text) + "' ," +
                                         "'" + Convert.ToInt32(Contract_id.Text) + "')", _sqlCon);
                        com.ExecuteNonQuery();
                        _sqlCon.Close();
                    }
                }
                else if (Paymen_Method_RadioButtonList.SelectedValue == "2")
                {
                    string Defult_transformation_Status = "غير محصل";
                    MySqlCommand com;
                    foreach (GridViewRow g1 in transformation_GridView.Rows)
                    {
                        _sqlCon.Open();
                        com = new
                            MySqlCommand("INSERT INTO "+ transformation+ " (" +
                                         "transformation_No," +
                                         "transformation_Bank_ID," +
                                         "transformation_Date," +
                                         "Amount," +
                                         "Status," +
                                         "tenant_Id  , " +
                                         "Contract_Id)  " +
                                         "VALUES(" +
                                         "'" + g1.Cells[0].Text + "' ," +
                                         "'" + g1.Cells[2].Text + "' ," +
                                         "'" + g1.Cells[3].Text + "' ," +
                                         "'" + g1.Cells[4].Text + "' ," +
                                         "'" + Defult_transformation_Status + "' ," +
                                         "'" + g1.Cells[6].Text + "' ," +
                                         "'" + Contract_id.Text + "')", _sqlCon);
                        com.ExecuteNonQuery();
                        _sqlCon.Close();
                    }
                }
                else
                {
                    string Defult_Cash_Status = "غير محصل";
                    MySqlCommand com;
                    foreach (GridViewRow g1 in Cash_GridView.Rows)
                    {
                        _sqlCon.Open();
                        com = new
                            MySqlCommand("INSERT INTO " + Cash + " (" +
                                         "Cash_Amount," +
                                         "Cash_Date," +
                                         "Satuts," +
                                         "tenant_Id," +
                                         "Contract_Id)  " +
                                         "VALUES(" +
                                         "'" + g1.Cells[0].Text + "' ," +
                                         "'" + g1.Cells[1].Text + "' ," +
                                          "'" + Defult_Cash_Status + "' ," +
                                         "'" + g1.Cells[3].Text + "' ," +
                                         "'" + Contract_id.Text + "')", _sqlCon);
                        com.ExecuteNonQuery();
                        _sqlCon.Close();
                    }
                }


                //if (Contract_Templet_DropDownList.SelectedValue == "1") {Response.Redirect("Contract_Details.aspx?Id=" + Contract_id.Text);}
                //else {Response.Redirect("Building_Contract_Details.aspx?Id=" + Contract_id.Text); }
                
            }
        }

        protected void btn_Back_To_Contract_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contract_List.aspx");
        }

        //*****************************************************************************************************************
        //*****************************************************************************************************************

        //******************  Get The Building Of Selected Ownership ***************************************************
        protected void Ownership_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //    //Fill Buildings Name DropDownList

            if (Session["Langues"].ToString() == "1")
            {
                Helper.LoadDropDownList("SELECT * FROM building where Active ='1' and owner_ship_Owner_Ship_Id = '" + Ownership_Name_DropDownList.SelectedValue + "'",
                _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                Building_Name_DropDownList.Items.Insert(0, "...............");
            }
            else
            {
                Helper.LoadDropDownList("SELECT * FROM building where Active ='1' and owner_ship_Owner_Ship_Id = '" + Ownership_Name_DropDownList.SelectedValue + "'",
                _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                Building_Name_DropDownList.Items.Insert(0, "...............");
            }
                
        }

        //******************  Get The Units Of Selected Building ***************************************************
        protected void Building_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //    //Fill units Name DropDownList
            Helper.LoadDropDownList( "SELECT * FROM units where Half ='0' and building_Building_Id = '" + Building_Name_DropDownList.SelectedValue + "'", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
            Units_DropDownList.Items.Insert(0, "...............");
            if (Contract_Templet_DropDownList.SelectedValue == "3")
            {
                refreshdata();

            }
        }

        //******************  Sign_Date ***************************************************
        protected void Sign_Date_Calendar_SelectionChanged1(object sender, EventArgs e)
        {
            txt_Sign_Date.Text = Sign_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Sign_Date.Text != "")
            {
                Sign_Date_divCalendar.Visible = false;
                ImageButton1.Visible = false;
            }
        }

        protected void Date_Chosee_Click(object sender, EventArgs e)
        {
            Sign_Date_divCalendar.Visible = true;
            ImageButton1.Visible = true;
        }

        protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Sign_Date_divCalendar.Visible = false;
            ImageButton1.Visible = false;
        }

        //******************  Start_Date ***************************************************
        protected void Start_Date_Calendar_SelectionChanged2(object sender, EventArgs e)
        {
            txt_Start_Date.Text = Start_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Start_Date.Text != "")
            {
                Start_Date_Div.Visible = false;
                ImageButton2.Visible = false;
            }

            if (txt_No_Of_Months_Or_Years.Text != "")
            {
                if (Contract_Type_DropDownList.SelectedValue == "1")
                {
                    if (txt_Duration_Of_The_Free_Period.Text != "")
                    {
                        DateTime add_Months = (Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12)).AddDays(-1);
                        DateTime add_Months_With_Free_Period =  add_Months.AddMonths(Convert.ToInt32(txt_Duration_Of_The_Free_Period.Text));
                        txt_End_Date.Text = add_Months_With_Free_Period.ToString("dd/MM/yyyy");
                    }
                    else
                    {
                        DateTime add_Months = (Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12)).AddDays(-1);
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
                else
                {
                    DateTime add_Months = (Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text))).AddDays(-1);
                    txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                }
            }
        }

        protected void Start_Date_Chosee_Click(object sender, EventArgs e)
        {
            Start_Date_Div.Visible = true;
            ImageButton2.Visible = true;
        }

        protected void ImageButton2_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Start_Date_Div.Visible = false;
            ImageButton2.Visible = false;
        }

        //******************  End_Date ***************************************************
        protected void End_Date_Chosee_Click(object sender, EventArgs e)
        {
            End_Date_Div.Visible = true;
            ImageButton3.Visible = true;
        }

        protected void ImageButton3_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            End_Date_Div.Visible = false;
            ImageButton3.Visible = false;
        }

        protected void End_Date_Calendar_SelectionChanged1(object sender, EventArgs e)
        {
            txt_End_Date.Text = End_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_End_Date.Text != "")
            {
                End_Date_Div.Visible = false;
                ImageButton3.Visible = false;
            }
        }

        //************************ Cheque_ Date **********************************************************
        protected void btn_Cheque_Date_Chosee_Click(object sender, EventArgs e)
        {
            Cheque_Date_Div.Visible = true;
            Cheque_Date_ImageButton.Visible = true;
        }

        protected void Cheque_Date_Calendar_SelectionChanged(object sender, EventArgs e)
        {
            txt_Cheque_Date.Text = Cheque_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Cheque_Date.Text != "")
            {
                Cheque_Date_Div.Visible = false;
                Cheque_Date_ImageButton.Visible = false;
            }
        }

        protected void Cheque_Date_ImageButton_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Cheque_Date_Div.Visible = false;
            Cheque_Date_ImageButton.Visible = false;
        }

        //************************ Contract_Type_DropDownList **********************************************************
        protected void Contract_Type_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            div_No_Of_Months.Visible = true;
            div_Reason_For_Rent.Visible = true;
            if (Contract_Type_DropDownList.SelectedValue == "1")
            {
                if (Session["Langues"].ToString() == "1") { lbl_No_Of_Months_Or_Years.Text = "The Number Of Years"; } else { lbl_No_Of_Months_Or_Years.Text = "عدد السنوات"; }
                    
                txt_No_Of_Months_Or_Years.ReadOnly = false;
                txt_No_Of_Months_Or_Years.Text = "1";

                if (txt_Start_Date.Text != "")
                {
                    if (txt_No_Of_Months_Or_Years.Text != "")
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text)
                            .AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12);
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
            }
            else if (Contract_Type_DropDownList.SelectedValue == "2")
            {
                if (Session["Langues"].ToString() == "1") { lbl_No_Of_Months_Or_Years.Text = "The Number Of Months"; } else { lbl_No_Of_Months_Or_Years.Text = "عدد الأشهر"; }
                
                txt_No_Of_Months_Or_Years.Text = "6";
                txt_No_Of_Months_Or_Years.ReadOnly = true;

                if (txt_Start_Date.Text != "")
                {
                    if (txt_No_Of_Months_Or_Years.Text != "")
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(6);
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
            }
            else if (Contract_Type_DropDownList.SelectedValue == "3")
            {
                if (Session["Langues"].ToString() == "1") { lbl_No_Of_Months_Or_Years.Text = "The Number Of Months"; } else { lbl_No_Of_Months_Or_Years.Text = "عدد الأشهر"; }
                txt_No_Of_Months_Or_Years.Text = "3";
                txt_No_Of_Months_Or_Years.ReadOnly = true;

                if (txt_Start_Date.Text != "")
                {
                    if (txt_No_Of_Months_Or_Years.Text != "")
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(3);
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
            }
            else
            {
                lbl_No_Of_Months_Or_Years.Text = "عدد الأشهر";
                txt_No_Of_Months_Or_Years.ReadOnly = false;
                txt_No_Of_Months_Or_Years.Text = "1";

                if (txt_Start_Date.Text != "")
                {
                    if (txt_No_Of_Months_Or_Years.Text != "")
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text)
                            .AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text));
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
            }
        }

        protected void txt_No_Of_Months_Or_Years_TextChanged(object sender, EventArgs e)
        {
            if (txt_Start_Date.Text != "")
            {
                if (txt_No_Of_Months_Or_Years.Text != "")
                {
                    if (Contract_Type_DropDownList.SelectedValue == "1")
                    {
                        if (txt_Duration_Of_The_Free_Period.Text != "")
                        {
                            DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text)
                                .AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12);
                            DateTime add_Months_With_Free_Period =
                                add_Months.AddMonths(Convert.ToInt32(txt_Duration_Of_The_Free_Period.Text));
                            txt_End_Date.Text = add_Months_With_Free_Period.ToString("dd/MM/yyyy");
                        }
                        else
                        {
                            DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text)
                                .AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12);
                            txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                        }
                    }
                    else
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text)
                            .AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text));
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
            }
        }

        protected void Cheque_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string ChequeType;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    ChequeType = ((Label)e.Row.FindControl("lbl_cheque_type")).Text;
                    if (ChequeType == "شيك ضمان")
                    {
                        e.Row.ForeColor = System.Drawing.Color.Blue;
                        e.Row.BackColor = System.Drawing.Color.AliceBlue;
                    }
                }
                catch
                {
                    ChequeType = "";
                }
            }
        }

        protected void FREE_PERIOD_CheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (FREE_PERIOD_CheckBox.Checked == true)
            {
                FREE_PERIOD_Div.Visible = true;
            }
            else if (FREE_PERIOD_CheckBox.Checked == false)
            {
                FREE_PERIOD_Div.Visible = false;
            }
        }

        protected void Additional_Items_CheckBox_CheckedChanged(object sender, EventArgs e)
        {
            if (Additional_Items_CheckBox.Checked == true)
            {
                Contract_Details_Div.Visible = true;
            }
            else if (Additional_Items_CheckBox.Checked == false)
            {
                Contract_Details_Div.Visible = false;
            }
        }

        protected void txt_Duration_Of_The_Free_Period_TextChanged(object sender, EventArgs e)
        {
            txt_Start_Date.Text = Start_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Start_Date.Text != "")
            {
                Start_Date_Div.Visible = false;
                ImageButton2.Visible = false;
            }

            if (txt_No_Of_Months_Or_Years.Text != "")
            {
                if (Contract_Type_DropDownList.SelectedValue == "1")
                {
                    if (txt_Duration_Of_The_Free_Period.Text != "")
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12);
                        DateTime add_Months_With_Free_Period =
                            add_Months.AddMonths(Convert.ToInt32(txt_Duration_Of_The_Free_Period.Text));
                        txt_End_Date.Text = add_Months_With_Free_Period.ToString("dd/MM/yyyy");
                    }
                    else
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text)
                            .AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12);
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
                else
                {
                    if (txt_Duration_Of_The_Free_Period.Text != "")
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text)
                            .AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text));
                        DateTime add_Months_With_Free_Period =
                            add_Months.AddMonths(Convert.ToInt32(txt_Duration_Of_The_Free_Period.Text));
                        txt_End_Date.Text = add_Months_With_Free_Period.ToString("dd/MM/yyyy");
                    }
                    else
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text)
                            .AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text));
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
            }
        }

        protected void Tenan_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
           
                string Tenant_Id = Tenan_Name_DropDownList.SelectedValue;
                DataTable get_Tenant_Id_Dt = new DataTable();
                _sqlCon.Open();
                MySqlCommand get_Tenant_Id_Cmd =
                    new MySqlCommand("SELECT * FROM tenants where Tenants_ID='" + Tenant_Id + "'", _sqlCon);
                MySqlDataAdapter get_Tenant_Id_Da = new MySqlDataAdapter(get_Tenant_Id_Cmd);
                get_Tenant_Id_Da.Fill(get_Tenant_Id_Dt);
                if (get_Tenant_Id_Dt.Rows.Count > 0)
                {
                    if (get_Tenant_Id_Dt.Rows[0]["tenant_type_Tenant_Type_Id"].ToString() == "2")
                    {
                        Com_Rep_Div.Visible = true;
                        //    //Fill Com_Rep_DropDownList
                        if (Session["Langues"].ToString() == "1")
                        {
                            string Tenan_Name_ID = Tenan_Name_DropDownList.SelectedValue;
                            Helper.LoadDropDownList("SELECT * FROM company_representative where tenants_Tenants_ID ='" + Tenan_Name_ID + "'", _sqlCon, Com_Rep_DropDownList, "Com_rep_AR_Name", "Company_representative_Id");
                            Com_Rep_DropDownList.Items.Insert(0, "...............");
                        }
                        else
                        {
                            string Tenan_Name_ID = Tenan_Name_DropDownList.SelectedValue;
                            Helper.LoadDropDownList("SELECT * FROM company_representative where tenants_Tenants_ID ='" + Tenan_Name_ID + "'", _sqlCon, Com_Rep_DropDownList, "Com_rep_En_Name", "Company_representative_Id");
                            Com_Rep_DropDownList.Items.Insert(0, "...............");
                        }
                        
                    }
                    else
                    {
                        Com_Rep_Div.Visible = false;
                    }
                }
            
            
        }

        protected void Contract_Templet_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Contract_Templet_DropDownList.SelectedValue == "1")
            {
                Unit_Div.Visible = true;
            }
            else
            {
                Unit_Div.Visible = false;
            }
        }




        public void refreshdata()
        {
            //string getUnitQuari = "SELECT * FROM units where half ='0' and building_Building_Id = '" + Building_Name_DropDownList.SelectedValue+"'";
            string getUnitQuari = "SELECT U.* ,  UT.Unit_Arabic_Type " +
                                  "FROM units U left join unit_type UT on (U.unit_type_Unit_Type_Id = UT.Unit_Type_Id) " +
                                  "where half ='0' and building_Building_Id ='"+ Building_Name_DropDownList.SelectedValue + "'";
            MySqlCommand getUnitCmd = new MySqlCommand(getUnitQuari, _sqlCon);
            MySqlDataAdapter getUnitDt = new MySqlDataAdapter(getUnitCmd);
            getUnitCmd.Connection = _sqlCon;
            _sqlCon.Open();
            getUnitDt.SelectCommand = getUnitCmd;
            DataTable getUnitDataTable = new DataTable();
            getUnitDt.Fill(getUnitDataTable);
            Unit_GridView.DataSource = getUnitDataTable;
            Unit_GridView.DataBind();
            _sqlCon.Close();
        }

        protected void Half_Contact_Tempelet()
        {
            try
            {
                int count = 0;
                foreach (GridViewRow gvrow in Unit_GridView.Rows)
                {
                    CheckBox chk = (CheckBox)gvrow.FindControl("CheckBox1");
                    if (chk.Checked)
                    {
                        count++;
                    }
                    lblCheckItems.Text = Convert.ToString(count);
                }
                if (Contract_Templet_DropDownList.SelectedValue == "3")
                {
                    string building_condition_Building_Condition_Id = "0"; string building_type_Building_Type_Id = "0"; string Building_NO = "0";
                    DataTable getbulidingDt = new DataTable();
                    _sqlCon.Open();
                    MySqlCommand getbulidingCmd = new MySqlCommand("SELECT * FROM building WHERE Building_Id = '" + Building_Name_DropDownList.SelectedValue + "'", _sqlCon);
                    MySqlDataAdapter getbulidingDa = new MySqlDataAdapter(getbulidingCmd);
                    getbulidingDa.Fill(getbulidingDt);
                    if (getbulidingDt.Rows.Count > 0)
                    {
                        building_condition_Building_Condition_Id = getbulidingDt.Rows[0]["building_condition_Building_Condition_Id"].ToString();
                        building_type_Building_Type_Id = getbulidingDt.Rows[0]["building_type_Building_Type_Id"].ToString();
                        Building_NO = getbulidingDt.Rows[0]["Building_NO"].ToString();
                    }
                    _sqlCon.Close();




                    foreach (GridViewRow g1 in Unit_GridView.Rows)
                    {
                        var checkbox = g1.FindControl("CheckBox1") as CheckBox;
                        if (checkbox.Checked == true)
                        {
                            Label Unit_Arabic_Type = g1.FindControl("Unit_Arabic_Type") as Label;
                            XXXX.Text = Unit_Arabic_Type.Text;
                        }
                    }




                    string addHalf_BuildingQuary =
                        "Insert Into building " +
                        "(owner_ship_Owner_Ship_Id," +
                        "Half_Building_ID," +
                        "building_condition_Building_Condition_Id," +
                        "building_type_Building_Type_Id , " +
                        "Building_English_Name," +
                        "Building_Arabic_Name , " +
                        "Building_NO ," +
                        "Active ) " +
                        "VALUES(" +
                        "@owner_ship_Owner_Ship_Id," +
                        "@Half_Building_ID," +
                        "@building_condition_Building_Condition_Id," +
                        "@building_type_Building_Type_Id," +
                        "@Building_English_Name," +
                        "@Building_Arabic_Name , " +
                        "@Building_NO ," +
                        "@Active ) ";
                    _sqlCon.Open();
                    MySqlCommand addHalf_BuildingCmd = new MySqlCommand(addHalf_BuildingQuary, _sqlCon);
                    addHalf_BuildingCmd.Parameters.AddWithValue("@owner_ship_Owner_Ship_Id", Ownership_Name_DropDownList.SelectedValue);
                    addHalf_BuildingCmd.Parameters.AddWithValue("@building_condition_Building_Condition_Id", building_condition_Building_Condition_Id);
                    addHalf_BuildingCmd.Parameters.AddWithValue("@building_type_Building_Type_Id", building_type_Building_Type_Id);
                    addHalf_BuildingCmd.Parameters.AddWithValue("@Building_English_Name", "Half Building :" + Building_Name_DropDownList.SelectedItem.Text);
                    addHalf_BuildingCmd.Parameters.AddWithValue("@Building_Arabic_Name", lblCheckItems.Text + " "+ XXXX.Text+  "  في البناء : " +   Building_Name_DropDownList.SelectedItem.Text);
                    addHalf_BuildingCmd.Parameters.AddWithValue("@Building_NO", Building_NO);
                    addHalf_BuildingCmd.Parameters.AddWithValue("@Active", "0");
                    addHalf_BuildingCmd.Parameters.AddWithValue("@Half_Building_ID", Building_Name_DropDownList.SelectedValue);
                    
                    addHalf_BuildingCmd.ExecuteNonQuery();
                    _sqlCon.Close();
                }


                //    Get The Added Half_Building Id
                using (MySqlCommand Get_Half_Building_ID = new MySqlCommand("SELECT MAX(Building_Id) AS LastInsertedID from building", _sqlCon))
                {
                    _sqlCon.Open();
                    Get_Half_Building_ID.CommandType = CommandType.Text;
                    object Half_Building_ID = Get_Half_Building_ID.ExecuteScalar();
                    if (Half_Building_ID != null)
                    {
                        Half_Building_id.Text = Half_Building_ID.ToString();
                    }

                    _sqlCon.Close();
                }

                foreach (GridViewRow g1 in Unit_GridView.Rows)
                {
                    var checkbox = g1.FindControl("CheckBox1") as CheckBox;
                    if (checkbox.Checked == true)
                    {
                        var unit_condition_Unit_Condition_Id = g1.FindControl("unit_condition_Unit_Condition_Id") as Label;
                        var unit_detail_Unit_Detail_Id = g1.FindControl("unit_detail_Unit_Detail_Id") as Label;
                        var unit_type_Unit_Type_Id = g1.FindControl("unit_type_Unit_Type_Id") as Label;
                        var building_Building_Id = g1.FindControl("building_Building_Id") as Label;
                        var furniture_case_Furniture_case_Id = g1.FindControl("furniture_case_Furniture_case_Id") as Label;
                        var Unit_Number = g1.FindControl("Unit_Number") as Label;
                        var Floor_Number = g1.FindControl("Floor_Number") as Label;
                        var Unit_Space = g1.FindControl("Unit_Space") as Label;
                        var current_situation = g1.FindControl("current_situation") as Label;
                        var Oreedo_Number = g1.FindControl("Oreedo_Number") as Label;
                        var Electricityt_Number = g1.FindControl("Electricityt_Number") as Label;
                        var Water_Number = g1.FindControl("Water_Number") as Label;
                        var Active = g1.FindControl("Active") as Label;




                        if (Page.IsValid)
                        {
                            string addUnitQuery = "Insert Into units (" +
                                                    "unit_condition_Unit_Condition_Id  ,   " +
                                                    "unit_detail_Unit_Detail_Id  ,  " +
                                                    "unit_type_Unit_Type_Id , " +
                                                    "building_Building_Id , " +
                                                    "furniture_case_Furniture_case_Id , " +
                                                    "Unit_Number," +
                                                    "Floor_Number ," +
                                                    "Unit_Space, " +
                                                    "current_situation , " +
                                                    "Oreedo_Number," +
                                                    "Electricityt_Number , " +
                                                    "Water_Number , " +
                                                    "Active , " +
                                                    "Half , " +
                                                    "virtual_Value ) " +

                                                    " VALUES (" +
                                                    "@unit_condition_Unit_Condition_Id  ,   " +
                                                    "@unit_detail_Unit_Detail_Id  ,  " +
                                                    "@unit_type_Unit_Type_Id , " +
                                                    "@building_Building_Id , " +
                                                    "@furniture_case_Furniture_case_Id , " +
                                                    "@Unit_Number," +
                                                    "@Floor_Number ," +
                                                    "@Unit_Space, " +
                                                    "@current_situation , " +
                                                    "@Oreedo_Number," +
                                                    "@Electricityt_Number , " +
                                                    "@Water_Number , " +
                                                    "@Active , " +
                                                    "@Half , " +
                                                    "@virtual_Value ) ";

                            _sqlCon.Open();

                            using (MySqlCommand addUnitCmd = new MySqlCommand(addUnitQuery, _sqlCon))
                            {
                                addUnitCmd.Parameters.AddWithValue("@Unit_Number", Unit_Number.Text);
                                addUnitCmd.Parameters.AddWithValue("@Floor_Number", Floor_Number.Text);
                                addUnitCmd.Parameters.AddWithValue("@Unit_Space", Unit_Space.Text);
                                addUnitCmd.Parameters.AddWithValue("@current_situation", current_situation.Text);
                                addUnitCmd.Parameters.AddWithValue("@Oreedo_Number", Oreedo_Number.Text);
                                addUnitCmd.Parameters.AddWithValue("@Electricityt_Number", Electricityt_Number.Text);
                                addUnitCmd.Parameters.AddWithValue("@Water_Number", Water_Number.Text);
                                addUnitCmd.Parameters.AddWithValue("@virtual_Value", "");
                                addUnitCmd.Parameters.AddWithValue("@furniture_case_Furniture_case_Id", furniture_case_Furniture_case_Id.Text);
                                addUnitCmd.Parameters.AddWithValue("@unit_condition_Unit_Condition_Id", unit_condition_Unit_Condition_Id.Text);
                                addUnitCmd.Parameters.AddWithValue("@unit_detail_Unit_Detail_Id", unit_detail_Unit_Detail_Id.Text);
                                addUnitCmd.Parameters.AddWithValue("@unit_type_Unit_Type_Id", unit_type_Unit_Type_Id.Text);
                                addUnitCmd.Parameters.AddWithValue("@building_Building_Id", Half_Building_id.Text);
                                addUnitCmd.Parameters.AddWithValue("@Active", "0");
                                addUnitCmd.Parameters.AddWithValue("@Half", "1");

                                addUnitCmd.ExecuteNonQuery();
                                _sqlCon.Close();


                            }
                        }
                    }
                    
                }
        }
            catch
            {
                Response.Write( @"<script language='javascript'>alert('تأكد من أن معلومات الوحدات و البناء مكتملة في الماستر بانال')</script>");
            }
    _sqlCon.Close();
        }
        //here
        protected void Paymen_Method_RadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Paymen_Method_RadioButtonList.SelectedValue == "1") { Cheque_Div.Visible= true;   transformation_Div.Visible = false; Cash_div.Visible = false; }
            else if (Paymen_Method_RadioButtonList.SelectedValue == "2") { Cheque_Div.Visible = false; transformation_Div.Visible = true; Cash_div.Visible = false;  }
            else if (Paymen_Method_RadioButtonList.SelectedValue == "3") { Cheque_Div.Visible = false; transformation_Div.Visible = false; Cash_div.Visible = true;  }
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
        }











        //******************   transformation_Date ***************************************************
        protected void transformation_Date_Button_Click(object sender, EventArgs e)
        {
            transformation_Date_Div.Visible = true;
            ImageButton5.Visible = true;
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            transformation_Date_Div.Visible = false;
            ImageButton5.Visible = false;
        }

        protected void transformation_Date_Calendar_SelectionChanged(object sender, EventArgs e)
        {
            txt_transformation_Date.Text = transformation_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_transformation_Date.Text != "")
            {
                transformation_Date_Div.Visible = false;
                ImageButton5.Visible = false;
            }
        }
        //******************   Cash_Date ***************************************************
        protected void Cash_Date_Button_Click(object sender, EventArgs e)
        {
            Cash_Date_Div.Visible = true;
            ImageButton6.Visible = true;
        }

        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            Cash_Date_Div.Visible = false;
            ImageButton6.Visible = false;
        }

        protected void Cash_Date_Calendar_SelectionChanged(object sender, EventArgs e)
        {
            txt_Cash_Date.Text = Cash_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Cash_Date.Text != "")
            {
                Cash_Date_Div.Visible = false;
                ImageButton6.Visible = false;
            }
        }

        protected void Add_Tenant_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Add_Tenant.aspx?Id=1");
        }



























        //protected void Arciv_Half_Contact_Tempelet()
        //{
        //    try
        //    {
        //        int count = 0;
        //        foreach (GridViewRow gvrow in Unit_GridView.Rows)
        //        {
        //            CheckBox chk = (CheckBox)gvrow.FindControl("CheckBox1");
        //            if (chk.Checked)
        //            {
        //                count++;
        //            }
        //            lblCheckItems.Text = Convert.ToString(count);
        //        }
        //        if (Contract_Templet_DropDownList.SelectedValue == "3")
        //        {
        //            string building_condition_Building_Condition_Id = "0"; string building_type_Building_Type_Id = "0"; string Building_NO = "0";
        //            DataTable getbulidingDt = new DataTable();
        //            _sqlCon.Open();
        //            MySqlCommand getbulidingCmd = new MySqlCommand("SELECT * FROM building WHERE Building_Id = '" + Building_Name_DropDownList.SelectedValue + "'", _sqlCon);
        //            MySqlDataAdapter getbulidingDa = new MySqlDataAdapter(getbulidingCmd);
        //            getbulidingDa.Fill(getbulidingDt);
        //            if (getbulidingDt.Rows.Count > 0)
        //            {
        //                building_condition_Building_Condition_Id = getbulidingDt.Rows[0]["building_condition_Building_Condition_Id"].ToString();
        //                building_type_Building_Type_Id = getbulidingDt.Rows[0]["building_type_Building_Type_Id"].ToString();
        //                Building_NO = getbulidingDt.Rows[0]["Building_NO"].ToString();
        //            }
        //            _sqlCon.Close();


        //            foreach (GridViewRow g1 in Unit_GridView.Rows)
        //            {
        //                var checkbox = g1.FindControl("CheckBox1") as CheckBox;
        //                if (checkbox.Checked == true)
        //                {
        //                    Label Unit_Arabic_Type = g1.FindControl("Unit_Arabic_Type") as Label;
        //                    XXXX.Text = Unit_Arabic_Type.Text;
        //                }
        //            }

        //            string addHalf_BuildingQuary =
        //                "Insert Into arcive_building " +
        //                "(owner_ship_Owner_Ship_Id," +
        //                "Half_Building_ID," +
        //                "building_condition_Building_Condition_Id," +
        //                "building_type_Building_Type_Id , " +
        //                "Building_English_Name," +
        //                "Building_Arabic_Name , " +
        //                "Building_NO ," +
        //                "Active  ) " +
        //                "VALUES(" +
        //                "@owner_ship_Owner_Ship_Id," +
        //                "@Half_Building_ID," +
        //                "@building_condition_Building_Condition_Id," +
        //                "@building_type_Building_Type_Id," +
        //                "@Building_English_Name," +
        //                "@Building_Arabic_Name , " +
        //                "@Building_NO ," +
        //                "@Active ) ";
        //            _sqlCon.Open();
        //            MySqlCommand addHalf_BuildingCmd = new MySqlCommand(addHalf_BuildingQuary, _sqlCon);
        //            addHalf_BuildingCmd.Parameters.AddWithValue("@owner_ship_Owner_Ship_Id", Ownership_Name_DropDownList.SelectedValue);
        //            addHalf_BuildingCmd.Parameters.AddWithValue("@building_condition_Building_Condition_Id", building_condition_Building_Condition_Id);
        //            addHalf_BuildingCmd.Parameters.AddWithValue("@building_type_Building_Type_Id", building_type_Building_Type_Id);
        //            addHalf_BuildingCmd.Parameters.AddWithValue("@Building_English_Name", "Half Building :" + Building_Name_DropDownList.SelectedItem.Text);
        //            addHalf_BuildingCmd.Parameters.AddWithValue("@Building_Arabic_Name", lblCheckItems.Text + " " + XXXX.Text + "  في البناء : " + Building_Name_DropDownList.SelectedItem.Text);
        //            addHalf_BuildingCmd.Parameters.AddWithValue("@Building_NO", Building_NO);
        //            addHalf_BuildingCmd.Parameters.AddWithValue("@Active", "0");
        //            addHalf_BuildingCmd.Parameters.AddWithValue("@Half_Building_ID", Building_Name_DropDownList.SelectedValue);
        //            addHalf_BuildingCmd.ExecuteNonQuery();
        //            _sqlCon.Close();
        //        }


        //        //    Get The Added Half_Building Id
        //        using (MySqlCommand Get_Half_Building_ID = new MySqlCommand("SELECT MAX(Building_Id) AS LastInsertedID from building", _sqlCon))
        //        {
        //            _sqlCon.Open();
        //            Get_Half_Building_ID.CommandType = CommandType.Text;
        //            object Half_Building_ID = Get_Half_Building_ID.ExecuteScalar();
        //            if (Half_Building_ID != null)
        //            {
        //                Half_Building_id.Text = Half_Building_ID.ToString();
        //            }

        //            _sqlCon.Close();
        //        }

        //        foreach (GridViewRow g1 in Unit_GridView.Rows)
        //        {
        //            var checkbox = g1.FindControl("CheckBox1") as CheckBox;
        //            if (checkbox.Checked == true)
        //            {
        //                var unit_condition_Unit_Condition_Id = g1.FindControl("unit_condition_Unit_Condition_Id") as Label;
        //                var unit_detail_Unit_Detail_Id = g1.FindControl("unit_detail_Unit_Detail_Id") as Label;
        //                var unit_type_Unit_Type_Id = g1.FindControl("unit_type_Unit_Type_Id") as Label;
        //                var building_Building_Id = g1.FindControl("building_Building_Id") as Label;
        //                var furniture_case_Furniture_case_Id = g1.FindControl("furniture_case_Furniture_case_Id") as Label;
        //                var Unit_Number = g1.FindControl("Unit_Number") as Label;
        //                var Floor_Number = g1.FindControl("Floor_Number") as Label;
        //                var Unit_Space = g1.FindControl("Unit_Space") as Label;
        //                var current_situation = g1.FindControl("current_situation") as Label;
        //                var Oreedo_Number = g1.FindControl("Oreedo_Number") as Label;
        //                var Electricityt_Number = g1.FindControl("Electricityt_Number") as Label;
        //                var Water_Number = g1.FindControl("Water_Number") as Label;
        //                var Active = g1.FindControl("Active") as Label;




        //                if (Page.IsValid)
        //                {
        //                    string addUnitQuery = "Insert Into arcive_units (" +
        //                                            "unit_condition_Unit_Condition_Id  ,   " +
        //                                            "unit_detail_Unit_Detail_Id  ,  " +
        //                                            "unit_type_Unit_Type_Id , " +
        //                                            "building_Building_Id , " +
        //                                            "furniture_case_Furniture_case_Id , " +
        //                                            "Unit_Number," +
        //                                            "Floor_Number ," +
        //                                            "Unit_Space, " +
        //                                            "current_situation , " +
        //                                            "Oreedo_Number," +
        //                                            "Electricityt_Number , " +
        //                                            "Water_Number , " +
        //                                            "Active , " +
        //                                            "Half , " +
        //                                            "virtual_Value ) " +

        //                                            " VALUES (" +
        //                                            "@unit_condition_Unit_Condition_Id  ,   " +
        //                                            "@unit_detail_Unit_Detail_Id  ,  " +
        //                                            "@unit_type_Unit_Type_Id , " +
        //                                            "@building_Building_Id , " +
        //                                            "@furniture_case_Furniture_case_Id , " +
        //                                            "@Unit_Number," +
        //                                            "@Floor_Number ," +
        //                                            "@Unit_Space, " +
        //                                            "@current_situation , " +
        //                                            "@Oreedo_Number," +
        //                                            "@Electricityt_Number , " +
        //                                            "@Water_Number , " +
        //                                            "@Active , " +
        //                                            "@Half , " +
        //                                            "@virtual_Value ) ";

        //                    _sqlCon.Open();

        //                    using (MySqlCommand addUnitCmd = new MySqlCommand(addUnitQuery, _sqlCon))
        //                    {
        //                        addUnitCmd.Parameters.AddWithValue("@Unit_Number", Unit_Number.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@Floor_Number", Floor_Number.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@Unit_Space", Unit_Space.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@current_situation", current_situation.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@Oreedo_Number", Oreedo_Number.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@Electricityt_Number", Electricityt_Number.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@Water_Number", Water_Number.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@virtual_Value", "");
        //                        addUnitCmd.Parameters.AddWithValue("@furniture_case_Furniture_case_Id", furniture_case_Furniture_case_Id.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@unit_condition_Unit_Condition_Id", unit_condition_Unit_Condition_Id.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@unit_detail_Unit_Detail_Id", unit_detail_Unit_Detail_Id.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@unit_type_Unit_Type_Id", unit_type_Unit_Type_Id.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@building_Building_Id", Half_Building_id.Text);
        //                        addUnitCmd.Parameters.AddWithValue("@Active", "0");
        //                        addUnitCmd.Parameters.AddWithValue("@Half", "1");

        //                        addUnitCmd.ExecuteNonQuery();
        //                        _sqlCon.Close();


        //                    }
        //                }
        //            }

        //        }
        //    }
        //    catch
        //    {
        //        Response.Write(@"<script language='javascript'>alert('تأكد من أن معلومات الوحدات و البناء مكتملة في الماستر بانال')</script>");
        //    }
        //    _sqlCon.Close();
        //}

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
                    //    //Fill Tenant Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenan_Name_DropDownList, "Tenants_English_Name", "Tenants_ID");
                    Tenan_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Com_Rep_DropDownList
                    string Tenan_Name_ID = Tenan_Name_DropDownList.SelectedValue;
                    Helper.LoadDropDownList(
                        "SELECT * FROM company_representative where tenants_Tenants_ID ='" + Tenan_Name_ID + "'", _sqlCon, Com_Rep_DropDownList, "Com_rep_En_Name", "Company_representative_Id"); Com_Rep_DropDownList.Items.Insert(0, "إختر اسم الممثل ....");
                    Com_Rep_DropDownList.SelectedValue = "1";

                    //    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_En_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Units Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM units Where Half ='0'", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
                    Units_DropDownList.Items.Insert(0, "...............");

                    //    //Fill contract_type DropDownList
                    Helper.LoadDropDownList("SELECT * FROM contract_type", _sqlCon, Contract_Type_DropDownList, "Contract_English_Type", "Contract_Type_Id");
                    Contract_Type_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Contract templet DropDownList
                    Helper.LoadDropDownList("SELECT * FROM contract_template", _sqlCon, Contract_Templet_DropDownList, "Contract_English_template", "Contract_template_Id");
                    Contract_Templet_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Paymaent Type DropDownList
                    Helper.LoadDropDownList("SELECT * FROM payment_type", _sqlCon, Payment_Type_DropDownList, "payment_English_type", "payment_type_Id");
                    Payment_Type_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Cheque_type DropDownList
                    Helper.LoadDropDownList("SELECT * FROM cheque_type", _sqlCon, Cheque_Type_DropDownList, "Cheque_English_Type", "Cheque_Type_id");
                    Cheque_Type_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Bank_Cheque_Name_DropDownList DropDownList
                    Helper.LoadDropDownList("SELECT * FROM bank", _sqlCon, Bank_Cheque_Name_DropDownList, "Bank_English_Name", "Bank_Id");
                    Bank_Cheque_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Reason_For_Rent_DropDownList
                    Reason_For_Rent_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Tenant Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM transformation_bank", _sqlCon, transformation_Bank_DropDownList, "Bank_Name_En", "transformation_Bank_ID");
                    transformation_Bank_DropDownList.Items.Insert(0, "...............");


                    //Get Reason_For_Rent_DropDownList DropDownList
                    Reason_For_Rent_DropDownList.Items.Clear();
                    Reason_For_Rent_DropDownList.Items.Add(new ListItem("Family Accommodation", "1"));
                    Reason_For_Rent_DropDownList.Items.Add(new ListItem("Business", "2"));
                    Reason_For_Rent_DropDownList.Items.Add(new ListItem("Singles housing", "3"));
                    Reason_For_Rent_DropDownList.Items.Insert(0, "...............");

                    //Get maintenance_RadioButtonList DropDownList
                    maintenance_RadioButtonList.Items.Clear();
                    maintenance_RadioButtonList.Items.Add(new ListItem("On The Lessor", "1"));
                    maintenance_RadioButtonList.Items.Add(new ListItem("On TThe Tenant", "2"));

                    //Get Rental_allowed_Or_Not_allowed_RadioButtonList DropDownList
                    Rental_allowed_Or_Not_allowed_RadioButtonList.Items.Clear();
                    Rental_allowed_Or_Not_allowed_RadioButtonList.Items.Add(new ListItem("Allowed", "1"));
                    Rental_allowed_Or_Not_allowed_RadioButtonList.Items.Add(new ListItem("Not Allowed", "2"));


                    //Get Paymen_Method_RadioButtonList DropDownList
                    Paymen_Method_RadioButtonList.Items.Clear();
                    Paymen_Method_RadioButtonList.Items.Add(new ListItem("Cheques", "1"));
                    Paymen_Method_RadioButtonList.Items.Add(new ListItem("Transformation", "2"));
                    Paymen_Method_RadioButtonList.Items.Add(new ListItem("Cash", "3"));


                    lbl_titel_Add_New_Tenant.Text = Dt.Rows[0]["En"].ToString();
                    lbl_Contract_Type.Text = Dt.Rows[1]["EN"].ToString();
                    lbl_Tenan_Name.Text = Dt.Rows[2]["EN"].ToString();
                    lbl_Com_Rep.Text = Dt.Rows[3]["EN"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[4]["EN"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[5]["EN"].ToString();
                    lbl_Units.Text = Dt.Rows[6]["EN"].ToString();
                    lbl_Reason_For_Rent.Text = Dt.Rows[7]["EN"].ToString();
                    lbl_Contact_Period.Text = Dt.Rows[8]["EN"].ToString();
                    lbl_Sign_Date.Text = Dt.Rows[9]["EN"].ToString();
                    lbl_Start_Date.Text = Dt.Rows[10]["EN"].ToString();
                    lbl_End_Date.Text = Dt.Rows[11]["EN"].ToString();
                    lbl_Payment_Type.Text = Dt.Rows[12]["EN"].ToString();
                    lbl_Payment_Amount.Text = Dt.Rows[13]["EN"].ToString();
                    lbl_Payment_Amount_L.Text = Dt.Rows[14]["EN"].ToString();
                    lbl_maintenance.Text = Dt.Rows[15]["EN"].ToString();
                    lbl_Rental_allowed_Or_Not_allowed.Text = Dt.Rows[16]["EN"].ToString();
                    lbl_Contract_Details.Text = Dt.Rows[17]["EN"].ToString();
                    lbl_FREE_PERIOD.Text = Dt.Rows[18]["EN"].ToString();
                    lbl_Duration_Of_The_Free_Period.Text = Dt.Rows[19]["EN"].ToString();
                    lbl_Paymen_Method.Text = Dt.Rows[20]["EN"].ToString();
                    serial_CheckBox.Text = "Entering Serial Checks";
                    lbl_Worrnig_Cheque.Text = "Incomplete Check Information (Tenant name / Cheque type / Bank name)";
                    lbl_Cheque_NO.Text = Dt.Rows[22]["EN"].ToString();
                    lbl_Cheque_Date.Text = Dt.Rows[23]["EN"].ToString();
                    lbl_Cheque_Value.Text = Dt.Rows[24]["EN"].ToString();
                    lbl_Cheque_Type.Text = Dt.Rows[25]["EN"].ToString();
                    lbl_Bank_Name.Text = Dt.Rows[26]["EN"].ToString();
                    lbl_Owner.Text = Dt.Rows[27]["EN"].ToString();
                    lbl_beneficiary.Text = Dt.Rows[28]["EN"].ToString();
                    btn_Cheque_Date_Chosee.Text = Dt.Rows[21]["EN"].ToString();
                    lbl_Cash_Amount.Text = Dt.Rows[32]["EN"].ToString();
                    lbl_Cash_Date.Text = Dt.Rows[33]["EN"].ToString();
                    Cash_Date_Button.Text = Dt.Rows[21]["EN"].ToString();
                    lbl_transformation_No.Text = Dt.Rows[29]["EN"].ToString();
                    lbl_transformation_Bank.Text = Dt.Rows[26]["EN"].ToString();
                    lbl_transformation_Date.Text = Dt.Rows[30]["EN"].ToString();
                    btn_Add_Contract.Text = Dt.Rows[34]["EN"].ToString();
                    btn_Back_To_Contract_List.Text = Dt.Rows[35]["EN"].ToString();
                    FREE_PERIOD_CheckBox.Text = Dt.Rows[18]["EN"].ToString();
                    Additional_Items_CheckBox.Text = Dt.Rows[17]["EN"].ToString();
                    Sign_Date_Chosee.Text = Dt.Rows[21]["EN"].ToString();
                    Start_Date_Chosee.Text = Dt.Rows[21]["EN"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[21]["EN"].ToString();
                    lbl_transformation_Amount.Text = Dt.Rows[31]["EN"].ToString();
                    transformation_Date_Button.Text = Dt.Rows[21]["EN"].ToString();


                    Cheque_GridView.Columns[1].HeaderText = Dt.Rows[22]["EN"].ToString();
                    Cheque_GridView.Columns[2].HeaderText = Dt.Rows[23]["EN"].ToString();
                    Cheque_GridView.Columns[3].HeaderText = Dt.Rows[24]["EN"].ToString();
                    Cheque_GridView.Columns[4].HeaderText = Dt.Rows[25]["EN"].ToString();
                    Cheque_GridView.Columns[7].HeaderText = Dt.Rows[26]["EN"].ToString();
                    Cheque_GridView.Columns[9].HeaderText = Dt.Rows[2]["EN"].ToString();
                    Cheque_GridView.Columns[11].HeaderText = Dt.Rows[27]["EN"].ToString();
                    Cheque_GridView.Columns[12].HeaderText = Dt.Rows[28]["EN"].ToString();

                    transformation_GridView.Columns[0].HeaderText = Dt.Rows[29]["EN"].ToString();
                    transformation_GridView.Columns[1].HeaderText = Dt.Rows[26]["EN"].ToString();
                    transformation_GridView.Columns[3].HeaderText = Dt.Rows[30]["EN"].ToString();
                    transformation_GridView.Columns[4].HeaderText = Dt.Rows[31]["EN"].ToString();
                    transformation_GridView.Columns[5].HeaderText = Dt.Rows[2]["EN"].ToString();

                    Cash_GridView.Columns[0].HeaderText = Dt.Rows[32]["EN"].ToString();
                    Cash_GridView.Columns[1].HeaderText = Dt.Rows[33]["EN"].ToString();
                    Cash_GridView.Columns[2].HeaderText = Dt.Rows[2]["EN"].ToString();


                    Unit_GridView.Columns[4].HeaderText = Dt.Rows[36]["EN"].ToString();
                    Unit_GridView.Columns[7].HeaderText = Dt.Rows[37]["EN"].ToString();
                    Unit_GridView.Columns[8].HeaderText = Dt.Rows[38]["EN"].ToString();
                    Unit_GridView.Columns[9].HeaderText = Dt.Rows[39]["EN"].ToString();
                    Unit_GridView.Columns[10].HeaderText = Dt.Rows[40]["EN"].ToString();
                    Unit_GridView.Columns[11].HeaderText = Dt.Rows[41]["EN"].ToString();
                    Unit_GridView.Columns[12].HeaderText = Dt.Rows[42]["EN"].ToString();
                    Unit_GridView.Columns[13].HeaderText = Dt.Rows[43]["EN"].ToString();

                    Contract_Templet_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Tenan_Name_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Com_Rep_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Ownership_Name_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Building_Name_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Units_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Reason_For_Rent_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Contract_Type_RequiredFieldValidator.ErrorMessage = "* Required ";
                    No_Of_Months_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Payment_Type_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Payment_Amount_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Payment_Amount_L_RequiredFieldValidator.ErrorMessage = "* Required ";
                    maintenance_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Rental_allowed_Or_Not_allowed_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Paymen_Method_Req_Fiel_Val.ErrorMessage = "* Required ";
                    Contract_Details_RegularExpressionValidator.ErrorMessage = "Only letters";
                    Payment_Amount_RegularExpressionValidator.ErrorMessage = "Only Numbers";

                }
                else
                {
                    //    //Fill Tenant Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM tenants", _sqlCon, Tenan_Name_DropDownList, "Tenants_Arabic_Name", "Tenants_ID");
                    Tenan_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Com_Rep_DropDownList
                    string Tenan_Name_ID = Tenan_Name_DropDownList.SelectedValue;
                    Helper.LoadDropDownList(
                        "SELECT * FROM company_representative where tenants_Tenants_ID ='" + Tenan_Name_ID + "'", _sqlCon, Com_Rep_DropDownList, "Com_rep_En_Name", "Company_representative_Id"); Com_Rep_DropDownList.Items.Insert(0, "إختر اسم الممثل ....");
                    Com_Rep_DropDownList.SelectedValue = "1";

                    //    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_AR_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Units Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM units Where Half ='0'", _sqlCon, Units_DropDownList, "Unit_Number", "Unit_ID");
                    Units_DropDownList.Items.Insert(0, "...............");

                    //    //Fill contract_type DropDownList
                    Helper.LoadDropDownList("SELECT * FROM contract_type", _sqlCon, Contract_Type_DropDownList, "Contract_Arabic_Type", "Contract_Type_Id");
                    Contract_Type_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Contract templet DropDownList
                    Helper.LoadDropDownList("SELECT * FROM contract_template", _sqlCon, Contract_Templet_DropDownList, "Contract_Arabic_template", "Contract_template_Id");
                    Contract_Templet_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Paymaent Type DropDownList
                    Helper.LoadDropDownList("SELECT * FROM payment_type", _sqlCon, Payment_Type_DropDownList, "payment_Arabic_type", "payment_type_Id");
                    Payment_Type_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Cheque_type DropDownList
                    Helper.LoadDropDownList("SELECT * FROM cheque_type", _sqlCon, Cheque_Type_DropDownList, "Cheque_arabic_Type", "Cheque_Type_id");
                    Cheque_Type_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Bank_Cheque_Name_DropDownList DropDownList
                    Helper.LoadDropDownList("SELECT * FROM bank", _sqlCon, Bank_Cheque_Name_DropDownList, "Bank_Arabic_Name", "Bank_Id");
                    Bank_Cheque_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Reason_For_Rent_DropDownList
                    Reason_For_Rent_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Tenant Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM transformation_bank", _sqlCon, transformation_Bank_DropDownList, "Bank_Name", "transformation_Bank_ID");
                    transformation_Bank_DropDownList.Items.Insert(0, "...............");

                    //Get Reason_For_Rent_DropDownList DropDownList
                    Reason_For_Rent_DropDownList.Items.Clear();
                    Reason_For_Rent_DropDownList.Items.Add(new ListItem("سكن عائلي", "1"));
                    Reason_For_Rent_DropDownList.Items.Add(new ListItem("عمل تجاري", "2"));
                    Reason_For_Rent_DropDownList.Items.Add(new ListItem("سكن عزاب", "3"));
                    Reason_For_Rent_DropDownList.Items.Insert(0, "...............");

                    //Get maintenance_RadioButtonList DropDownList
                    maintenance_RadioButtonList.Items.Clear();
                    maintenance_RadioButtonList.Items.Add(new ListItem("على المؤجر", "1"));
                    maintenance_RadioButtonList.Items.Add(new ListItem("على المستأجر", "2"));

                    //Get maintenance_RadioButtonList DropDownList
                    Rental_allowed_Or_Not_allowed_RadioButtonList.Items.Clear();
                    Rental_allowed_Or_Not_allowed_RadioButtonList.Items.Add(new ListItem("يجوز", "1"));
                    Rental_allowed_Or_Not_allowed_RadioButtonList.Items.Add(new ListItem("لا يجوز", "2"));

                    //Get Paymen_Method_RadioButtonList DropDownList
                    Paymen_Method_RadioButtonList.Items.Clear();
                    Paymen_Method_RadioButtonList.Items.Add(new ListItem("شيكات", "1"));
                    Paymen_Method_RadioButtonList.Items.Add(new ListItem("تحويل", "2"));
                    Paymen_Method_RadioButtonList.Items.Add(new ListItem("نقداً", "3"));




                    lbl_titel_Add_New_Tenant.Text = Dt.Rows[0]["AR"].ToString();
                    lbl_Contract_Type.Text = Dt.Rows[1]["AR"].ToString();
                    lbl_Tenan_Name.Text = Dt.Rows[2]["AR"].ToString();
                    lbl_Com_Rep.Text = Dt.Rows[3]["AR"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[4]["AR"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[5]["AR"].ToString();
                    lbl_Units.Text = Dt.Rows[6]["AR"].ToString();
                    lbl_Reason_For_Rent.Text = Dt.Rows[7]["AR"].ToString();
                    lbl_Contact_Period.Text = Dt.Rows[8]["AR"].ToString();
                    lbl_Sign_Date.Text = Dt.Rows[9]["AR"].ToString();
                    lbl_Start_Date.Text = Dt.Rows[10]["AR"].ToString();
                    lbl_End_Date.Text = Dt.Rows[11]["AR"].ToString();
                    lbl_Payment_Type.Text = Dt.Rows[12]["AR"].ToString();
                    lbl_Payment_Amount.Text = Dt.Rows[13]["AR"].ToString();
                    lbl_Payment_Amount_L.Text = Dt.Rows[14]["AR"].ToString();
                    lbl_maintenance.Text = Dt.Rows[15]["AR"].ToString();
                    lbl_Rental_allowed_Or_Not_allowed.Text = Dt.Rows[16]["AR"].ToString();
                    lbl_Contract_Details.Text = Dt.Rows[17]["AR"].ToString();
                    lbl_FREE_PERIOD.Text = Dt.Rows[18]["AR"].ToString();
                    lbl_Duration_Of_The_Free_Period.Text = Dt.Rows[19]["AR"].ToString();
                    lbl_Paymen_Method.Text = Dt.Rows[20]["AR"].ToString();
                    serial_CheckBox.Text = "إدخال شيكات متسلسلة ";
                    lbl_Worrnig_Cheque.Text = "معلومات الشيك غير كاملة ( اسم المستأجر  /  نوع الشيك  /  اسم البنك)";
                    lbl_Cheque_NO.Text = Dt.Rows[22]["AR"].ToString();
                    lbl_Cheque_Date.Text = Dt.Rows[23]["AR"].ToString();
                    lbl_Cheque_Value.Text = Dt.Rows[24]["AR"].ToString();
                    lbl_Cheque_Type.Text = Dt.Rows[25]["AR"].ToString();
                    lbl_Bank_Name.Text = Dt.Rows[26]["AR"].ToString();
                    lbl_Owner.Text = Dt.Rows[27]["AR"].ToString();
                    lbl_beneficiary.Text = Dt.Rows[28]["AR"].ToString();
                    btn_Cheque_Date_Chosee.Text = Dt.Rows[21]["AR"].ToString();
                    lbl_Cash_Amount.Text = Dt.Rows[32]["AR"].ToString();
                    lbl_Cash_Date.Text = Dt.Rows[33]["AR"].ToString();
                    Cash_Date_Button.Text = Dt.Rows[21]["AR"].ToString();
                    lbl_transformation_No.Text = Dt.Rows[29]["AR"].ToString();
                    lbl_transformation_Bank.Text = Dt.Rows[26]["AR"].ToString();
                    lbl_transformation_Date.Text = Dt.Rows[30]["AR"].ToString();
                    lbl_transformation_Amount.Text = Dt.Rows[31]["AR"].ToString();
                    transformation_Date_Button.Text = Dt.Rows[21]["AR"].ToString();
                    FREE_PERIOD_CheckBox.Text = Dt.Rows[18]["AR"].ToString();
                    Additional_Items_CheckBox.Text = Dt.Rows[17]["AR"].ToString();
                    Sign_Date_Chosee.Text = Dt.Rows[21]["AR"].ToString();
                    Start_Date_Chosee.Text = Dt.Rows[21]["AR"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[21]["AR"].ToString();
                    btn_Add_Contract.Text = Dt.Rows[34]["AR"].ToString();
                    btn_Back_To_Contract_List.Text = Dt.Rows[35]["AR"].ToString();

                    Cheque_GridView.Columns[1].HeaderText = Dt.Rows[22]["AR"].ToString();
                    Cheque_GridView.Columns[2].HeaderText = Dt.Rows[23]["AR"].ToString();
                    Cheque_GridView.Columns[3].HeaderText = Dt.Rows[24]["AR"].ToString();
                    Cheque_GridView.Columns[4].HeaderText = Dt.Rows[25]["AR"].ToString();
                    Cheque_GridView.Columns[7].HeaderText = Dt.Rows[26]["AR"].ToString();
                    Cheque_GridView.Columns[9].HeaderText = Dt.Rows[2]["AR"].ToString();
                    Cheque_GridView.Columns[11].HeaderText = Dt.Rows[27]["AR"].ToString();
                    Cheque_GridView.Columns[12].HeaderText = Dt.Rows[28]["AR"].ToString();

                    transformation_GridView.Columns[0].HeaderText = Dt.Rows[29]["AR"].ToString();
                    transformation_GridView.Columns[1].HeaderText = Dt.Rows[26]["AR"].ToString();
                    transformation_GridView.Columns[3].HeaderText = Dt.Rows[30]["AR"].ToString();
                    transformation_GridView.Columns[4].HeaderText = Dt.Rows[31]["AR"].ToString();
                    transformation_GridView.Columns[5].HeaderText = Dt.Rows[2]["AR"].ToString();

                    Cash_GridView.Columns[0].HeaderText = Dt.Rows[32]["AR"].ToString();
                    Cash_GridView.Columns[1].HeaderText = Dt.Rows[33]["AR"].ToString();
                    Cash_GridView.Columns[2].HeaderText = Dt.Rows[2]["AR"].ToString();


                    Unit_GridView.Columns[4].HeaderText = Dt.Rows[36]["AR"].ToString();
                    Unit_GridView.Columns[7].HeaderText = Dt.Rows[37]["AR"].ToString();
                    Unit_GridView.Columns[8].HeaderText = Dt.Rows[38]["AR"].ToString();
                    Unit_GridView.Columns[9].HeaderText = Dt.Rows[39]["AR"].ToString();
                    Unit_GridView.Columns[10].HeaderText = Dt.Rows[40]["AR"].ToString();
                    Unit_GridView.Columns[11].HeaderText = Dt.Rows[41]["AR"].ToString();
                    Unit_GridView.Columns[12].HeaderText = Dt.Rows[42]["AR"].ToString();
                    Unit_GridView.Columns[13].HeaderText = Dt.Rows[43]["AR"].ToString();


                    Contract_Templet_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Tenan_Name_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Com_Rep_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Ownership_Name_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Building_Name_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Units_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Reason_For_Rent_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Contract_Type_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    No_Of_Months_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Payment_Type_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Payment_Amount_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Payment_Amount_L_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    maintenance_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Rental_allowed_Or_Not_allowed_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Paymen_Method_Req_Fiel_Val.ErrorMessage = "*مطلوب ";
                    Contract_Details_RegularExpressionValidator.ErrorMessage = "أحرف فقط";
                    Payment_Amount_RegularExpressionValidator.ErrorMessage = "أرقام فقط";

                }
            }
            _sqlCon.Close();
        }

    }
}