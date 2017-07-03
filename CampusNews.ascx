<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CampusNews.ascx.cs" Inherits="CampusNews" %>
<table style="width:200px; height:100%; vertical-align:top">
    <link href="artifacts/ClgStyleClasses.css" rel="stylesheet" />
    <tr>
        <td>
            <br /><br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="139px">
                <Columns>
                    <asp:TemplateField HeaderText="Campus News">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" Text ='<%# Eval("Title") %> ' href='<%# Eval("Url") %>'></asp:LinkButton>
                           
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </EmptyDataTemplate>
                
            </asp:GridView>
            <br /><br />
        </td>
    </tr>
</table>