<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<%@ Register src="Header.ascx" tagname="Header" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <title>SSIT College Forum - Profile Update</title>
        <link href="artifacts/ClgStyleClasses.css" rel="stylesheet" />
        
        <style type="text/css">
            .auto-style3 {
                width: 180px;
                text-align: right;
            }
            .auto-style4 {
                text-align: right;
            }
            .auto-style5 {
                text-align: left;
            }
        </style>
        
    </head>
    <body>
        <form id="form1" runat="server">
        <table class="tblPage" align="center">
            <tr>
                <td class="tdPage1" align="left" style="border-bottom-width:thin; border-bottom-style:groove;border-bottom-color:#808080">
                    <uc1:Header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="tdPage2">
                <table style="height:100%">
                    <tr>
                        <td >
                            <table style="font-family: 'Courier New', Courier, monospace; font-size: small">
                                <tr>
                                    <td class="auto-style3" rowspan="2">Profile picture: </td>
                                    <td class="auto-style6">&nbsp;&nbsp; &nbsp;</td>
                                    <td class="auto-style6">
                                        <asp:Image ID="Image1" runat="server" Height="150px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style6">&nbsp;</td>
                                    <td class="auto-style5">
                                        <asp:FileUpload ID="picUpdate" runat="server" Width="86px" />
                                        <asp:Button ID="btnUpld" runat="server" Text="Upload" OnClick="btnUpld_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">Display name: </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtDpName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">USN:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Label ID="LabelProfUSN" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">Branch:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtProfBranch" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">&nbsp;Section:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtProfSec" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">Address:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtProfAddr" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">Mobile:</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtProfMob" runat="server" ></asp:TextBox>
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
                                    <td class="auto-style3">About yourself: </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtProfAbt" runat="server" TextMode="MultiLine"> </asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">Email-id</td>
                                    <td class="auto-style4"></td>
                                    <td >
                                        <asp:TextBox ID="TxtProfEmail" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">Password</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="TxtProfPwd" TextMode="Password" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">Date-of-birth</td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnSave_Click" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
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
