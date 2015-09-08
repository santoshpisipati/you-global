<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavHome';
        var currentSubNav = '#rightNavAbout';
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subheader">
        <h2>
            About us</h2>
    </div>
    <div class="left_articles_noBorder">
        <h3>
            Our Profile</h3>
        <p>
            YOU Global are recruitment specialists across all industries and locations around
            the world. Our innovative and dynamic approach helps both companies and individuals
            navigate the complex and rapidly changing recruitment landscape.</p>
        <p>
            We firmly believe that in order to provide a professional and committed service
            to our clients, it is essential to remain focused on our objective of striving to
            be the best in our business.</p>
        <p>
            In order to achieve this we employ only talented individuals who possess an in depth
            knowledge of your industry.</p>
        <p>
            So, whether you are someone looking for a new and challenging career opportunity,
            or an organisation requiring tailor-made human resource solutions, you can rely
            on YOU Global.</p>
        <p>
            Keep a regular eye on our web site, as we have many new and exciting projects in
            the wings, which over time will bring innovative services to our web site visitors.</p>
        <br />
        <h3>
            Our Specialist Divisions include</h3>
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
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SkyContent" runat="server">
    <div id="navContainer">
        <div id="mainNavigation">
            <img src="/Content/images/imgs/RHS_module-1.gif" alt="" width="208" height="544"
                border="0" title="rightsideModules" />
        </div>
    </div>
</asp:Content>
