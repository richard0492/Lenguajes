<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="CRUDOrders.aspx.cs" Inherits="ProyectoLenguajes.CRUDOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Ordenes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
    <style type="text/css">
        .auto-style9 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 100%;
            left: 1px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>

    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <div class="col-md-3">
        <asp:Button ID="Button2"  class="btn btn-danger" runat="server" Text="Regresar"  OnClick="Button1_Click"  />
    </div>

  <div class="auto-style9">

     <div class="container-fluid bg">  
    
   
        <h1 style="text-align:center">Administrar Ordenes</h1>
         
        <!--Listar Ordenes -->
         <div class="form-conatiner">
             <h3 style="text-align:center">Filtrar Ordenes</h3>
             <br/>

            <!-- <div class="embed-responsive embed-responsive-16by9"> -->

             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                 <ContentTemplate> 
                     
                      
                           
                                       <label  for="exampleInputID">Correo Electronico</label>
                                       <asp:TextBox ID="TextBoxEmail"  runat="server" class="form-control embed-responsive-item" placeholder="Correo Electronico" Width="206px"></asp:TextBox>
                                   
                                  <br/>
                                  <br/>
                                   
                                 

                     
                                       <label  for="exampleInputID">
                                       Estados de un Pedido<asp:DropDownList ID="DropDownListStates" runat="server" Height="26px">
                                           <asp:ListItem Value="0"> - </asp:ListItem>
                                           <asp:ListItem Value="1">A tiempo </asp:ListItem>
                                           <asp:ListItem Value="2">Sobre tiempo</asp:ListItem>
                                           <asp:ListItem Value="3">Atrasado</asp:ListItem>
                                           <asp:ListItem Value="4">Anulado</asp:ListItem>
                                           <asp:ListItem Value="5">Entregado</asp:ListItem>
                                       </asp:DropDownList>
                                       </label>


                    <br/>
                     <br/>
    
                                 <label for="exampleInputStartDate">Fecha Inicio</label>
                                       
                                       <asp:Calendar ID="CalendarStartDate"  runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
                                           <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                                           <DayStyle BackColor="#CCCCCC" />
                                           <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                           <OtherMonthDayStyle ForeColor="#999999" />
                                           <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                           <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                                           <TodayDayStyle BackColor="#999999" ForeColor="White" />
                                       </asp:Calendar>
                                  
                         <br/>
                        <br/>
                     <label for="exampleInputFinishDate">Fecha Fin</label>
                                      <asp:Calendar ID="CalendarEndDate"  runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
                                          <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                                          <DayStyle BackColor="#CCCCCC" />
                                          <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                          <OtherMonthDayStyle ForeColor="#999999" />
                                          <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                          <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                                          <TodayDayStyle BackColor="#999999" ForeColor="White" />
                                       </asp:Calendar>

                                   
                            <br/>
                            <br/>     

                            <asp:Button ID="ButtonFilter" ControlStyle-CssClass="btn btn-success" runat="server" Text="Filtrar" OnClick="ButtonFilter_Click" />
                            <br/>
                            <br/>
                     <!-- </div> -->
                     <div class="table-responsive">
                     <asp:GridView ID="GridViewResult"  class="table table-dark" runat="server" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                           <AlternatingRowStyle BackColor="#F7F7F7" />
                           <Columns>
                               <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-warning"  CommandName="modifyStatus" Text="Modificar Estado" >
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
                 </ContentTemplate>  
         </asp:UpdatePanel>
            
             
        </div>
         <!-- Fin Listar Ordenes-->
  </div> 

</div>
</asp:Content>
