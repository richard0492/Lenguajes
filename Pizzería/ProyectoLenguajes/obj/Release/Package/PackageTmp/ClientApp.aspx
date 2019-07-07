<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="ClientApp.aspx.cs" Inherits="ProyectoLenguajes.ClientApp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    Cliente
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>
    body, html {height: 100%}
    body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}
    .bgimg { background-repeat: no-repeat; background-size: cover;   min-height: 90%; }

    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

  <div class="container">
      <div class="btn-group btn-group-justified">
            <a href="ClientOrder.aspx" class="btn btn-lg btn-danger">Orden</a>
            <a href="ClientInformation.aspx" class="btn btn-lg btn-danger">Informacion del Cliente</a>
      </div>
  </div>

     <div class="homeImages">
      <img src="Images/pizzaClient3.jpg"  class="img-responsive" alt="Responsive image" > 
   </div> 
  
<!-- Header with image -->
<div class="bgimg w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-bottomleft w3-padding">
      <span class="w3-tag w3-xlarge">La Muerta de Hambre</span>   
  </div>

    

</div>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
<!-- Menu Container -->
<div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="menu">
  <div class="w3-content">
  
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px">MENU</h1>
    <div class="w3-row w3-center w3-border w3-border-dark-grey">
      <a href="javascript:void(0)" onclick="openMenu(event, 'Pizza');" id="myLink">
 
     <asp:Button ID="Button1" class="w3-col s4 tablink w3-padding-large w3-hover-red w3-responsive" runat="server" Text="Todos los Platos" OnClick="Button1_Click" />


           <asp:Button ID="Button2" class="w3-col s4 tablink w3-padding-large w3-hover-red w3-responsive"  runat="server" Text="Filtrar" OnClick="Button2_Click" />
          <asp:TextBox ID="TextBox1"  class="w3-col s4 tablink w3-padding-large w3-hover" placeholder="Filtro" runat="server"></asp:TextBox>

      </a>

    </div>

    <div id="Pizza" class="w3-container menu w3-padding-32 w3-white">
        
        <div class="table-responsive">
        <asp:GridView ID="GridView1" runat="server" class="table" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn btn-lg btn-warning" CommandName="detail" Text="Detalle" >

                <ControlStyle CssClass="btn btn-info" />
                </asp:ButtonField>

            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle ForeColor="#330099" BackColor="White" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
 
      </div>      

  </div>
</div>



<!-- About Container -->
<div class="w3-container w3-padding-64 w3-red w3-grayscale w3-xlarge" id="about">
  <div class="w3-content">
    <h1 class="w3-center w3-jumbo" style="margin-bottom:64px">Sobre Nosotros</h1>
    <p>En 'La Muerta de Hambre' muchas cosas nos llevan a la excelencia, pero ninguna es tan importante como nuestro compromiso con la calidad. Nos enorgullece brindar un menú preparado con los mejores ingredientes. Desde los vegetales frescos hasta nuestra masa estirada a mano nunca congelada y la salsa de tomate de calidad superior, nos esforzamos por superar tus expectativas. Podemos asegurarte que todas nuestras pizzas están hechas con cero grasas trans. Si combinas nuestro compromiso total con la calidad con nuestros ingredientes superiores, el resultado es pura excelencia en pizza.</p>
   
    <h1><b>Horario</b></h1>
    
    <div class="w3-row">
      <div class="w3-col s6">
        <p>Lunes & Martes CERRADO</p>
        <p>Miercoles 10.00am - 12.00pm</p>
        <p>Jueves 10:00am - 12:00pm</p>
      </div>
      <div class="w3-col s6">
        <p>Viernes 10:00am - 12:00pm</p>
        <p>Sabado 10:00am - 12:00pm</p>
        <p>Domingo 10:00am - 12:00pm</p>
      </div>
    </div>
    
  </div>
</div>
      </ContentTemplate>
 </asp:UpdatePanel>

<script>

// Tabbed Menu
function openMenu(evt, menuName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("menu");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
  }
  document.getElementById(menuName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-red";
}
document.getElementById("myLink").click();
</script>



</asp:Content>
