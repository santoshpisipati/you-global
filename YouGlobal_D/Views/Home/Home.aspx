<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Main.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <meta name="google-site-verification" content="WPNgUkK3A5W2V5GcmCcfygV_YBOD6k4xjixUc1GKTa0" />
    
    <script type="text/javascript">
        var currentNav = '#mainNavHome';
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subheader">
        <h2>
            Welcome to the recruitment hot spot!</h2>
    </div>
    <div class="left_articles">
        <div class="bigimage" id="flashcontent">
            <script type="text/javascript">// <![CDATA[
                var so = getRandomFlash();
                so.addParam("scale", "noscale");
                so.write("flashcontent");
				    // ]]>
            </script>
        </div>
        <h3>
            Recruitment Service Divisions include
        </h3>
        <div>
            <table>
                <tr>
                    <td width="315">
                        <ul>
                            <li>BANKING, FINANCE & INSURANCE</li>
                            <li>COMMUNICATIONS, MEDIA & PUBLIC RELATIONS</li>
                            <li>EDUCATION & TRAINING</li>
                            <li>ENGINEERING, ARCHITECTURE</li>
                            <li>CONSTRUCTION & ENERGY</li>
                            <li>GOVERNMENT & PUBLIC SERVICE</li>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <li>HEALTH & MEDICAL</li>
                            <li>HUMAN RESOURCES, ADMINISTRATION & SECRETARIAL</li>
                            <li>INFORMATION TECHNOLOGY</li>
                            <li>LEGAL</li>
                            <li>SALES & MARKETING</li>
                            <li>TRANSPORT & LOGISTICS</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <ul class="socialMedia-links">
                            <li class="twitter"><a href="http://twitter.com/youglobal" title="Follow us on Twitter">
                                Follow us on <strong>Twitter</strong></a></li>
                            <li class="facebook"><a href="http://www.facebook.com/YOUGlobal"
                                title="Join us on Facebook">Join us on <strong>Facebook</strong></a></li>
                        </ul>
                        <div id="homePara">
                            YOU Global are recruitment specialists, servicing all industries and all locations
                            around the world. Our innovative and dynamic approach helps both companies and individuals
                            navigate the complex and rapidly changing recruitment landscape.
                            <%= Html.ActionLink("Read more...", "AboutUs", "Home", null, new { @class = "title" })%>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="thirds">
        <p>
            <img src="/Content/images/imgs/hometeaser01.jpg" alt="Recruitment Service Offerings"
                width="208" height="128" border="0" title="Recruitment Service Offerings" />
            <b>
                <%= Html.ActionLink("About Us", "AboutUs", "Home", null, new { @class = "title" })%></b><br />
            We firmly believe that in order to provide a professional and committed service
            to our clients, it is essential to remain focused on our objective of striving to
            be the best in our business.<%= Html.ActionLink(" Read more...", "AboutUs", "Home", null, new { @class = "title" })%></p>
    </div>
    <div class="thirds">
        <p>
            <img src="/Content/images/imgs/hometeaser02.jpg" alt="Recruitment Service Offerings"
                width="208" height="128" border="0" title="Recruitment Service Offerings" />
            <b><a href="" class="title">Career Advice</a></b><br />
            Deciding what's best for you depends on your personal circumstances and what you
            enjoy doing. If you're unsure about what you want to do next, we can help you. We
            give free, impartial information and advice on careers.
        </p>
    </div>
    <div class="homethirdRight">
        <p>
            <img src="/Content/images/imgs/hometeaser03.jpg" alt="Recruitment Service Offerings"
                width="208" height="128" border="0" title="Recruitment Service Offerings" />
            <b>
                <%= Html.ActionLink("Position Description", "PositionDescription", "Staff", null, new { @class = "title" })%></b><br />
            A position description is a formal document that summarizes the important functions
            of a specific job, using clear and concise language. It should accurately represent
            actual duties and responsibilities as well as job specifications.
            <%= Html.ActionLink(" Read more...", "PositionDescription", "Staff", null, new { @class = "title" })%>
        </p>
    </div>
</asp:Content>
