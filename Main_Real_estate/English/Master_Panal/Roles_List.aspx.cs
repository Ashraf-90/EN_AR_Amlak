using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Roles_List : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            language();
            try { Helper.GetDataReader("SELECT * FROM roles", _sqlCon, The_Table); }
            catch { Response.Write(@"<script language='javascript'>alert('لا يمكن عرض هذه الصفحة')</script>"); };
        }
        protected void Delete(object sender, EventArgs e)
        {
            string RoleId = (sender as LinkButton).CommandArgument;
            DataTable Dt = new DataTable();
            _sqlCon.Open();
            MySqlCommand Cmd = new MySqlCommand("SELECT Role FROM users WHERE Role = @ID", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Cmd.Parameters.AddWithValue("@ID", RoleId);
            Da.Fill(Dt);
            if (Dt.Rows.Count > 0)
            {
                Response.Write(@"<script language='javascript'>alert('لا يمكن حذف هذه الصلاحية لأنها مستخدمة بالفعل ')</script>");
            }
            else
            {
                try
                {
                    string id = (sender as LinkButton).CommandArgument;
                    string quary1 = "DELETE FROM roles WHERE Role_ID=@ID ";
                    MySqlCommand mySqlCmd = new MySqlCommand(quary1, _sqlCon);
                    mySqlCmd.Parameters.AddWithValue("@ID", id);
                    mySqlCmd.ExecuteNonQuery();
                    Response.Redirect(Request.RawUrl);
                }
                catch
                {
                    Response.Write(@"<script language='javascript'>alert('لا يمكن الحذف')</script>");
                };
            }

            _sqlCon.Close();





        }
        protected void Edit(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Edit_Role.aspx?Id=" + id);
        }
        protected void GoToAdd(object sender, EventArgs e)
        {
            Response.Redirect("Add_Role.aspx");
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
                Label lbl_7 = (e.Item.FindControl("lbl_7") as Label);
                Label lbl_8 = (e.Item.FindControl("lbl_8") as Label);
                Label lbl_9 = (e.Item.FindControl("lbl_9") as Label);
                Label lbl_10 = (e.Item.FindControl("lbl_10") as Label);
                Label lbl_11 = (e.Item.FindControl("lbl_11") as Label);

                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_master", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_1.Text = Dt.Rows[233]["EN"].ToString();
                        lbl_2.Text = Dt.Rows[239]["EN"].ToString();
                        lbl_3.Text = Dt.Rows[240]["EN"].ToString();
                        lbl_4.Text = Dt.Rows[241]["EN"].ToString();
                        lbl_5.Text = Dt.Rows[242]["EN"].ToString();
                        lbl_6.Text = Dt.Rows[243]["EN"].ToString();
                        lbl_7.Text = Dt.Rows[244]["EN"].ToString();
                        lbl_8.Text = Dt.Rows[245]["EN"].ToString();
                        lbl_9.Text = Dt.Rows[246]["EN"].ToString();
                        lbl_10.Text = Dt.Rows[247]["EN"].ToString();
                        lbl_11.Text = Dt.Rows[248]["EN"].ToString();
                    }
                    else
                    {
                        lbl_1.Text = Dt.Rows[233]["AR"].ToString();
                        lbl_2.Text = Dt.Rows[239]["AR"].ToString();
                        lbl_3.Text = Dt.Rows[240]["AR"].ToString();
                        lbl_4.Text = Dt.Rows[241]["AR"].ToString();
                        lbl_5.Text = Dt.Rows[242]["AR"].ToString();
                        lbl_6.Text = Dt.Rows[243]["AR"].ToString();
                        lbl_7.Text = Dt.Rows[244]["AR"].ToString();
                        lbl_8.Text = Dt.Rows[245]["AR"].ToString();
                        lbl_9.Text = Dt.Rows[246]["AR"].ToString();
                        lbl_10.Text = Dt.Rows[247]["AR"].ToString();
                        lbl_11.Text = Dt.Rows[248]["AR"].ToString();
                    }
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
                    lbl_titel.Text = Dt.Rows[307]["EN"].ToString();
                    ADD.Text = Dt.Rows[54]["EN"].ToString();
                }
                else
                {
                    lbl_titel.Text = Dt.Rows[307]["AR"].ToString();
                    ADD.Text = Dt.Rows[54]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}