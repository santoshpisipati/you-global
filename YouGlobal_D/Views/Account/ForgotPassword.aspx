<%@ Import Namespace="CaptchaMvc" %>
<%@ Import Namespace="Recaptcha" %>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<YouGlobal_D.Models.PasswordModel>" %>

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
    <% using (Html.BeginForm("ResetPassword", "Account", FormMethod.Post)) %>
    <% { %>
    <%= Html.AntiForgeryToken() %>
    <%= Html.ValidationSummary(true) %>

    <div id="register">
        <%
           var registerapply = (YouGlobal_D.Models.PasswordModel)Model;
        %>
        <h2 style="vertical-align: central; margin-top: 3%;">Reset Your Password Here</h2>

        <table style="width: 100%; vertical-align: central; margin-top: 8%;">
            <tr>
                <td class="registersubheadings">Email Id
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.TextBox("EmailId", registerapply!=null ? registerapply.EmailId :"", new { @maxlength = "100", @class = "registerQuick" })%>
                    <%=Html.ValidationMessageFor(m=>m.EmailId, "*", new { @class = "validationMessage" })%>
                </td>
            </tr>
            <%-- <tr>
                <td class="registersubheadings">Old Password
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.TextBox("OldPassword", registerapply!=null ? registerapply.OldPassword :"", new { @maxlength = "100", @class = "registerQuick"})%>
                    <%=Html.ValidationMessageFor(m=>m.OldPassword)%>
                </td>
            </tr>--%>
            <tr>
                <td class="registersubheadings">New Password
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.Password("NewPassword",  registerapply!=null ?registerapply.NewPassword :"", new { @maxlength = "10", @class = "registerQuick"})%>
                    <%=Html.ValidationMessageFor(m=>m.NewPassword, "*", new { @class = "validationMessage" })%>
                </td>
            </tr>
            <tr>
                <td class="registersubheadings">ConfirmPassword
                </td>
            </tr>
            <tr>
                <td>
                    <%=Html.Password("ConfirmPassword",  registerapply!=null ?registerapply.ConfirmPassword :"", new { @maxlength = "10", @class = "registerQuick" })%>
                    <%=Html.ValidationMessageFor(m=>m.ConfirmPassword, "*", new { @class = "validationMessage" })%>
                </td>
            </tr>
        </table>
        <div class="siteInfo">
            <input id="btnFind" class="submitbtn" type="submit" value="Reset" style="padding: 1px 0px; margin: 5px 0px 5px 0px; width: 25%;" />
        </div>
    </div>
    <% } %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SkyContent" runat="server">
</asp:Content>