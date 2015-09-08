<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<YG_MVC.Models.JobApplyModel>" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="YG_MVC.Models" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavWork';
        var currentSubNav = '#rightNavUploadResume';
    </script>
    <link href="../../Content/css/tooltip.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/tooltip/build.css" rel="stylesheet" type="text/css" />
    <link href="../../Scripts/tooltip/opentip.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/tooltip/build.js" type="text/javascript"></script>
    <script src="../../Scripts/tooltip/opentip-jquery-excanvas.min.js" type="text/javascript"></script>
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

            $('#CurrentFY').change(function () {
                $('#CurrentFM').val('');
                $('#CurrentFD').val('');
            });

            $('#CurrentFM').change(function () {
                if ($('#CurrentFY').val() == '') {
                    alert('Please select Year');
                    this.value = '';
                }
                if ($('#CurrentFY').val() == 'Present') {
                    alert('Not allowed to select Month if year is set to Present');
                    this.value = '';
                }
                $('#CurrentFD').val('');
            });
            $('#CurrentFD').change(function () {
                if ($('#CurrentFM').val() == '') {
                    alert('Please select Month');
                    this.value = '';
                }

            });

            $('#CurrentTY').change(function () {
                $('#CurrentTM').val('');
                $('#CurrentTD').val('');
            });

            $('#CurrentTM').change(function () {
                if ($('#CurrentTY').val() == '') {
                    alert('Please select Year');
                    this.value = '';
                    $('#CurrentTD').val('');
                }
                if ($('#CurrentTY').val() == 'Present') {
                    alert('Not allowed to select Month if year is set to Present');
                    this.value = '';
                }
                $('#CurrentTD').val('');

            });
            $('#CurrentTD').change(function () {
                if ($('#CurrentTM').val() == '') {
                    alert('Please select Month');
                    this.value = '';
                }
            });

        });

        function checkCriteria(check) {
            var valid = true;
            var valcontact = false;
            var empties = $('.required').filter(function () {
                hideProgress();
                return $.trim($(this).val()) == '';
            });
            if (empties.length) {
                alert("One or more of the Essential Criteria needs your comment please.");
                valid = false;
            }
            else {
                valid = true;
                if ($('.cl').val().length > 2000) {
                    alert("Cover letter exceeds maximum character length. Please reduce the number of characters below the maximum, or attach your Cover Letter as a separate file. Then try clicking Submit again.");
                    valid = false;
                }
                var len = $('.required').filter(function () {
                    return $(this).val().length > 500;
                });
                if (len.length) {
                    alert("One or more of the Essential Criteria exceeds maximum character length. Please reduce the number of characters then try submitting again.");
                    valid = false;
                }
                else {
                    var len = $('.desi').filter(function () {
                        return $(this).val().length > 500;
                    });
                    if (len.length) {
                        alert("One or more of the Desirable Criteria exceeds maximum character length. Please reduce the number of characters then try submitting again.");
                        valid = false;
                    }
                    //                    else
                    //                        valid = true;
                }
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
            $('.Phonetype').each(function () {

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
                    $('#CurrentCurrency').focus();
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
                    $('#ExpCurrency').focus();
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
                    //$("#CurrentFrequency").focus();
                    alert('Please select a frequency for Current Remuneration.');
                    return false;
                }
            }
        }

        function checkExpFrequency() {
            if ($('.ExpCurrency').val() != '') {
                if ($("#ExpFrequency").val() == '-1') {
                    //                $("#ExpFrequency").focus();
                    alert('Please select a frequency for Expected Remuneration.');
                    return false;
                }
            }
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#progress").hide();
            $(".date1").datepicker({
                dateFormat: 'dd M yy', changeMonth: true,
                changeYear: true, yearRange: "-73", maxDate: '-1d'

            });

            $(".Field").bind("paste", function (e) {
                return true;
            });

            $("#CurrentFromAmt").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            $("#CurrentToAmt").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            $("#ExpFromAmt").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            $("#ExpToAmt").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });

            $('.required').each(function () {
                textCounter(this, 'div' + this.name, 500, null);
            })

            $('.desi').each(function () {
                textCounter(this, 'divDesi' + this.name, 500, null);
            })

            var cl = document.getElementById('CoverLetter');
            textCounter(cl, 'desCoverLettContent', 2000, null);
        });

        function hideProgress() {
            $("#progress").hide();
        }
        function clearContents(ele) {
            var file = document.getElementById(ele);
            file.select();
            file.value = "";
            file.focus();

            if (ele == 'file1') {
                $('#prev_file1').html('');
            }
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

        function LettersWithSpaceOnly(evt) {
            evt = (evt) ? evt : event;
            var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
          ((evt.which) ? evt.which : 0));
            if (charCode > 32 && (charCode < 65 || charCode > 90) &&
          (charCode < 97 || charCode > 122)) {
                if (charCode == 45)
                    return true;
                return false;
            }
            return true;
        }

        function nospaces(t) {
            if (t.value.match(/\s/g)) {
                alert('Skype Names do not contain spaces');
                t.value = t.value.replace(/\s/g, '');
            }
        }

        function isNumber(e) {
            if (e.ctrlKey || e.metaKey || e.which == 91 || e.keyCode == 91 || e.which == 92 || e.keyCode == 92)
                return true;
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }
        }

        function isPhoneNumber(e) {
            if (e.ctrlKey || e.metaKey || e.which == 91 || e.keyCode == 91 || e.which == 92 || e.keyCode == 92)
                return true;
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                var charCode = (e.which) ? e.which : e.keyCode;
                if (charCode == 45 || charCode == 32)
                    return true;
                return false;
            }
        }
        var counter = 2;

        function removeMiddlename(id) {
            var div = $(id).parent().parent();
            if (div != null)
                div.html('');

        }

        function addControl(id) {
            var newTextBoxDiv = $(document.createElement('div')).attr("id", 'TextBoxDiv' + counter).attr("style", "clear:both");
            var ele = '<input type="text" name="MiddleName" id="MiddleName" value="" onkeypress="return LettersWithSpaceOnly(event);" >';
            ele += '<div style="float:right;margin-top: 7px; margin-right: 90px;"><img style="display: block !important;visibility: inherit !important;" id="Img5" class="phoneRemove" onclick="removeMiddlename(this)" src="../../Content/images/Cross - white on red - 12 pixel.png"  onmouseover="showtip(this)" alt="Remove selected"></div>';
            newTextBoxDiv.after().html(ele);
            newTextBoxDiv.appendTo("#divmiddle");
        }
        function removePhone(id) {
            var div = $(id).parent().parent().parent().parent().parent();
            if (div != null)
                div.html('');
        }
        function addPhoneControl(id) {
            var c1 = $(id).siblings('table')[0];
            var tbl = $(c1).clone();
            var newTextBoxDiv = $(document.createElement('div')).attr("id", 'phoneDiv' + counter);
            $(c1).clone().appendTo(newTextBoxDiv);
            newTextBoxDiv.find("input").val('');
            newTextBoxDiv.find("div").show();
            newTextBoxDiv.appendTo("#divPhone");
            countryAuto();
        }

        function removeEmployment(id) {
            var div = $(id).parent().parent().parent().parent().parent();
            if (div != null)
                div.html('');
        }

        function addEmploymentControl(id) {
            var c1 = $(id).siblings('table')[0];
            var newTextBoxDiv = $(document.createElement('div')).attr("id", 'employmentDiv' + counter);
            $(c1).clone().appendTo(newTextBoxDiv);
            newTextBoxDiv.find("input").val('');
            newTextBoxDiv.find("div").show();
            newTextBoxDiv.appendTo("#divEmployment");
            employmentHistory();
        }

        function phonetypechange(id) {
            var txt = $(id).find('option:selected').text();
            $(id).siblings('input').val(txt);

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
        jq9(function () {

            jq9("#applyJob").accordion({
                objID: "#acc1",
                el: ".h",
                head: "h4, h5",
                next: "div",
                initShow: "div.shown",
                standardExpansible: true
            });
            jq9("#applyJob").accordion({
                objID: "#acc2",
                obj: "div",
                wrapper: "div",
                el: ".h",
                head: "h4, h5",
                next: "div",
                initShow: "div.shown",
                standardExpansible: true
            });
            //* ---
            jq9("#applyJob .accordion").expandAll({
                trigger: ".h",
                ref: "h4.h",
                cllpsEl: "div.outer",
                speed: 200,
                oneSwitch: false,
                instantHide: true
            });
            //--- */
            /* -----------------------
            $("#side ul.accordion").expandAll({
            trigger: "li",
            ref: "",
            cllpsEl : "ul",
            state : '',
            oneSwitch : false
            });
            ------------------------ */
            jq9("html").removeClass("js");

            var i = 1;
            $('#applyJob .accordion').find('li').each(function () {
                var a = $(this).find('.h a');
                var div = $(this).find('.outer');
                if (i == 1) {
                    if ($("#hdfPersonalAccordion").val() == "1") {
                        a.removeAttr('class');
                        a.attr('class', 'trigger open');
                        div.removeAttr('style');
                        div.attr('style', 'display:block');
                    }
                }
                else if (i == 2) {
                    if ($("#hdfContactAccordion").val() == "1") {
                        a.removeAttr('class');
                        a.attr('class', 'trigger open');
                        div.removeAttr('style');
                        div.attr('style', 'display:block');
                    }
                }
                else if (i == 3) {
                    if ($("#hdfEmploymentAccordion").val() == '1') {
                        a.removeAttr('class');
                        a.attr('class', 'trigger open');
                        div.removeAttr('style');
                        div.attr('style', 'display:block');
                    }
                }
                i = i + 1;

            });
        });
    </script>
    <script src="../../Scripts/jquery.preimage.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

        $(document).ready(function () {

            $("#btnNRemove").click(function () {
                $(".NationSelect > option:selected").each(function () {
                    $(this).remove();
                });
            });

            $('.file').preimage();
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
        var j = 0;
        var e = 0;
        function setAccordionstate(val, ctl) {
            var hdf = $('#' + ctl);
            $('#hdfAccordion').val('1');
            hdf.val('1');
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form name="submitjob" id='submitjob' onsubmit="return checkCriteria(this);" action="/Work/ApplyJob.shtml"
        method="post" enctype="multipart/form-data">
        <div id="applyJob">
            <%
                var jobapply = (JobApplyModel)Model;
                var essIncr = 1;
                var desiIncr = 1;
            %>
            <% if (ViewData["msg"] != null)
               { %>
            <script type="text/javascript">            hideProgress(); alert('<%= ViewData["msg"].ToString() %>')</script>
            <%} %>
            <div id="progress" style="position: fixed; top: 0px; bottom: 0px; left: 0px; right: 0px; overflow: hidden; padding: 0; margin: 0; background-color: #F0F0F0; filter: alpha(opacity=50); opacity: 0.5; z-index: 100000;">
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
            <%=Html.ValidationSummary(false) %>
            <% if (ViewData["errmsg"] != null)
               { %>
            <div class="validation-summary-errors">
                <ul>
                    <li>
                        <%= ViewData["errmsg"].ToString() %></li>
                </ul>
            </div>
            <%} %>
            <div style="float: right; padding-top: 7px;">
                <input type="button" value="Show job details" onclick="openapplicationform()" />
                <%--<a href='#' onclick="openapplicationform()">Show job details</a>--%>
            </div>
            <span class="additionaltext"><span style="color: Red">* </span>Indicates mandatory input</span>
            <ul class="accordion" id="acc1">
                <li>
                    <input type="hidden" id="hdfPersonalAccordion" name="hdfPersonalAccordion" />
                    <%= Html.Hidden("hdfAccordion") %>
                    <h4 class="h">
                        <a class="trigger" href="#" onclick="setAccordionstate(1,'hdfPersonalAccordion')">Personal
                        Detail <font color="red">*</font>
                            <img src="../../Content/images/info 12 pixel.png"
                                alt="<%=ViewData["Job_Personal"]==null?"": ViewData["Job_Personal"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                    <div class="outer" style="display: none;">
                        <div class="inner">
                            <table width="433" cellpadding="0" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td class="subheadings">Email <font color="red">*</font>
                                            <img src="../../Content/images/info 12 pixel.png"
                                                alt="<%=ViewData["Job_EmailTip"]==null?"": ViewData["Job_EmailTip"].ToString()  %>" onmouseover="showtip(this)" />
                                        </td>
                                        <td class="body">
                                            <%= Html.TextBox("Email", jobapply.Email, new { @class = "Field", maxlength = "50" })%>
                                            <%= Html.DropDownList("Emailtype", new SelectList(((DataTable)Session["emailtype"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv", Style="width:70px" })%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings">Title<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                            alt="<%=ViewData["Job_TitleTip"]==null?"": ViewData["Job_TitleTip"].ToString()  %>" onmouseover="showtip(this)" />
                                        </td>
                                        <td>
                                            <%= Html.DropDownList("title",new SelectList(((DataTable)Session["title"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv" }) %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings" width="100">First Name <font color="red">*</font>
                                            <img src="../../Content/images/info 12 pixel.png"
                                                alt="<%=ViewData["Job_First"]==null?"": ViewData["Job_First"].ToString()  %>" onmouseover="showtip(this)" />
                                        </td>
                                        <td class="body">
                                            <%= Html.TextBox("FirstName", jobapply.FirstName, new { @class = "Field", maxlength = "50", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings">Middle Name/s<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_Middle"]==null?"": ViewData["Job_Middle"].ToString()  %>"
                                            onmouseover="showtip(this)" />
                                        </td>
                                        <td>
                                            <%if (jobapply.MiddleName == null)
                                              {%>
                                            <%= Html.TextBox("MiddleName", jobapply.MiddleName, new { @class = "Field", maxlength = "50", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                            <%}
                                              else
                                              {
                                                  foreach (string middle in jobapply.MiddleName)
                                                  {%>
                                            <%-- <%= Html.TextBox("MiddleName", middle, new { @class = "Field", maxlength = "50", onkeypress = "return LettersWithSpaceOnly(event);" })%>--%>
                                            <input type="text" id="middlename" name="middlename" value="<%= middle %>" onkeypress="return LettersWithSpaceOnly(event);" />
                                            <%}
                                              } %>
                                            <div id="divmiddle">
                                            </div>
                                            <input type="button" value="Add" id="btnMiddle" onclick="addControl(this)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings" style="width: 176px">Family Name / Surname <font color="red">*</font>
                                            <img src="../../Content/images/info 12 pixel.png"
                                                alt="<%=ViewData["Job_Surname"]==null?"": ViewData["Job_Surname"].ToString()  %>" onmouseover="showtip(this)" />
                                        </td>
                                        <td class="body">
                                            <%= Html.TextBox("LastName", jobapply.LastName, new { @class = "Field", maxlength = "50", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings">Commonly known as<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_Common"]==null?"": ViewData["Job_Common"].ToString()  %>"
                                            onmouseover="showtip(this)" />
                                        </td>
                                        <td>
                                            <%= Html.TextBox("NickName", jobapply.NickName, new { @class = "Field", maxlength = "25", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings" nowrap="nowrap">Birth date<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                            alt="<%=ViewData["Job_Birth"]==null?"": ViewData["Job_Birth"].ToString()  %>" onmouseover="showtip(this)" />
                                        </td>
                                        <td class="body">
                                            <%= Html.TextBox("BirthDate", jobapply.BirthDate, new { @class = "date1 Field", @readonly=true })%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings">Gender<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                            alt="<%=ViewData["Job_Gender"]==null?"": ViewData["Job_Gender"].ToString()  %>" onmouseover="showtip(this)" />
                                        </td>
                                        <td>
                                            <%= Html.DropDownList("gender", new SelectList(((DataTable)Session["gender"]).Rows as System.Collections.IEnumerable, "[0]", "[1]", Model.Gender),  new { @class = "fieldAdv" })%>
                                            <% if (Model.Gender != "")
                                               { %>
                                            <%=Html.Hidden("HG",Model.Gender) %>
                                            <script type="text/javascript" language="javascript">
                                                $('#gender').val($('#HG').val());
                                            </script>
                                            <%} %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings">Nationality<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                            alt="<%=ViewData["Job_Nationality"]==null?"": ViewData["Job_Nationality"].ToString()  %>"
                                            onmouseover="showtip(this)" />
                                        </td>
                                        <td>
                                            <div id="divNation" style="display: none">
                                                <%= Html.ListBox("NationSelect", new SelectList((jobapply.Nationality==null?new DataTable():jobapply.Nationality).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "5", @class = "fieldAlerts NationSelect" })%>
                                                <div style="float: right; margin-right: 8px; margin-top: 7px;">
                                                    <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                        onmouseover="showtip(this)" id="btnNRemove" style="display: block !important; visibility: inherit !important;" />
                                                </div>
                                            </div>
                                            <%if (jobapply.Nationality != null && jobapply.Nationality.Rows.Count > 0)
                                              {%>
                                            <script type="text/javascript" language="javascript">
                                                $('#divNation').show();
                                            </script>
                                            <%
                                              } %>
                                            <%= Html.TextBox("Nationality", "", new { @class = "nationApply Field" })%>
                                            <%= Html.Hidden("NationId")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings">Marital status<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_Marital"]==null?"": ViewData["Job_Marital"].ToString()  %>"
                                            onmouseover="showtip(this)" />
                                        </td>
                                        <td>
                                            <%= Html.DropDownList("marital",new SelectList(((DataTable)Session["marital"]).Rows as System.Collections.IEnumerable, "[1]", "[0]",Model.Marital), new { @class = "fieldAdv", @name="marital" }) %>
                                            <% if (Model.Marital != "")
                                               { %>
                                            <%=Html.Hidden("HM",Model.Marital) %>
                                            <script type="text/javascript" language="javascript">
                                                $('#marital').val($('#HM').val());
                                            </script>
                                            <%} %>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </li>
                <li>
                    <h4 class="h">
                        <a class="trigger" href="#">Contact details <font color="red">*</font>
                            <img src="../../Content/images/info 12 pixel.png"
                                alt="<%=ViewData["Job_Contact"]==null?"": ViewData["Job_Contact"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                    <div class="outer" style="display: none;">
                        <div class="inner">
                            <label class="subheadings" for="phone">
                                Phone<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["Job_PhoneTip"]==null?"": ViewData["Job_PhoneTip"].ToString()  %>" onmouseover="showtip(this)" /></label>
                            <input type="hidden" id="hdfCC" />
                            <br />
                            <% if (jobapply.PhoneList == null)
                               { %>
                            <table>
                                <tr>
                                    <td class="subheadings">Type
                                    </td>
                                    <td style="width: 185px">
                                        <%= Html.DropDownList("Phonetype", new SelectList(((DataTable)Session["phonetype"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv Phonetype", @onchange = "phonetypechange(this)" })%>
                                        <input type="hidden" id="PhonetypeDesc" name="PhonetypeDesc" />
                                        <div style="float: right; margin-right: 8px; margin-top: 7px; display: none">
                                            <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                onmouseover="showtip(this)" onclick="removePhone(this)" class="phoneRemove" id="phoneRemove"
                                                style="display: block !important; visibility: inherit !important;" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Country code
                                    </td>
                                    <td>
                                        <%=Html.TextBox("Countrycode", "", new { @maxlength = "10", @class = "countrycode Field" })%>
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
                                   foreach (PhoneData phone in jobapply.PhoneList)
                                   { %>
                            <table>
                                <tr>
                                    <td class="subheadings">Type
                                    </td>
                                    <td style="width: 185px">
                                        <%= Html.DropDownListFor(m => m.Phonetype, new SelectList(((DataTable)Session["phonetype"]).Rows as System.Collections.IEnumerable, "[0]", "[1]", phone.Phonetype), new { @class = "fieldAdv Phonetype", id = "Phonetype", name = "Phonetype", @onchange = "phonetypechange(this)" })%>
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
                                                onmouseover="showtip(this)" onclick="removePhone(this)" class="phoneRemove" id="Img2"
                                                style="display: block !important; visibility: inherit !important;" />
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
                            <div id="divPhone" style="clear: both">
                            </div>
                            <input type="button" value="Add" id="Button2" onclick="addPhoneControl(this)" />
                            <br />
                            <table>
                                <tr>
                                    <td class="subheadings">Skype Name<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_SkypeTip"]==null?"": ViewData["Job_SkypeTip"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%=Html.TextBox("Skype", jobapply.Skype, new { @class = "Field", onkeypress = "return nospaces(this);" })%>
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
                        <a class="trigger" href="#">Criteria <font color="red">*</font>
                            <img src="../../Content/images/info 12 pixel.png"
                                alt="<%=ViewData["Job_Criteria"]==null?"": ViewData["Job_Criteria"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                    <div class="outer" style="display: none;">
                        <div class="inner">
                            <% if (jobapply.EssentialCriteriaList != null && jobapply.EssentialCriteriaList.Rows.Count > 0)
                               { %>
                            <table width="433" cellpadding="0" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <th class="subheadings_big1" align="left" id="essCritId">Essential criteria - your comments <font color="red">*</font>
                                        </th>
                                    </tr>
                                    <% foreach (DataRow dr in jobapply.EssentialCriteriaList.Rows)
                                       { %>
                                    <tr>
                                        <td class="subheadings" align="left">
                                            <p style="margin-left: 20;">
                                                <span class="essCritCounter">
                                                    <%= essIncr++ %>) </span>
                                                <%= dr["description"].ToString() %><font color="red">*</font>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="body" align="left">
                                            <%= Html.TextArea(dr["EssentialCriteriaId"].ToString(), dr["Answer"].ToString(), new { @class = "required Field", rows = 2 })%>
                                            <div id='div<%= dr["EssentialCriteriaId"].ToString() %>' style="margin-left: 20">
                                                <font size="1">characters left: 500</font>
                                            </div>
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
                                        <th class="subheadings_big1" align="left" id="Th1">Desirable criteria your comments<font color="red">*</font>
                                        </th>
                                    </tr>
                                    <% foreach (DataRow dr in jobapply.DesirableCriteriaList.Rows)
                                       { %>
                                    <tr>
                                        <td class="subheadings">
                                            <p style="margin-left: 20;" align="left">
                                                <span class="essCritCounter">
                                                    <%= desiIncr++ %>) </span>
                                                <%= dr["description"].ToString() %>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="body" align="left">
                                            <%= Html.TextArea(dr["DesirableCriteriaId"].ToString(),dr["Answer"].ToString(), new { @class = "desi Field", rows = 2 })%>
                                            <div id='divDesi<%= dr["DesirableCriteriaId"].ToString() %>' style="margin-left: 20">
                                                <font size="1">characters left: 500</font>
                                            </div>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            <% }%>
                        </div>
                    </div>
                </li>
                <li>
                    <h4 class="h">
                        <a class="trigger" href="#">Current or most recent employment <font color="red">*</font>
                            <img
                                src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_Current"]==null?"": ViewData["Job_Current"].ToString()  %>"
                                onmouseover="showtip(this)" /></a></h4>
                    <div class="outer" style="display: none;">
                        <div class="inner">
                            <table>
                                <tr>
                                    <td class="subheadings">From<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_CFrom"]==null?"": ViewData["Job_CFrom"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.DropDownList("CurrentFY", new SelectList(((ListItemCollection)Session["year"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important",onchange="yearvalidation(this)" })%>
                                        <%= Html.DropDownList("CurrentFM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "yearvalidation(this)" })%>
                                        <%= Html.DropDownList("CurrentFD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "yearvalidation(this)" })%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">To<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_CTo"]==null?"": ViewData["Job_CTo"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.DropDownList("CurrentTY", new SelectList(((ListItemCollection)Session["Toyear"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "yearvalidation(this)" })%>
                                        <%= Html.DropDownList("CurrentTM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "yearvalidation(this)" })%>
                                        <%= Html.DropDownList("CurrentTD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "yearvalidation(this)" })%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Your current employer name<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_CEmployer"]==null?"": ViewData["Job_CEmployer"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.TextBox("Currentemployer",jobapply.CurrentEmployer, new { @class = "fieldQuick " })%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Your current employment location<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                        alt="<%=ViewData["Job_CLocation"]==null?"": ViewData["Job_CLocation"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.TextBox("Currentemplocation", jobapply.Currentemplocation, new { @class = "fieldQuick " })%>
                                        <%= Html.Hidden("CurrentemplocationId",jobapply.CurrentemplocationId)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Your occupational category<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                        alt="<%=ViewData["Job_COccupation"]==null?"": ViewData["Job_COccupation"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.TextBox("CurrentOccupation", jobapply.CurrentOccupation, new { @class = "fieldQuick " })%>
                                        <%= Html.Hidden("CurrentOccupationId",jobapply.CurrentOccupationId) %>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Your industry category<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                        alt="<%=ViewData["Job_CIndustry"]==null?"": ViewData["Job_CIndustry"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.TextBox("CurrentIndustry", jobapply.CurrentIndustry, new { @class = "fieldQuick " })%>
                                        <%= Html.Hidden("CurrentIndustryId",jobapply.CurrentIndustryId) %>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </li>
                <li>
                    <h4 class="h">
                        <a class="trigger" href="#">Employment history<img src="../../Content/images/info 12 pixel.png"
                            alt="<%=ViewData["Job_EmpHistory"]==null?"": ViewData["Job_EmpHistory"].ToString()  %>"
                            onmouseover="showtip(this)" /></a></h4>
                    <div class="outer" style="display: none;">
                        <div class="inner">
                            <% if (jobapply.EmploymentList == null)
                               { %>
                            <table>
                                <tr>
                                    <td class="subheadings">From<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_EFrom"]==null?"": ViewData["Job_EFrom"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.DropDownList("EmpFY", new SelectList(((ListItemCollection)Session["year"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:61px !important", onchange = "yearchange(this); historyyearvalidation(this)" })%>
                                        <%= Html.DropDownList("EmpFM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "fmonthchange(this); historyyearvalidation(this)" })%>
                                        <%= Html.DropDownList("EmpFD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "fdaychange(this); historyyearvalidation(this)" })%>
                                        <div style="float: right; margin-right: 8px; margin-top: 7px; display: none">
                                            <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                onmouseover="showtip(this)" onclick="removeEmployment(this)" class="employmentRemove"
                                                id="employmentRemove" style="display: block !important; visibility: inherit !important;" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">To<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_ETo"]==null?"": ViewData["Job_ETo"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.DropDownList("EmpTY", new SelectList(((ListItemCollection)Session["Toyear"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:61px !important", onchange = "yearchange(this); historyyearvalidation(this)" })%>
                                        <%= Html.DropDownList("EmpTM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "tmonthchange(this); historyyearvalidation(this)" })%>
                                        <%= Html.DropDownList("EmpTD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv", @style = "width:55px !important", onchange = "tdaychange(this); historyyearvalidation(this)" })%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Employer name<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_EEmployer"]==null?"": ViewData["Job_EEmployer"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.TextBox("Empemployer", string.Empty, new { @class = "fieldQuick Empemployer" })%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Employment location<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_ELocation"]==null?"": ViewData["Job_ELocation"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.TextBox("Emplocation", string.Empty, new { @class = "fieldQuick Emplocation" })%>
                                        <%= Html.Hidden("EmplocationId")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Occupational category<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_EOccupation"]==null?"": ViewData["Job_EOccupation"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.TextBox("EmpOccupation", string.Empty, new { @class = "fieldQuick EmpOccupation" })%>
                                        <%= Html.Hidden("EmpOccupationId")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Industry category<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_EIndustry"]==null?"": ViewData["Job_EIndustry"].ToString()  %>"
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
                                   foreach (Employment emp in jobapply.EmploymentList)
                                   {%>
                            <table>
                                <tr>
                                    <td class="subheadings">From<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_EFrom"]==null?"": ViewData["Job_EFrom"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.DropDownListFor(m => m.EmpFY, new SelectList(((ListItemCollection)Session["year"]) as System.Collections.IEnumerable, "Text", "Text", emp.FromYear), new { @class = "fieldAdv", id = "EmpFY", name = "EmpFY", @style = "width:61px !important", onchange = "yearchange(this) historyyearvalidation(this)" })%>
                                        <%=Html.Hidden("FY"+i,emp.FromYear) %>
                                        <script type="text/javascript" language="javascript">
                                            $('#FY' + e).siblings('select')[0].value = $('#FY' + e).val();
                                        </script>
                                        <%= Html.DropDownListFor(m => m.EmpFM, new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text", emp.FromMonth), new { @class = "fieldAdv", id = "EmpFM", name = "EmpFM", @style = "width:55px !important", onchange = "fmonthchange(this) historyyearvalidation(this)" })%>
                                        <%=Html.Hidden("FM"+i,emp.FromMonth) %>
                                        <script type="text/javascript" language="javascript">
                                            $('#FM' + e).siblings('select')[1].value = $('#FM' + e).val();
                                        </script>
                                        <%= Html.DropDownListFor(m => m.EmpFD, new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text", emp.FromDay), new { @class = "fieldAdv", id = "EmpFD", name = "EmpFD", @style = "width:55px !important", onchange = "fdaychange(this); historyyearvalidation(this)" })%>
                                        <%=Html.Hidden("FD"+i,emp.FromDay) %>
                                        <script type="text/javascript" language="javascript">

                                            $('#FD' + e).siblings('select')[2].value = $('#FD' + e).val();
                                        </script>
                                        <%if (i == 0)
                                          {%>
                                        <div style="float: right; margin-right: 8px; margin-top: 7px; display: none">
                                            <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                onmouseover="showtip(this)" onclick="removeEmployment(this)" class="employmentRemove"
                                                id="employmentRemove" style="display: block !important; visibility: inherit !important;" />
                                        </div>
                                        <%
                                          }
                                          else
                                          {%>
                                        <div style="float: right; margin-right: 8px; margin-top: 7px;">
                                            <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                onmouseover="showtip(this)" onclick="removeEmployment(this)" class="employmentRemove"
                                                id="Img1" style="display: block !important; visibility: inherit !important;" />
                                        </div>
                                        <%} %>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">To<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_ETo"]==null?"": ViewData["Job_ETo"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%= Html.DropDownListFor(m => m.EmpTY, new SelectList(((ListItemCollection)Session["Toyear"]) as System.Collections.IEnumerable, "Text", "Text", emp.ToYear), new { @class = "fieldAdv", id = "EmpTY", name = "EmpTY", @style = "width:61px !important", onchange = "yearchange(this); historyyearvalidation(this)" })%>
                                        <%=Html.Hidden("TY"+i,emp.ToYear) %>
                                        <script type="text/javascript" language="javascript">
                                            $('#TY' + e).siblings('select')[0].value = $('#TY' + e).val();
                                        </script>
                                        <%= Html.DropDownListFor(m => m.EmpTM, new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text", emp.ToMonth), new { @class = "fieldAdv", id = "EmpTM", name = "EmpTM", @style = "width:55px !important", onchange = "tmonthchange(this); historyyearvalidation(this)" })%>
                                        <%=Html.Hidden("TM"+i,emp.ToMonth) %>
                                        <script type="text/javascript" language="javascript">
                                            $('#TM' + e).siblings('select')[1].value = $('#TM' + e).val();
                                        </script>
                                        <%= Html.DropDownListFor(m => m.EmpTD, new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text", emp.ToDay), new { @class = "fieldAdv", id = "EmpTD", name = "EmpTD", @style = "width:55px !important", onchange = "tdaychange(this); historyyearvalidation(this)" })%>
                                        <%=Html.Hidden("TD"+i,emp.ToDay) %>
                                        <script type="text/javascript" language="javascript">
                                            $('#TD' + e).siblings('select')[2].value = $('#TD' + e).val();
                                            e = e + 1;
                                        </script>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Employer name<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_EEmployer"]==null?"": ViewData["Job_EEmployer"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td>
                                        <%-- <%= Html.TextBox("Empemployer", emp.Employername, new { @class = "fieldQuick Empemployer" })%>--%>
                                        <input type="text" id="Empemployer" name="Empemployer" class="fieldQuick Empemployer"
                                            value="<%= emp.Employername %>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Employment location<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_ELocation"]==null?"": ViewData["Job_ELocation"].ToString()  %>"
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
                                    <td class="subheadings">Occupational category<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_EOccupation"]==null?"": ViewData["Job_EOccupation"].ToString()  %>"
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
                                    <td class="subheadings">Industry category<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_EIndustry"]==null?"": ViewData["Job_EIndustry"].ToString()  %>"
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
                            <div id="divEmployment">
                            </div>
                            <input type="button" value="Add" id="Button3" onclick="addEmploymentControl(this)" />
                        </div>
                    </div>
                </li>
                <li>
                    <h4 class="h">
                        <a class="trigger" href="#">Remuneration<img src="../../Content/images/info 12 pixel.png"
                            alt="<%=ViewData["Job_Remuneration"]==null?"": ViewData["Job_Remuneration"].ToString()  %>"
                            onmouseover="showtip(this)" /></a></h4>
                    <div class="outer" style="display: none;">
                        <div class="inner">
                            <table>
                                <tr>
                                    <td class="subheadings">Current remuneration<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_CRemuneration"]==null?"": ViewData["Job_CRemuneration"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td class="subheadings">
                                        <%= Html.DropDownList("CurrentCurrency", new SelectList(((DataTable)Session["currency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]", jobapply.CurrentCurrency), new { @class = "fieldAdv CurrentCurrency", @style = "width:80px !important" })%>
                                    From
                                    <%= Html.TextBox("CurrentFromAmt", jobapply.CurrentFromAmt, new { @class = "fieldQuick ", @style = "width:40px !important", onblur = "checkCurrentAmount(this)" })%>
                                    To
                                    <%= Html.TextBox("CurrentToAmt", jobapply.CurrentToAmt, new { @class = "fieldQuick ", @style = "width:40px !important", onblur = "checkCurrentAmount(this)" })%>
                                        <%= Html.DropDownList("CurrentFrequency", new SelectList(((DataTable)Session["frequency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]", jobapply.CurrentFrequency), new { @class = "fieldAdv", @style = "width:75px !important", onblur="checkCurrentFrequency()" })%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="subheadings">Expected remuneration<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Job_ERemuneration"]==null?"": ViewData["Job_ERemuneration"].ToString()  %>"
                                        onmouseover="showtip(this)" />
                                    </td>
                                    <td class="subheadings">
                                        <%= Html.DropDownList("ExpCurrency", new SelectList(((DataTable)Session["currency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]", jobapply.ExpFromAmt), new { @class = "fieldAdv ExpCurrency", @style = "width:80px !important" })%>
                                    From
                                    <%= Html.TextBox("ExpFromAmt", jobapply.ExpFromAmt, new { @class = "fieldQuick ", @style = "width:40px !important", onblur = "checkExpAmount(this)" })%>
                                    To
                                    <%= Html.TextBox("ExpToAmt", jobapply.ExpToAmt, new { @class = "fieldQuick ", @style = "width:40px !important", onblur = "checkExpAmount(this)" })%>
                                        <%= Html.DropDownList("ExpFrequency", new SelectList(((DataTable)Session["frequency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]", jobapply.ExpToAmt), new { @class = "fieldAdv", @style = "width:75px !important", onblur = "checkExpFrequency()" })%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </li>
                <li>
                    <h4 class="h">
                        <a class="trigger" href="#">Attach CV <font color="red">*</font>
                            <img src="../../Content/images/info 12 pixel.png"
                                alt="<%=ViewData["Job_CVTip"]==null?"": ViewData["Job_CVTip"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
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
                            </table>
                        </div>
                    </div>
                </li>
                <li>
                    <h4 class="h">
                        <a class="trigger" href="#">Attach Covering letter<img src="../../Content/images/info 12 pixel.png"
                            alt="<%=ViewData["Job_CLTip"]==null?"": ViewData["Job_CLTip"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
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
                                            <%= Html.TextArea("CoverLetter", new { @class = "Field cl", rows = 5 })%>
                                            <div id="desCoverLettContent" style="margin-left: 20">
                                                <font size="1">characters left: 2000</font>
                                                <input type="hidden" value="2000" name="CoverLettContentRemLngth" />
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
                                            <input class="formInput" type="file" name="coverLetterOptional" id="coverLetterOptional"
                                                onchange="get_filename(this,2,'Cover Letter');" value="" />
                                            <input type="button" name="removefile" value="remove" id="deletefie" onclick="clearContents('coverLetterOptional')" />
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
                            alt="<%=ViewData["Job_PhotoTip"]==null?"": ViewData["Job_PhotoTip"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
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
            <script type="text/javascript">
                function openapplicationform() {
                    var width = 525;
                    var popUpWin;

                    if (popUpWin != null && !popUpWin.closed) {
                        popUpWin.close();
                        popUpWin = null;
                    }
                    popUpWin = open('<%= Url.Action("JobDetail", "Jobs", new { id = jobapply.ReferenceNo })%>', "winName1111",
					  "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,width=" + width + ",height=600,left=0,top=0");
                    popUpWin.focus();
                }
            </script>
            <table width="433" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr>
                        <td>
                            <img width="1" height="20" src="../../Content/images/clear.gif" />
                        </td>
                    </tr>
                    <tr>
                        <th class="subheadings">
                            <div>
                                <div style="float: left">
                                    <input type="submit" value=" Submit " id="applyButton" class="form_apply" />&nbsp;&nbsp;
                                </div>
                                <div style="float: left">
                                    <input type="submit" value=" Save for Later " name="savelater" onclick="savelaterset()"
                                        class="cancel" />&nbsp;&nbsp;
                                </div>
                                <div style="float: left">
                                    <img src="../../Content/images/info 12 pixel.png" tag="Click 'Save for Later' to avoid losing your input due to loss of internet connection, or if you'd like to finish the application later. We will send an email to you containing a link. You can then click on the link to continue your application. The link will remain valid until you complete the application, or for 14 days, whichever is the sooner."
                                        onmouseover="showTagtip(this)" />&nbsp;&nbsp;
                                </div>
                                <input type="hidden" id="hdfSavelater" name="hdfSavelater" />
                                <%--<a href='#' onclick="openapplicationform()">Show job details</a>--%>
                                <input type="button" value="Show job details" onclick="openapplicationform()" />
                                <div style="float: right">
                                    <img src="../../Content/images/feedback_ime32.png" style="cursor: pointer" alt="Feedback"
                                        onmouseover="showtip(this)" onclick="openfeedback()" />
                                </div>
                            </div>
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
        </div>
    </form>
    <script type="text/javascript" language="javascript">
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
        function savelaterset() {
            $('#hdfSavelater').val('1');
            $("#NationSelect").find("option").attr("selected", true);
        }

        $(function () {

            $('.countrycode').keypress(function () {
                $('#hdfCC').val('');
            });

            $("#applyButton").click(function () {
                //                if ($("#CurrentCurrency").val() != '') {
                //                    if ($("#").val() == '') {
                //                        alert('Please select Current remuneration frequency');
                //                    }
                //                }
                $("#progress").show();
                $("#NationSelect").find("option").attr("selected", true);
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
                    alert('You have already selected that option.')
                    exist = 1;
                    //                    this.value = txt;
                    return false;
                }
                $("#NationSelect option").each(function () {
                    c2 = $(this).val();
                    if (id == c2) {
                        alert('You have already selected ' + $(this).text());
                        exist = 1;
                        return false;
                    }
                });
                if (exist == 0) {
                    var lst = "<option selected='true' value='" + id + "'>" + code + "</option>";
                    $("#NationSelect").append(lst);
                }
                $('.nationApply').val('');
                ui.item.value = '';
            },
            change: function (event, ui) {
                if (ui.item) {
                    return;
                }
                $('.nationApply').val('');

            }
        }).data("autocomplete").close = function (e) {
            if (readyToClose)
                clearTimeout(this.closing), this.menu.element.is(":visible") && (this.menu.element.hide(), this.menu.deactivate(), this._trigger("close", e));
            else
                return false;
        };

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

            $('#Currentemployer').autocomplete(
            {
                source: function (request, response) {
                    $.ajax({
                        url: "/Jobs/SearchEmployer.shtml", dataType: "json",
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
                    var id = ui.item.value;
                    var code = $.trim(ui.item.label);
                    ui.item.value = code;
                },
                change: function (event, ui) {
                    if (ui.item) {
                        return;
                    }
                    $('.nationApply').val('');
                }
            });

            $('#Currentemplocation').keyup(function (e) {
                if (e.keyCode != 9) {
                    if (e.keyCode != 13) {
                        $('#CurrentemplocationId').val('');
                    }
                    if (e.which == 27) {

                    }
                }
            });
            $("#Currentemplocation").keypress(function (e) {
                if (!e) e = window.event;
                if (e.keyCode == '27') {

                    return false;
                }
            });

            $('#Currentemplocation').autocomplete(
            {
                source: function (request, response) {
                    $.ajax({
                        url: "/Jobs/SearchLocationWithoutAny.shtml", dataType: "json",
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
                    var code = $.trim($(ui.item.label).text());
                    var id = ui.item.value
                    code = code.replace(">", "").replace(">", "").replace(">", "").replace(">", "");
                    ui.item.value = $.trim(code);
                    $('#CurrentemplocationId').val(id);
                    $('#Currentemplocation').val(code);
                },
                change: function (event, ui) {
                    if (ui.item) {
                        return;
                    }
                    //                if ($('#CurrentemplocationId').val() == '') {
                    //                    $('#Currentemplocation').val('');
                    //                    alert('The Location field contains invalid data. Please make a selection from the list without editing the selection you make.');
                    //                }
                }
            });

            $('#Currentemplocation').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
                return $("<li></li>")
                 .data("item.autocomplete", item)
                 .append("<a>" + item.label + "</a>")
                 .appendTo(ul);
            };

            $('#CurrentOccupation').keyup(function (e) {
                if (e.keyCode != 9) {
                    if (e.keyCode != 13) {
                        $('#CurrentOccupationId').val('');
                    }

                    if (e.which == 27) {
                        //                    readyToClose = true;
                        //                    $('.Occupation1').autocomplete('close');
                    }
                }
            });
            $("#CurrentOccupation").keypress(function (e) {
                if (!e) e = window.event;
                if (e.keyCode == '27') {
                    //  readyToClose = true;
                    //                $('.Occupation1').autocomplete('close');
                    return false;
                }
            });

            $('#CurrentOccupation').autocomplete(
            {
                source: function (request, response) {
                    $.ajax({
                        url: "/Jobs/SearchOccupation.shtml", dataType: "json",
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
                    var txt = $(this).val();
                    var code = ui.item.label;
                    var cls;
                    cls = $.trim(code.split(' ')[3]);
                    if (cls != '4') {
                        alert('Please select an option beginning with Tier 4.');
                        $(this).val('');
                        $('#CurrentOccupation').val(txt);
                        return false;
                    }
                    else {
                        $('#CurrentOccupationId').val(ui.item.value);
                        if (code != "- Any -") {
                            code = $.trim($(code).text());
                            ui.item.value = code;
                        }
                    }
                },
                change: function (event, ui) {
                    if (ui.item) {
                        return;
                    }
                    if ($('#CurrentOccupationId').val() == '') {
                        $('#CurrentOccupation').val('');
                        alert('The Occupation field contains invalid data. Please make a selection from the list without editing the selection you make.');
                    }
                }
            });
            $('#CurrentOccupation').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
                return $("<li></li>")
                 .data("item.autocomplete", item)
                 .append("<a>" + item.label + "</a>")
                 .appendTo(ul);
            };

            $('#CurrentIndustry').keyup(function (e) {
                if (e.keyCode != 9) {
                    if (e.keyCode != 13) {
                        $('#CurrentIndustryId').val('');
                    }
                    if (e.which == 27) {
                        //                    readyToClose = true;
                        //                    $('.Occupation1').autocomplete('close');
                    }
                }
            });
            $("#CurrentIndustry").keypress(function (e) {
                if (!e) e = window.event;
                if (e.keyCode == '27') {
                    //  readyToClose = true;
                    //                $('.Occupation1').autocomplete('close');
                    return false;
                }
            });

            $('#CurrentIndustry').autocomplete(
            {
                source: function (request, response) {
                    $.ajax({
                        url: "/Jobs/SearchIndustry.shtml", dataType: "json",
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
                    var txt = $(this).val();
                    var code = ui.item.label;
                    var id = ui.item.value.split(' ')[0];
                    var cls;
                    cls = $.trim(code.split(' ')[3]);
                    if (cls != '4') {
                        alert('Please select an option beginning with Tier 4.');
                        $(this).val('');
                        $('#CurrentIndustry').val('');
                        return false;
                    }
                    else {
                        $('#CurrentIndustryId').val(id);
                        if (code != "- Any -") {
                            code = $.trim($(code).text());
                            ui.item.value = code;
                        }
                    }
                },
                change: function (event, ui) {
                    if (ui.item) {
                        return;
                    }
                    if ($('#CurrentIndustryId').val() == '') {
                        $('#CurrentIndustry').val('');
                        alert('The Industry field contains invalid data. Please make a selection from the list without editing the selection you make.');
                    }
                }
            });
            $('#CurrentIndustry').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
                return $("<li></li>")
                 .data("item.autocomplete", item)
                 .append("<a>" + item.label + "</a>")
                 .appendTo(ul);
            };
    </script>
    <script type="text/javascript" language="javascript">
        $(function () {
            employmentHistory();
        });
        function employmentHistory() {
            $["ui"]["autocomplete"].prototype["_renderItem"] = function (ul, item) {
                return $("<li></li>").data("item.autocomplete", item).append($("<a></a>").html(item.label)).appendTo(ul);
            };
            $('.Empemployer').autocomplete(
        {
            source: function (request, response) {
                $.ajax({
                    url: "/Jobs/SearchEmployer.shtml", dataType: "json",
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
                var id = ui.item.value;
                var code = $.trim(ui.item.label);
                ui.item.value = code;
            },
            change: function (event, ui) {
                if (ui.item) {
                    return;
                }

            }
        });

            $('.Emplocation').keyup(function (e) {
                if (e.keyCode != 9) {
                    if (e.keyCode != 13) {
                        //$('#EmplocationId').val('');
                        $(this).siblings().val('');
                    }
                    if (e.which == 27) {

                    }
                }
            });
            $(".Emplocation").keypress(function (e) {
                if (!e) e = window.event;
                if (e.keyCode == '27') {

                    return false;
                }
            });

            $('.Emplocation').autocomplete(
        {
            source: function (request, response) {
                $.ajax({
                    url: "/Jobs/SearchLocationWithoutAny.shtml", dataType: "json",
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
                var code = $.trim($(ui.item.label).text());
                var id = ui.item.value;
                code = code.replace(">", "").replace(">", "").replace(">", "").replace(">", "");
                ui.item.value = $.trim(code);
                // $('#EmplocationId').val(id);
                $(this).siblings().val(id);

            },
            change: function (event, ui) {
                if (ui.item) {
                    return;
                }
                //                if ($('#EmplocationId').val() == '') {
                //                    $('.Emplocation').val('');
                //                    alert('The Location field contains invalid data. Please make a selection from the list without editing the selection you make.');
                //                }
            }
        }).data("autocomplete")._renderItem = function (ul, item) {
            return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
        };

            $('.EmpOccupation').keyup(function (e) {
                if (e.keyCode != 9) {
                    if (e.keyCode != 13) {
                        // $('#EmpOccupationId').val('');
                        $(this).siblings().val('');
                    }
                    if (e.which == 27) {
                        //                    readyToClose = true;
                        //                    $('.Occupation1').autocomplete('close');
                    }
                }
            });
            $(".EmpOccupation").keypress(function (e) {
                if (!e) e = window.event;
                if (e.keyCode == '27') {
                    //  readyToClose = true;
                    //                $('.Occupation1').autocomplete('close');
                    return false;
                }
            });

            $('.EmpOccupation').autocomplete(
        {
            source: function (request, response) {
                $.ajax({
                    url: "/Jobs/SearchOccupation.shtml", dataType: "json",
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
                var txt = $(this).val();
                var code = ui.item.label;
                var cls;
                cls = $.trim(code.split(' ')[3]);
                if (cls != '4') {
                    alert('Please select an option beginning with Tier 4.');
                    $(this).val('');
                    //$('.EmpOccupation').val(txt);
                    return false;
                }
                else {
                    //$('#EmpOccupationId').val(ui.item.value);
                    $(this).siblings().val(ui.item.value);

                    if (code != "- Any -") {
                        code = $.trim($(code).text());
                        ui.item.value = code;
                    }
                }
            },
            change: function (event, ui) {
                if (ui.item) {
                    return;
                }
                //if ($('#EmpOccupationId').val() == '')
                if ($(this).siblings().val() == '') {
                    $('.EmpOccupation').val('');
                    alert('The Occupation field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }
            }
        }).data("autocomplete")._renderItem = function (ul, item) {
            return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
        };

            $('.EmpIndustry').keyup(function (e) {
                if (e.keyCode != 9) {
                    if (e.keyCode != 13) {
                        //$('#EmpIndustryId').val('');
                        $(this).siblings().val('');
                    }
                    if (e.which == 27) {
                        //                    readyToClose = true;
                        //                    $('.Occupation1').autocomplete('close');
                    }
                }
            });
            $(".EmpIndustry").keypress(function (e) {
                if (!e) e = window.event;
                if (e.keyCode == '27') {
                    //  readyToClose = true;
                    //                $('.Occupation1').autocomplete('close');
                    return false;
                }
            });

            $('.EmpIndustry').autocomplete(
        {
            source: function (request, response) {
                $.ajax({
                    url: "/Jobs/SearchIndustry.shtml", dataType: "json",
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
                var txt = $(this).val();
                var code = ui.item.label;
                var id = ui.item.value.split(' ')[0];
                var cls;
                cls = $.trim(code.split(' ')[3]);
                if (cls != '4') {
                    alert('Please select an option beginning with Tier 4.');
                    $(this).val('');
                    // $('.EmpIndustry').val(txt);
                    return false;
                }
                else {
                    $(this).siblings().val(id);
                    //$('.EmpIndustryId').val(id);
                    if (code != "- Any -") {
                        code = $.trim($(code).text());
                        ui.item.value = code;
                    }
                }
            },
            change: function (event, ui) {
                if (ui.item) {
                    return;
                }
                if ($(this).siblings().val() == '') {
                    $(this).val('');
                    alert('The Industry field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }
            }
        }).data("autocomplete")._renderItem = function (ul, item) {
            return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
        };
        }
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