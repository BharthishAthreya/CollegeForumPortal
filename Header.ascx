<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Header" %>
<link href="artifacts/ClgStyleClasses.css" rel="stylesheet" />

<style type="text/css">
    .auto-style1 {
        width: 619px;
        background-color:#000000;
        border-radius:5px;
        display:inline-block;
        
    }
    
    .auto-style2 {
        width: 180px;
    }
</style>
<table style="width:800px"">
    <tr>
        <td style="width:100px">
            <asp:Image ID="imgHdr" runat="server" Height="75px" />
        </td>
        <td style="width:375px; font-size:x-small; vertical-align:bottom">
            <table class="auto-style1"> 
                <tr>
                    <td align="left" font-weight="20px" class="auto-style2" >
                        <asp:Label ID="dmy1" runat="server" Font-Names="Segoe UI" Font-Underline="false" ForeColor="white" Font-Size="Small" ><a>Welcome</a></asp:Label> 
                        <asp:Label ID="LblWlcm" runat="server" Font-Names="Segoe UI" Font-Underline="false" ForeColor="white" Font-Size="Small"></asp:Label>
                    </td>
                    <td style="width:10px">
                        <asp:LinkButton ID="lnkBtnHme" runat="server" Font-Names="Segoe UI" Font-Underline="false" ForeColor="white" Font-Size="Small" OnClick="lnkBtnHme_Click">HOME</asp:LinkButton>
                    </td>
                    <td style="width:10px">
                        
                    </td>
                    <td>
                        <asp:LinkButton ID="lnkBtnmyQ" runat="server" Font-Names="Segoe UI" Font-Underline="false" ForeColor="white" Font-Size="Small" OnClick="lnkBtnmyQ_Click">My questions</asp:LinkButton>
                    </td>
                    <td style="width:10px">
                        
                    </td>
                    <td>
                        <asp:LinkButton ID="lnkBtnQ4me" runat="server" Font-Names="Segoe UI" Font-Underline="false" ForeColor="white" Font-Size="Small" OnClick="lnkBtnQ4me_Click">Questions for me</asp:LinkButton>
                    </td>
                    <td style="width:10px">
                        
                    </td>
                    
                    <td>
                        <asp:LinkButton ID="lnkBtnProf" runat="server" Font-Names="Segoe UI" Font-Underline="false" ForeColor="white" Font-Size="Small"
                           PostBackUrl="~/UserProfile.aspx" OnClick="lnkBtnProf_Click">Profile</asp:LinkButton>
                    </td>
                    <td style="width:10px">
                        
                    </td>
                    <td >
                        <asp:LinkButton ID="lnkBtnSgnout" runat="server" Font-Names="Segoe UI" Font-Underline="false" ForeColor="white" Font-Size="Small" OnClick="lnkBtnSgnout_Click">Sign Out</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
        <td style="width:200px">
<asp:ImageButton Width="75px" Height="75px" ID="imgBtnLogo" runat="server" ImageUrl="~/images/ssitlogo3.png" />                

        </td>
    </tr>
</table>