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
    public partial class Login : System.Web.UI.Page
    {

        private String email = "";
        private String password = "";
        private BussinessLogicLayer bll = new BussinessLogicLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["client"] != null)
            {

                Session.Remove("client");
                Response.Redirect("Login.aspx");

            }
            else if (Session["admin"] != null)
            {

                Session.Remove("admin");
                Response.Redirect("Login.aspx");

            }
            else if (Session["chef"] != null)
            {

                Session.Remove("chef");
                Response.Redirect("Login.aspx");

            }

        }

        private void getData() {
            email = TextBoxEmail.Text;
            password = TextBoxPassword.Text;

        }

        private void alert(String message)
        {
            StringBuilder sbMensaje = new StringBuilder();
            sbMensaje.Append("<script type='text/javascript'>");
            sbMensaje.AppendFormat("toastr.warning('"+ message + "');");
            sbMensaje.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "mensaje", sbMensaje.ToString());
        }

        protected void ButtonLoggin_Click(object sender, EventArgs e)
        {
            try
            {
                getData();

               
                    String name = bll.authenticateName(email);

                    switch (bll.authenticate(email, password))
                    {

                        case 0:
                            alert("Correo o Contraseña Erroneo");
                            break;
                        case 1:

                            Session["admin"] = name;
                            Response.Redirect("AdminMenu.aspx");
                            break;
                        case 2:

                            Session["client"] = name + " / " + email;
                            Response.Redirect("ClientApp.aspx");
                            break;
                        case 3:

                            Session["chef"] = name;
                            Response.Redirect("KitchenMenu.aspx");
                            break;
                        default:
                            alert("Correo o Contraseña Erroneo");
                            break;

                    }

                
            } catch (Exception ex) {
                alert("Ingrese Correo y Contraseña");
            }
        }
    }
}