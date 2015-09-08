<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<GlobalPanda.BusinessInfo.JobDetailInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContent" runat="server">
    <script src="../../Scripts/autocomplete.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $(':input[data-autocomplete]').each(function () {
                $(this).autocomplete({
                    source: $(this).attr('data-autocomplete')
                });
            });
        });
    </script>
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
    <form method="post">
        <div id="register">
            <%
                var registerapply = (GlobalPanda.BusinessInfo.JobDetailInfo)Model;
            %>
            <h2 style="vertical-align: central; margin-top: 3%;">Post Job Here</h2>

            <table style="width: 100%; vertical-align: central; margin-top: 8%;">
                <tr>
                    <td class="registersubheadings">JobEdit Id
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.JobEditId, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.JobEditId)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Job Id
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.JobId, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.JobId)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Location Id
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="q" data-autocomplete="<%=Url.Action("getLocation", "Jobs")%>" required />
                        <%=Html.ValidationMessageFor(m=>m.LocationId)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Type Id
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.TypeId, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.TypeId)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Salary Min
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.SalaryMin, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.SalaryMin)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Salary Max
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.SalaryMax, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.SalaryMax)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Reference No
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.ReferenceNo, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.ReferenceNo)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Title
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.Title, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.Title)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">SubHeading
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.SubHeading, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.SubHeading)%>
                    </td>
                </tr>

                <tr>
                    <td class="registersubheadings">Search Title
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.SearchTitle, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.SearchTitle)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Summary
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.Summary, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.Summary)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">JobContent
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.JobContent, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.JobContent)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">WebsiteURL
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.WebsiteURL, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.WebsiteURL)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">AdFooter
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.AdFooter, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.AdFooter)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">IsResidency
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.IsResidency, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.IsResidency)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Status
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.Status, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.Status)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">IsApprove
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.IsApprove, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.IsApprove)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">ClientId
                    </td>
                </tr>
                <tr>
                    <td>
                        <%= Html.DropDownList("ClientId", new SelectList(((System.Data.DataTable)Session["ActiveClients"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.ClientId)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">JobIndustryId
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="industry" data-autocomplete="<%=Url.Action("getIndustry", "Jobs")%>" required />
                        <%=Html.ValidationMessageFor(m=>m.JobIndustryId)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">JobIndustry SubId
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.JobIndustrySubId, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.JobIndustrySubId)%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.HotJob, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.HotJob)%>
                    </td>
                    <td class="registersubheadings">Hot Job
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
                        <% using (Html.BeginForm("PostJob", "Jobs"))
                           { %>
                        <%= Html.AntiForgeryToken() %>
                        <%= Html.ValidationSummary(true) %>
                        <button style="padding: 1px 0px; margin: 5px 0px 5px 50px;">
                            Post Job
                        </button>
                        <% } %>
                    </td>
                    <td><% using (Html.BeginForm("SaveDraft", "Jobs"))
                           { %>
                        <%= Html.AntiForgeryToken() %>
                        <%= Html.ValidationSummary(true) %>
                        <button style="padding: 1px 0px; margin: 5px 0px 5px 50px;">
                            Save Draft
                        </button>
                        <% } %>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SkyContent" runat="server">
</asp:Content>