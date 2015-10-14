<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subscribe.aspx.cs" Inherits="YG_MVC.Template.Subscribe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Content/css/yg_outer.css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
    <center>
        <div id="divConfirm" runat="server" visible="false">
            <p>
                Thank you for your subscription to Jobs Alert.</p>
            <p>
                To edit your details, please click on the link below.</p>
            <p>
                An email to confirm your subscription has been sent.
            </p>
            <p>
                <a class="jobrlist" href='#' id="edit" runat="server"><font size="3"><span class="applicationLink">
                    Click here to edit your subscription details.</span></font></a>
            </p>
        </div>
        <div id="divNotExist" runat="server" visible="false">
            <div class="subheader">
                <h2>
                    Thank you for contacting YOU Global.</h2>
            </div>
            <div class="left_articles_noBorder">
                <p>
                    We no longer have an active record for this Job Alerts subscription.</p>
                <p>
                    It may be that you have previously unsubscribed. You are most welcome to subscribe
                    again.
                </p>
                <p>
                    To do so, please visit <a href='http://www.you-global.com'>YOU Global's website</a>.
                </p>
            </div>
        </div>
    </center>
    </form>
</body>
</html>
