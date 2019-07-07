<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="CRUDUsers.aspx.cs" Inherits="ProyectoLenguajes.CRUDUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Administrar Usuarios
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
        <h1 style="text-align: center; color: white">Administrar Usuarios</h1>

        <asp:LinkButton ID="btnAdd" ControlStyle-CssClass="btn btn-success" runat="server" OnClick="btnAdd_Click"><i class="glyphicon glyphicon-plus-sign" style="color: white"></i>  Agregar</asp:LinkButton>
        <br />
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle" style="text-align: center">Inserar Usuario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="exampleInputEmail">Correo Electronico</label>
                            <asp:TextBox ID="TextBoxEmail" type="email" placeholder="Correo Electronico" class="form-control" runat="server"></asp:TextBox>

                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail">Primer Nombre</label>
                            <asp:TextBox ID="TextBoxFirstName" placeholder="Primer Nombre" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail">Segundo Nombre</label>
                            <asp:TextBox ID="TextBoxSecondName" placeholder="Segundo Nombre" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail">Primer Apellido</label>
                            <asp:TextBox ID="TextBoxApellido1" placeholder="Primer Apellido" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail">Segundo Apellido</label>
                            <asp:TextBox ID="TextBoxApellido2" placeholder="Segundo Apellido" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail">Direccion</label>
                            <asp:TextBox ID="TextBoxAddress" placeholder="Direccion" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPassword">Contraseña</label>
                            <asp:TextBox ID="TextBoxPassword" placeholder="Contraseña" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:CheckBox ID="CheckBoxEnabled" runat="server" class="form-control" Text="Habilitado" />
                        </div>

                        <div class="form-group" style="text-align: center">
                            <label for="exampleInputUser">Tipo de Usuario</label>
                            <div class="radio" style="text-align: center">
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="550px">
                                    <asp:ListItem Text="Administrador" Value="1" />
                                    <asp:ListItem Text="Cliente" Value="2" />
                                    <asp:ListItem Text="Cocinero" Value="3" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="ButtonADDUser" class="btn btn-success btn-block" runat="server" Text="Agregar Usuario" OnClick="ButtonADDUser_Click" />

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="exampleModalCenterU" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitleU" style="text-align: center">Actualizar Usuario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="exampleInputEmailU">Email</label>
                            <asp:TextBox ID="TextBoxEmailU" placeholder="Email" class="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmailU">Primer Nombre</label>
                            <asp:TextBox ID="TextBoxFirstNameU" placeholder="Primer Nombre" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmailU">Segundo Nombre</label>
                            <asp:TextBox ID="TextBoxSecondNameU" placeholder="Segundo Nombre" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmailU">Primer Apellido</label>
                            <asp:TextBox ID="TextBoxApellido1U" placeholder="Primer Apellido" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmailU">Segundo Apellido</label>
                            <asp:TextBox ID="TextBoxApellido2U" placeholder="Segundo Apellido" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmailU">Direccion</label>
                            <asp:TextBox ID="TextBoxAddressU" placeholder="Direccion" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPasswordU">Contraseña</label>
                            <asp:TextBox ID="TextBoxPasswordU" placeholder="Contraseña" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <asp:CheckBox ID="CheckBoxEnabledU" runat="server" class="form-control" Text="Habilitado" />
                        </div>

                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="ButtonU_User" class="btn btn-success" runat="server" Text="Editar Usuario" OnClick="ButtonUUser_Click1" />

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="GridView1" class="table " runat="server" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                <Columns>
                    <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-warning" CommandName="buttonUpdate" Text="Modificar">
                        <ControlStyle CssClass="btn btn-warning" />
                    </asp:ButtonField>
                    <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-danger" CommandName="buttonDelete" Text="Eliminar">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:ButtonField>
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
</asp:Content>
