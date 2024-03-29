﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Entities;

namespace ProyectoLenguajes
{
    public partial class KitchenMenu : System.Web.UI.Page
    {
        BussinessLogicLayer bllClass = new BussinessLogicLayer();
        static string id;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                    if (Session["chef"] != null)
                    {
                        
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

        public void load() {
            loadKitchenOrders();
            setTimesToOrders();
            namelb.Text = Session["chef"].ToString();
        }

        public void loadKitchenOrders()
        {
            List<PROC_KITCHEN_ORDERS_Result> orders = bllClass.loadKitchenOrders();
            GridViewResult.DataSource = orders;
            GridViewResult.DataBind();
            int gridLength = GridViewResult.Rows.Count;
            for (int i = 0; i < gridLength; i++)
            {
                if (GridViewResult.Rows[i].Cells[3].Text == "A tiempo")
                {

                    GridViewResult.Rows[i].BackColor = System.Drawing.Color.Green;
                }
                if (GridViewResult.Rows[i].Cells[3].Text == "Sobre tiempo")
                {
                    GridViewResult.Rows[i].BackColor = System.Drawing.Color.Yellow;
                }
                if (GridViewResult.Rows[i].Cells[3].Text == "Atrasado")
                {
                    GridViewResult.Rows[i].BackColor = System.Drawing.Color.Red;
                }
                if (i == 7)
                {
                    lbOrdesInQueue.Visible = true;
                }
                else
                {
                    lbOrdesInQueue.Visible = false;
                }

            }
        }

        public void setTimesToOrders()
        {
            int gridLength = GridViewResult.Rows.Count;
            int numOrder = 0;
            int ignoreIquals = 0;
            List<int> numOrders = new List<int>();
            for (int i = 0; i < gridLength; i++)
            {
                numOrder = int.Parse(GridViewResult.Rows[i].Cells[1].Text);
                if (numOrder != ignoreIquals)
                {
                    ignoreIquals = numOrder;
                    numOrders.Add(numOrder);
                }
            }
            bllClass.updateTimesToOrders(numOrders);
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int gridLength = GridViewResult.Rows.Count;
            int numOrder = 0;
            int timeComparison1 = 0;
            int timeComparison2 = 0;
            int timeToCompare = 0;
            for (int i = 0; i < gridLength; i++)
            {
                numOrder = int.Parse(GridViewResult.Rows[i].Cells[1].Text);
                Orden order = bllClass.findOrder(numOrder);
                timeComparison1 = System.DateTime.Now.Minute;
                timeComparison2 = Convert.ToDateTime(order.HoraInicio).Minute;
                timeToCompare = timeComparison1 - timeComparison2;
                //*esto se debe actualizar a 5 y 10 min+ despues
                alert(timeToCompare + "");
                if (timeToCompare > 1)
                {
                    alert(" sobre tiempo");
                    bllClass.changeStateOrder(numOrder, 2);
                }
                if (timeToCompare > 2)
                {
                    alert(" atrasado");
                    bllClass.changeStateOrder(numOrder, 3);
                }
            }
            Response.Redirect("KitchenMenu.aspx");
        }

        private void alert(String message)
        {
            string script = @"<script type='text/javascript'>
                            alert(' " + message + "'); </script>";
            script = string.Format(script);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }

        protected void GridViewResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ButtonDeliver")
            {
                /*Button Update*/
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                id = GridViewResult.Rows[crow].Cells[1].Text;
                Session["LastOrderDelivered"] = id;
                Session["ActualState"] = GridViewResult.Rows[crow].Cells[3].Text;
                ScriptManager.RegisterClientScriptBlock(this,this.GetType(), "key", "showModal()", true);
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            bllClass.deliverOrder(int.Parse(id));
            Response.Redirect("KitchenMenu.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("KitchenMenu.aspx");
        }

        protected void btnReturnOrder_Click(object sender, EventArgs e)
        {
            if (Session["LastOrderDelivered"] != null && Session["ActualState"] != null)
            {
                int idReturn = Convert.ToInt32(Session["LastOrderDelivered"]);
                if (Session["ActualState"].Equals("A tiempo"))
                {

                    bllClass.returnLastOrder(idReturn, 1);
                }
                if (Session["ActualState"].Equals("Sobre tiempo"))
                {
                    bllClass.returnLastOrder(idReturn, 2);
                }
                if (Session["ActualState"].Equals("Atrasado"))
                {
                    bllClass.returnLastOrder(idReturn, 3);
                }

                Response.Redirect("KitchenMenu.aspx");
            }
            else {
                alert("No se han entregado órdenes");
            }
        }
    }
}