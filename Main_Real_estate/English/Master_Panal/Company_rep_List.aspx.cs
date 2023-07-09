using System;
using Main_Real_estate.Utilities;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Company_rep_List : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                language();
                BindData();
            }
        }

        protected void BindData(string sortExpression = null)
        {
            try
            {
                using (MySqlCommand cmd = new MySqlCommand("Company_Rep_List", _sqlCon))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        eeeee.DataSource = dt;
                        eeeee.DataBind();
                    }
                }
            }
            catch { Response.Write(@"<script language='javascript'>alert('لايمكن عرض قائمة ممثلي الشركات')</script>"); }
        }




        protected void Delete_Unit(object sender, EventArgs e)
        {
            try
            {
                string id = (sender as LinkButton).CommandArgument;
                _sqlCon.Open();
                string quary1 = "DELETE FROM company_representative WHERE Company_representative_Id=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(quary1, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", id);
                mySqlCmd.ExecuteNonQuery();
                _sqlCon.Close();

                Response.Redirect(Request.RawUrl);
            }
            catch
            {
                Response.Write(@"<script language='javascript'>alert('لا يمكن حذف هذا الممثل ')</script>");
            }
        }
        protected void Edit_Unit(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Edit_Company_Rep.aspx?Id=" + id);
        }
        protected void Details_Unit(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Com_Rep_Details.aspx?Id=" + id);
        }

        protected void eeeee_ItemDataBound(object sender, RepeaterItemEventArgs e)
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
                        lbl_1.Text = "Name";
                        lbl_2.Text = Dt.Rows[96]["EN"].ToString();
                        lbl_3.Text = Dt.Rows[50]["EN"].ToString();
                        lbl_4.Text = Dt.Rows[51]["EN"].ToString();
                        lbl_5.Text = Dt.Rows[98]["EN"].ToString();
                    }
                    else
                    {
                        lbl_1.Text = "الاسم";
                        lbl_2.Text = Dt.Rows[96]["AR"].ToString();
                        lbl_3.Text = Dt.Rows[50]["AR"].ToString();
                        lbl_4.Text = Dt.Rows[51]["AR"].ToString();
                        lbl_5.Text = Dt.Rows[98]["AR"].ToString();
                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl_Com_rep_AR_Name = (e.Item.FindControl("lbl_Com_rep_AR_Name") as Label);
                Label lbl_Com_rep_En_Name = (e.Item.FindControl("lbl_Com_rep_En_Name") as Label);
                Label lbl_Arabic_nationality = (e.Item.FindControl("lbl_Arabic_nationality") as Label);
                Label lbl_English_nationality = (e.Item.FindControl("lbl_English_nationality") as Label);
                if (Session["Langues"].ToString() == "1")
                {
                    lbl_Com_rep_AR_Name.Visible = false; lbl_Com_rep_En_Name.Visible = true;
                    lbl_Arabic_nationality.Visible = false; lbl_English_nationality.Visible = true;
                }
                else
                {
                    lbl_Com_rep_AR_Name.Visible = true; lbl_Com_rep_En_Name.Visible = false;
                    lbl_Arabic_nationality.Visible = true; lbl_English_nationality.Visible = false;
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
                    lbl_titel.Text = Dt.Rows[269]["EN"].ToString();
                    ADD.Text = Dt.Rows[54]["EN"].ToString();
                }
                else
                {
                    lbl_titel.Text = Dt.Rows[269]["AR"].ToString();
                    ADD.Text = Dt.Rows[54]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}