<%@ Import Namespace="CaptchaMvc" %>
<%@ Import Namespace="Recaptcha" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<YouGlobal_D.Models.RegisterModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContent" runat="server">
    <style type="text/css">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="homePara">
        YOU Global are recruitment specialists, servicing all industries and all locations
                            around the world. Our innovative and dynamic approach helps both companies and individuals
                            navigate the complex and rapidly changing recruitment landscape.
                            <%= Html.ActionLink("Read more...", "AboutUs", "Home", null, new { @class = "title" })%>
    </div>
    <div id="register">
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
                    <%=Html.TextBox("firstname", registerapply!=null ? registerapply.FirstName :"", new { @maxlength = "100", @class = "registerQuick" })%>
                    <%=Html.ValidationMessageFor(m=>m.FirstName)%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Last Name
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.TextBox("lastname", registerapply!=null ? registerapply.LastName :"", new { @maxlength = "100", @class = "registerQuick"})%>
                    <%=Html.ValidationMessageFor(m=>m.LastName)%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Email Id
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.TextBox("Email",  registerapply!=null ?registerapply.Email :"", new { @maxlength = "100", @class = "registerQuick"})%>
                    <%=Html.ValidationMessageFor(m=>m.Email)%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Password
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.Password("password",  registerapply!=null ?registerapply.Password :"", new { @maxlength = "10", @class = "registerQuick" })%>
                    <%=Html.ValidationMessageFor(m=>m.Password)%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Confirm Password
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.Password("confirmpassword",  registerapply!=null ?registerapply.ConfirmPassword :"", new { @maxlength = "10", @class = "registerQuick"})%>
                    <%=Html.ValidationMessageFor(m=>m.ConfirmPassword)%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Phone Number
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.TextBox("phonenumber",  registerapply!=null ?registerapply.PhoneNumber :"", new { @maxlength = "10", @class = "registerQuick"})%>
                    <%=Html.ValidationMessageFor(m=>m.PhoneNumber)%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">Register As <%=Html.DropDownListFor(m => m.RegisterAs, new List<SelectListItem>{ new SelectListItem { Text = "Member", Value = "1", Selected = true }, new SelectListItem { Text = "Consultant", Value = "2" } })%>
                </td>
            </tr>
        </table>
        <div class="editor-field">
            <%=Html.Raw(Html.GenerateCaptcha("captcha", "clean"))%>
            <%=Html.ValidationMessage("captcha")%>
        </div>
        <div class="siteInfo">
            <% using (Html.BeginForm("Register", "Account"))
               { %>
            <%= Html.AntiForgeryToken() %>
            <%= Html.ValidationSummary(true) %>
            <button style="padding: 1px 0px; margin: 5px 0px 5px 50px;">
                Register
            </button>
            <% } %>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SkyContent" runat="server">
</asp:Content>