<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobAlertEdit.aspx.cs" Inherits="www_Template_JobAlertEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
                                    <%= Html.ListBox("IndustrySelect", new SelectList(((System.Data.DataTable)Session["ClassificationList"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "10", @class = "fieldAlerts" })%>
                                    <div style="float:right">
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
                                    <%= Html.ListBox("LocationSelect", new SelectList(((System.Data.DataTable)Session["LocationList"]).Rows as System.Collections.IEnumerable, "[2]", "[1]"), new { @multiple = "multiple", @size = "6", @class = "fieldAlerts" })%>
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
                                                    <%= Html.ListBox("WorkTypeSelect", new SelectList(((System.Data.DataTable)Session["WorkTypeList"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "6", @class = "fieldAlerts" })%>
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
                                    <%= Html.DropDownList("MailFrequency", new SelectList(((System.Data.DataTable)Session["FrequencyList"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new {  @class = "fieldAlerts" })%>
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
</body>
</html>
