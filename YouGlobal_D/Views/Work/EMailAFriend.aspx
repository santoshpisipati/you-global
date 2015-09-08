<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="YG_MVC.Models" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavWork';
        var currentSubNav = '#rightNavWork';
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subheader">
        <h2>
            Email a Friend</h2>
    </div>
    <form onsubmit="return checkFormFields(this);" name="submitAlert" action="/Work/EmailFriend.shtml"
    method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>
                <%
                    var jobPosting = (EmailFriendModel)Model;    
                %>
                <div class="title" size="1">
                    <%= Html.Label("JobTitle", jobPosting.JobTitle)%>
                </div>
            </td>
        </tr>
        <tr height="5">
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="subheadingsQuick">
                Please enter your email:<br />
                <%= Html.TextBox("YourEmail", string.Empty, new { @class = "fieldQuick" })%>
            </td>
        </tr>
        <tr>
            <td class="subheadingsQuick">
                Please enter a friend's email:<br />
                <%= Html.TextBox("FriendEmail", string.Empty, new { @class = "fieldQuick" })%>
            </td>
        </tr>
        <tr height="5">
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="subheadings" colspan="2" align="left">
                <%= Html.Hidden("JobReference", jobPosting.JobReference)%>
                <%= Html.Hidden("JobTitle", jobPosting.JobTitle)%>
               <input type="submit" name="Send" class="subheadingsButton" id="Send" value="&nbsp;&nbsp;&nbsp;Send&nbsp;&nbsp;&nbsp;" />&nbsp;&nbsp;&nbsp;
                <button class="subheadingsButton" type="reset">
                    &nbsp;&nbsp;&nbsp;Clear&nbsp;&nbsp;&nbsp;</button>
            </td>
        </tr>
    </table>
    </form>
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
