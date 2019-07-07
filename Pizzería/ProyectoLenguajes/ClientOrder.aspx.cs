using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entities;
using BLL;
using System.Data;

namespace ProyectoLenguajes
{
    public partial class ClientOrder : System.Web.UI.Page
    {
        private BussinessLogicLayer bll = new BussinessLogicLayer();
        private int variable = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

         
        }

        private void load()
        {
            List<LineaOrden> dt = (List<LineaOrden>)Session["List"];

            //_Plato p = bll.SearchPlatoID(dt[2].PlatoID.ToString());

             DataTable dataTable = new DataTable();
             dataTable.Columns.Add("Codigo de Plato");
             dataTable.Columns.Add("Nombre");
             dataTable.Columns.Add("Precio Unidad");
             dataTable.Columns.Add("Cantidad");
             dataTable.Columns.Add("Precio SubTotal");

            int totalLabel = 0;
             int i = -1;
            if (dt != null)
            {
                foreach (LineaOrden item in dt.ToList())
                {
                    i++;
                    Plato p = bll.SearchPlatoID(item.PlatoID.ToString());

                    float asd = (float)Convert.ToDouble(p.Precio);
                    int price1 = Convert.ToInt32(asd);

                    int price = (Int32.Parse(item.Cantidad + "") * price1);


                    dataTable.Rows.Add(item.PlatoID, p.Nombre, p.Precio, item.Cantidad, price);

                    dt[i].Precio = price;
                    totalLabel += price;
                }

                /* foreach (LineaOrden item in dt.ToList())
                 {
                     Plato p = bll.SearchPlatoID(item.PlatoID);

                     if (!exist(item.PlatoID.ToString())) {
                         i++;


                         float asd = (float)Convert.ToDouble(p.Precio);
                         int price1 = Convert.ToInt32(asd);

                         int price = (Int32.Parse(item.Cantidad + "") * price1);


                         dataTable.Rows.Add(item.PlatoID, p.Nombre, p.Precio, item.Cantidad, price);

                         dt[i].Precio = price;
                         totalLabel += price;
                     }
                 }*/
                Label1.Visible = true;
                Label2.Text = (totalLabel + "");
            }
            else {
                Label1.Visible = false;
                Label2.Visible = false;
                ButtonOrder.Visible = false;
            }
            Session["List"] = dt;

            

                GridView1.DataSource = dataTable;
                GridView1.DataBind();
               
        }


        private Boolean exist(string newIdPlate) {
            List<LineaOrden> dt = (List<LineaOrden>)Session["List"];
            int i = 0;
            foreach (LineaOrden item in dt.ToList()) {
                if (item.PlatoID.ToString().Equals(newIdPlate)) {
                    i++;
                    if ((i > 1) && variable == 0) {
                        variable = 1; 
                        return true;
                    }
                    
                }
            }
            return false;
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ButtonDelete")
            {

                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string id = GridView1.Rows[crow].Cells[1].Text;

                bll.DeleteLine((List<LineaOrden>)Session["List"], id );
                load();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            if (Session["List"] != null )
            {
                if (((List<LineaOrden>)Session["List"]).Count > 0)
                {
                    load();
                    ButtonOrder.Visible = true;
                }
                else
                {
                    alert("Debe agregar platos a la orden");
                }
            }
            else {
                alert("Debe agregar platos a la orden");
            }
        }



        protected void ButtonOrder_Click(object sender, EventArgs e)
        {
            //alert(Session["List"].ToString());
            bll.CreateOrder((List<LineaOrden>)Session["List"], Session["UserEmail"].ToString() + "");
            Session["List"] = null;
            //Response.Redirect("ClientOrder.aspx");
            load();
            alert("Total de la factura es de: " + Label2.Text);
        }
    }
}