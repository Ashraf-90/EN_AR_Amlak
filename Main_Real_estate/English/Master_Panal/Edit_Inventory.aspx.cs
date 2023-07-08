using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Edit_Inventory : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();


                string inventoryId = Request.QueryString["Id"];
                DataTable getInventoryDt = new DataTable();
                _sqlCon.Open();
                MySqlCommand getInventoryCmd =
                    new MySqlCommand("SELECT * FROM Inventory WHERE Inventory_Id = @ID", _sqlCon);
                MySqlDataAdapter getInventoryDa = new MySqlDataAdapter(getInventoryCmd);

                getInventoryCmd.Parameters.AddWithValue("@ID", inventoryId);
                getInventoryDa.Fill(getInventoryDt);
                if (getInventoryDt.Rows.Count > 0)
                {
                    txt_En_Inventory_Name.Text = getInventoryDt.Rows[0]["Inventory_English_name"].ToString();
                    txt_Ar_Inventory_Name.Text = getInventoryDt.Rows[0]["Inventory_arabic_name"].ToString();
                    txt_Inventory_Location.Text = getInventoryDt.Rows[0]["Inventory_Location"].ToString();
                    storekeeper_DropDownList.SelectedValue = getInventoryDt.Rows[0]["employee_Employee_Id"].ToString();
                    if (Session["Langues"].ToString() == "1") { lbl_titel_Name_Edit_Inventory.Text = getInventoryDt.Rows[0]["Inventory_English_name"].ToString(); }
                    else { lbl_titel_Name_Edit_Inventory.Text = getInventoryDt.Rows[0]["Inventory_arabic_name"].ToString(); }
                        
                }

                _sqlCon.Close();
            }
        }

        protected void btn_Back_To_Inventory_List_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inventory_List.aspx");
        }

        protected void btn_Add_Inventory_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string inventoryId = Request.QueryString["Id"];
                string updateInventoryQuary =
                    "UPDATE Inventory SET " +
                    "employee_Employee_Id=@employee_Employee_Id ," +
                    "Inventory_English_name=@Inventory_English_name ," +
                    " Inventory_arabic_name=@Inventory_arabic_name , " +
                    "Inventory_Location=@Inventory_Location WHERE Inventory_Id=@ID ";
                _sqlCon.Open();
                MySqlCommand updateInventoryCmd = new MySqlCommand(updateInventoryQuary, _sqlCon);
                updateInventoryCmd.Parameters.AddWithValue("@ID", inventoryId);
                updateInventoryCmd.Parameters.AddWithValue("@employee_Employee_Id", storekeeper_DropDownList.SelectedValue);
                updateInventoryCmd.Parameters.AddWithValue("@Inventory_English_name", txt_En_Inventory_Name.Text);
                updateInventoryCmd.Parameters.AddWithValue("@Inventory_arabic_name", txt_Ar_Inventory_Name.Text);
                updateInventoryCmd.Parameters.AddWithValue("@Inventory_Location", txt_Inventory_Location.Text);
                updateInventoryCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Edit_Inventory.Text = "تم التعديل بنجاح";
                Response.Redirect("Inventory_List.aspx");
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
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_master", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    //Fill storekeeper_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, storekeeper_DropDownList, "Employee_English_name", "Employee_Id");
                    storekeeper_DropDownList.Items.Insert(0, "...............");

                    lbl_titel_Edit_Inventory.Text = Dt.Rows[192]["EN"].ToString();
                    lbl_En_Inventory_Name.Text = Dt.Rows[187]["EN"].ToString();
                    lbl_Ar_Inventory_Name.Text = Dt.Rows[188]["EN"].ToString();
                    lbl_Inventory_Location.Text = Dt.Rows[189]["EN"].ToString();
                    lbl_storekeeper.Text = Dt.Rows[190]["EN"].ToString();
                    btn_Add_Inventory.Text = Dt.Rows[57]["EN"].ToString();
                    btn_Back_To_Inventory_List.Text = Dt.Rows[191]["EN"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "Only English";
                    RegularExpressionValidator2.ErrorMessage = "Only Arabic";

                    reqFuild1.ErrorMessage = "* Required";
                    RequiredFieldValidator1.ErrorMessage = "* Required";
                    storekeeper_RequiredFieldValidator.ErrorMessage = "* Required";
                    reqFuild3.ErrorMessage = "* Required";

                }
                else
                {
                    //Fill storekeeper_DropDownList
                    Helper.LoadDropDownList("SELECT * FROM employee", _sqlCon, storekeeper_DropDownList, "Employee_Arabic_name", "Employee_Id");
                    storekeeper_DropDownList.Items.Insert(0, "...............");

                    lbl_titel_Edit_Inventory.Text = Dt.Rows[192]["AR"].ToString();
                    lbl_En_Inventory_Name.Text = Dt.Rows[187]["AR"].ToString();
                    lbl_Ar_Inventory_Name.Text = Dt.Rows[188]["AR"].ToString();
                    lbl_Inventory_Location.Text = Dt.Rows[189]["AR"].ToString();
                    lbl_storekeeper.Text = Dt.Rows[190]["AR"].ToString();
                    btn_Add_Inventory.Text = Dt.Rows[57]["AR"].ToString();
                    btn_Back_To_Inventory_List.Text = Dt.Rows[191]["AR"].ToString();

                    RegularExpressionValidator1.ErrorMessage = "إنكليزي فقط";
                    RegularExpressionValidator2.ErrorMessage = "عربي فقط";


                    reqFuild1.ErrorMessage = "* مطلوب";
                    RequiredFieldValidator1.ErrorMessage = "* مطلوب";
                    storekeeper_RequiredFieldValidator.ErrorMessage = "* مطلوب";
                    reqFuild3.ErrorMessage = "* مطلوب";

                }
            }
            _sqlCon.Close();

        }
    }
}