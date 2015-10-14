<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavJobsBoard';
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subheader">
        <h2>
            Why Not Join Us?</h2>
    </div>
    <div class="left_articles">
        <h3>
            Partner With Us and Never Look Back!</h3>
        <img src="/Content/images/imgs/workMain.gif" alt="Recruitment Service Offerings"
            width="417" height="152" border="0" class="innerImage" title="Recruitment Service Offerings" />
        <p>
            You Global are looking for qualified independent Partners to work with us around
            the globe.</p>
    </div>
    <div class="left_articles_noBorder">
        <h4 class="articleSubtitle">
            Benefits of being a Partner</h4>
        <br />
        <br />
        <p>
            As a You Global Partner, you will gain exclusive access to our custom engineered
            data base, with access to jobseekers and employers world wide.</p>
        <p>
            With this powerful, proprietary search facility and our excellent incentive program,
            the earning potential is limitless.</p>
        <p>
            You will also join a growing worldwide team of You Global, ready to network and
            interact with the common objective of delivering our clients the best service in
            the business.</p>
        <p>
            Best of all, no capital investment is required. Interested?
            <%= Html.ActionLink("Contact us", "ContactUs", "Contact", null, new { id = "mainNavContactUs", @class = "key" })%>
            for more information or email us at <a class="ygElmPlus" href="?subject=I%20am%20interested%20in%20joining%20You%20Global%20as%20a%20Partner%20&amp;body=Please%20enter%20the%20following%20details:%0A-Name%0A-Contact%20Number%0A-Email%0A-Company%0A%0AType%20Your%20Message">
            </a>.</p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SkyContent" runat="server">
    <div id="navContainer">
        <div id="mainNavigation">
            <img src="/Content/images/imgs/RHS_module-2.gif" alt="" width="208" height="544"
                border="0" title="rightsideModules" />
        </div>
    </div>
</asp:Content>
