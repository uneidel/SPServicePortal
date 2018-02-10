<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
    <p>
       <h3>Features:</h3>
        <ul>
            <li>Unterscheidung zwischen BasisBetrieb und Spezialist</li>
            <li>Unterbindung des Zugriffs auf Central Administration</li>
            <li>Fehlerreduktion</li>
            <li>Least Privilege</li>
            <li>Logging aller Aktivitäten</li>
            <li>ServicePortalDatenbank als zentrale Datenquelle für Analysen, Trends</li>
        </ul>
       <h3>Umgesetzte BeispielFunktionalität</h3>
        <ul>
            <li>SiteCollection anlegen</li>
            <li>Quotas anpassen</li>
            <li>Rollenbasierte Administration (Admin/Approver, Requester)</li>
            <li>Statistiken</li>
            <li>Eingabe Validierung</li>
        </ul> 
    </p>
</asp:Content>
