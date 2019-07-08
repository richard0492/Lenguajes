using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Entities;

namespace ProyectoLenguajes
{
    public partial class ClientApp : System.Web.UI.Page
    {
        static string idPlateToOrder = "";
        string quantity = "";
        private BussinessLogicLayer bll = new BussinessLogicLayer();
        static List<LineaOrden> orderLines = new List<LineaOrden>();
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
                   
                        load();
                   
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

        private void loadInf(string price, string name)
        {
            List<String> list = new List<string>();
                float asd = (float)Convert.ToDouble(price);
                int price1 = Convert.ToInt32(asd);
                list = bll.Get_Plate_ToClient(name, price1);
                TextBoxName.Text = list[0];
                TextBoxPrice.Text = list[1];
                TextBoxFullDescription.Text = list[2];
                idPlateToOrder = list[3]; //ID del Plato a agregar a la lista de Ordenes 
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
            StringBuilder sbMensaje = new StringBuilder();
            sbMensaje.Append("<script type='text/javascript'>");
            sbMensaje.AppendFormat("toastr.warning('" + message + "');");
            sbMensaje.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "mensaje", sbMensaje.ToString());
        }

        private void alertConfirm(String message)
        {
            StringBuilder sbMensaje = new StringBuilder();
            sbMensaje.Append("<script type='text/javascript'>");
            sbMensaje.AppendFormat("toastr.success('" + message + "');");
            sbMensaje.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "mensaje", sbMensaje.ToString());
        }

        private void clearGrid()
        {

            GridView1.DataSourceID = "";
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
        private void loadOrders()
        {
            List<LineaOrden> dt = orderLines;

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
            }
            orderLines = dt;



            GridView2.DataSource = dataTable;
            GridView2.DataBind();

        }
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ButtonDelete")
            {

                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string id = GridView2.Rows[crow].Cells[1].Text;

                bll.DeleteLine(orderLines, id);
                loadOrders();
                ClientScript.RegisterStartupScript(this.GetType(), "key", "showModaOrders()", true);
            }
        }
        protected void ButtonAddOrder_Click(object sender, EventArgs e)
        {
          
                getQuantity();
                if (!quantity.Trim().Equals("") && Int32.Parse(quantity) > 0 && Int32.Parse(quantity) < 101)
                {
                    idPlateToOrder.ToString();

                    bll.AddOrderLine(idPlateToOrder, quantity, orderLines);

                alertConfirm("Se agrego el plato a la orden con exito");
                TextBoxName.Text = "";
                TextBoxPrice.Text = "";
                TextBoxFullDescription.Text = "";
                idPlateToOrder = "";
                Image1.ImageUrl = null;


            }
                else
                {
                    alert("Debe ingresar un numero mayor a 0 y menor a 100. SI desea comprar mas de 100 contactar con los dueños");
                }
            
            
           
        }

        protected void ButtonOrder_Click(object sender, EventArgs e)
        {
            splitName[1].ToString();
            bll.CreateOrder(orderLines, splitName[1].ToString().Trim());
            orderLines = null;
            load();
            alertConfirm("Total de la factura es de: " + Label2.Text);
        }

        protected void orders_Click(object sender, EventArgs e)
        {
            loadOrders();
            ClientScript.RegisterStartupScript(this.GetType(), "key", "showModaOrders()", true);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            loadTextBox();
            ClientScript.RegisterStartupScript(this.GetType(), "key", "showModaUpdateU()", true);
        }

        private void loadTextBox()
        {
            List<string> list = bll.searchPartyClientByEmail(splitName[1].ToString().Trim());

            TextBoxfirstName.Text = list[0].ToString();
            TextBoxlastName.Text = list[1].ToString();
            TextBoxApellido1.Text = list[2].ToString();
            TextBoxApellido2.Text = list[3].ToString();
            TextBoxAddress.Text = list[4].ToString();
            TextBoxPassword.Text = list[5].ToString();
        }

        private void getDataToModify()
        {
            String fname = TextBoxfirstName.Text;
            String sname = TextBoxlastName.Text;
            String fLastName = TextBoxApellido1.Text;
            String sLastName = TextBoxApellido2.Text;
            String address = TextBoxAddress.Text;
            String password = TextBoxPassword.Text;

            bll.updateClientInformation(splitName[1].ToString().Trim(), fname, sname, fLastName, sLastName, address, password);
            alert("La informacion se modifico con exito");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            getDataToModify();
        }
    }
}