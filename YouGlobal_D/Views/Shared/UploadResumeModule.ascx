<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="YG_MVC.Models" %>
<script type="text/javascript">
    $(document).ready(function () {
        $('.CoverLetter1').keyup(function () {
            textCounter(this, 'desCoverLettContent1', 2000, null);
        })
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

        var txt = $('.CurrentFrequency1').find('option:selected').text();
        $('.CurrentFreqDesc1').val(txt);

        var txt = $('.ExpFrequency1').find('option:selected').text();
        $('.ExpFreqDesc1').val(txt);

        $('.CurrentFrequency1').change(function () {
            var txt = $(this).find('option:selected').text();
            $('.CurrentFreqDesc1').val(txt);
        });

        $('.ExpFrequency1').change(function () {
            var txt = $(this).find('option:selected').text();
            $('.ExpFreqDesc1').val(txt);
        });

        $('.file1').preimage();
    });

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

    function clearContents1(ele) {
        var file = $('.' + ele + '1'); //document.getElementById(ele);
        file.select();
        file.val('');
        file.focus();
        if (ele == 'file2') {
            $('#prev_file2').html('');
        }
    }

    function get_filename1(obj, type, ftype) {
        if (type == 2) {
            if ($('.Attachresume1')[0].files[0] != null) {
                var file = $('.Attachresume1')[0].files[0].name; // $('.Attachresume').val(); //  document.getElementById('Attachresume').files[0];
                if (file != '') {
                    if (file == obj.files[0].name) {
                        alert('The Cover Letter you are trying to attach has the same name and size as the file you have attached as your CV. Please choose the correct file, or you may proceed without attaching a Cover Letter.');
                        clearContents1(obj.id);
                        return;
                    }
                }
            }
        }
        if (type == 1) {
            if ($('.CoverLetterOptional1')[0].files[0] != null) {
                var file = $('.CoverLetterOptional1')[0].files[0].name; // $('.CoverLetterOptional').val(); // document.getElementById('CoverLetterOptional').files[0];
                if (file != '') {
                    if (file == obj.files[0].name) {
                        alert('The CV you are trying to attach has the same name and size as the file you have attached as your Cover Letter. Please choose a different file as your CV, or remove the file you have attached as your Cover Letter.');
                        clearContents1(obj.id);
                        return;
                    }
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
                    clearContents1(obj.id);
                }
            }
        })


    }

    $(function () {
        $(".BirthDate1").val('');
        $(".Occupation1").val('');
        $(".date11").datepicker({ dateFormat: 'dd M yy', changeMonth: true,
            changeYear: true, yearRange: "-73", maxDate: '-1d'

        });
        $("#btnsubmit").click(function () {
            var country = '';
            $(".NationSelect1 > option").each(function () {
                country = $(this).text() + "\n" + country;
            });
            $(".Countrylist1").val(country);

            $(".NationSelect1").find("option").attr("selected", true);
        });
        //$("#progress").hide();
    });




    function cvAlert() {
        alert('Do not use this section if you are interested in a specific vacancy. If you have an interest in a specific vacancy, search for the vacancy then Click APPLY ONLINE.');
    }
</script>
<script type="text/javascript" language="javascript">
    function nospaces1(t) {
        if (t.value.match(/\s/g)) {
            alert('Skype Names do not contain spaces');
            t.value = t.value.replace(/\s/g, '');
        }
    }

    function isNumber1(e) {
        if (e.ctrlKey || e.metaKey)
            return true;
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            return false;
        }
    }

    function isPhoneNumber1(evt) {
        if (e.ctrlKey || e.metaKey)
            return true;
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            var charCode = (e.which) ? e.which : e.keyCode;
            if (charCode == 45 || charCode == 32)
                return true;
            return false;
        }

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

    var counter = 2;
    function removeCVMiddlename(id) {
        var div = $(id).parent().parent();
        if (div != null)
            div.html('');

    }
    function addCVControl(id) {
        var newTextBoxDiv = $(document.createElement('div')).attr("id", 'TextBoxDiv' + counter).attr("style", "clear:both");
        var ele = '<input type="text" name="MiddleName" id="MiddleName" value="" onkeypress="return LettersWithSpaceOnly(event);" >';
        ele += '<div style="float:right;margin-top: 7px; margin-right: 9px;"><img style="display: block !important;visibility: inherit !important;" id="Img5" class="phoneRemove" onclick="removeCVMiddlename(this)" src="../../Content/images/Cross - white on red - 12 pixel.png" onmouseover="showtip(this)" alt="Remove selected"></div>';
        newTextBoxDiv.after().html(ele);
        newTextBoxDiv.appendTo("#divCVmiddle");
    }

    function removeCVPhone(id) {
        var div = $(id).parent().parent().parent().parent().parent();
        if (div != null)
            div.html('');
    }
    function addCVPhoneControl(id) {
        var c1 = $(id).siblings('table')[0];
        var tbl = $(c1).clone();
        var newTextBoxDiv = $(document.createElement('div'))
	     .attr("id", 'phoneDiv' + counter);
        $(c1).clone().appendTo(newTextBoxDiv);
        newTextBoxDiv.find("input").val('');
        newTextBoxDiv.find("div").show();
        newTextBoxDiv.appendTo("#divCVPhone");
        countryAutoA();
    }

    function removeCVEmployment(id) {
        var div = $(id).parent().parent().parent().parent().parent();
        if (div != null)
            div.html('');
    }
    function addCVEmploymentControl(id) {
        var c1 = $(id).siblings('table')[0];
        var newTextBoxDiv = $(document.createElement('div')).attr("id", 'employmentDiv' + counter);
        $(c1).clone().appendTo(newTextBoxDiv);
        newTextBoxDiv.find("input").val('');
        newTextBoxDiv.find("div").show();
        newTextBoxDiv.appendTo("#divCVEmployment");
        employmentHistory();
    }

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

    function checkCurrentAmount1(id) {
        var famt = parseInt($('#CurrentFromAmt').val());
        var tamt = parseInt($('#CurrentToAmt').val());
        var cur = $('.CurrentCurrency1').val();
        if (famt > 0 || tamt > 0) {
            if (cur == '') {
                alert('You need to select a currency within the "Remuneration" section.');
                $(id).val('0');
                $('.CurrentCurrency1').focus();
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
                    $(".CurrentFrequency1").focus();
        }
        if ($(id).attr('id') == 'CurrentToAmt') {
            if (tamt < famt) {
                alert('From amount should not be higher than To amount');
                $('#CurrentFromAmt').val('0');
                return false;
            }
            //            if ($(".CurrentFrequency1").val() == '-1') {
            //                $(".CurrentFrequency1").focus();
            //            }
        }
    }

    function checkExpAmount1(id) {
        var famt = parseInt($('#ExpFromAmt').val());
        var tamt = parseInt($('#ExpToAmt').val());
        var cur = $('.ExpCurrency1').val();
        if (famt > 0 || tamt > 0) {
            if (cur == '') {
                alert('You need to select a currency within the "Remuneration" section.');
                $(id).val('0');
                $('.ExpCurrency1').focus();
                return;
            }
        }
        if (famt > 0 && tamt > 0) {
            if (famt > 0 && tamt > 0) {
                if (tamt < famt) {
                    alert('From amount should not be higher than To amount');
                    $(id).val('0');
                }
            }
        }
        else {
            if (famt > 0)
                $('#ExpToAmt').focus();
            else
                if (tamt > 0)
                    $(".ExpFrequency1").focus();
        }
        if ($(id).attr('id') == 'ExpToAmt') {
            if (tamt < famt) {
                alert('From amount should not be higher than To amount');
                $('#ExpFromAmt').val('0');
                return false;
            }
            //    if ($(".ExpFrequency1").val() == '-1') {
            //        $(".ExpFrequency1").focus();
            //    }
        }
    }

    function checkCurrentFrequency1() {
        if ($('.CurrentCurrency1').val() != '') {
            if ($(".CurrentFrequency1").val() == '-1') {
                //            $(".CurrentFrequency1").focus();
                alert('Please select a frequency for Current Remuneration.');

                return false;
            }
        }
    }

    function checkExpFrequency1() {
        if ($('.ExpCurrency1').val() != '') {
            if ($(".ExpFrequency1").val() == '-1') {
                //            $(".ExpFrequency1").focus();
                alert('Please select a frequency for Expected Remuneration.');
                return false;
            }
        }
    }
</script>
<style type="text/css">
    .prev_container
    {
        overflow: auto;
        width: 300px;
        height: 135px;
    }
    
    .prev_thumb
    {
        margin: 10px;
        height: 100px;
    }
    
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
</style>
<script type="text/javascript" language="javascript">
    function yearvalidation1(id) {
        var fy = $('.CurrentFY').val();
        var ty = $('.CurrentTY').val();
        var fm = $('.CurrentFM').val();
        var tm = $('.CurrentTM').val();
        var fd = $('.CurrentFD').val();
        var td = $('.CurrentTD').val();
        var fdt;
        var todt;
        fd = fd == '' ? '01' : (fd < 10 ? '0' + fd : fd);
        td = td == '' ? fd : (td < 10 ? '0' + td : td);
        fdt = new Date(fy + '-' + (fm == '' ? '01' : ($('.CurrentFM').attr('selectedIndex') < 10 ? ('0' + $('.CurrentFM').attr('selectedIndex')) : $('.CurrentFM').attr('selectedIndex'))) + '-' + fd);
        todt = new Date(ty + '-' + (tm == '' ? '12' : ($('.CurrentTM').attr('selectedIndex') < 10 ? ('0' + $('.CurrentTM').attr('selectedIndex')) : $('.CurrentTM').attr('selectedIndex'))) + '-' + td);
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

function cmonthchange1(id) {
    var fy = $('.CurrentFY').val();
    if (fy == '') {
        alert('Please select Year');
        $(id).val('');
    }
    if ($('.CurrentFY').val() == 'Present') {
        alert('Not allowed to select Month if year is set to Present');
        $(id).val('');
    }
    $('.CurrentFD').val('');
}

function cdaychange1(id) {
    var fy = $('.CurrentFM').val();
    if (fy == '') {
        alert('Please select month');
        $(id).val('');
    }
}

function ctmonthchange1(id) {
    var fy = $('.CurrentTY').val();
    if (fy == '') {
        alert('Please select Year');
        $(id).val('');
    }
    if ($('.CurrentTY').val() == 'Present') {
        alert('Not allowed to select Month if year is set to Present');
        $(id).val('');
    }
    $('.CurrentTD').val('');
}

function ctdaychange1(id) {
    var fy = $('.CurrentTM').val();
    if (fy == '') {
        alert('Please select month');
        $(id).val('');
    }
}

function historyyearvalidation1(id) {
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
            alert('invlaid date');
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

function yearchange1(id) {
    $(id).siblings('select').each(function () { this.value = ''; });
    return true;
}

function fmonthchange1(id) {
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

function fdaychange1(id) {
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

function tmonthchange1(id) {
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

function tdaychange1(id) {
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

function phonetypechange1(id) {
    var txt = $(id).find('option:selected').text();
    $(id).siblings('input').val(txt);

}

function checkValid1() {
	var valid = true;
	var valcontact = false;
    if ($('.CoverLetter1').val().length > 2000) {
        alert("Cover letter exceeds maximum character length. Please reduce the number of characters below the maximum, or attach your Cover Letter as a separate file. Then try clicking Submit again.");
        valid = false;
    }
    if ($('.CurrentCurrency1').val() != '') {
        if ($(".CurrentFrequency1").val() == '-1') {
            valid = false;
            //                $("#CurrentFrequency").focus();
            alert('Please select a frequency for Current Remuneration.');
        }
    }
    if ($('.ExpCurrency1').val() != '') {
        if ($(".ExpFrequency1").val() == '-1') {
            //                $("#ExpFrequency").focus();
            alert('Please select a frequency for Expected Remuneration.');
            valid = false;
        }
    }
    $('.PTCV1').each(function () {
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

    if ($('.CurrentOccupationA').val() != '') {
    	if ($('.CurrentOccupationIdA').val() == '') {
    		$('.CurrentOccupationA').val('');
    		alert('The Occupation field contains invalid data. Please make a selection from the list without editing the selection you make.');    		
    		$('.CurrentOccupationA').focus();    		
    		valid = false;
    		return false;
    	}
    }

    if ($('.CurrentIndustryA').val() != '') {
    	if ($('.CurrentIndustryIdA').val() == '') {
    		$('.CurrentIndustryA').val('');
    		alert('The Industry field contains invalid data. Please make a selection from the list without editing the selection you make.');    		
    		$('.CurrentIndustryA').focus();    		
    		valid = false;
    		return false;
    	}
    }

    return valid;
}
</script>
<%--<div id="progress" style="position: fixed; top: 0px; bottom: 0px; left: 0px; right: 0px;
    overflow: hidden; padding: 0; margin: 0; background-color: #F0F0F0; filter: alpha(opacity=50);
    opacity: 0.8; z-index: 100000;">
    <div style="margin-left: 50%; margin-top: 25%;">
        <img id="loading" src="../../Content/images/consultant/spinner3-bluey.gif" alt="" />
    </div>
</div>--%>
<a class="moduleTitle" href="#" onclick="cvAlert()"><span class="leftWhiteArrow">UPLOAD
    CV</span></a>
<div class="functionalModule">
    <div id="uploadCV" class="functionalModuleInner">
        <div class="submitcv">
            <img class="moduleIcons" src="/Content/images/imgs/uploadCV.gif" alt="" width="51"
                height="47" border="0" />
            <span class="moduleIntro">Send CV</span>
            <hr />
            <%--<span class="additionaltextgray">Send us your CV and let us do the rest.<br />
            </span>--%><span class="additionaltext"><span style="color: Red"> * </span>Indicates
                mandatory input</span>
            <form name="submitcv" id="submitcv" onsubmit="return checkValid1();" action="/Work/UploadResume.shtml"
            method="post" enctype="multipart/form-data">
            <input type="hidden" name="SubmitSource" id="SubmitSource" value="uploadcv" />
            <div class="contactdetails">
                <div class="subheadings1">
                    <ul class="accordion" id="acc1">
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#">Personal Detail<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["CV_Personal"]==null?"": ViewData["CV_Personal"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <table cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td class="body">
                                                    <label class="subheadings">
                                                        Email <font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                            alt="<%=ViewData["CV_EmailTip"]==null?"": ViewData["CV_EmailTip"].ToString()  %>" onmouseover="showtip(this)" /></label>
                                                    <%= Html.TextBox("Email", string.Empty, new { @class = "Field", maxlength = "50" })%>
                                                    <%= Html.DropDownList("Emailtype", new SelectList(((DataTable)Session["emailtype"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv", Style = "width:70px" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="subheadings">
                                                        Title<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                            alt="<%=ViewData["CV_TitleTip"]==null?"": ViewData["CV_TitleTip"].ToString()  %>" onmouseover="showtip(this)" />
                                                    </label>
                                                    <%= Html.DropDownList("title",new SelectList(((DataTable)Session["title"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv" }) %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="body">
                                                    <label class="subheadings">
                                                        First Name <font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                            alt="<%=ViewData["CV_First"]==null?"": ViewData["CV_First"].ToString()  %>" onmouseover="showtip(this)" />
                                                    </label>
                                                    <%= Html.TextBox("FirstName", string.Empty, new { @class = "Field", maxlength = "50", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="subheadings">
                                                        Middle Name/s<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_Middle"]==null?"": ViewData["CV_Middle"].ToString()  %>"
                                                            onmouseover="showtip(this)" />
                                                    </label>
                                                    <%= Html.TextBox("MiddleName", string.Empty, new { @class = "Field", maxlength = "50", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                                    <div id="divCVmiddle">
                                                    </div>
                                                    <input type="button" value="Add" id="btnMiddle" onclick="addCVControl(this)" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="body">
                                                    <label class="subheadings">
                                                        Family Name / Surname <font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                            alt="<%=ViewData["CV_Surname"]==null?"": ViewData["CV_Surname"].ToString()  %>" onmouseover="showtip(this)" />
                                                    </label>
                                                    <%= Html.TextBox("LastName", string.Empty, new { @class = "Field", maxlength = "50", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="subheadings">
                                                        Commonly known as<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_Common"]==null?"": ViewData["CV_Common"].ToString()  %>"
                                                            onmouseover="showtip(this)" />
                                                    </label>
                                                    <%= Html.TextBox("NickName", string.Empty, new { @class = "Field", maxlength = "25", onkeypress = "return LettersWithSpaceOnly(event);" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="body">
                                                    <label class="subheadings">
                                                        Birth date<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                            alt="<%=ViewData["CV_Birth"]==null?"": ViewData["CV_Birth"].ToString()  %>" onmouseover="showtip(this)" />
                                                    </label>
                                                    <%= Html.TextBox("BirthDate", string.Empty, new { @class = "date11 Field", @readonly = true })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="subheadings">
                                                        Gender<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                            alt="<%=ViewData["CV_Gender"]==null?"": ViewData["CV_Gender"].ToString()  %>" onmouseover="showtip(this)" />
                                                    </label>
                                                    <%= Html.DropDownList("gender",new SelectList(((DataTable)Session["gender"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv" }) %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="subheadings">
                                                        Nationality<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                            alt="<%=ViewData["CV_Nationality"]==null?"": ViewData["CV_Nationality"].ToString()  %>"
                                                            onmouseover="showtip(this)" />
                                                    </label>
                                                    <div id="divNation1" style="display: none">
                                                        <%= Html.ListBox("NationSelect", new SelectList(( new DataTable()).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "5", @class = "fieldAlerts NationSelect1",@style="width:163px" })%>
                                                        <div style="margin-left: 162px; margin-top: -6px;">
                                                            <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                                onmouseover="showtip(this)" id="btnNRemove1" style="display: block !important;
                                                                visibility: inherit !important;" />
                                                        </div>
                                                    </div>
                                                    <%= Html.TextBox("Nationality", "", new { @class = "nationApply1 Field" })%>
                                                    <%= Html.Hidden("NationId")%>
                                                    <%= Html.Hidden("Countrylist", "", new { @class = "Countrylist1" })%>
                                                    <%--<input type="hidden" id="Countrylist" class="Countrylist1" />--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="subheadings">
                                                        Marital status<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_Marital"]==null?"": ViewData["CV_Marital"].ToString()  %>"
                                                            onmouseover="showtip(this)" />
                                                    </label>
                                                    <%= Html.DropDownList("marital",new SelectList(((DataTable)Session["marital"]).Rows as System.Collections.IEnumerable, "[1]", "[0]"), new { @class = "fieldAdv" }) %>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </li>
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#">Contact details<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["CV_Contact"]==null?"": ViewData["CV_Contact"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <label class="subheadings" for="phone">
                                        Phone<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                            alt="<%=ViewData["CV_PhoneTip"]==null?"": ViewData["CV_PhoneTip"].ToString()  %>" onmouseover="showtip(this)" /></label>
                                    <input type="hidden" id="hdfCC1" />
                                    <table>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Type
                                                </label>
                                                <%= Html.DropDownList("Phonetype", new SelectList(((DataTable)Session["phonetype"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv PTCV1", @onchange = "phonetypechange1(this)" })%>
                                                <input type="hidden" id="PhonetypeDesc" name="PhonetypeDesc" />
                                                <div style="float: right; margin-right: 8px; margin-top: 7px; display: none">
                                                    <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                        onmouseover="showtip(this)" onclick="removeCVPhone(this)" class="phoneCVRemove"
                                                        id="phoneCVRemove" style="display: block !important; visibility: inherit !important;" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Country code
                                                </label>
                                                <%=Html.TextBox("Countrycode", "", new { @maxlength = "10", @class = "countrycodeA Field" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Local area code
                                                </label>
                                                <%=Html.TextBox("Localareacode", "", new { @maxlength = "20", @class = "Field", onkeypress = "return isNumber1(event);" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Number
                                                </label>
                                                <%=Html.TextBox("Phone", "", new { @maxlength = "20", @class = "Field", onkeypress = "return isPhoneNumber1(event);" })%>
                                            </td>
                                        </tr>
                                    </table>
                                    <div id="divCVPhone">
                                    </div>
                                    <input type="button" value="Add" id="Button2" onclick="addCVPhoneControl(this)" />
                                    <br />
                                    <table>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Skype Name<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_SkypeTip"]==null?"": ViewData["CV_SkypeTip"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%=Html.TextBox("Skype", string.Empty, new { @class = "Field", onkeypress = "return nospaces1(this);" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Subscribe to Job Alerts
                                                </label>
                                                <%=Html.CheckBox("SubscribeAlert",true)%>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </li>
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#">Current or most recent employment <font color="red">*</font><img
                                    src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_Current"]==null?"": ViewData["CV_Current"].ToString()  %>"
                                    onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <table>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    From<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_CFrom"]==null?"": ViewData["CV_CFrom"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.DropDownList("CurrentFY", new SelectList(((ListItemCollection)Session["year"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv CurrentFY", @style = "width:61px !important", onchange = "yearchange1(this);yearvalidation1(this)" })%>
                                                <%= Html.DropDownList("CurrentFM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv CurrentFM", @style = "width:55px !important", onchange = "cmonthchange1(this); yearvalidation1(this)" })%>
                                                <%= Html.DropDownList("CurrentFD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv CurrentFD", @style = "width:55px !important", onchange = "cdaychange1(this);yearvalidation1(this)" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    To<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_CTo"]==null?"": ViewData["CV_CTo"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.DropDownList("CurrentTY", new SelectList(((ListItemCollection)Session["Toyear"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv CurrentTY", @style = "width:61px !important", onchange = "yearchange1(this);yearvalidation1(this)" })%>
                                                <%= Html.DropDownList("CurrentTM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv CurrentTM", @style = "width:55px !important", onchange = "ctmonthchange1(this); yearvalidation1(this)" })%>
                                                <%= Html.DropDownList("CurrentTD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv CurrentTD", @style = "width:55px !important", onchange = "ctdaychange1(this); yearvalidation1(this)" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Your current employer name<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_CEmployer"]==null?"": ViewData["CV_CEmployer"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.TextBox("Currentemployer", string.Empty, new { @class = "fieldQuick CurrentemployerA" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Your current employment location<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                        alt="<%=ViewData["CV_CLocation"]==null?"": ViewData["CV_CLocation"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.TextBox("Currentemplocation", string.Empty, new { @class = "fieldQuick CurrentemplocationA" })%>
                                                <%= Html.Hidden("CurrentemplocationId")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Your occupational category<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                        alt="<%=ViewData["CV_COccupation"]==null?"": ViewData["CV_COccupation"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.TextBox("CurrentOccupation", string.Empty, new { @class = "fieldQuick CurrentOccupationA" })%>
                                                <%= Html.Hidden("CurrentOccupationId", string.Empty, new {@class = "CurrentOccupationIdA" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Your industry category<font color="red">*</font><img src="../../Content/images/info 12 pixel.png"
                                                        alt="<%=ViewData["CV_CIndustry"]==null?"": ViewData["CV_CIndustry"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.TextBox("CurrentIndustry", string.Empty, new { @class = "fieldQuick CurrentIndustryA" })%>
                                                <%= Html.Hidden("CurrentIndustryId", string.Empty, new { @class = "CurrentIndustryIdA" })%>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </li>
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#">Employment history<img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["CV_EmpHistory"]==null?"": ViewData["CV_EmpHistory"].ToString()  %>"
                                    onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <table>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    From<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EFrom"]==null?"": ViewData["CV_EFrom"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.DropDownList("EmpFY", new SelectList(((ListItemCollection)Session["year"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv EmpFY", @style = "width:61px !important", onchange = "yearchange1(this); historyyearvalidation1(this)" })%>
                                                <%= Html.DropDownList("EmpFM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv EmpFM", @style = "width:55px !important", onchange = "fmonthchange1(this); historyyearvalidation1(this)" })%>
                                                <%= Html.DropDownList("EmpFD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv EmpFD", @style = "width:55px !important", onchange = "fdaychange1(this); historyyearvalidation1(this)" })%>
                                                <div style="float: right; margin-right: 8px; margin-top: 7px; display: none">
                                                    <img alt="Remove selected" src="../../Content/images/Cross - white on red - 12 pixel.png"
                                                        onmouseover="showtip(this)" onclick="removeCVEmployment(this)" class="employmentCVRemove"
                                                        id="employmentCVRemove" style="display: block !important; visibility: inherit !important;" />
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    To<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_ETo"]==null?"": ViewData["CV_ETo"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.DropDownList("EmpTY", new SelectList(((ListItemCollection)Session["Toyear"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv EmpTY", @style = "width:61px !important", onchange = "yearchange1(this); historyyearvalidation1(this)" })%>
                                                <%= Html.DropDownList("EmpTM", new SelectList(((ListItemCollection)Session["month"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv EmpTM", @style = "width:55px !important", onchange = "tmonthchange1(this); historyyearvalidation1(this)" })%>
                                                <%= Html.DropDownList("EmpTD", new SelectList(((ListItemCollection)Session["day"]) as System.Collections.IEnumerable, "Text", "Text"), new { @class = "fieldAdv EmpTD", @style = "width:55px !important", onchange = "tdaychange1(this); historyyearvalidation1(this)" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Employer name<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EEmployer"]==null?"": ViewData["CV_EEmployer"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.TextBox("Empemployer", string.Empty, new { @class = "field Empemployer" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Employment location<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_ELocation"]==null?"": ViewData["CV_ELocation"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.TextBox("Emplocation", string.Empty, new { @class = "field Emplocation" })%>
                                                <%= Html.Hidden("EmplocationId")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Occupational category<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EOccupation"]==null?"": ViewData["CV_EOccupation"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.TextBox("EmpOccupation", string.Empty, new { @class = "field EmpOccupation" })%>
                                                <%= Html.Hidden("EmpOccupationId")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class="subheadings">
                                                    Industry category<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_EIndustry"]==null?"": ViewData["CV_EIndustry"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.TextBox("EmpIndustry", string.Empty, new { @class = "field EmpIndustry" })%>
                                                <%= Html.Hidden("EmpIndustryId", "", new  { @class = "EmpIndustryId" })%>
                                            </td>
                                        </tr>
                                    </table>
                                    <div id="divCVEmployment">
                                    </div>
                                    <input type="button" value="Add" id="Button3" onclick="addCVEmploymentControl(this)" />
                                </div>
                            </div>
                        </li>
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#">Remuneration<img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["CV_Remuneration"]==null?"": ViewData["CV_Remuneration"].ToString()  %>"
                                    onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <table>
                                        <tr>
                                            <td class="subheadings">
                                                <label class="subheadings">
                                                    Current remuneration<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_CRemuneration"]==null?"": ViewData["CV_CRemuneration"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.DropDownList("CurrentCurrency", new SelectList(((DataTable)Session["currency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv CurrentCurrency1", @style = "width:75px !important" })%>
                                                From
                                                <%= Html.TextBox("CurrentFromAmt", 0, new { @class = "fieldQuick ", @style = "width:40px !important", onblur = "checkCurrentAmount1(this)" })%>
                                                To
                                                <%= Html.TextBox("CurrentToAmt", 0, new { @class = "fieldQuick ", @style = "width:40px !important", onblur = "checkCurrentAmount1(this)" })%>
                                                <%= Html.DropDownList("CurrentFrequency", new SelectList(((DataTable)Session["frequency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv CurrentFrequency1", @style = "width:55px !important", onblur = "checkCurrentFrequency1()" })%>
                                                <%= Html.Hidden("CurrentFreqDesc", "", new { @class = "CurrentFreqDesc1" })%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="subheadings">
                                                <label class="subheadings">
                                                    Expected remuneration<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["CV_ERemuneration"]==null?"": ViewData["CV_ERemuneration"].ToString()  %>"
                                                        onmouseover="showtip(this)" />
                                                </label>
                                                <%= Html.DropDownList("ExpCurrency", new SelectList(((DataTable)Session["currency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv ExpCurrency1", @style = "width:75px !important" })%>
                                                From
                                                <%= Html.TextBox("ExpFromAmt", 0, new { @class = "fieldQuick ", @style = "width:40px !important", onblur = "checkExpAmount1(this)" })%>
                                                To
                                                <%= Html.TextBox("ExpToAmt", 0, new { @class = "fieldQuick ", @style = "width:40px !important", onblur = "checkExpAmount1(this)" })%>
                                                <%= Html.DropDownList("ExpFrequency", new SelectList(((DataTable)Session["frequency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv ExpFrequency1", @style = "width:55px !important", onblur = "checkExpFrequency1()" })%>
                                                <%= Html.Hidden("ExpFreqDesc", "", new { @class = "ExpFreqDesc1" })%>
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
                                    <p>
                                        <u>CV:</u> <font size="1">
                                            <%= ViewData["cvmsg"]==null?"": ViewData["cvmsg"].ToString() %></font><span class="mandatoryString"><font color="red">&nbsp;*</font></span></p>
                                    <input type="file" name="Attachresume" id="Attachresume" class="Attachresume1" onchange="get_filename1(this,1,'CV');" />
                                    <input type="button" name="removefile" value="remove" id="Button4" onclick="clearContents1('Attachresume1')" />
                                </div>
                            </div>
                        </li>
                        <li>
                            <h4 class="h">
                                <a class="trigger" href="#">Attach covering letter<img src="../../Content/images/info 12 pixel.png"
                                    alt="<%=ViewData["CV_CLTip"]==null?"": ViewData["CV_CLTip"].ToString()  %>" onmouseover="showtip(this)" /></a></h4>
                            <div class="outer" style="display: none;">
                                <div class="inner">
                                    <p>
                                        <u>COVER LETTER: </u>
                                    </p>
                                    <p class="subheadings" style="margin-left: 20">
                                        Please either enter a cover letter here as text:
                                    </p>
                                    <%= Html.TextArea("CoverLetter", new { @class = "Field CoverLetter1", rows = 5 })%>
                                    <div id="desCoverLettContent1" style="margin-left: 20">
                                        <font size="1">characters left: 2000</font><input type="hidden" value="2000" name="CoverLettContentRemLngth" /></div>
                                    <p class="subheadings" style="margin-left: 20">
                                        Or attach a cover letter file
                                    </p>
                                    <p>
                                        <u>Cover Letter:</u> <font size="1">
                                            <%= ViewData["clmsg"]==null?"": ViewData["clmsg"].ToString() %></font><span class="mandatoryString"><font color="red"></font></span></p>
                                    <input type="file" name="CoverLetterOptional" id="CoverLetterOptional" class="CoverLetterOptional1"
                                        onchange="get_filename1(this,2,'Cover Letter');" value="" />
                                    <input type="button" name="removefile" value="remove" id="Button5" onclick="clearContents1('CoverLetterOptional1')" />
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
                                            <%= ViewData["phmsg"]==null?"": ViewData["phmsg"].ToString() %></font><span class="mandatoryString"><font color="red"></font></span></p>
                                    <input class="file1" id="file2" name="file1" type='file' title="test #1" onchange="get_filename1(this,6,'Image of Candidate');" />
                                    <div id="prev_file2">
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <input type="submit" id="btnsubmit" value="Submit" class="btnsubmit1" />&nbsp;&nbsp;<input
                        id="btnReset" type="reset" value="Clear All" />
					<div style="float: right">
                        <img src="../../Content/images/feedback_ime32.png" style="cursor: pointer" alt="Feedback"
                            onmouseover="showtip(this)" onclick="openfeedback()" /></div>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">	

    jq9("html").addClass("js");
    jq9(function () {

        jq9("#uploadCV").accordion({
            objID: "#acc1",
            el: ".h",
            head: "h4, h5",
            next: "div",
            initShow: "div.shown",
            standardExpansible: true
        });
        jq9("#uploadCV").accordion({
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
        jq9("#uploadCV .accordion").expandAll({
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
    });

</script>
<script type="text/javascript" language="javascript">
    var readyToClose = false;
    var sel = false;

    $('.ui - autocomplete').click(function () {
        $('.ui-autocomplete').show();
    });

    $(".btnsubmit1").click(function () {
        $('.PTCV1').each(function () {
            $(this).siblings('input').val($(this).find('option:selected').text());
        });
        var country = '';
        $(".NationSelect > option").each(function () {
            country = $(this).text() + "\n" + country;
        });
        $("#Countrylist").val(country);

        $(".NationSelect").find("option").attr("selected", true);
    });

    $("#btnReset").click(function () {
        $(".IndustrySelectR > option").each(function () {
            $(this).remove();
        });
        $(".NationSelect1 > option").each(function () {
            $(this).remove();
        });
        $('#SubmitSource input[type="text"]').val('');

    });

    $("#btnOremoveR").click(function () {
        $(".OccupationSelectR > option:selected").each(function () {
            $(this).remove();
        });

    });

    $("#btnIremoveR").click(function () {
        $(".IndustrySelectR > option:selected").each(function () {
            $(this).remove();
        });

    });

    $("#btnNRemove1").click(function () {
        $(".NationSelect1 > option:selected").each(function () {
            $(this).remove();
        });

    });

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
  
</script>
<script type="text/javascript" language="javascript">
    function savelaterset() {
        $('#hdfSavelater').val('1');
        $(".NationSelect1").find("option").attr("selected", true);
    }

    $(function () {

        $('.countrycodeA').keypress(function () {
            $('#hdfCC1').val('');
        });

        $("#applyButton").click(function () {
            $("#progress").show();
            $(".NationSelect1").find("option").attr("selected", true);
        });
    });
    $('.nationApply1').keyup(function (e) {
        if (e.keyCode != 9) {
            $('#NationId').val('');
            if (e.which == 27) {
                readyToClose = true;
                $('#nation').autocomplete('close');
            }
        }
    });
    $(".nationApply1").keypress(function (e) {
        if (!e) e = window.event;
        if (e.keyCode == '27') {
            readyToClose = true;
            $('.NationSelect1').autocomplete('close');
            return false;
        }
    });
    $('.nationApply1').autocomplete(
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
        		$("#divNation1").show();
        		var position = $(".nationApply1").offset();
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
        		$(".NationSelect1 option").each(function () {
        			c2 = $(this).val();
        			if (id == c2) {
        				alert('You have already selected ' + $(this).text());
        				exist = 1;
        				return false;
        			}
        		});
        		if (exist == 0) {
        			var lst = "<option selected='true' value='" + id + "'>" + code + "</option>";
        			$(".NationSelect1").append(lst);
        		}
        		$('.nationApply1').val('');
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

    $('.nationApply1').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
        return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
    };

    function countryAutoA() {
        $('.countrycodeA').autocomplete(
        {
            source: '<%= Url.Action("SearchCountryCode", "Jobs")%>',
            minLength: 1,
            select: function (event, ui) {
                var code = ui.item.value;
                ui.item.value = code.substring(code.indexOf('(') + 1, code.indexOf(')'));
                $('#hdfCC1').val('1');
            },
            change: function (event, ui) {
                if (ui.item) {
                    $('#hdfCC1').val('');
                    return;
                }
                if ($('#hdfCC1').val() == '') {
                    $(this).val('');
                    alert('The Country code field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }
                $('#hdfCC1').val('');
            }
        });
        $('.countrycodeA').keypress(function () {
            $('#hdfCC1').val('');
        });
    }
    $('.countrycodeA').autocomplete(
        {
            source: '<%= Url.Action("SearchCountryCode", "Jobs")%>',
            minLength: 1,
            select: function (event, ui) {
                var code = ui.item.value;
                ui.item.value = code.substring(code.indexOf('(') + 1, code.indexOf(')'));
                $('#hdfCC1').val('1');
            },
            change: function (event, ui) {
                if (ui.item) {
                    $('#hdfCC1').val('');
                    return;
                }
                if ($('#hdfCC1').val() == '') {
                    $(this).val('');
                    alert('The Country code field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }
                $('#hdfCC1').val('');
            }
        });

    $('.CurrentemployerA').autocomplete(
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

        $('.CurrentemplocationA').keyup(function (e) {
        	if (e.keyCode != 9) {
        		if (e.keyCode != 13) {
        			$('#CurrentemplocationId').val('');
        		}
        		if (e.which == 27) {

        		}
        	}
        });
    $(".CurrentemplocationA").keypress(function (e) {
        if (!e) e = window.event;
        if (e.keyCode == '27') {

            return false;
        }
    });

    $('.CurrentemplocationA').autocomplete(
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
                $('.CurrentemplocationA').val(code);
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

    $('.CurrentemplocationA').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
        return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
    };

    $('.CurrentOccupationA').keyup(function (e) {
    	if (e.keyCode != 9) {
    		if (e.keyCode != 13) {
    			$('#CurrentOccupationId').val('');
    		}
    		if (e.which == 13) {
    			if ($('#CurrentOccupationId').val() == '') {
    				$('.CurrentOccupationA').val('');
    				alert('The Occupation field contains invalid data. Please make a selection from the list without editing the selection you make.');
    				
    			}
    		}
    		if (e.which == 27) {
    			//                    readyToClose = true;
    			//                    $('.Occupation1').autocomplete('close');
    		}
    	}
    });
    $(".CurrentOccupationA").keypress(function (e) {
        if (!e) e = window.event;
        if (e.keyCode == '27') {
            //  readyToClose = true;
            //                $('.Occupation1').autocomplete('close');
            return false;
        }
    });

    $('.CurrentOccupationA').autocomplete(
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
                    $('.CurrentOccupationA').val('');
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
                    $('.CurrentOccupationA').val('');
                    alert('The Occupation field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }
            }
        });
    $('.CurrentOccupationA').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
        return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
    };

    $('.CurrentIndustryA').keyup(function (e) {
    	if (e.keyCode != 9) {
    		if (e.keyCode != 13) {
    			$('#CurrentIndustryId').val('');
    		}
    		if (e.which == 27) {
    			readyToClose = true;
    			$('.CurrentIndustryA').autocomplete('close');
    		}
    	}
    });
    $(".CurrentIndustryA").keypress(function (e) {
        if (!e) e = window.event;
        if (e.keyCode == '27') {
            readyToClose = true;
            $('.CurrentIndustryA').autocomplete('close');
            return false;
        }
    });

    $('.CurrentIndustryA').autocomplete(
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
                    $('.CurrentIndustryA').val('');
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
                    $('.CurrentIndustryA').val('');
                    alert('The Industry field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }
            }
        });
    $('.CurrentIndustryA').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
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
        			//$('#EmpOccupationId').val('');        		
        			$(this).siblings().val('');
        		}
        		if (e.which == 27) {

        		}
        	}
        });
        $(".EmpOccupation").keypress(function (e) {
            if (!e) e = window.event;
            if (e.keyCode == '27') {

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

        		}
        	}
        });
        $(".EmpIndustry").keypress(function (e) {
            if (!e) e = window.event;
            if (e.keyCode == '27') {

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
