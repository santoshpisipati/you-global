<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript">
        var currentNav = '#mainNavContactUs';
        var currentSubNav = '#rightNavIntro';
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="subheader">
        <h2>
            Contact Us</h2>
    </div>
    <div class="left_articles">
        <h3>
            Global Directory</h3>
        <div id="flaGlobaldir">
            <script type="text/javascript">// <![CDATA[
                var so = getRandomFlash2();
                so.addParam("scale", "noscale");
                so.write("flaGlobaldir");
		        // ]]>
            </script>
        </div>
    </div>
    <h4 class="articleSubtitle">
        Send us a Query</h4>
    <p>
        Please complete the form below and we will respond to your query.</p>
    <div class="formContainer">
        <div class="submitcv">
            <form onsubmit="return checkFormFields(this);" name="submitcv" action="/Contact/SendQuery.shtml"
            method="post" enctype="multipart/form-data">
            <input type="hidden" name="SubmitSource" id="SubmitSource" value="contactus" />
            <div class="contactdetails">
                <h3 class="formSectionHeaders">
                    Your details</h3>
                <div class="formMain">
                    <span class="additionaltext">* Indicates mandatory input</span>
                    <label class="formLabel" for="firstName">
                        Full Name*</label><input class="formInput" type="text" id="firstName" name="firstName"
                            value="" /><br />
                    <label class="formLabel" for="companyName">
                        Company Name*</label><input class="formInput" name="companyName" id="companyName"
                            type="text" maxlength="500" /><br />
                    <label class="formLabel" for="email">
                        Email*</label><input class="formInput" type="text" id="email" name="email" value="" /><br />
                    <label class="formLabel" for="contactNo">
                        Landline*</label><input class="formInput" name="contactNo" id="contactNo" type="text"
                            maxlength="100" /><br />
                    <label class="formLabel" for="mobileCell">
                        Mobile/Cell</label><input class="formInput" type="text" id="mobileCell" name="mobileCell"
                            value="" /><br />
                    <label class="formLabel" for="comment">
                        Comment</label>
                    <textarea rows="10" cols="25" class="formInput" name="comment" id="comment"></textarea>
                </div>
            </div>
            <div class="covernote">
                <div class="formLabel">
                    Attach Documents</div>
                <div class="subheadings">
                    <input class="formInput" type="file" name="coverLetterOptional" id="coverLetterOptional"
                        value="" />
                </div>
                <div class="formLabel">
                    &nbsp;</div>
                <div class="subheadings">
                    <span class="formInput additionaltext">(Use a compression format like WinZip to send
                        multiple documents/files to us.)</span>
                    <hr />
                </div>
            </div>
            <div class="attach">
                <div class="formLabel">
                    &nbsp;</div>
                <div class="formInput">
                    <input type="submit" class="subheadings" id="contactSubmit" value="Submit" />&nbsp;&nbsp;<input
                        type="reset" class="subheadings" value="Clear" />
                </div>
                <p>
                    &nbsp;</p>
            </div>
            </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="SkyContent" runat="server">
    <div id="navContainer">
        <div id="mainNavigation">
            <img src="/Content/images/imgs/RHS_module-1.gif" alt="" width="208" height="544"
                border="0" title="rightsideModules" />
        </div>
    </div>
</asp:Content>
