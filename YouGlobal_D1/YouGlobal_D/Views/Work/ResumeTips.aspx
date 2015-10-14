<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavWork';
        var currentSubNav = '#rightNavResumeTips';
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subheader">
        <h2>
            Helpful Tips for Resume</h2>
    </div>
    <div class="left_articles_noBorder">
        <p>
            Before you submit your CV / Resume, there are certain pieces of information which
            are very useful to know upfront, and will mean we can speed things up in terms of
            processing CVs. Here is a quick check-list to bear in mind:
            <br />
            <br />
        </p>
        <ul>
            <li>If you accepted a position, what would be your availability in terms of time frame?</li>
            <li>Your age or birth date?</li>
            <li>Your nationality?</li>
            <li>Your current salary?</li>
            <li>Do you have any particular salary expectations, or minimum salary requirements?</li>
            <li>For future reference, specific companies you would prefer that we NOT talk with,
                or companies where you know that your CV has already been submitted.</li>
            <li>Do you have any location preferences, or restrictions?</li>
            <li>Not essential, but incorporating a small portrait photograph in your CV often helps
                with presentation. If you happen to have such a photograph, do include it please.
                No problem if you prefer not to.</li>
            <li>What languages do you speak and write?</li>
        </ul>
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
