<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Sky.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CommissionCalculator._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="SkyContent">
    YOU Global - Commission Calculator
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        table {
            /*border: 0.1px solid black;*/
            text-align: center;
            margin-top: 20px;
        }

        .seconddiv {
            /*float: left;*/
        }

        .converter {
            text-align: center;
        }
    </style>
    <asp:Panel runat="server" HorizontalAlign="Center" ID="converter">
        <asp:Label runat="server" Font-Size="12" Text="AED / USD exchange rate :"></asp:Label>
        <asp:Label runat="server" ID="lblconvrate" Font-Size="12" Text=""></asp:Label>
    </asp:Panel>
    <form runat="server">
        <asp:ScriptManager runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel runat="server" Visible="false">
                    <asp:Table runat="server" Width="100%" GridLines="None" ID="tbl1">
                        <asp:TableRow>
                            <asp:TableHeaderCell HorizontalAlign="Center">Plan 1 Monthly</asp:TableHeaderCell>
                            <asp:TableHeaderCell ColumnSpan="3" HorizontalAlign="Center">Quaterly Billing Band</asp:TableHeaderCell>
                            <asp:TableHeaderCell HorizontalAlign="Center">Licensee Commission</asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">50</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">&nbsp
                            </asp:TableCell>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                <asp:Label Text="USD 0" runat="server" ID="c5"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label Text="USD 16,338" runat="server" ID="d5"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label Text="50%" runat="server" ID="e5"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                <asp:Label Text="USD 16,338" runat="server" ID="c6"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label Text="USD 54,459" runat="server" ID="d6"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label Text="80%" runat="server" ID="e6"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right" ColumnSpan="2">
                                <asp:Label Text="USD 54,459" runat="server" ID="c7"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label Text="90%" runat="server" ID="e7"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">Consistency bonus
                            </asp:TableCell>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label Text="20%" runat="server" ID="e8"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Table runat="server" Width="100%" GridLines="None" ID="tbl2">
                        <asp:TableRow>
                            <asp:TableHeaderCell HorizontalAlign="Center">Plan 2 Monthly</asp:TableHeaderCell>
                            <asp:TableHeaderCell ColumnSpan="3" HorizontalAlign="Center">Quaterly Billing Band</asp:TableHeaderCell>
                            <asp:TableHeaderCell HorizontalAlign="Center">Licensee Commission</asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">500</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">&nbsp</asp:TableCell>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                <asp:Label Text="USD 0" runat="server" ID="c12"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label Text="USD 16,338" runat="server" ID="d12"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label Text="90%" runat="server" ID="e12"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                <asp:Label Text="USD 16,338" runat="server" ID="c13"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label Text="USD 54,459" runat="server" ID="d13"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label Text="95%" runat="server" ID="e13"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right" ColumnSpan="2">
                                <asp:Label Text="USD 54,459" runat="server" ID="c14"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label Text="95%" runat="server" ID="e14"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">&nbsp
                            </asp:TableCell>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">&nbsp
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Table runat="server" Width="100%" GridLines="None" ID="tbl3">
                        <asp:TableRow>
                            <asp:TableHeaderCell HorizontalAlign="Center">Plan 3 Monthly</asp:TableHeaderCell>
                            <asp:TableHeaderCell ColumnSpan="3" HorizontalAlign="Center">Quaterly Billing Band</asp:TableHeaderCell>
                            <asp:TableHeaderCell HorizontalAlign="Center">Licensee Commission</asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">1750</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">&nbsp</asp:TableCell>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                <asp:Label Text="USD 0" runat="server" ID="c19"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label Text="USD 16,338" runat="server" ID="d19"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label Text="100%" runat="server" ID="e19"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">
                                <asp:Label Text="USD 16,338" runat="server" ID="c20"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label Text="USD 54,459" runat="server" ID="d20"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label Text="100%" runat="server" ID="e20"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right" ColumnSpan="2">
                                <asp:Label Text="USD 54,459" runat="server" ID="c21"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label Text="100%" runat="server" ID="e21"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Right">&nbsp
                            </asp:TableCell>
                            <asp:TableCell>&nbsp</asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">&nbsp
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </asp:Panel>
                <div class="seconddiv">
                    <asp:Table runat="server" Width="100%" GridLines="None" ID="tbl4">
                        <asp:TableRow>
                            <asp:TableHeaderCell ColumnSpan="5" HorizontalAlign="Left"><b>Plan 2 - per month cost</b></asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="5" HorizontalAlign="Left">AUD 500.00
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">&nbsp
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">Mar qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">jun qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">Sep qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">Dec qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right"><b>TOTAL</b>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">Revenue receipts
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" AutoPostBack="True" OnTextChanged="txtbox1_TextChanged" ID="txtbox1" Text="USD 17,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" ID="txtbox2" AutoPostBack="True" OnTextChanged="txtbox2_TextChanged" Text="USD 17,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" ID="txtbox3" AutoPostBack="True" OnTextChanged="txtbox3_TextChanged" Text="USD 17,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" ID="txtbox4" AutoPostBack="True" OnTextChanged="txtbox4_TextChanged" Text="USD 17,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <b>
                                    <asp:Label runat="server" Font-Bold="true" ID="f28" Text="USD 68,000"></asp:Label>
                                </b>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">Commission
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="b29"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="c29"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="d29"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="e29"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <b>
                                    <asp:Label runat="server" ID="f29"></asp:Label>
                                </b>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">%ge of billings commission
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="b30"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="c30"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="d30"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="e30"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" Font-Bold="true" ID="f30"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Table runat="server" Width="100%" GridLines="None" ID="tbl5">
                        <asp:TableRow>
                            <asp:TableHeaderCell ColumnSpan="5" HorizontalAlign="Left"><b>Plan 2 - per month cost
</b></asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="5" HorizontalAlign="Left">AUD 500.00
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">&nbsp
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">Mar qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">jun qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">Sep qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">Dec qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right"><b>TOTAL</b>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">Revenue receipts
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" AutoPostBack="True" OnTextChanged="txtbox6_TextChanged" ID="txtbox6" Text="USD 30,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" ID="txtbox7" AutoPostBack="True" OnTextChanged="txtbox7_TextChanged" Text="USD 30,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" ID="txtbox8" AutoPostBack="True" OnTextChanged="txtbox8_TextChanged" Text="USD 30,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" ID="txtbox9" AutoPostBack="True" OnTextChanged="txtbox9_TextChanged" Text="USD 20,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <b>
                                    <asp:Label runat="server" CssClass="txtboxnocolor" Font-Bold="true" ID="f35" Text="USD 68,000"></asp:Label>
                                </b>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">Commission
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="b36"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="c36"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="d36"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="e36"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <b>
                                    <asp:Label runat="server" ID="f36"></asp:Label>
                                </b>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">%ge of billings commission
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="b37"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="c37"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="d37"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="e37"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <b>
                                    <asp:Label runat="server" ID="f37"></asp:Label>
                                </b>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <asp:Table runat="server" Width="100%" GridLines="None" ID="tbl6">
                        <asp:TableRow>
                            <asp:TableHeaderCell ColumnSpan="5" HorizontalAlign="Left"><b>Plan 3 - per month cost</b></asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="5" HorizontalAlign="Left">AUD 1750.00
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">&nbsp
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">Mar qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">jun qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">Sep qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">Dec qtr
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right"><b>TOTAL</b>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">Revenue receipts
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" AutoPostBack="True" OnTextChanged="txtbox11_TextChanged" ID="txtbox11" Text="USD 30,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" ID="txtbox12" AutoPostBack="True" OnTextChanged="txtbox12_TextChanged" Text="USD 30,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" ID="txtbox13" AutoPostBack="True" OnTextChanged="txtbox13_TextChanged" Text="USD 30,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:TextBox runat="server" CssClass="txtbox" ID="txtbox14" AutoPostBack="True" OnTextChanged="txtbox14_TextChanged" Text="USD 30,000"></asp:TextBox>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <b>
                                    <asp:Label runat="server" CssClass="txtboxnocolor" Font-Bold="true" ID="f42" Text="USD 1,20,000"></asp:Label>
                                </b>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">Commission
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="b43"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="c43"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="d43"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <asp:Label runat="server" ID="e43"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right">
                                <b>
                                    <asp:Label runat="server" ID="f43"></asp:Label>
                                </b>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Left">%ge of billings commission
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="b44"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="c44"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="d44"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <asp:Label runat="server" ID="e44"></asp:Label>
                            </asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center">
                                <b>
                                    <asp:Label runat="server" CssClass="txtboxnocolor" ID="f44"></asp:Label>
                                </b>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>