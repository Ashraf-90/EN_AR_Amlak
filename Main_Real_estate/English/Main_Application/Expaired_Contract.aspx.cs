using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.X509;
using Syncfusion.JavaScript.Models;
using System;
using System.Data;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Main_Real_estate.English.Main_Application
{
    public partial class Expaired_Contract : System.Web.UI.Page
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataAll();
        }
        protected void BindDataAll(string sortExpression = null)
        {
            try
            {
                using (MySqlCommand cmd = new MySqlCommand("All_Contract_List", _sqlCon))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        Repeater1.DataSource = dt;
                        Repeater1.DataBind();
                    }
                }
            }
            catch
            {
                Response.Write(
                    @"<script language='javascript'>alert('OOPS!!! The Contract List Cannt Display')</script>");
            }
        }

        protected void contract_List_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label EndDate = null;
            Label New_ReNewed_Expaired = null;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlTableRow tr = e.Item.FindControl("row") as HtmlTableRow;
                LinkButton ReNew_btn = (e.Item.FindControl("U_Renew") as LinkButton);
                LinkButton U_delete = (e.Item.FindControl("U_delete") as LinkButton);
                LinkButton U_details = (e.Item.FindControl("U_details") as LinkButton);
                Label lbl_Done_Renew = (e.Item.FindControl("lbl_Done_Renew") as Label);
                EndDate = e.Item.FindControl("lbl_End_Date") as Label;
                New_ReNewed_Expaired = e.Item.FindControl("lbl_New_ReNewed_Expaired") as Label;

                string[] Array_End_Date = EndDate.Text.Split(new char[] { '/' });
                var prevDate = new DateTime(Convert.ToInt32(Array_End_Date[2]), Convert.ToInt32(Array_End_Date[1]), Convert.ToInt32(Array_End_Date[0]));
                var today = DateTime.Now;
                var diffOfDates = prevDate - today;
                int sub = diffOfDates.Days;



                if (diffOfDates.Days <= 60 && New_ReNewed_Expaired.Text == "1")
                {
                    ReNew_btn.Visible = true;
                }
                else if (diffOfDates.Days <= 60 && New_ReNewed_Expaired.Text == "2")
                {
                    ReNew_btn.Visible = false;
                }

                if (diffOfDates.Days > 60)
                {
                    tr.Attributes.Add("style", "background-color:#c5f8eb;color:#000000;");
                    tr.Visible = false;
                }
                else if (diffOfDates.Days <= 60 && diffOfDates.Days >= 0)
                {
                    tr.Attributes.Add("style", "background-color:#faced2;color:#000000;");
                }
                else if (diffOfDates.Days <= 0)
                {
                    tr.Attributes.Add("style", "background-color:#cbd0d8;color:#000000;");
                    tr.Visible = false;
                }
            }




            try
            {
                DataTable Dt = new DataTable();
                _sqlCon.Open();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM roles WHERE Role_ID = @ID", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Cmd.Parameters.AddWithValue("@ID", Session["Role"].ToString());
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    string[] Page = Dt.Rows[0]["Contracting"].ToString().Split(',');
                    if (Page[2] != "E")
                    {
                        if (e.Item.ItemType == ListItemType.Header)
                        {
                            var H_One = e.Item.FindControl("H_One") as HtmlTableCell;
                            H_One.Visible = false;
                        }
                        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                        {
                            var B_One = e.Item.FindControl("B_One") as HtmlTableCell;
                            B_One.Visible = false;
                        }
                    }
                }
                _sqlCon.Close();
            }
            catch
            {
                Response.Redirect("Log_In.aspx");
            }





            if (e.Item.ItemType == ListItemType.Header)
            {
                var lbl_Contract_NO = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Contract_NO");
                var lbl_Zone = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Zone");
                var lbl_Code = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Code");
                var lbl_Property = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Property");
                var lbl_Item = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Item");
                var lbl_Tenant = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenant");
                var lbl_Nationality = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Nationality");
                var lbl_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Type");
                var lbl_Years = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Years");
                var lbl_Amount = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Amount");
                var lbl_Start = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Start");
                var lbl_End = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_End");



                DataTable Dt = new DataTable();
                MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_contract", _sqlCon);
                MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
                Da.Fill(Dt);
                if (Dt.Rows.Count > 0)
                {
                    if (Session["Langues"].ToString() == "1")
                    {
                        lbl_Contract_NO.Text = Dt.Rows[53]["EN"].ToString();
                        lbl_Zone.Text = Dt.Rows[54]["EN"].ToString();
                        lbl_Code.Text = Dt.Rows[67]["EN"].ToString();
                        lbl_Property.Text = Dt.Rows[4]["EN"].ToString();
                        lbl_Item.Text = "Rented Item"; ;
                        lbl_Tenant.Text = Dt.Rows[2]["EN"].ToString();
                        lbl_Nationality.Text = Dt.Rows[56]["EN"].ToString();
                        lbl_Type.Text = Dt.Rows[1]["EN"].ToString();
                        lbl_Years.Text = Dt.Rows[57]["EN"].ToString();
                        lbl_Amount.Text = Dt.Rows[58]["EN"].ToString();
                        lbl_Start.Text = Dt.Rows[10]["EN"].ToString();
                        lbl_End.Text = Dt.Rows[11]["EN"].ToString();
                    }
                    else
                    {
                        lbl_Contract_NO.Text = Dt.Rows[53]["AR"].ToString();
                        lbl_Zone.Text = Dt.Rows[54]["AR"].ToString();
                        lbl_Code.Text = Dt.Rows[67]["AR"].ToString();
                        lbl_Property.Text = Dt.Rows[4]["AR"].ToString();
                        lbl_Item.Text = "العنصر المؤجر"; ;
                        lbl_Tenant.Text = Dt.Rows[2]["AR"].ToString();
                        lbl_Nationality.Text = Dt.Rows[56]["AR"].ToString();
                        lbl_Type.Text = Dt.Rows[1]["AR"].ToString();
                        lbl_Years.Text = Dt.Rows[57]["AR"].ToString();
                        lbl_Amount.Text = Dt.Rows[58]["AR"].ToString();
                        lbl_Start.Text = Dt.Rows[10]["AR"].ToString();
                        lbl_End.Text = Dt.Rows[11]["AR"].ToString();
                    }
                }
                _sqlCon.Close();
            }


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lbl_zone_arabic_name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_zone_arabic_name");
                var lbl_zone_English_name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_zone_English_name");
                var lbl_Owner_Ship_AR_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_AR_Name");
                var lbl_Owner_Ship_EN_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Owner_Ship_EN_Name");
                var lbl_Tenants_Arabic_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_Arabic_Name");
                var lbl_Tenants_English_Name = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Tenants_English_Name");
                var lbl_Arabic_nationality = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Arabic_nationality");
                var lbl_English_nationality = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_English_nationality");
                var lbl_Contract_Arabic_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Contract_Arabic_Type");
                var lbl_Contract_English_Type = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_Contract_English_Type");

                var lbl_AR_Unit_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_AR_Unit_Number");
                var lbl_EN_Unit_Number = (System.Web.UI.WebControls.Label)e.Item.FindControl("lbl_EN_Unit_Number");


                if (Session["Langues"].ToString() == "1")
                {
                    lbl_zone_arabic_name.Visible= false; lbl_zone_English_name.Visible= true;
                    lbl_Owner_Ship_AR_Name.Visible = false; lbl_Owner_Ship_EN_Name.Visible = true;
                    lbl_Tenants_Arabic_Name.Visible = false; lbl_Tenants_English_Name.Visible = true;
                    lbl_Arabic_nationality.Visible = false; lbl_English_nationality.Visible = true;
                    lbl_Contract_Arabic_Type.Visible = false; lbl_Contract_English_Type.Visible = true;
                    lbl_AR_Unit_Number.Visible = false; lbl_EN_Unit_Number.Visible = true;
                }
                else
                {
                    lbl_zone_arabic_name.Visible = true; lbl_zone_English_name.Visible = false;
                    lbl_Owner_Ship_AR_Name.Visible = true; lbl_Owner_Ship_EN_Name.Visible = false;
                    lbl_Tenants_Arabic_Name.Visible = true; lbl_Tenants_English_Name.Visible = false;
                    lbl_Arabic_nationality.Visible = true; lbl_English_nationality.Visible = false;
                    lbl_Contract_Arabic_Type.Visible = true; lbl_Contract_English_Type.Visible = false;
                    lbl_AR_Unit_Number.Visible = true; lbl_EN_Unit_Number.Visible = false;
                }



            }
        }

        protected void U_Edit_Click(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            string[] Array_id = id.Split('/');
            if (Array_id[0] == "U") { Response.Redirect("Edit_Contract.aspx?Id=" + Array_id[1]); }
            else { Response.Redirect("Edit_Building_Contract.aspx?Id=" + Array_id[1]); }
        }
        protected void U_Renew_Click(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            string[] Array_id = id.Split('/');
            if (Array_id[0] == "U") { Response.Redirect("Renew_Contract.aspx?Id=" + Array_id[1]); }
            else { Response.Redirect("Renew_Building_Contract.aspx?Id=" + Array_id[1]); }
        }
        protected void Contract_NO_Click(object sender, EventArgs e)
        {
            string id = (sender as LinkButton).CommandArgument;
            string[] Array_id = id.Split('/');
            if (Array_id[0] == "U") { Response.Redirect("Contract_Details.aspx?Id=" + Array_id[1]); }
            else { Response.Redirect("Building_Contract_Details.aspx?Id=" + Array_id[1]); }
        }
    }
}