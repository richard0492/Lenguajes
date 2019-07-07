<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="CRUDOrders.aspx.cs" Inherits="ProyectoLenguajes.CRUDOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Ordenes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
    <ul id="menuHeader" class="active">
        <li><a><i class="glyphicon glyphicon-user" style="color: white"></i>
            <asp:Label id="namelb" runat="server" Text="Label" style="color: white"></asp:Label>
        </a>
        </li>
        <li><a href="AdminMenu.aspx" style="color: white"><i class="glyphicon glyphicon-step-backward" style="color: white"></i>Regresar</a></li>

        <li><a href="Login.aspx"><i class="glyphicon glyphicon-log-out" style="color: white"></i>Cerrar Sesión</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <br />
    <br />
    <div id="register">
        <h1 style="text-align: center; color: white">Administrar Ordenes</h1>

        <asp:LinkButton ID="btnSearch" ControlStyle-CssClass="btn btn-success" runat="server" OnClick="btnSearch_Click"><i class="glyphicon glyphicon-search" style="color: white"></i>  Filtrar Ordenes</asp:LinkButton>

        <br />
        <center>
         <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle" style="text-align: center">Filtrar Ordenes</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <label for="exampleInputID">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Correo Electronico</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
        <asp:TextBox ID="TextBoxEmail" runat="server" class="form-group-sm" placeholder="Correo Electronico" Width="200px"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        &nbsp;<label for="exampleInputID">&nbsp; Estados de un Pedido<br />
&nbsp;<asp:DropDownList ID="DropDownListStates" runat="server" Height="26px">
            <asp:ListItem Value="0"> - </asp:ListItem>
            <asp:ListItem Value="1">A tiempo </asp:ListItem>
            <asp:ListItem Value="2">Sobre tiempo</asp:ListItem>
            <asp:ListItem Value="3">Atrasado</asp:ListItem>
            <asp:ListItem Value="4">Anulado</asp:ListItem>
            <asp:ListItem Value="5">Entregado</asp:ListItem>
        </asp:DropDownList>
                        </label>

                        <br />
                        <br />

                        <label for="exampleInputStartDate">Fecha Inicio</label>

                        <br />
                        <asp:TextBox ID="TextBoxStatDate" CssClass="form-control-static input-sm" runat="server" TextMode="Date"></asp:TextBox>

                        <br />
                        <br />
                        <label for="exampleInputFinishDate">Fecha Fin</label>
                        <br />

                        <asp:TextBox ID="TextBoxEndDate" CssClass="form-control-static input-sm" runat="server" TextMode="Date"></asp:TextBox>

                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="ButtonFilter" ControlStyle-CssClass="btn btn-success" runat="server" Text="Filtrar" OnClick="ButtonFilter_Click" />

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
            </center>
        <div class="table-responsive">
            <asp:GridView ID="GridViewResult" class="table table-dark" runat="server" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <Columns>
                    <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-warning" CommandName="modifyStatus" Text="Modificar Estado">
                        <ControlStyle CssClass="btn btn-warning" />
                    </asp:ButtonField>
                </Columns>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
