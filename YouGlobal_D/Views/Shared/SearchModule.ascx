<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Data" %>
<a class="moduleTitle selected" href="#"><span class="leftWhiteArrow">JOB SEARCH</span></a>
<div class="functionalModule">
    <div class="functionalModuleInner">
        <div id="searchJobsOuter">
            <img class="moduleIcons" src="/Content/images/imgs/quickSearch.gif" alt="" width="51"
                height="47" />
            <span class="moduleIntro">Search</span>
            <hr />
            <div id="searchJobs" class="subheadings1">
                <% using (Html.BeginForm("Search", "Jobs"))
                   {%>
                <%--<span class="additionaltextgray">Find jobs you are looking for here</span>--%>
                <ul class="accordion" id="acc1">
                    <li>
                        <h4 class="h">
                            <a class="trigger" href="#">Occupation<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Search_Occupation"]==null?"": ViewData["Search_Occupation"].ToString()%>"
                                onmouseover="showtip(this)" /></a></h4>
                        <div class="outer" style="display: none;">
                            <div class="inner">
                                <div id="divOccSel" style="display: none">
                                    <%= Html.ListBox("OccupationSelect", new SelectList(((DataTable)(ViewData["occupation"] == null ? new DataTable() : ViewData["occupation"])).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "5", @class = "fieldAlerts OccupationSelect" })%>
                                    <div style="float: right">
                                        <img title="Remove selected" src="../../Content/images/delete.png" id="btnOremove"
                                            style="display: block !important; visibility: inherit !important;" />
                                        <%-- <input type="button" id="btnOremove" value="remove" />--%>
                                    </div>
                                </div>
                                <%= Html.TextBox("OccupationSearch1", string.Empty, new { @class = "fieldQuick Occupation" })%>
                                <div class="keywordText">
                                    <i>Begin typing to select one or more options.</i>
                                </div>
                                <input type="hidden" id="hdf" value="0" />
                            </div>
                        </div>
                    </li>
                    <li>
                        <h4 class="h">
                            <a class="trigger" href="#">Industry<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Search_Industry"]==null?"": ViewData["Search_Industry"].ToString()%>"
                                onmouseover="showtip(this)" /></a></h4>
                        <div class="outer" style="display: none;">
                            <div class="inner">
                                <div id="divIndSel" style="display: none">
                                    <%= Html.ListBox("IndustrySelect", new SelectList(((DataTable)(ViewData["industry"] == null ? new DataTable() : ViewData["industry"])).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "5", @class = "fieldAlerts IndustrySelect" })%>
                                    <div style="float: right">
                                        <img title="Remove selected" src="../../Content/images/delete.png" id="btnIremove"
                                            style="display: block !important; visibility: inherit !important;" />
                                    </div>
                                </div>
                                <%= Html.TextBox("IndustrySearch1", string.Empty, new { @class = "fieldQuick Industry" })%>
                                <div class="keywordText">
                                    <i>Begin typing to select one or more options.</i>
                                </div>
                                <input type="hidden" id="hdfI" value="0" />
                            </div>
                        </div>
                    </li>
                    <li>
                        <h4 class="h">
                            <a class="trigger" href="#">Location<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Search_Location"]==null?"": ViewData["Search_Location"].ToString()%>"
                                onmouseover="showtip(this)" /></a></h4>
                        <div class="outer" style="display: none;">
                            <div class="inner">
                                <%= Html.TextBox("Location", string.Empty, new { @class = "fieldQuick Locations" })%>
                                <div class="keywordText">
                                    <i>Begin typing to make a selection.</i>
                                </div>
                            </div>
                            <input type="hidden" id="hdfLocation" value="0" />
                            <input type="hidden" id="hdfL" value="0" />
                        </div>
                    </li>
                    <li>
                        <h4 class="h">
                            <a class="trigger" href="#">Keyword<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Search_Keyword"]==null?"": ViewData["Search_Keyword"].ToString()%>"
                                onmouseover="showtip(this)" /></a></h4>
                        <div class="outer" style="display: none;">
                            <div class="inner">
                                <%= Html.TextBox("Keywords", string.Empty, new { @class = "fieldQuick" })%>
                                <div class="keywordText">
                                    <i>eg. "Account Manager", sales, or type in the Job Reference Code.</i>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <h4 class="h">
                            <a class="trigger" href="#">Job Type<img src="../../Content/images/info 12 pixel.png" alt="<%=ViewData["Search_JobType"]==null?"": ViewData["Search_JobType"].ToString()%>"
                                onmouseover="showtip(this)" /></a></h4>
                        <div class="outer" style="display: none;">
                            <div class="inner">
                                <%= Html.DropDownList("WorkArrangement", new SelectList(((DataTable)Session["SearchWorkTypeList"]).Rows as System.Collections.IEnumerable, "[2]", "[1]"), new { @class = "fieldAdv" })%>
                            </div>
                        </div>
                    </li>
                </ul>
                <br />
                <button id="btnFind" style="padding: 1px 0px; margin: 5px 0px 5px 0px; width: 82%;">
                    Find jobs based on above filters</button>
                <% } %>
                <br />
                <% using (Html.BeginForm("List", "Jobs"))
                   { %>
                <button style="padding: 1px 0px; margin: 5px 0px 5px 0px; width: 77%;">
                    List all jobs - no filters
                </button>
                <% } %>
                <br />
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    jq9("html").addClass("js");
    jq9(function () {

        jq9("#searchJobs").accordion({
            objID: "#acc1",
            el: ".h",
            head: "h4, h5",
            next: "div",
            initShow: "div.shown",
            standardExpansible: true,
            navigation: true,
            collapsible: true
        });
        jq9("#searchJobs").accordion({
            objID: "#acc2",
            obj: "div",
            wrapper: "div",
            el: ".h",
            head: "h4, h5",
            next: "div",
            initShow: "div.shown",
            standardExpansible: true,
            navigation: true,
            collapsible: true
        });
        //* ---
        jq9("#searchJobs .accordion").expandAll({
            trigger: ".h",
            ref: "h4.h",
            cllpsEl: "div.outer",
            speed: 200,
            oneSwitch: false,
            instantHide: true
        });

        jq9("html").removeClass("js");

        var i = 1;
        $('#searchJobs .accordion').find('li').each(function () {
            var a = $(this).find('.h a');
            var div = $(this).find('.outer');
            if (i == 1) {
                if ($(".OccupationSelect > option").length > 0) {
                    a.removeAttr('class');
                    a.attr('class', 'trigger open');
                    div.removeAttr('style');
                    div.attr('style', 'display:block');
                }
            }
            else if (i == 2) {
                if ($(".IndustrySelect > option").length > 0) {
                    a.removeAttr('class');
                    a.attr('class', 'trigger open');
                    div.removeAttr('style');
                    div.attr('style', 'display:block');
                }
            }
            else if (i == 3) {
                if ($(".Locations").val() != '') {
                    a.removeAttr('class');
                    a.attr('class', 'trigger open');
                    div.removeAttr('style');
                    div.attr('style', 'display:block');
                }
            }
            else if (i == 4) {
                if ($("#Keywords").val() != '') {
                    a.removeAttr('class');
                    a.attr('class', 'trigger open');
                    div.removeAttr('style');
                    div.attr('style', 'display:block');
                }
            }
            else if (i == 5) {
                if ($("#WorkArrangement").val() != '') {
                    a.removeAttr('class');
                    a.attr('class', 'trigger open');
                    div.removeAttr('style');
                    div.attr('style', 'display:block');
                }
            }
            i = i + 1;

        });
    });
</script>
<script type="text/javascript" language="javascript">

    var readyToClose = false;
    var sel = false;
    $('body').click(function () {
        if (sel == false)
            $('.ui-autocomplete').hide('');
        sel = false;
    });

    $("#btnFind").click(function () {

        $(".OccupationSelect").find("option").attr("selected", true);
        $(".IndustrySelect").find("option").attr("selected", true);

    });

    $('.ui - autocomplete').click(function () {
        $('.ui-autocomplete').show();
    });

    $(function () {
        //        $("#IndustrySelect").html('');
        //        $("#OccupationSelect").html('');

        if ($(".OccupationSelect > option").length == 0)
            $("#divOccSel").hide();
        else
            $("#divOccSel").show();

        if ($(".IndustrySelect > option").length == 0)
            $("#divIndSel").hide();
        else
            $("#divIndSel").show();

    });

    $("#btnOremove").click(function () {
        $(".OccupationSelect > option:selected").each(function () {
            $(this).remove();
        });
        if ($(".OccupationSelect > option").length == 0)
            $("#divOccSel").hide();
    });

    $("#btnIremove").click(function () {
        $(".IndustrySelect > option:selected").each(function () {
            $(this).remove();
        });
        if ($(".IndustrySelect > option").length == 0)
            $("#divIndSel").hide();
    });

    $('.Occupation').keyup(function (e) {
        if (e.keyCode != 9) {
            $('#hdf').val('');
            if (e.which == 27) {
                readyToClose = true;
                $('.Occupation').autocomplete('close');
            }
        }
    });
    $(".Occupation").keypress(function (e) {
        if (!e) e = window.event;

        if (e.keyCode == '27' || e.keyCode == '13') {
            readyToClose = true;
            $('.Occupation').autocomplete('close');
            return false;
        }
    });

    $('.Occupation').autocomplete(
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
            // source: '<%= Url.Action("SearchOccupation", "Jobs")%>',
            minLength: 1,
            select: function (event, ui) {
                sel = true;
                $("#divOccSel").show();
                var position = $(".Occupation").offset();
                $(".ui-autocomplete").css("top", position.top + 20);
                readyToClose = false;
                var id = ui.item.value;
                var code = $.trim($(ui.item.label).text());
                ui.item.label = '';
                ui.item.value = '';
                var exist = 0;
                var clength;
                var c1;
                var c2;
                if (code == '- Any -') {
                    var lst = "<option selected='true' value='0'>" + code + "</option>";
                    $(".OccupationSelect").html(lst);
                    return;
                }
                c1 = $.trim(id.split(' ')[1]);
                if (id != '') {
                    $(".OccupationSelect option").each(function () {

                        c2 = $.trim($(this).val().split(' ')[1]);

                        if (exist == 1) {
                            return;
                        }
                        if (c1 == c2) {
                            alert('This category is already covered by ' + $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", ""));
                            exist = 1;
                            return;
                        }

                        else {
                            if (c1.length > c2.length) {
                                if (c1.substring(0, c2.length) == c2) {
                                    alert('This category is already covered by ' + $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", ""));
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
                                    //alert('This category is already covered by ' + $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", "").trim());
                                    $(this).text(code);
                                    $(this).val(id);
                                    $(".OccupationSelect option").each(function () {
                                        if ($(this).val().split(' ')[1] != c1) {
                                            if ($(this).val().split(' ')[1].substring(0, c1.length) == c1) {
                                                $(this).remove();
                                            }
                                        }
                                    });
                                    exist = 1;
                                    return;
                                }
                            }
                        }
                        if ($(this).text() == "- Any -") {
                            $(".OccupationSelect").html('');

                        }
                    });
                }
                else {
                    exist = 1;
                }
                if (exist == 0) {

                    var lst = "<option selected='true' value='" + id + "'>" + code + "</option>";
                    $(".OccupationSelect").append(lst);
                }

                $('#hdf').val('1');

            },
            change: function (event, ui) {
                if (ui.item) {
                    return;
                }
                if ($('#hdf').val() == '') {
                    $('.Occupation').val('');
                    alert('The Occupation field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }
            }

        }).data("autocomplete").close = function (e) {
            if (readyToClose)
                clearTimeout(this.closing), this.menu.element.is(":visible") && (this.menu.element.hide(), this.menu.deactivate(), this._trigger("close", e));
            else
                return false;
        };

    $('.Occupation').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
        return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
    };

    $('.Industry').keyup(function (e) {
        if (e.keyCode != 9) {
            $('#hdfI').val('');
            if (e.which == 27) {
                readyToClose = true;
                $('.Industry').autocomplete('close');
            }
        }
    });

    $(".Industry").keypress(function (e) {
        if (!e) e = window.event;
        if (e.keyCode == '27' || e.keyCode == '13') {
            readyToClose = true;
            $('.Industry').autocomplete('close');
            return false;
        }
    });

    $('.Industry').autocomplete(
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
                $("#divIndSel").show();
                var position = $(".Industry").offset();
                $(".ui-autocomplete").css("top", position.top + 20);
                var id = ui.item.value;
                var sect = ui.item.value.split(' ')[2];
                var code = $.trim($(ui.item.label).text());
                ui.item.label = '';
                ui.item.value = '';
                var exist = 0;
                var clength;
                var c1;
                var c2;
                if (code == '- Any -') {
                    var lst = "<option selected='true' value='0'>" + code + "</option>";
                    $(".IndustrySelect").html(lst);
                    return;
                }
                c1 = $.trim(id.split(' ')[1]);
                if (id != '') {
                    $(".IndustrySelect option").each(function () {

                        c2 = $.trim($(this).val().split(' ')[1]);

                        if (exist == 1) {
                            return;
                        }
                        if (c1.length == 1) {
                            if ($(this).attr('indsection') == c1) {
                                $(".IndustrySelect option").each(function () {
                                    if ($(this).attr('indsection') == c1) {
                                        $(this).remove();
                                    }
                                });
                                var lst = "<option indsection='" + sect + "' selected='true' value='" + id + "'>" + code + "</option>";
                                $(".IndustrySelect").append(lst);
                                exist = 1;
                                return;
                            }
                        }
                        if (sect != null) {
                            if (sect == c2) {
                                alert('This category is already covered by ' + $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", ""));
                                exist = 1;
                                return;
                            }
                        }

                        if (c1 == c2) {
                            alert('This category is already covered by ' + $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", ""));
                            exist = 1;
                            return;
                        }

                        else {
                            if (c1.length > c2.length) {
                                if (c1.substring(0, c2.length) == c2) {
                                    alert('This category is already covered by ' + $(this).text().replace(">", "").replace(">", "").replace(">", "").replace(">", ""));
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
                                    $(".IndustrySelect option").each(function () {
                                        if ($(this).val().split(' ')[1] != c1) {
                                            if ($(this).val().split(' ')[1].substring(0, c1.length) == c1) {
                                                $(this).remove();
                                            }
                                        }
                                    });
                                    exist = 1;
                                    return;
                                }
                            }
                        }
                        if ($(this).text() == "- Any -") {
                            $(".IndustrySelect").html('');

                        }
                    });
                }
                else {
                    exist = 1;
                }
                if (exist == 0) {

                    var lst = "<option indsection='" + sect + "' selected='true' value='" + id + "'>" + code + "</option>";
                    $(".IndustrySelect").append(lst);
                }
                $('#hdfI').val('1');

            },
            change: function (event, ui) {

                if (ui.item) {
                    return;
                }
                if ($('#hdfI').val() == '') {
                    $('.Industry').val('');
                    alert('The Industry field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }

            }

        }).data("autocomplete").close = function (e) {
            if (readyToClose)
                clearTimeout(this.closing), this.menu.element.is(":visible") && (this.menu.element.hide(), this.menu.deactivate(), this._trigger("close", e));
            else
                return false;
        };

    $('.Industry').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
        return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
    };

    $('.Locations').keyup(function (e) {
        if (e.keyCode != 9) {
            $('#hdfL').val('');
            if (e.which == 27) {
                readyToClose = true;
                $('.Locations').autocomplete('close');
            }
        }
    });

    $(".Locations").keypress(function (e) {
        if (!e) e = window.event;
        if (e.keyCode == '27' || e.keyCode == '13') {
            readyToClose = true;
            $('.Locations').autocomplete('close');
            return false;
        }
    });

    $('.Locations').autocomplete(
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
            //source: '<%= Url.Action("SearchLocation", "Jobs")%>',
            minLength: 1,
            select: function (event, ui) {
                sel = true;
                readyToClose = false;
                var code = $.trim($(ui.item.label).text());
                //                if (code != "- Any -") {
                code = code.replace(">", "").replace(">", "").replace(">", "").replace(">", "");
                //code = code.replace(code.split(' ')[0], ' ').trim();
                ui.item.value = $.trim(code);
                //}
                $('#hdfL').val('1');
            },
            change: function (event, ui) {

                if (ui.item) {
                    return;
                }
                if ($('#hdfL').val() == '') {
                    $('.Locations').val('');
                    alert('The Location field contains invalid data. Please make a selection from the list without editing the selection you make.');
                }

            }
        });
	//        .data("autocomplete").close = function (e) {
	//            if (readyToClose)
	//                clearTimeout(this.closing), this.menu.element.is(":visible") && (this.menu.element.hide(), this.menu.deactivate(), this._trigger("close", e));
	//            else
	//                return false;
	//        };

	$('.Locations').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
	    return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
	};

	function showtip(id) {
	    var img = $(id);
	    var title = $(img).attr("alt");
	    $(img).opentip(title, { showEffect: 'blindDown', tipJoint: "top left", removeElementsOnHide: true, stem: true, target: true, tipjoint: ['center', 'top'], hideTrigger: "tip", hideTriggers: ["trigger", "tip"], showOn: "creation", hideOn: "mouseout", fixed: true, background: "rgb(234, 236, 240)", borderColor: "rgb(187, 187, 187)" });
	}
</script>