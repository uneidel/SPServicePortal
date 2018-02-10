<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<uneidel.Prototype.ServicePortal.Logging>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Request sucessfully submitted
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Submission Status</h2>
    <p><span>Request successfully queued</span></p>
    <h2>  <%= Html.Encode(ViewData["Status"]) %></h2>
</asp:Content>
