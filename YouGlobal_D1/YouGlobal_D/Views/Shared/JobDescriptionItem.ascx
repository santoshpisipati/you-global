<script type="text/javascript">
    $(document).ready(function () {
        $(".openDialog").live("click", function (e) {
            e.preventDefault();
            $("<div></div>")
                .addClass("dialog")
                .attr("id", $(this)
                .attr("data-dialog-id"))
                .appendTo("body")
                .dialog({
                    title: $(this).attr("data-dialog-title"),
                    close: function () { $(this).remove(); },
                    resizable: false,
                    modal: true,
                    height: 370,
                    draggable: false,
                    left: 0

                })
                .load(this.href);blur
        });

        $(".close").live("click", function (e) {
            e.preventDefault();
            $(this).closest(".dialog").dialog("close");
        });
    });
</script>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
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
                        <td class="title" align="left" height="27">
                            <%=jobPosting.Title%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%if (Session["username"] != null && !string.IsNullOrEmpty(Convert.ToString(Session["username"])))
                              {%>
                            <a class="jobrlist" style="color: Red" href='<%=Url.Action("ApplyOnline", "Work", new { reference = jobPosting.ReferenceNo })%>'>
                                <font size="3"><span class="applicationLink">APPLY ONLINE</span></font></a>
                            <%-- <%Html.ActionLink("LOGIN/SIGNUP", "Login", "Account", null, new { @class = "openDialog", data_dialog_id = "aboutlDialog", data_dialog_title = "Login" })%>--%>
                            <% }%>
                            <%  else
                              {%>
                            <% using (Html.BeginForm(new { reference = jobPosting.ReferenceNo }))
                               {%>
                            <%=Html.ActionLink("LOGIN/SIGNUP", "Login", "Account",  new { returnUrl = Url.Action("ApplyOnline", "Work", new { reference = jobPosting.ReferenceNo }) }, new { @class = "openDialog", data_dialog_id = "aboutlDialog", data_dialog_title = "Login" })%>
                            <% }%>
                            <% }%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <a class="jobrlist" href='<%=Url.Action("EMailAFriend", "Work", new { id = jobPosting.JobId,title=jobPosting.Title,refe=jobPosting.ReferenceNo })%>'
                                target="_parent"><font size="3"><span class="applicationLink">EMAIL TO A FRIEND</span></font></a>
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
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td class="subheadings" align="left">
                <div style="margin-top: 5; margin-bottom: 5;">
                    <%=jobPosting.Location%><br />
                    YOU Global - Ref&nbsp;<%=jobPosting.ReferenceNo%>
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;
            </td>
        </tr>
        <tr>
            <td class="body">
                <%=jobPosting.JobContent%>
            </td>
        </tr>
        <%-- <tr>
            <td>
                <br />
            </td>
        </tr>--%>
        <%--  <tr>
            <td class='body'>
                <font class='body'><b>Salary/Rate:</b>&nbsp;&nbsp;</font><%=(string.IsNullOrEmpty(jobPosting.SalaryCurrency) ? string.Format("{0}&nbsp;&nbsp;-&nbsp;&nbsp;{1}", jobPosting.SalaryMin, jobPosting.SalaryMax) : jobPosting.SalaryCurrency)%>
            </td>
        </tr>--%>
        <tr>
            <td class='body'>&nbsp;
            </td>
        </tr>
        <%-- <tr>
            <td class='body'>
                <%=jobPosting.AdFooter%>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>--%>
    </table>
    <hr />
    <script type="text/javascript">
        function openapplicationform() {
            var width = 525;
            var popUpWin;

            if (popUpWin != null && !popUpWin.closed) {
                popUpWin.close();
                popUpWin = null;
            }
            popUpWin = open('<%= Url.Action("ApplyOnline", "Work", new { reference = jobPosting.ReferenceNo })%>', "winName1111",
					  "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width=" + width + ",height=600,left=0,top=0");
            popUpWin.focus();
        }
    </script>
    <table border="0" width="440" cellspacing="0" cellpadding="0">
        <tr>
            <td align="left">
                <%--  <a class="jobrlist" style="color: Red" href='<%=Url.Action("ApplyOnline", "Work", new { reference = jobPosting.ReferenceNo })%>'>
                    <font size="3"><span class="applicationLink">APPLY ONLINE</span></font></a>--%>
                <%if (Session["username"] != null && !string.IsNullOrEmpty(Convert.ToString(Session["username"])))
                  {%>
                <a class="jobrlist" style="color: Red" href='<%=Url.Action("ApplyOnline", "Work", new { reference = jobPosting.ReferenceNo })%>'>
                    <font size="3"><span class="applicationLink">APPLY ONLINE</span></font></a>
                <% }%>
                <%  else
                  {%>
                <%=Html.ActionLink("LOGIN/SIGNUP", "Login", "Account",new { returnUrl = Url.Action("ApplyOnline", "Work", new { reference = jobPosting.ReferenceNo }) }, new {@class = "openDialog", data_dialog_id = "aboutlDialog", data_dialog_title = "Login"})%>
                <% }%>
            </td>
        </tr>
        <tr>
            <td align="left">
                <a class="jobrlist" href='<%=Url.Action("EMailAFriend", "Work", new { id = jobPosting.JobId,title=jobPosting.Title,refe=jobPosting.ReferenceNo })%>'
                    target="_parent"><font size="3"><span class="applicationLink">EMAIL TO A FRIEND</span></font></a>
            </td>
        </tr>
        <tr>
            <td align="left">
                <a class="jobrlist" href="<%=Url.Action("BackToSearch", "Jobs")%>"><font size="3"><span
                    class="applicationLink">BACK TO SEARCH RESULTS</span></font></a>
            </td>
        </tr>
    </table>
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
                    please <a href="mailto: admin@you-global.com?subject=Problem with YOU Global website">let us know</a>. Attaching a screen shot is usually very helpful.
                </p>
            </td>
        </tr>
    </table>
    <%} %>
</div>