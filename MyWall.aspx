<%@ Page Title="SSIT College Forum" Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="MyWall.aspx.cs" Inherits="_MyWall" %>
<%@ Register src="Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register Src="~/Header.ascx" TagPrefix="uc2" TagName="Header" %>
<%@ Register src="CampusNews.ascx" tagname="CampusNews" tagprefix="uc3" %>
<%@ Register src="GoogleNews.ascx" tagname="GoogleNews" tagprefix="uc4" %>
<html>
    <head>
        <title>SSIT College Forum</title>
        <link href="artifacts/ClgStyleClasses.css" rel="stylesheet" />
        <style type="text/css">
            .auto-style2 {
                width: 100%;
            }
            .auto-style3 {
                height: 155px;
            }
            .auto-style4 {
                width: 508px;
                height: 89px;
            }
            .auto-style5 {
                height: 66px;
            }
            .auto-style6 {
                width: 538px;
            }
            .auto-style7 {
                margin-right: 160px;
            }
            .celljustify
            {
                text-align:justify;
            }
            </style>
        <script>
            function txtonKeyPress()
            {
                
                document.getElementById('btnAsk').disabled = false;
            }
            function txtonblur()
            {
                
                if(document.getElementById('TextBox1').value == '')
                {
                    
                    document.getElementById('btnAsk').disabled = true;
                    return false;
                }
                else
                {
                    
                    document.getElementById('btnAsk').disabled = false;
                }
            }
        </script>
    </head>
    <body style="text-align: center;background-color:#dddddd;background-image:url('images/Screenshot (66).png'); background-size: 100%;opacity: 0.95;filter:alpha(opacity=40);">
        <form id="form1" runat="server" style="text-align: center; ">
            
        <table class="tblPage" align="center" style="background-color:#ffffff;">
            <tr>
                <td class="tdPage1" align="left" style="border-bottom-width:thin; border-bottom-style:groove;border-bottom-color:#808080">
                    <uc1:Header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="tdPage2">
                <table style="height:100%">
                    <tr>
                        <td style="width:200px; vertical-align:top;">
                               <div ><uc3:CampusNews ID="CampusNews1" runat="server" /></div> <br />

                            <div>
                                <uc4:GoogleNews ID="GoogleNews1" runat="server" />
                               </div>
                        </td>
      
                        <td style="width:600px; vertical-align:top">
                            <table class="auto-style6">
                                <tr>
                                    <td class="auto-style3" style="vertical-align:top">
                                        <table  class="auto-style4">
                                            <tr>
                                                <td>
                                        <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="400px" onblur="txtonblur();" onKeyPress="txtonKeyPress();" ForeColor="#CC3300"></asp:TextBox>
                                                </td>
                                                <td rowspan="2">
                                                    <div style="OVERFLOW-Y:scroll; " class="auto-style5">
                                                        <asp:CheckBoxList ID="cblist1" runat="server" Height="10px" Font-Size="9px" Width="87px" OnSelectedIndexChanged="cblist1_SelectedIndexChanged">
                                                        </asp:CheckBoxList>
                                                    </div>
                                                    <div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:top">
                                        <asp:Button ID="btnAsk" runat="server" Text="Ask Question" OnClick="btnAsk_Click" />
                                                    <br />
                                                    <asp:Label ID="LblErrorMsg" runat="server" ForeColor="Red" Font-Size="Small" ></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>

                                        <%--<asp:GridView ID="GDView" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="GDView_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
    <Columns>
        <asp:TemplateField HeaderText="" ItemStyle-Width="30">
            <ItemTemplate>
                  <asp:Label ID="txtAskedBy" Text =' <%# Eval("UserUSN") %>' runat="server" Height="50px"  Width="100%"></asp:Label>
                                                                            <br/>
                <asp:TextBox ID="txtQuestions" runat="server" Height="50px" Text='<%# Eval("Questions") %>' TextMode="MultiLine" Width="100%" ReadOnly="<%# true %>"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="Tags:"></asp:Label>
                <asp:Label ID="DGlblTags" runat="server" Font-Underline="true" Text='<%# String.Format("{0} {1}", Eval("tag1"), Eval("tag2")) %>
'></asp:Label>
                <table style="width:100%">
                    <tr>
                        <td style="text-align: right;">
                            <asp:Label ID="LblHide" runat="server" Text='<%# Eval("id") %>' Visible="<%# false %>"></asp:Label>
                            <asp:TextBox  ID="TextBox2" runat="server" Height="30px" Width="125px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="Button1" CommandName="select" runat="server" Text="Go" Width="35px" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>

<ItemStyle Width="30px"></ItemStyle>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:Label ID="txtDtTime" runat="server" Text='<%# Eval("dtTime") %>' />
            </ItemTemplate>

<ItemStyle Width="150px"></ItemStyle>
        </asp:TemplateField>
    </Columns>
</asp:GridView>--%>
         
<asp:DataGrid ID="GDView" runat="server" AutoGenerateColumns="false"
ShowHeader="False" onitemcommand="GDView_ItemCommand"
onitemdatabound="GDView_ItemDataBound"
onselectedindexchanged="GDView_SelectedIndexChanged" CssClass="auto-style7" Width="500px">
    <AlternatingItemStyle BackColor="#FFFFCC" />
 <Columns>

<asp:TemplateColumn>

<ItemTemplate>

<asp:TextBox ID="TextBoxID" runat="server" Text='<%#Eval("Questions") %>' Height="40px" Width="506px" ForeColor="#CC3300"></asp:TextBox>

    &nbsp;<br />&nbsp;<asp:Label ID="Label1" runat="server" Text="Tags: "></asp:Label> 

<asp:Label ID="Label3" runat="server" Text='<%# String.Format("{0} {1} {2} {3} {4}", Eval("tag1"), Eval("tag2"),Eval("tag3"),Eval("tag4"),Eval("tag5")) %>'></asp:Label>

    &nbsp;<asp:Label ID="LblQnBy" runat="server" Text='<%# String.Format("{0} {1} ", "By: ", Eval("UserUsn")) %>'></asp:Label>

    <asp:Label ID="Label4" runat="server" Text='<%#  String.Format("{0} {1} {2}", "(On: ", Eval("AskedDate"), ")") %>'></asp:Label>

    <br />

<asp:Label ID="Label2" runat="server" Text='<%# Eval("id") %>'

Visible='<%# false %>'></asp:Label>

<br />

<asp:DataGrid ID="GridView1" runat="server" AutoGenerateColumns="true" GridLines="None" ShowHeader="False" Width="509px">

    <AlternatingItemStyle BackColor="#CCCCCC" />
    <ItemStyle BackColor="#999999" CssClass="celljustify" />

    <SelectedItemStyle HorizontalAlign="Justify" />

</asp:DataGrid>

<br />

<br />

<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

<asp:Button ID="Button1" runat="server" Text='<%# "Answer" %>' />

</ItemTemplate>

</asp:TemplateColumn>
</Columns>
                                        <ItemStyle BackColor="#99CCFF" />
                                        </asp:DataGrid>

                                                        <%-- <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnDataBinding="GridView1_DataBinding" OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound" >
                                                            <EmptyDataTemplate>
                                                                <table class="auto-style7">
                                                                    <tr>
                                                                        <td>
                                                                             <asp:TextBox ID="txtAskedBy" Text =' <%# Eval("UserUSN") %>' runat="server" Height="50px"  Width="100%"></asp:TextBox>
                                                                            <br/>
                                                                            <asp:TextBox ID="txtQuestions" Text =' <%# Eval("Questions") %>' runat="server" Height="50px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label1" runat="server" Text="Tags:"></asp:Label>
                                                                            <asp:Label ID="DGlblTags" runat="server" Text =' <%# Eval("tag1") %>'></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>    
                                                                                <table style="width:100%"><tr><td style="text-align: right;">
                                                                                <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="125px"></asp:TextBox>
                                                                                           </td>
                                                                                    <td >
                                                                                <asp:Button ID="Button1" runat="server" Width="35px" Text="Go" />
                                                                                    </td>
                                                                                       </tr></table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </EmptyDataTemplate>
                                                        </asp:GridView> --%>

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