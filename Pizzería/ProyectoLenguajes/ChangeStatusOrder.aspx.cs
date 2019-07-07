using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace ProyectoLenguajes
{
    public partial class ChangeStatusOrder : System.Web.UI.Page
    {
        BussinessLogicLayer bll_class = new BussinessLogicLayer();
        string id;

        protected void Page_Load(object sender, EventArgs e)
        {
            receiveOrderID();
        }

        public void receiveOrderID()
        {
            id = Request.QueryString["id"];
        }

        protected void DropDownListStates_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonFilter_Click(object sender, EventArgs e)
        {
            int state = int.Parse(DropDownListStates.SelectedValue);
            bll_class.changeStateOrder(int.Parse(id), state);
            Response.Redirect("CRUDOrders.aspx");
        }
    }
}