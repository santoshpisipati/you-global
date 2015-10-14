<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    var jobPosting = (YG_Business.JobInfo)Model;    
%>
<td>
    <div class="subheadingsSearch" style="font-size:13px">
        <%= Html.ActionLink(jobPosting.Title, "JobDescription", "Jobs", new { id = jobPosting.ReferenceNo }, null)%>
    </div>
    <div class="body">
        <b style="font-size:12px">
            <%=jobPosting.Location%>
            YOU Global - Ref&nbsp;<%=jobPosting.ReferenceNo%></b><div class="publishedDate">
                <b>
                    <%if (jobPosting.IsModified)
                      {%>
                    Updated &nbsp;
                    <%} %>
                    <%=jobPosting.ModifiedDate.ToString("dd MMM yyyy")%></b>
            </div>
    </div>
    <div>
        <br />
        <font class="body">
            <%=jobPosting.Summary%></font></div>
    <hr />
</td>
<%= "</tr>" %>
