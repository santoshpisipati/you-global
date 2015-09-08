<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    var jobPosting = (YG_Business.JobInfo)Model;    
%>
<tr>
    <td class="subheadingsSearch">
        <font title="<%=Html.Encode(jobPosting.Summary)%>">
            <%=Html.ActionLink(jobPosting.Title, "JobDescription", "Jobs", new { id = jobPosting.ReferenceNo }, null)%></font>
    </td>
</tr>
<tr>
    <td>
        &nbsp;
    </td>
</tr>
