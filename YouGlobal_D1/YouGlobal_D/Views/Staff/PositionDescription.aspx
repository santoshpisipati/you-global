<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavStaff';
        var currentSubNav = '#rightNavPosition';
    </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subheader">
        <h2>
            Position Description</h2>
    </div>
    <div class="left_articles_noBorder">
        <h4 class="articleSubtitle">
            Why is it important?</h4>
        <p>
        </p>
        <p>
            A position description is a formal document that summarises the important functions
            of a specific job, using clear and concise language. It should accurately represent
            actual duties and responsibilities as well as job specifications. It is critical
            for us to become thoroughly familiar with the position. With equal employment opportunity
            laws clearly in mind and before the search for applicants begins, the needs and
            responsibilities of the position need to be clearly outlined in a position description.</p>
        <p>
            A position description that is current, comprehensive, and concise is an important
            tool to be used at various stages of the employment process. Some of those stages
            are:</p>
        <ul>
            <li>recruitment and posting</li>
            <li>interviewing and selection</li>
            <li>employee orientation</li>
            <li>training and development</li>
            <li>performance evaluation</li>
            <li>promotion and transfer</li>
            <li>disciplinary actions</li>
            <li>salary administration</li>
            <li>position classification</li>
            <li>identifying essential functions</li>
        </ul>
        <br />
        <h4 class="articleSubtitle">
            What Should Be Included In A Position Description</h4>
        <ul>
            <li>Position title and position number. </li>
            <li>Position's status (regular, temporary) and full-time equivalent rate.</li>
            <li>Agency and location of position.</li>
            <li>Name of supervisor.</li>
            <li>Compensation information.</li>
            <li>Status under the Fair Labour Standards Act (exempt, non-exempt).</li>
            <li>Purpose of position.</li>
            <li>Narrative description of the position.</li>
            <li>List of essential duties and responsibilities in order of importance and distinguished
                as essential (include frequency, extent of authority, and independent judgement).</li>
            <li>List of non-essential duties and responsibilities and distinguished as non-essential.</li>
            <li>Other duties that may be required or assigned. (These will be marginal duties.)</li>
            <li>Minimum requirements for satisfactory performance-detailed knowledge and skill,
                and physical and mental ability requirements. Include any tests or certifications
                required.</li>
            <li>Preferred qualifications for the position.</li>
            <li>Extent of authority and reporting relationships.</li>
            <li>Features of working conditions (e.g. travel, unusual work hours, environmental conditions,
                etc.)</li>
            <li>Equipment and machinery used.</li>
            <li>Date of review.</li>
        </ul>
        <br />
        <p>
            The position description should be reviewed carefully to ensure that the content
            is directly relevant to the position and isn't discriminatory under any laws. For
            example, task statements should describe what the tasks are and not how they are
            customarily performed. Minimum qualifications should include detailed statements
            on knowledge and skills required in addition to a certain level of education or
            work experience.</p>
        <p>
            So that position descriptions can withstand possible legal challenge, they should
            be reviewed on a regular basis and updated or rewritten as necessary. A timely reminder
            to review position descriptions might be the annual performance review of an individual.</p>
        <p>
            Taking the above pointers into consideration has proved to be hugely success to
            find recruits with matching skills and abilities.</p>
        <br />
        <h4 class="articleSubtitle">
            Position Analysis</h4>
        <p>
            Position analysis is a procedure by which positions are studied, with the aim of
            determining the duties and responsibilities of the position and the knowledge, skills,
            and abilities necessary to successfully perform them. The end result is a new or
            revised position description.</p>
        <p>
            Position analysis requires a thorough familiarisation with the job to learn as much
            as possible. Start with the following steps:</p>
        <ul>
            <li>Spend time with the incumbent at the job site, observing and conversing while the
                incumbent performs various tasks. If the position is vacant, gather information
                about the position from other sources, such as previous position descriptions, co-workers,
                etc.</li>
            <li>Identify specific position activities, work behaviours or other attributes required
                for satisfactory performance.</li>
            <li>Determine the reporting relationships-in terms of both supervision exercised and
                received.</li>
            <li>Observe the work environment as to physical working conditions, travel required,
                schedules (shifts), etc.</li>
            <li>Gather and document as much information as possible.</li>
        </ul>
        <p>
        </p>
        <p>
            <strong>Next, analyse the information to:</strong></p>
        <ul>
            <li>Determine the type and amount of education and work experience that will prepare
                someone to do the work.</li>
            <li>Determine measurable skills and credentials (e.g., a certain typing standard or
                licensure) that are required.</li>
            <li>Identify intangible criteria that is required or helpful in successful performance
                of the job, e.g., interpersonal skill, initiative, creativity, self-confidence,
                etc. The intangible job-related criteria can be used to help make the final decision
                between applicants who are quite similarly qualified.</li>
        </ul>
        <p>
        </p>
        <p>
            Once information is gathered and documented, it can be used to prepare a complete
            and precise position description or to update an existing description</p>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SkyContent" runat="server">
    <div id="navContainer">
        <div id="mainNavigation">
            <div class="mainMenu">
                <%= Html.ActionLink("Position Description", "PositionDescription", "Staff", null, new { id = "rightNavPosition", @class = "menuItem" })%>
            </div>
            <img class="pad20" src="/Content/images/imgs/RHS_module-3.gif" alt="" width="208"
                height="544" border="0" title="rightsideModules" />
        </div>
    </div>
</asp:Content>
