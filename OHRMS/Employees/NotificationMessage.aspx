<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Employee.Master" AutoEventWireup="true" CodeBehind="NotificationMessage.aspx.cs" Inherits="OHRMS.Employees.NotificationMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container mt-5 bg-white shadow">
        <div class="row text-start text-primary p-3">
            <div class="separator">&nbsp;</div>
            <hr />
        </div>

        <dl class="row">
            <dt class="col-3">From: </dt>
            <dd class="col-9">
                <asp:Label ID="lblName" runat="server"></asp:Label></dd>

            <dt class="col-3">Message</dt>
            <dd class="col-9">
                <asp:Label ID="lblMessage" runat="server"></asp:Label></dd>

            <dt class="col-3">Date</dt>
            <dd class="col-9">
                <asp:Label ID="lblDate" runat="server"></asp:Label></dd>

        </dl>
        <div class="separator">&nbsp;</div>
        <div class="row pb-3 text-center">
                <a href="<%=Page.ResolveUrl("~/Employees/NotificationList.aspx")%>"><< Go back to list </a>
            </div>
        
    </div>
</asp:Content>
