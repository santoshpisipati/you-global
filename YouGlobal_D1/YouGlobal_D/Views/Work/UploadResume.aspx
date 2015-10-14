<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<UploadCVModel>" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="YG_MVC.Models" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <link href="../../Content/css/tooltip.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/tooltip/build.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/tooltip/opentip.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/tooltip/build.js" type="text/javascript"></script>
    <script src="../../Scripts/tooltip/opentip-jquery-excanvas.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.preimage.js" type="text/javascript"></script>
    <script type="text/javascript">
        var currentNav = '#mainNavWork';
        var currentSubNav = '#rightNavUploadResume';
    </script>
    <% if (ViewData["msg"] != null)
       { %>
    <script type="text/javascript">        alert('<%= ViewData["msg"].ToString() %>')</script>
    <%} %>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#progress").hide();

            $('.CoverLetter').keyup(function () {
                textCounter(this, 'desCoverLettContent', 2000, null);
            })

        });
        $(function () {

            $("#applyButton").click(function () {
                //                $("#progress").show();
                $(".IndustrySelectR1").find("option").attr("selected", true);
                var industry = '';
                $(".IndustrySelectR1 > option:selected").each(function () {
                    industry = $(this).text() + "\n" + industry;
                });
                $("#IndustrySel").val(industry);
                hideProgress()
            });
        });
        function hideProgress() {
            $("#progress").hide();
        }

        function checkCriteria(check) {
            var valid;
            valid = checkFormFields(check);
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

        function clearContents(ele) {
            var file = document.getElementById(ele);
            file.select();
            file.value = "";
            //            value = file.createTextRange();
            //            value.execCommand('delete');
            file.focus();
            if (ele == 'file1') {
                $('#prev_file1').html('');
            }
        }

        function get_filename(obj, type, ftype) {
            if (type == 2) {
                var file = document.getElementById('Attachresume').files[0];
                if (file != null) {
                    if (file.name == obj.files[0].name) {
                        alert('The Cover Letter you are trying to attach has the same name and size as the file you have attached as your CV. Please choose the correct file, or you may proceed without attaching a Cover Letter.');
                        //clearContents(obj.id);
                        obj.value = "";
                        return;
                    }
                }
            }
            if (type == 1) {
                var file = document.getElementById('CoverLetterOptional').files[0];
                if (file != null) {
                    if (file.name == obj.files[0].name) {
                        alert('The CV you are trying to attach has the same name and size as the file you have attached as your Cover Letter. Please choose a different file as your CV, or remove the file you have attached as your Cover Letter.');
                        //clearContents(obj.id);
                        obj.value = ""
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
    <script type="text/javascript">

        function showtip(id) {
            var img = $(id);
            var title = $(img).attr("alt");
            $(img).opentip(title, { showEffect: 'blindDown', tipJoint: "top left", removeElementsOnHide: true, stem: true, target: true, tipjoint: ['center', 'top'], hideTrigger: "tip", hideTriggers: ["trigger", "tip"], showOn: "creation", hideOn: "mouseout", fixed: true, background: "rgb(234, 236, 240)", borderColor: "rgb(187, 187, 187)" });

        }

        function showTagtip(id) {
            var img = $(id);
            var title = $(img).attr("tag");
            $(img).opentip(title, { showEffect: 'blindDown', tipJoint: "top left", removeElementsOnHide: true, stem: true, target: true, tipjoint: ['center', 'top'], hideTrigger: "tip", hideTriggers: ["trigger", "tip"], showOn: "creation", hideOn: "mouseout", fixed: true, background: "rgb(234, 236, 240)", borderColor: "rgb(187, 187, 187)" });

        }

        jq9("html").addClass("js");
        var change = function (event, ui) {
            window.location.hash = ui.newHeader.children('a').attr('href');
        }
        jq9(function () {

            jq9("#divcv").accordion({
                objID: "#acc2",
                el: ".h",
                head: "h4, h5",
                next: "div",
                initShow: "div.shown",
                navigation: true,
                standardExpansible: true,
                activate: 1,
                change: change
            });
            jq9("#divcv .accordion").expandAll({
                trigger: ".h",
                ref: "h4.h",
                cllpsEl: "div.outer",
                speed: 200,
                oneSwitch: false,
                instantHide: true
            });

            jq9("html").removeClass("js");

        });
    </script>
    <style type="text/css">
        .prev_container {
            overflow: auto;
            width: 300px;
            height: 135px;
        }

        .prev_thumb {
            margin: 10px;
            height: 100px;
        }

        .field-validation-error {
            color: red;
            font-weight: bold;
        }

        .input-validation-error {
            background: pink;
            border: 1px solid red;
        }

        .validation-summary-errors {
            color: red;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript" language="javascript">

        $(document).ready(function () {
            $('.file').preimage();
        });

        var counter = 2;
        function removeCV1Middlename(id) {
            var div = $(id).parent().parent();
            if (div != null)
                div.html('');

        }
        function addCV1Control(id) {
            var newTextBoxDiv = $(document.createElement('div')).attr("id", 'TextBoxDiv' + counter).attr("style", "clear:both");
            var ele = '<input type="text" name="MiddleName" id="MiddleName" value="" onkeypress="return LettersWithSpaceOnly(event);" >';
            ele += '<div style="margin-top: -16px; margin-left: 143px;"><img style="display: block !important;visibility: inherit !important;" id="Img5" class="phoneRemove" onclick="removeCV1Middlename(this)" src="../../Content/images/Cross - white on red - 12 pixel.png"  onmouseover="showtip(this)" alt="Remove selected"></div>';
            newTextBoxDiv.after().html(ele);
            newTextBoxDiv.appendTo("#divCV1middle");
        }

        function removeCV1Phone(id) {
            var div = $(id).parent().parent().parent().parent().parent();
            if (div != null)
                div.html('');
        }
        function addCV1PhoneControl(id) {
            var c1 = $(id).siblings('table')[0];
            var tbl = $(c1).clone();
            var newTextBoxDiv = $(document.createElement('div'))
	     .attr("id", 'phoneDiv' + counter);
            $(c1).clone().appendTo(newTextBoxDiv);
            newTextBoxDiv.find("input").val('');
            newTextBoxDiv.find("div").show();
            newTextBoxDiv.appendTo("#divCV1Phone");
            countryAuto();
        }
        function phonetypechange(id) {
            var txt = $(id).find('option:selected').text();
            $(id).siblings('input').val(txt);

        }

        function removeCV1Employment(id) {
            var div = $(id).parent().parent().parent().parent().parent();
            if (div != null)
                div.html('');
        }
        function addCV1EmploymentControl(id) {
            var c1 = $(id).siblings('table')[0];
            var newTextBoxDiv = $(document.createElement('div')).attr("id", 'employmentDiv' + counter);
            $(c1).clone().appendTo(newTextBoxDiv);
            newTextBoxDiv.find("input").val('');
            newTextBoxDiv.find("div").show();
            newTextBoxDiv.appendTo("#divCV1Employment");
            employmentHistory();
        }
    </script>
    <script type="text/javascript" language="javascript">
        function setAccordionstate(ctl, anc) {
            var hdf = $('#' + ctl);
            var div = $(anc).parent().parent().find('.outer');
            if (hdf.val() == '') {
                hdf.val('1');
                //                $(anc).removeAttr('class');
                //                $(anc).attr('class', 'trigger open');
                //                div.removeAttr('style');
                //                div.attr('style', 'display: block');
            }
            else {
                hdf.val('');
                //                $(anc).removeAttr('class');
                //                $(anc).attr('class', 'trigger');
                //                div.removeAttr('style');
                //                div.attr('style', 'display: none');
            }
            return false;
        }
    </script>
    <script type="text/javascript" language="javascript">
        function nospaces(t) {
            if (t.value.match(/\s/g)) {
                alert('Skype Names do not contain spaces');
                t.value = t.value.replace(/\s/g, '');
            }
        }

        function isNumber(e) {
            if (e.ctrlKey || e.metaKey)
                return true;
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }
            //            evt = (evt) ? evt : window.event;
            //            var charCode = (evt.which) ? evt.which : evt.keyCode;
            //            if (evt.shiftKey || evt.ctrlKey || evt.altKey && evt.keyCode == 65)
            //                return true;

            //            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            //                return false;
            //            }
            //            return true;
        }

        function isPhoneNumber(e) {
            if (e.ctrlKey || e.metaKey)
                return true;
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                var charCode = (e.which) ? e.which : e.keyCode;
                if (charCode == 45 || charCode == 32)
                    return true;
                return false;
            }

            //            evt = (evt) ? evt : window.event;
            //            var charCode = (evt.which) ? evt.which : evt.keyCode;
            //            if (evt.ctrlKey && charCode == 118)
            //                return true;
            //            if (charCode == 46)
            //                return true;
            //            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            //                if (charCode == 45 || charCode == 32 || charCode == 86)
            //                    return true;
            //                return false;
            //            }
            //            return true;
        }

        function yearvalidation(id) {
            var fy = $('#CurrentFY').val();
            var ty = $('#CurrentTY').val();
            var fm = $('#CurrentFM').val();
            var tm = $('#CurrentTM').val();
            var fd = $('#CurrentFD').val();
            var td = $('#CurrentTD').val();
            var fdt;
            var todt;
            fd = fd == '' ? '01' : (fd < 10 ? '0' + fd : fd);
            td = td == '' ? fd : (td < 10 ? '0' + td : td);
            fdt = new Date(fy + '-' + (fm == '' ? '01' : ($('#CurrentFM').attr('selectedIndex') < 10 ? ('0' + $('#CurrentFM').attr('selectedIndex')) : $('#CurrentFM').attr('selectedIndex'))) + '-' + fd);
            todt = new Date(ty + '-' + (tm == '' ? '12' : ($('#CurrentTM').attr('selectedIndex') < 10 ? ('0' + $('#CurrentTM').attr('selectedIndex')) : $('#CurrentTM').attr('selectedIndex'))) + '-' + td);

            if (fy != '') {
                if (isNaN(fdt)) {
                    alert('invalid date');
                    $(id).val('');
                    return;
                }
            }

            if (ty != '' && ty != 'Present') {
                if (isNaN(todt)) {
                    alert('invalid date');
                    $(id).val('');
                    return;
                }
            }
            if (fy != '' && ty != '') {

                if (ty != 'Present')
                    if (fdt > todt) {
                        alert("The From date should not be more recent than the To date. ");
                        $(id).val('');
                    }
            }
        }

        function cmonthchange(id) {
            var fy = $('#CurrentFY').val();
            if (fy == '') {
                alert('Please select Year');
                $(id).val('');
            }
            if ($('#CurrentFY').val() == 'Present') {
                alert('Not allowed to select Month if year is set to Present');
                $(id).val('');
            }
            $('#CurrentFD').val('');
        }

        function cdaychange(id) {
            var fy = $('#CurrentFM').val();
            if (fy == '') {
                alert('Please select month');
                $(id).val('');
            }
        }

        function ctmonthchange(id) {
            var fy = $('#CurrentTY').val();
            if (fy == '') {
                alert('Please select Year');
                $(id).val('');
            }
            if ($('#CurrentTY').val() == 'Present') {
                alert('Not allowed to select Month if year is set to Present');
                $(id).val('');
            }
            $('#CurrentTD').val('');
        }

        function ctdaychange(id) {
            var fy = $('#CurrentTM').val();
            if (fy == '') {
                alert('Please select month');
                $(id).val('');
            }
        }

        function historyyearvalidation(id) {
            var fy = '';
            var ty = '';
            var fm = '';
            var tm = '';
            var fd = '';
            var td = '';
            switch ($(id).attr("id")) {
                case "EmpFY":
                    fy = $(id).val();
                    break;
                case "EmpTY":
                    ty = $(id).val();
                    break;
                case "EmpTM":
                    tm = $(id).attr('selectedIndex');
                    break;
                case "EmpFM":
                    fm = $(id).attr('selectedIndex');
                    break;
                case "EmpFD":
                    fd = $(id).val();
                    break;
                case "EmpTD":
                    td = $(id).val();
                    break;
            }
            $(id).siblings('select').each(function () {
                switch ($(this).attr("id")) {
                    case "EmpFY":
                        fy = $(this).val();
                        break;
                    case "EmpTY":
                        ty = $(this).val();
                        break;
                    case "EmpTM":
                        tm = $(this).attr('selectedIndex');
                        break;
                    case "EmpFM":
                        fm = $(this).attr('selectedIndex');
                        break;
                    case "EmpFD":
                        fd = $(this).val();
                        break;
                    case "EmpTD":
                        td = $(this).val();
                        break;
                }
            });

            $(id).parent().parent().siblings().find('select').each(function () {
                switch ($(this).attr("id")) {
                    case "EmpFY":
                        fy = $(this).val();
                        break;
                    case "EmpTY":
                        ty = $(this).val();
                        break;
                    case "EmpTM":
                        tm = $(this).attr('selectedIndex');
                        break;
                    case "EmpFM":
                        fm = $(this).attr('selectedIndex');
                        break;
                    case "EmpFD":
                        fd = $(this).val();
                        break;
                    case "EmpTD":
                        td = $(this).val();
                        break;
                }
            });

            var fdt;
            var todt;
            fm = (fm == '' ? '01' : (fm < 10 ? '0' + fm : fm));
            tm = (tm == '' ? '12' : (tm < 10 ? '0' + tm : tm));
            fd = fd == '' ? '01' : (fd < 10 ? '0' + fd : fd);
            td = td == '' ? fd : (td < 10 ? '0' + td : td);

            fdt = new Date(fy + '-' + fm + '-' + fd);
            todt = new Date(ty + '-' + tm + '-' + td);

            if (fy != '') {
                if (isNaN(fdt)) {
                    alert('invalid date');
                    $(id).val('');
                    return;
                }
            }
            if (ty != '' && ty != 'Present') {
                if (isNaN(todt)) {
                    alert('invalid date');
                    $(id).val('');
                    return;
                }
            }
            if (fy != '' && ty != '') {

                if (ty != 'Present')
                    if (fdt > todt) {
                        alert("The From date should not be more recent than the To date. ");
                        $(id).val('');
                    }
            }
        }

        function yearchange(id) {
            $(id).siblings('select').each(function () { this.value = ''; });

            return true;
        }

        function fmonthchange(id) {
            var fy = '';
            var ty = '';
            var fm = '';
            var tm = '';
            var fd = '';
            var td = '';
            $(id).siblings('select').each(function () {
                switch ($(this).attr("id")) {
                    case "EmpFY":
                        fy = $(this).val();
                        break;
                    case "EmpFM":
                        fm = $(this).attr('selectedIndex');
                        break;
                    case "EmpFD":
                        fd = $(this).val('');
                        break;
                }

            });
            if (fy == '') {
                alert('Please select Year');
                $(id).val('');
                return false;
            }
            if (fy == 'Present') {
                alert('Not allowed to select Month if year is set to Present');
                $(id).val('');
            }
            return true;
        }

        function fdaychange(id) {
            var fy = '';
            var ty = '';
            var fm = '';
            var tm = '';
            var fd = '';
            var td = '';
            $(id).siblings('select').each(function () {
                switch ($(this).attr("id")) {
                    case "EmpFY":
                        fy = $(this).val();
                        break;
                    case "EmpFM":
                        fm = $(this).attr('selectedIndex');
                        break;
                    case "EmpFD":
                        fd = $(this).val();
                        break;
                }

            });
            if (fm == '') {
                alert('Please select month');
                $(id).val('');
                return false;
            }
            return true;
        }

        function tmonthchange(id) {
            var fy = '';
            var ty = '';
            var fm = '';
            var tm = '';
            var fd = '';
            var td = '';
            $(id).siblings('select').each(function () {
                switch ($(this).attr("id")) {
                    case "EmpTY":
                        fy = $(this).val();
                        break;
                    case "EmpTM":
                        fm = $(this).attr('selectedIndex');
                        break;
                    case "EmpTD":
                        fd = $(this).val('');
                        break;
                }

            });
            if (fy == '') {
                alert('Please select Year');
                $(id).val('');
                return false;
            }
            if (fy == 'Present') {
                alert('Not allowed to select Month if year is set to Present');
                $(id).val('');
            }
            return true;
        }

        function tdaychange(id) {
            var fy = '';
            var ty = '';
            var fm = '';
            var tm = '';
            var fd = '';
            var td = '';
            $(id).siblings('select').each(function () {
                switch ($(this).attr("id")) {
                    case "EmpTY":
                        fy = $(this).val();
                        break;
                    case "EmpTM":
                        fm = $(this).attr('selectedIndex');
                        break;
                    case "EmpTD":
                        fd = $(this).val();
                        break;
                }

            });
            if (fm == '') {
                alert('Please select month');
                $(id).val('');
                return false;
            }
            return true;
        }

        function checkCurrentAmount(id) {
            var famt = parseInt($('#CurrentFromAmt').val());
            var tamt = parseInt($('#CurrentToAmt').val());
            var cur = $('.CurrentCurrency').val();
            if (famt > 0 || tamt > 0) {
                if (cur == '') {
                    alert('You need to select a currency within the "Remuneration" section.');
                    $(id).val('0');
                    $('.CurrentCurrency').focus();
                    return;
                }
            }
            if (famt > 0 && tamt > 0) {
                if (tamt < famt) {
                    alert('From amount should not be higher than To amount');
                    $(id).val('0');
                }
            }
            else {
                if (famt > 0)
                    $('#CurrentToAmt').focus();
                else
                    if (tamt > 0)
                        $("#CurrentFrequency").focus();

            }
            if ($(id).attr('id') == 'CurrentToAmt') {
                if (tamt < famt) {
                    alert('From amount should not be higher than To amount');
                    $('#CurrentFromAmt').val('0');
                    return false;
                }
                //                if ($("#CurrentFrequency").val() == '-1') {
                //                    $("#CurrentFrequency").focus();
                //                }
            }
        }

        function checkExpAmount(id) {
            var famt = parseInt($('#ExpFromAmt').val());
            var tamt = parseInt($('#ExpToAmt').val());
            var cur = $('.ExpCurrency').val();
            if (famt > 0 || tamt > 0) {
                if (cur == '') {
                    alert('You need to select a currency within the "Remuneration" section.');
                    $(id).val('0');
                    $('.ExpCurrency').focus();
                    return;
                }
            }
            if (famt > 0 && tamt > 0) {

                if (tamt < famt) {
                    alert('From amount should not be higher than To amount');
                    $(id).val('0');
                }
            }
            else {
                if (famt > 0)
                    $('#ExpToAmt').focus();
                else
                    if (tamt > 0)
                        $("#ExpFrequency").focus();
            }
            if ($(id).attr('id') == 'ExpToAmt') {
                if (tamt < famt) {
                    alert('From amount should not be higher than To amount');
                    $('#ExpFromAmt').val('0');
                    return false;
                }
                //                if ($("#ExpFrequency").val() == '-1') {
                //                    $("#ExpFrequency").focus();
                //                }
            }
        }

        function checkCurrentFrequency() {
            if ($('.CurrentCurrency').val() != '') {
                if ($("#CurrentFrequency").val() == '-1') {
                    //        $("#CurrentFrequency").focus();
                    alert('Please select a frequency for Current Remuneration.');
                    return false;
                }
            }
        }

        function checkExpFrequency() {
            if ($('.ExpCurrency').val() != '') {
                if ($("#ExpFrequency").val() == '-1') {
                    //        $("#ExpFrequency").focus();
                    alert('Please select a frequency for Expected Remuneration.');
                    return false;
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var model = (UploadCVModel)Model;
    %>
    <div id="progress" style="position: fixed; top: 0px; bottom: 0px; left: 0px; right: 0px; overflow: hidden; padding: 0; margin: 0; background-color: #F0F0F0; filter: alpha(opacity=50); opacity: 0.8; z-index: 100000;">
        <div style="margin-left: 50%; margin-top: 25%;">
            <img id="loading" src="../../Content/images/consultant/spinner3-bluey.gif" alt="" />
        </div>
    </div>
    <div class="subheader">
        <h2>Upload CV</h2>
    </div>
    <div>
        <p>
            Upload your resume and let us do the rest for you. Provide extra information to
            set your resume apart, or start searching for jobs immediately!
        </p>
        <div id="divcv" class="submitcv">
            <span class="additionaltext"><span style="color: Red">* </span>Indicates mandatory input</span>
            <form name="submitcv" onsubmit="return checkValid();" action="/Work/UploadResume.shtml"
                method="post" enctype="multipart/form-data">
                <input type="hidden" name="SubmitSource" id="SubmitSource" value="uploadresume" />
                <div class="subheadings1">
                    <%=Html.ValidationSummary(false) %>
                    <input type="hidden" id="hdfPersonalAccordion" name="hdfPersonalAccordion" />
                    <%= Html.Hidden("PersonalAccordion") %>
                    <%= Html.Hidden("ContactAccordion")%>
                    <%= Html.Hidden("EmploymentAccordion")%>
                    <%= Html.Hidden("HistoryAccordion")%>
                    <%= Html.Hidden("EnumerationAccordion")%>
                    <ul class="accordion" id="acc2">
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#" onclick="setAccordionstate('PersonalAccordion',this)">Personal
                                Detail<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["CV_Personal"]==null?"": ViewData["CV_Personal"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <table width="433" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td class="subheadings">Email <font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                    alt="<%=ViewData["CV_EmailTip"]==null?"": ViewData["CV_EmailTip"].ToString()  %>" onmouseover="showtip(this)" />
                                                </td>
                                                <td class="body">
                                                    <%= Html.TextBox("Email", model.Email, new { @class = "Field", maxlength = "50" })%>
                                                    <%= Html.DropDownList("Emailtype", new SelectList(((DataTable)Session["emailtype"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv", Style = "width:70px" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="subheadings">Title<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                    alt="<%=ViewData["CV_TitleTip"]==null?"": ViewData["CV_TitleTip"].ToString()  %>" onmouseover="showtip(this)" />
                                                </td>
                                                <td>
                                                    <%= Html.DropDownList("title",new SelectList(((DataTable)Session["title"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv" }) %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="subheadings" width="100">First Name <font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                    alt="<%=ViewData["CV_First"]==null?"": ViewData["CV_First"].ToString()  %>" onmouseover="showtip(this)" />
                                                </td>
                                                <td class="body">
                                                    <%= Html.TextBox("FirstName", model.FirstName, new { @class = "Field", maxlength = "50", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="subheadings">Middle Name/s<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_Middle"]==null?"": ViewData["CV_Middle"].ToString()  %>"
                                                    onmouseover="showtip(this)" />
                                                </td>
                                                <td>
                                                    <%if (model.MiddleName == null)
                                                      {%>
                                                    <%= Html.TextBox("MiddleName", model.MiddleName, new { @class = "Field", maxlength = "50", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                                    <%}
                                                      else
                                                      {
                                                          foreach (string middle in model.MiddleName)
                                                          {%>
                                                    <%-- <%= Html.TextBox("MiddleName", middle, new { @class = "Field", maxlength = "50", onkeypress = "return LettersWithSpaceOnly(event);" })%>--%>
                                                    <input type="text" id="middlename" name="middlename" value="<%= middle %>" onkeypress="return LettersWithSpaceOnly(event);" />
                                                    <%}
                                                  } %>
                                                    <div id="divCV1middle">
                                                    </div>
                                                    <input type="button" value="Add" id="btnMiddle" onclick="addCV1Control(this)" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="subheadings" style="width: 176px">Family Name / Surname <font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                    alt="<%=ViewData["CV_Surname"]==null?"": ViewData["CV_Surname"].ToString()  %>" onmouseover="showtip(this)" />
                                                </td>
                                                <td class="body">
                                                    <%= Html.TextBox("LastName", model.LastName, new { @class = "Field", maxlength = "50", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="subheadings">Commonly known as<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_Common"]==null?"": ViewData["CV_Common"].ToString()  %>"
                                                    onmouseover="showtip(this)" />
                                                </td>
                                                <td>
                                                    <%= Html.TextBox("NickName", model.NickName, new { @class = "Field", maxlength = "25", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="subheadings" nowrap="nowrap">Birth date<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                    alt="<%=ViewData["CV_Birth"]==null?"": ViewData["CV_Birth"].ToString()  %>" onmouseover="showtip(this)" />
                                                </td>
                                                <td class="body">
                                                    <%= Html.TextBox("BirthDate", model.BirthDate, new { @class = "date1 Field", @readonly = true })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="subheadings">Gender<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                    alt="<%=ViewData["CV_Gender"]==null?"": ViewData["CV_Gender"].ToString()  %>" onmouseover="showtip(this)" />
                                                </td>
                                                <td>
                                                    <%= Html.DropDownList("gender",new SelectList(((DataTable)Session["gender"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv" }) %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="subheadings">Nationality<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                    alt="<%=ViewData["CV_Nationality"]==null?"": ViewData["CV_Nationality"].ToString()  %>"
                                                    onmouseover="showtip(this)" />
                                                </td>
                                                <td>
                                                    <div id="divNation" style="display: none">
                                                        <%= Html.ListBox("NationSelect", new SelectList((model.Nationality==null?new DataTable():model.Nationality).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "5", @class = "fieldAlerts NationSelect" })%>
                                                        <div style="float: right">
                                                            <img alt="Remove selected" src="../../Content/images/delete.png" id="btnNRemove"
                                                                onmouseover="showtip(this)" style="display: block !important; visibility: inherit !important;" />
                                                        </div>
                                                    </div>
                                                    <%if (model.Nationality != null && model.Nationality.Rows.Count > 0)
                                                      {%>
                                                    <script type="text/javascript" language="javascript">
                                                        $('#divNation').show();
                                                    </script>
                                                    <%
                                                  } %>
                                                    <%= Html.TextBox("Nationality", "", new { @class = "nationApply Field" })%>
                                                    <%-- <input type="hidden" id="Countrylist" />--%>
                                                    <%= Html.Hidden("Countrylist")%>
                                                    <%= Html.Hidden("NationId")%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="subheadings">Marital status<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_Marital"]==null?"": ViewData["CV_Marital"].ToString()  %>"
                                                    onmouseover="showtip(this)" />
                                                </td>
                                                <td>
                                                    <%= Html.DropDownList("marital",new SelectList(((DataTable)Session["marital"]).Rows as System.Collections.IEnumerable, "[1]", "[0]"), new { @class = "fieldAdv" }) %>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </li>
                        <li>
                            <input type="hidden" id="hdfContactAccordion" />
                            <h4 class="h">
                                <a class="trigger" href="#" onclick="setAccordionstate('ContactAccordion',this)">Contact
                                details<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["CV_Contact"]==null?"": ViewData["CV_Contact"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <label class="subheadings" for="phone">
                                        Phone<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                            alt="<%=ViewData["CV_PhoneTip"]==null?"": ViewData["CV_PhoneTip"].ToString()  %>" onmouseover="showtip(this)" /></label>
                                    <input type="hidden" id="hdfCC" />
                                    <br />
                                    <% if (model.PhoneList == null)
                                       { %>
                                    <table>
                                        <tr>
                                            <td class="subheadings">Type
                                            </td>
                                            <td style="width: 185px">
                                                <%= Html.DropDownList("Phonetype", new SelectList(((DataTable)Session["phonetype"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv PTCV",@onchange="phonetypechange(this)" })%>
                                                <input type="hidden" id="PhonetypeDesc" name="PhonetypeDesc" />
                                                <div style="float: right; margin-right: 8px; margin-top: 7px; display: none">
                                                    <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                        onmouseover="showtip(this)" onclick="removeCV1Phone(this)" class="phoneRemove"
                                                        id="phoneRemove" style="display: block !important; visibility: inherit !important;" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Country code
                                            </td>
                                            <td>
                                                <%=Html.TextBox("Countrycode","", new { @maxlength = "10", @class = "countrycode Field" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Local area code
                                            </td>
                                            <td>
                                                <%=Html.TextBox("Localareacode", "", new { @maxlength = "20", @class = "Field", onkeypress = "return isNumber(event);" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Number
                                            </td>
                                            <td>
                                                <%=Html.TextBox("Phone", "", new { @maxlength = "20", @class = "Field", onkeypress = "return isPhoneNumber(event);" })%>
                                            </td>
                                        </tr>
                                    </table>
                                    <%}
                                       else
                                       {
                                           int j = 0;
                                           foreach (PhoneData phone in model.PhoneList)
                                           { %>
                                    <table>
                                        <tr>
                                            <td class="subheadings">Type
                                            </td>
                                            <td style="width: 185px">
                                                <%= Html.DropDownListFor(m => m.Phonetype, new SelectList(((DataTable)Session["phonetype"]).Rows as System.Collections.IEnumerable, "[0]", "[1]", phone.Phonetype), new { @class = "fieldAdv PTCV", id = "Phonetype", name = "Phonetype", @onchange = "phonetypechange(this)" })%>
                                                <input type="hidden" id="PhonetypeDesc" name="PhonetypeDesc" value="<%= phone.PhonetypeDesc %>" />
                                                <% if (phone.Phonetype != -1)
                                                   { %>
                                                <%=Html.Hidden("PT"+j,phone.Phonetype) %>
                                                <script type="text/javascript" language="javascript">
                                                    $('#PT' + j).siblings('select')[0].value = $('#PT' + j).val();
                                                    j = j + 1;
                                                </script>
                                                <%} %>
                                                <%if (j == 0)
                                                  {%>
                                                <div style="float: right; margin-right: 8px; margin-top: 7px; display: none">
                                                    <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                        onmouseover="showtip(this)" onclick="removeCV1Phone(this)" class="phoneRemove"
                                                        id="Img2" style="display: block !important; visibility: inherit !important;" />
                                                </div>
                                                <%
                                              }
                                                  else
                                                  {%>
                                                <div style="float: right; margin-right: 8px; margin-top: 7px;">
                                                    <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                        onmouseover="showtip(this)" onclick="removePhone(this)" class="phoneRemove" id="Img3"
                                                        style="display: block !important; visibility: inherit !important;" />
                                                </div>
                                                <%} %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Country code
                                            </td>
                                            <td>
                                                <%--%=Html.TextBox("Countrycode", phone.Countrycode, new { @class = "countrycode Field" })%>--%>
                                                <input type="text" id="Countrycode" name="Countrycode" class="countrycode" value="<%= phone.Countrycode %>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Local area code
                                            </td>
                                            <td>
                                                <%--<%=Html.TextBox("Localareacode", phone.Localareacode, new { @class = "Field" })%>--%>
                                                <input type="text" id="Localareacode" name="Localareacode" class="Field" value="<%= phone.Localareacode %>"
                                                    onkeypress="return isNumber(event);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Number
                                            </td>
                                            <td>
                                                <input type="text" id="Phone" name="Phone" class="Field" value="<%= phone.Phonenumber %>"
                                                    onkeypress="return isPhoneNumber(event);" />
                                                <%--<%=Html.TextBox("Phone", phone.Phonenumber, new { @class = "Field" })%>--%>
                                            </td>
                                        </tr>
                                    </table>
                                    <% j = j + 1;
                                       }
                                   } %>
                                    <br />
                                    <div id="divCV1Phone" style="clear: both">
                                    </div>
                                    <input type="button" value="Add" id="Button2" onclick="addCV1PhoneControl(this)" />
                                    <br />
                                    <table>
                                        <tr>
                                            <td class="subheadings">Skype Name<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_SkypeTip"]==null?"": ViewData["CV_SkypeTip"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%=Html.TextBox("Skype", model.Skype, new { @class = "Field", onkeypress = "return nospaces(this);" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Subscribe to Job Alerts
                                            </td>
                                            <td>
                                                <%=Html.CheckBox("SubscribeAlert")%>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </li>
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#" onclick="setAccordionstate('EmploymentAccordion',this)">Current or most recent employment <font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["CV_Current"]==null?"": ViewData["CV_Current"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <table>
                                        <tr>
                                            <td class="subheadings">From<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_CFrom"]==null?"": ViewData["CV_CFrom"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.DropDownList("CurrentFY", new SelectList(((ListItemCollection)Session["year"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:61px !important", onchange = "yearvalidation(this)" })%>
                                                <%= Html.DropDownList("CurrentFM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "cmonthchange(this);yearvalidation(this)" })%>
                                                <%= Html.DropDownList("CurrentFD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "cdaychange(this);yearvalidation(this)" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">To<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_CTo"]==null?"": ViewData["CV_CTo"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.DropDownList("CurrentTY", new SelectList(((ListItemCollection)Session["Toyear"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:61px !important", onchange = "yearvalidation(this)" })%>
                                                <%= Html.DropDownList("CurrentTM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "ctmonthchange(this);yearvalidation(this)" })%>
                                                <%= Html.DropDownList("CurrentTD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "ctdaychange(this);yearvalidation(this)" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Your current employer name<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_CEmployer"]==null?"": ViewData["CV_CEmployer"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.TextBox("Currentemployer", string.Empty, new { @class = "fieldQuick CurrentemployerA" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Your current employment location<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                alt="<%=ViewData["CV_CLocation"]==null?"": ViewData["CV_CLocation"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.TextBox("Currentemplocation", string.Empty, new { @class = "fieldQuick CurrentemplocationA" })%>
                                                <%= Html.Hidden("CurrentemplocationId")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Your occupational category<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                alt="<%=ViewData["CV_COccupation"]==null?"": ViewData["CV_COccupation"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.TextBox("CurrentOccupation", model.CurrentOccupation, new { @class = "fieldQuick CurrentOccupationA" })%>
                                                <%= Html.Hidden("CurrentOccupationId")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Your industry category<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                alt="<%=ViewData["CV_CIndustry"]==null?"": ViewData["CV_CIndustry"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.TextBox("CurrentIndustry", string.Empty, new { @class = "fieldQuick CurrentIndustryA" })%>
                                                <%= Html.Hidden("CurrentIndustryId",model.CurrentIndustryId) %>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </li>
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#" onclick="setAccordionstate('HistoryAccordion',this)">Employment
                                history<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EmpHistory"]==null?"": ViewData["CV_EmpHistory"].ToString()  %>"
                                    onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <% if (model.EmploymentList == null)
                                       { %>
                                    <table>
                                        <tr>
                                            <td class="subheadings">From<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EFrom"]==null?"": ViewData["CV_EFrom"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.DropDownList("EmpFY", new SelectList(((ListItemCollection)Session["year"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "yearchange(this); historyyearvalidation(this)" })%>
                                                <%= Html.DropDownList("EmpFM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "fmonthchange(this); historyyearvalidation(this)" })%>
                                                <%= Html.DropDownList("EmpFD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "fdaychange(this); historyyearvalidation(this)" })%>
                                                <div style="float: right; margin-right: 8px; margin-top: 7px; display: none">
                                                    <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                        onmouseover="showtip(this)" onclick="removeCV1Employment(this)" class="employmentRemove"
                                                        id="employmentRemove" style="display: block !important; visibility: inherit !important;" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">To<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_ETo"]==null?"": ViewData["CV_ETo"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.DropDownList("EmpTY", new SelectList(((ListItemCollection)Session["Toyear"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "yearchange(this); historyyearvalidation(this)" })%>
                                                <%= Html.DropDownList("EmpTM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "tmonthchange(this); historyyearvalidation(this)" })%>
                                                <%= Html.DropDownList("EmpTD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "tdaychange(this); historyyearvalidation(this)" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Employer name<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EEmployer"]==null?"": ViewData["CV_EEmployer"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.TextBox("Empemployer", string.Empty, new { @class = "fieldQuick Empemployer" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Employment location<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_ELocation"]==null?"": ViewData["CV_ELocation"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.TextBox("Emplocation", string.Empty, new { @class = "fieldQuick Emplocation" })%>
                                                <%= Html.Hidden("EmplocationId")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Occupational category<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EOccupation"]==null?"": ViewData["CV_EOccupation"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.TextBox("EmpOccupation", string.Empty, new { @class = "fieldQuick EmpOccupation" })%>
                                                <%= Html.Hidden("EmpOccupationId")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Industry category<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EIndustry"]==null?"": ViewData["CV_EIndustry"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.TextBox("EmpIndustry", string.Empty, new { @class = "fieldQuick EmpIndustry" })%>
                                                <%= Html.Hidden("EmpIndustryId", "", new  { @class = "EmpIndustryId" })%>
                                            </td>
                                        </tr>
                                    </table>
                                    <%}
                                       else
                                       {
                                           int i = 0;
                                           foreach (Employment emp in model.EmploymentList)
                                           {%>
                                    <table>
                                        <tr>
                                            <td class="subheadings">From<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EFrom"]==null?"": ViewData["CV_EFrom"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.DropDownListFor(m => m.EmpFY, new SelectList(((ListItemCollection)Session["year"]) as System.Collections.IEnumerable, "Text", "Text", Model.EmpFY[i]), new { @class = "fieldAdv", id = "EmpFY", name = "EmpFY", @style = "width:55px !important", onchange = "yearchange(this) historyyearvalidation(this)" })%>
                                                <%= Html.DropDownListFor(m => m.EmpFM, new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text", Model.EmpFM[i]), new { @class = "fieldAdv", id = "EmpFM", name = "EmpFM", @style = "width:55px !important", onchange = "fmonthchange(this) historyyearvalidation(this)" })%>
                                                <%= Html.DropDownListFor(m => m.EmpFD, new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text", emp.FromDay), new { @class = "fieldAdv", id = "EmpFD", name = "EmpFD", @style = "width:55px !important", onchange = "fdaychange(this); historyyearvalidation(this)" })%>
                                                <%if (i == 0)
                                                  {%>
                                                <div style="float: right; margin-right: 8px; margin-top: 7px; display: none">
                                                    <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                        onmouseover="showtip(this)" onclick="removeCV1Employment(this)" class="employmentRemove"
                                                        id="employmentRemove" style="display: block !important; visibility: inherit !important;" />
                                                </div>
                                                <%
                                              }
                                                  else
                                                  {%>
                                                <div style="float: right; margin-right: 8px; margin-top: 7px;">
                                                    <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                        onmouseover="showtip(this)" onclick="removeCV1Employment(this)" class="employmentRemove"
                                                        id="Img1" style="display: block !important; visibility: inherit !important;" />
                                                </div>
                                                <%} %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">To<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_ETo"]==null?"": ViewData["CV_ETo"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%= Html.DropDownListFor(m => m.EmpTY, new SelectList(((ListItemCollection)Session["Toyear"]) as System.Collections.IEnumerable, "Text", "Text", emp.ToYear), new { @class = "fieldAdv", id = "EmpTY", name = "EmpTY", @style = "width:55px !important", onchange = "yearchange(this); historyyearvalidation(this)" })%>
                                                <%= Html.DropDownListFor(m => m.EmpTM, new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text", emp.ToMonth), new { @class = "fieldAdv", id = "EmpTM", name = "EmpTM", @style = "width:55px !important", onchange = "tmonthchange(this); historyyearvalidation(this)" })%>
                                                <%= Html.DropDownListFor(m => m.EmpTD, new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text", emp.ToDay), new { @class = "fieldAdv", id = "EmpTD", name = "EmpTD", @style = "width:55px !important", onchange = "tdaychange(this); historyyearvalidation(this)" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Employer name<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EEmployer"]==null?"": ViewData["CV_EEmployer"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%-- <%= Html.TextBox("Empemployer", emp.Employername, new { @class = "fieldQuick Empemployer" })%>--%>
                                                <input type="text" id="Empemployer" name="Empemployer" class="fieldQuick Empemployer"
                                                    value="<%= emp.Employername %>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Employment location<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_ELocation"]==null?"": ViewData["CV_ELocation"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%--<%= Html.TextBox("Emplocation", emp.Location, new { @class = "fieldQuick Emplocation" })%>--%>
                                                <input type="text" name="Emplocation" id="Emplocation" class="fieldQuick Emplocation"
                                                    value="<%= emp.Location %>" />
                                                <input type="hidden" id="EmplocationId" name="EmplocationId" value='<%=emp.LocationId  %>' />
                                                <%--<%= Html.Hidden("EmplocationId",emp.LocationId)%>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Occupational category<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EOccupation"]==null?"": ViewData["CV_EOccupation"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%--<%= Html.TextBox("EmpOccupation",emp.Occupation, new { @class = "fieldQuick EmpOccupation" })%>--%>
                                                <input type="text" id="EmpOccupation" name="EmpOccupation" class="fieldQuick EmpOccupation"
                                                    value="<%= emp.Occupation %>" />
                                                <input type="hidden" id="EmpOccupationId" name="EmpOccupationId" value='<%=emp.OccupationId  %>' />
                                                <%-- <%= Html.Hidden("EmpOccupationId",emp.OccupationId)%>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Industry category<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EIndustry"]==null?"": ViewData["CV_EIndustry"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td>
                                                <%-- <%= Html.TextBox("EmpIndustry",emp.Industry, new { @class = "fieldQuick EmpIndustry" })%>--%>
                                                <input type="text" id="EmpIndustry" name="EmpIndustry" class="fieldQuick EmpIndustry"
                                                    value="<%= emp.Industry %>" />
                                                <input type="hidden" id="EmpIndustryId" name="EmpIndustryId" class="EmpIndustryId"
                                                    value='<%=emp.IndustryId  %>' />
                                                <%-- <%= Html.Hidden("EmpIndustryId",emp.IndustryId)%>--%>
                                            </td>
                                        </tr>
                                    </table>
                                    <%  i = i + 1;
                                       }
                                   }%>
                                    <div id="divCV1Employment">
                                    </div>
                                    <input type="button" value="Add" id="Button3" onclick="addCV1EmploymentControl(this)" />
                                </div>
                            </div>
                        </li>
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#" onclick="setAccordionstate('EnumerationAccordion',this)">Remuneration<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_Remuneration"]==null?"": ViewData["CV_Remuneration"].ToString()  %>"
                                    onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <table>
                                        <tr>
                                            <td class="subheadings">Current remuneration<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_CRemuneration"]==null?"": ViewData["CV_CRemuneration"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td class="subheadings">
                                                <%= Html.DropDownList("CurrentCurrency", new SelectList(((DataTable)Session["currency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv CurrentCurrency", @style = "width:75px !important" })%>
                                            From
                                            <%= Html.TextBox("CurrentFromAmt", model.CurrentFromAmt, new { @class = "fieldQuick ", @style = "width:40px !important", onblur = "checkCurrentAmount(this)" })%>
                                            To
                                            <%= Html.TextBox("CurrentToAmt", model.CurrentToAmt, new { @class = "fieldQuick ", @style = "width:40px !important", onblur = "checkCurrentAmount(this)" })%>
                                                <%= Html.DropDownList("CurrentFrequency", new SelectList(((DataTable)Session["frequency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv CurrentFrequency", @style = "width:75px !important", onblur = "checkCurrentFrequency()" })%>
                                                <%= Html.Hidden("CurrentFreqDesc", "", new { @class = "CurrentFreqDesc" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">Expected remuneration<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_ERemuneration"]==null?"": ViewData["CV_ERemuneration"].ToString()  %>"
                                                onmouseover="showtip(this)" />
                                            </td>
                                            <td class="subheadings">
                                                <%= Html.DropDownList("ExpCurrency", new SelectList(((DataTable)Session["currency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv ExpCurrency", @style = "width:75px !important" })%>
                                            From
                                            <%= Html.TextBox("ExpFromAmt", model.ExpFromAmt, new { @class = "fieldQuick ", @style = "width:40px !important",onblur="checkExpAmount(this)" })%>
                                            To
                                            <%= Html.TextBox("ExpToAmt", model.ExpToAmt, new { @class = "fieldQuick ", @style = "width:40px !important", onblur = "checkExpAmount(this)" })%>
                                                <%= Html.DropDownList("ExpFrequency", new SelectList(((DataTable)Session["frequency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv ExpFrequency", @style = "width:75px !important", onblur = "checkExpFrequency()" })%>
                                                <%= Html.Hidden("ExpFreqDesc", "", new { @class = "ExpFreqDesc" })%>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </li>
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#">Attach CV <font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["CV_CVTip"]==null?"": ViewData["CV_CVTip"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <table width="433" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th align="left" class="subheadings_big1">
                                                <p>
                                                    <u>CV:</u> <font size="1">
                                                        <%= ViewData["cvmsg"].ToString() %></font><span class="mandatoryString"><font color="red">&nbsp;*</font></span>
                                                </p>
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="file" name="Attachresume" id="Attachresume" onchange="get_filename(this,1,'CV');" />
                                                <input type="button" name="removefile" value="remove" id="Button4" onclick="clearContents('Attachresume')" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <hr />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </li>
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#">Attach covering letter<img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["CV_CLTip"]==null?"": ViewData["CV_CLTip"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
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
                                                    <%= Html.TextArea("CoverLetter", new { @class = "Field CoverLetter", rows = 5 })%>
                                                    <div id="desCoverLettContent" style="margin-left: 20">
                                                        <font size="1">characters left: 2000</font><input type="hidden" value="2000" name="CoverLettContentRemLngth" />
                                                    </div>
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
                                                            <%= ViewData["clmsg"].ToString() %></font><span class="mandatoryString"><font color="red"></font></span>
                                                    </p>
                                                </th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <hr />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="formInput" type="file" name="CoverLetterOptional" id="CoverLetterOptional"
                                                        onchange="get_filename(this,2,'Cover Letter');" value="" />
                                                    <input type="button" name="removefile" value="remove" id="Button5" onclick="clearContents('CoverLetterOptional')" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </li>
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#">Attach photograph<img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["CV_PhotoTip"]==null?"": ViewData["CV_PhotoTip"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <p>
                                        <u>Photograph:</u> <font size="1">
                                            <%= ViewData["phmsg"].ToString() %></font><span class="mandatoryString"><font color="red"></font></span>
                                    </p>
                                    <input class="file" id="file1" name="file1" type='file' title="test #1" onchange="get_filename(this,6,'Image of Candidate');" />
                                    <div id="prev_file1">
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div>
                        <input type="submit" id="btnsubmit" value="Submit" class="btnsubmit" />&nbsp;&nbsp;<input
                            id="btnResetR" type="reset" value="Clear All" />
                        <div style="float: right">
                            <img src="../../Content/images/feedback_ime32.png" style="cursor: pointer" alt="Feedback"
                                onmouseover="showtip(this)" onclick="openfeedback()" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        function checkValid() {
            var valid = true;
            var valcontact = false;

            if ($('.CoverLetter').val().length > 2000) {
                alert("Cover letter exceeds maximum character length. Please reduce the number of characters below the maximum, or attach your Cover Letter as a separate file. Then try clicking Submit again.");
                valid = false;
            }
            if ($('.CurrentCurrency').val() != '') {
                if ($("#CurrentFrequency").val() == '-1') {
                    valid = false;
                    //                $("#CurrentFrequency").focus();
                    alert('Please select a frequency for Current Remuneration.');
                }
            }
            if ($('.ExpCurrency').val() != '') {
                if ($("#ExpFrequency").val() == '-1') {
                    //                $("#ExpFrequency").focus();
                    alert('Please select a frequency for Expected Remuneration.');
                    valid = false;
                }
            }
            $('.PTCV').each(function () {
                if ($(this).val() != '-1') {
                    if (valcontact == false) {
                        var tr = $(this).parent().parent().siblings()[0];
                        var tr1 = $(this).parent().parent().siblings()[2];
                        if ($(tr).find('input').val() == '' || $(tr1).find('input').val() == '') {
                            alert('In the Contact Details section, please select a Country Code and enter your contact number in the Number field.');
                            valcontact = true;
                            valid = false;
                        }
                    }
                }
                else {
                    if (valcontact == false) {
                        var pr = $(this).parent().parent().siblings()[0];
                        var pr1 = $(this).parent().parent().siblings()[2];
                        if ($(pr).find('input').val() != '' || $(pr1).find('input').val() != '') {
                            alert('In the Contact Details section, please select Phone Type in the Type field.');
                            valcontact = true;
                            valid = false;
                        }
                    }
                }
            });
            valcontact = false;

            if ($('#CurrentOccupation').val() != '') {
                if ($('#CurrentOccupationId').val() == '') {
                    $('#CurrentOccupation').val('');
                    alert('The Occupation field contains invalid data. Please make a selection from the list without editing the selection you make.');
                    $('#CurrentOccupation').focus();
                    valid = false;
                    return false;
                }
            }

            if ($('#CurrentIndustry').val() != '') {
                if ($('#CurrentIndustryId').val() == '') {
                    $('#CurrentIndustry').val('');
                    alert('The Industry field contains invalid data. Please make a selection from the list without editing the selection you make.');
                    $('#CurrentIndustry').focus();
                    valid = false;
                    return false;
                }
            }

            return valid;
        }

        function openfeedback() {
            var width = 525;
            var popUpWin;

            if (popUpWin != null && !popUpWin.closed) {
                popUpWin.close();
                popUpWin = null;
            }
            popUpWin = open('<%= Url.Action("Feedback", "Work")%>', "winName1111",
					  "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width=" + width + ",height=600,left=0,top=0");
            popUpWin.focus();
            return false;
        }
        $(document).ready(function () {
            $(".date1").datepicker({
                dateFormat: 'dd M yy', changeMonth: true,
                changeYear: true, yearRange: "-73", maxDate: '-1d'
            });

            var txt = $('.CurrentFrequency').find('option:selected').text();
            $('.CurrentFreqDesc').val(txt);

            var txt = $('.ExpFrequency').find('option:selected').text();
            $('.ExpFreqDesc').val(txt);

            $('.countrycode').keypress(function () {
                $('#hdfCC').val('');
            });

            $('.CurrentFrequency').change(function () {
                var txt = $(this).find('option:selected').text();
                $('.CurrentFreqDesc').val(txt);
            });

            $('.ExpFrequency').change(function () {
                var txt = $(this).find('option:selected').text();
                $('.ExpFreqDesc').val(txt);
            });
        });
        $(".btnsubmit").click(function () {
            $('.PTCV').each(function () {
                $(this).siblings('input').val($(this).find('option:selected').text());
            });
            var country = '';
            $(".NationSelect > option").each(function () {
                country = $(this).text() + "\n" + country;
            });
            $("#Countrylist").val(country);

            $(".NationSelect").find("option").attr("selected", true);
        });

        $("#btnResetR").click(function () {
            $(".IndustrySelectR1 > option").each(function () {
                $(this).remove();
            });
            $("#NationSelect > option").each(function () {
                $(this).remove();
            });

        });

        $("#btnIremoveR1").click(function () {
            $(".IndustrySelectR1 > option:selected").each(function () {
                $(this).remove();
            });

        });

        function countryAuto() {

            $('.countrycode').autocomplete(
        {
            source: '<%= Url.Action("SearchCountryCode", "Jobs")%>',
            minLength: 1,
            select: function (event, ui) {
                var code = ui.item.value;
                ui.item.value = code.substring(code.indexOf('(') + 1, code.indexOf(')'));
                $('#hdfCC').val('1');
            },
            change: function (event, ui) {
                if (ui.item) {
                    $('#hdfCC').val('');
                    return;
                }
                if ($('#hdfCC').val() == '') {
                    $(this).val('');
                    alert('The Country code field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }
                $('#hdfCC').val('');
            }
        });

            $('.countrycode').keypress(function () {
                $('#hdfCC').val('');
            });

        }
        $('.countrycode').autocomplete(
        {
            source: '<%= Url.Action("SearchCountryCode", "Jobs")%>',
            minLength: 1,
            select: function (event, ui) {
                var code = ui.item.value;
                ui.item.value = code.substring(code.indexOf('(') + 1, code.indexOf(')'));
                $('#hdfCC').val('1');
            },
            change: function (event, ui) {
                if (ui.item) {
                    $('#hdfCC').val('');
                    return;
                }
                if ($('#hdfCC').val() == '') {
                    $(this).val('');
                    alert('The Country code field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }
                $('#hdfCC').val('');
            }
        });

            $("#btnNRemove").click(function () {
                $(".NationSelect > option:selected").each(function () {
                    $(this).remove();
                });

            });

            $('.nationApply').keyup(function (e) {
                if (e.keyCode != 9) {
                    $('#NationId').val('');
                    if (e.which == 27) {
                        readyToClose = true;
                        $('#nation').autocomplete('close');
                    }
                }
            });
            $(".nationApply").keypress(function (e) {
                if (!e) e = window.event;
                if (e.keyCode == '27') {
                    readyToClose = true;
                    $('.NationSelect1').autocomplete('close');
                    return false;
                }
            });
            $('.nationApply').autocomplete(
            {
                source: function (request, response) {
                    $.ajax({
                        url: "/Jobs/SearchNation.shtml", dataType: "json",
                        type: "POST",
                        data: { term: request.term },
                        success: function (data) {
                            response($.map(data, function (item) {
                                return { label: item.Value, value: item.Key };
                            }))
                        }
                    });
                },
                minLength: 1,
                select: function (event, ui) {
                    sel = true;
                    readyToClose = false;
                    $("#divNation").show();
                    var position = $(".nationApply").offset();
                    $(".ui-autocomplete").css("top", position.top + 20);
                    var id = ui.item.value;
                    var code = $.trim(ui.item.label);
                    var exist = 0;
                    if (id == '') {
                        //alert('This location is already exist');
                        alert('You have already selected that option.');
                        exist = 1;
                        //                    this.value = txt;
                        return false;
                    }
                    $(".NationSelect option").each(function () {
                        c2 = $(this).val();
                        if (id == c2) {
                            alert('You have already selected ' + $(this).text());
                            exist = 1;
                            return false;
                        }
                    });
                    if (exist == 0) {
                        var lst = "<option selected='true' value='" + id + "'>" + code + "</option>";
                        $(".NationSelect").append(lst);
                    }
                    $('.nationApply').val('');
                    ui.item.value = '';
                },
                change: function (event, ui) {
                    if (ui.item) {
                        return;
                    }
                    $('.nationApply1').val('');

                }
            }).data("autocomplete").close = function (e) {
                if (readyToClose)
                    clearTimeout(this.closing), this.menu.element.is(":visible") && (this.menu.element.hide(), this.menu.deactivate(), this._trigger("close", e));
                else
                    return false;
            };

            $('.nationApply').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
                return $("<li></li>")
                 .data("item.autocomplete", item)
                 .append("<a>" + item.label + "</a>")
                 .appendTo(ul);
            };
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