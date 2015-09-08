<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="bodySearchRes">
	<table border="0" width="440" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<table border="0" width="440" cellspacing="0" cellpadding="0">
					<tr>
					    <td colspan="2" class="title" align="left" height="27">Requested job description is no longer available</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><hr /></td>
		</tr>
		<tr>
			<td class="bullets">
			    <br />
			    <p>This could be because:</p>
				<ul style="margin-top:7; margin-bottom:7; padding-left: 40px;" >
					<li>The job posting no longer exists or has been removed</li>
					<li>The URL might have been mistyped or is based on an old bookmark</li>
					<li>There is an unforeseen problem in the search criteria or results</li>
				</ul>
				<br />
			</td>
		</tr>
		<tr>
			<td><hr /></td>
		</tr>
		<tr>
			<td>
			    <br />
			    <p>Please try the following:</p>
			    <ul style="margin-top:7; margin-bottom:7; padding-left: 40px;" >
				    <li>Check the URL if you have entered it manually or copied from an email</li>
    				<li>Please <b><%=Html.ActionLink("try the search again", "LookingForWork", "Work")%></b> if you got here from the Search Results page</li>
    				<li>Please <b><%=Html.ActionLink("contact us", "ContactUs", "Contact")%></b> if the problem persists</li>
			    </ul>
			    <br />
			</td>
		</tr>
		<tr>
			<td><br /></td>
		</tr>
		<tr>
			<td><p>Thank you for your patience and apologies for any inconvenience</p></td>
		</tr>
		<tr>
			<td><br /></td>
		</tr>
		<tr>
			<td><hr /></td>
		</tr>
	</table>
</div>