<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="Timesheet.aspx.cs" Inherits="OHRMS.Employees.Timesheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <br style="padding-bottom: 100px" />
    <div style="margin: auto; border: 4px outset; padding: 50px 50px 50px 50px; border: outset; width: 1200px; border-radius: 10px;">
        <table>
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="gvPostedJobs" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="uploadedDate" HeaderText="Date" />
                                    <asp:BoundField DataField="batchIdDisplay" HeaderText="Batch No" />
                                    <asp:BoundField DataField="originalFileName" HeaderText="Excel Origin" />
                                    <asp:BoundField DataField="uploadedBy" HeaderText="Created By" />
                                    <asp:BoundField DataField="status" HeaderText="Status" />
                                    <asp:TemplateField ShowHeader="false">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkResume" runat="server" CommandArgument='<%#Eval("batchId")%>' OnCommand="lnkTimeSheet_Command" Text="View"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>No Upload TimeSheet.</EmptyDataTemplate>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td style="vertical-align: top; border: 2px outset; border-bottom: none; border-top: none; border-right: none; width: 300px">
                    <div style="padding-left: 20px">
                        <h4>Select a file to upload Employee TimeSheet:</h4>
                        <br />
                        <asp:FileUpload ID="fuTimeSheet" runat="server"></asp:FileUpload>
                        <br />
                        <br />
                        <asp:Button ID="btnSubmitTimeSheet"
                            Text="Upload Employee TimeSheet"
                            OnClick="btnSubmitTimeSheet_Click"
                            runat="server"></asp:Button>
                    </div>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
