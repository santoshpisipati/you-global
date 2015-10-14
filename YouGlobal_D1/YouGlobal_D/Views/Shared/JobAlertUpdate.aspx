<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<link rel="stylesheet" type="text/css" href="../../Content/css/yg_outer.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="../../Content/themes/base/jquery.ui.base.css"
		media="screen" />
	<link rel="stylesheet" type="text/css" href="../../Content/themes/base/jquery.ui.autocomplete.css"
		media="screen" />
	<link rel="stylesheet" type="text/css" href="../../Content/themes/base/jquery.ui.theme.css"
		media="screen" />
	<%-- <link rel="stylesheet" type="text/css" href="../../Content/css/yg.css" media="screen" />--%>
	<script type="text/javascript" src="../../Scripts/jquery.1.9.1.min.js"></script>
	<script>
		var jq9 = jQuery.noConflict();
	</script>
	<script type="text/javascript" src="../../Scripts/jquery.nestedAccordion.js"></script>
	<script type="text/javascript" src="../../Scripts/expand.js"></script>
	<link rel="stylesheet" type="text/css" href="../../Content/css/pagination.css" media="screen" />
	<script type="text/javascript" src="../../Scripts/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="../../Scripts/jquery-ui-1.8.11.min.js"></script>
	<script type="text/javascript" src="../../Scripts/jquery.dependent.min.js"></script>
	<script type="text/javascript" src="../../Scripts/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="../../Scripts/jquery.unobtrusive-ajax.min.js"></script>
	<script type="text/javascript" src="../../Scripts/swfobject.js"></script>
	<script type="text/javascript" src="../../Scripts/yg.js"></script>
	<style type="text/css">
		body
		{
			background-color: White;
		}
		li
		{
			list-style: none;
		}
		.moduleIntro
		{
			font: bold 1.8em "Arial";
			color: black;
			letter-spacing: -0.05em;
		}
		.functionalModule
		{
			width: 350px;
			overflow: hidden;
			margin: 0px 0px 0px 0px;
			padding: 0px;
			background: #FFF;
			line-height: 1.2em;
			height: 100%;
			position: relative;
			display: block;
		}
		.contactdetails
		{
			background-color: #D8E4D2;
			margin: 0px 0px 2px 0px;
			padding-bottom: 5px;
			height: 100%;
		}
		/* Accordion Style */a
		{
			border: 0 solid #E0E0E0;
			color: #0055BB !important;
			padding: 1px;
		}
		a, .accordion .switch a
		{
			border-width: 0 0 1px;
			text-decoration: none;
		}
		.accordion a
		{
			border-color: #BBCCDD !important;
			border-width: 1px;
			text-decoration: none;
		}
		a:hover, a:focus, a:active
		{
			border-color: #BBCCDD !important;
			outline: 0 none;
			text-decoration: none;
		}
		
		.accordion
		{
			margin: 0; /* padding: 0 10px;*/
		}
		.accordion li
		{
			list-style-type: none;
		}
		.accordion li.last-child
		{
			list-style-type: disc;
			margin-left: 19px;
		}
		
		.accordion .outer
		{
			-moz-border-bottom-colors: none;
			-moz-border-left-colors: none;
			-moz-border-right-colors: none;
			-moz-border-top-colors: none; /*background: none repeat scroll 0 0 #FFFFFF;*/
			border-color: #BBCCDD;
			border-image: none;
			border-style: solid;
			border-width: 0 1px 1px;
		}
		.accordion .inner
		{
			margin-bottom: 0;
			overflow: hidden;
			padding: 0.5em 11px 1em;
		}
		.accordion .inner .inner
		{
			padding-bottom: 0;
		}
		.accordion .h
		{
			padding-top: 0.3em;
		}
		.accordion p
		{
			margin: 0.5em 0 1em;
		}
		.switch
		{
			margin-bottom: 0.5em;
		}
		a.trigger
		{
			background-image: url("../../content/Images/imgs/plus.gif");
			background-position: 1px 50%;
			background-repeat: no-repeat;
			display: block;
			font-weight: 700;
			padding-left: 20px;
		}
		a.trigger.open
		{
			background-image: url("../../content/Images/imgs/minus.gif");
		}
		.last-child a.trigger
		{
			background-image: none;
			font-weight: normal;
			padding-left: 1px;
		}
		#main a.trigger
		{
			background-color: #F0F0F0;
		}
		#main a.trigger.open
		{
			background-color: #E7E7E7;
			border-color: #DADADA;
		}
		#main a.trigger.open:hover, #main a.trigger.open:focus, #main a.trigger.open:active
		{
			border-color: #BBCCDD;
		}
		#main .switch a.open
		{
			background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
		}
		#side a.active
		{
			color: #FF7722;
			font-weight: 700;
			text-decoration: none;
		}
	</style>
</head>
<body id="body">
	<%
		var model = (YG_MVC.Models.JobAlertModel)Model;    
	%>
	<form onsubmit="return checkFormFields(this);" name="submitAlert" action="/Jobs/JobAlert.shtml"
	method="post" enctype="multipart/form-data">
	<div id="jobalert" class="functionalModule">
		<span class="moduleIntro">Job Alert Update</span>
		<% if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings.Get("ShowJobAlerts")))
	 { %>
		<%=Html.Hidden("IndustryNameList")%>
		<%=Html.Hidden("OccupationNameList")%>
		<%=Html.Hidden("LocationNameList")%>
		<div class="contactdetails">
			<ul class="accordion" id="acc1">
				<li>
					<h4 class="h">
						<a class="trigger" href="#">Personal Detail</a></h4>
					<div class="outer" style="display: none;">
						<div class="inner">
							<label class="subheadings" for="firstname">
								Given Name <span class="mandatoryString"><font color="red">*</font></span></label>
							<%= Html.TextBox("Name", model.Name, new { @class = "fieldQuick" })%>
							<%= Html.Hidden("JobAlertId", model.JobAlertId)%>
							<%= Html.Hidden("CandidateId", model.CandidateId)%>
							<%= Html.Hidden("CandidateGUID", model.CandidateGUID)%><br />
							<label class="subheadings" for="firstname">
								Middle Name <span class="mandatoryString"></span>
							</label>
							<%= Html.TextBox("MiddleName", string.Empty, new { @class = "fieldQuick" })%><br />
							<label class="subheadings" for="firstname">
								Family Name <span class="mandatoryString"><font color="red">*</font></span></label>
							<%= Html.TextBox("SurName", model.SurName, new { @class = "fieldQuick" })%><br />
							<label class="subheadings" for="firstname">
								Email <span class="mandatoryString"><font color="red">*</font></span></label><br />
							<%= Html.TextBox("Email", model.Email, new { @class = "fieldQuick" })%><br />
							<label class="subheadings" for="firstname">
								Contact Number <span class="mandatoryString"><font color="red">*</font></span></label><br />
							<%= Html.TextBox("PhoneCode", model.PhoneCode, new { @class = "fieldQuick",@Style="width:50px" })%>
							<%= Html.TextBox("ContactNumber", model.ContactNumber, new { @class = "fieldQuick", @Style = "width:100px" })%>
						</div>
					</div>
				</li>
				<li>
					<h4 class="h">
						<a class="trigger" href="#">Occupation</a></h4>
					<div class="outer" style="display: none;">
						<div class="inner">
							<%=  Html.ListBox("OccupationSelect", new SelectList(((DataTable)model.OccupationEditList).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "10", @class = "fieldAlerts OccupationAlert" })%>
							<div style="float: right">
								<%-- <input type="button" id="btnOccremove" value="remove" />--%>
								<img title="Remove selected" src="../../Content/images/delete.png" id="btnOccremove"
									style="display: block !important; visibility: inherit !important;" />
							</div>
							<div style="clear: both">
								<%= Html.TextBox("OccupationSearch", string.Empty, new { @class = "fieldQuick", @Style = "width:100px" })%>
								<div class="keywordText">
									<i>Begin typing to select one or more options.</i></div>
							</div>
						</div>
					</div>
				</li>
				<li>
					<h4 class="h">
						<a class="trigger" href="#">Industry</a></h4>
					<div class="outer" style="display: none;">
						<div class="inner">
							<%= Html.ListBox("IndustrySelect", new SelectList(((DataTable)model.IndustryEditList).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "10", @class = "fieldAlerts IndustryAlert" })%>
							<div style="float: right">
								<img title="Remove selected" src="../../Content/images/delete.png" id="btnIndRemove"
									style="display: block !important; visibility: inherit !important;" />
								<%-- <input type="button" id="btnIndRemove" value="remove" />--%>
							</div>
							<%= Html.TextBox("IndustrySearch", string.Empty, new { @class = "fieldQuick", @Style = "width:100px" })%>
							<div class="keywordText">
								<i>Begin typing to select one or more options.</i></div>
						</div>
					</div>
				</li>
				<li>
					<h4 class="h">
						<a class="trigger" href="#">Location of Jobs</a></h4>
					<div class="outer" style="display: none;">
						<div class="inner">
							<%= Html.ListBox("LocationSelect", new SelectList(((DataTable)model.LocationEditList).Rows as System.Collections.IEnumerable, "[0]", "[1]"), new { @multiple = "multiple", @size = "6", @class = "fieldAlerts LocationAlert" })%>
							<div style="float: right">
								<img title="Remove selected" src="../../Content/images/delete.png" id="btnLocREmove"
									style="display: block !important; visibility: inherit !important;" />
								<%-- <input type="button" id="btnIndRemove" value="remove" />--%>
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
						<a class="trigger" href="#">Job Alerts frequency</a></h4>
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
			<input type="button" name="Unsubscribe" id="Button1" value="Unsubscribe" /></div>
		<% } %>
	</div>
	</form>
</body>
</html>
<script type="text/javascript">

	$(document).ready(function () {
		$("#RemoveSelectedLocation").hide();
	});

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

	$(function () {
		$.ajax({
			url: '<%= Url.Action("GetAlertIndustry", "Jobs")%>',
			data: {
				id: $("#JobAlertId").val()
			},
			cache: false,
			success: function (data) {
				$(".IndustryAlert").html(data);

			}
		})

		$('#Button1').click(function () {
			if (confirm('Are you sure you\'d like to unsubscribe from YOU Global Job Alerts? This can\'t be undone.')) {
				var aid = $('#JobAlertId').val();
				var cid = $('#CandidateId').val();
				var cuid = $('#CandidateGUID').val();
				window.location = "../template/unsubscribe.aspx?aD=" + aid + "&cd=" + cid + "&cuid=" + cuid;
			}
		});

	});

	$('body').click(function () {
		if (sel == false)
			$('.ui-autocomplete').hide('');
		sel = false;
	});
	var readyToClose = false;
	var sel = false;

	$("#SelectAllIndustry").click(function () {

		$("#IndustrySelect").find("option").attr("selected", this.checked);
	})

	$("#SelectAllOccupation").click(function () {

		$("#OccupationSelect").find("option").attr("selected", this.checked);
	})

	$("#Subscribe").click(function () {
		$("#OccupationSelect").find("option").attr("selected", true);
		$("#IndustrySelect").find("option").attr("selected", true);
		$("#WorkTypeSelect").find("option").attr("selected", true);
		$("#LocationSelect").find("option").attr("selected", true);

		var industry = '';
		$("#IndustrySelect > option:selected").each(function () {
			industry = industry + " " + $(this).text() + "<br/>";
		});
		$("#IndustryNameList").val(industry);

		var occupation = '';
		$("#OccupationSelect > option:selected").each(function () {
			occupation = occupation + " " + $(this).text() + "<br/>";
		});
		$("#OccupationNameList").val(occupation);

		var location = '';
		$("#LocationSelect > option:selected").each(function () {
			location = location + " " + $(this).text() + "<br/>";
		});
		$("#LocationNameList").val(location);
	});

	$("#btnOccremove").click(function () {
		$("#OccupationSelect > option:selected").each(function () {
			$(this).remove();
		});
	});
	$("#btnIndRemove").click(function () {
		$("#IndustrySelect > option:selected").each(function () {
			$(this).remove();
		});
	});

	$("#btnLocREmove").click(function () {
		$("#LocationSelect > option:selected").each(function () {
			if ($(this).val().split(':')[1] == '5') {
				$("#RemoveSelectedLocation").append($('<option>').text($(this).text()).val($(this).text()));
			}
			else {
				$("#RemoveSelectedLocation").append($('<option>').text($(this).val()).val($(this).val()));
			}

			$(this).remove();
		});

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
        		var txt = $(this).val();
        		readyToClose = false;
        		var id = ui.item.value;
        		var sect = ui.item.value.split(' ')[1];
        		var code = $(ui.item.label).text();
        		//                ui.item.label = '';
        		//                ui.item.value = '';
        		var exist = 0;
        		var clength;
        		var c1;
        		var c2;

        		if (code == '- Any -') {
        			var lst = "<option selected='true' value='0'>" + code + "</option>";
        			$(".OccupationAlert").html(lst);
        			this.value = '';
        			return false;
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
        		this.value = txt;
        		return false;
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
        		var txt = $(this).val();
        		sel = true;
        		readyToClose = false;

        		var id = ui.item.value;
        		var sect = ui.item.value.split(' ')[1];
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
        			this.value = '';
        			return false;
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
        									if ($(this).text().split(' ')[1].substring(0, c1.length) == c1) {
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
        		this.value = '';
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
        		var code = $.trim($(ui.item.label).text());
        		var id = ui.item.value;
        		if ($("#LocationSelect option").length > 9) {
        			alert("You can select up to 10 Location categories. Consider wider selections, such as 'Anywhere', or 'Europe', or filter by occupation or industry instead.");
        			return;
        		}
        		if (code == "- Anywhere -") {
        			if ($("#LocationSelect option").length > 0) {
        				alert("Please delete other locations before selecting 'Anywhere'");
        				this.value = '';
        				return false;

        			}
        			var lst = "<option selected='true' value='0:1'>- Anywhere -</option>";
        			$("#LocationSelect").html(lst);
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
        				data: { countryId: nid },
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

</script>
