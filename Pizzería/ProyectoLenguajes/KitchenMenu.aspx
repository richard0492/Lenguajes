<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="KitchenMenu.aspx.cs" Inherits="ProyectoLenguajes.KitchenMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Lista de Ordenes
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

    <div id="register">
        <h1 style="text-align: center; color: white">Cocina</h1>

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick">
        </asp:Timer>
        <br />

        <center>
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="padding-top:250px">
            <div class="modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h5 class="modal-title" id="exampleModalLongTitle" style="text-align: center">Confirmar Entrega</h5>
                    </div>
                    <div class="modal-body">
                        <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Aceptar" OnClick="Button1_Click" />
            <asp:Button ID="Button2" class="btn btn-danger" runat="server" Text="Rechazar" OnClick="Button2_Click" />

                    </div>
                </div>
            </div>
        </div>
            </center>
        <asp:Button ID="btnReturnOrder" runat="server" class="btn btn-success" Text="Regresar última orden" Height="53px" OnClick="btnReturnOrder_Click" Width="242px" />
        <center>

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
            <asp:Label ID="lbOrdesInQueue" runat="server" BackColor="#009900" BorderColor="#00CCFF" CssClass="bg-warning" Font-Bold="True" ForeColor="White" Text="Pueden existir más órdenes en cola..." Visible="False"></asp:Label>
                        </center>
    </div>
</asp:Content>
