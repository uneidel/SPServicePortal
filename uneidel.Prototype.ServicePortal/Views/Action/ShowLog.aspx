<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IList<uneidel.Prototype.ServicePortal.Logging>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ShowLog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <table class="grid" width="800">
   <tr>
      <th>DateTime</th>
      <th>Action</th>
      <th>User</th>
      
   </tr>
   <% foreach (var item in Model) { %>
   
   <tr>
      <td class="left"><%= item.DateTime %></td>
      <td class="left"><%= item.Action %></td>
      <td class="left"><%= item.User %></td>      
   </tr>
   
<% } %>

</table> 

</asp:Content>
