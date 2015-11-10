<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<GlobalPanda.BusinessInfo.JobDetailInfo>" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContent" runat="server">
    <%--<script src="../../Scripts/autocomplete.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        var readyToClose = false;
        $(function () {
            $(':input[data-autocomplete]').each(function () {
                $(this).autocomplete({
                    source: $(this).attr('data-autocomplete')
                });
            });
        });
        $('.LocationSearch').autocomplete(
    {
        source: function (request, response) {
            $.ajax({
                url: "/Jobs/SearchLocationWithId.shtml", dataType: "json",
                type: "POST",
                data: { term: request.term },
                success: function (data) {
                    response($.map(data, function (item) {
                        return { label: item.Value, value: item.Key };
                    }))
                }
            });
        },
        //source: '<%= Url.Action("SearchLocation", "Jobs")%>',
        minLength: 1,
        select: function (event, ui) {
            $('#LocationSearch').val('');
            sel = true;
            readyToClose = false;
            $("#divAlertLocSel").show();
            var position = $(".LocationSearch").offset();
            $(".ui-autocomplete").css("top", position.top + 20);
            var code = $.trim($(ui.item.label).text());
            var id = ui.item.value;
            if ($(".LocationAlert option").length > 9) {
                alert("You can select up to 10 Location categories. Consider wider selections, such as 'Anywhere', or 'Europe', or filter by occupation or industry instead.");
                return false;
            }
            if (code == "- Anywhere -") {
                if ($(".LocationAlert option").length > 0) {
                    alert("Please delete other locations before selecting 'Anywhere'");
                    this.value = '';
                    return false;
                }
                var lst = "<option selected='true' value='0:1'>- Anywhere -</option>";
                $(".LocationAlert").html(lst);
                $('#LocationSearch').val('');
                this.value = '';
                return false;
            }

            var c2
            var nid;
            var oid;
            var ot;
            var nt;
            var exist = 0;
            nid = id.split(':')[0];
            nt = id.split(':')[1];

            var n = nid.split(',');
            var pt = code.replace('>', '').replace('>', '').replace('>', '').replace('>', '');
            var gd = '';
            if (nt == 5) {
                $.ajax({
                    url: "/Jobs/GetLocationGroupDetails.shtml", dataType: "json",
                    type: "POST",
                    data: { groupId: nid },
                    async: false,
                    success: function (data) {
                        gd = data;
                    }
                });
            }
            var gdt = gd.split(',');
            $(".LocationAlert option").each(function () {

                if (exist == 1)
                    return;
                oid = $(this).val().split(':')[0];
                ot = $(this).val().split(':')[1];
                var o = oid.split(',');

                if (oid == nid) {
                    alert('This location is already covered by ' + $(this).text());
                    exist = 1;
                    return;
                }
                var cn = 1;
                var len = o.length > n.length ? o.length : n.length;
                for (var i = len - 1; i >= 0; i--) {
                    if (ot < nt) {
                        if (ot == 1) {
                            if (o[i] == n[i]) {
                                alert('The location you have tried to add is already covered by a parent location.');
                                exist = 1;
                                return;
                            }
                        }

                        else {
                            if (i <= nt - 2) {

                                if (o[i] == n[i] && o[i + 1] == n[i + 1]) {
                                    alert('The location you have tried to add is already covered by a parent location.');
                                    exist = 1;
                                    return;
                                }
                            }
                        }
                    }

                    else if (ot > nt) {
                        if (i >= nt - 1) {
                            if (o[i] == n[i]) {
                                alert('\"' + pt + '\" has subsidiary locations already selected. Please remove the subsidiary locations, then you can select \"' + pt + '\".');
                                exist = 1;
                                return;
                            }
                        }
                    }
                    else {
                        if (i >= nt - 1) {
                            if (o[i] == n[i]) {
                                alert('\"' + pt + '\" has subsidiary locations already selected. Please remove the subsidiary locations, then you can select \"' + pt + '\".');
                                exist = 1;
                                return;
                            }
                        }
                    }
                }
                c2 = $(this).text();
                if (code == c2) {
                    alert('This location is already exist');
                    exist = 1;
                    return;
                }

                if ($(this).text() == "- Anywhere -") {
                    $(".LocationAlert").html('');
                }
            });

            var location = '';
            if (nt == 5 && exist == 0) {

                $.ajax({
                    url: "/Jobs/GetLocationDetails.shtml",
                    dataType: "JSON",
                    type: "get",
                    data: { groupId: nid },
                    async: false,
                    success: function (data) {
                        if (data == 'True') {
                            //alert('\"' + pt + '\" has subsidiary locations already selected. Please remove the subsidiary locations, then you can select \"' + pt + '\".');
                            alert('The location you have tried to add is already selected');
                            exist = 1;
                            return false;
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + errorThrown);
                    }
                });
            }

            if (nt == 1 && exist == 0) {
                $.ajax({
                    url: "/Jobs/CheckCountryExists.shtml",
                    dataType: "JSON",
                    type: "get",
                    data: { countryId: nid, type: nt },
                    async: false,
                    success: function (data) {
                        if (data != 'false' && data != '') {
                            alert('The location you have tried to add is already covered by ' + data.split('#')[0]);
                            exist = 1;
                            return;
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + errorThrown);
                    }
                });
            }

            if (nt == 2 && exist == 0) {
                $.ajax({
                    url: "/Jobs/CheckLocationExists.shtml",
                    dataType: "JSON",
                    type: "get",
                    data: { locationId: nid, type: nt },
                    async: false,
                    success: function (data) {
                        if (data != 'false' && data != '') {
                            alert('The location you have tried to add is already covered by ' + data.split('#')[0]);
                            exist = 1;
                            return;
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + errorThrown);
                    }
                });
            }

            if (nt == 3 && exist == 0) {
                $.ajax({
                    url: "/Jobs/CheckSubLocationExists.shtml",
                    dataType: "JSON",
                    type: "get",
                    data: { sublocationId: nid, type: nt },
                    async: false,
                    success: function (data) {
                        if (data != 'false' && data != '') {
                            alert('The location you have tried to add is already covered by ' + data.split('#')[0]);
                            exist = 1;
                            return;
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + errorThrown);
                    }
                });
            }

            if (nt == 4 && exist == 0) {
                $.ajax({
                    url: "/Jobs/CheckSubSubLocationExists.shtml",
                    dataType: "JSON",
                    type: "get",
                    data: { subsublocationId: nid, type: nt },
                    async: false,
                    success: function (data) {
                        if (data != 'false' && data != '') {
                            alert('The location you have tried to add is already covered by ' + data.split('#')[0]);
                            exist = 1;
                            return;
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus); alert("Error: " + errorThrown);
                    }
                });
            }

            if (exist == 0) {
                $.ajax({
                    url: "/Jobs/AddSearchLocations.shtml",
                    dataType: "JSON",
                    type: "get",
                    data: { locationId: nid, locationType: nt },
                    async: false,
                    success: function (data) { }
                });
            }

            if (exist == 0) {
                var lst = "<option selected='true' value='" + id + "'>" + code + "</option>";
                $(".LocationAlert").append(lst);
            }
            $('#LocationSearch').val('');
            this.value = '';
            return false;
        },
        change: function (event, ui) {
            $('#LocationSearch').val('');
        }
    })
        //
        ;

        //$('#LocationSearch').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
        //    return $("<li></li>")
        //         .data("item.autocomplete", item)
        //         .append("<a>" + item.label + "</a>")
        //         .appendTo(ul);
        //};
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
    <form runat="server" method="post">
        <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
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
                        <div id="divAlertLocSel" style="display: none">
                            <%= Html.ListBox("LocationSelect", new SelectList(((System.Data.DataTable)new System.Data.DataTable()).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "6", @class = "fieldAlerts LocationAlert" })%>
                            <div style="float: right">
                                <img title="Remove selected" src="../../Content/images/delete.png" id="btnLocREmove"
                                    style="display: block !important; visibility: inherit !important;" />
                            </div>
                        </div>
                        <%= Html.ListBox("RemoveSelectedLocation", new SelectList(((System.Data.DataTable)new System.Data.DataTable()).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "6" })%>
                        <%= Html.TextBox("LocationSearch", string.Empty, new { @class = "fieldQuick LocationSearch", @Style = "width:100px" })%>
                        <div class="keywordText">
                            <i>Begin typing to select one or more options.</i>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Frequency
                    </td>
                </tr>
                <tr>
                    <td>
                        <%= Html.DropDownList("SalaryFrequency", new SelectList(((System.Data.DataTable)Session["Frequency"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.SalaryFrequency)%>
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
                        <%= Html.DropDownList("SalaryCurrency", new SelectList(((System.Data.DataTable)Session["Currencies"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv" })%>
                        <%=Html.EditorFor(m=>m.SalaryMin, new { @maxlength = "100", @class = "fieldAdv",required = "required" })%>
                        <%=Html.ValidationMessageFor(m=>m.SalaryMin)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Salary Max
                    </td>
                </tr>
                <tr>
                    <td>
                        <%= Html.DropDownList("SalaryCurrency", new SelectList(((System.Data.DataTable)Session["Currencies"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldAdv" })%>
                        <%=Html.EditorFor(m=>m.SalaryMax, new { @maxlength = "100", @class = "fieldAdv",required = "required" })%>
                        <%=Html.ValidationMessageFor(m=>m.SalaryMax)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Reference No
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.TextBox("ReferenceNo",Session["ReferenceNo"], new { @maxlength = "100", @class = "fieldAdv" })%>
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
                    <td class="registersubheadings">Bullet1
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.Bullet1, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.Bullet1)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Bullet2
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.Bullet2, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.Bullet2)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Bullet3
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.Bullet3, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.Bullet3)%>
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
                        <input type="text" name="industry" data-autocomplete="<%=Url.Action("getIndustry", "Jobs")%>" required="required" />
                        <%=Html.ValidationMessageFor(m=>m.JobIndustryId)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">JobIndustrySubId
                    </td>
                </tr>
                <tr>

                    <td>
                        <%=Html.EditorFor(m=>m.JobIndustrySubId, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.JobIndustrySubId)%>
                    </td>
                </tr>
                <tr>
                    <td class="registersubheadings">Hot Job
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=Html.EditorFor(m=>m.HotJob, new { @maxlength = "100", @class = "fieldAdv" })%>
                        <%=Html.ValidationMessageFor(m=>m.HotJob)%>
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
                            Approve
                        </button>
                        <% } %>
                    </td>
                    <td><% using (Html.BeginForm("Reset", "Jobs"))
                           { %>
                        <%= Html.AntiForgeryToken() %>
                        <%= Html.ValidationSummary(true) %>
                        <button style="padding: 1px 0px; margin: 5px 0px 5px 50px;">
                            Reset
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