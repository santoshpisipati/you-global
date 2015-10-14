<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../Content/css/yg_outer.css" media="screen" />
</head>
<body>
    <%
        var model = (YG_MVC.Models.JobAlertModel)Model;    
    %>
    <div class="subheader">
        <h2>
            Thank You!</h2>
    </div>
    <div class="left_articles_noBorder">
        <p>
            Thank you for editing your Job Alerts subscription.
        </p>
        <p>
            If you wish to edit your details again, please click on the link below.</p>
        <p>
            An email to confirm your subscription has been sent.
        </p>
        <p>
            <%= Html.ActionLink("Click here to edit your subscription details.", "JobAlertEdit", "Jobs", new { alertId=model.JobAlertId,CID=model.CandidateGUID }, null)%>
        </p>
    </div>
</body>
</html>
