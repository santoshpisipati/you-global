<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Sky.master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="subheader">
        <h2>
            Email Sending Failure</h2>
    </div>
    <div class="left_articles_noBorder">
        <%--<p>
            Application has been created successfully. But there is a problem in sending confirmation E-Mail.</p>--%>

			<p>Thank you, your application or CV Upload has been received. A system problem <br /> 
			is preventing us from sending you a confirmation via email.</p>
			<p>This problem has been automatically reported, however to help identify and solve <br />
			the problem, it would also be helpful if you could please email us a screen shot <br />
			of this message, together with details of your browser and operating system <br />
			versions, to admin@you-global.com. Or click on the feedback icon on the previous page</p>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SkyContent" runat="server">
</asp:Content>
