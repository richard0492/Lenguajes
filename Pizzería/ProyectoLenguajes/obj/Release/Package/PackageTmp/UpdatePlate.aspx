<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="UpdatePlate.aspx.cs" Inherits="ProyectoLenguajes.UpdatePlate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Editar Plato
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="row">
    <div class="col-md-3">
        <asp:Button ID="Button2"  class="btn btn-danger" runat="server" Text="Regresar"  OnClick="Button1_Click"  />
    </div>

  <div class="col-md-6">
    <div class="container-fluid bg">  
    
         
    <asp:ScriptManager ID="ScriptManager1" runat= "server"></asp:ScriptManager>
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                 <ContentTemplate> 

                    
        <div class="form-conatiner">
            <h1 style="text-align:center">Editar Plato</h1>

            <br/>
            <asp:Button ID="Button1" class="btn btn-info" runat="server" Text="Cargar Antigua Informacion" OnClick="Button1_Click1"  />
            <br/>
            <br/>

            
        
        <div class="form-group">
        <label for="exampleInputName">Nombre</label>
        <asp:TextBox ID="TextBoxName" type="text" placeholder="Nombre" class="form-control" runat="server" ></asp:TextBox>

      </div>

        <div class="form-group">
        <label for="exampleInputDescription">Descripcion</label>
        <asp:TextBox ID="TextBoxFullDescription"  placeholder="Descripcion" class="form-control" runat="server" ></asp:TextBox>
      </div>

        <div class="form-group">
        <label for="exampleInputPrice">Precio</label>
        <asp:TextBox ID="TextBoxPrice"  type="text" placeholder="Precio" class="form-control" runat="server"></asp:TextBox>
      </div>

        <div class="form-group">
            <script type="text/javascript">
                function showimagepreview(input) {
                   if (input.files && input.files[0]) {
                       var reader = new FileReader();
                           reader.onload = function (e) {
                             document.getElementsByTagName("img")[1].setAttribute("src", e.target.result);
                           }
                          reader.readAsDataURL(input.files[0]);
                   }
                }
            </script>
            <label for="exampleInputPhoto">Fotografia</label>
            <asp:FileUpload ID="InsertPhoto" class="form-control" runat="server" onchange="showimagepreview(this)" />
            

            <asp:Image ID="Image1" runat="server" style="width: 250px"/>
       </div>

        <div class="form-group">
        <label for="exampleInputPrice">Tiempo de Preparacion</label>
        <asp:TextBox ID="TextBoxTimeToPrepare"  type="text" placeholder="Tiempo de Preparacion" class="form-control" runat="server" ></asp:TextBox>
      </div>

            <div class="form-group">
                 
                <asp:CheckBox ID="CheckBoxEnabled" runat="server" class="form-control" Text="Plato Habilitado"/>
                             
            </div>
            


        <asp:Button ID="ButtonADDPlate"  class="btn btn-success btn-block" runat="server" Text="Editar Plato" OnClick="ButtonADDPlate_Click1"  />
        </div>
        

                 </ContentTemplate>  

                 <triggers>
                   <asp:PostBackTrigger runat="server"  ControlID="ButtonADDPlate" />
                 </triggers>

         </asp:UpdatePanel>
        </div>
      </div>

    <div class="col-md-3"> 

    </div>

</div>
</asp:Content>
