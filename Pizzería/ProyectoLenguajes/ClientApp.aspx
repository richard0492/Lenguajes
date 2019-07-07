<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="ClientApp.aspx.cs" Inherits="ProyectoLenguajes.ClientApp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Cliente
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
        <div class="container">
            <div class="btn-group btn-group-justified">
                <asp:LinkButton ID="orders" class="btn btn-lg btn-danger" runat="server" OnClick="orders_Click">LinkButton</asp:LinkButton>
                <a href="ClientOrder.aspx" class="btn btn-lg btn-danger">Orden</a>
                <a href="ClientInformation.aspx" class="btn btn-lg btn-danger">Informacion del Cliente</a>
            </div>
        </div>


        <h1 class="w3-center w3-jumbo" style="margin-bottom: 64px">MENU</h1>

        <center>
         <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle" style="text-align: center">Agregar Orden</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                         <div class="form-group">
        <label for="exampleInputName">Nombre</label>
        <asp:TextBox ID="TextBoxName" type="text"  class="form-control" runat="server" ReadOnly="true"></asp:TextBox>

      </div>

        <div class="form-group">
        <label for="exampleInputDescription">Descripcion</label>
        <asp:TextBox ID="TextBoxFullDescription"  class="form-control" runat="server" ReadOnly="true" ></asp:TextBox>
      </div>

        <div class="form-group">
        <label for="exampleInputPrice">Precio</label>
        <asp:TextBox ID="TextBoxPrice"  type="text" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
      </div>

        <div class="form-group">
         
            <label for="exampleInputPhoto">Fotografia</label>

            <asp:Image ID="Image1" runat="server" style="width: 250px"/>
       </div>


      <div class="form-group">
        <label for="exampleInputPrice">Cantidad del Platos</label>
        <asp:TextBox ID="TextBoxQuantity"  type="text" class="form-control" runat="server" ></asp:TextBox>
      </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="ButtonAddOrder" class="btn btn-success"  runat="server" Text="Agregar a la Orden" OnClick="ButtonAddOrder_Click" />

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
            </center>

        <center>
         <div class="modal fade" id="exampleModalCenterOrder" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-md" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitleOrder" style="text-align: center">Carrito de Ordenes</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                         <asp:Label ID="Label1" runat="server" Text="Total de la Orden:" Visible="false"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    <br/><br/>
                          <div class="table-responsive">
        <asp:GridView ID="GridView2" runat="server" class="table table-dark table-hover"  OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="Horizontal"  >
            <Columns>
                <asp:ButtonField ButtonType="Button"  ControlStyle-CssClass=" btn btn-danger" CommandName="ButtonDelete" Text="Eliminar" />
            </Columns>
             <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
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
                    <div class="modal-footer">

                                <asp:Button ID="ButtonOrder"  class="btn btn-warning btn-block" runat="server" Visible="false" Text="Confirmar Pedido" OnClick="ButtonOrder_Click" />

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
            </center>

        <asp:LinkButton ID="Button2" class="btn btn-lg btn-warning" runat="server" Text="Filtrar" OnClick="Button2_Click"> <i class="glyphicon glyphicon-search" style="color: white"></i>   Filtrar</asp:LinkButton>
        <asp:TextBox ID="TextBox1" class="w3-col s4 tablink w3-padding-large w3-hover" placeholder="Filtro" runat="server"></asp:TextBox>

        <div class="table-responsive" style="text-align: center">
            <center>
            <asp:GridView ID="GridView1" runat="server" class="table" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCommand="GridView1_RowCommand" Width="500px" CssClass="form-control-static">
                <Columns>
                    <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-lg btn-warning" CommandName="detail" Text="Detalle">

                        <ControlStyle CssClass="btn btn-info" />
                    </asp:ButtonField>

                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle ForeColor="#330099" BackColor="White" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            </center>
            <br />

        </div>
    </div>
</asp:Content>
