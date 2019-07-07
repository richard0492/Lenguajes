<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="ChangeStatusOrder.aspx.cs" Inherits="ProyectoLenguajes.ChangeStatusOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Modificar Orden
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">



    <div class="col-md-4"></div>

 <div class="col-md-3">
    <div class="form-conatiner">
        <h2>Modificar Estado</h2>
        <asp:DropDownList ID="DropDownListStates" runat="server" Height="26px" OnSelectedIndexChanged="DropDownListStates_SelectedIndexChanged">
            <asp:ListItem Value="0"> - </asp:ListItem>
            <asp:ListItem Value="4">Anulado</asp:ListItem>
            <asp:ListItem Value="5">Entregado</asp:ListItem>
        </asp:DropDownList>

    &nbsp;&nbsp; <asp:Button ID="ButtonUpdtState" ControlStyle-CssClass="btn btn-success" runat="server" Text="Actualizar estado" OnClick="ButtonFilter_Click" />

    </div>
 </div>

</asp:Content>
