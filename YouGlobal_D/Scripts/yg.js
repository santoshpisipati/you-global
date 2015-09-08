function getRandomFlash() {
    return new SWFObject("/Content/flas/HomeLoadernew.swf", "HomeLoadernew", "651", "188", "8");
}
function getRandomFlash2() {
    return new SWFObject("/Content/flas/XML-CountrySelector.swf", "XML-CountrySelector", "417", "370", "8");
}

function checkemail(str) {
    return /^.+@.+\..{2,3}$/.test(str);
}

function checkphone(str) {
    return /^[ \+\-\.0-9\(\)]+$/.test(str);
}

function checkfileformat(str) {
    if (str && str.indexOf('.') != -1) {
        var fileExtension = str.substr(str.lastIndexOf('.')).toLowerCase();
        return (!((fileExtension != ".pdf") && (fileExtension != ".rtf") && (fileExtension != ".doc") && (fileExtension != ".docx") && (fileExtension != ".htm") && (fileExtension != ".html") && (fileExtension != ".ppt") && (fileExtension != ".txt") && (fileExtension != ".")));
    }
    return false;
}

function checkfileformatforAdlogic(str) {
    if (str && str.indexOf('.') != -1) {
        var fileExtension = str.substr(str.lastIndexOf('.')).toLowerCase();
        return (!((fileExtension != ".pdf") && (fileExtension != ".rtf") && (fileExtension != ".doc") && (fileExtension != ".txt") && (fileExtension != ".")));
    }
    return false;
}

function checkFormFields(check) {
    if (typeof (check) != 'undefined' && check) {
        if (typeof (check.firstName) != 'undefined' && check.firstName.value == "") {
            alert("The name field cannot be blank - please re-enter");
            //check.firstName.focus();
            return false;
        }
        else if (typeof (check.Name) != 'undefined' && check.Name.value == "") {
            alert("The name field cannot be blank - please re-enter");
            //check.Name.focus();
            return false;
        }
        else if (typeof (check.FirstName) != 'undefined' && check.FirstName.value == "") {
            alert("The first name field cannot be blank - please re-enter");
            //check.FirstName.focus();
            return false;
        }
        else if (typeof (check.LastName) != 'undefined' && check.LastName.value == "") {
            alert("The last name field cannot be blank - please re-enter");
            //check.LastName.focus();
            return false;
        }
        else if (typeof (check.SurName) != 'undefined' && check.SurName.value == "") {
            alert("The Family Name field cannot be blank - please re-enter");
            //check.SurName.focus();
            return false;
        }
        else if (typeof (check.Email) != 'undefined' && check.Email.value == "") {
            alert("The email field cannot be blank - please re-enter");
            //check.Email.focus();
            return false;
        }
        else if (typeof (check.Email) != 'undefined' && !checkemail(check.Email.value)) {
            alert("Please enter a valid email address");
            //check.Email.focus();
            return false;
        }
        else if (typeof (check.PhoneCode) != 'undefined' && check.PhoneCode.value == "") {
            alert("The country code field cannot be blank - please re-enter");
            //check.PhoneCode.focus();
            return false;
        }
        else if (typeof (check.ContactNumber) != 'undefined' && check.ContactNumber.value == "") {
            alert("The contact number field cannot be blank - please re-enter");
            //check.ContactNumber.focus();
            return false;
        }
        else if (typeof (check.ContactNumber) != 'undefined' && !checkphone(check.ContactNumber.value)) {
            alert("Please enter a valid contact number");
            //check.ContactNumber.focus();
            return false;
        }
        else if (typeof (check.selectOccupation) != 'undefined' && check.selectOccupation.value == "") {
            alert("Please select Occupation");
            //check.selectOccupation.focus();
            return false;
        }

        else if (typeof (check.IndustrySelect) != 'undefined' && check.IndustrySelect.selectedIndex == "-1") {
            alert("Please select Industry");
            //check.IndustrySelect.focus();
            return false;
        }

        else if (typeof (check.LocationSelect) != 'undefined' && check.LocationSelect.selectedIndex == "-1") {
            alert("Please select Location");
            //check.LocationSelect.focus();
            return false;
        }

        else if (typeof (check.WorkTypeSelect) != 'undefined' && check.WorkTypeSelect.selectedIndex == "-1") {
            alert("Please select Work type");
            //check.WorkTypeSelect.focus();
            return false;
        }

        else if (typeof (check.phone) != 'undefined' && check.phone.value == "") {
            alert("The phone field cannot be blank - please re-enter");
            //check.phone.focus();
            return false;
        }
        else if (typeof (check.phone) != 'undefined' && !checkphone(check.phone.value)) {
            alert("Please enter a valid phone number");
            //check.phone.focus();
            return false;
        }
        else if (typeof (check.contactNo) != 'undefined' && check.contactNo.value == "") {
            alert("The contact number field cannot be blank - please re-enter");
            //check.contactNo.focus();
            return false;
        }
        else if (typeof (check.contactNo) != 'undefined' && !checkphone(check.contactNo.value)) {
            alert("Please enter a valid contact number");
            //check.contactNo.focus();
            return false;
        }


        else if (typeof (check.ContactNumber) != 'undefined' && !checkphone(check.ContactNumber.value)) {
            alert("Please enter a valid contact number");
            //check.ContactNumber.focus();
            return false;
        }
        else if (typeof (check.mobileCell) != 'undefined' && check.mobileCell.value == "") {
            alert("The mobile/cell number field cannot be blank - please re-enter");
            //check.mobileCell.focus();
            return false;
        }
        else if (typeof (check.mobileCell) != 'undefined' && !checkphone(check.mobileCell.value)) {
            alert("Please enter a valid mobile/cell number");
            //check.mobileCell.focus();
            return false;
        }
        else if (typeof (check.email) != 'undefined' && check.email.value == "") {
            alert("The email field cannot be blank - please re-enter");
            //check.email.focus();
            return false;
        }

        else if (typeof (check.email) != 'undefined' && !checkemail(check.email.value)) {
            alert("Please enter a valid email address");
            //check.email.focus();
            return false;
        }

        else if (typeof (check.companyName) != 'undefined' && check.companyName.value == "") {
            alert("The company name field cannot be blank - please re-enter");
            //check.companyName.focus();
            return false;
        }
        else if (typeof (check.contactNo) != 'undefined' && check.contactNo.value == "") {
            alert("The mobile number field cannot be blank - please re-enter");
            //check.contactNo.focus();
            return false;
        }
        else if (typeof (check.contactNo) != 'undefined' && !checkphone(check.contactNo.value)) {
            alert("Please enter a valid mobile number");
            //check.contactNo.focus();
            return false;
        }
        //        else if (typeof (check.selectIndustry) != 'undefined' && check.selectIndustry.value == "") {
        //            alert("Please select the industry you are interested in");
        //            check.selectIndustry.focus();
        //            return false;
        //        }
        else if (typeof (check.IndustrySelect) != 'undefined' && check.IndustrySelect.length == 0) {
            alert("Please select the industry you are interested in");
            //check.IndustrySelect.focus();
            return false;
        }
        //        else if (typeof (check.selectIndustry) != 'undefined' && check.selectIndustry.value == "0" && typeof (check.otherIndustry) != 'undefined' && check.otherIndustry.value == "") {
        //            alert("Please enter the 'other' industry you are interested in");
        //            check.otherIndustry.focus();
        //            return false;
        //        }
        else if (typeof (check.selectOccupation) != 'undefined' && check.selectOccupation.value == "") {
            alert("Please select your Occupation category by typing at the Occupation field then selecting from the options available.");
            //check.selectOccupation.focus();
            return false;
        }
        else if (typeof (check.attachResume) != 'undefined' && check.attachResume.value == "") {
            alert("Please select your resume to upload");
            //check.attachResume.focus();
            return false;
        }
        //        else if (typeof (check.attachResume) != 'undefined' && !checkfileformat(check.attachResume.value)) {
        //            alert("Invalid resume file format");
        //            check.attachResume.focus();
        //            return false;
        //        }
        else if (typeof (check.attachment) != 'undefined' && check.attachment.value == "") {
            alert("Please select your resume to upload");
           // check.attachment.focus();
            return false;
        }
        //        else if (typeof (check.attachment) != 'undefined' && !checkfileformat(check.attachment.value)) {
        //            alert("Invalid resume file format");
        //            check.attachment.focus();
        //            return false;
        //        }
        else if (typeof (check.coverLetter) != 'undefined' && check.coverLetter.value == "") {
            alert("Please select your cover letter to upload");
           // check.coverLetter.focus();
            return false;
        }
        //        else if (typeof (check.coverLetter) != 'undefined' && !checkfileformat(check.coverLetter.value)) {
        //            alert("Invalid cover letter file format");
        //            check.coverLetter.focus();
        //            return false;
        //        }
        else if (typeof (check.additionalDocs) != 'undefined' && check.additionalDocs.value == "") {
            alert("Please select your additional documents to upload");
            //check.coverLetter.focus();
            return false;
        }
        //        else if (typeof (check.coverLetter) != 'undefined' && !checkfileformat(check.additionalDocs.value)) {
        //            alert("Invalid additional document file format");
        //            check.coverLetter.focus();
        //            return false;
        //        }
        else if (typeof (check.YourEmail) != 'undefined' && check.YourEmail.value == "") {
            alert("The from email field cannot be blank - please re-enter");
            //check.YourEmail.focus();
            return false;
        }
        else if (typeof (check.YourEmail) != 'undefined' && !checkemail(check.YourEmail.value)) {
            alert("Please enter a valid from email address");
            //check.YourEmail.focus();
            return false;
        }
        else if (typeof (check.FriendEmail) != 'undefined' && check.FriendEmail.value == "") {
            alert("The to email field cannot be blank - please re-enter");
           // check.FriendEmail.focus();
            return false;
        }
        else if (typeof (check.FriendEmail) != 'undefined' && !checkemail(check.FriendEmail.value)) {
            alert("Please enter a valid to email address");
           // check.FriendEmail.focus();
            return false;
        }
        else if (typeof (check.BirthDate) != 'undefined' && check.BirthDate.value == "") {
            alert("Please enter birth date");
            //check.BirthDate.focus();
            return false;
        }


        return true;
    }
    return true;
}

$(document).ready(function () {
    var elm = new Array();
    elm[0] = "ma";
    elm[1] = "ilt";
    elm[2] = "o:";
    elm[3] = "par";
    elm[4] = "tners@y";
    elm[5] = "ou";
    elm[6] = "-g";
    elm[7] = "lo";
    elm[8] = "ba";
    elm[9] = "l.c";
    elm[10] = "om";

    var rt = "";
    var mt = "";
    for (i = 0; i < 3; i++) mt += elm[i];
    for (i = 3; i < elm.length; i++) rt += elm[i];

    $('.ygElm').attr('href', mt + rt);
    $('.ygElm').text(rt);
    $('.ygElmPlus').attr('href', mt + rt + $('.ygElmPlus').attr('href'));
    $('.ygElmPlus').text(rt);

    $('div#sideModules> div').hide();
    $('div#sideModules> a').click(function (e) {
        $(this).siblings('a').removeClass('openModuleTitle').children('span').removeClass('openModule');
        $(this).toggleClass('openModuleTitle').children('span').toggleClass('openModule');
        $(this).next('div').slideToggle('slow').siblings('div:visible').slideUp('slow');
        e.preventDefault();
        return false;
    });
    if (window.location.href.indexOf('SearchResults.shtml') == -1) {
        $('div#sideModules> a.selected').toggleClass('openModuleTitle').children('span').toggleClass('openModule');
        $('div#sideModules> a.selected').next('div').slideDown('slow');
    }
    if (typeof (currentNav) != 'undefined') $(currentNav).addClass('current');
    if (typeof (currentSubNav) != 'undefined') $(currentSubNav).addClass('current');
    $('#tablist').css({ marginLeft: "1000px" });
    $('#tablist').animate({ marginLeft: "0px" }, 1500);

    //    if ($('#dependentFormSelectPresent')) {
    //        $("#Role").dependent({ parent: "Industry", group: "dependentFormSelect" });
    //    }

    if ($('#PaginatedSearchResults')) {
        $('#PaginatedSearchResults').dataTable({
            "sPaginationType": "full_numbers",
            "bFilter": false,
            "bSort": false,
            "iDisplayLength": 5,
            "sDom": '<"top"lp><"clear">it'
        });
    }
});

