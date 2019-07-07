<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="ClientOrder.aspx.cs" Inherits="ProyectoLenguajes.ClientOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Orden
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
        
        <h1 style="text-align:center">Orden</h1>

                    <asp:Button ID="Button2" class="btn btn-info" runat="server" Text="Cargar Informacion Actual" OnClick="Button2_Click" />
                    <asp:Label ID="Label1" runat="server" Text="Total de la Orden:" Visible="false"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    <br/><br/>

         <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" class="table table-dark table-hover"  OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="Horizontal"  >
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
    
        <asp:Button ID="ButtonOrder"  class="btn btn-warning btn-block" runat="server" Visible="false" Text="Confirmar Pedido" OnClick="ButtonOrder_Click" />
             </div>
        </ContentTemplate>   
            </asp:UpdatePanel>
        </div>
   </div>
  </div> 


</asp:Content>
