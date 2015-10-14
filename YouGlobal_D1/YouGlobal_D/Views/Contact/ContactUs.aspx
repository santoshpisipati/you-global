<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavContactUs';
        var currentSubNav = '#rightNavIntro';
    </script>
    <style type="text/css">
    
.location{ width:417px; height:370px; background: url(../Content/images/consultant/bg.jpg) no-repeat;}
.location h1 { font-family:Arial; padding:5px; font-size:13px;}

.dropdown{ width:180px; height:300px; margin-left:5px; margin-top:10px; float:left;}
.details { width:210px; height:300px; float:left; margin-left:7px;}
.viewphoto { top:140px; position:absolute;}
.viewdefaultphoto { top:165; position:absolute;}

.menu { width:210px; height:32px;font-family:Arial; float:left; text-align:center; font-weight:normal; margin-top:7px;}
.menu ul{ list-style-type:none; margin:0px; margin-top:13px; *margin-top:0px; padding:0px; margin-left:0px;}
.menu li{ font-size:12px;float:left; margin:0px 0px; text-align:center;list-style:none !important;margin-left:0px !important; }

/*.menu a{ color:#FFF; text-decoration:none; padding:4px 2px; margin:0 2px; text-align:center; }
.menu a:hover{color:#000; text-decoration:underline; padding:4px 2px; text-decoration:none; background:#DDE7DC; background-color:#DDE7DC}
.menu_active{text-decoration:none; padding:4px 10px; background:#FFF; color:#90B190; font-weight:bold; }*/

.menu a{ color:#FFF; text-decoration:none; padding:4px 2px; margin:0 2px; border-top-left-radius:5px; border-top-right-radius:5px;}
.menu a:hover{color:#333; text-decoration:underline; padding:4px 2px; text-decoration:none; background:#d0ddce; border-top-left-radius:5px; border-top-right-radius:5px; }
.menu_active{text-decoration:none; padding:4px 10px; background:#FFF; color:#89a682; border-top-left-radius:5px; border-top-right-radius:5px; }
.menu_active:hover{text-decoration:none; padding:4px 10px; background:#dce6db; color:#333; border-top-left-radius:5px; border-top-right-radius:5px;  }

    </style>
    <script src="../../Scripts/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        function getConsultantDetails(id) {
            $("#progress").show();
            $("#profileimg").show();
            $.ajax({
                url: '<%=Url.Action("ConsutantProfile") %>' + '?consultantid=' + id,
                data: {},

                type: "POST",
                error: function () {
                    alert("An error occurred.");
                    $("#progress").hide();
                },
                success: function (data) {
                    $("#profile").html(data);
                    $("#contact").mCustomScrollbar({
                        autoHideScrollbar: false,
                        scrollButtons: {
                            enable: true
                        },
                        theme: "dark-thick"
                    });
                    $("#viewprofile").mCustomScrollbar({
                        autoHideScrollbar: false,
                        scrollButtons: {
                            enable: true
                        },
                        theme: "dark-thick"
                    });

                    $("#viewprofile").hide();
                    $("#imgconsultant").removeAttr('src');
                    $("#imgconsultant").show();
                    $("#imgconsultant").attr("src", $("#thumb").attr("src"));
                    $("#profileimg").hide();
                    $("#lnkcontact").children("span").attr("class", "menu_active");
                    $("#lnkProfile").children("span").removeAttr("class");

                    $("#progress").hide();
                }
            });

        }

        function getConsultants(id, type, cid) {
            $.ajax({
                url: '<%=Url.Action("Consultants") %>' + '?locationid=' + id + '&locationtype=' + type + '&countryid=' + cid,
                data: {},
                dataType: "json",
                type: "POST",
                error: function () {
                    alert("An error occurred.");
                },
                success: function (data) {
                    var items = "";
                    $.each(data, function (i, item) {
                        items += "<option value=\"" + item.Value + "\">" + item.Text + "</option>";
                    });
                    if (data.length > 0) {
                        $("#Consultants").show();
                    }
                    else
                        $("#Consultants").hide();
                    $("#Consultants").html(items);
                }
            });
        }
        function getCities(id) {

            $.ajax({
                url: '<%=Url.Action("Locations") %>' + '?countryid=' + id,
                data: {},
                dataType: "json",
                type: "POST",
                error: function () {
                    alert("An error occurred.");
                },
                success: function (data) {
                    var items = "";
                    $.each(data, function (i, item) {
                        items += "<option value=\"" + item.Value + "\">" + item.Text + "</option>";
                    });
                    if (data.length > 0) {
                        if (data.length == 1) {
                            getConsultants(data[0].Value, 2, id);
                           // $("#Location").hide();
                        }

                        else {
                           // $("#Location").show();
                        }
                    }
                    else {
                        //$("#Location").hide();
                        getConsultants(id, 1, id);
                    }
                   // $("#Location").html(items);
                }
            });
        }

        $(document).ready(function () {
            //$("#Location").hide();
            $("#Consultants").hide();
            $("#viewprofile").hide();
            $("#imgconsultant").hide();
            $("#progress").hide();

            $("#ConsultantLocation").change(function () {
                $("#Consultants").hide();
                var abbr = $("#ConsultantLocation").val();
                getCities(abbr);
            });

//            $("#Location").change(function () {
//                var abbr = $("#Location").val();
//                var cid = $("#ConsultantLocation").val();
//                getConsultants(abbr, 2, cid);

//            });

            $("#Consultants").change(function () {
                var abbr = $("#Consultants").val();

                getConsultantDetails(abbr);

            });

            $("#lnkcontact").click(function () {
                $("#viewprofile").hide();
                $("#contact").show();

                $(this).children("span").attr("class", "menu_active");
                $("#lnkProfile").children("span").removeAttr("class");
                $("#lnkProfile").children("span").removeAttr("style");
            });

            $("#lnkProfile").click(function () {

                $("#viewprofile").show();
                $("#contact").hide();

                $(this).children("span").attr("class", "menu_active");
                $(this).children("span").attr("style", "padding:4px 25px");
                $("#lnkcontact").children("span").removeAttr("class");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subheader">
        <h2>
            Contact Us</h2>
    </div>
    <div class="left_articles">
        <h3>
            Global Directory</h3>
        <div id="flaGlobaldir">
            <script type="text/javascript">// <![CDATA[
                var so = getRandomFlash2();
                so.addParam("scale", "noscale");
                so.write("flaGlobaldir");
		        // ]]>
            </script>
        </div>
    </div>
    <h4 class="articleSubtitle">
        Send us a Query</h4>
    <p>
        Please complete the form below and we will respond to your query.</p>
    <div class="formContainer">
        <div class="submitcv">
            <form onsubmit="return checkFormFields(this);" name="submitcv" action="/Contact/SendQuery.shtml"
            method="post" enctype="multipart/form-data">
            <input type="hidden" name="SubmitSource" id="SubmitSource" value="contactus" />
            <div class="contactdetails">
                <h3 class="formSectionHeaders">
                    Your details</h3>
                <div class="formMain">
                    <span class="additionaltext">* Indicates mandatory input</span>
                    <label class="formLabel" for="firstName">
                        Full Name*</label><input class="formInput" type="text" id="firstName" name="firstName"
                            value="" /><br />
                    <label class="formLabel" for="companyName">
                        Company Name*</label><input class="formInput" name="companyName" id="companyName"
                            type="text" maxlength="500" /><br />
                    <label class="formLabel" for="email">
                        Email*</label><input class="formInput" type="text" id="email" name="email" value="" /><br />
                    <label class="formLabel" for="contactNo">
                        Landline*</label><input class="formInput" name="contactNo" id="contactNo" type="text"
                            maxlength="100" /><br />
                    <label class="formLabel" for="mobileCell">
                        Mobile/Cell</label><input class="formInput" type="text" id="mobileCell" name="mobileCell"
                            value="" /><br />
                    <label class="formLabel" for="comment">
                        Comment</label>
                    <textarea rows="10" cols="25" class="formInput" name="comment" id="comment"></textarea>
                </div>
            </div>
            <div class="covernote">
                <div class="formLabel">
                    Attach Documents</div>
                <div class="subheadings">
                    <input class="formInput" type="file" name="coverLetterOptional" id="coverLetterOptional"
                        value="" />
                </div>
                <div class="formLabel">
                    &nbsp;</div>
                <div class="subheadings">
                    <span class="formInput additionaltext">(Use a compression format like WinZip to send
                        multiple documents/files to us.)</span>
                    <hr />
                </div>
            </div>
            <div class="attach">
                <div class="formLabel">
                    &nbsp;</div>
                <div class="formInput">
                    <input type="submit" class="subheadings" id="contactSubmit" value="Submit" />&nbsp;&nbsp;<input
                        type="reset" class="subheadings" value="Clear" />
                </div>
                <p>
                    &nbsp;</p>
            </div>
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SkyContent" runat="server">
    <div id="navContainer">
        <div id="mainNavigation">
            <img src="/Content/images/imgs/RHS_module-1.gif" alt="" width="208" height="544"
                border="0" title="rightsideModules" />
        </div>
    </div>
</asp:Content>
