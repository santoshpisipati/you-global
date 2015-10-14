<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<YG_MVC.Models.FeedbackModel>" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Feedback</title>
    <link rel="stylesheet" type="text/css" href="../../Content/themes/base/jquery.ui.base.css"
        media="screen" />
    <link rel="stylesheet" type="text/css" href="../../Content/themes/base/jquery.ui.autocomplete.css"
        media="screen" />
    <link rel="stylesheet" type="text/css" href="../../Content/themes/base/jquery.ui.theme.css"
        media="screen" />
    <script type="text/javascript" src="../../Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery-ui-1.8.11.min.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery.dependent.min.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery.unobtrusive-ajax.min.js"></script>
    <style type="text/css">
        td
        {
            color: #626262;
            font: 0.72em Arial,Verdana,Sans-Serif;
        }
        a
        {
            color: #70836F;
            text-decoration: underline;
        }
        .t10
        {
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            font-style: normal;
        }
        .style1
        {
            color: #FFFFFF;
        }
        a:link
        {
            color: #86BA40;
            text-decoration: none;
        }
        a:visited
        {
            color: #86BA40;
            text-decoration: none;
        }
        a:hover
        {
            color: #808080;
        }
        a:active
        {
            color: #808080;
        }
        .footer a
        {
            color: #777777;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            text-decoration: none;
        }
        .footer a:hover
        {
            color: #FFFFFF;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            text-decoration: none;
        }
        .panelHeadline
        {
            color: #989144;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            font-weight: bold;
        }
        .panelContent
        {
            color: #02245A;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
        }
        .contentText
        {
            color: #606060;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
        }
        .contentTextTitle
        {
            color: #2F82B9;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 16px;
        }
        .contentTextBold
        {
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            font-weight: bold;
        }
        .contentTextBold2
        {
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
        }
        .title
        {
            color: #0066CC;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 18px;
            font-weight: bold;
            text-transform: none;
        }
        .bullets
        {
            color: #626262;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 14px;
        }
        li
        {
            list-style: circle outside none;
        }
        .subheadings_big1
        {
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 14px;
            line-height: 1.5em;
            text-transform: none;
        }
        .subheadings_big2
        {
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 14px;
            line-height: 1.5em;
            text-transform: none;
        }
        body1
        {
            background-color: #D8E4D2;
            color: #606060;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 11px;
            letter-spacing: 1px;
            margin-right: 170px;
            margin-top: 0;
            text-align: justify;
        }
        body
        {
            background-color: #D8E4D2;
            color: #00498B; /*font: 0.72em Arial,Verdana,Sans-Serif;*/
        }
        .bodySearchRes
        {
            background-color: #FFFFFF;
            color: #00498B;
            font: 0.72em Arial,Verdana,Sans-Serif;
        }
        .bodyFeaturedList
        {
            background-color: #D8E4D2;
            color: #00498B;
            font: 0.72em Arial,Verdana,Sans-Serif;
        }
        .subscribeDoneBody
        {
            background-color: #D8E4D2;
            color: #00498B;
            font: 0.72em Arial,Verdana,Sans-Serif;
        }
        .subheadingsSearch
        {
            font-size: 12px;
            font-weight: bold;
        }
        .topText
        {
            color: #626262;
            font-size: 11px;
        }
        .starText
        {
            color: #2079B4;
            font-size: 11px;
        }
        .fieldQuick
        {
            border: 1px solid #CCCCCC !important;
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 10px;
            margin: 5px 0;
            width: 230px;
        }
        .fieldAlerts
        {
            border: 1px solid #CCCCCC !important;
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 10px;
            margin: 5px 0;
            width: 230px;
        }
        .fieldAdv
        {
            border: 1px solid #CCCCCC !important;
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 10px;
            margin: 5px 0;
            width: 200px;
        }
        .keyAdv
        {
            border: 1px solid #CCCCCC !important;
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 10px;
            margin: 5px 0;
            width: 100%;
        }
        .keywordText
        {
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 10px;
        }
        hr
        {
            border-bottom: 1px dotted #5A5A5A;
            border-top: medium none;
            height: 1px;
            margin: 8px 0;
        }
        .subheadingsQuick
        {
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            font-weight: bold;
            padding: 1px;
        }
        .subheadingsButton
        {
            font-size: 12px;
            font-weight: bold;
        }
        .Field
        {
            color: #0066CC;
            font: 0.95em "Arial";
            margin: 4px 0;
            width: 100%;
        }
        #searchJobsOuter
        {
            background: none repeat scroll 0 0 #D8E4D2;
            display: block;
            height: 100%;
            line-height: 1.2em;
            margin: 0 0 1px;
        }
        #searchJobs
        {
            background: none repeat scroll 0 0 #D8E4D2;
            margin: 0 5px 0 0;
            padding-bottom: 0;
        }
        #searchJobs img
        {
            display: none;
            visibility: hidden;
        }
        #searchJobs p, #searchAllJobs p
        {
            padding: 0 10px;
        }
        #searchJobs table tr td, #searchAllJobs table tr td
        {
            padding: 0 20px 0 0;
        }
        #searchJobs table, #searchAllJobs table
        {
            margin: 0;
            padding: 0;
            width: 100%;
        }
        .subheadings
        {
            font: bold 12px "Arial";
            margin: 5px 0;
            padding: 1px 0;
        }
        .subheadingsSearchRes
        {
            font: bold 1em "Arial";
            margin: 5px 0;
            padding: 1px 0;
        }
        #searchModule input.subheadings[type="submit"], #searchModule input.subheadings[type="reset"], #searchModule button.subheadings
        {
            font: bold 1em "Arial";
            margin: 5px 0 5px 25%;
            width: 50%;
        }
        input.subheadings[type="submit"], input.subheadings[type="reset"], button.subheadings
        {
            margin: 5px 0;
            width: 40%;
        }
        #searchJobs hr, #searchAllJobs hr
        {
            margin: 2px 0;
        }
        #searchModule hr
        {
            border-bottom: 1px dotted #5A5A5A;
            border-top: medium none;
            height: 1px;
            margin: 8px 0;
        }
        #searchModule td.body
        {
            color: #0066CC;
        }
        .pageTables
        {
            border-bottom: 1px dotted #5A5A5A;
            margin: 10px 0;
            width: 440px;
        }
        .hotjobtitle
        {
            font: bold 1em "Arial";
        }
        .featuredTable
        {
            padding-top: 10px;
        }
        #searchAllJobs
        {
            background: none repeat scroll 0 0 #D8E4D2;
            margin: 0 5px 0 10px;
            padding-bottom: 0;
        }
        .publishedDate
        {
            color: #0080FF;
            float: right;
            font: 0.95em "Arial";
        }
        .numCounter
        {
            font: bold 1em "Arial";
            margin: 5px 0;
            padding: 1px 0;
        }
        .floatRight
        {
            float: right;
        }
        .pagePrevious
        {
            color: red;
            display: block;
            float: right;
            padding: 0 5px;
        }
        .pageNext
        {
            color: red;
            display: block;
            float: right;
            padding: 0 5px;
        }
        .actualPage
        {
            color: #000000;
            padding: 0 5px;
        }
        .rowTableRight
        {
            display: block;
            float: right;
            padding: 3px;
            width: 434px;
        }
        .rowTableLeft
        {
            border-bottom: 1px dotted #5A5A5A;
            display: block;
            float: left;
            padding: 3px;
            width: 434px;
        }
        #rowTable
        {
            display: block;
            float: left;
            padding: 0;
            width: 440px;
        }
        .roleTitle
        {
            font: bold 1em "Arial";
        }
        .paginationContainer
        {
            clear: both;
            display: block;
            float: left;
            margin: 0;
            padding: 2px 0 5px;
            position: relative;
            width: 440px;
        }
        .paginationContainerBottom
        {
            border-bottom: 1px dotted #5A5A5A;
            clear: both;
            display: block;
            float: left;
            margin: 0;
            padding: 2px 0 5px;
            position: relative;
            width: 440px;
        }
        div.title
        {
            border-bottom: 1px dotted #000000;
            color: #0080FF;
            font: bold 1.4em "Arial";
            padding: 3px 0;
        }
        .subheadings_big1
        {
            border-bottom: 1px dotted #5A5A5A;
            color: #5A5A5A;
            display: block;
            font: bold 1em "Arial";
            margin: 5px 0;
            padding: 3px 0;
        }
        .hr
        {
            border-bottom: 1px dotted #000000;
            margin: 3px 0;
        }
        .bullets
        {
            list-style: none outside none;
        }
        MsoNormal
        {
            list-style: none outside none;
        }
        .jobRole
        {
            color: #0080FF;
            font: bold 1.4em "Arial";
            padding: 3px 0;
        }
        .emailfriendTitle
        {
            color: #0080FF;
            font: 1.2em "Arial";
            padding: 10px 0;
        }
        .applicationLink
        {
            font-size: 12px;
        }
        .smallField
        {
            width: 50%;
        }
        .applySubheadings
        {
            font-size: 12px;
            font-weight: bold;
        }
        .subheadingsSmall2
        {
            font-size: 13px;
        }
        .form_apply
        {
            font-size: 12px;
            font-weight: bold;
        }
    </style>
    <style type="text/css">
        .field-validation-error
        {
            color: red;
            font-weight: bold;
        }
        .input-validation-error
        {
            background: pink;
            border: 1px solid red;
        }
        .validation-summary-errors
        {
            color: red;
            font-weight: bold;
        }
        .ui-widget
        {
            font-family: Verdana,Arial,sans-serif;
            font-size: 12px;
        }
    </style>
    <script type="text/javascript" language="javascript">
        $(function () {

            //            alert(window.navigator.userAgent);
            //            alert(window.navigator.appVersion);
            var OSName = "Unknown OS";
            if (navigator.appVersion.indexOf("Win") != -1) OSName = "Windows";
            if (navigator.appVersion.indexOf("Mac") != -1) OSName = "MacOS";
            if (navigator.appVersion.indexOf("X11") != -1) OSName = "UNIX";
            if (navigator.appVersion.indexOf("Linux") != -1) OSName = "Linux";
            // document.write('Your OS: ' + OSName);
            if ($('#OS').val() == '')
                $('#OS').val(OSName);

            navigator.sayswho = (function () {
                var N = navigator.appName, ua = navigator.userAgent, tem;
                var M = ua.match(/(opera|chrome|safari|firefox|msie)\/?\s*(\.?\d+(\.\d+)*)/i);
                if (M && (tem = ua.match(/version\/([\.\d]+)/i)) != null) M[2] = tem[1];
                M = M ? [M[1], M[2]] : [N, navigator.appVersion, '-?'];
                return M;
            })();
            if ($('#Browser').val() == '')
                $('#Browser').val(navigator.sayswho);

            $('.countrycode').autocomplete(
        {
            source: '<%= Url.Action("SearchCountryCode", "Jobs")%>',
            minLength: 1,
            select: function (event, ui) {
                var code = ui.item.value;
                ui.item.value = code.substring(code.indexOf('(') + 1, code.indexOf(')'));
            }

        });
        });

        function isPhoneNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                if (charCode == 45 || charCode == 32)
                    return true;
                return false;
            }
            return true;
        }

       
    </script>
</head>
<body>
    <form id="frmFeedback" method="post" action="/Work/FeedbackSubmit.shtml" enctype="multipart/form-data">
    <div>
        Please use this form to provide with any feedback about your experience when applying
        for a job or uploading your CV. Suggestions are listened to, problems are acted
        on.
    </div>
    <table>
        <tr>
            <td>
                Your name<font color="red">*</font>:
            </td>
            <td>
                <%= Html.TextBox("Name", Model.Name, new { @class = "Field", maxlength = "50" })%>
            </td>
        </tr>
        <tr>
            <td>
                Email address<font color="red">*</font>:
            </td>
            <td>
                <%= Html.TextBox("Email", Model.Email, new { @class = "Field", maxlength = "50" })%>
            </td>
        </tr>
        <tr>
            <td>
                Contact number:
            </td>
            <td>
                <label>
                    Country</label>
                <%= Html.TextBox("Countrycode", "", new { @class = "countrycode Field",@style="width:100px" })%>
                <label>
                    Number</label>
                <%= Html.TextBox("Phone", Model.Phone, new { @class = "Field", maxlength = "50", onkeypress = "return isPhoneNumber(event);", @style = "width:100px" })%>
            </td>
        </tr>
        <tr>
            <td>
                Your computer operating system and version:
            </td>
            <td>
                <%= Html.TextBox("OS", Model.OS, new { @class = "Field", maxlength = "50" })%>
            </td>
        </tr>
        <tr>
            <td>
                Your browser and version:
            </td>
            <td>
                <%= Html.TextBox("Browser", Model.Email, new { @class = "Field", maxlength = "50" })%>
            </td>
        </tr>
        <tr>
            <td>
                Attach screen image:
            </td>
            <td>
                <input type="file" id="Attachment" name="Attachment" />
            </td>
        </tr>
        <tr>
            <td>
                Your comments:
            </td>
            <td>
                <%= Html.TextArea("Comment", Model.Comment, new { @class = "Field", cols = "100", rows = "5" })%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" id="submit" name="submit" value="Submit" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
