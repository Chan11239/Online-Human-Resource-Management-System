<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Default.Master" AutoEventWireup="true" CodeBehind="EmployeeInfo.aspx.cs" Inherits="OHRMS.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container">

        <div class="card-header">
            <div class="row">
                <div class="col-6">
                    <h3 class="text-primary">Employee Records</h3>
                </div>
            </div>
        </div>

        <div class="separator">&nbsp;</div>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="container">
                    <div class="row">
                        <div class="col-6">
                            &nbsp;
                        </div>
                        <div class="d-flex col-6 justify-content-end text-end">
                            <asp:TextBox ID="txtSearch" runat="server" PlaceHolder="Search for Job..." CssClass="form-control me-2"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-primary" />
                        </div>
                    </div>

                    <div class="separator">&nbsp;</div>

                    <div class="container">

                        <asp:GridView ID="grdview_Employee" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" CellPadding="6" OnRowCommand="grdview_Employee_RowCommand" CssClass="table table-hover table-responsive border-0">
                            <Columns>
                                <asp:TemplateField HeaderText="Picture">
                                    <ItemTemplate>
                                        <asp:Image ID="img_pic" runat="server" Width="100px" Height="100px" ImageUrl='<%#Eval("Emp_Picture") %>' CssClass="img-thumbnail"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Emp_ID" HeaderText="Employee ID" />
                                <asp:BoundField DataField="Emp_Name" HeaderText="Employee Name" />
                                <asp:BoundField DataField="Emp_Department" HeaderText="Department" />
                                <asp:BoundField DataField="Emp_Position" HeaderText="Position" />
                                <asp:TemplateField HeaderText="View Information">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="linkbtnView" Text="View" runat="server" CommandArgument='<%#Eval("Emp_ID") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <%--<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        <AlternatingRowStyle BackColor="#FFCC66" />--%>
                        </asp:GridView>
                    </div>
                    <div class="separator">&nbsp;</div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
