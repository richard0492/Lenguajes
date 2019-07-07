<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="ClientInformation.aspx.cs" Inherits="ProyectoLenguajes.ClientInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Informacion del Cliente
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    

    <div class="col-md-3">
         <asp:Button ID="ButtonBack"  class="btn btn-danger" runat="server" Text="Regresar" OnClick="ButtonBack_Click"   />
     </div>

    <div class="col-md-6">

     <div class="container-fluid bg">  

    <div class="form-conatiner">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>   
        
        <h1 style="text-align:center">Informacion del Cliente</h1>

                    <asp:Button ID="Button2" class="btn btn-info" runat="server" Text="Cargar Informacion Actual" OnClick="Button2_Click"  />
            <br/><br/>
      <div class="form-group">
        <label for="exampleInputEmail">Primer Nombre</label>
        <asp:TextBox ID="TextBoxfirstName"  class="form-control" runat="server" ></asp:TextBox>
      </div>
    
      <div class="form-group">
        <label for="exampleInputEmail">Segundo Nombre</label>
        <asp:TextBox ID="TextBoxlastName" class="form-control" runat="server" ></asp:TextBox>
      </div>

         <div class="form-group">
        <label for="exampleInputEmail">Primer Apellido</label>
        <asp:TextBox ID="TextBoxApellido1"  class="form-control" runat="server" ></asp:TextBox>
      </div>

           <div class="form-group">
        <label for="exampleInputEmail">Segundo Apellido</label>
        <asp:TextBox ID="TextBoxApellido2"  class="form-control" runat="server" ></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="exampleInputEmail">Direccion</label>
        <asp:TextBox ID="TextBoxAddress"   class="form-control" runat="server"></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="exampleInputPassword">Contraseña</label>
        <asp:TextBox ID="TextBoxPassword"   class="form-control" runat="server"></asp:TextBox>
      </div>

        <asp:Button ID="Button1"  class="btn btn-warning btn-block" runat="server" Text="Modificar" OnClick="Button1_Click"/>
        </ContentTemplate>   
            </asp:UpdatePanel>
        </div>
   </div>
  </div> 

</asp:Content>
