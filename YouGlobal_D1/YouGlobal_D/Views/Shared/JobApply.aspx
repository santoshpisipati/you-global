<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="YG_MVC.Models" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>JobApply</title>
    <script type="text/javascript" src="../../Scripts/jquery-1.3.2.min.js"></script>
    <link href="<%= Url.Content("~/Content/themes/base/jquery.ui.datepicker.css")%>"
        rel="stylesheet" type="text/css" />
    <link href="../../Content/themes/base/jquery.ui.datepicker.css" rel="Stylesheet"
        type="text/css" />
    <link href="../../Content/themes/base/jquery.ui.all.css" rel="Stylesheet" type="text/css" />
    <script src="<%=  Url.Content("~/Scripts/jquery-1.5.1.min.js")%>" type="text/javascript"></script>
    <script src="<%= Url.Content("~/Scripts/jquery-ui-1.8.11.min.js")%>" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/yg.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript">

        $(function () {

            $('.required').keyup(function () {
                textCounter(this, 'div' + this.name, 500, null);
            })

            $('.desi').keyup(function () {
                textCounter(this, 'divDesi' + this.name, 500, null);
            })

            $('#CoverLetter').keyup(function () {
                textCounter(this, 'desCoverLettContent', 2000, null);
            })
        });

        function checkCriteria(check) {
            var valid;
            if (checkFormFields(check)) {
                var empties = $('.required').filter(function () {
                    hideProgress();
                    return $.trim($(this).val()) == '';
                });
                if (empties.length) {
                    alert("One or more of the Essential Criteria needs your comment please.");
                    valid = false;
                }
                else
                    valid = true;
            }
            else
                valid = false;
            if (!valid)
                hideProgress();
            return valid;

        }

        function textCounter(field, cntfield, maxlimit, remHiddenFieldName) {
            var remainingLen = maxlimit - field.value.length;
            var objCnt = document.getElementById(cntfield);
            var drawStr = "";
            if (remainingLen < 0) {
                drawStr = "<font size='1' color='red'>characters left: " + remainingLen + "</font>";
            } else {
                drawStr = "<font size='1'>characters left: " + remainingLen + "</font>";
            }
            if (remHiddenFieldName != null) {
                drawStr += "<input type='hidden' name='";
                drawStr += remHiddenFieldName;
                drawStr += "' value='";
                drawStr += remainingLen;
                drawStr += "'>";
            }
            objCnt.innerHTML = drawStr;
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#progress").hide();
            $(".date").datepicker({
                dateFormat: 'dd M yy', changeMonth: true,
                changeYear: true, yearRange: "-73", maxDate: '-1d'

            });
        });

        $(function () {

            $("#applyButton").click(function () {
                $("#progress").show();
            });
        });

        function hideProgress() {
            $("#progress").hide();
        }
        function clearContents(ele) {
            var file = document.getElementById(ele);
            file.select();
            file.value = "";
            file.focus();
        }

        function get_filename(obj, type, ftype) {
            if (type == 2) {
                var file = document.getElementById('attachment').files[0];
                if (file != null) {
                    if (file.name == obj.files[0].name) {
                        alert('The Cover Letter you are trying to attach has the same name and size as the file you have attached as your CV. Please choose the correct file, or you may proceed without attaching a Cover Letter.');
                        clearContents(obj.id);
                        return;
                    }
                }
            }
            if (type == 1) {
                var file = document.getElementById('coverLetterOptional').files[0];
                if (file != null) {
                    if (file.name == obj.files[0].name) {
                        alert('The CV you are trying to attach has the same name and size as the file you have attached as your Cover Letter. Please choose a different file as your CV, or remove the file you have attached as your Cover Letter.');
                        clearContents(obj.id);
                        return;
                    }
                }

            }
            $.ajax({
                type: 'get',
                url: '<%= Url.Action("CheckFileExt", "Work")%>',
                data: {
                    ext: obj.value,
                    type: type,
                    size: obj.files[0].size,
                    ftype: ftype
                },
                cache: false,
                dataType: 'json',
                success: function (data) {

                    if (data.data == "1") {
                        alert(data.msg);
                        clearContents(obj.id);
                    }
                }
            })
        }
    </script>
    <style type="text/css">
        td {
            color: #626262;
            font: 0.72em Arial,Verdana,Sans-Serif;
        }

        a {
            color: #70836F;
            text-decoration: underline;
        }

        .t10 {
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            font-style: normal;
        }

        .style1 {
            color: #FFFFFF;
        }

        a:link {
            color: #86BA40;
            text-decoration: none;
        }

        a:visited {
            color: #86BA40;
            text-decoration: none;
        }

        a:hover {
            color: #808080;
        }

        a:active {
            color: #808080;
        }

        .footer a {
            color: #777777;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            text-decoration: none;
        }

            .footer a:hover {
                color: #FFFFFF;
                font-family: Arial,Helvetica,sans-serif;
                font-size: 12px;
                text-decoration: none;
            }

        .panelHeadline {
            color: #989144;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            font-weight: bold;
        }

        .panelContent {
            color: #02245A;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
        }

        .contentText {
            color: #606060;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
        }

        .contentTextTitle {
            color: #2F82B9;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 16px;
        }

        .contentTextBold {
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            font-weight: bold;
        }

        .contentTextBold2 {
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
        }

        .title {
            color: #0066CC;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 18px;
            font-weight: bold;
            text-transform: none;
        }

        .bullets {
            color: #626262;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 14px;
        }

        li {
            list-style: circle outside none;
        }

        .subheadings_big1 {
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 14px;
            line-height: 1.5em;
            text-transform: none;
        }

        .subheadings_big2 {
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 14px;
            line-height: 1.5em;
            text-transform: none;
        }

        body1 {
            background-color: #D8E4D2;
            color: #606060;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 11px;
            letter-spacing: 1px;
            margin-right: 170px;
            margin-top: 0;
            text-align: justify;
        }

        body {
            background-color: #D8E4D2;
            color: #00498B; /*font: 0.72em Arial,Verdana,Sans-Serif;*/
        }

        .bodySearchRes {
            background-color: #FFFFFF;
            color: #00498B;
            font: 0.72em Arial,Verdana,Sans-Serif;
        }

        .bodyFeaturedList {
            background-color: #D8E4D2;
            color: #00498B;
            font: 0.72em Arial,Verdana,Sans-Serif;
        }

        .subscribeDoneBody {
            background-color: #D8E4D2;
            color: #00498B;
            font: 0.72em Arial,Verdana,Sans-Serif;
        }

        .subheadingsSearch {
            font-size: 12px;
            font-weight: bold;
        }

        .topText {
            color: #626262;
            font-size: 11px;
        }

        .starText {
            color: #2079B4;
            font-size: 11px;
        }

        .fieldQuick {
            border: 1px solid #CCCCCC !important;
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 10px;
            margin: 5px 0;
            width: 230px;
        }

        .fieldAlerts {
            border: 1px solid #CCCCCC !important;
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 10px;
            margin: 5px 0;
            width: 230px;
        }

        .fieldAdv {
            border: 1px solid #CCCCCC !important;
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 10px;
            margin: 5px 0;
            width: 200px;
        }

        .keyAdv {
            border: 1px solid #CCCCCC !important;
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 10px;
            margin: 5px 0;
            width: 100%;
        }

        .keywordText {
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 10px;
        }

        hr {
            border-bottom: 1px dotted #5A5A5A;
            border-top: medium none;
            height: 1px;
            margin: 8px 0;
        }

        .subheadingsQuick {
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            font-weight: bold;
            padding: 1px;
        }

        .subheadingsButton {
            font-size: 12px;
            font-weight: bold;
        }

        .Field {
            color: #0066CC;
            font: 0.95em "Arial";
            margin: 4px 0;
            width: 100%;
        }

        #searchJobsOuter {
            background: none repeat scroll 0 0 #D8E4D2;
            display: block;
            height: 100%;
            line-height: 1.2em;
            margin: 0 0 1px;
        }

        #searchJobs {
            background: none repeat scroll 0 0 #D8E4D2;
            margin: 0 5px 0 0;
            padding-bottom: 0;
        }

            #searchJobs img {
                display: none;
                visibility: hidden;
            }

            #searchJobs p, #searchAllJobs p {
                padding: 0 10px;
            }

            #searchJobs table tr td, #searchAllJobs table tr td {
                padding: 0 20px 0 0;
            }

            #searchJobs table, #searchAllJobs table {
                margin: 0;
                padding: 0;
                width: 100%;
            }

        .subheadings {
            font: bold 12px "Arial";
            margin: 5px 0;
            padding: 1px 0;
        }

        .subheadingsSearchRes {
            font: bold 1em "Arial";
            margin: 5px 0;
            padding: 1px 0;
        }

        #searchModule input.subheadings[type="submit"], #searchModule input.subheadings[type="reset"], #searchModule button.subheadings {
            font: bold 1em "Arial";
            margin: 5px 0 5px 25%;
            width: 50%;
        }

        input.subheadings[type="submit"], input.subheadings[type="reset"], button.subheadings {
            margin: 5px 0;
            width: 40%;
        }

        #searchJobs hr, #searchAllJobs hr {
            margin: 2px 0;
        }

        #searchModule hr {
            border-bottom: 1px dotted #5A5A5A;
            border-top: medium none;
            height: 1px;
            margin: 8px 0;
        }

        #searchModule td.body {
            color: #0066CC;
        }

        .pageTables {
            border-bottom: 1px dotted #5A5A5A;
            margin: 10px 0;
            width: 440px;
        }

        .hotjobtitle {
            font: bold 1em "Arial";
        }

        .featuredTable {
            padding-top: 10px;
        }

        #searchAllJobs {
            background: none repeat scroll 0 0 #D8E4D2;
            margin: 0 5px 0 10px;
            padding-bottom: 0;
        }

        .publishedDate {
            color: #0080FF;
            float: right;
            font: 0.95em "Arial";
        }

        .numCounter {
            font: bold 1em "Arial";
            margin: 5px 0;
            padding: 1px 0;
        }

        .floatRight {
            float: right;
        }

        .pagePrevious {
            color: red;
            display: block;
            float: right;
            padding: 0 5px;
        }

        .pageNext {
            color: red;
            display: block;
            float: right;
            padding: 0 5px;
        }

        .actualPage {
            color: #000000;
            padding: 0 5px;
        }

        .rowTableRight {
            display: block;
            float: right;
            padding: 3px;
            width: 434px;
        }

        .rowTableLeft {
            border-bottom: 1px dotted #5A5A5A;
            display: block;
            float: left;
            padding: 3px;
            width: 434px;
        }

        #rowTable {
            display: block;
            float: left;
            padding: 0;
            width: 440px;
        }

        .roleTitle {
            font: bold 1em "Arial";
        }

        .paginationContainer {
            clear: both;
            display: block;
            float: left;
            margin: 0;
            padding: 2px 0 5px;
            position: relative;
            width: 440px;
        }

        .paginationContainerBottom {
            border-bottom: 1px dotted #5A5A5A;
            clear: both;
            display: block;
            float: left;
            margin: 0;
            padding: 2px 0 5px;
            position: relative;
            width: 440px;
        }

        div.title {
            border-bottom: 1px dotted #000000;
            color: #0080FF;
            font: bold 1.4em "Arial";
            padding: 3px 0;
        }

        .subheadings_big1 {
            border-bottom: 1px dotted #5A5A5A;
            color: #5A5A5A;
            display: block;
            font: bold 1em "Arial";
            margin: 5px 0;
            padding: 3px 0;
        }

        .hr {
            border-bottom: 1px dotted #000000;
            margin: 3px 0;
        }

        .bullets {
            list-style: none outside none;
        }

        MsoNormal {
            list-style: none outside none;
        }

        .jobRole {
            color: #0080FF;
            font: bold 1.4em "Arial";
            padding: 3px 0;
        }

        .emailfriendTitle {
            color: #0080FF;
            font: 1.2em "Arial";
            padding: 10px 0;
        }

        .applicationLink {
            font-size: 12px;
        }

        .smallField {
            width: 50%;
        }

        .applySubheadings {
            font-size: 12px;
            font-weight: bold;
        }

        .subheadingsSmall2 {
            font-size: 13px;
        }

        .form_apply {
            font-size: 12px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <center>
        <form onsubmit="return  checkCriteria(this);" name="submitjob" id='submitjob' action="/Work/ApplyJob.shtml"
        method="post" enctype="multipart/form-data">
        <%
            var jobapply = (JobApplyModel)Model;
            var essIncr = 1;
            var desiIncr = 1;
        %>
        <% if (ViewData["msg"] != null)
           { %>
        <script type="text/javascript">            hideProgress(); alert('<%= ViewData["msg"].ToString() %>')</script>
        <%} %>
        <div id="progress" style="position: fixed; top: 0px; bottom: 0px; left: 0px; right: 0px;
            overflow: hidden; padding: 0; margin: 0; background-color: #F0F0F0; filter: alpha(opacity=50);
            opacity: 0.5; z-index: 100000;">
            <img id="loading" src="../../Content/images/consultant/spinner3-bluey.gif" alt="" />
        </div>
        <table width="433" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td class="title" align="left">
                        <%= Html.Label("JobTitle",jobapply.JobTitle) %>
                        <%= Html.Hidden("JobId",jobapply.JobId) %>
                        <%= Html.Hidden("JobTitle",jobapply.JobTitle) %>
                        <%= Html.Hidden("ReferenceNo", jobapply.ReferenceNo)%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
            </tbody>
        </table>
        <table width="433" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td class="subheadings" width="100">
                        Given Name <span class="mandatoryString"><font color="red">*</font></span>
                    </td>
                    <td class="body">
                        <%= Html.TextBox("FirstName", "", new { @class = "Field", maxlength = "50" })%>
                    </td>
                </tr>
                <tr>
                    <td class="subheadings">
                        Family Name <span class="mandatoryString"><font color="red">*</font></span>
                    </td>
                    <td class="body">
                        <%= Html.TextBox("LastName", "", new { @class = "Field", maxlength = "50" })%>
                    </td>
                </tr>
                <tr>
                    <td class="subheadings">
                        Email <span class="mandatoryString"><font color="red">*</font></span>
                    </td>
                    <td class="body">
                        <%= Html.TextBox("Email", "", new { @class = "Field", maxlength = "50" })%>
                    </td>
                </tr>
                <tr>
                    <td class="subheadings" nowrap="nowrap">
                        Birth date<span class="mandatoryString"><font color="red">*</font></span>
                    </td>
                    <td class="body">
                        <%= Html.TextBox("BirthDate", "", new { @class = "date Field", @readonly=true })%>
                    </td>
                </tr>
                <tr>
                    <td class="subheadings" nowrap="nowrap">
                        Contact No.<span class="mandatoryString"><font color="red">*</font></span>
                    </td>
                    <td class="body">
                        <%= Html.TextBox("ContactNumber", "", new { @class = "Field", maxlength = "50" })%>
                    </td>
                </tr>
            </tbody>
        </table>
        <% if (jobapply.EssentialCriteriaList != null)
           { %>
        <table width="433" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <th class="subheadings_big1" align="left" id="essCritId">
                        ESSENTIAL CRITERIA:
                    </th>
                </tr>
                <% foreach (DataRow dr in jobapply.EssentialCriteriaList.Rows)
                   { %>
                <tr>
                    <td class="subheadings" align="left">
                        <p style="margin-left: 20;">
                            <span class="essCritCounter">
                                <%= essIncr++ %>) </span>
                            <%= dr["description"].ToString() %><font color="red">*</font></p>
                    </td>
                </tr>
                <tr>
                    <td class="body" align="left">
                        <%= Html.TextArea(dr["EssentialCriteriaId"].ToString(), new { @class = "required Field", rows=2 })%>
                        <div id='div<%= dr["EssentialCriteriaId"].ToString() %>' style="margin-left: 20">
                            <font size="1">characters left: 500</font></div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% }%>
        <% if (jobapply.DesirableCriteriaList != null && jobapply.DesirableCriteriaList.Rows.Count > 0)
           { %>
        <table width="433" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <th class="subheadings_big1" align="left" id="Th1">
                        DESIRABLE CRITERIA:
                    </th>
                </tr>
                <% foreach (DataRow dr in jobapply.DesirableCriteriaList.Rows)
                   { %>
                <tr>
                    <td class="subheadings">
                        <p style="margin-left: 20;" align="left">
                            <span class="essCritCounter">
                                <%= desiIncr++ %>) </span>
                            <%= dr["description"].ToString() %></p>
                    </td>
                </tr>
                <tr>
                    <td class="body" align="left">
                        <%= Html.TextArea(dr["DesirableCriteriaId"].ToString(), new { @class = "desi Field", rows = 2 })%>
                        <div id='divDesi<%= dr["DesirableCriteriaId"].ToString() %>' style="margin-left: 20">
                            <font size="1">characters left: 500</font></div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% }%>
        <table width="433" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <th align="left" class="subheadings_big1">
                        <p>
                            <u>COVER LETTER: </u>
                        </p>
                    </th>
                </tr>
                <tr>
                    <td class="subheadings">
                        <p class="subheadings" style="margin-left: 20">
                            Please either enter a cover letter here as text:
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="body">
                        <%= Html.TextArea("CoverLetter", new { @class = "Field", rows = 5 })%>
                        <div id="desCoverLettContent" style="margin-left: 20">
                            <font size="1">characters left: 2000</font><input type="hidden" value="2000" name="CoverLettContentRemLngth" /></div>
                    </td>
                </tr>
                <tr>
                    <td class="subheadings">
                        <p class="subheadings" style="margin-left: 20">
                            Or attach a cover letter file
                        </p>
                    </td>
                </tr>
                <tr>
                    <th align="left" class="subheadings_big1">
                        <p>
                            <u>Cover Letter:</u> <font size="1">
                                <%= ViewData["clmsg"] !=null ? ViewData["clmsg"].ToString() :"" %></font><span class="mandatoryString"><font color="red"></font></span></p>
                    </th>
                </tr>
                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="formInput" type="file" name="coverLetterOptional" id="coverLetterOptional"
                            onchange="get_filename(this,2,'Cover Letter');" value="" />
                        <input type="button" name="removefile" value="remove" id="deletefie" onclick="clearContents('coverLetterOptional')" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td class="subheadings">
                        <p style="margin-left: 20">
                        </p>
                    </td>
                </tr>
                <tr>
                    <th align="left" class="subheadings_big1">
                        <p>
                            <u>CV:</u> <font size="1">
                                <%= ViewData["cvmsg"]!=null?ViewData["cvmsg"].ToString():"" %></font><span class="mandatoryString"><font color="red">&nbsp;*</font></span></p>
                    </th>
                </tr>
                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="file" name="attachment" id="attachment" onchange="get_filename(this,1,'CV');" />
                        <input type="button" name="removefile" value="remove" id="Button1" onclick="clearContents('attachment')" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td width="420" class="body">
                        <input type="checkbox" checked="checked" name="retentionConsentChkBox" />
                        <input type="hidden" value="" name="retentionConsent" />It's OK to retain my details
                        for other positions
                    </td>
                </tr>
            </tbody>
        </table>
        <table width="433" cellspacing="0" cellpadding="0">
            <tbody>
                <tr>
                    <td>
                        <img width="1" height="20" src="../../Content/images/clear.gif" />
                    </td>
                </tr>
                <tr>
                    <th class="subheadings">
                        <input type="submit" value=" Submit " id="applyButton" class="form_apply" />
                    </th>
                </tr>
            </tbody>
        </table>
        <table width="433">
            <tbody>
                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
            </tbody>
        </table>
        </form>
    </center>
</body>
</html>