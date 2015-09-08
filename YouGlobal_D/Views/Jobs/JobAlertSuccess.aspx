<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavWork';
        var currentSubNav = '#rightNavWork';
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var model = (int)Model;    
    %>
    <div class="subheader">
        <h2>
            Thank You!</h2>
    </div>
    <div class="left_articles_noBorder">
        <p>
            Thank you for your interest in Job Alerts.</p>
        <p>
            An email to activate your subscription has been sent.</p>
        <p>
            <%--<a class="jobrlist" href='#' onclick="javascript:openjobalertform()"><font size="3">
                <span class="applicationLink">Click here to edit your subscription details.</span></font></a>--%>
        </p>
    </div>
    <script type="text/javascript">
        function openjobalertform() {
            var width = 525;
            var popUpWin;

            if (popUpWin != null && !popUpWin.closed) {
                popUpWin.close();
                popUpWin = null;
            }
            popUpWin = open('<%= Url.Action("JobAlertEdit", "Jobs", new { alertId = model })%>', "winName1111",
					  "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width=" + width + ",height=600,left=0,top=0");
            popUpWin.focus();
        }
    </script>
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
