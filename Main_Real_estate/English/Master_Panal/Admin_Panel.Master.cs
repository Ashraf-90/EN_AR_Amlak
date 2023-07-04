using Main_Real_estate.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Main_Real_estate.English.Master_Panal
{
    public partial class Admin_Panel : System.Web.UI.MasterPage
    {
        private readonly MySqlConnection _sqlCon = Helper.GetConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //try { language(); }
                //catch { Response.Redirect("~/English/Main_Application/Log_In.aspx"); }
                language();
            }

            if (Session["Users_Name"] != null)
            {
                Label1.Text = Session["Users_Name"].ToString();
            }
            else
            {
                Response.Redirect("~/English/Main_Application/Log_In.aspx");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/English/Main_Application/Log_In.aspx");
        }






        protected void language()
        {
            if (Session["Langues"] == null) { Session["Langues"] = "1"; }

            _sqlCon.Open();
            DataTable Dt = new DataTable();
            MySqlCommand Cmd = new MySqlCommand("SELECT * FROM languages_master", _sqlCon);
            MySqlDataAdapter Da = new MySqlDataAdapter(Cmd);
            Da.Fill(Dt);
            if (Session["Langues"].ToString() == "1")
            {
                html.Attributes.Add("dir", "ltr");
                link1.Href = "../CSS/all.min.css";
                link2.Href = "../CSS/bootstrap.min.css";
                link3.Href = "../CSS/ruang-admin.min.css";
                Lan.SelectedValue = "1";
                language_logo.ImageUrl = "../Main_Application/Main_Image/EN_Logo.png";

                Label2.Text = Dt.Rows[0]["EN"].ToString();
                Label3.Text = Dt.Rows[1]["EN"].ToString();
                Label4.Text = Dt.Rows[2]["EN"].ToString();
                Label5.Text = Dt.Rows[3]["EN"].ToString();
                Label6.Text = Dt.Rows[4]["EN"].ToString();
                Label7.Text = Dt.Rows[5]["EN"].ToString();
                Label8.Text = Dt.Rows[6]["EN"].ToString();
                Label9.Text = Dt.Rows[7]["EN"].ToString();
                Label10.Text = Dt.Rows[8]["EN"].ToString();
                Label11.Text = Dt.Rows[9]["EN"].ToString();
                Label12.Text = Dt.Rows[10]["EN"].ToString();
                Label13.Text = Dt.Rows[11]["EN"].ToString();
                Label14.Text = Dt.Rows[12]["EN"].ToString();
                Label15.Text = Dt.Rows[13]["EN"].ToString();
                Label16.Text = Dt.Rows[14]["EN"].ToString();
                Label17.Text = Dt.Rows[15]["EN"].ToString();
                Label18.Text = Dt.Rows[16]["EN"].ToString();
                Label19.Text = Dt.Rows[17]["EN"].ToString();
                Label20.Text = Dt.Rows[18]["EN"].ToString();
                Label21.Text = Dt.Rows[19]["EN"].ToString();
                Label22.Text = Dt.Rows[20]["EN"].ToString();
                Label23.Text = Dt.Rows[21]["EN"].ToString();
                Label24.Text = Dt.Rows[22]["EN"].ToString();
                Label25.Text = Dt.Rows[23]["EN"].ToString();
                Label26.Text = Dt.Rows[24]["EN"].ToString();
                Label27.Text = Dt.Rows[25]["EN"].ToString();
                Label28.Text = Dt.Rows[26]["EN"].ToString();
                Label29.Text = Dt.Rows[27]["EN"].ToString();
                Label30.Text = Dt.Rows[28]["EN"].ToString();
                Label31.Text = Dt.Rows[29]["EN"].ToString();
                Label32.Text = Dt.Rows[30]["EN"].ToString();
                Label33.Text = Dt.Rows[31]["EN"].ToString();
                Label34.Text = Dt.Rows[42]["EN"].ToString();
                Label35.Text = Dt.Rows[32]["EN"].ToString();
                Label36.Text = Dt.Rows[33]["EN"].ToString();
                Label37.Text = Dt.Rows[34]["EN"].ToString();
                Label38.Text = Dt.Rows[43]["EN"].ToString();
                Label39.Text = Dt.Rows[35]["EN"].ToString();
                Label40.Text = Dt.Rows[36]["EN"].ToString();
                Label41.Text = Dt.Rows[37]["EN"].ToString();
                Label42.Text = Dt.Rows[38]["EN"].ToString();
                Label43.Text = Dt.Rows[39]["EN"].ToString();
                Label44.Text = Dt.Rows[40]["EN"].ToString();
                Label45.Text = Dt.Rows[41]["EN"].ToString();

            }
            else
            {
                html.Attributes.Add("dir", "rtl");
                link1.Href = "../CSS/all-rtl.min.css";
                link2.Href = "../CSS/bootstrap-rtl.min.css";
                link3.Href = "../CSS/ruang-admin-rtl.min.css";
                Lan.SelectedValue = "2";
                language_logo.ImageUrl = "../Main_Application/Main_Image/AR_Logo.png";

                Label2.Text = Dt.Rows[0]["AR"].ToString();
                Label3.Text = Dt.Rows[1]["AR"].ToString();
                Label4.Text = Dt.Rows[2]["AR"].ToString();
                Label5.Text = Dt.Rows[3]["AR"].ToString();
                Label6.Text = Dt.Rows[4]["AR"].ToString();
                Label7.Text = Dt.Rows[5]["AR"].ToString();
                Label8.Text = Dt.Rows[6]["AR"].ToString();
                Label9.Text = Dt.Rows[7]["AR"].ToString();
                Label10.Text = Dt.Rows[8]["AR"].ToString();
                Label11.Text = Dt.Rows[9]["AR"].ToString();
                Label12.Text = Dt.Rows[10]["AR"].ToString();
                Label13.Text = Dt.Rows[11]["AR"].ToString();
                Label14.Text = Dt.Rows[12]["AR"].ToString();
                Label15.Text = Dt.Rows[13]["AR"].ToString();
                Label16.Text = Dt.Rows[14]["AR"].ToString();
                Label17.Text = Dt.Rows[15]["AR"].ToString();
                Label18.Text = Dt.Rows[16]["AR"].ToString();
                Label19.Text = Dt.Rows[17]["AR"].ToString();
                Label20.Text = Dt.Rows[18]["AR"].ToString();
                Label21.Text = Dt.Rows[19]["AR"].ToString();
                Label22.Text = Dt.Rows[20]["AR"].ToString();
                Label23.Text = Dt.Rows[21]["AR"].ToString();
                Label24.Text = Dt.Rows[22]["AR"].ToString();
                Label25.Text = Dt.Rows[23]["AR"].ToString();
                Label26.Text = Dt.Rows[24]["AR"].ToString();
                Label27.Text = Dt.Rows[25]["AR"].ToString();
                Label28.Text = Dt.Rows[26]["AR"].ToString();
                Label29.Text = Dt.Rows[27]["AR"].ToString();
                Label30.Text = Dt.Rows[28]["AR"].ToString();
                Label31.Text = Dt.Rows[29]["AR"].ToString();
                Label32.Text = Dt.Rows[30]["AR"].ToString();
                Label33.Text = Dt.Rows[31]["AR"].ToString();
                Label34.Text = Dt.Rows[42]["AR"].ToString();
                Label35.Text = Dt.Rows[32]["AR"].ToString();
                Label36.Text = Dt.Rows[33]["AR"].ToString();
                Label37.Text = Dt.Rows[34]["AR"].ToString();
                Label38.Text = Dt.Rows[43]["AR"].ToString();
                Label39.Text = Dt.Rows[35]["AR"].ToString();
                Label40.Text = Dt.Rows[36]["AR"].ToString();
                Label41.Text = Dt.Rows[37]["AR"].ToString();
                Label42.Text = Dt.Rows[38]["AR"].ToString();
                Label43.Text = Dt.Rows[39]["AR"].ToString();
                Label44.Text = Dt.Rows[40]["AR"].ToString();
                Label45.Text = Dt.Rows[41]["AR"].ToString();
            }
            _sqlCon.Close();
        }

        protected void Lan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Lan.SelectedValue == "1") { Session["Langues"] = "1"; }
            else { Session["Langues"] = "2"; }
             Response.Redirect(Request.RawUrl); 
        }
    }
}