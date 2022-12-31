<%@ Page Title="" Language="C#" MasterPageFile="~/Helpers/Administator.Master" AutoEventWireup="true" CodeBehind="ScheduleNonTeachingForm.aspx.cs" Inherits="OHRMS.Administrators.ScheduleNonTeachingForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container my-3 clearfix">
        <div class="row">
            <div class="col">
                <div class="card mt-2">
                    <div class="card-header">
                        <h4>Non-Teaching Schedule</h4>
                    </div>
                    <div class="card-body">
                        <div class="row mb-3 md-form">
                            <div class="col">
                                <label for="txtEmployeeNo" class="">Employee No</label>
                                <asp:TextBox ID="txtEmployeeNo" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label class="active"><span class="red-text">*</span>Day</label>
                                <%--<asp:DropDownList ID="ddlDay" runat="server" CssClass="mdb-select">
                                    <asp:ListItem Value="-" Text="- Select -"></asp:ListItem>
                                    <asp:ListItem Value="Sunday" Text="Sunday"></asp:ListItem>
                                    <asp:ListItem Value="Monday" Text="Monday"></asp:ListItem>
                                    <asp:ListItem Value="Tuesday" Text="Tuesday"></asp:ListItem>
                                    <asp:ListItem Value="Wednesday" Text="Wednesday"></asp:ListItem>
                                    <asp:ListItem Value="Thursday" Text="Thursday"></asp:ListItem>
                                    <asp:ListItem Value="Friday" Text="Friday"></asp:ListItem>
                                    <asp:ListItem Value="Saturday" Text="Saturday"></asp:ListItem>
                                </asp:DropDownList>--%>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="Sunday" value="Sunday" id="chckSunday">
                                    <label class="custom-control-label" for="chckSunday">Sunday</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="Monday" value="Monday" id="chckMonday">
                                    <label class="custom-control-label" for="chckMonday">Monday</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="Tuesday" value="Tuesday" id="chckTuesday">
                                    <label class="custom-control-label" for="chckTuesday">Tuesday</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="Wednesday" value="Wednesday" id="chckWednesday">
                                    <label class="custom-control-label" for="chckWednesday">Wednesday</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="Thursday" value="Thursday" id="chckThursday">
                                    <label class="custom-control-label" for="chckThursday">Thursday</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="Friday" value="Friday" id="chckFriday">
                                    <label class="custom-control-label" for="chckFriday">Friday</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" name="Saturday" value="Saturday" id="chkSaturday">
                                    <label class="custom-control-label" for="chkSaturday">Saturday</label>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col form-group md-form">
                                <label for="txtPeriodFrom" class="active">Period From</label>
                                <asp:TextBox ID="txtPeriodFrom" runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col form-group md-form">
                                <label for="txtPeriodTo" class="active">Period To</label>
                                <asp:TextBox ID="txtPeriodTo" runat="server" TextMode="Time" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer justify-content-center text-center">
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="btn btn-red" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-blue" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hidId" runat="server" />
</asp:Content>
