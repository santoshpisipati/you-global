<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavWork';
        var currentSubNav = '#rightNavWork';
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subheader">
        <h2>
            Looking for Work?</h2>
    </div>
    <div class="left_articles">
        <h3>
            Find a new job that suits you.
        </h3>
        <img src="/Content/images/imgs/jobsMain.gif" alt="Recruitment Service Offerings"
            width="417" height="152" border="0" class="innerImage" title="Recruitment Service Offerings" />
        <p>
            Whether you're looking for work in Dubai, Australia, UK, or Venezuela, our clients
            are located around the globe. You Global can help find the right job for you. In
            today's competitive market place, it has never been more important to have your
            resume made available to employers whose requirements match your specific skills.
            Send us your details now, and let You Global connect you with your new employer.</p>
    </div>
   <%-- <div id="searchModule">
        <span class="leftWhiteArrow">Advanced Search</span>
        <div class="fullFunctionalModule">
            <div id="searchJobsOuter">
                <div id="searchAllJobs">
                    <% Html.RenderPartial("AdvancedSearchModule"); %>
                </div>
            </div>
        </div>
    </div>--%>
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
