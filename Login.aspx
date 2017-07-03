<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>SSIT College Forum - Welcome</title>
    <link href="Login.css" rel="stylesheet" />
        <link href="artifacts/ClgStyleClasses.css" rel="stylesheet" />
        <style type="text/css">
            .auto-style1 {
                width: 514px;
                background-color: #dddddd;
                position:relative;
                left:220px;
                top:-30px;
                border-radius:10px;
            }
            .auto-style2 {
                left: 41px;
                top: 625px;
            }
            
        </style>
        </head>
<body style="overflow:hidden">
   
     
    <form id="form1" runat="server">
    <div>
        <table style="width:800px;" align="center" >
            <tr>
                <td class="tdPage1" align="left">
                    <asp:Image ID="Image1" runat="server" Height="173px" ImageUrl="~/images/ssitlogo3.png" Width="173px"  />
                   
</td>
            </tr>
            <tr>
                <td class="tdPage2">
                <table style="height:60%; width:610px; left:-160px; position:relative; opacity:0.9">
                    <tr>
                        <td class="auto-style1" >
                            
                            <table style="font-family: 'Courier New', Courier, monospace; font-size: small">
                                <tr>
                                    <td class="auto-style2">Email id: </td>
                                    <td>
                                        <asp:TextBox ID="txtemail" runat="server" Width="180px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Enter E-mail ID" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Password: </td>
                                    <td>
                                        <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" colspan="3">
                                        <asp:Label ID="lblerror" runat="server" ForeColor="Red" ></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Font-Bold="True" ForeColor="Red">Forgot password?</asp:LinkButton>
                                    </td>
                                    <td align="right">
                                        <asp:Button ID="Button1" CssClass="LoginButton" runat="server" OnClick="Button1_Click" Text="Log in" Width="54px" BackColor="#0033CC" BorderColor="#0033CC" ForeColor="White"  />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Font-Bold="True" ForeColor="Red">New registration</asp:LinkButton>
                                    </td>
                                    <td>
                                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Reset" Visible="False" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    
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
        <p id="quote"> A place to share knowledge and better understand the world</div>
        <div id="heading" >
            <p id="head">Welcome to CollegeForumPortal</p>
           
        </div>
    </form>
</body>
</html>
