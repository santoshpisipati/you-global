<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavStaff';
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="subheader">
        <h2>
            Looking for Staff?</h2>
    </div>
    <div class="left_articles">
        <h3>
            We can Help!</h3>
        <img src="/Content/images/imgs/workMain.gif" alt="Recruitment Service Offerings"
            width="417" height="152" border="0" class="innerImage" title="Recruitment Service Offerings" />
        <p>
            You Global utilises our own proprietary, highly powerful, custom engineered database,
            allowing us immediate access to our job search partners worldwide.</p>
    </div>
    <div class="left_articles_noBorder">
        <h4 class="articleSubtitle">
            How we work
        </h4>
        <p>
            By leveraging our online capability through our partnership agreement with online
            recruitment portals and our new, highly powerful search facility, we are committed
            to providing you with candidates who closely match your requirements.</p>
        <p>
            After identifying potential candidates, we undertake an extensive screening process,
            which enables us to provide you with feedback specific to the competencies that
            you have identified as key to your organisational success.</p>
        <br />
        <h4 class="articleSubtitle">
            Work Placements</h4>
        <p>
            At You Global we believe that once a successful placement has been made, then this
            is the beginning of our relationship. We will be available to receive any feedback
            you may have relating to the performance of the candidate. Conversely, we will maintain
            close contact to make sure your ongoing needs are fulfilled.<br />
        </p>
        <br />
        <h4 class="articleSubtitle">
            Our Specialist Areas</h4>
        <ul>
            <li>BANKING, FINANCE &amp; INSURANCE</li>
            <li>COMMUNICATIONS, MEDIA &amp; PUBLIC RELATIONS</li>
            <li>EDUCATION &amp; TRAINING</li>
            <li>ENGINEERING, ARCHITECTURE, CONSTRUCTION &amp; ENERGY</li>
            <li>GOVERNMENT &amp; PUBLIC SERVICE</li>
            <li>HEALTH &amp; MEDICAL</li>
            <li>HUMAN RESOURCES, ADMINISTRATION &amp; SECRETARIAL</li>
            <li>INFORMATION TECHNOLOGY &amp; COMMUNNICATIONS</li>
            <li>LEGAL</li>
            <li>SALES &amp; MARKETING</li>
            <li>TRANSPORT &amp; LOGISTICS</li>
        </ul>
        <br />
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SkyContent" runat="server">
<div id="navContainer">
        <div id="mainNavigation">
            <div class="mainMenu">
                <%= Html.ActionLink("Position Description", "PositionDescription", "Staff", null, new { id = "rightNavPosition", @class = "menuItem" })%>
            </div>
            <img class="pad20" src="/Content/images/imgs/RHS_module-3.gif" alt="" width="208"
                height="544" border="0" title="rightsideModules" />
        </div>
    </div>
</asp:Content>
