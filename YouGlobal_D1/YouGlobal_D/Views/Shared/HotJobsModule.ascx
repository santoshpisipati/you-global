<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<a class="moduleTitle" href="#"><span class="leftWhiteArrow">FEATURED JOBS</span></a>
<div class="functionalModule">
    <div class="functionalModuleInner">
        <img class="moduleIcons" src="/Content/images/imgs/featuredJobs.gif" alt="" width="51"
            height="47" border="0" />
        <span class="moduleIntro">Hot Jobs!</span>
        <hr />
        <%--<span class="additionaltextgray">Check out some of our Featured jobs.</span> --%><span
            class="additionaltextgray">(Mouse over the headlines below to see a quick summary)</span>
        <br />
        <div class="bodyFeaturedList">
            <table class="tables">
                <%
                    var jobPostings = Model as IEnumerable<YG_Business.JobInfo>;
                    if (jobPostings != null && jobPostings.Count() > 0)
                    {
                        foreach (var jobPosting in jobPostings)
                        {
                            Html.RenderPartial("HotJobItem", jobPosting);
                        }
                    }
                    else
                    { %>
                <tr>
                    <td>
                        Unfortunately, there are no hot jobs at this moment. Please try again in a few moments.
                    </td>
                </tr>
                <%  } %>
            </table>
        </div>
    </div>
</div>
