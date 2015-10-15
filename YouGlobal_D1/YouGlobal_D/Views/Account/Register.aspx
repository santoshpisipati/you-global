<%@ Import Namespace="CaptchaMvc" %>
<%@ Import Namespace="Recaptcha" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<YouGlobal_D.Models.RegisterModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContent" runat="server">
    <style type="text/css">
        .msg {
            display: none;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }

        .registersubheadings {
            font: bold 15px "Arial";
            padding: 1px 0px;
            column-span: all;
            color: #2079B4;
        }

        .registerQuick {
            border: 1px solid #CCCCCC !important;
            color: #2079B4;
            font-family: Arial,Helvetica,sans-serif;
            /*font-size: 10px;
            margin: 15px 0 0 0;*/
            width: 300px;
        }

        .siteInfo {
            text-align: center;
        }

        .submitbtn {
            display: inline-block;
            padding: 10px;
            border-radius: 15px;
            border: 1px solid transparent;
        }

        input.watermark {
            color: #999;
        }
    </style>
    <script type="text/javascript">
        function onlyAlphabets(e, t) {
            try {
                if (window.event) {
                    var charCode = window.event.keyCode;
                }
                else if (e) {
                    var charCode = e.which;
                }
                else { return true; }
                if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode == 32) || (charCode == 45) || (charCode == 8) || (charCode == 9) || (charCode == 46) || (charCode == 189))
                    return true;
                else
                    return false;
            }
            catch (err) {
                alert(err.Description);
            }
        }

        function validateEmailId(email) {
            var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            if (expr.test(email)) {
                mesg.innerHTML = "";
                return true;
            }
            else {
                mesg.style.color = "red";
                mesg.innerHTML = "Please provide a valid email address";
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="homePara">
        YOU Global are recruitment specialists, servicing all industries and all locations
                            around the world. Our innovative and dynamic approach helps both companies and individuals
                            navigate the complex and rapidly changing recruitment landscape.
                            <%= Html.ActionLink("Read more...", "AboutUs", "Home", null, new { @class = "title" })%>
    </div>
    <div id="register">
        <% using (Html.BeginForm("Register", "Account"))
           { %>
        <%= Html.AntiForgeryToken() %>
        <%= Html.ValidationSummary(true) %>
        <%
               var registerapply = (YouGlobal_D.Models.RegisterModel)Model;
        %>
        <h2 style="vertical-align: central; margin-top: 3%;">Register Here </h2>
        <table style="width: 100%; vertical-align: central; margin-top: 8%;">
            <tr>
                <td class="registersubheadings">First Name
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.TextBox("FirstName", registerapply!=null ? registerapply.FirstName :"", new { @maxlength = "100", @class = "registerQuick", onkeydown="return onlyAlphabets(event,this);"  })%>
                    <%=Html.ValidationMessageFor(m=>m.FirstName, "*", new { @class = "validationMessage" })%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Last Name
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.TextBox("LastName", registerapply!=null ? registerapply.LastName :"", new { @maxlength = "100", @class = "registerQuick", onkeydown="return onlyAlphabets(event,this);"})%>
                    <%=Html.ValidationMessageFor(m=>m.LastName, "*", new { @class = "validationMessage" })%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Email Address
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.TextBox("Email",  registerapply!=null ?registerapply.Email :"", new { @maxlength = "100", @class = "registerQuick",onblur="validateEmailId(this.value)"})%>
                    <%=Html.ValidationMessageFor(m=>m.Email, "*", new { @class = "validationMessage" })%>
                    <span id="mesg" style="font-size: small; position: relative;"></span>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Password
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.Password("Password",  registerapply!=null ?registerapply.Password :"", new { @maxlength = "10", @class = "registerQuick" })%>
                    <%=Html.ValidationMessageFor(m=>m.Password, "*", new { @class = "validationMessage" })%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Confirm Password
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.Password("ConfirmPassword",  registerapply!=null ?registerapply.ConfirmPassword :"", new { @maxlength = "10", @class = "registerQuick"})%>
                    <%=Html.ValidationMessageFor(m=>m.ConfirmPassword, "*", new { @class = "validationMessage" })%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Country Code
                </td>
            </tr>
            <tr>
                <td>
                    <%= Html.DropDownList("PhoneCode", new SelectList(((System.Data.DataTable)Session["PhoneCodes"]).Rows as System.Collections.IEnumerable, "[0]", "[0]"), new { @class = "fieldAdv" })%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Phone Number
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.TextBox("phonenumber",  registerapply!=null ?registerapply.PhoneNumber :"", new { @maxlength = "10", @class = "registerQuick"})%>
                    <%=Html.ValidationMessageFor(m=>m.PhoneNumber, "*", new { @class = "validationMessage" })%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Register As <%=Html.DropDownListFor(m => m.RegisterAs, new List<SelectListItem>{ new SelectListItem { Text = "Jobseeker", Value = "1", Selected = true },
                                                                                                       new SelectListItem { Text = "Employer", Value = "2" },
                                                                                                       new SelectListItem { Text = "Recruitment consultant", Value = "3" },})%>
                </td>
            </tr>
        </table>
        <div class="editor-field">
            <%=Html.Raw(Html.GenerateCaptcha("captcha", "clean"))%>
            <%=Html.ValidationMessage("captcha")%>
        </div>
        <div class="siteInfo">

            <button style="padding: 1px 0px; margin: 5px 0px 5px 50px;">
                Register
            </button>
            <% } %>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SkyContent" runat="server">
</asp:Content>