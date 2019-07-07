<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="CRUDPlates.aspx.cs" Inherits="ProyectoLenguajes.CRUDPlates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Administrar Platos
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 316px;
            height: 195px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="col-md-2">
        <asp:Button ID="Button2"  class="btn btn-danger" runat="server" Text="Regresar"  OnClick="Button1_Click"  />

    </div>

  <div class="col-md-8">

     <div class="container-fluid bg">  
    
   
        <h1 style="text-align:center">Administrar Platos</h1>
         
        <!--Listar Platos -->
         <div class="form-conatiner">
             <h3 style="text-align:center">Lista de Platos</h3>

             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                 <ContentTemplate> 

                      <label for="exampleInputID">Buscar</label>
                      <asp:TextBox ID="TextBoxFilter" class="form-control" runat="server" placeholder="Codigo" Width="178px"></asp:TextBox>
                      <asp:Button ID="ButtonFilter" ControlStyle-CssClass="btn btn-success" runat="server" Text="Filtrar" OnClick="ButtonFilter_Click" />
                      <asp:Button ID="ButtonFullList" ControlStyle-CssClass="btn btn-info" runat="server" Text="Toda la Lista" OnClick="ButtonFullList_Click" />
                      <br/>
                      <br/> 


                      
                     <div class="table-responsive">
                      <asp:GridView ID="GridViewPlates" class="table"  runat="server" OnRowCommand="GridViewPlates_RowCommand" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" >
                          <Columns>
                              
                              <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-warning" CommandName="buttonUpdate" Text="Modificar" >
                              <ControlStyle CssClass="btn btn-warning"/>
                              </asp:ButtonField>

                              <asp:ButtonField ButtonType="Button"  ControlStyle-CssClass="btn btn-danger" CommandName="buttonDelete" Text="Eliminar" >

                              <ControlStyle CssClass="btn btn-danger"/>
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
                 </ContentTemplate>  
         </asp:UpdatePanel>
             
        </div>
         <!-- Fin Listar Platos-->
        



                <!--Agregar --> 


         <form class="" enctype="multipart/form-data" method="post">
      
             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                 <ContentTemplate> 

            <div class="form-conatiner">
        <h3 style="text-align:center">Agregar Platos</h3>
        <div class="form-group">
        <label for="exampleInputName">Nombre</label>
        <asp:TextBox ID="TextBoxName" type="text" placeholder="Nombre" class="form-control" runat="server" ></asp:TextBox>

      </div>

        <div class="form-group">
        <label for="exampleInputDescription">Descripcion</label>
        <asp:TextBox ID="TextBoxFullDescription"  placeholder="Descripcion" class="form-control" runat="server" ></asp:TextBox>
      </div>

        <div class="form-group">
        <label for="exampleInputPrice">Precio</label>
        <asp:TextBox ID="TextBoxPrice"  type="number"  class="form-control" runat="server"></asp:TextBox>
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
            <label for="exampleInputPhoto">Fotografia</label>
            <asp:FileUpload ID="InsertPhoto" class="form-control" runat="server" onchange="showimagepreview(this)" />
            <img  src="NULL" id="img" alt="" style="width : 200px" />
       </div>

        <div class="form-group">
        <label for="exampleInputPrice">Tiempo de Preparacion</label>
        <asp:TextBox ID="TextBoxTimeToPrepare"  type="number" placeholder="Tiempo de Preparacion" class="form-control" runat="server" ></asp:TextBox>
      </div>

            <div class="form-group">
                 
                <asp:CheckBox ID="CheckBoxEnabled" runat="server" class="form-control" Text="Plato Habilitado"/>
                     
            </div>
            


        <asp:Button ID="ButtonADDPlate"  class="btn btn-success btn-block" runat="server" Text="Agregar Plato" OnClick="ButtonADDPlate_Click"  />
        </div>
        

        </ContentTemplate>  

                 <triggers>
                   <asp:PostBackTrigger runat="server"  ControlID="ButtonADDPlate" />
                 </triggers>

         </asp:UpdatePanel>

             

         </form>


  </div> 

</div>
    
 
   
</asp:Content>
         
