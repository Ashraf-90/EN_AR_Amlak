using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Owner_List : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            language();
            try  { Helper.GetDataReader("SELECT * FROM owner", _sqlCon, The_Table); }
            catch {  Response.Write(@"<script language='javascript'>alert('لا يمكن عرض هذه الصفحة')</script>"); };
        }


        protected void Delete(object sender, EventArgs e)
        {
            try
            {
                string id = (sender as LinkButton).CommandArgument;
                _sqlCon.Open();
                string quary1 = "DELETE FROM owner WHERE Owner_Id=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(quary1, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", id);
                mySqlCmd.ExecuteNonQuery();
                _sqlCon.Close();
                Response.Redirect(Request.RawUrl);
            }
            catch
            {
                Response.Write(  @"<script language='javascript'>alert('This Owner cannot be deleted because he owns Ownerships')</script>");
            } ;
        }
        protected void Edit(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Edit_Owner.aspx?Id=" + id);
        }
        protected void Go_To_Add_Owner(object sender, EventArgs e)
        {
            Response.Redirect("Add_Owner.aspx");
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
                
                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_master", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_1.Text = "Owner Name";
                        lbl_2.Text = Dt.Rows[47]["EN"].ToString();
                        lbl_3.Text = Dt.Rows[51]["EN"].ToString();
                        lbl_4.Text = Dt.Rows[50]["EN"].ToString();
                        lbl_5.Text = Dt.Rows[49]["EN"].ToString();
                    }
                    else
                    {
                        lbl_1.Text = "اسم المالك";
                        lbl_2.Text = Dt.Rows[47]["AR"].ToString();
                        lbl_3.Text = Dt.Rows[51]["AR"].ToString();
                        lbl_4.Text = Dt.Rows[50]["AR"].ToString();
                        lbl_5.Text = Dt.Rows[49]["AR"].ToString();
                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl_Owner_Arabic_name = (e.Item.FindControl("lbl_Owner_Arabic_name") as Label);
                Label lbl_Owner_English_name = (e.Item.FindControl("lbl_Owner_English_name") as Label);
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Owner_Arabic_name.Visible= false; lbl_Owner_English_name.Visible = true;
                }
                else
                {
                    lbl_Owner_Arabic_name.Visible = true; lbl_Owner_English_name.Visible = false;
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
                    lbl_titel.Text = Dt.Rows[261]["EN"].ToString();
                    ADD.Text = Dt.Rows[54]["EN"].ToString();
                }
                else
                {
                    lbl_titel.Text = Dt.Rows[261]["AR"].ToString();
                    ADD.Text = Dt.Rows[54]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}