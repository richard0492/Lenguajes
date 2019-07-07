<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminMenu.aspx.cs" Inherits="ProyectoLenguajes.AdminMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Administrador
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <div class="col-md-4"></div>

    <div class="col-md-3">

        <h1 style="text-align:center">Administrar</h1><br/>

    <div class="form-conatiner">


        <asp:Button ID="ButtonPlates" class="btn btn-info btn-lg btn-block" runat="server" Text="Platos" OnClick="Button1_Click" />
        <asp:Button ID="ButtonCustomers" class="btn btn-info btn-lg  btn-block" runat="server" Text="Usuarios" OnClick="ButtonCustomers_Click" />
        <asp:Button ID="ButtonOrders" class="btn btn-info btn-lg btn-block"  runat="server" Text="Ordenes" OnClick="ButtonOrders_Click" />

    </div>
        </div>

</asp:Content>
