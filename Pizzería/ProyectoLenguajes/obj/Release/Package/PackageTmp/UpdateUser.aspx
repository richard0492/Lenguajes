<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="ProyectoLenguajes.UpdateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Editar Usuario 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="row">
    <div class="col-md-3"> 
        <asp:Button ID="Button2"  class="btn btn-danger" runat="server" Text="Regresar" OnClick="Button2_Click"    />
    </div>

  <div class="col-md-6">
      <div class="container-fluid bg">  
          <!--Agregar --> 

      
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
       <ContentTemplate> 

            <h3 style="text-align:center">Editar Usuario</h3>
            
            <div class="form-conatiner">
                 <asp:Button ID="Button1" class="btn btn-info" runat="server" style="text-align:center" Text="Cargar Antigua Informacion" OnClick="Button1_Click1"  />
            
                <br/>
                <br/>

      <div class="form-group">
        <label for="exampleInputEmail">Primer Nombre</label>
        <asp:TextBox ID="TextBoxFirstName"  placeholder="Primer Nombre" class="form-control" runat="server"></asp:TextBox>
      </div>
    
      <div class="form-group">
        <label for="exampleInputEmail">Segundo Nombre</label>
        <asp:TextBox ID="TextBoxSecondName"  placeholder="Segundo Nombre" class="form-control" runat="server" ></asp:TextBox>
      </div>

         <div class="form-group">
        <label for="exampleInputEmail">Primer Apellido</label>
        <asp:TextBox ID="TextBoxApellido1"  placeholder="Primer Apellido" class="form-control" runat="server" ></asp:TextBox>
      </div>

           <div class="form-group">
        <label for="exampleInputEmail">Segundo Apellido</label>
        <asp:TextBox ID="TextBoxApellido2"  placeholder="Segundo Apellido" class="form-control" runat="server" ></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="exampleInputEmail">Direccion</label>
        <asp:TextBox ID="TextBoxAddress"  placeholder="Direccion" class="form-control" runat="server" ></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="exampleInputPassword">Contraseña</label>
        <asp:TextBox ID="TextBoxPassword"  placeholder="Contraseña" class="form-control" runat="server" ></asp:TextBox>
      </div>

            <div class="form-group">
                <asp:CheckBox ID="CheckBoxEnabled" runat="server" class="form-control" Text="Habilitado"/>  
            </div>


        <asp:Button ID="ButtonModifyUser"  class="btn btn-warning btn-block" runat="server" Text="Modificar" OnClick="ButtonModifyUser_Click"   />
       
                
       </ContentTemplate>   
       </asp:UpdatePanel>


      </div>
      </div>

    <div class="col-md-3"> 


    </div>
</div>

</asp:Content>
