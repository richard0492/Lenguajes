<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoLenguajes.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Login
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="col-md-3">
        <asp:Button ID="ButtonSessionClose"  class="btn btn-danger" runat="server" Text="Cerrar Sesion" OnClick="ButtonSessionClose_Click"   />

   </div>

    <div class="col-md-6">
        

     <div class="container-fluid bg">  


    <div class="form-conatiner"> 
        <h1 style="text-align:center">Iniciar Sesion</h1>
      <div class="form-group">
        <label for="exampleInputEmail">Correo Electronico</label>
        <asp:TextBox ID="TextBoxEmail" type="email" placeholder="Correo Electronico" class="form-control" runat="server" ></asp:TextBox>
    </div>

      <div class="form-group">
        <label for="exampleInputPassword">Contraseña</label>
        <asp:TextBox ID="TextBoxPassword" type="password" placeholder="Contraseña" class="form-control" runat="server" ></asp:TextBox>
      </div>

        <asp:Button ID="ButtonLoggin" class="btn btn-success btn-block" runat="server" Text="Enviar" OnClick="ButtonLoggin_Click"  />
    </div>
    
   </div>
        </div> 
    <div class="col-md-3">

   </div>
</asp:Content>
