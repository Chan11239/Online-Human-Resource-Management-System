<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/sitemaster.Master" AutoEventWireup="true" CodeBehind="Memorandum.aspx.cs" Inherits="OHRMS.Employee.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text" style="position: relative; left: 15px; font-size: 30px; color: rgb(0, 191, 255);">Memorandum</h1>
    <hr />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="memo-list">
                    <br />
                    <asp:GridView ID="gridview_Employee" CssClass="grid-memo" runat="server" Width="90%" HorizontalAlign="Center" AutoGenerateColumns="false" CellPadding="3" ForeColor="#333333" OnRowCommand="gridview_Employee_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Memo_Num" HeaderText="Memorandum Number"  />
                            <asp:BoundField DataField="Memo_File" HeaderText="Files" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnView" runat="server" CommandArgument='<%#Eval("Memo_Num") %>' CommandName="View" Text="View File" />
                                    <asp:Button ID="btnViewMemo" runat="server" Text="View Message" CommandArgument='<%#Eval("Memo_Num") %>' CommandName="Message"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        <AlternatingRowStyle BackColor="#FFCC66" />
                    </asp:GridView>
                    <br />
                </div>
                <br />
                <br />
                <table class="table-memo">
                    <tr>
                        <td style="text-align: right; width: 25%">
                            <label>Memorandum Number: </label>
                        </td>
                        <td style="left: 20px; position: relative;">
                            <asp:Label ID="lblMemoNum" runat="server" Text="To"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%">
                            <label>To: </label>
                        </td>
                        <td style="left: 20px; position: relative;">
                            <asp:Label ID="lblTo_Memo" runat="server" Text="To"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%">
                            <label>CC: </label>
                        </td>
                        <td style="left: 20px; position: relative;">
                            <asp:Label ID="lblCC_Memo" runat="server" Text="From"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%">
                            <label>From: </label>
                        </td>
                        <td style="left: 20px; position: relative;">
                            <asp:Label ID="lblFrom_Memo" runat="server" Text="From"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%">
                            <label>Date: </label>
                        </td>
                        <td style="left: 20px; position: relative;">
                            <asp:Label ID="lblDate_Memo" runat="server" Text="Date"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%">
                            <label>Subject: </label>
                        </td>
                        <td style="left: 20px; position: relative;">
                            <asp:Label ID="lblSubject" runat="server" Text="Subject"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                     <tr>
                        <td style="text-align: right; width: 25%">
                            
                        </td>
                        <td style="left: 20px; position: relative;">
                            <asp:Label ID="lblBody_Memo" runat="server" Text="Subject"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%"></td>
                        <td style="left: 20px; position: relative;">
                            <asp:PlaceHolder ID="placeholder1" runat="server"></asp:PlaceHolder>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        function shwwindow(myurl) {
            window.open(myurl, '_blank');
        }
    </script>

</asp:Content>
