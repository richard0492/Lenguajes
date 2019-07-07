<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="KitchenConfirm.aspx.cs" Inherits="ProyectoLenguajes.KitchenConfirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Confirmacion
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="col-md-4"></div>

    <div class="col-md-3">

        <h1 style="text-align:center">Confirmacion</h1><br/>

    <div class="form-conatiner">

        <label>Desea Realizar la Entrega de TODA la Orden?</label> <br/><br/>
        <div class="btn-group" role="group" aria-label="Basic example">

            <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Aceptar" OnClick="Button1_Click" />
            <asp:Button ID="Button2" class="btn btn-danger" runat="server" Text="Rechazar" OnClick="Button2_Click" />
</div>
        

    </div>
        </div>

</asp:Content>
