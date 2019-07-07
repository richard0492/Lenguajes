using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace ProyectoLenguajes
{
    public partial class ClientInformation : System.Web.UI.Page
    {
        private BussinessLogicLayer bll = new BussinessLogicLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void loadTextBox() {
            List<string> list = bll.searchPartyClientByEmail(Session["UserEmail"].ToString());

            TextBoxfirstName.Text = list[0].ToString();
            TextBoxlastName.Text = list[1].ToString();
            TextBoxApellido1.Text = list[2].ToString();
            TextBoxApellido2.Text = list[3].ToString();
            TextBoxAddress.Text = list[4].ToString();
            TextBoxPassword.Text = list[5].ToString();
        }

        private void getDataToModify() {
            String fname = TextBoxfirstName.Text;
            String sname = TextBoxlastName.Text;
            String fLastName = TextBoxApellido1.Text;
            String sLastName = TextBoxApellido2.Text;
            String address = TextBoxAddress.Text;
            String password = TextBoxPassword.Text;
            
            bll.updateClientInformation(Session["UserEmail"].ToString(), fname,sname,fLastName,sLastName, address,password);
            alert("La informacion se modifico con exito");
        }

        private void alert(String message)
        {
            string script = @"<script type='text/javascript'>
                            alert(' " + message + "'); </script>";
            script = string.Format(script);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClientApp.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getDataToModify();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            loadTextBox();
        }
    }
}