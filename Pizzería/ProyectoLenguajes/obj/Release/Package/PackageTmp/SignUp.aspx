<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ProyectoLenguajes.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Registrarse
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="col-md-3"></div>

    <div class="col-md-6">

     <div class="container-fluid bg">  

    <div class="form-conatiner">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>   
        
        <h1 style="text-align:center">Registrarse</h1>
      <div class="form-group">
        <label for="exampleInputEmail">Correo Electronico</label>
        <asp:TextBox ID="TextBoxEmail" type="email" placeholder="Correo Electronico" class="form-control" runat="server" required=""></asp:TextBox>

      </div>

      <div class="form-group">
        <label for="exampleInputEmail">Primer Nombre</label>
        <asp:TextBox ID="TextBoxfirstName"  placeholder="Primer Nombre" class="form-control" runat="server" required=""></asp:TextBox>
      </div>
    
      <div class="form-group">
        <label for="exampleInputEmail">Segundo Nombre</label>
        <asp:TextBox ID="TextBoxlastName"  placeholder="Segundo Nombre" class="form-control" runat="server" ></asp:TextBox>
      </div>

         <div class="form-group">
        <label for="exampleInputEmail">Primer Apellido</label>
        <asp:TextBox ID="TextBoxApellido1"  placeholder="Primer Apellido" class="form-control" runat="server" required=""></asp:TextBox>
      </div>

           <div class="form-group">
        <label for="exampleInputEmail">Segundo Apellido</label>
        <asp:TextBox ID="TextBoxApellido2"  placeholder="Segundo Apellido" class="form-control" runat="server" required=""></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="exampleInputEmail">Direccion</label>
        <asp:TextBox ID="TextBoxAddress"  placeholder="Direccion" class="form-control" runat="server" required=""></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="exampleInputPassword">Contraseña</label>
        <asp:TextBox ID="TextBoxPassword"  placeholder="Contraseña" class="form-control" runat="server" required=""></asp:TextBox>
      </div>

        <asp:Button ID="Button1"  class="btn btn-success btn-block" runat="server" Text="Enviar" OnClick="Button1_Click1"  />
        </ContentTemplate>   
            </asp:UpdatePanel>
        </div>
   </div>
  </div> 
</asp:Content>
