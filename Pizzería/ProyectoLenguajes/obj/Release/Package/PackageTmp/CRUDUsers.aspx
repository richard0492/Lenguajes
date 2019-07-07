<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="CRUDUsers.aspx.cs" Inherits="ProyectoLenguajes.CRUDUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Administrar Usuarios
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="col-md-2"> 
        <asp:Button ID="Button2"  class="btn btn-danger" runat="server" Text="Regresar"  OnClick="Button1_Click"  />
    </div>

  <div class="col-md-8">

     <div class="container-fluid bg">  
    
   
        <h1 style="text-align:center">Administrar Usuarios</h1>
         
        <!--Listar Usuarios -->
         <div class="form-conatiner">
             <h3 style="text-align:center">Lista de Usuarios</h3>

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
                     <asp:GridView ID="GridView1" class="table " runat="server" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                         <Columns>
                             <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-warning" CommandName="buttonUpdate" Text="Modificar" >
                             <ControlStyle CssClass="btn btn-warning" />
                             </asp:ButtonField>
                             <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-danger" CommandName="buttonDelete" Text="Eliminar" >
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
                     
                     

                 </ContentTemplate>  
         </asp:UpdatePanel>
             
             
        </div>
         <!-- Fin Listar Usuarios-->
        



                <!--Agregar --> 


       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
       <ContentTemplate> 

            <div class="form-conatiner">
            <h3 style="text-align:center">Agregar Usuarios</h3>
        <div class="form-group">
        <label for="exampleInputEmail">Correo Electronico</label>
        <asp:TextBox ID="TextBoxEmail" type="email" placeholder="Correo Electronico" class="form-control" runat="server" ></asp:TextBox>

      </div>

      <div class="form-group">
        <label for="exampleInputEmail">Primer Nombre</label>
        <asp:TextBox ID="TextBoxFirstName"  placeholder="Primer Nombre" class="form-control" runat="server" ></asp:TextBox>
      </div>
    
      <div class="form-group">
        <label for="exampleInputEmail">Segundo Nombre</label>
        <asp:TextBox ID="TextBoxSecondName"  placeholder="Segundo Nombre" class="form-control" runat="server" ></asp:TextBox>
      </div>

         <div class="form-group">
        <label for="exampleInputEmail">Primer Apellido</label>
        <asp:TextBox ID="TextBoxApellido1"  placeholder="Primer Apellido" class="form-control" runat="server" ></asp:TextBox>
      </div>

           <div class="form-group">
        <label for="exampleInputEmail">Segundo Apellido</label>
        <asp:TextBox ID="TextBoxApellido2"  placeholder="Segundo Apellido" class="form-control" runat="server" ></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="exampleInputEmail">Direccion</label>
        <asp:TextBox ID="TextBoxAddress"  placeholder="Direccion" class="form-control" runat="server" ></asp:TextBox>
      </div>

      <div class="form-group">
        <label for="exampleInputPassword">Contraseña</label>
        <asp:TextBox ID="TextBoxPassword"  placeholder="Contraseña" class="form-control" runat="server" ></asp:TextBox>
      </div>

            <div class="form-group">
                <asp:CheckBox ID="CheckBoxEnabled" runat="server" class="form-control" Text="Habilitado"/>  
            </div>

           <div class="form-group">   
               <label for="exampleInputUser">Tipo de Usuario</label>
               <div class="radio" >
               <asp:RadioButtonList ID="RadioButtonList1"  runat="server">
                   <asp:ListItem Text ="Administrador"  Value="1"/>
                   <asp:ListItem Text ="Cliente" Value="2"/>
                   <asp:ListItem Text ="Cocinero" Value="3"/>
               </asp:RadioButtonList>
                </div>
            </div>

                



      
                <asp:Button ID="ButtonADDUser" class="btn btn-success btn-block" runat="server" Text="Agregar Usuario" OnClick="ButtonADDUser_Click" />

                
       </ContentTemplate>   

       </asp:UpdatePanel>

             
  </div> 

</div>
    
 
   
</asp:Content>
