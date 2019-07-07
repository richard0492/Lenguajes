using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Entities;

namespace ProyectoLenguajes
{
    public partial class Details : System.Web.UI.Page
    {
        string name = "";
        string price = "";
        string idPlateToOrder = "";
        string quantity = "";
        private BussinessLogicLayer bll = new BussinessLogicLayer();
        List<LineaOrden> orderLines;

        protected void Page_Load(object sender, EventArgs e)
        {
            getData();
            loadInf();

            
        }

        private void getData()
        {
            name = Request.QueryString["name"];
            price = Request.QueryString["price"];
        }

        private void loadInf() {
            //int n = Int32.Parse(price);
            float asd = (float)Convert.ToDouble(price);
            int price1 = Convert.ToInt32(asd);
            List<String> list = bll.Get_Plate_ToClient(name, price1);
            TextBoxName.Text = list[0];
            TextBoxPrice.Text = list[1];
            TextBoxFullDescription.Text = list[2];
            idPlateToOrder = list[3]; //ID del Plato a agregar a la lista de Ordenes 
            if (list.Count > 4) {
                Image1.ImageUrl = String.Format(@"data:image/jpg;base64,{0}", list[4]);
            }
        }

        private void getQuantity() {
            quantity = TextBoxQuantity.Text;
        }

        private void viewData() {
            alert(TextBoxName.Text + " " + TextBoxPrice.Text + " " + TextBoxFullDescription.Text);
        }

        private void alert(String message)
        {
            string script = @"<script type='text/javascript'>
                            alert(' " + message + "'); </script>";
            script = string.Format(script);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClientApp.aspx");
        }

        private void alertException(String message, Exception e)
        {
            string script = @"<script type='text/javascript'>
                            alert(' " + message + "'); </script>";
            script = string.Format(script, e);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }

        protected void ButtonAddOrder_Click(object sender, EventArgs e)
        {
            try
            {

                getQuantity();
                if (!quantity.Trim().Equals("") && Int32.Parse(quantity) > 0 && Int32.Parse(quantity) < 101)
                {
                    if ((List<LineaOrden>)Session["List"] == null)
                    {
                        orderLines = new List<LineaOrden>();
                    }
                    else
                    {
                        orderLines = (List<LineaOrden>)Session["List"];
                    }
                    bll.AddOrderLine(idPlateToOrder, quantity, orderLines);
                    Session["List"] = orderLines;
                    alert("Se agrego el plato a la orden con exito");
                }
                else {
                    alert("Debe ingresar un numero mayor a 0 y menor a 100. SI desea comprar mas de 100 contactar con los dueños");
                }
                
            } catch (Exception ex) {
                //alert("Debe ingresar un numero mayor a 0 y menor a 100. SI desea comprar mas de 100 contactar con los dueños");
                alertException(ex.Message, ex);
            }
        }
    }
}