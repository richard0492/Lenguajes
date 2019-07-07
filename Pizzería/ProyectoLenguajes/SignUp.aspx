<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ProyectoLenguajes.SignUp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Registrarse
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
    <ul id="menuHeader" class="active">
        <li><a href="Login.aspx"><i class="glyphicon glyphicon-home"></i>   Inicio</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <br />
    <div id="register">
        <h1 style="text-align: center; color: #FFFFFF;">Registrarse</h1>
        <br />
        <label for="exampleInputEmail" class="tab-content" style="color:white">Correo Electronico</label>
        <br />
        <asp:TextBox ID="TextBoxEmail" type="email" placeholder="Correo Electronico" class="form-control-sm" runat="server" required="true" Height="35px" Width="220px"></asp:TextBox>

        <br />
        <br />

        <label for="exampleInputEmail" style="color:white">Primer Nombre</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <label for="exampleInputEmail" style="color:white">Segundo Nombre</label>
        <br />
        <asp:TextBox ID="TextBoxfirstName" placeholder="Primer Nombre" class="form-control-sm" runat="server" required="true" Height="35px" Width="220px"></asp:TextBox>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxlastName" placeholder="Segundo Nombre" class="form-control-sm" runat="server" Height="35px" Width="220px"></asp:TextBox>

        <br />
        <br />

        <label for="exampleInputEmail" style="color:white">Primer Apellido</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <label for="exampleInputEmail" style="color:white">Segundo Apellido</label><br />
        <asp:TextBox ID="TextBoxApellido1" placeholder="Primer Apellido" class="form-control-sm" runat="server" required="true" Height="35px" Width="220px"></asp:TextBox>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxApellido2" placeholder="Segundo Apellido" class="form-control-sm" runat="server" required="true" Height="35px" Width="220px"></asp:TextBox>

        <br />
        <br />

        <label for="exampleInputEmail" style="color:white">Direccion</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <label for="exampleInputPassword" style="color:white">Contraseña</label><br />
        <asp:TextBox ID="TextBoxAddress" placeholder="Direccion" class="form-control-sm" runat="server" required="true" Height="35px" Width="220px"></asp:TextBox>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxPassword" placeholder="Contraseña" class="form-control-sm" runat="server" required="true" Height="35px" Width="220px" TextMode="Password"></asp:TextBox>

        <br />

        <br />

        <br />
        <asp:LinkButton ID="Button1" class="btn btn-success" runat="server" Text="Enviar" OnClick="Button1_Click1" > <i class="glyphicon glyphicon-floppy-saved"></i>  Registrarse</asp:LinkButton>
        <br />
        <br />
    </div>
</asp:Content>
