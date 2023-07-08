using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Add_Inventory : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                language();
                
            }
        }

        protected void btn_Add_Inventory_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string addInventoryQuary =
                    "Insert Into Inventory " +
                    "(Inventory_English_name,Inventory_arabic_name,Inventory_Location,employee_Employee_Id) " +
                    "VALUES" +
                    "(@Inventory_English_name,@Inventory_arabic_name,@Inventory_Location,@employee_Employee_Id)";
                _sqlCon.Open();
                MySqlCommand addInventoryCmd = new MySqlCommand(addInventoryQuary, _sqlCon);
                addInventoryCmd.Parameters.AddWithValue("@Inventory_English_name", txt_En_Inventory_Name.Text);
                addInventoryCmd.Parameters.AddWithValue("@Inventory_arabic_name", txt_Ar_Inventory_Name.Text);
                addInventoryCmd.Parameters.AddWithValue("@Inventory_Location", txt_Inventory_Location.Text);
                addInventoryCmd.Parameters.AddWithValue("@employee_Employee_Id", storekeeper_DropDownList.SelectedValue);
                addInventoryCmd.ExecuteNonQuery();
                _sqlCon.Close();
                lbl_Success_Add_New_Inventory.Text = "تمت الإضافة بنجاح";
                Response.Redirect("Inventory_List.aspx");
            }
        }

        protected void btn_Back_To_Inventory_List_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Inventory_List.aspx");
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

                    lbl_titel_Add_New_Inventory.Text = Dt.Rows[186]["EN"].ToString();
                    lbl_En_Inventory_Name.Text = Dt.Rows[187]["EN"].ToString();
                    lbl_Ar_Inventory_Name.Text = Dt.Rows[188]["EN"].ToString();
                    lbl_Inventory_Location.Text = Dt.Rows[189]["EN"].ToString();
                    lbl_storekeeper.Text = Dt.Rows[190]["EN"].ToString();
                    btn_Add_Inventory.Text = Dt.Rows[54]["EN"].ToString();
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

                    lbl_titel_Add_New_Inventory.Text = Dt.Rows[186]["AR"].ToString();
                    lbl_En_Inventory_Name.Text = Dt.Rows[187]["AR"].ToString();
                    lbl_Ar_Inventory_Name.Text = Dt.Rows[188]["AR"].ToString();
                    lbl_Inventory_Location.Text = Dt.Rows[189]["AR"].ToString();
                    lbl_storekeeper.Text = Dt.Rows[190]["AR"].ToString();
                    btn_Add_Inventory.Text = Dt.Rows[54]["AR"].ToString();
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