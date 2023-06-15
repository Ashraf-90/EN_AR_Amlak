using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Edit_Building_Contract : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Contracting", 0, "R");
                Utilities.Roles.Singel_Page_permission(_sqlCon, Session["Role"].ToString(), "Contracting", 2, "E");
                Utilities.Roles.Delete_permission_With_Reason(_sqlCon, Session["Role"].ToString(), "Contracting", Delete_Contract, Reason_Div);
            }
            catch { Response.Redirect("Log_In.aspx"); }
            
            if (!this.IsPostBack)
            {
                language();
                //************************ get The Contract Information **************************************************

                string Contract_Id = Request.QueryString["Id"];
                DataTable get_Contract_Dt = new DataTable();
                _sqlCon.Open();
                MySqlCommand get_Contract_Cmd = new MySqlCommand("SELECT * FROM building_contract WHERE Contract_Id = @ID", _sqlCon);
                MySqlDataAdapter get_Contract_Da = new MySqlDataAdapter(get_Contract_Cmd);
                get_Contract_Cmd.Parameters.AddWithValue("@ID", Contract_Id);
                get_Contract_Da.Fill(get_Contract_Dt);
                if (get_Contract_Dt.Rows.Count > 0)
                {
                    if (get_Contract_Dt.Rows[0]["Com_rep"].ToString() == "1")
                    {
                        Com_Rep_Div.Visible = false;
                    }
                    else
                    {
                        Com_Rep_Div.Visible = true;
                    }

                    if (get_Contract_Dt.Rows[0]["contract_type_Contract_Type_Id"].ToString() == "1")
                    {
                        if (Session["Langues"].ToString() == "1") { lbl_No_Of_Months_Or_Years.Text = "The Number Of Years"; } else { lbl_No_Of_Months_Or_Years.Text = "عدد السنوات"; }
                        txt_No_Of_Months_Or_Years.ReadOnly = true;
                        txt_No_Of_Months_Or_Years.Text = get_Contract_Dt.Rows[0]["Number_Of_Years"].ToString();
                    }
                    else if (get_Contract_Dt.Rows[0]["contract_type_Contract_Type_Id"].ToString() == "2" || get_Contract_Dt.Rows[0]["contract_type_Contract_Type_Id"].ToString() == "3")
                    {
                        if (Session["Langues"].ToString() == "1") { lbl_No_Of_Months_Or_Years.Text = "The Number Of Months"; } else { lbl_No_Of_Months_Or_Years.Text = "عدد الأشهر"; }
                        txt_No_Of_Months_Or_Years.ReadOnly = true;
                        txt_No_Of_Months_Or_Years.Text = get_Contract_Dt.Rows[0]["Number_Of_Mounth"].ToString();
                    }
                    else
                    {
                        if (Session["Langues"].ToString() == "1") { lbl_No_Of_Months_Or_Years.Text = "The Number Of Months"; } else { lbl_No_Of_Months_Or_Years.Text = "عدد الأشهر"; }
                        txt_No_Of_Months_Or_Years.Text = get_Contract_Dt.Rows[0]["Number_Of_Mounth"].ToString();
                    }
                    txt_FREE_PERIOD.Text = get_Contract_Dt.Rows[0]["Start_Free_Period"].ToString();
                    txt_Duration_Of_The_Free_Period.Text = get_Contract_Dt.Rows[0]["Duration_free_period"].ToString();
                    Reason_For_Rent_DropDownList.SelectedValue = get_Contract_Dt.Rows[0]["reason_for_rent_Reason_For_Rent_Id"].ToString();
                    txt_Payment_Amount.Text = get_Contract_Dt.Rows[0]["Payment_Amount"].ToString();
                    txt_Payment_Amount_L.Text = get_Contract_Dt.Rows[0]["Payment_Amount_L"].ToString();
                    txt_Sign_Date.Text = get_Contract_Dt.Rows[0]["Date_Of_Sgin"].ToString();
                    txt_Start_Date.Text = get_Contract_Dt.Rows[0]["Start_Date"].ToString();
                    txt_End_Date.Text = get_Contract_Dt.Rows[0]["End_Date"].ToString();
                    txt_Contract_Details.Text = get_Contract_Dt.Rows[0]["Contract_Details"].ToString();
                    Tenan_Name_DropDownList.SelectedValue = get_Contract_Dt.Rows[0]["tenants_Tenants_ID"].ToString();



                    Real_Contract_FileName.Text = get_Contract_Dt.Rows[0]["Real_Contract_FileName"].ToString();
                    Real_Contract_Path.Text = get_Contract_Dt.Rows[0]["Real_Contract_Path"].ToString();


                    if (get_Contract_Dt.Rows[0]["Real_Contract_FileName"].ToString() != "") { Real_Contract_Div.Visible = true; }
                    else { Real_Contract_Div.Visible = false; }

                    lbl_Link_Real_Contract.Text = get_Contract_Dt.Rows[0]["Real_Contract_FileName"].ToString();
                    Link_Real_Contract.HRef = get_Contract_Dt.Rows[0]["Real_Contract_Path"].ToString();
                    Link_Real_Contract.Target = "_blank";




                    

                    if (Session["Langues"].ToString() == "1") 
                    {
                        Helper.LoadDropDownList("SELECT * FROM company_representative where tenants_Tenants_ID ='" + Tenan_Name_DropDownList.SelectedValue + "'", _sqlCon, Com_Rep_DropDownList, "Com_rep_Ar_Name", "Company_representative_Id");
                        Com_Rep_DropDownList.Items.Insert(0, "...............");
                    }
                    else
                    {
                        Helper.LoadDropDownList("SELECT * FROM company_representative where tenants_Tenants_ID ='" + Tenan_Name_DropDownList.SelectedValue + "'", _sqlCon, Com_Rep_DropDownList, "Com_rep_En_Name", "Company_representative_Id");
                        Com_Rep_DropDownList.Items.Insert(0, "...............");
                    }
                        Com_Rep_DropDownList.SelectedValue = get_Contract_Dt.Rows[0]["Com_rep"].ToString();

                    Contarct_tenant_Name.Text = Tenan_Name_DropDownList.SelectedItem.Text;
                    maintenance_RadioButtonList.SelectedValue = get_Contract_Dt.Rows[0]["maintenance"].ToString();
                    Rental_allowed_Or_Not_allowed_RadioButtonList.SelectedValue = get_Contract_Dt.Rows[0]["Rental_allowed_Or_Not_allowed"].ToString();

                    if (get_Contract_Dt.Rows[0]["Paymen_Method"].ToString() == "شيك" || get_Contract_Dt.Rows[0]["Paymen_Method"].ToString() == "Cheque")
                    {
                        Paymen_Method_RadioButtonList.SelectedValue = "1"; Cheque_Div.Visible = true; Cash_div.Visible = false; transformation_Div.Visible = false;
                        if (Session["Langues"].ToString() == "1") { lbl_Tenant_Cheque.Text = "Cheques Of Tenant :" + Tenan_Name_DropDownList.SelectedItem.Text; }
                        else { lbl_Tenant_Cheque.Text = "شيكات المستأجر :" + Tenan_Name_DropDownList.SelectedItem.Text; }
                    }
                    else if (get_Contract_Dt.Rows[0]["Paymen_Method"].ToString() == "تحويل" || get_Contract_Dt.Rows[0]["Paymen_Method"].ToString() == "Transformation")
                    {
                        Paymen_Method_RadioButtonList.SelectedValue = "2"; Cheque_Div.Visible = false; Cash_div.Visible = false; transformation_Div.Visible = true;
                        if (Session["Langues"].ToString() == "1") { lbl_Tenant_Cheque.Text = "Transformations of Tenant :" + Tenan_Name_DropDownList.SelectedItem.Text; }
                        else { lbl_Tenant_Cheque.Text = "حوالات المستأجر :" + Tenan_Name_DropDownList.SelectedItem.Text; }
                    }
                    else if (get_Contract_Dt.Rows[0]["Paymen_Method"].ToString() == "نقداً" || get_Contract_Dt.Rows[0]["Paymen_Method"].ToString() == "Cash")
                    {

                        Paymen_Method_RadioButtonList.SelectedValue = "3"; Cheque_Div.Visible = false; Cash_div.Visible = true; transformation_Div.Visible = false;
                        if (Session["Langues"].ToString() == "1") { lbl_Tenant_Cheque.Text = "Cash of Tenant :" + Tenan_Name_DropDownList.SelectedItem.Text; }
                        else { lbl_Tenant_Cheque.Text = "دفعات المستأجر :" + Tenan_Name_DropDownList.SelectedItem.Text; }
                    }

                    Building_Name_DropDownList.SelectedValue = get_Contract_Dt.Rows[0]["building_Building_Id"].ToString();
                    Contract_Type_DropDownList.SelectedValue = get_Contract_Dt.Rows[0]["contract_type_Contract_Type_Id"].ToString();
                    Contract_Templet_DropDownList.SelectedValue = get_Contract_Dt.Rows[0]["contract_template_Contract_template_Id"].ToString();
                    // Payment_Frquancy_DropDownList.SelectedValue = get_Contract_Dt.Rows[0]["payment_frequency_Payment_Frequency_Id"].ToString();
                    Payment_Type_DropDownList.SelectedValue = get_Contract_Dt.Rows[0]["payment_type_payment_type_Id"].ToString();
                }
                _sqlCon.Close();

                //using (MySqlCommand get_Contract_ownership_drowpdownlist_Cmd = new MySqlCommand("Edit_B_Contract_Ownership_Unit_dropdownlist", _sqlCon))
                //{
                //    _sqlCon.Open();
                //    get_Contract_ownership_drowpdownlist_Cmd.CommandType = CommandType.StoredProcedure;
                //    get_Contract_ownership_drowpdownlist_Cmd.Parameters.AddWithValue("@Id", Building_Name_DropDownList.SelectedValue);
                //    using (MySqlDataAdapter get_Contract_ownership_drowpdownlist_Da = new MySqlDataAdapter(get_Contract_ownership_drowpdownlist_Cmd))
                //    {
                //        DataTable get_Contract_ownership_drowpdownlist_Dt = new DataTable();
                //        get_Contract_ownership_drowpdownlist_Da.Fill(get_Contract_ownership_drowpdownlist_Dt);

                //        Ownership_Name_DropDownList.SelectedValue = get_Contract_ownership_drowpdownlist_Dt.Rows[0]["Owner_Ship_Id"].ToString();
                //    }
                //    _sqlCon.Close();
                //}
                this.BindGrid_Contract_Cheque_List();
                BindGrid_transportation_List();
                BindGrid_Cash_List();

                if (Contract_Templet_DropDownList.SelectedValue == "3")
                {
                    refreshdata();
                    Building_Name_DropDownList.Enabled=false;
                    if (Session["Langues"].ToString() == "1") { Half_Contract_Worrning.Text = "It is not possible to modify the building in the case of multiple contracts"; } 
                    else { Half_Contract_Worrning.Text = "لا يمكن تعديل البناء بحالة العقود نص المجملة "; }
                        

                }
            }
        }


        //**************************** Main Edit Contract Functions *************************************
        protected void btn_Add_Contract_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string contractId = Request.QueryString["Id"];
                string updateContractQuary = "UPDATE building_contract SET " +
                                               "users_user_ID=@users_user_ID ," +
                                               "tenants_Tenants_ID=@tenants_Tenants_ID, " +
                                               "Com_rep=@Com_rep, " +
                                               "building_Building_Id=@building_Building_Id , " +
                                               "contract_type_Contract_Type_Id=@contract_type_Contract_Type_Id, " +
                                               "contract_template_Contract_template_Id=@contract_template_Contract_template_Id , " +
                                               "payment_type_payment_type_Id=@payment_type_payment_type_Id , " +
                                               "reason_for_rent_Reason_For_Rent_Id=@reason_for_rent_Reason_For_Rent_Id , " +
                                               "Number_Of_Mounth=@Number_Of_Mounth , " +
                                               "Number_Of_Years=@Number_Of_Years , " +
                                               "Payment_Amount=@Payment_Amount ," +
                                               "Payment_Amount_L=@Payment_Amount_L ," +
                                               "maintenance=@maintenance ," +
                                               "Rental_allowed_Or_Not_allowed=@Rental_allowed_Or_Not_allowed ," +
                                               "Paymen_Method=@Paymen_Method ," +

                                               "Real_Contract_FileName=@Real_Contract_FileName ," +
                                               "Real_Contract_Path=@Real_Contract_Path ," +

                                               "Date_Of_Sgin=@Date_Of_Sgin  ," +
                                               "Start_Date=@Start_Date ," +
                                               "End_Date=@End_Date ," +
                                               "Start_Free_Period=@Start_Free_Period ," +
                                               "Duration_free_period=@Duration_free_period ," +

                                               "maintenance=@maintenance ," +
                                               "Rental_allowed_Or_Not_allowed=@Rental_allowed_Or_Not_allowed ," +

                                               "Contract_Details=@Contract_Details " +
                                               "WHERE Contract_Id=@ID ";
                _sqlCon.Open();
                using (MySqlCommand UpdateContractCmd = new MySqlCommand(updateContractQuary, _sqlCon))
                {
                    UpdateContractCmd.Parameters.AddWithValue("@ID", contractId);
                    //Fill The Database with All DropDownLists Items
                    UpdateContractCmd.Parameters.AddWithValue("@contract_type_Contract_Type_Id", Contract_Type_DropDownList.SelectedValue);
                    UpdateContractCmd.Parameters.AddWithValue("@contract_template_Contract_template_Id", Contract_Templet_DropDownList.SelectedValue);
                    //UpdateContractCmd.Parameters.AddWithValue("@payment_frequency_Payment_Frequency_Id", Payment_Frquancy_DropDownList.SelectedValue);
                    UpdateContractCmd.Parameters.AddWithValue("@tenants_Tenants_ID", Tenan_Name_DropDownList.SelectedValue);
                    UpdateContractCmd.Parameters.AddWithValue("@Com_rep", Com_Rep_DropDownList.SelectedValue);
                    UpdateContractCmd.Parameters.AddWithValue("@payment_type_payment_type_Id", Payment_Type_DropDownList.SelectedValue);
                    UpdateContractCmd.Parameters.AddWithValue("@building_Building_Id", Building_Name_DropDownList.SelectedValue);
                    UpdateContractCmd.Parameters.AddWithValue("@users_user_ID", Session["user_ID"]);
                    //Fill The Database with All Textbox Items
                    UpdateContractCmd.Parameters.AddWithValue("@Contract_Details", txt_Contract_Details.Text);
                    UpdateContractCmd.Parameters.AddWithValue("@Payment_Amount", txt_Payment_Amount.Text);
                    UpdateContractCmd.Parameters.AddWithValue("@Payment_Amount_L", txt_Payment_Amount_L.Text);
                    UpdateContractCmd.Parameters.AddWithValue("@maintenance", maintenance_RadioButtonList.SelectedValue);
                    UpdateContractCmd.Parameters.AddWithValue("@Rental_allowed_Or_Not_allowed", Rental_allowed_Or_Not_allowed_RadioButtonList.SelectedValue);
                    UpdateContractCmd.Parameters.AddWithValue("@Paymen_Method", Paymen_Method_RadioButtonList.SelectedItem.Text.Trim());
                    UpdateContractCmd.Parameters.AddWithValue("@Date_Of_Sgin", txt_Sign_Date.Text);
                    UpdateContractCmd.Parameters.AddWithValue("@Start_Date", txt_Start_Date.Text);
                    UpdateContractCmd.Parameters.AddWithValue("@End_Date", txt_End_Date.Text);

                    UpdateContractCmd.Parameters.AddWithValue("@reason_for_rent_Reason_For_Rent_Id", Reason_For_Rent_DropDownList.SelectedValue);
                    UpdateContractCmd.Parameters.AddWithValue("@Start_Free_Period", txt_FREE_PERIOD.Text);
                    UpdateContractCmd.Parameters.AddWithValue("@Duration_free_period", txt_Duration_Of_The_Free_Period.Text);

                    if (Contract_Type_DropDownList.SelectedValue == "1")
                    {
                        UpdateContractCmd.Parameters.AddWithValue("@Number_Of_Years", txt_No_Of_Months_Or_Years.Text);
                        UpdateContractCmd.Parameters.AddWithValue("@Number_Of_Mounth", "");
                    }
                    else
                    {
                        UpdateContractCmd.Parameters.AddWithValue("@Number_Of_Years", "");
                        UpdateContractCmd.Parameters.AddWithValue("@Number_Of_Mounth", txt_No_Of_Months_Or_Years.Text);
                    }



                    if (Real_Contract_FileUpload.HasFile)
                    {
                        string fileName1 = Path.GetFileName(Real_Contract_FileUpload.PostedFile.FileName);
                        Real_Contract_FileUpload.PostedFile.SaveAs(Server.MapPath("/English/Main_Application/Real_Contract/") + fileName1);
                        UpdateContractCmd.Parameters.AddWithValue("@Real_Contract_FileName", fileName1);
                        UpdateContractCmd.Parameters.AddWithValue("@Real_Contract_Path", "/English/Main_Application/Real_Contract/" + fileName1);
                    }
                    else
                    {
                        UpdateContractCmd.Parameters.AddWithValue("@Real_Contract_FileName", Real_Contract_FileName.Text);
                        UpdateContractCmd.Parameters.AddWithValue("@Real_Contract_Path", Real_Contract_Path.Text);
                    }
                    UpdateContractCmd.ExecuteNonQuery();
                    _sqlCon.Close();
                }

                lbl_Success_Add_New_Contract.Text = "تم التعديل بنجاح";
                Response.Redirect("Contract_List.aspx");
            }
        }
        protected void btn_Back_To_Contract_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contract_List.aspx");
        }
        protected void Delete_Contract_Click(object sender, EventArgs e)
        {
            string ContractId = Request.QueryString["ID"];

            _sqlCon.Open();
            DataTable getTransformationDt = new DataTable();
            MySqlCommand getTransformationCmd = new MySqlCommand("SELECT Contract_Id FROM building_transformation_table WHERE Contract_Id = @ID And Status = 'غير محصل'", _sqlCon);
            MySqlDataAdapter getTransformationDa = new MySqlDataAdapter(getTransformationCmd);
            getTransformationCmd.Parameters.AddWithValue("@ID", ContractId);
            getTransformationDa.Fill(getTransformationDt);
            if (getTransformationDt.Rows.Count == 0)
            {
                DataTable getCashDt = new DataTable();
                MySqlCommand getCashCmd = new MySqlCommand("SELECT Contract_Id FROM building_cash_amount WHERE Contract_Id = @ID And Satuts = 'غير محصل'", _sqlCon);
                MySqlDataAdapter getCashDa = new MySqlDataAdapter(getCashCmd);
                getCashCmd.Parameters.AddWithValue("@ID", ContractId);
                getCashDa.Fill(getCashDt);
                if (getCashDt.Rows.Count == 0)
                {

                    try
                    {

                        string Building_id = "";



                        DataTable get_Contract_Dt = new DataTable();
                        MySqlCommand get_Contract_Cmd = new MySqlCommand("SELECT building_Building_Id FROM building_contract WHERE Contract_Id = @ID", _sqlCon);
                        MySqlDataAdapter get_Contract_Da = new MySqlDataAdapter(get_Contract_Cmd);
                        get_Contract_Cmd.Parameters.AddWithValue("@ID", ContractId);
                        get_Contract_Da.Fill(get_Contract_Dt);
                        if (get_Contract_Dt.Rows.Count > 0)
                        {
                            Building_id = get_Contract_Dt.Rows[0]["building_Building_Id"].ToString();
                        }

                        string deleteContractQuary = "DELETE FROM building_contract WHERE Contract_Id=@ID ";
                        MySqlCommand mySqlCmd = new MySqlCommand(deleteContractQuary, _sqlCon);
                        mySqlCmd.Parameters.AddWithValue("@ID", ContractId);
                        mySqlCmd.ExecuteNonQuery();






                        if (Page.IsValid)
                        {
                            string addArciveBuildingQuary = "Insert Into delete_archive " +
                                                             "(User_Id," +
                                                             "Delete_Date," +
                                                             "OS_B_U," +
                                                             "Item_Id," +
                                                             "Reason_Delete) " +
                                                             "VALUES" +
                                                             "(@User_Id," +
                                                             "@Delete_Date," +
                                                             "@OS_B_U," +
                                                             "@Item_Id," +
                                                             "@Reason_Delete)";
                            MySqlCommand addArciveBuildingCmd = new MySqlCommand(addArciveBuildingQuary, _sqlCon);
                            addArciveBuildingCmd.Parameters.AddWithValue("@User_Id", Session["user_ID"].ToString());
                            addArciveBuildingCmd.Parameters.AddWithValue("@Delete_Date", DateTime.Now.ToString("dd/MM/yyyy"));
                            addArciveBuildingCmd.Parameters.AddWithValue("@OS_B_U", "BC");
                            addArciveBuildingCmd.Parameters.AddWithValue("@Item_Id", ContractId);
                            addArciveBuildingCmd.Parameters.AddWithValue("@Reason_Delete", txt_Reason_Delete.Text);
                            addArciveBuildingCmd.ExecuteNonQuery();
                        }


                        // Delete Units
                        string quary_Delet_Units = "DELETE FROM units WHERE building_Building_Id = @ID ";
                        MySqlCommand mySqlCmd_Delet_Units = new MySqlCommand(quary_Delet_Units, _sqlCon);
                        mySqlCmd_Delet_Units.Parameters.AddWithValue("@ID", Building_id);
                        mySqlCmd_Delet_Units.ExecuteNonQuery();

                        //// Delete Building
                        //string quary_Delet_Building = "DELETE FROM building WHERE Building_Id = @ID ";
                        //MySqlCommand mySqlCmd_Delet_Building = new MySqlCommand(quary_Delet_Building, _sqlCon);
                        //mySqlCmd_Delet_Building.Parameters.AddWithValue("@ID", Label2.Text);
                        //mySqlCmd_Delet_Building.ExecuteNonQuery();



                    }
                    catch
                    {
                        Response.Write(@"<script language='javascript'>alert('لا يمكن حذف هذا العقد لأنه يحتوي على  شيكات ')</script>");
                    }
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('لا يمكن حذف هذا العقد لأنه يحتوي على دفعات نقدية غير محصلة')</script>");
                }
            }

            else
            {
                Response.Write(@"<script language='javascript'>alert('لا يمكن حذف هذا العقد لأنه يحتوي على حوالات غير محصلة')</script>");
            }
            _sqlCon.Close();
        }
        protected void Btn_Remove_Link_Real_Contract_Click(object sender, ImageClickEventArgs e)
        {
            string Contrac_Id = Request.QueryString["ID"];

            string Remove_Real_Contrac_Att_Query = "UPDATE building_contract SET " +
                                            " Real_Contract_FileName=@Real_Contract_FileName ," +
                                            " Real_Contract_Path=@Real_Contract_Path  " +
                                            "WHERE Contract_Id=@ID";
            _sqlCon.Open();
            MySqlCommand Remove_Real_Contrac_Att_Cmd = new MySqlCommand(Remove_Real_Contrac_Att_Query, _sqlCon);
            Remove_Real_Contrac_Att_Cmd.Parameters.AddWithValue("@ID", Contrac_Id);
            Remove_Real_Contrac_Att_Cmd.Parameters.AddWithValue("@Real_Contract_FileName", "");
            Remove_Real_Contrac_Att_Cmd.Parameters.AddWithValue("@Real_Contract_Path", "");
            Remove_Real_Contrac_Att_Cmd.ExecuteNonQuery();
            _sqlCon.Close();

            Response.Redirect("Edit_Building_Contract.aspx?Id=" + Contrac_Id);
        }

        //******************************** ( Cheques / Transformations / Cash ) operations *********************************
        //----------------------------------     Cheque    -----------------------------------------------------------
        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            if (txt_Cheque_NO.Text != "" & txt_Cheque_Date.Text != "" & txt_Cheque_Owner.Text != ""
                && txt_Cheque_Value.Text != "" & Cheque_Type_DropDownList.SelectedItem.Text != "..............."
                && Bank_Cheque_Name_DropDownList.SelectedItem.Text != "..............." &&
                Tenan_Name_DropDownList.SelectedItem.Text != "...............")
            {
                string contractId = Request.QueryString["Id"];
                string Add_Cheque_In_Edit_Contract = "Insert Into building_cheques (" +
                                                    "Cheques_No , " +
                                                    "Cheques_Date  , " +
                                                    "Cheques_Amount        , " +
                                                    "Cheque_Owner        , " +
                                                    "beneficiary_person        , " +
                                                    "Cheques_Status        , " +
                                                    "cheque_type_Cheque_Type_id       , " +
                                                    "bank_Bank_Id         , " +
                                                    "tenants_Tenants_ID , " +
                                                    "building_contract_Contract_Id ) " +
                                                    "VALUES( " +
                                                    "@Cheques_No , " +
                                                    "@Cheques_Date  , " +
                                                    "@Cheques_Amount        , " +
                                                    "@Cheque_Owner        , " +
                                                    "@beneficiary_person        , " +
                                                    "@Cheques_Status        , " +
                                                    "@cheque_type_Cheque_Type_id       , " +
                                                    "@bank_Bank_Id         , " +
                                                    "@tenants_Tenants_ID , " +
                                                    "@building_contract_Contract_Id ) ";
                _sqlCon.Open();
                using (MySqlCommand Add_Cheque_In_Edit_Contract_Cmd = new MySqlCommand(Add_Cheque_In_Edit_Contract, _sqlCon))
                {
                    Add_Cheque_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Cheques_No", txt_Cheque_NO.Text);
                    Add_Cheque_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Cheques_Date", txt_Cheque_Date.Text);
                    Add_Cheque_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Cheques_Amount", txt_Cheque_Value.Text);
                    Add_Cheque_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Cheque_Owner", txt_Cheque_Owner.Text);


                    Add_Cheque_In_Edit_Contract_Cmd.Parameters.AddWithValue("@beneficiary_person", txt_beneficiary_person.Text);


                    Add_Cheque_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Cheques_Status", "غير محصل");
                    Add_Cheque_In_Edit_Contract_Cmd.Parameters.AddWithValue("@cheque_type_Cheque_Type_id", Cheque_Type_DropDownList.SelectedValue);
                    Add_Cheque_In_Edit_Contract_Cmd.Parameters.AddWithValue("@bank_Bank_Id", Bank_Cheque_Name_DropDownList.SelectedValue);
                    Add_Cheque_In_Edit_Contract_Cmd.Parameters.AddWithValue("@tenants_Tenants_ID", Tenan_Name_DropDownList.SelectedValue);
                    Add_Cheque_In_Edit_Contract_Cmd.Parameters.AddWithValue("@building_contract_Contract_Id", contractId);
                    Add_Cheque_In_Edit_Contract_Cmd.ExecuteNonQuery();
                    _sqlCon.Close();
                }
                BindGrid_Contract_Cheque_List();
            }
            else
            {
                lbl_Worrnig_Cheque.Visible = true;
            }
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
        }
        private void BindGrid_Contract_Cheque_List()
        {
            _sqlCon.Open();
            string ContractId = Request.QueryString["Id"];
            using (MySqlCommand Contract_ChequesCmd = new MySqlCommand("Building_Contract_List_In_Edit_page", _sqlCon))
            {
                Contract_ChequesCmd.CommandType = CommandType.StoredProcedure;
                Contract_ChequesCmd.Parameters.AddWithValue("@Id", ContractId);
                MySqlDataAdapter Contract_ChequesSda = new MySqlDataAdapter(Contract_ChequesCmd);

                DataTable Contract_ChequesDt = new DataTable();
                Contract_ChequesSda.Fill(Contract_ChequesDt);
                Contract_ChequesCmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                Contract_ChequesSda.Fill(dt);
                Contract_Cheque_List.DataSource = dt;
                Contract_Cheque_List.DataBind();
            }
            _sqlCon.Close();
        }
        protected void RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbl_cheque_type = (Label)e.Row.FindControl("lbl_cheque_type");
                Label lbl_Cheque_English_Type = (Label)e.Row.FindControl("lbl_Cheque_English_Type");
                Label lbl_bank = (Label)e.Row.FindControl("lbl_bank");
                Label lbl_Bank_English_Name = (Label)e.Row.FindControl("lbl_Bank_English_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_cheque_type.Visible = false; lbl_Cheque_English_Type.Visible = true;
                    lbl_bank.Visible = false; lbl_Bank_English_Name.Visible = true;
                }
                else
                {
                    lbl_cheque_type.Visible = true; lbl_Cheque_English_Type.Visible = false;
                    lbl_bank.Visible = true; lbl_Bank_English_Name.Visible = false;
                }
            }
        }
        protected void Contract_Cheque_List_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt16(Contract_Cheque_List.DataKeys[e.RowIndex].Values["Cheques_Id"].ToString());
            _sqlCon.Open();
            MySqlCommand cmd = new MySqlCommand("delete from building_cheques where Cheques_Id =@Cheques_Id", _sqlCon);
            cmd.Parameters.AddWithValue("Cheques_Id", id);
            cmd.ExecuteNonQuery();
            _sqlCon.Close();
            BindGrid_Contract_Cheque_List();
        }
        //---------------------------------------     Transformation    ------------------------------------------------
        protected void btn_Add_Transformation_Click(object sender, ImageClickEventArgs e)
        {
            string contractId = Request.QueryString["Id"];
            string Add_Transformation_In_Edit_Contract = "Insert Into building_transformation_table (" +
                                                "transformation_Bank_ID , " +
                                                "transformation_No , " +
                                                "transformation_Date , " +
                                                "Amount , " +
                                                "Status , " +
                                                "tenant_Id , " +
                                                "Contract_Id ) " +
                                                "VALUES( " +
                                                "@transformation_Bank_ID , " +
                                                "@transformation_No , " +
                                                "@transformation_Date , " +
                                                "@Amount , " +
                                                "@Status , " +
                                                "@tenant_Id , " +
                                                "@Contract_Id ) ";
            _sqlCon.Open();
            using (MySqlCommand Add_Transformation_In_Edit_Contract_Cmd = new MySqlCommand(Add_Transformation_In_Edit_Contract, _sqlCon))
            {
                Add_Transformation_In_Edit_Contract_Cmd.Parameters.AddWithValue("@transformation_Bank_ID", transformation_Bank_DropDownList.SelectedValue);
                Add_Transformation_In_Edit_Contract_Cmd.Parameters.AddWithValue("@transformation_No", txt_transformation_No.Text);
                Add_Transformation_In_Edit_Contract_Cmd.Parameters.AddWithValue("@transformation_Date", txt_transformation_Date.Text);
                Add_Transformation_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Amount", txt_transformation_Amount.Text);
                Add_Transformation_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Status", "غير محصل");
                Add_Transformation_In_Edit_Contract_Cmd.Parameters.AddWithValue("@tenant_Id", Tenan_Name_DropDownList.SelectedValue);
                Add_Transformation_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Contract_Id", contractId);
                Add_Transformation_In_Edit_Contract_Cmd.ExecuteNonQuery();
                _sqlCon.Close();
            }
            BindGrid_transportation_List();
        }
        private void BindGrid_transportation_List()
        {
            string contractId = Request.QueryString["Id"];
            string gettransportationsQuari = "select Tr_Tb.*,  B.Bank_Name , B.Bank_Name_EN , T.Tenants_Arabic_Name , T.Tenants_English_Name " +
                                            "FROM  building_transformation_table Tr_Tb " +
                                            "left join  transformation_bank B on (Tr_Tb.transformation_Bank_ID = B.transformation_Bank_ID) " +
                                            "left join  tenants T on (Tr_Tb.tenant_Id = T.Tenants_ID) " +
                                            "where Contract_Id = '" + contractId + "';";



            MySqlCommand gettransportationsCmd = new MySqlCommand(gettransportationsQuari, _sqlCon);
            MySqlDataAdapter gettransportationsDt = new MySqlDataAdapter(gettransportationsCmd);
            gettransportationsCmd.Connection = _sqlCon;
            _sqlCon.Open();
            gettransportationsDt.SelectCommand = gettransportationsCmd;
            DataTable gettransportationsDataTable = new DataTable();
            gettransportationsDt.Fill(gettransportationsDataTable);
            transformation_GridView.DataSource = gettransportationsDataTable;
            transformation_GridView.DataBind();
            _sqlCon.Close();
        }
        protected void transformation_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbl_AR_Bank_Name = (Label)e.Row.FindControl("lbl_AR_Bank_Name");
                Label lbl_EN_Bank_Name = (Label)e.Row.FindControl("lbl_EN_Bank_Name");
                Label lbl_Tenants_Arabic_Name = (Label)e.Row.FindControl("lbl_Tenants_Arabic_Name");
                Label lbl_Tenants_English_Name = (Label)e.Row.FindControl("lbl_Tenants_English_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_AR_Bank_Name.Visible = false; lbl_EN_Bank_Name.Visible = true;
                    lbl_Tenants_Arabic_Name.Visible = false; lbl_Tenants_English_Name.Visible = true;
                }
                else
                {
                    lbl_AR_Bank_Name.Visible = true; lbl_EN_Bank_Name.Visible = false;
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;
                }
            }
        }
        protected void transformation_GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt16(transformation_GridView.DataKeys[e.RowIndex].Values["transformation_Table_ID"].ToString());
            _sqlCon.Open();
            MySqlCommand cmd = new MySqlCommand("delete from building_transformation_table where transformation_Table_ID =@transformation_Table_ID", _sqlCon);
            cmd.Parameters.AddWithValue("transformation_Table_ID", id);
            cmd.ExecuteNonQuery();
            _sqlCon.Close();
            BindGrid_transportation_List();
        }
        //----------------------------------     Cash    ----------------------------------------------------------
        protected void Add_Cash_Click(object sender, ImageClickEventArgs e)
        {
            string contractId = Request.QueryString["Id"];
            string Add_Cash_In_Edit_Contract = "Insert Into building_cash_amount (" +
                                                "Cash_Amount , " +
                                                "Cash_Date , " +
                                                "tenant_Id , " +
                                                "Satuts , " +
                                                "Contract_Id ) " +
                                                "VALUES( " +
                                                "@Cash_Amount , " +
                                                "@Cash_Date , " +
                                                "@tenant_Id , " +
                                                "@Satuts , " +
                                                "@Contract_Id ) ";
            _sqlCon.Open();
            using (MySqlCommand Add_Cash_In_Edit_Contract_Cmd = new MySqlCommand(Add_Cash_In_Edit_Contract, _sqlCon))
            {
                Add_Cash_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Cash_Amount", txt_Cash_Amount.Text);
                Add_Cash_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Cash_Date", txt_Cash_Date.Text);
                Add_Cash_In_Edit_Contract_Cmd.Parameters.AddWithValue("@tenant_Id", Tenan_Name_DropDownList.SelectedValue);
                Add_Cash_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Satuts", "غير محصل");
                Add_Cash_In_Edit_Contract_Cmd.Parameters.AddWithValue("@Contract_Id", contractId);
                Add_Cash_In_Edit_Contract_Cmd.ExecuteNonQuery();
                _sqlCon.Close();
            }
            BindGrid_Cash_List();
        }
        private void BindGrid_Cash_List()
        {
            string contractId = Request.QueryString["Id"];
            string getCashsQuari = "select Csh.*, T.Tenants_Arabic_Name , T.Tenants_English_Name " +
                "FROM  building_cash_amount Csh left join tenants T on (Csh.tenant_Id = T.Tenants_ID) where Contract_Id = '" + contractId + "';";
            MySqlCommand getCashsCmd = new MySqlCommand(getCashsQuari, _sqlCon);
            MySqlDataAdapter getCashsDt = new MySqlDataAdapter(getCashsCmd);
            getCashsCmd.Connection = _sqlCon;
            _sqlCon.Open();
            getCashsDt.SelectCommand = getCashsCmd;
            DataTable getCashsDataTable = new DataTable();
            getCashsDt.Fill(getCashsDataTable);
            Cash_GridView.DataSource = getCashsDataTable;
            Cash_GridView.DataBind();
            _sqlCon.Close();
        }
        protected void Cash_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbl_Tenants_Arabic_Name = (Label)e.Row.FindControl("lbl_Tenants_Arabic_Name");
                Label lbl_Tenants_English_Name = (Label)e.Row.FindControl("lbl_Tenants_English_Name");

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Tenants_Arabic_Name.Visible = false; lbl_Tenants_English_Name.Visible = true;
                }
                else
                {
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;
                }
            }
        }
        protected void Cash_GridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt16(Cash_GridView.DataKeys[e.RowIndex].Values["Cash_Amount_ID"].ToString());
            _sqlCon.Open();
            MySqlCommand cmd = new MySqlCommand("delete from building_cash_amount where Cash_Amount_ID =@Cash_Amount_ID", _sqlCon);
            cmd.Parameters.AddWithValue("Cash_Amount_ID", id);
            cmd.ExecuteNonQuery();
            _sqlCon.Close();
            BindGrid_Cash_List();
        }
        







        //************************************SelectedIndexChanged******************************************************
        //--------------------------------------------------  Get The Building Of Selected Ownership --------------------------------------------------
        protected void Ownership_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Session["Langues"].ToString() == "1") 
            {
                Helper.LoadDropDownList("SELECT * FROM building where owner_ship_Owner_Ship_Id = '" + Ownership_Name_DropDownList.SelectedValue + "'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                Building_Name_DropDownList.Items.Insert(0, "...............");
            }
            else 
            {
                Helper.LoadDropDownList("SELECT * FROM building where owner_ship_Owner_Ship_Id = '" + Ownership_Name_DropDownList.SelectedValue + "'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                Building_Name_DropDownList.Items.Insert(0, "...............");
            }
        }

        //-------------------------------------------------- Contract_Type_DropDownList --------------------------------------------------
        protected void Contract_Type_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            div_No_Of_Months.Visible = true;
            if (Contract_Type_DropDownList.SelectedValue == "1")
            {
                lbl_No_Of_Months_Or_Years.Text = "عدد السنوات";
                txt_No_Of_Months_Or_Years.ReadOnly = false;
                txt_No_Of_Months_Or_Years.Text = "1";

                if (txt_Start_Date.Text != "")
                {
                    if (txt_No_Of_Months_Or_Years.Text != "")
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12);
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
            }
            else if (Contract_Type_DropDownList.SelectedValue == "2")
            {
                lbl_No_Of_Months_Or_Years.Text = "عدد الأشهر";
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
                lbl_No_Of_Months_Or_Years.Text = "عدد الأشهر";
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
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text));
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
            }
        }
        //-------------------------------------------------- Tenan_Name_DropDownList --------------------------------------------------
        protected void Tenan_Name_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Tenant_Id = Tenan_Name_DropDownList.SelectedValue;
            DataTable get_Tenant_Id_Dt = new DataTable();
            _sqlCon.Open();
            MySqlCommand get_Tenant_Id_Cmd = new MySqlCommand("SELECT * FROM tenants where Tenants_ID='" + Tenant_Id + "'", _sqlCon);
            MySqlDataAdapter get_Tenant_Id_Da = new MySqlDataAdapter(get_Tenant_Id_Cmd);
            get_Tenant_Id_Da.Fill(get_Tenant_Id_Dt);
            if (get_Tenant_Id_Dt.Rows.Count > 0)
            {
                if (get_Tenant_Id_Dt.Rows[0]["tenant_type_Tenant_Type_Id"].ToString() == "2")
                {
                    Com_Rep_Div.Visible = true;
                    //    //Fill Com_Rep_DropDownList
                    string Tenan_Name_ID = Tenan_Name_DropDownList.SelectedValue;
                    Helper.LoadDropDownList("SELECT * FROM company_representative where tenants_Tenants_ID ='" + Tenan_Name_ID + "'", _sqlCon, Com_Rep_DropDownList, "Com_rep_En_Name", "Company_representative_Id");
                    Com_Rep_DropDownList.Items.Insert(0, "إختر اسم الممثل ....");
                }
                else
                {
                    string Tenan_Name_ID = Tenan_Name_DropDownList.SelectedValue;
                    Com_Rep_Div.Visible = false;
                    Helper.LoadDropDownList("SELECT * FROM company_representative ", _sqlCon, Com_Rep_DropDownList, "Com_rep_En_Name", "Company_representative_Id");
                    Com_Rep_DropDownList.Items.Insert(0, "إختر اسم الممثل ....");
                    Com_Rep_DropDownList.SelectedValue = "1";
                }
            }
        }
        //-------------------------------------------------- Paymen_Method --------------------------------------------------
        protected void Paymen_Method_RadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Paymen_Method_RadioButtonList.SelectedValue == "1") { Cheque_Div.Visible = true; transformation_Div.Visible = false; Cash_div.Visible = false; }
            else if (Paymen_Method_RadioButtonList.SelectedValue == "2") { Cheque_Div.Visible = false; transformation_Div.Visible = true; Cash_div.Visible = false; }
            else if (Paymen_Method_RadioButtonList.SelectedValue == "3") { Cheque_Div.Visible = false; transformation_Div.Visible = false; Cash_div.Visible = true; }
            ClientScript.RegisterClientScriptBlock(this.GetType(), "", "window.onload=function(){window.scrollTo(0,document.body.scrollHeight)};", true);
        }
        //-------------------------------------------------- FREE_PERIOD --------------------------------------------------
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
        //-------------------------------------------------- Additional_Items --------------------------------------------------
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
                            DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12);
                            DateTime add_Months_With_Free_Period = add_Months.AddMonths(Convert.ToInt32(txt_Duration_Of_The_Free_Period.Text));
                            txt_End_Date.Text = add_Months_With_Free_Period.ToString("dd/MM/yyyy");
                        }
                        else
                        {
                            DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12);
                            txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                        }
                    }
                    else
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text));
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
            }
        }
        protected void txt_Duration_Of_The_Free_Period_TextChanged(object sender, EventArgs e)
        {
            // txt_Start_Date.Text = Start_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Start_Date.Text != "") { Start_Date_Div.Visible = false; ImageButton2.Visible = false; }

            if (txt_No_Of_Months_Or_Years.Text != "")
            {
                if (Contract_Type_DropDownList.SelectedValue == "1")
                {
                    if (txt_Duration_Of_The_Free_Period.Text != "")
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12);
                        DateTime add_Months_With_Free_Period = add_Months.AddMonths(Convert.ToInt32(txt_Duration_Of_The_Free_Period.Text));
                        txt_End_Date.Text = add_Months_With_Free_Period.ToString("dd/MM/yyyy");
                    }
                    else
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12);
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
                else
                {
                    if (txt_Duration_Of_The_Free_Period.Text != "")
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text));
                        DateTime add_Months_With_Free_Period = add_Months.AddMonths(Convert.ToInt32(txt_Duration_Of_The_Free_Period.Text));
                        txt_End_Date.Text = add_Months_With_Free_Period.ToString("dd/MM/yyyy");
                    }
                    else
                    {
                        DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text));
                        txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                    }
                }
            }
        }











        //***************************************************** Calander Function *****************************************************
        //--------------------------------------------------  Sign_Date --------------------------------------------------
        protected void Sign_Date_Calendar_SelectionChanged1(object sender, EventArgs e)
        {
            txt_Sign_Date.Text = Sign_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Sign_Date.Text != "") { Sign_Date_divCalendar.Visible = false; ImageButton1.Visible = false; }
        }
        protected void Date_Chosee_Click(object sender, EventArgs e)
        {
            Sign_Date_divCalendar.Visible = true; ImageButton1.Visible = true;
        }
        protected void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Sign_Date_divCalendar.Visible = false; ImageButton1.Visible = false;
        }
        //--------------------------------------------------   Start_Date -------------------------------------------------- 
        protected void Start_Date_Calendar_SelectionChanged2(object sender, EventArgs e)
        {
            txt_Start_Date.Text = Start_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Start_Date.Text != "") { Start_Date_Div.Visible = false; ImageButton2.Visible = false; }

            if (txt_No_Of_Months_Or_Years.Text != "")
            {
                if (Contract_Type_DropDownList.SelectedValue == "1")
                {
                    DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text) * 12);
                    txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                }
                else
                {
                    DateTime add_Months = Convert.ToDateTime(txt_Start_Date.Text).AddMonths(Convert.ToInt32(txt_No_Of_Months_Or_Years.Text));
                    txt_End_Date.Text = add_Months.ToString("dd/MM/yyyy");
                }
            }
        }
        protected void Start_Date_Chosee_Click(object sender, EventArgs e)
        {
            Start_Date_Div.Visible = true; ImageButton2.Visible = true;
        }
        protected void ImageButton2_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Start_Date_Div.Visible = false; ImageButton2.Visible = false;
        }
        //--------------------------------------------------   End_Date -------------------------------------------------- 
        protected void End_Date_Chosee_Click(object sender, EventArgs e)
        {
            End_Date_Div.Visible = true; ImageButton3.Visible = true;
        }
        protected void ImageButton3_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            End_Date_Div.Visible = false; ImageButton3.Visible = false;
        }
        protected void End_Date_Calendar_SelectionChanged1(object sender, EventArgs e)
        {
            txt_End_Date.Text = End_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_End_Date.Text != "") { End_Date_Div.Visible = false; ImageButton3.Visible = false; }
        }
        //-------------------------------------------------- Cheque_ Date --------------------------------------------------
        protected void btn_Cheque_Date_Chosee_Click(object sender, EventArgs e)
        {
            Cheque_Date_Div.Visible = true; Cheque_Date_ImageButton.Visible = true;
        }
        protected void Cheque_Date_Calendar_SelectionChanged(object sender, EventArgs e)
        {
            txt_Cheque_Date.Text = Cheque_Date_Calendar.SelectedDate.ToShortDateString();
            if (txt_Cheque_Date.Text != "") { Cheque_Date_Div.Visible = false; Cheque_Date_ImageButton.Visible = false; }
        }
        protected void Cheque_Date_ImageButton_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            Cheque_Date_Div.Visible = false; Cheque_Date_ImageButton.Visible = false;
        }
        //-------------------------------------------------- transformation_Date --------------------------------------------------
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
        //-------------------------------------------------- Cash_Date --------------------------------------------------
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



        

        

        //*********************************************** Half Building Units Functions *************************************
        public void refreshdata()
        {
            string getUnitQuari = "SELECT * FROM units where building_Building_Id = '" + Building_Name_DropDownList.SelectedValue + "'";
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
        protected void Unit_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string Half; CheckBox CB;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    Half = ((Label)e.Row.FindControl("Half")).Text;
                    CB = ((CheckBox)e.Row.FindControl("CheckBox1"));
                    if (Half == "1")
                    {
                        e.Row.ForeColor = System.Drawing.Color.Blue;
                        e.Row.BackColor = System.Drawing.Color.AliceBlue;
                        CB.Checked = true;
                    }
                }
                catch
                {
                    Half = "";
                }
            }
        }










        














       







        



        










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
                        "SELECT * FROM company_representative where tenants_Tenants_ID ='" + Tenan_Name_ID + "'", _sqlCon, Com_Rep_DropDownList, "Com_rep_En_Name", "Company_representative_Id"); Com_Rep_DropDownList.Items.Insert(0, "...............");
                    Com_Rep_DropDownList.SelectedValue = "1";

                    //    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_En_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_English_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

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


                    lbl_titel_Add_New_Tenant.Text = Dt.Rows[45]["En"].ToString();
                    lbl_Contract_Type.Text = Dt.Rows[1]["EN"].ToString();
                    lbl_Tenan_Name.Text = Dt.Rows[2]["EN"].ToString();
                    lbl_Com_Rep.Text = Dt.Rows[3]["EN"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[4]["EN"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[5]["EN"].ToString();
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
                    lbl_Real_Contract.Text = "Upload a copy of the certified contract";
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
                    lbl_Reason_Delete.Text = "Reason For Deletion";
                    btn_Add_Contract.Text = Dt.Rows[45]["EN"].ToString();
                    btn_Back_To_Contract_List.Text = Dt.Rows[35]["EN"].ToString();
                    FREE_PERIOD_CheckBox.Text = Dt.Rows[18]["EN"].ToString();
                    Additional_Items_CheckBox.Text = Dt.Rows[17]["EN"].ToString();
                    Sign_Date_Chosee.Text = Dt.Rows[21]["EN"].ToString();
                    Start_Date_Chosee.Text = Dt.Rows[21]["EN"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[21]["EN"].ToString();
                    lbl_transformation_Amount.Text = Dt.Rows[31]["EN"].ToString();
                    transformation_Date_Button.Text = Dt.Rows[21]["EN"].ToString();


                    Contract_Cheque_List.Columns[1].HeaderText = Dt.Rows[22]["EN"].ToString();
                    Contract_Cheque_List.Columns[2].HeaderText = Dt.Rows[23]["EN"].ToString();
                    Contract_Cheque_List.Columns[3].HeaderText = Dt.Rows[24]["EN"].ToString();
                    Contract_Cheque_List.Columns[4].HeaderText = Dt.Rows[25]["EN"].ToString();
                    Contract_Cheque_List.Columns[5].HeaderText = Dt.Rows[26]["EN"].ToString();
                    Contract_Cheque_List.Columns[6].HeaderText = Dt.Rows[27]["EN"].ToString();
                    Contract_Cheque_List.Columns[7].HeaderText = Dt.Rows[28]["EN"].ToString();

                    transformation_GridView.Columns[0].HeaderText = Dt.Rows[29]["EN"].ToString();
                    transformation_GridView.Columns[1].HeaderText = Dt.Rows[26]["EN"].ToString();
                    transformation_GridView.Columns[2].HeaderText = Dt.Rows[30]["EN"].ToString();
                    transformation_GridView.Columns[3].HeaderText = Dt.Rows[31]["EN"].ToString();
                    transformation_GridView.Columns[4].HeaderText = Dt.Rows[2]["EN"].ToString();

                    Cash_GridView.Columns[0].HeaderText = Dt.Rows[32]["EN"].ToString();
                    Cash_GridView.Columns[1].HeaderText = Dt.Rows[33]["EN"].ToString();
                    Cash_GridView.Columns[2].HeaderText = Dt.Rows[2]["EN"].ToString();




                    Contract_Templet_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Tenan_Name_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Com_Rep_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Ownership_Name_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Building_Name_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Reason_For_Rent_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Contract_Type_RequiredFieldValidator.ErrorMessage = "* Required ";
                    No_Of_Months_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Payment_Type_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Payment_Amount_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Payment_Amount_L_RequiredFieldValidator.ErrorMessage = "* Required ";
                    maintenance_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Rental_allowed_Or_Not_allowed_RequiredFieldValidator.ErrorMessage = "* Required ";
                    Paymen_Method_Req_Fiel_Val.ErrorMessage = "* Required ";
                    Delete_ReqFieVal.ErrorMessage = "The reason for the deletion must be explained";
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
                        "SELECT * FROM company_representative where tenants_Tenants_ID ='" + Tenan_Name_ID + "'", _sqlCon, Com_Rep_DropDownList, "Com_rep_En_Name", "Company_representative_Id"); Com_Rep_DropDownList.Items.Insert(0, "...............");
                    Com_Rep_DropDownList.SelectedValue = "1";

                    //    //Fill Ownership Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM owner_ship where Active !='1'", _sqlCon, Ownership_Name_DropDownList, "Owner_Ship_AR_Name", "Owner_Ship_Id");
                    Ownership_Name_DropDownList.Items.Insert(0, "...............");

                    //    //Fill Building Name DropDownList
                    Helper.LoadDropDownList("SELECT * FROM building Where Active ='1'", _sqlCon, Building_Name_DropDownList, "Building_Arabic_Name", "Building_Id");
                    Building_Name_DropDownList.Items.Insert(0, "...............");

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




                    lbl_titel_Add_New_Tenant.Text = Dt.Rows[45]["AR"].ToString();
                    lbl_Contract_Type.Text = Dt.Rows[1]["AR"].ToString();
                    lbl_Tenan_Name.Text = Dt.Rows[2]["AR"].ToString();
                    lbl_Com_Rep.Text = Dt.Rows[3]["AR"].ToString();
                    lbl_Ownership_Name.Text = Dt.Rows[4]["AR"].ToString();
                    lbl_Building_Name.Text = Dt.Rows[5]["AR"].ToString();
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
                    lbl_Real_Contract.Text = "تحميل صورة العقد المصدق";
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
                    lbl_Reason_Delete.Text = "سبب الحذف";
                    transformation_Date_Button.Text = Dt.Rows[21]["AR"].ToString();
                    FREE_PERIOD_CheckBox.Text = Dt.Rows[18]["AR"].ToString();
                    Additional_Items_CheckBox.Text = Dt.Rows[17]["AR"].ToString();
                    Sign_Date_Chosee.Text = Dt.Rows[21]["AR"].ToString();
                    Start_Date_Chosee.Text = Dt.Rows[21]["AR"].ToString();
                    End_Date_Chosee.Text = Dt.Rows[21]["AR"].ToString();
                    btn_Add_Contract.Text = Dt.Rows[45]["AR"].ToString();
                    btn_Back_To_Contract_List.Text = Dt.Rows[35]["AR"].ToString();

                    Contract_Cheque_List.Columns[1].HeaderText = Dt.Rows[22]["AR"].ToString();
                    Contract_Cheque_List.Columns[2].HeaderText = Dt.Rows[23]["AR"].ToString();
                    Contract_Cheque_List.Columns[3].HeaderText = Dt.Rows[24]["AR"].ToString();
                    Contract_Cheque_List.Columns[4].HeaderText = Dt.Rows[25]["AR"].ToString();
                    Contract_Cheque_List.Columns[5].HeaderText = Dt.Rows[26]["AR"].ToString();
                    Contract_Cheque_List.Columns[6].HeaderText = Dt.Rows[27]["AR"].ToString();
                    Contract_Cheque_List.Columns[7].HeaderText = Dt.Rows[28]["AR"].ToString();

                    transformation_GridView.Columns[0].HeaderText = Dt.Rows[29]["AR"].ToString();
                    transformation_GridView.Columns[1].HeaderText = Dt.Rows[26]["AR"].ToString();
                    transformation_GridView.Columns[2].HeaderText = Dt.Rows[30]["AR"].ToString();
                    transformation_GridView.Columns[3].HeaderText = Dt.Rows[31]["AR"].ToString();
                    transformation_GridView.Columns[4].HeaderText = Dt.Rows[2]["AR"].ToString();

                    Cash_GridView.Columns[0].HeaderText = Dt.Rows[32]["AR"].ToString();
                    Cash_GridView.Columns[1].HeaderText = Dt.Rows[33]["AR"].ToString();
                    Cash_GridView.Columns[2].HeaderText = Dt.Rows[2]["AR"].ToString();





                    Contract_Templet_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Tenan_Name_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Com_Rep_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Ownership_Name_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Building_Name_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Reason_For_Rent_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Contract_Type_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    No_Of_Months_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Payment_Type_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Payment_Amount_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Payment_Amount_L_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    maintenance_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Rental_allowed_Or_Not_allowed_RequiredFieldValidator.ErrorMessage = "*مطلوب ";
                    Paymen_Method_Req_Fiel_Val.ErrorMessage = "*مطلوب ";
                    Delete_ReqFieVal.ErrorMessage = "يجب توضيح سبب الحذف";
                    Payment_Amount_RegularExpressionValidator.ErrorMessage = "أرقام فقط";

                }
            }
            _sqlCon.Close();
        }

       
    }
}