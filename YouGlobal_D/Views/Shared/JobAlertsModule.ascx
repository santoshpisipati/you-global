<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Data" %>
<a class="moduleTitle" href="#"><span class="leftWhiteArrow">JOB ALERTS</span></a>
<div class="functionalModule">
	<div id="jobalert" class="functionalModuleInner">
		<div class="submitAlert">
			<img class="moduleIcons" src="/Content/images/imgs/jobAlert.gif" alt="" width="51"
				height="47" border="0" /><span class="moduleIntro">Tell Me!</span>
			<hr />
			<%--<span class="additionaltextgray">Subscribing to Job Alerts is simple and easy. Just
                quick-fill the form below and you are good to go!<br />
            </span>--%><span class="additionaltext">* Indicates mandatory input</span>
			<div class="contactdetails">
				<form onsubmit="return checkFormFields(this);" name="submitAlert" action="/Jobs/JobAlert.shtml"
				method="post" enctype="multipart/form-data">
				<div class="subheadings1">
					<% if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings.Get("ShowJobAlerts")))
		{ %>
					<%=Html.Hidden("IndustryNameList")%>
					<%=Html.Hidden("OccupationNameList")%>
					<%=Html.Hidden("LocationNameList")%>
					<ul class="accordion" id="acc1">
						<li>
							<h4 class="h">
								<a class="trigger" href="#">Personal Detail<img src="../../Content/images/info 12 pixel.png"
									alt="<%=ViewData["Alert_PersonalDetail"]==null?"": ViewData["Alert_PersonalDetail"].ToString()%>"
									onmouseover="showtip(this)" /></a></h4>
							<div class="outer" style="display: none;">
								<div class="inner">
									<label class="subheadings" for="firstname">
										Given Name <span class="mandatoryString"><font color="red">*</font></span></label>
									<%= Html.TextBox("Name", string.Empty, new { @class = "fieldQuick" })%><br />
									<label class="subheadings" for="firstname">
										Middle Name <span class="mandatoryString"></span>
									</label>
									<%= Html.TextBox("MiddleName", string.Empty, new { @class = "fieldQuick" })%><br />
									<label class="subheadings" for="firstname">
										Family Name <span class="mandatoryString"><font color="red">*</font></span></label>
									<%= Html.TextBox("SurName", string.Empty, new { @class = "fieldQuick" })%><br />
									<label class="subheadings" for="firstname">
										Email <span class="mandatoryString"><font color="red">*</font></span></label>
									<%= Html.TextBox("Email", string.Empty, new { @class = "fieldQuick" })%><br />
									<label class="subheadings" for="firstname">
										Contact Number <span class="mandatoryString"><font color="red">*</font></span></label>
									<%= Html.TextBox("PhoneCode", string.Empty, new { @class = "fieldQuick",@Style="width:50px" })%>
									<%= Html.TextBox("ContactNumber", string.Empty, new { @class = "fieldQuick", @Style = "width:100px" })%>
								</div>
							</div>
						</li>
						<li>
							<h4 class="h">
								<a class="trigger" href="#">Occupation<img src="../../Content/images/info 12 pixel.png"
									alt="<%=ViewData["Alert_Occupation"]==null?"": ViewData["Alert_Occupation"].ToString()%>"
									onmouseover="showtip(this)" /></a></h4>
							<div class="outer" style="display: none;">
								<div class="inner">
									<div id="divAlertOccSel" style="display: none">
										<%=  Html.ListBox("OccupationSelect", new SelectList((new DataTable()).Rows as System.Collections.IEnumerable, "[0]", "[2]"), new { @multiple = "multiple", @size = "10", @class = "fieldAlerts OccupationAlert" })%>
										<div style="float: right">
											<%-- <input type="button" id="btnOccremove" value="remove" />--%>
											<img title="Remove selected" src="../../Content/images/delete.png" id="btnOccremove"
												style="display: block !important; visibility: inherit !important;" />
										</div>
									</div>
									<%= Html.TextBox("OccupationSearch", string.Empty, new { @class = "fieldQuick", @Style = "width:100px" })%>
									<div class="keywordText">
										<i>Begin typing to select one or more options.</i></div>
								</div>
							</div>
						</li>
						<li>
							<h4 class="h">
								<a class="trigger" href="#">Industry<img src="../../Content/images/info 12 pixel.png"
									alt="<%=ViewData["Alert_Industry"]==null?"": ViewData["Alert_Industry"].ToString()%>"
									onmouseover="showtip(this)" /></a></h4>
							<div class="outer" style="display: none;">
								<div class="inner">
									<div id="divAlertIndSel" style="display: none">
										<%= Html.ListBox("IndustrySelect", new SelectList((new DataTable()).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "10", @class = "fieldAlerts IndustryAlert" })%>
										<div style="float: right">
											<img title="Remove selected" src="../../Content/images/delete.png" id="btnIndRemove"
												style="display: block !important; visibility: inherit !important;" />
											<%-- <input type="button" id="btnIndRemove" value="remove" />--%>
										</div>
									</div>
									<%= Html.TextBox("IndustrySearch", string.Empty, new { @class = "fieldQuick", @Style = "width:100px" })%>
									<div class="keywordText">
										<i>Begin typing to select one or more options.</i></div>
								</div>
							</div>
						</li>
						<li>
							<h4 class="h">
								<a class="trigger" href="#">Location of Jobs<img src="../../Content/images/info 12 pixel.png"
									alt="<%=ViewData["Alert_Location"]==null?"": ViewData["Alert_Location"].ToString()%>"
									onmouseover="showtip(this)" /></a></h4>
							<div class="outer" style="display: none;">
								<div class="inner">
									<div id="divAlertLocSel" style="display: none">
										<%= Html.ListBox("LocationSelect", new SelectList(((DataTable)new DataTable()).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "6", @class = "fieldAlerts LocationAlert" })%>
										<div style="float: right">
											<img title="Remove selected" src="../../Content/images/delete.png" id="btnLocREmove"
												style="display: block !important; visibility: inherit !important;" />
											<%-- <input type="button" id="btnIndRemove" value="remove" />--%>
										</div>
									</div>
									<%= Html.ListBox("RemoveSelectedLocation", new SelectList(((DataTable)new DataTable()).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "6" })%>
									<%= Html.TextBox("LocationSearch", string.Empty, new { @class = "fieldQuick LocationSearch", @Style = "width:100px" })%>
									<div class="keywordText">
										<i>Begin typing to select one or more options.</i></div>
								</div>
							</div>
						</li>
						<li>
							<h4 class="h">
								<a class="trigger" href="#">Job Alerts frequency<img src="../../Content/images/info 12 pixel.png"
									alt="<%=ViewData["Alert_Frequency"]==null?"": ViewData["Alert_Frequency"].ToString()%>"
									onmouseover="showtip(this)" /></a></h4>
							<div class="outer" style="display: none;">
								<div class="inner">
									<%= Html.DropDownList("MailFrequency", new SelectList(((DataTable)Session["FrequencyList"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new {  @class = "fieldAlerts" })%>
									<div style="display: none">
										<%= Html.ListBox("WorkTypeSelect", new SelectList(((DataTable)Session["WorkTypeList"]).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "6", @class = "fieldAlerts" })%>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<input type="submit" name="Subscribe" id="Subscribe" value="Subscribe" />
					<% } %>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	jq9("html").addClass("js");
	jq9(function () {

		jq9("#jobalert").accordion({
			objID: "#acc1",
			el: ".h",
			head: "h4, h5",
			next: "div",
			initShow: "div.shown",
			standardExpansible: true
		});
		jq9("#jobalert").accordion({
			objID: "#acc2",
			obj: "div",
			wrapper: "div",
			el: ".h",
			head: "h4, h5",
			next: "div",
			initShow: "div.shown",
			standardExpansible: true
		});
		//* ---
		jq9("#jobalert .accordion").expandAll({
			trigger: ".h",
			ref: "h4.h",
			cllpsEl: "div.outer",
			speed: 200,
			oneSwitch: false,
			instantHide: true
		});
		//--- */
		/* -----------------------  
		$("#side ul.accordion").expandAll({
		trigger: "li", 
		ref: "", 
		cllpsEl : "ul", 
		state : '',
		oneSwitch : false
		});
		------------------------ */
		jq9("html").removeClass("js");
	});

</script>
<script type="text/javascript" language="javascript">

	$(document).ready(function () {
		$("#RemoveSelectedLocation").hide();
	});

	var readyToClose = false;
	var sel = false;

	$("#SelectAllIndustry").click(function () {

		$(".IndustryAlert").find("option").attr("selected", this.checked);
	})

	$("#SelectAllOccupation").click(function () {

		$(".OccupationAlert").find("option").attr("selected", this.checked);
	})

	$("#Subscribe").click(function () {
		debugger;
		$(".OccupationAlert").find("option").attr("selected", true);
		$(".IndustryAlert").find("option").attr("selected", true);
		$("#WorkTypeSelect").find("option").attr("selected", true);
		$(".LocationAlert").find("option").attr("selected", true);
		var industry = '';
		$(".IndustryAlert > option:selected").each(function () {
			industry = industry + " " + $(this).text() + "<br/>";
		});
		$("#IndustryNameList").val(industry);

		var occupation = '';
		$(".OccupationAlert > option:selected").each(function () {
			occupation = occupation + " " + $(this).text() + "<br/>";
		});
		$("#OccupationNameList").val(occupation);

		var location = '';
		$(".LocationAlert > option:selected").each(function () {
			location = location + " " + $(this).text() + "<br/>";
		});
		$("#LocationNameList").val(location);
	});

	$("#btnOccremove").click(function () {
		$(".OccupationAlert > option:selected").each(function () {
			$(this).remove();
		});

		if ($(".OccupationAlert > option").length == 0)
			$("#divAlertOccSel").hide();
	});
	$("#btnIndRemove").click(function () {
		$(".IndustryAlert > option:selected").each(function () {
			$(this).remove();
		});

		if ($(".IndustryAlert > option").length == 0)
			$("#divAlertIndSel").hide();
	});

	$("#btnLocREmove").click(function () {
		$(".LocationAlert > option:selected").each(function () {
			if ($(this).val().split(':')[1] == '5') {
				$("#RemoveSelectedLocation").append($('<option>').text($(this).text()).val($(this).text()));
			}
			else {
				$("#RemoveSelectedLocation").append($('<option>').text($(this).val()).val($(this).val()));
			}

			$(this).remove();
		});

		if ($(".LocationAlert > option").length == 0)
			$("#divAlertLocSel").hide();

		var arr = new Array();
		$("#RemoveSelectedLocation option").each(function () {
			arr.push($(this).text());
		});

		$.ajax({
			url: "/Jobs/RemoveSelected.shtml",
			dataType: "JSON",
			type: "post",
			data: { groupName: arr },
			async: false,
			success: function (data) {

				$(arr).each(function () {
					$("#RemoveSelectedLocation option").remove(":contains(" + $(arr).val() + ")");
				});

			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus); alert("Error: " + errorThrown);
			}
		});

	});

	$('#PhoneCode').autocomplete(
        {
        	source: '<%= Url.Action("SearchCountryCode", "Jobs")%>',
        	minLength: 1,
        	select: function (event, ui) {
        		var code = ui.item.value;
        		ui.item.value = code.substring(code.indexOf('(') + 1, code.indexOf(')'));
        	}

        });

	$('#OccupationSearch').autocomplete(
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
        		$("#divAlertOccSel").show();
        		readyToClose = false;
        		var position = $("#OccupationSearch").offset();
        		$(".ui-autocomplete").css("top", position.top + 20);
        		var id = ui.item.value;
        		var sect = ui.item.value.split(' ')[2];
        		var code = $(ui.item.label).text();
        		ui.item.label = '';
        		ui.item.value = '';
        		var exist = 0;
        		var clength;
        		var c1;
        		var c2;
        		if (code == '- Any -') {
        			var lst = "<option selected='true' value='0'>" + code + "</option>";
        			$(".OccupationAlert").html(lst);
        			return;
        		}
        		if ($(".OccupationAlert option").length > 9) {
        			alert("You can select up to 10 occupational categories. Consider selecting a smaller number of higher tiers to be alerted to a greater range of vacancies.");
        			return false;
        		}
        		c1 = $.trim(id.split(' ')[1]);
        		if (id != '') {
        			$(".OccupationAlert option").each(function () {
        				c2 = $.trim($(this).val().split(' ')[1]);

        				if (exist == 1) {
        					return;
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
        							$(".OccupationAlert option").each(function () {
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
        					$(".OccupationAlert").html('');

        				}
        			});
        		}
        		else {
        			exist = 1;
        		}
        		if (exist == 0) {

        			var lst = "<option selected='true' value='" + id + "'>" + code + "</option>";
        			$(".OccupationAlert").append(lst);
        		}

        		$('#hdf').val('1');

        	},
        	change: function (event, ui) {
        		if (ui.item) {
        			return;
        		}
        		if ($('#hdf').val() == '') {
        			$('#OccupationSearch').val('');
        			alert('The Occupation field contains invalid data. Please make a selection from the list without editing the selection you make.');
        		}
        	}

        }).data("autocomplete").close = function (e) {
        	if (readyToClose)
        		clearTimeout(this.closing), this.menu.element.is(":visible") && (this.menu.element.hide(), this.menu.deactivate(), this._trigger("close", e));
        	else
        		return false;
        };

	$('#OccupationSearch').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
		return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
	};

	$('#IndustrySearch').autocomplete(
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
        		$("#divAlertIndSel").show();
        		var position = $("#IndustrySearch").offset();
        		$(".ui-autocomplete").css("top", position.top + 20);
        		var id = ui.item.value;
        		var sect = ui.item.value.split(' ')[2];
        		var code = $.trim($(ui.item.label).text());
        		//                ui.item.label = '';
        		//                ui.item.value = '';
        		var exist = 0;
        		var clength;
        		var c1;
        		var c2;


        		if (code == '- Any -') {
        			var lst = "<option selected='true' value='0'>" + code + "</option>";
        			$(".IndustryAlert").html(lst);
        			return;
        		}

        		if ($(".IndustryAlert option").length > 9) {
        			alert("You can select up to 10 industry categories. Consider selecting a smaller number of higher tiers to be alerted to a greater range of vacancies.");
        			return false;
        		}

        		c1 = $.trim(id.split(' ')[1]);
        		if (id != '') {
        			$(".IndustryAlert option").each(function () {

        				c2 = $.trim($(this).val().split(' ')[1]);

        				if (exist == 1) {
        					return;
        				}
        				if (c1.length == 1) {
        					if ($(this).attr('indsection') == c1) {
        						$(".IndustryAlert option").each(function () {
        							if ($(this).attr('indsection') == c1) {
        								$(this).remove();
        							}
        						});
        						var lst = "<option indsection='" + sect + "' selected='true' value='" + id + "'>" + code + "</option>";
        						$(".IndustryAlert").append(lst);
        						exist = 1;
        						return;
        					}
        				}
        				if (c1 == c2) {
        					alert('You have already selected ' + $(this).text());
        					exist = 1;
        					return;
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
        							$(".IndustryAlert option").each(function () {

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
        					$(".IndustryAlert").html('');

        				}
        			});
        		}
        		else {
        			exist = 1;
        		}
        		if (exist == 0) {

        			var lst = "<option indsection='" + sect + "' selected='true' value='" + id + "'>" + code + "</option>";
        			$(".IndustryAlert").append(lst);
        		}
        		$('#hdf').val('1');
        		return false;
        	},
        	change: function (event, ui) {

        		if (ui.item) {
        			return;
        		}
        		if ($('#hdf').val() == '') {
        			$('#IndustrySearch').val('');
        			alert('The Industry field contains invalid data. Please make a selection from the list without editing the selection you make.');
        		}


        	}

        }).data("autocomplete").close = function (e) {
        	$('#IndustrySearch').val('');
        	if (readyToClose)
        		clearTimeout(this.closing), this.menu.element.is(":visible") && (this.menu.element.hide(), this.menu.deactivate(), this._trigger("close", e));
        	else
        		return false;
        };

	$('#IndustrySearch').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
		return $("<li></li>")
             .data("item.autocomplete", item)
             .append("<a>" + item.label + "</a>")
             .appendTo(ul);
	};

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

        			//        			else {
        			//        				alert(nt);
        			//        				if (nt == 5) {
        			//        					alert('This location is not covered');
        			//        				}
        			//        			}


        			//                    //Group start
        			//                    if (gd != '') {
        			//                        for (var l = 0; l < gdt.length; l++) {
        			//                            var g = gdt[l].split(':')[0].split(',');
        			//                            var gt = gdt[l].split(':')[1];
        			//                            var len = o.length > g.length ? o.length : g.length;
        			//                            for (var i = len - 1; i >= 0; i--) {
        			//                                if (ot < gt) {
        			//                                    if (ot == 1) {
        			//                                        if (o[i] == g[i]) {
        			//                                            alert('The location you have tried to add is already covered by a parent location.');
        			//                                            exist = 1;
        			//                                            return;
        			//                                        }
        			//                                    }
        			//                                    else {
        			//                                        if (i <= gt - 2) {

        			//                                            if (o[i] == g[i] && o[i + 1] == g[i + 1]) {
        			//                                                alert('The location you have tried to add is already covered by a parent location.');
        			//                                                exist = 1;
        			//                                                return;
        			//                                            }
        			//                                        }
        			//                                    }
        			//                                }
        			//                                else if (ot > gt) {
        			//                                    if (i >= gt - 1) {
        			//                                        if (o[i] == g[i]) {
        			//                                            alert('\"' + pt + '\" has subsidiary locations already selected. Please remove the subsidiary locations, then you can select \"' + pt + '\".');
        			//                                            exist = 1;
        			//                                            return;
        			//                                        }
        			//                                    }
        			//                                }
        			//                                else {
        			//                                    if (i >= nt - 1) {
        			//                                        if (o[i] == g[i]) {
        			//                                            alert('\"' + pt + '\" has subsidiary locations already selected. Please remove the subsidiary locations, then you can select \"' + pt + '\".');
        			//                                            exist = 1;
        			//                                            return;
        			//                                        }
        			//                                    }
        			//                                }
        			//                            }
        			//                        }
        			//                    }
        			//                    //Group end

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
        				//                        // Group start
        				//                        else if (ot == 5) {
        				//                            $.ajax({
        				//                                url: "/Jobs/GetLocationGroupDetails.shtml", dataType: "json",
        				//                                type: "POST",
        				//                                data: { groupId: oid },
        				//                                async: false,
        				//                                success: function (data) {
        				//                                    gd = data;
        				//                                    //Group start
        				//                                    if (gd != '') {
        				//                                        for (var l = 0; l < gdt.length; l++) {
        				//                                            var g = gdt[l].split(':')[0].split(',');
        				//                                            var gt = gdt[l].split(':')[1];
        				//                                            var len = o.length > g.length ? o.length : g.length;
        				//                                            for (var i = len - 1; i >= 0; i--) {
        				//                                                if (ot < gt) {
        				//                                                    if (ot == 1) {
        				//                                                        if (o[i] == g[i]) {
        				//                                                            alert('The location you have tried to add is already covered by ' + $(this).text() + '.');
        				//                                                            exist = 1;
        				//                                                            return;
        				//                                                        }
        				//                                                    }
        				//                                                    else {
        				//                                                        if (i <= gt - 2) {

        				//                                                            if (o[i] == g[i] && o[i + 1] == g[i + 1]) {
        				//                                                                alert('The location you have tried to add is already covered by ' + $(this).text() + '.');
        				//                                                                exist = 1;
        				//                                                                return;
        				//                                                            }
        				//                                                        }
        				//                                                    }
        				//                                                }
        				//                                                else if (ot > gt) {
        				//                                                    if (i >= gt - 1) {
        				//                                                        if (o[i] == g[i]) {
        				//                                                            alert('\"' + pt + '\" has subsidiary locations already selected. Please remove the subsidiary locations, then you can select \"' + pt + '\".');
        				//                                                            exist = 1;
        				//                                                            return;
        				//                                                        }
        				//                                                    }
        				//                                                }
        				//                                                else {
        				//                                                    if (i >= nt - 1) {
        				//                                                        if (o[i] == g[i]) {
        				//                                                            alert('\"' + pt + '\" has subsidiary locations already selected. Please remove the subsidiary locations, then you can select \"' + pt + '\".');
        				//                                                            exist = 1;
        				//                                                            return;
        				//                                                        }
        				//                                                    }
        				//                                                }
        				//                                            }
        				//                                        }
        				//                                    }
        				//                                    //Group end
        				// }
        				//});

        				//}
        				//Group end
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
        }).data("autocomplete").close = function (e) {
        	$('#LocationSearch').val('');
        	if (readyToClose)
        		clearTimeout(this.closing), this.menu.element.is(":visible") && (this.menu.element.hide(), this.menu.deactivate(), this._trigger("close", e));
        	else
        		return false;
        };

	$('#LocationSearch').autocomplete().data("autocomplete")._renderItem = function (ul, item) {
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
