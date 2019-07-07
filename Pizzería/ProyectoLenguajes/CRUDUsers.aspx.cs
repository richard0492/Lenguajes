using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;

namespace ProyectoLenguajes
{
    public partial class CRUDUsers : System.Web.UI.Page
    {
        private BussinessLogicLayer bll = new BussinessLogicLayer();
        private DataTable dataTable = new DataTable();
        private string tipeOfUser = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                namelb.Text = Session["admin"].ToString();
                load();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        private void load() {
            clearGrid();
            GridView1.DataSource = bll.getUsers();
            GridView1.DataBind();
        }

        private void loadFilter(string name)
        {
                clearGrid();
                GridView1.DataSource = bll.SearchUsers(name);
                GridView1.DataBind();
            
        }

        private void clearGrid() {
            GridView1.DataSource = null;
            GridView1.DataBind();
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

      

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "buttonUpdate")
            {
                /*Button Update*/
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string email = GridView1.Rows[crow].Cells[3].Text;
                TextBoxEmailU.Text = email;
                fillData(email);
                ClientScript.RegisterStartupScript(this.GetType(), "key", "showModaUpdate()", true);

            }

            if (e.CommandName == "buttonDelete")
            {
                try
                {
                    /*Button Delete*/
                    int crow;
                    crow = Convert.ToInt32(e.CommandArgument.ToString());
                    string typeUser = GridView1.Rows[crow].Cells[2].Text;
                    string email = GridView1.Rows[crow].Cells[3].Text;
                    bll.deleteParty(email);
                    alert("Eliminado " + email);
                    load();
                } catch (Exception ex) {
                    alert("El Usuario no puede ser elimina ya que se utiliza en otro lugar de la aplicacion");
                }
            }
        }

        protected void ButtonADDUser_Click(object sender, EventArgs e)
        {
            try
            {
                string email = TextBoxEmail.Text;
                string password = TextBoxPassword.Text;
                string firstName = TextBoxFirstName.Text;
                string secondName = TextBoxSecondName.Text;
                string firstLastName = TextBoxApellido1.Text;
                string secondLastName = TextBoxApellido2.Text;
                string address = TextBoxAddress.Text;
                string enabled = "";
                Boolean enabled2 = CheckBoxEnabled.Checked;
                if (enabled2)
                {
                    enabled = "S";
                }
                else
                {
                    enabled = "N";
                }
                int typeOfUser = int.Parse(RadioButtonList1.SelectedItem.Value);

                switch (typeOfUser)
                {
                    case 1:
                        bll.addAdmin(email, firstName, secondName, firstLastName, secondLastName, address, password);
                        break;
                    case 2:
                        bll.addCustumer(email, firstName, secondName, firstLastName, secondLastName, address, password);
                        break;
                    case 3:
                        bll.addChef(email, firstName, secondName, firstLastName, secondLastName, address, password);
                        break;
                    default:
                        break;
                }
                clear();
                alert("Se Agrego " + firstName + " " + firstLastName + " Exitosamente");
                load();
            } catch (Exception ex) {
                alert("ERROR> Falta Informacion por agregar en el formulario, El Email es incorrecto o ya existe");
            }
        }


        private void clear() {
            TextBoxEmail.Text = "";
            TextBoxPassword.Text = "";
            TextBoxFirstName.Text = "";
            TextBoxSecondName.Text = "";
            TextBoxApellido1.Text = "";
            TextBoxApellido2.Text = "";
            TextBoxAddress.Text = "";
            CheckBoxEnabled.Checked = false;
            RadioButtonList1.ClearSelection();
        }

        private void fillData(string email)
        {
            List<String> list = bll.searchPartyClientByEmailFullInf(email);
            TextBoxFirstNameU.Text = list[0];
            TextBoxSecondNameU.Text = list[1];
            TextBoxApellido1U.Text = list[2];
            TextBoxApellido2U.Text = list[3];
            TextBoxAddressU.Text = list[4];
            TextBoxPasswordU.Text = list[5];
            switch (list[7])
            {

                case "2":
                    if (list[6].Equals("s"))
                    {
                        CheckBoxEnabledU.Checked = true;
                    }
                    break;
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "key", "showModal()", true);
        }

        protected void ButtonUUser_Click1(object sender, EventArgs e)
        {
            string email = TextBoxEmailU.Text;
            string password = TextBoxPasswordU.Text;
            string firstName = TextBoxFirstNameU.Text;
            string secondName = TextBoxSecondNameU.Text;
            string firstLastName = TextBoxApellido1U.Text;
            string secondLastName = TextBoxApellido2U.Text;
            string address = TextBoxAddressU.Text;
            string enabled = "";
            Boolean enabled2 = CheckBoxEnabledU.Checked;
            if (enabled2)
            {
                enabled = "S";
            }
            else
            {
                enabled = "N";
            }


            bll.updateParty2(email, firstName, secondName, firstLastName, secondLastName, address, password, enabled);
            Response.Redirect("CRUDUsers.aspx");
        }
    }
}