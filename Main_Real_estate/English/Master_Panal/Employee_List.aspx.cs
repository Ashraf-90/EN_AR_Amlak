using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Employee_List : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            language();
            Employee_BindData();
        }

        protected void Employee_BindData()
        {
            _sqlCon.Open();
            MySqlCommand employeeListCmd = new MySqlCommand("Employee_GridView", _sqlCon);
            employeeListCmd.CommandType = CommandType.StoredProcedure;
            MySqlDataAdapter employeeListDa = new MySqlDataAdapter(employeeListCmd);
            DataTable employeeListDt = new DataTable();
            employeeListDa.Fill(employeeListDt);
            The_Table.DataSource = employeeListDt;
            The_Table.DataBind();
            _sqlCon.Close();
        }

        protected void Delete(object sender, EventArgs e)
        {
            try
            {
                string id = (sender as LinkButton).CommandArgument;
                _sqlCon.Open();
                string quary1 = "DELETE FROM employee WHERE Employee_Id=@ID ";
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
        protected void Edit(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Edit_Employee.aspx?Id=" + id);
        }
        protected void GoToAdd(object sender, EventArgs e)
        {
            Response.Redirect("Add_Employee.aspx");
        }

        protected void The_Table_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (Session["Langues"] == null) { Session["Langues"] = "1"; }
            if (e.Item.ItemType == ListItemType.Header)
            {
                Label lbl_1 = (e.Item.FindControl("lbl_1") as Label);
                Label lbl_2 = (e.Item.FindControl("lbl_2") as Label);
                Label lbl_3 = (e.Item.FindControl("lbl_3") as Label);
                Label lbl_4 = (e.Item.FindControl("lbl_4") as Label);
                Label lbl_5 = (e.Item.FindControl("lbl_5") as Label);
                Label lbl_6 = (e.Item.FindControl("lbl_6") as Label);

                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_master", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_1.Text = Dt.Rows[304]["EN"].ToString();
                        lbl_2.Text = Dt.Rows[50]["EN"].ToString();
                        lbl_3.Text = Dt.Rows[216]["EN"].ToString();
                        lbl_4.Text = Dt.Rows[217]["EN"].ToString();
                        lbl_5.Text = Dt.Rows[218]["EN"].ToString();
                        lbl_6.Text = Dt.Rows[219]["EN"].ToString();
                    }
                    else
                    {
                        lbl_1.Text = Dt.Rows[304]["AR"].ToString();
                        lbl_2.Text = Dt.Rows[50]["AR"].ToString();
                        lbl_3.Text = Dt.Rows[216]["AR"].ToString();
                        lbl_4.Text = Dt.Rows[217]["AR"].ToString();
                        lbl_5.Text = Dt.Rows[218]["AR"].ToString();
                        lbl_6.Text = Dt.Rows[219]["AR"].ToString();
                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl_Employee_Arabic_name = (e.Item.FindControl("lbl_Employee_Arabic_name") as Label);
                Label lbl_Employee_English_name = (e.Item.FindControl("lbl_Employee_English_name") as Label);
                Label lbl_Department_Arabic_Name = (e.Item.FindControl("lbl_Department_Arabic_Name") as Label);
                Label lbl_Department_English_Name = (e.Item.FindControl("lbl_Department_English_Name") as Label);
                Label lbl_Employee_Arabic_Level = (e.Item.FindControl("lbl_Employee_Arabic_Level") as Label);
                Label lbl_Employee_English_Level = (e.Item.FindControl("lbl_Employee_English_Level") as Label);

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Employee_Arabic_name.Visible = false; lbl_Employee_English_name.Visible = true;
                    lbl_Department_Arabic_Name.Visible = false; lbl_Department_English_Name.Visible = true;
                    lbl_Employee_Arabic_Level.Visible = false; lbl_Employee_English_Level.Visible = true;
                }
                else
                {
                    lbl_Employee_Arabic_name.Visible = true; lbl_Employee_English_name.Visible = false;
                    lbl_Department_Arabic_Name.Visible = true; lbl_Department_English_Name.Visible = false;
                    lbl_Employee_Arabic_Level.Visible = true; lbl_Employee_English_Level.Visible = false;
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
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_master", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_titel.Text = Dt.Rows[305]["EN"].ToString();
                    ADD.Text = Dt.Rows[54]["EN"].ToString();
                }
                else
                {
                    lbl_titel.Text = Dt.Rows[305]["AR"].ToString();
                    ADD.Text = Dt.Rows[54]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}