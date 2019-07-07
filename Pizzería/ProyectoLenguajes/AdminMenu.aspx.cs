using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoLenguajes
{
    public partial class AdminMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {


                if (Session["admin"] != null)
                {
                        alert("Bienvenido " + Session["admin"].ToString());
                    namelb.Text = Session["admin"].ToString();

                }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }
                
            }
            catch (Exception ex)
            {
                Response.Redirect("Login.aspx");
            }
        }

        private void alert(String message)
        {
            StringBuilder sbMensaje = new StringBuilder();
            sbMensaje.Append("<script type='text/javascript'>");
            sbMensaje.AppendFormat("toastr.info('" + message + "');");
            sbMensaje.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "mensaje", sbMensaje.ToString());
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRUDPlates.aspx");
        }

        protected void ButtonCustomers_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRUDUsers.aspx");
        }

        protected void ButtonOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("CRUDOrders.aspx");
        }
    }
}