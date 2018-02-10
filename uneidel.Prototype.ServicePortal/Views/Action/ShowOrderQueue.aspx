<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<uneidel.Prototype.ServicePortal.OrderEntity>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ShowOrderQueue
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <script src="../../javascript/jquery.simplemodal.js" type="text/javascript"></script> 
<script src="../../javascript/showorderqueue.js" type="text/javascript"></script>

<div id="basic-modal-content" class="well" style="max-width:44em;">
    <h4>Ablehnungsgrund:</h4><span id="denyOrder"></span>
    <p>Bitte geben Sie den Grund für die Ablehnung ein:</p>
    <textarea  id="txtDenyReason" rows="8" cols="40"></textarea>
    <br />
    <button class="basic_close fade_open btn btn-default" onclick="ApproveOrder($('#denyOrder').text(), false, $('#txtDenyReason').val());$.modal.close();">Ablehnen</button>
    
</div>
    <div id="left" style="width:65%">
    <h2>Show Order Queue</h2>
    <table class="grid">
   <tr>
      <th>DateTime</th>
      <th>OrderId</th>
      <th>Type</th>
      <th>Status</th>
       <th>Approval</th>
      <th>Request by User</th>
      
   </tr>
   <% foreach (var item in Model) { %>
   
   <tr class="orderrow" orderType="<%= item.Type %>" orderId="<%= item.Id %> ">
      <td class="left"><%= item.CreateDate %></td>
      <td class="left" ><%= item.Id %> </td>
      <td class="left"><%= item.Type %> </td>
      <td class="left"><%= item.Status %></td>
      <td class="left"><%= item.Approval %></td>
      <td class="left"><%= item.User %></td>
      <% if (item.Approval == "NeedApproval" && ViewData["Role"] == "admin") { %>
      <td class="left"><button name="Approve" onclick="ApproveOrder('<%=item.Id %>',true,'')" value="Approve">Bestätigen</button></td>
       <td class="left"><button name="Approve" onclick="ShowModalDialog('<%=item.Id %>')" value="Reject">Ablehnen</button></td>
       
      <% } %>       
   </tr>
   
<% } %>
</table>
        </div>
    <div id="right" style="float:right;width:30%">
         <div id="popup" style="display:none"></div>
    </div>
</asp:Content>
