<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavWork';
        var currentSubNav = '#rightNavWork';
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="leftInner">
        <div class="functionalModule" style="width: 100%">
            <div class="functionalModuleInner" style="width: 95%">
                <div class="submitAlert">
                    <img class="moduleIcons" src="/Content/images/imgs/jobAlert.gif" alt="" width="51"
                        height="47" border="0" /><span class="moduleIntro">Tell Me!</span>
                    <hr />
                    <span class="additionaltextgray">Subscribing to Job Alerts is simple and easy. Just
                        quick-fill the form below and you are good to go!<br />
                    </span><span class="additionaltext">* Indicates mandatory input</span>
                    <div class="contactdetails">
                        <form onsubmit="return checkFormFields(this);" name="submitAlert" action="/Jobs/JobAlert.shtml"
                        method="post" enctype="multipart/form-data">
                        <div class="subheadings1">
                            <% if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings.Get("ShowJobAlerts")))
                               { %>
                            <table cellpadding="0" cellspacing="0" border="0">
                                <!-- cellpadding="0" cellspacing="0" -->
                                <tbody>
                                    <tr>
                                        <td class="subheadings" width="100" id="firstName_label">
                                            Given Name <span class="mandatoryString"><font color="red">*</font></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%= Html.TextBox("Name", string.Empty, new { @class = "fieldQuick" })%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings" id="surname_label">
                                            Family Name <span class="mandatoryString"><font color="red">*</font></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%= Html.TextBox("SurName", string.Empty, new { @class = "fieldQuick" })%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings" id="emailAddress_label">
                                            Email <span class="mandatoryString"><font color="red">*</font></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%= Html.TextBox("Email", string.Empty, new { @class = "fieldQuick" })%>
                                        </td>
                                    </tr>
                                    <!--  affinity address fields -->
                                    <!--  END affinity address fileds -->
                                    <tr>
                                        <td class="subheadings" id="phone_label">
                                            Contact Number <span class="mandatoryString"><font color="red">*</font></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%= Html.TextBox("PhoneCode", string.Empty, new { @class = "fieldQuick",@Style="width:50px" })%>
                                            <%= Html.TextBox("ContactNumber", string.Empty, new { @class = "fieldQuick", @Style = "width:100px" })%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings" id="industry_label">
                                            Industry <font color="red">*</font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%= Html.TextBox("IndustrySearch", string.Empty, new { @class = "fieldQuick", @Style = "width:100px" })%>
                                            <font size="1">(Type here to filter.)</font>
                                            <%= Html.ListBox("IndustrySelect", new SelectList(((DataTable)Session["ClassificationList"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "10", @class = "fieldAlerts" })%>
                                            <div style="float: right">
                                                <font size="1">Select All </font>
                                                <%= Html.CheckBox("SelectAll") %></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <font size="1">(To select multiple options hold down the ctrl key.)</font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings" id="location_label">
                                            Location <font color="red">*</font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%= Html.ListBox("LocationSelect", new SelectList(((DataTable)Session["LocationList"]).Rows as System.Collections.IEnumerable, "[2]", "[1]"), new { @multiple = "multiple", @size = "6", @class = "fieldAlerts" })%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings" valign="top" id="workType_label">
                                            Work type <font color="red">*</font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <td class="body" valign="top">
                                                            <%= Html.ListBox("WorkTypeSelect", new SelectList(((DataTable)Session["WorkTypeList"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "6", @class = "fieldAlerts" })%>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings" valign="top" id="notice_period_label">
                                            Job mail frequency<font color="red">*</font>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <%= Html.DropDownList("MailFrequency", new SelectList(((DataTable)Session["FrequencyList"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new {  @class = "fieldAlerts" })%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="subheadings">
                                            <input type="submit" name="Subscribe" id="Subscribe" value="Subscribe" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <% } %>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" language="javascript">

        $("#SelectAll").click(function () {

            $("#IndustrySelect").find("option").attr("selected", this.checked);
        })
        $(function () {
            $("#IndustrySearch").keyup(function () {
                $.ajax({
                    url: '<%= Url.Action("GetClassification", "Jobs")%>',
                    data: {
                        classification: $("#IndustrySearch").val()
                    },
                    cache: false,
                    success: function (data) {

                        $("#IndustrySelect").html(data);
                    }
                })
            })
        });
        $('#PhoneCode').autocomplete(
        {
            source: '<%= Url.Action("SearchCountryCode", "Jobs")%>',

            minLength: 1,
            select: function (event, ui) {

                var code = ui.item.value;
                //                console.debug(ui.item.value);
                ui.item.value = code.substring(code.indexOf('(') + 1, code.indexOf(')'));
                //                $('#PhoneCode').val(code.substring(code.indexOf('(') + 1, code.indexOf(')')));
                //                $('#PhoneCode').text(code.substring(code.indexOf('(') + 1, code.indexOf(')')));

            }

        })
  

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
