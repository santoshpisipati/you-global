<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%
    var model = (YG_MVC.Models.ConsultantModel)Model;    
%>
<link href="../../Content/css/jquery.mCustomScrollbar.css" rel="Stylesheet" />
<script src="../../Scripts/jquery.1.9.1.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
<script type="text/javascript" language="javascript">
    function iconmouseover(content, over) {
        $(content).hide();
        $(over).show();
        $(over).attr("style", "border: 1px solid #CCCC00; width:80%; color:#71CBE4; background-color:#E2E9DF; display: inline-block;");
    }

    function iconmouseout(content, over) {
        $(content).show();
        $(over).hide();
    }
</script>
<div id="contact" style="clear: both; height: 288px; width: 214px; margin-top: 48px;
    font-family: 'Microsoft Sans Serif'; font-size: 10px;">
    <div style="padding-left: 10px;word-wrap: break-word;margin-top:5px; ">
        <b>
            <%=Html.DisplayFor(m => model.Fullname)%></b><br />
        <span style="font-style: italic">
            <%=Html.DisplayFor(m => model.Designation)%></span>
    </div>
    <div style="padding-left: 10px; padding-top: 30px;word-wrap: break-word;">
        <%=Html.Raw(model.Address)%>
    </div>
    <div style="padding-top: 60px;word-wrap: break-word;">
        <div>
            <img src="../../Content/images/consultant/phone_icon.jpg" style="padding-bottom: 2px;
                vertical-align: middle;" onmouseover="iconmouseover('#phonecontent','#phoneover')"
                onmouseout="iconmouseout('#phonecontent','#phoneover')" />
            <span id="phonecontent">
                <%=Html.DisplayFor(m => model.Landline)%></span> <span id="phoneover" style="display: none">
                    LANDLINE</span>
        </div>
        <div style="word-wrap: break-word; ">
            <img src="../../Content/images/consultant/mobile_icon.jpg" style="padding-bottom: 2px;
                vertical-align: middle;" onmouseover="iconmouseover('#mobilecontent','#mobileover')"
                onmouseout="iconmouseout('#mobilecontent','#mobileover')" />
            <span id="mobilecontent">
                <%=Html.DisplayFor(m => model.Mobile)%></span> <span id="mobileover" style="display: none">
                    MOBILE</span>
        </div>
        <div style="word-wrap: break-word; ">
            <img src="../../Content/images/consultant/print_icon.jpg" style="padding-bottom: 2px;
                vertical-align: middle;" onmouseover="iconmouseover('#faxcontent','#faxover')"
                onmouseout="iconmouseout('#faxcontent','#faxover')" />
            <span id="faxcontent">
                <%=Html.DisplayFor(m => model.Fax)%></span> <span id="faxover" style="display: none">
                    FAX</span>
        </div>
        <div style="word-wrap: break-word;">
            <img src="../../Content/images/consultant/mail_icon.jpg" style="padding-bottom: 2px;
                vertical-align: middle;" onmouseover="iconmouseover('#emailcontent','#emailover')"
                onmouseout="iconmouseout('#emailcontent','#emailover')" />
            <span id="emailcontent">
                <%=Html.DisplayFor(m => model.Email)%></span> <span id="emailover" style="display: none">
                    EMAIL</span>
        </div>
        <div style="word-wrap: break-word; ">
            <img src="../../Content/images/consultant/skype_icon.jpg" style="padding-bottom: 2px;
                vertical-align: middle;" onmouseover="iconmouseover('#skypecontent','#skypeover')"
                onmouseout="iconmouseout('#skypecontent','#skypeover')" />
            <span id="skypecontent">
                <%=Html.DisplayFor(m => model.Skpe)%></span> <span id="skypeover" style="display: none">
                    SKYPE</span>
        </div>
    </div>
</div>
<div id="viewprofile" style="clear: both; height: 288px; width: 217px; margin-top: 48px; margin-right:10px;
    font-family: 'Microsoft Sans Serif'; font-size: 11px;word-wrap: break-word; ">
    <div id="profileimg">
        <%=Html.Raw(model.ImagePath)%>
    </div>
    <span>
        <%=Html.DisplayFor(m=>model.Profile) %></span>
    <br />
    <br />
    <span style="color: #086894; font-weight: bold">Geographic Familiarity: </span>
    <%=Html.DisplayFor(m=>model.Geographic) %>
    <br />
    <br />
    <span style="color: #086894; font-weight: bold">Languages: </span>
    <%=Html.DisplayFor(m=>model.Language) %>
    <br />
    <br />
    <span style="color: #086894; font-weight: bold">Industry Specialisation: </span>
    <%=Html.DisplayFor(m=>model.Industry) %>
    <br />
    <br />
    <span style="color: #086894; font-weight: bold">Formal Qualifications: </span>
    <%=Html.DisplayFor(m=>model.Qualification) %>
</div>
