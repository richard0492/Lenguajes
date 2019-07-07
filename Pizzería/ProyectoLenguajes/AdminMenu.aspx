<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminMenu.aspx.cs" Inherits="ProyectoLenguajes.AdminMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Administrador
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
    <ul id="menuHeader" class="active">
        <li><a><i class="glyphicon glyphicon-user" style="color: white"></i>
            <asp:Label id="namelb" runat="server" Text="Label" style="color: white"></asp:Label>
        </a>
        </li>
        <li><a href="Login.aspx"><i class="glyphicon glyphicon-log-out" style="color: white"></i>Cerrar Sesión</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <div id="register">
        <h1 style="text-align: center; color: #FFFFFF;">Administrar</h1>
        <br />
        <div class="form-conatiner">
            <asp:LinkButton ID="ButtonPlates" class="btn btn-info" runat="server" Text="Platos" OnClick="Button1_Click" Height="60px" Width="200px" Font-Size="X-Large"><i class="glyphicon glyphicon-cutlery" style="font-size: x-large"></i> Platos</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="ButtonCustomers" class="btn btn-info" runat="server" Text="Usuarios" OnClick="ButtonCustomers_Click" Height="60px" Width="200px" Font-Size="X-Large"><i class="glyphicon glyphicon-user" style="font-size: x-large"></i> Usuarios</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="ButtonOrders" class="btn btn-info" runat="server" Text="Ordenes" OnClick="ButtonOrders_Click" Height="60px" Width="200px" Font-Size="X-Large"><i class="glyphicon glyphicon-folder-open" style="font-size: x-large"></i> Ordenes</asp:LinkButton>
        </div>
    </div>
</asp:Content>
