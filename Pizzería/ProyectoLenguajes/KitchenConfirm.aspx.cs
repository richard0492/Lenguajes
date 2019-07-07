using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace ProyectoLenguajes
{
    public partial class KitchenConfirm : System.Web.UI.Page
    {
        private string id;
        private BussinessLogicLayer bllClass = new BussinessLogicLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];
        }

        //acepto
        protected void Button1_Click(object sender, EventArgs e)
        {
            bllClass.deliverOrder(int.Parse(id));
            Response.Redirect("KitchenMenu.aspx");
        }

        //rechaso
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("KitchenMenu.aspx");
        }
    }
}