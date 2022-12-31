<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminPanel.Master" AutoEventWireup="true" CodeBehind="Memo_Admin.aspx.cs" Inherits="OHRMS.Admin.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text" style="position: relative; left: 15px; font-size: 30px; color: rgb(0, 191, 255);">New Memorandum</h1>
    <hr />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <table class="table-newMemo">
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%;">
                            <label>Memorandum No: </label>
                        </td>
                        <td style="position: relative; left: 15px;">
                            <asp:TextBox ID="txtMemoNumber" runat="server" PlaceHolder="To" CssClass="textbox-Memo"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%;">
                            <label>To: </label>
                        </td>
                        <td style="position: relative; left: 15px;">
                            <asp:TextBox ID="txtTo_Memo" runat="server" PlaceHolder="To" CssClass="textbox-Memo"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%;">
                            <label>CC: </label>
                        </td>
                        <td style="position: relative; left: 15px;">
                            <asp:TextBox ID="txtCC_Memo" runat="server" PlaceHolder="CC" CssClass="textbox-Memo"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%;">
                            <label>From: </label>
                        </td>
                        <td style="position: relative; left: 15px;">
                            <asp:TextBox ID="txtFrom_Memo" runat="server" PlaceHolder="From" CssClass="textbox-Memo"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%;">
                            <label>Date: </label>
                        </td>
                        <td style="position: relative; left: 15px;">
                            <asp:TextBox ID="txtDate_Memo" runat="server" CssClass="textbox-Memo" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%;">
                            <label>Subject: </label>
                        </td>
                        <td style="position: relative; left: 15px;">
                            <asp:TextBox ID="txtSubject_Memo" runat="server" PlaceHolder="Subject" CssClass="textbox-Memo"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%;"></td>
                        <td style="position: relative; left: 15px;">
                            <asp:TextBox ID="txtBody_Memo" runat="server" PlaceHolder="Body" TextMode="MultiLine" CssClass="textbox-Memo-body"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%;"></td>
                        <td style="position: relative; left: 15px;">
                           <asp:FileUpload ID="fileUpload" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 25%;"></td>
                        <td>
                            <asp:Button ID="btnSubmit_Memo" runat="server" Text="Submit" CssClass="btnSubmit-memo" OnClick="btnSubmit_Memo_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                </table>
                <br />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit_Memo" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
