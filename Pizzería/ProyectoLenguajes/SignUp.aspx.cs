using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace ProyectoLenguajes
{
    public partial class SignUp : System.Web.UI.Page
    {
        BussinessLogicLayer logic = new BussinessLogicLayer();

        protected void Page_Load(object sender, EventArgs e)
        {

        }




        private void alert(String message)
        {
            StringBuilder sbMensaje = new StringBuilder();
            sbMensaje.Append("<script type='text/javascript'>");
            sbMensaje.AppendFormat("toastr.success('" + message + "');");
            sbMensaje.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "mensaje", sbMensaje.ToString());
        }

        private void alertError(String message)
        {
            StringBuilder sbMensaje = new StringBuilder();
            sbMensaje.Append("<script type='text/javascript'>");
            sbMensaje.AppendFormat("toastr.warning('" + message + "');");
            sbMensaje.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "mensaje", sbMensaje.ToString());
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (TextBoxfirstName.Text != "" && TextBoxApellido1.Text != "" && TextBoxApellido2.Text != "" && TextBoxAddress.Text != ""
                && TextBoxPassword.Text != "" && TextBoxEmail.Text != "") {
                String firstName = TextBoxfirstName.Text;
                String lastName = TextBoxlastName.Text;
                String lastName1 = TextBoxApellido1.Text;
                String lastName2 = TextBoxApellido2.Text;
                String address = TextBoxAddress.Text;
                String password = TextBoxPassword.Text;
                String email = TextBoxEmail.Text;
                logic.addCustumer(email, firstName, lastName, lastName1, lastName2, address, password);
                clear();
                alert("Se agrego " + firstName + " " + lastName + " Exitosamente");
                Session["client"] = firstName + " " + lastName1;
                Response.Redirect("ClientApp.aspx");
            }
            else
            {
                alertError("Exiaten campos en blanco");
            }
        }

        private void clear() {
            TextBoxfirstName.Text = "";
            TextBoxlastName.Text = "";
            TextBoxApellido1.Text = "";
            TextBoxApellido2.Text = "";
            TextBoxAddress.Text = "";
            TextBoxPassword.Text = "";
            TextBoxEmail.Text = "";
        }

    }
}