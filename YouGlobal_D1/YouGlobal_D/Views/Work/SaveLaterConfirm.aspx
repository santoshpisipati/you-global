<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        An email has been sent to you with a link to your partially completed application.
        The link will be valid until
        <% if (ViewData["sldt"] != null)
           { %>
        <%= ViewData["sldt"].ToString()%>
        <%} %>
        .</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SkyContent" runat="server">
</asp:Content>
