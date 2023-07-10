using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Web.UI.WebControls;
using Ubiety.Dns.Core;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class transformation_Bank_List : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            language();
            Get_Bank_BindData();
        }

        protected void Get_Bank_BindData()
        {
            try
            {
                string getBankQuari = "SELECT * FROM transformation_bank";
                MySqlCommand getBankCmd = new MySqlCommand(getBankQuari, _sqlCon);
                MySqlDataAdapter getBankDt = new MySqlDataAdapter(getBankCmd);
                getBankCmd.Connection = _sqlCon;
                _sqlCon.Open();
                getBankDt.SelectCommand = getBankCmd;
                DataTable getBankDataTable = new DataTable();
                getBankDt.Fill(getBankDataTable);
                The_Table.DataSource = getBankDataTable;
                The_Table.DataBind();
                _sqlCon.Close();
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_Bank_Delete_Click(object sender, EventArgs e)
        {
            try
            {
                string bankRowId = (sender as LinkButton).CommandArgument;
                _sqlCon.Open();
                string deleteBankQuary = "DELETE FROM transformation_bank WHERE transformation_Bank_ID=@ID ";
                MySqlCommand mySqlCmd = new MySqlCommand(deleteBankQuary, _sqlCon);
                mySqlCmd.Parameters.AddWithValue("@ID", bankRowId);
                mySqlCmd.ExecuteNonQuery();
                _sqlCon.Close();
                Response.Redirect(Request.RawUrl);
             }
            catch
            {
                Response.Write(@"<script language='javascript'>alert('هذا البنك مرتبط بحولات مالية')</script>");
            };
        }
        protected void Edit(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            Response.Redirect("Edit_transformation_Bank.aspx?Id=" + id);
        }

        protected void GoToAddBank()
        {
            Response.Redirect("Edit_transformation_Bank.aspx");
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Add_transformation_Bank.aspx");
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

                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_master", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_1.Text = Dt.Rows[303]["EN"].ToString();
                        lbl_2.Text = Dt.Rows[297]["EN"].ToString();
                        lbl_3.Text = Dt.Rows[298]["EN"].ToString();
                        lbl_4.Text = Dt.Rows[299]["EN"].ToString();
                        lbl_5.Text = Dt.Rows[300]["EN"].ToString();
                        lbl_6.Text = Dt.Rows[301]["EN"].ToString();
                        lbl_7.Text = Dt.Rows[302]["EN"].ToString();
                    }
                    else
                    {
                        lbl_1.Text = Dt.Rows[303]["AR"].ToString();
                        lbl_2.Text = Dt.Rows[297]["AR"].ToString();
                        lbl_3.Text = Dt.Rows[298]["AR"].ToString();
                        lbl_4.Text = Dt.Rows[299]["AR"].ToString();
                        lbl_5.Text = Dt.Rows[300]["AR"].ToString();
                        lbl_6.Text = Dt.Rows[301]["AR"].ToString();
                        lbl_7.Text = Dt.Rows[302]["AR"].ToString();
                    }
                }
            }

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lbl_AR_Bank_Name = (e.Item.FindControl("lbl_AR_Bank_Name") as Label);
                Label lbl_EN_Bank_Name = (e.Item.FindControl("lbl_EN_Bank_Name") as Label);
                Label lbl_AR_Bank_Adress = (e.Item.FindControl("lbl_AR_Bank_Adress") as Label);
                Label lbl_EN_Bank_Adress = (e.Item.FindControl("lbl_EN_Bank_Adress") as Label);
                Label lbl_AR_currency_type = (e.Item.FindControl("lbl_AR_currency_type") as Label);
                Label lbl_EN_currency_type = (e.Item.FindControl("lbl_EN_currency_type") as Label);
                Label lbl_AR_Beneficiary_Name = (e.Item.FindControl("lbl_AR_Beneficiary_Name") as Label);
                Label lbl_EN_Beneficiary_Name = (e.Item.FindControl("lbl_EN_Beneficiary_Name") as Label);

                if (Session["Langues"].ToString() == "1")
                {
                    lbl_AR_Bank_Name.Visible = false; lbl_EN_Bank_Name.Visible = true;
                    lbl_AR_Bank_Adress.Visible = false; lbl_EN_Bank_Adress.Visible = true;
                    lbl_AR_currency_type.Visible = false; lbl_EN_currency_type.Visible = true;
                    lbl_AR_Beneficiary_Name.Visible = false; lbl_EN_Beneficiary_Name.Visible = true;
                }
                else
                {
                    lbl_AR_Bank_Name.Visible = true; lbl_EN_Bank_Name.Visible = false;
                    lbl_AR_Bank_Adress.Visible = true; lbl_EN_Bank_Adress.Visible = false;
                    lbl_AR_currency_type.Visible = true; lbl_EN_currency_type.Visible = false;
                    lbl_AR_Beneficiary_Name.Visible = true; lbl_EN_Beneficiary_Name.Visible = false;
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
                    lbl_titel.Text = Dt.Rows[296]["EN"].ToString();
                    ADD.Text = Dt.Rows[54]["EN"].ToString();
                }
                else
                {
                    lbl_titel.Text = Dt.Rows[296]["AR"].ToString();
                    ADD.Text = Dt.Rows[54]["AR"].ToString();
                }
            }
            _sqlCon.Close();

        }
    }
}