<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GoogleNews.ascx.cs" Inherits="CampusNews" %>
<table style="width:200px; height:100%; vertical-align:top">
    <link href="artifacts/ClgStyleClasses.css" rel="stylesheet" />
    <tr>
        <td>
            <asp:GridView ID="gnGridView1" runat="server" AutoGenerateColumns="False" Width="139px">
                <Columns>
                    <asp:TemplateField HeaderText="E-books">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" Text ='<%# Eval("Title") %> ' href='<%# Eval("Url") %>'></asp:LinkButton>
                            <br />
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </EmptyDataTemplate>
                
            </asp:GridView>
        </td>
    </tr>
</table>