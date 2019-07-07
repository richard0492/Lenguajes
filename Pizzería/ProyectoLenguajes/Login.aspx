<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoLenguajes.Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
    <ul id="menuHeader" class="active">
        <li><a href="SignUp.aspx"><i class="glyphicon glyphicon-list"></i>  Registrarse</a></li>
    </ul>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="contentBody" runat="server">

    <br />
    <br />
    <br />
    <br />
    <div id="login">
        <h1 style="text-align: center; color: #FFFFFF;">Iniciar Sesion</h1>
        <label for="exampleInputEmail" style="color: #FFFFFF">Correo Electronico</label><br />
        <asp:TextBox ID="TextBoxEmail" type="email" placeholder="Correo Electronico" runat="server" CssClass="form-control-sm" Height="35px" Width="220px" TextMode="Email" required="true"></asp:TextBox>
        <br />
        <br />
        <label for="exampleInputPassword" style="color: #FFFFFF">Contraseña</label>
        <br />
        <asp:TextBox ID="TextBoxPassword" type="password" placeholder="Contraseña" runat="server" CssClass="form-control-static input-sm" Height="35px" Width="220px" TextMode="Password" required="true"></asp:TextBox>
        <br />
        <br />
        <asp:LinkButton ID="ButtonLoggin" class="btn btn-success" runat="server" Text="Enviar" OnClick="ButtonLoggin_Click"><i class="glyphicon glyphicon-log-in"></i>  Iniciar Sesión</asp:LinkButton>
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
