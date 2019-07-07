<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="KitchenMenu.aspx.cs" Inherits="ProyectoLenguajes.KitchenMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Lista de Ordenes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
    <ul id="menuHeader" class="active">
        <li><a><i class="glyphicon glyphicon-user" style="color:white"></i>
            <asp:Label id="namelb" runat="server" Text="Label" style="color:white"></asp:Label>
            </a>
        </li>
        <li><a href="Login.aspx"><i class="glyphicon glyphicon-log-out" style="color:white"></i>Cerrar Sesión</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <div class="col-md-12">
        <div class="container-fluid bg">

            <h1 style="text-align: center">Cocina</h1>
            <div class="auto-style9">
                <h3 style="text-align: center">Lista de Ordenes</h3>
                <br />
                <div class="row">
                    <div class="auto-style10">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick">
                        </asp:Timer>
                        <br />
                        <div class="table-responsive">
                            <asp:GridView ID="GridViewResult" class="table" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" OnRowCommand="GridViewResult_RowCommand" Width="889px">
                                <Columns>
                                    <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-info" CommandName="ButtonDeliver" Text="Entregar" />
                                </Columns>
                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#33276A" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
