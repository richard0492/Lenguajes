<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="KitchenMenu.aspx.cs" Inherits="ProyectoLenguajes.KitchenMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Lista de Ordenes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
     <style type="text/css">
        .auto-style9 {
            border: 0px solid #fff;
            padding: 50px 60px;
            margin-top: 5vh;
            -webkit-box-shadow: 1px 4px 26px 11px rgba(0,0,0,0.75);
            -moz-box-shadow: 1px 4px 26px 11px rgba(0,0,0,0.75);
            box-shadow: 1px 4px 26px 11px rgba(0,0,0,0.75);
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            margin-left: 40px;
        }
         .auto-style10 {
             position: relative;
             min-height: 1px;
             float: left;
             width: 104%;
             left: 0px;
             top: 0px;
             padding-left: 15px;
             padding-right: 15px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    
      

    <div class="col-md-12">
        <div class="container-fluid bg">  
 
        <h1 style="text-align:center">Cocina</h1>
            <div class="auto-style9">
        <h3 style="text-align:center">Lista de Ordenes</h3>


                <br />
             
        


                    

    <div class="row">
    <div class="auto-style10" >
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick">
        </asp:Timer>
        <br />
       <!-- <a href="#" class="thumbnail"> -->
   
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
       <!-- </a> -->
       </div>

  
  
    </div>
  
  
    </div>


 

     
         



        </div>
    </div>
</div>


</asp:Content>
