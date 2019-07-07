using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Entities;

namespace ProyectoLenguajes
{
    public partial class ClientApp : System.Web.UI.Page
    {
        string idPlateToOrder = "";
        string quantity = "";
        private BussinessLogicLayer bll = new BussinessLogicLayer();
        List<LineaOrden> orderLines;
        string[] splitName;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (Session["client"] !=null)
                {
                    string name = Session["client"].ToString();
                    splitName = name.Split('/');
                    namelb.Text = splitName[0];
                    if (IsPostBack)
                    {
                        load();
                    }
                    else {
                        load();
                    }
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

        private void load() {
            GridView1.DataSource = bll.ShowAllPlatesForClient();
            GridView1.DataBind();
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (!IsPostBack)
            {
                if (e.CommandName == "detail")
                {
                    /*Button Update*/
                    int crow;
                    crow = Convert.ToInt32(e.CommandArgument.ToString());
                    string id = GridView1.Rows[crow].Cells[2].Text;
                    string name = GridView1.Rows[crow].Cells[1].Text;
                    loadInf(id, name);
                    ClientScript.RegisterStartupScript(this.GetType(), "key", "showModal()", true);


                }
            }
            else
            {
                if (e.CommandName == "detail")
                {
                    /*Button Update*/
                    int crow;
                    crow = Convert.ToInt32(e.CommandArgument.ToString());
                    string id = GridView1.Rows[crow].Cells[2].Text;
                    string name = GridView1.Rows[crow].Cells[1].Text;
                    loadInf(id, name);
                    ClientScript.RegisterStartupScript(this.GetType(), "key", "showModal()", true);


                }
            }
        }

        private void loadInf(string price, string name)
        {
            //int n = Int32.Parse(price);
            float asd = (float)Convert.ToDouble(price);
            int price1 = Convert.ToInt32(asd);
            List<String> list = bll.Get_Plate_ToClient(name, price1);
            TextBoxName.Text = list[0];
            TextBoxPrice.Text = list[1];
            TextBoxFullDescription.Text = list[2];
            this.idPlateToOrder = list[3]; //ID del Plato a agregar a la lista de Ordenes 
            if (list.Count > 4)
            {
                Image1.ImageUrl = String.Format(@"data:image/jpg;base64,{0}", list[4]);
            }
        }
        private void getQuantity()
        {
            quantity = TextBoxQuantity.Text;
        }
        private void loadFilter(string name)
        {
            try
            {
                clearGrid();
                GridView1.DataSource = bll.SearchPlateNameForClient(name);
                GridView1.DataBind();
            } catch (Exception ex) {
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            string filter = TextBox1.Text;
            if (!filter.Trim().Equals(""))
            {
                loadFilter(filter);
            }
            else {
                alert("Debe Ingresar informacion para filtrar");
            }
        }

        private void alert(String message)
        {
            string script = @"<script type='text/javascript'>
                            alert(' " + message + "'); </script>";
            script = string.Format(script);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }

        private void clearGrid()
        {

            GridView1.DataSourceID = "";
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
        private void loadOrders()
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
                Label1.Visible = true;
                Label2.Text = (totalLabel + "");
            }
            else
            {
                Label1.Visible = false;
                Label2.Visible = false;
                ButtonOrder.Visible = false;
            }
            Session["List"] = dt;



            GridView2.DataSource = dataTable;
            GridView2.DataBind();

        }

        protected void ButtonAddOrder_Click(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getQuantity();
                if (!quantity.Trim().Equals("") && Int32.Parse(quantity) > 0 && Int32.Parse(quantity) < 101)
                {
                    idPlateToOrder.ToString();

                    bll.AddOrderLine(idPlateToOrder, quantity, orderLines);

                    alert("Se agrego el plato a la orden con exito");
                }
                else
                {
                    alert("Debe ingresar un numero mayor a 0 y menor a 100. SI desea comprar mas de 100 contactar con los dueños");
                }
            }
            else {
                getQuantity();
                if (!quantity.Trim().Equals("") && Int32.Parse(quantity) > 0 && Int32.Parse(quantity) < 101)
                {
                    idPlateToOrder.ToString();

                    bll.AddOrderLine(idPlateToOrder, quantity, orderLines);

                    alert("Se agrego el plato a la orden con exito");
                }
                else
                {
                    alert("Debe ingresar un numero mayor a 0 y menor a 100. SI desea comprar mas de 100 contactar con los dueños");
                }
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

        protected void orders_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "key", "showModaOrders()", true);
        }
    }
}