<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/RegistrationPage.aspx.cs" Inherits="RegistrationPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>SSIT College Forum - Welcome</title>
    <link href="Login.css" rel="stylesheet" />
        <link href="artifacts/ClgStyleClasses.css" rel="stylesheet" />
        <style type="text/css">
            .auto-style1 {
                height: 26px;
                width: 380px;

            }
            .auto-style2 {
                width: 380px;
            }
            .auto-style3 {
                width: 298px;
                    
            }
            .auto-style4 {
                width: 9px;
            }
            .auto-style5 {
                height: 100%;
                width: 396px;
                
            }
            .auto-style6 {
                width: 385px;
            }
        </style>
        </head>
<body id="regpage">
    <form id="form1" runat="server">
    <div>
        <table class="tblPage" align="center">
            <tr>
                <td class="tdPage1" align="left">
                    <asp:Image ID="Image1" runat="server" align="middle" Height="173px" ImageUrl="~/images/ssitlogo3.png" Width="173px" />
&nbsp;Welcome to SSIT Forum web application</td>
            </tr>
            <tr>
                <td class="tdPage2">
                <table class="auto-style5">
                    <tr>
                        <td class="auto-style3" >
                            <table style="font-family: 'Courier New', Courier, monospace; font-size: small" class="auto-style6">
                                <tr>
                                    <td class="auto-style2">User Name:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtUsrName" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUsrName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">USN:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtUSN" runat="server" Width="150px" OnTextChanged="TxtUSN_TextChanged"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TxtUSN" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Branch:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtBranch" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TxtBranch" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Section:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtSec" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TxtSec" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Address:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtAddr" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TxtAddr" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Date-of-Birth</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Calendar ID="Calendar1" runat="server" Height="190px" Width="203px" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth">
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                    </td>
                                    <td class="auto-style4">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Image:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Image ID="Image2" runat="server" Height="60px" ImageUrl="~/ProfilePictures/prfdefault.jpg" />
                                        <asp:FileUpload ID="profimageuploader" runat="server" />
                                    </td>
                                    <td class="auto-style4">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">About yourself</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtabtSelf" runat="server" TextMode="MultiLine" Width="150px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="TxtabtSelf" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Mobile:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtMob" runat="server" Width="150px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TxtMob" ErrorMessage="only number is accepted" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr >
                                    <td style="border: thin groove #000000;" class="auto-style2">Choose your Likes</td>
                                    <td >&nbsp;</td>
                                    <td style="border: thin groove #000000;">
                                        <asp:TextBox ID="txtTag1" runat="server" Width="98%"></asp:TextBox>
                                        <asp:TextBox ID="txtTag2" runat="server" Width="98%"></asp:TextBox>
                                        <asp:TextBox ID="txtTag3" runat="server" Width="98%"></asp:TextBox>
                                        <asp:TextBox ID="txtTag4" runat="server" Width="98%"></asp:TextBox>
                                        <asp:TextBox ID="txtTag5" runat="server" Width="98%"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Email id: </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtEmail" runat="server" OnTextChanged="TxtEmail_TextChanged" Width="150px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TxtEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Password: </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtPwd" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TxtPwd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">
                                        <asp:Button ID="BtnRegister" runat="server" Text="Register" OnClick="BtnRegister_Click" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="BtnReset" runat="server" Text="Reset" OnClick="BtnReset_Click" />
                                    </td>
                                    <td class="auto-style4">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" class="auto-style2">
                                        &nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td class="auto-style4">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="3">
                                        <asp:Label id="lblforgotpswd" runat="server"></asp:Label> <asp:HyperLink ID="forgotpswd" Visible="false" runat="server" NavigateUrl="~/Login.aspx">Forgot Password</asp:HyperLink>
                                        <asp:Label ID="lblerror" runat="server" Font-Size="Smaller" ForeColor="Red"></asp:Label>
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
    </div>
    </form>
</body>
</html>
