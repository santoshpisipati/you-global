<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>JobDetail</title>
    <link href="../../Content/css/yg.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <%
        var jobPosting = (YG_Business.JobInfo)Model;    
    %>
    <div class="bodySearchRes">
        <% if (!string.IsNullOrEmpty(jobPosting.ReferenceNo))
           { %>
        <table border="0" width="440" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table border="0" width="440" cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="2" class="title" align="left" height="27">
                                <%=jobPosting.Title%>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <% if (!string.IsNullOrEmpty(jobPosting.Bullet1) || !string.IsNullOrEmpty(jobPosting.Bullet2) || !string.IsNullOrEmpty(jobPosting.Bullet3))
               { %>
            <tr>
                <td>
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="bullets">
                    <ul class="bullets" style="margin-top: 7; margin-bottom: 7; padding-left: 40px;">
                        <% if (!string.IsNullOrEmpty(jobPosting.Bullet1))
                           { %>
                        <li class="bullets">
                            <%=jobPosting.Bullet1%>
                        </li>
                        <% } %>
                        <% if (!string.IsNullOrEmpty(jobPosting.Bullet2))
                           { %>
                        <li class="bullets">
                            <%=jobPosting.Bullet2%>
                        </li>
                        <% } %>
                        <% if (!string.IsNullOrEmpty(jobPosting.Bullet3))
                           { %>
                        <li class="bullets">
                            <%=jobPosting.Bullet3%>
                        </li>
                        <% } %>
                    </ul>
                </td>
            </tr>
            <tr>
                <td>
                    <hr />
                </td>
            </tr>
            <% } %>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="subheadings" align="left">
                    <div style="margin-top: 5; margin-bottom: 5;">
                        <%=jobPosting.Location%><br />
                        YOU Global - Ref&nbsp;<%=jobPosting.ReferenceNo%></div>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="body">
                    <%=jobPosting.JobContent%>
                </td>
            </tr>
            <tr>
                <td class='body'>
                    &nbsp;
                </td>
            </tr>
        </table>
        <hr />
        <%} %>
        <% else
           { %>
        <table>
            <tr>
                <td class='body'>
                    <p>
                        There isn't a job vacancy associated with this page. Please use the Job Search panel
                        to your left to search for advertised positions.
                    </p>
                    <p>
                        If you continue to experience problems, or you're sure you have the right page,
                        please <a href="mailto: admin@you-global.com?subject=Problem with YOU Global website">
                            let us know</a>. Attaching a screen shot is usually very helpful.
                    </p>
                </td>
            </tr>
        </table>
        <%} %>
    </div>
</body>
</html>
