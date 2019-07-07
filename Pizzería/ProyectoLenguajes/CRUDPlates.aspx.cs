using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;


namespace ProyectoLenguajes
{
    public partial class CRUDPlates : System.Web.UI.Page
    {

        private BussinessLogicLayer bll = new BussinessLogicLayer();
        private DataTable dataTable = new DataTable();

        private string name = "";
        private string description = "";
        private string price = "";
        private string timeToPrepare = "";
        private string enabled = "";
        private byte[] photo;
        private string id = "";

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
        

        private void fillData(string id)
        {
            try
            {
                bll.SearchPlatoID(id);
                TextBoxID.Text = id;
                TextBoxPriceU.Text = bll.SearchPlatoID(id).Precio + "";
                TextBoxNameU.Text = bll.SearchPlatoID(id).Nombre;
                TextBoxFullDescriptionU.Text = bll.SearchPlatoID(id).Descripcion;
                TextBoxTimeToPrepareU.Text = bll.SearchPlatoID(id).TiempoPreparacionMinutos.ToString();
                if (bll.SearchPlatoID(id).HabilitadoSN.ToUpper().Equals("S"))
                {
                    CheckBoxEnabledU.Checked = true;
                }
                else
                {
                    CheckBoxEnabledU.Checked = false;
                }
                if (bll.SearchPlatoID(id).Fotografia != null)
                {
                    byte[] image = (byte[])bll.SearchPlatoID(id).Fotografia;
                    string base64String = Convert.ToBase64String(image, 0, image.Length);
                    Image1.ImageUrl = String.Format(@"data:image/jpeg;base64,{0}", base64String);
                }
            }
            catch (Exception ex)
            {
                alertException(ex.Message, ex);
            }
        }

        protected void ButtonADDPlate_Click(object sender, EventArgs e)
        {

            try
            {
                getDataToInsert();
                bll.InsertPlate(name, description, price, ref photo, enabled, timeToPrepare);
                alert("Nombre: " + name + " Descripcion: " + description +
                    " Precio: " + price + " Tiempo de Cocina: " + timeToPrepare +
                    " Habilitado: " + enabled);
                clear();
                load();
                

            }
            catch (ArgumentException ex)
            {
                alertException(ex.Message, ex);
                ClientScript.RegisterStartupScript(this.GetType(), "key", "showModal()", true);

            }

        }

        private void getDataToInsert() {



            name = TextBoxName.Text;
            description = TextBoxFullDescription.Text;
            price = TextBoxPrice.Text;
            getPhoto();

            timeToPrepare = TextBoxTimeToPrepare.Text;
            Boolean enabled2 = CheckBoxEnabled.Checked;
            if (enabled2)
            {
                enabled = "S";
            }
            else
            {
                enabled = "N";
            }
        }

        private void clear() {
            TextBoxName.Text = "";
            TextBoxFullDescription.Text = "";
            TextBoxPrice.Text = "";
            TextBoxTimeToPrepare.Text = "";
            CheckBoxEnabled.Checked = false;
            //falta foto
        }

        private void getPhoto() {
            if (InsertPhoto.HasFile)
            {
                HttpPostedFile photoArchive = InsertPhoto.PostedFile;
                int photoLength = photoArchive.ContentLength;
                photo = new byte[photoLength];
                photoArchive.InputStream.Read(photo, 0, photoLength);
            }
            else
            {
                alert("Error al guardar la foto");
            }
        }


        private void load()
        {
            clearGrid();
            GridViewPlates.DataSource = bll.ShowAllPlatesForAdm();
            
            GridViewPlates.DataBind();

        }


        private void clearGrid()
        {

            GridViewPlates.DataSourceID = "";
            GridViewPlates.DataSource = null;
            GridViewPlates.DataBind();
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


        protected void GridViewPlates_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "buttonUpdate")
            {
                /*Button Update*/    
                    int crow;
                    crow = Convert.ToInt32(e.CommandArgument.ToString());
                this.id = GridViewPlates.Rows[crow].Cells[2].Text;
                fillData(GridViewPlates.Rows[crow].Cells[2].Text);
                ClientScript.RegisterStartupScript(this.GetType(), "key", "showModaUpdate()", true);


            }

            if (e.CommandName == "buttonDelete")
            {
                /*Button Delete*/
                int crow;
                crow = Convert.ToInt32(e.CommandArgument.ToString());
                string id = GridViewPlates.Rows[crow].Cells[2].Text;
                string name = GridViewPlates.Rows[crow].Cells[3].Text;
                Boolean delete = bll.DeletePlate(id);
                if (delete)
                {
                    alert("Eliminado " + name);
                }
                else
                {
                    alert("No se pudo eliminar este plato");
                }
                load();
            }

        }

  

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "key", "showModal()", true);

        }

        protected void ButtonUPlate_Click1(object sender, EventArgs e)
        {
            byte[] photo;


            HttpPostedFile photoArchive = InsertPhotoU.PostedFile;
            int photoLength = photoArchive.ContentLength;
            photo = new byte[photoLength];
            photoArchive.InputStream.Read(photo, 0, photoLength);

            string base64String = Convert.ToBase64String(photo, 0, photoLength);
            Image1.ImageUrl = String.Format(@"data:image/jpeg;base64,{0}", base64String);
            try
            {
                if (CheckBoxEnabledU.Checked)
                {
                    bll.ModifiyPlate(TextBoxID.Text, TextBoxNameU.Text, TextBoxFullDescriptionU.Text, TextBoxPriceU.Text, ref photo, "s", TextBoxTimeToPrepareU.Text);
                    Response.Redirect("CRUDPlates.aspx");
                }
                else
                {
                    bll.ModifiyPlate(TextBoxID.Text, TextBoxNameU.Text, TextBoxFullDescriptionU.Text, TextBoxPriceU.Text, ref photo, "n", TextBoxTimeToPrepareU.Text);
                    Response.Redirect("CRUDPlates.aspx");
                }


            }
            catch (Exception ex)
            {
                alertException(ex.Message, ex);
            }
        }
    }
}