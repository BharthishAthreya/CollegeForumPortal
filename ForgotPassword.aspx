<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/ForgotPassword.aspx.cs" Inherits="RegistrationPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>SSIT College Forum - Welcome</title>
            <link href="artifacts/ClgStyleClasses.css" rel="stylesheet" />
        <style type="text/css">
            .auto-style1 {
                width: 100%;
            }
            .auto-style2 {
                text-align: right;
            }
            .auto-style3 {
                text-align: left;
            }
        </style>
        </head>
<body>
    <form id="form1" runat="server">
        <table class="tblPage" align="center">
            <tr>
                <td class="tdPage1">
                    <asp:Image ID="Image1" runat="server" Height="173px" ImageUrl="~/images/ssitlogo3.png" Width="173px" />&nbsp;Welcome to SSIT Forum web application</td>
            </tr>
            <tr>
                <td class="tdPage2" align="center">
                    <table style="height:100%;width:100%">
                        <tr>
                            <td style="height:10%; text-align:left">
                                Forgot Password
                            </td>
                        </tr>
                        <tr>
                            <td style="height:90%; text-align:center">
                                
                                <table cellpadding="0" cellspacing="0" style="font-family: 'Courier New', Courier, monospace">
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Label ID="Label1" runat="server" Text="Enter the email id:"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td class="auto-style3">
                                            <asp:TextBox ID="txtemailID" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td class="auto-style3">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label ID="lblerror" runat="server" Font-Size="Smaller" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">
                                            <asp:Button ID="btnsendpassword" runat="server" OnClick="btnsendpassword_Click" Text="Send Password" />
                                        </td>
                                        <td>&nbsp;</td>
                                        <td class="auto-style3">
                                            <asp:Button ID="btncancel" runat="server" OnClick="btncancel_Click" Text="Cancel" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2" colspan="3">
                                            <asp:Label ID="lblInfo" runat="server" ></asp:Label>
                                            <asp:HyperLink ID="registerlink" Visible="false" NavigateUrl="~/RegistrationPage.aspx" runat="server">New Registration</asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="tdPage3">

                </td>
            </tr>
        </table>
    </form>
</body>
</html>
