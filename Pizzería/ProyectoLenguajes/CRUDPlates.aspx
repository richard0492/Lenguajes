<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="CRUDPlates.aspx.cs" Inherits="ProyectoLenguajes.CRUDPlates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Administrar Platos
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
        <h1 style="text-align: center; color: white">Administrar Platos</h1>

        <asp:LinkButton ID="btnAdd" ControlStyle-CssClass="btn btn-success" runat="server" OnClick="btnAdd_Click"><i class="glyphicon glyphicon-plus-sign" style="color: white"></i>  Agregar</asp:LinkButton>
        <br />


        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle" style="text-align: center">Inserar Plato</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <label for="exampleInputName">Nombre</label>
                            <asp:TextBox ID="TextBoxName" type="text" placeholder="Nombre" class="form-control" runat="server"></asp:TextBox>

                        </div>

                        <div class="form-group">
                            <label for="exampleInputDescription">Descripcion</label>
                            <asp:TextBox ID="TextBoxFullDescription" placeholder="Descripcion" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPrice">Precio</label>
                            <asp:TextBox ID="TextBoxPrice" type="number" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <script type="text/javascript">
                                function showimagepreview(input) {
                                    if (input.files && input.files[0]) {
                                        var reader = new FileReader();
                                        reader.onload = function (e) {
                                            document.getElementsByTagName("img")[1].setAttribute("src", e.target.result);
                                        }
                                        reader.readAsDataURL(input.files[0]);
                                    }
                                }
                            </script>
                            <label for="exampleInputPhoto">Fotografía</label>
                            <asp:FileUpload ID="InsertPhoto" class="form-control" runat="server" onchange="showimagepreview(this)" />
                            <img src="NULL" id="img" alt="" style="width: 200px" />
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPrice">Tiempo de Preparacion</label>
                            <asp:TextBox ID="TextBoxTimeToPrepare" type="number" placeholder="Tiempo de Preparacion" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">

                            <asp:CheckBox ID="CheckBoxEnabled" runat="server" class="form-control" Text="Plato Habilitado" />

                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="ButtonADDPlate" class="btn btn-success" runat="server" Text="Agregar Plato" OnClick="ButtonADDPlate_Click" />

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="exampleModalCenterU" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitleU" style="text-align: center">Actualizar Plato</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                         <div class="form-group">
                            <label for="exampleInputIDU">Nombre</label>
                            <asp:TextBox ID="TextBoxID" type="text" placeholder="ID" class="form-control" runat="server" Enabled="false"></asp:TextBox>

                        </div>
                        <div class="form-group">
                            <label for="exampleInputNameU">Nombre</label>
                            <asp:TextBox ID="TextBoxNameU" type="text" placeholder="Nombre" class="form-control" runat="server"></asp:TextBox>

                        </div>

                        <div class="form-group">
                            <label for="exampleInputDescriptionU">Descripcion</label>
                            <asp:TextBox ID="TextBoxFullDescriptionU" placeholder="Descripcion" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPriceU">Precio</label>
                            <asp:TextBox ID="TextBoxPriceU" type="text" placeholder="Precio" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <script type="text/javascript">
                                function showimagepreviewU(input) {
                                    if (input.files && input.files[0]) {
                                        var reader = new FileReader();
                                        reader.onload = function (e) {
                                            document.getElementsByTagName("img")[1].setAttribute("src", e.target.result);
                                        }
                                        reader.readAsDataURL(input.files[0]);
                                    }
                                }
                            </script>
                            <label for="exampleInputPhotoU">Fotografia</label>
                            <asp:FileUpload ID="InsertPhotoU" class="form-control" runat="server" onchange="showimagepreview(this)" />


                            <asp:Image ID="Image1" runat="server" Style="width: 250px" />
                        </div>

                        <div class="form-group">
                            <label for="exampleInputPriceU">Tiempo de Preparacion</label>
                            <asp:TextBox ID="TextBoxTimeToPrepareU" type="text" placeholder="Tiempo de Preparacion" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">

                            <asp:CheckBox ID="CheckBoxEnabledU" runat="server" class="form-control" Text="Plato Habilitado" />

                        </div>

                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="ButtonUPlate" class="btn btn-success" runat="server" Text="Editar Plato" OnClick="ButtonUPlate_Click1" />

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="table-responsive">
            <asp:GridView ID="GridViewPlates" class="table" runat="server" OnRowCommand="GridViewPlates_RowCommand" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
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
                <RowStyle ForeColor="Black" BackColor="#DEDFDE" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>

