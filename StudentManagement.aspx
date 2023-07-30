<%@ Page Language="C#" Title="Student Management" AutoEventWireup="true" CodeBehind="StudentManagement.aspx.cs" Inherits="WebApp.StudentManagement" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="panel">
        <ContentTemplate>
            <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
            <h2 class="text-center mb-4 fw-bolder text-primary">Student Management</h2>
            <div style="width: max-content !important">
                <div class="row">
                    <asp:Label ID="StdID" runat="server" Visible="false" />
                    <div class="mb-3 col-md-6 col-xl-6 col-xxl-6 col-lg-6 col-sm-12">
                        <asp:Label Text="Student Name:" runat="server" CssClass="form-label fw-bold" />
                        <asp:RequiredFieldValidator ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" ControlToValidate="StudentName"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="StudentName" runat="server" CssClass="form-control" ToolTip="Enter the Student Name" placeholder="Enter the Student Name" />
                    </div>
                    <div class="mb-3 col-md-6 col-xl-6 col-xxl-6 col-lg-6 col-sm-12">
                        <asp:Label Text="Student Father Name:" runat="server" CssClass="form-label fw-bold" />
                        <asp:RequiredFieldValidator ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" ControlToValidate="StudentFatherName"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="StudentFatherName" runat="server" CssClass="form-control" ToolTip="Enter the Student Father Name" placeholder="Enter the Student Father Name" />
                    </div>
                    <div class="mb-3 col-md-6 col-xl-6 col-xxl-6 col-lg-6 col-sm-12">
                        <asp:Label Text="Class:" runat="server" CssClass="form-label fw-bold" />
                        <asp:RequiredFieldValidator ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" ControlToValidate="ClassID"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="Select a Class" Display="Dynamic" ForeColor="Red" ControlToValidate="ClassID" MinimumValue="1" MaximumValue="50" Type="Integer"></asp:RangeValidator>
                        <asp:DropDownList runat="server" ID="ClassID" ToolTip="Select Class" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ClassID_SelectedIndexChanged" />
                    </div>
                    <div class="mb-3 col-md-6 col-xl-6 col-xxl-6 col-lg-6 col-sm-12">
                        <asp:Label Text="Section:" runat="server" CssClass="form-label fw-bold" />
                        <asp:RequiredFieldValidator ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" ControlToValidate="SectionID"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="Select a Section" Display="Dynamic" ForeColor="Red" ControlToValidate="SectionID" MinimumValue="1" MaximumValue="50" Type="Integer"></asp:RangeValidator>
                        <asp:DropDownList runat="server" ID="SectionID" ToolTip="Select Section" CssClass="form-control" placeholder="Select Section" />
                    </div>
                    <div class="mb-3 col-md-6 col-xl-6 col-xxl-6 col-lg-6 col-sm-12">
                        <asp:Label Text="Student Admission Date:" runat="server" CssClass="form-label fw-bold" />
                        <asp:RequiredFieldValidator ValidationGroup="MyValidationGroup" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red" ControlToValidate="AdmissionDate"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="AdmissionDate" runat="server" CssClass="datepicker form-control" ToolTip="Select the Student Admission Date" placeholder="Select the Student Admission Date" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-2">
                    <div>
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary border-3 border-primary px-5" OnClick="btnAdd_Click" />
                        <asp:Button ID="btnSave" runat="server" ValidationGroup="MyValidationGroup" Text="Save" CssClass="btn btn-success border-3 border-success px-5" OnClick="btnSave_Click" />
                        <asp:Button ID="btnEdit" runat="server" ValidationGroup="MyValidationGroup" Text="Update" CssClass="btn btn-warning border-3 border-warning px-5" OnClick="btnEdit_Click" />
                        <%--<asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-light border-3 border-secondary px-5" OnClick="btnClear_Click" />--%>
                    </div>
                </div>
            </div>
            <asp:GridView ID="StudentGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover mt-4" OnRowCommand="StudentGridView_RowCommand">
                <Columns>
                    <asp:BoundField DataField="StudentID" HeaderText="Student ID" HeaderStyle-CssClass="bg-primary text-white" Visible="false" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" HeaderStyle-CssClass="bg-primary text-white" />
                    <asp:BoundField DataField="StudentFatherName" HeaderText="Student Father Name" HeaderStyle-CssClass="bg-primary text-white" />
                    <asp:BoundField DataField="ClassName" HeaderText="Class Name" HeaderStyle-CssClass="bg-primary text-white" />
                    <asp:BoundField DataField="SectionName" HeaderText="Section Name" HeaderStyle-CssClass="bg-primary text-white" />
                    <asp:TemplateField HeaderText="Actions" HeaderStyle-CssClass="bg-primary text-white">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDetails" runat="server" Text="Select" CommandName="ShowDetails" CommandArgument='<%# Eval("StudentID") %>' CssClass="btn btn-info py-1 px-3" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <script type="text/javascript">
                function bindDateTimePicker() {
                    $(".datepicker").datepicker({
                        dateFormat: 'yy-mm-dd',
                        changeMonth: true,
                        changeYear: true,
                        showButtonPanel: true,
                    });
                }

                // Call bindDateTimePicker after each partial postback
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function () {
                    bindDateTimePicker();
                });
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
