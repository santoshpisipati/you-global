<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavWork';
        var currentSubNav = '#rightNavWork';
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subheader">
        <h2>
            Thank You!</h2>
    </div>
    <div class="left_articles_noBorder">
        <p>
            Thank you for your interest in Jobs Alert.</p>
        <p>
            An email to activate your subscription has been sent.</p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SkyContent" runat="server">
    <div id="navContainer">
        <div id="mainNavigation">
            <div class="mainMenu">
                <%= Html.ActionLink("Upload Resume", "UploadResume", "Work", null, new { id = "rightNavUploadResume", @class = "menuItem" })%>
                <%= Html.ActionLink("Helpful Tips for Resume", "ResumeTips", "Work", null, new { id = "rightNavResumeTips", @class = "menuItem" })%>
            </div>
            <img src="/Content/images/imgs/RHS_module-4.gif" alt="" width="208" height="544"
                border="0" class="pad20" title="rightsideModules" />
        </div>
    </div>
</asp:Content>
