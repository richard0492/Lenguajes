using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace ProyectoLenguajes
{
    public partial class CRUDOrders : System.Web.UI.Page
    {
        BussinessLogicLayer bLLclass = new BussinessLogicLayer();
        DateTime defaultDate = DateTime.Parse("1 / 1 / 0001 00:00:00");
        DateTime startDate = DateTime.Parse("1 / 1 / 0001 00:00:00");
        DateTime endDate = DateTime.Parse("1 / 1 / 0001 00:00:00");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                namelb.Text = Session["admin"].ToString();
                loadOrders();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            
        }

        protected void loadOrders()
        {
            GridViewResult.DataSource = bLLclass.LoadAllOrders();
            GridViewResult.DataBind();
        }

        private void alert(String message)
        {
            string script = @"<script type='text/javascript'>
                            alert(' " + message + "'); </script>";
            script = string.Format(script);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }

        private void alertException(String message, Exception e)
        {
            string script = @"<script type='text/javascript'>
                            alert(' " + message + "'); </script>";
            script = string.Format(script, e);
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }

        protected void ButtonFilter_Click(object sender, EventArgs e)
        {
            GridViewResult.Dispose();
            int state = int.Parse(DropDownListStates.SelectedValue);

            if (TextBoxStatDate.Text != "" && TextBoxEndDate.Text != "")
            {
                startDate = DateTime.Parse(TextBoxStatDate.Text);

                endDate = DateTime.Parse(TextBoxEndDate.Text);
            }

            if (TextBoxStatDate.Text != "" && TextBoxEndDate.Text == "")
            {
                startDate = DateTime.Parse(TextBoxStatDate.Text);
            }

            if (TextBoxStatDate.Text == "" && TextBoxEndDate.Text != "")
            {
                endDate = DateTime.Parse(TextBoxEndDate.Text);
            }




            try
            {
                // only email
                if ((!TextBoxEmail.Text.Equals("")) && (startDate == defaultDate) && (state == 0))
                {
                    GridViewResult.DataSource = bLLclass.FilterByEmail(TextBoxEmail.Text);
                    GridViewResult.DataBind();
                }
                // only date
                if ((TextBoxEmail.Text.Equals("")) && (startDate != defaultDate && endDate != defaultDate) && (state == 0))
                {
                    GridViewResult.DataSource = bLLclass.FilterByDate(startDate, endDate);
                    GridViewResult.DataBind();
                }
                // only state
                if ((TextBoxEmail.Text.Equals("")) && (startDate == defaultDate && endDate == defaultDate) && (state != 0))
                {
                    GridViewResult.DataSource = bLLclass.FilterByState(state);
                    GridViewResult.DataBind();
                }
                // email - date
                if ((!TextBoxEmail.Text.Equals("")) && (startDate != defaultDate && endDate != defaultDate) && (state == 0))
                {
                    GridViewResult.DataSource = bLLclass.FilterByEmail_Date(TextBoxEmail.Text, startDate, endDate);
                    GridViewResult.DataBind();
                }
                // email - state
                if ((!TextBoxEmail.Text.Equals("")) && (startDate == defaultDate && endDate == defaultDate) && (state != 0))
                {
                    GridViewResult.DataSource = bLLclass.FilterByEmail_State(TextBoxEmail.Text, state);
                    GridViewResult.DataBind();
                }
                // date - state
                if ((TextBoxEmail.Text.Equals("")) && (startDate != defaultDate && endDate != defaultDate) && (state != 0))
                {
                    GridViewResult.DataSource = bLLclass.FilterByDate_State(startDate, endDate, state);
                    GridViewResult.DataBind();
                }
                // email - date - state
                if ((!TextBoxEmail.Text.Equals("")) && (startDate != defaultDate && endDate != defaultDate) && (state != 0))
                {
                    GridViewResult.DataSource = bLLclass.FilterByEmail_Date_State(TextBoxEmail.Text, startDate, endDate, state);
                    GridViewResult.DataBind();
                }
            }
            catch (ArgumentException ex)
            {
                alertException(ex.Message, ex);
            }
            GridViewResult.DataBind();

            //clean controls
            TextBoxEmail.Text = "";
            startDate = defaultDate;
            endDate = defaultDate;
            DropDownListStates.SelectedIndex = 0;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "modifyStatus")
            {
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string id = GridViewResult.Rows[crow].Cells[1].Text;
                Response.Redirect("ChangeStatusOrder.aspx?id=" + id);
            }
            else
            {
                alert("Error al modificar el estado");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMenu.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "key", "showModal()", true);
        }
    }
}