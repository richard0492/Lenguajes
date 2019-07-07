<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="ProyectoLenguajes.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Detalle
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <div class="row">
    <div class="col-md-3">
        <asp:Button ID="Button2"  class="btn btn-danger" runat="server" Text="Regresar"  OnClick="Button1_Click"  />
    </div>

  <div class="col-md-6">
    <div class="container-fluid bg">  
    
         
    <asp:ScriptManager ID="ScriptManager1" runat= "server"></asp:ScriptManager>
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                 <ContentTemplate> 

                    
        <div class="form-conatiner">

            <br/>

            <h1 style="text-align:center">Detalle</h1>
        
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
   
            <asp:Button ID="ButtonAddOrder" class="btn btn-success btn-block"  runat="server" Text="Agregar a la Orden" OnClick="ButtonAddOrder_Click"  />
            </div>
        

                 </ContentTemplate>  

         </asp:UpdatePanel>
        </div>
      </div>

    <div class="col-md-3"> 

    </div>

</div>

</asp:Content>
