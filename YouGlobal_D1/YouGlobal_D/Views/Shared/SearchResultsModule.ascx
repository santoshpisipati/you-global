<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<%
    var jobPostings = Model as IEnumerable<YG_Business.JobInfo>;
%>
<div id="rowTable">
    <div class="subheader">
        <h3>
            Search Results</h3>
    </div>
</div>
<div id="rowTable" class="example_alt_pagination">
    <table border="0" width="420" cellspacing="0" cellpadding="0" class="tables">
        <tr>
            <td width="100%" align="right" class="subheadings">
                <div class="publishedDate">
                    Date Listed</div>
            </td>
        </tr>
    </table>
    <table id="PaginatedSearchResults" border="0" width="420" cellspacing="0" cellpadding="0"
        class="tables">
        <thead>
            <tr>
                <th>
                    &nbsp;
                </th>
            </tr>
        </thead>
        <tbody>
        <%if (jobPostings != null)
          {
              foreach (var jobPosting in jobPostings)
              {
                  Html.RenderPartial("SearchResultItem", jobPosting);
              }
          } %>
        </tbody>
    </table>
</div>
