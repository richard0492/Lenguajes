<%@ Page Title="" Language="C#" MasterPageFile="~/IndexMasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ProyectoLenguajes.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentTittle" runat="server">
    La Muerta de Hambre
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3"  ContentPlaceHolderID="contentBody" runat="server">
  


    <button type="button" class="btn btn-secondary btn-lg btn-block "  style="align-content:center" data-toggle="modal" data-target="#exampleModalCenter">
     Horario
    </button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle" style="align-content:center;">La Muerta de Hambre - Horario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="w3-row">
      <div class="w3-col s6" >
        <p style="text-align:center;">Lunes & Martes CERRADO</p>
        <p style="text-align:center;">Miercoles 10.00am - 12.00pm</p>
        <p style="text-align:center;">Jueves 10:00am - 12:00pm</p>
      </div>
      <div class="w3-col s6" >
        <p style="text-align:center;">Viernes 10:00am - 12:00pm</p>
        <p style="text-align:center;">Sabado 10:00am - 12:00pm</p>
        <p style="text-align:center;">Domingo 10:00am - 12:00pm</p>
      </div>
    </div>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

    <div class="homeImages">
      <img src="Images/pizza0.jpg"  class="img-thumbnail" alt="Responsive image" > 
   </div> 


&nbsp;&nbsp;&nbsp;  
</asp:Content>
