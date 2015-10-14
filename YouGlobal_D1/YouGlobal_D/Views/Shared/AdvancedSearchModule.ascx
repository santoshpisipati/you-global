<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Data" %>
<div id="dependentFormSelectPresent" class="bodyFeaturedList">
    <table width="440">
        <tr>
            <td>
                <p class="topText">
                    <i>View our current vacancies by entering your job search criteria in the fields below.
                        If you have a job reference number, please type into the Keyword search field. If
                        you would like to discuss your requirements further please contact us and we will
                        assist you as soon as we can.</i><br />
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <p class="starText">
                    <i>* Job role shows <b>only</b> if you select an industry.</i><br />
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <hr />
            </td>
        </tr>
    </table>
    <% using (Html.BeginForm("Search", "Jobs"))
       { %>
    <table width="440">
        <tr>
            <td colspan="2">
                <label for="Role" class="subheadingsQuick">
                    Occupation</label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="divOccSelA" style="display: none">
                    <%= Html.ListBox("OccupationSelect", new SelectList((new DataTable()).Rows as System.Collections.IEnumerable, "[0]", "[2]"), new { @multiple = "multiple", @size = "5", @class = "fieldAlerts OccupationSelectA" })%>
                    <div style="width: 200px; float: right">
                        <img title="Remove selected" src="../../Content/images/delete.png" id="btnOremoveA"
                            style="display: block !important; visibility: inherit !important;" />
                    </div>
                </div>
                <%= Html.TextBox("Occupation", string.Empty, new { @class = "fieldQuick OccupationA" })%>
                <input type="hidden" id="hdf3" value="0" />
            </td>
        </tr>
        <tr>
            <td>
                <label for="Industry" class="subheadingsQuick">
                    Industry</label>
            </td>
            <td>
                <label for="Role" class="subheadingsQuick">
                    * Job Role</label>
            </td>
        </tr>
        <tr>
            <td>
                <div id="divIndSelA" style="display: none;">
                    <%= Html.ListBox("IndustrySelect", new SelectList((new DataTable()).Rows as System.Collections.IEnumerable, "[0]", "[2]"), new { @multiple = "multiple", @size = "5", @class = "fieldAlerts IndustrySelectA" })%>
                    <div style="float: right">
                        <img title="Remove selected" src="../../Content/images/delete.png" id="btnIremoveA"
                            style="display: block !important; visibility: inherit !important;" />
                    </div>
                </div>
                <%= Html.TextBox("Industry", string.Empty, new { @class = "fieldQuick IndustryA" })%>
            </td>
            <td style="vertical-align: top;">
                <select class="dependentFormSelect fieldAdv" id="Role" name="Role">
                    <option selected="selected" value="">-- Any --</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label for="Location" class="subheadingsQuick">
                    Location</label>
            </td>
            <td>
                <label for="WorkArrangement" class="subheadingsQuick">
                    Job Type</label>
            </td>
        </tr>
        <tr>
            <td>
                <%--<%= Html.DropDownList("Location", new SelectList(((DataTable)Session["SearchLocationList"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @class = "fieldQuick" })%>--%>
                <%= Html.TextBox("Location", string.Empty, new { @class = "fieldQuick LocationA" })%>
            </td>
            <td>
                <%= Html.DropDownList("WorkArrangement", new SelectList(((DataTable)Session["SearchWorkTypeList"]).Rows as System.Collections.IEnumerable, "[2]", "[1]"), new { @class = "fieldAdv" })%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <label for="Keywords" class="subheadingsQuick">
                    Keywords</label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <%= Html.TextBox("Keywords", string.Empty, new { @class = "keyAdv" })%>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <%--<%= Html.SubmitButton("FindJobs", "Find Jobs", new { @class = "subheadingsQuick", style="width: 160px;" })%>--%>
                <input type="submit" id="btnFindA" value="Find Jobs" name="FindJobs" class="subheadingsQuick"
                    style="width: 160px;" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
    </table>
    <% } %>
    <% using (Html.BeginForm("List", "Jobs"))
       { %>
    <table width="410">
        <tr>
            <td colspan="2" align="center">
                <%--<%= Html.SubmitButton("ListAllJobs", "List All Jobs", new { @class = "subheadingsQuick", style="width: 160px;" })%>--%>
                <input type="submit" value="List All Jobs" name="ListAllJobs" class="subheadingsQuick"
                    style="width: 160px;" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <br />
            </td>
        </tr>
    </table>
    <% } %>
</div>
<script type="text/javascript" language="javascript">
    var readyToClose = false; var sel = false;

    $(function () {
        $("#OccupationSelect").html('');
        $(".OccupationSelectA").html('');
    });

    $("#btnFindA").click(function () {
        $(".OccupationSelectA").find("option").attr("selected", true);
        $(".IndustrySelectA").find("option").attr("selected", true);
    });


    $("#btnOremoveA").click(function () {
        $(".OccupationSelectA > option:selected").each(function () {
            $(this).remove();
        });

        //        if ($(".OccupationSelectA li").length == 0)
        //            $("#divOccSelA").hide();
    });

    $("#btnIremoveA").click(function () {
        $(".IndustrySelectA > option:selected").each(function () {
            $(this).remove();
        });
        //        if ($(".IndustrySelectA li").length == 0)
        //            $("#divIndSelA").hide();
    });
    $(document).ready(function () {
        $.ajax({
            url: '<%= Url.Action("GetRole", "Jobs")%>',
            data: {
                classification: $("#Industry").val()
            },
            cache: false,
            success: function (data) {

                $("#Role").html(data);
            }
        })
    });
    $(".IndustryA").change(function () {
        $.ajax({
            url: '<%= Url.Action("GetRole", "Jobs")%>',
            data: {
                classification: $(this).val()
            },
            cache: false,
            success: function (data) {

                $("#Role").html(data);
            }
        })
    })

    $('.OccupationA').keyup(function (e) {
        if (e.keyCode != 9) {
            $('#hdf3').val('');
            if (e.which == 27) {
                readyToClose = true;
                $('.OccupationA').autocomplete('close');
            }
        }
    });
    $(".OccupationA").keypress(function (e) {
        if (!e) e = window.event;
        if (e.keyCode == '27') {
            readyToClose = true;
            $('.OccupationA').autocomplete('close');
            return false;
        }
    });

    $('.OccupationA').autocomplete(
        {
            source: function (request, response) {
                $.ajax({
                    url: "/Jobs/SearchOccupationWithany.shtml", dataType: "json",
                    type: "POST",
                    data: { term: request.term },
                    success: function (data) {
                        response($.map(data, function (item) {
                            return { label: item.Value, value: item.Key };
                        }))
                    }
                });
            },
            minLength: 1,
            select: function (event, ui) {
                sel = true;
                readyToClose = false;
                $("#divOccSelA").show();
                var position = $(".OccupationA").offset();
                $(".ui-autocomplete").css("top", position.top + 20);
                var id = ui.item.value;
                var code = ui.item.label;
                ui.item.label = '';
                ui.item.value = '';
                var exist = 0;
                var clength;
                var c1;
                var c2;
                if (code == '- All -') {
                    var lst = "<option selected='true' value='0'>" + code + "</option>";
                    $(".OccupationSelectA").html(lst);
                    return;
                }
                c1 = code.split(' ')[1].trim();
                $(".OccupationSelectA option").each(function () {
                    c2 = $(this).text().split(' ')[1].trim();
                    if (exist == 1) {
                        return;
                    }
                    if (c1 == c2) {
                        alert('This category is already covered by ' + $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", "").trim());
                        exist = 1;
                        return;
                    }

                    else {
                        if (c1.length > c2.length) {
                            if (c1.substring(0, c2.length) == c2) {
                                alert('This category is already covered by ' + $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", "").trim());
                                exist = 1;
                                return;
                            }
                        }
                        else if (c1.length == 0) {
                            alert('This category is already exist');
                            exist = 1;
                            return;
                        }
                        else {
                            if (c2.substring(0, c1.length) == c1) {

                                $(this).text(code);
                                $(this).val(id);
                                exist = 1;
                                return;
                            }
                        }
                    }
                    if ($(this).text() == "- All -") {
                        $(".OccupationSelectA").html('');

                    }
                });
                if (exist == 0) {

                    var lst = "<option selected='true' value='" + id + "'>" + code + "</option>";
                    $(".OccupationSelectA").append(lst);
                }

                $('#hdf3').val('1');

            },
            change: function (event, ui) {
                if (ui.item) {
                    return;
                }
                if ($('#hdf3').val() == '') {
                    $('.OccupationA').val('');
                    alert('The Occupation field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }
            }

        }).data("autocomplete").close = function (e) {
            if (readyToClose)
                clearTimeout(this.closing), this.menu.element.is(":visible") && (this.menu.element.hide(), this.menu.deactivate(), this._trigger("close", e));
            else
                return false;
        };

    $('.OccupationA').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
        return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
    };

    $('.IndustryA').keyup(function (e) {
        if (e.keyCode != 9) {
            $('#hdf3').val('');
            if (e.which == 27) {
                readyToClose = true;
                $('.IndustryA').autocomplete('close');
            }
        }
    });

    $(".IndustryA").keypress(function (e) {
        if (!e) e = window.event;
        if (e.keyCode == '27') {
            readyToClose = true;
            $('.IndustryA').autocomplete('close');
            return false;
        }
    });

    $('.IndustryA').autocomplete(
        {
            source: function (request, response) {
                $.ajax({
                    url: "/Jobs/SearchIndustryWithAny.shtml", dataType: "json",
                    type: "POST",
                    data: { term: request.term },
                    success: function (data) {
                        response($.map(data, function (item) {
                            return { label: item.Value, value: item.Key };
                        }))
                    }
                });
            },
            minLength: 1,
            select: function (event, ui) {
                sel = true;
                readyToClose = false;
                $("#divIndSelA").show();
                var position = $(".IndustryA").offset();
                $(".ui-autocomplete").css("top", position.top + 20);
                var id = ui.item.value.split(' ')[0]; ;
                var sect = ui.item.value.split(' ')[1];
                var code = ui.item.label;

                var exist = 0;
                var clength;
                var c1;
                var c2;
                if (code == '- All -') {
                    var lst = "<option selected='true' value='0'>" + code + "</option>";
                    $(".IndustrySelectA").html(lst);
                    return;
                }

                c1 = code.replace(">", "").replace(">", "").replace(">", "").replace(">", "").trim().split(' ')[0];
                $(".IndustrySelectA option").each(function () {

                    c2 = $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", "").trim().split(' ')[0];
                    if (exist == 1) {

                        return;
                    }
                    if (sect != null) {
                        if (sect == c2) {
                            alert('This category is already covered by ' + $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", "").trim());
                            exist = 1;
                            return;
                        }
                    }
                    if (c1 == c2) {
                        alert('This category is already covered by ' + $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", "").trim());
                        exist = 1;
                        return;
                    }

                    else {
                        if (c1.length > c2.length) {
                            if (c1.substring(0, c2.length) == c2) {
                                alert('This category is already covered by ' + $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", "").trim());
                                exist = 1;
                                return;
                            }
                        }
                        else if (c1.length == 0) {
                            alert('This category is already exist');
                            exist = 1;
                            return;
                        }
                        else {
                            if (c2.substring(0, c1.length) == c1) {

                                $(this).text(code);
                                $(this).val(c1);
                                exist = 1;
                                return;
                            }
                        }
                    }
                    if ($(this).text() == "- All -") {
                        $(".IndustrySelectA").html('');

                    }
                });
                if (exist == 0) {

                    var lst = "<option selected='true' value='" + id + "'>" + code + "</option>";
                    $(".IndustrySelectA").append(lst);
                }
                ui.item.label = '';
                ui.item.value = '';
                $('#hdf3').val('1');

            },
            change: function (event, ui) {

                if (ui.item) {
                    return;
                }
                if ($('#hdf3').val() == '') {
                    $('.IndustryA').val('');
                    alert('The Industry field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }


            }

        }).data("autocomplete").close = function (e) {
            if (readyToClose)
                clearTimeout(this.closing), this.menu.element.is(":visible") && (this.menu.element.hide(), this.menu.deactivate(), this._trigger("close", e));
            else
                return false;
        };

    $('.IndustryA').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
        return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
    };

    $('.LocationA').autocomplete(
        {
            source: function (request, response) {
                $.ajax({
                    url: "/Jobs/SearchLocation.shtml", dataType: "json",
                    type: "POST",
                    data: { term: request.term },
                    success: function (data) {
                        response($.map(data, function (item) {
                            return { label: item.Value, value: item.Key };
                        }))
                    }
                });
            },
            minLength: 1,
            select: function (event, ui) {
                var code = ui.item.value;
                if (code != "- Any -") {
                    code = code.replace(">", "").replace(">", "").replace(">", "").replace(">", "").trim();
                    //code = code.replace(code.split(' ')[0], ' ').trim();
                    ui.item.value = code;
                }
                // $('#hdf').val('1');
            },
            change: function (event, ui) {

            }
        });
    $('.LocationA').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
        return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
    };
</script>
