<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<uneidel.Prototype.ServicePortal.SCEntity>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	CreateSiteCollection
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="../../javascript/createSiteCollection.js"></script>
    <h2 style="text-align:left">SiteCollection anlegen</h2>

    <% using (Html.BeginForm("CreateSiteCollection", "Action", "")) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>SiteCollection Angaben</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Id) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Id) %>
                <%= Html.ValidationMessageFor(model => model.Id) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field CheckName">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>
            <div class="editor-label">
                <%= Html.LabelFor(model => model.SCOwner) %>
            </div>
            <div class="editor-field CheckName">
                <%= Html.TextBoxFor(model => model.SCOwner) %>
                <%= Html.ValidationMessageFor(model => model.SCOwner) %>
            </div>
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Description) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Description) %>
                <%= Html.ValidationMessageFor(model => model.Description) %>
            </div>
            <div class="editor-field">
            <label for="Template">Template:</label><br />
            <%= Html.DropDownListFor(model => model.Template, (SelectList)ViewData["Template"]) %>
            </div>
            <div class="editor-field">
            <label for="Template">Behoerde:</label><br />
            <%= Html.DropDownListFor(model => model.BehoerdenId, (SelectList)ViewData["Behoerden"]) %>
            </div>
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

