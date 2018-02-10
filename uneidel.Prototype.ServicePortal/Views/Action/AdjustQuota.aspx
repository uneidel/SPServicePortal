<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<uneidel.Prototype.ServicePortal.QuotaEntity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Adjust Quotas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="text-align:left">Quotas anpassen</h2>

    <% using (Html.BeginForm("AdjustQuota", "Action", "")) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Quota anpassen</legend>
            
            <label for="Template">SiteCollection:</label><br />
            <%= Html.DropDownListFor(model => model.Name,(SelectList)ViewData["SiteCollection"]) %>
            <div class="editor-field">
                <label for="Quota">Quota:</label><br />
               <%= Html.DropDownListFor(model => model.Quota, (SelectList)ViewData["Quotas"]) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
           
        </fieldset>

    <% } %>


</asp:Content>

