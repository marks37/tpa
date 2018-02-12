<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="tl_workplan.aspx.cs" Inherits="tl_workplan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        dl {
            margin-bottom: 0;
            font-size: 14px;
        }

        dt {
            font-weight: 500;
            color: rgba(0,0,0,0.60);
            /*color: #9E9E9E;*/
            font-weight: normal;
        }

        dd {
            font-weight: normal;
            color: rgba(0,0,0,0.80);
        }

        .test-tbl thead tr th:first-child {
            /*vertical-align: top;*/
            /*padding: 10px 5px;*/
            /*text-align: left;*/
            /*font-size: 14px;*/
            /*padding: 10px 15px;*/
            padding-left: 15px;
        }

        .test-tbl thead tr th:last-child {
            padding-right: 15px;
            /*padding-right: 50px;*/
        }

        .test-tbl tbody tr td:last-child {
            padding-right: 20px;
        }

        .test-tbl tbody tr td:first-child {
            /*vertical-align: top;*/
            /*padding: 10px 5px;*/
            /*text-align: left;*/
            /*font-size: 14px;*/
            /*padding: 10px 15px;*/
            padding-left: 20px;
        }

        .test-tbl tbody tr td:nth-child(2) {
        }

        .test-tbl tbody tr td {
            /*padding: 8px 20px;*/
            border-top: 0px solid #EEEEEE;
            /*border-bottom-color: #f5f5f5;*/
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .table {
            /*border-bottom: 1px solid #ddd;*/
            border: 1px solid #ddd;
            background-color: #fff;
        }

        table.dataTable {
            /*margin-top:5px;*/
            /*margin-top: 0px !important;*/
            /*border-bottom: 0px solid #ddd;*/
            /*margin-bottom: 5px !important;*/
        }

        .table > thead > tr > th {
            font-weight: 600;
            line-height: 25px;
            border-bottom-width: 1px;
            border-bottom-color: #EEEEEE;
            /*padding: 15px 20px;*/
            padding-bottom: 8px;
            padding-top: 10px;
        }

        .table > tbody > tr {
        }

        .table > tbody {
        }

        .select2-container {
            width: 100% !important;
            padding: 0;
        }

        .lower-navbar-wrapper {
            position: fixed;
            top: 50px;
            z-index: 100;
            width: 100%;
        }

        .lower-navbar-wrapper {
            background-color: #FAFAFA;
            padding-top: 7px;
            padding-bottom: 7px;
            border-bottom: 1px solid #ddd;
        }

        body {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="lower-navbar">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;" class="text-muted">Workplan</span>
                <div class="btn-group hidden" role="group">
                    <a class="btn btn-default btn-sm">Workplan</a>
                </div>
                <%--<div class="btn-group" role="group">
                    <a class="btn btn-default btn-sm">March <span class="caret"></span></a>
                </div>--%>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar" id="toolbar">
                    <%--<div class="btn-group" role="group">
                        <a class="btn btn-default btn-sm">Branch: All</a>
                    </div>
                    &nbsp;
                    <div class="btn-group" role="group">
                        <a class="btn btn-default btn-sm">Coordinator: All</a>
                    </div>
                    &nbsp;
                    <div class="btn-group" role="group">
                        <a class="btn btn-default btn-sm">Branch: All</a>
                    </div>
                    &nbsp;
                    <div class="btn-group" role="group">
                        <asp:LinkButton ID="prevBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-left text-muted"></span></asp:LinkButton>
                        <asp:LinkButton ID="nextBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-right text-muted"></span></asp:LinkButton>
                    </div>
                    &nbsp;--%>
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal">New Visit</a>
                        <%--<a class="btn btn-default btn-sm" href="tl_new_workplan.aspx">New Workplan</a>--%>
                    </div>
                    <%--&nbsp;
                    <div class="btn-group" role="group">
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Import</a>
                    </div>--%>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="main-content-wrapper">
                <div class="">
                    <br />
                    <div class="container-fluid">
                        <asp:Label ID="messagelbl" runat="server" Text=""></asp:Label>
                        <div class="">
                            <h3 class="hidden" style="margin-left: 10px;">Workplan</h3>
                            <table class="table table-condensed table-hover test-tbl" id="workplans">
                                <thead>
                                    <tr class="">
                                        <th></th>
                                        <th class="text-muted small">Branch</th>
                                        <th class="text-muted small text-center">Call Date</th>
                                        <th class="text-muted small text-center">Due Date</th>
                                        <th class="text-muted small">Coordinator</th>
                                        <th class="text-muted small text-center">Date Added</th>
                                        <th class="text-muted text-right"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="workplan_rptr" runat="server" OnItemDataBound="workplan_rptr_ItemDataBound" OnItemCommand="workplan_rptr_ItemCommand">
                                        <ItemTemplate>
                                            <tr class="">
                                                <td>
                                                    <asp:Label ID="lock" runat="server"></asp:Label>
                                                </td>
                                                <td class="">
                                                    <asp:Label ID="branchlbl" CssClass="" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td class="text-center">
                                                    <asp:Label ID="calldatelbl" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td class="text-center">
                                                    <asp:Label ID="deadlinelbl" runat="server" Text=""></asp:Label>

                                                </td>
                                                <td class="">
                                                    <asp:Label ID="coordinatorlbl" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td class="text-center">
                                                    <asp:Label ID="dateAddedlbl" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group">
                                                        <asp:LinkButton ID="viewBtn" CssClass="btn-link btn" runat="server" CommandName="edit" CommandArgument='<%# Eval("id") %>'>Edit</asp:LinkButton>
                                                    </div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>

                            <div class="hidden">
                                <h4 class="hidden">Month & Assigned View</h4>
                                <table class="hidden table table-hover table-striped test-tbl">
                                    <thead>
                                        <tr>
                                            <th class="small text-muted">#</th>
                                            <th class="small text-muted">Period</th>
                                            <th class="small text-muted">Team Leader</th>
                                            <th class="small text-muted text-center">Date Created</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a>WPN:000008</a></td>
                                            <td><a>March 2017</a></td>
                                            <td>Mary Jane Alejo</td>
                                            <td class="text-center">02.27.2017</td>
                                        </tr>
                                        <tr>
                                            <td><a>7</a></td>
                                            <td><a>March 2017</a></td>
                                            <td><a>Jon Alinea</a></td>
                                            <td class="text-center">02.27.2017</td>
                                        </tr>
                                        <tr>
                                            <td><a>6</a></td>
                                            <td><a>March 2017</a></td>
                                            <td><a>Ysma Angeles</a></td>
                                            <td class="text-center">02.27.2017</td>
                                        </tr>
                                        <tr>
                                            <td><a>5</a></td>
                                            <td><a>March 2017</a></td>
                                            <td><a>Arnel Detablan</a></td>
                                            <td class="text-center">02.27.2017</td>
                                        </tr>
                                        <tr>
                                            <td><a>4</a></td>
                                            <td><a>Februrary 2017</a></td>
                                            <td><a>Mary Jane Alejo</a></td>
                                            <td class="text-center">02.27.2017</td>
                                        </tr>
                                        <tr>
                                            <td><a>3</a></td>
                                            <td><a>Februrary 2017</a></td>
                                            <td><a>Jon Alinea</a></td>
                                            <td class="text-center">02.27.2017</td>
                                        </tr>
                                        <tr>
                                            <td><a>2</a></td>
                                            <td><a>Februrary 2017</a></td>
                                            <td><a>Ysma Angeles</a></td>
                                            <td class="text-center">02.27.2017</td>
                                        </tr>
                                        <tr>
                                            <td><a>1</a></td>
                                            <td><a>Februrary 2017</a></td>
                                            <td><a>Arnel Detablan</a></td>
                                            <td class="text-center">02.27.2017</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                    <div class="hidden panel panel-default">
                        <h4 class="hidden">Month View only</h4>
                        <table class="table table-hover table-striped test-tbl">
                            <thead>
                                <tr>
                                    <th class="text-muted small">Period</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><a>March 2017</a></td>
                                </tr>
                                <tr>
                                    <td><a>February 2017</a></td>
                                </tr>
                                <tr>
                                    <td><a>January 2017</a></td>
                                </tr>
                                <tr>
                                    <td><a>December 2016</a></td>
                                </tr>
                                <tr>
                                    <td><a>November 2016</a></td>
                                </tr>
                                <tr>
                                    <td><a>October 2016</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="hidden panel panel-default">
                        <h4 class="hidden">Coordinator only</h4>
                        <table class="table table-hover table-striped test-tbl">
                            <thead>
                                <tr>
                                    <th class="text-muted small">Coordinator</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><a>Mary Jane Alejo</a></td>
                                </tr>
                                <tr>
                                    <td><a>Mariebel toledo</a></td>
                                </tr>
                                <tr>
                                    <td><a>Ronaldo Bringino</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>

                <footer class="">
                    <br />
                    <br />
                    <div class="container-fluid">
                        <p class="text-muted text-right">Developed by: <a href="#">BSDGSYS</a>. 2017</p>
                    </div>
                    <br />
                </footer>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="submitBtn" />
            <asp:AsyncPostBackTrigger ControlID="submitEditBtn" />
        </Triggers>
    </asp:UpdatePanel>

    <%--Edit Modal--%>
    <div class="modal fade" id="editModal" role="dialog" aria-labelledby="editModal">
        <div class="modal-dialog" role="document">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title"><i class="fa fa-pencil"></i>&nbsp;Edit Visit</h4>
                            <asp:HiddenField ID="workplanID" runat="server" />
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>CALL DATE</label>
                                        <asp:TextBox ID="callDateEdit" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                        <asp:Label ID="callDateEditValidation" runat="server"></asp:Label>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <label>ACCOUNT</label>
                                        <asp:DropDownList ID="manpowerEdit" runat="server" CssClass="form-control input-sm">
                                        </asp:DropDownList>
                                        <asp:Label ID="manpowerEditValidation" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="btn-group" role="group">
                                <asp:Button ID="cancelEditBtn" runat="server" CssClass="btn btn-default btn-sm" Text="Close" OnClick="cancelEditBtn_Click" />
                                <asp:Button ID="submitEditBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Save Changes" OnClick="submitEditBtn_Click" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel"><i class="fa fa-plus"></i>&nbsp;New Visit</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>CALL DATE</label>
                                        <%--<input type="date" class="form-control" id="callDate" />--%>
                                        <asp:TextBox ID="callDate" runat="server" CssClass="form-control input-sm"></asp:TextBox>
                                        <%--<asp:HiddenField ID="callDateHidden" runat="server" />--%>
                                        <asp:Label ID="callDateValidation" runat="server"></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label>ACCOUNT</label>
                                        <%--<select class="form-control" id="branchSelect">
                                            <option></option>
                                            <%=loadBranches()%>
                                        </select>
                                        <asp:HiddenField ID="branchHidden" runat="server" />--%>
                                        <asp:DropDownList ID="manpowerSelect" runat="server" CssClass="form-control input-sm">
                                            <asp:ListItem></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Label ID="manpowerValidation" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>--%>
                            <div class="btn-group" role="group">
                                <asp:Button ID="cancelBtn" runat="server" CssClass="btn btn-danger btn-sm" Text="Cancel" OnClick="cancelBtn_Click" />
                                <asp:Button ID="submitBtn" runat="server" CssClass="btn btn-success btn-sm" Text="Submit" OnClick="submitBtn_Click" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cancelBtn" />
                    <asp:AsyncPostBackTrigger ControlID="submitBtn" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>

    <asp:UpdateProgress ID="UpdateProgress2" runat="server">
        <ProgressTemplate>
            <div id="loadingModal">
                <!-- Place at bottom of page -->
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <script type="text/javascript">

        function pageLoad() {
            // replace your DOM Loaded settings here. 
            // If you already have document.ready event, 
            // just take the function part and replace here. 
            // Not with document.ready 
            $('#<%= manpowerSelect.ClientID %>').select2({
                placeholder: "Select Branch/Coordinator",
                theme: "bootstrap"
            });

            $('#<%= manpowerEdit.ClientID %>').select2({
                placeholder: "Select Branch/Coordinator",
                theme: "bootstrap"
            });

            $('#<%= callDate.ClientID %>').datepicker({
            });

            $('#<%= callDateEdit.ClientID %>').datepicker({
            });

            $('#workplans').DataTable({
                //"paging": false,
                "ordering": false,
                //"info": false,
                "language": {
                    "emptyTable": "No data available"
                },
                "bDestroy": true
            });
        }

        $(document).ready(function () {


            //$.extend($.fn.dataTableExt.oStdClasses, {
            //    "sFilterInput": "form-control input-sm",
            //    "sLengthSelect": "form-control input-sm",
            //    "sPaging": "pagination pagination-sm",
            //});

            //$('div.dataTables_paginate .pagination').addClass('pagination-sm');

        });

        function closeModal() {
            $('#myModal').modal('hide');
        }

        function closeEditModal() {
            $('#editModal').modal('hide');
        }

        function editModal() {
            $('#editModal').modal({
                backdrop: 'static',
                keyboard: false
            });
        }

        function preventMultipleSubmissions() {
            $('#<%=submitBtn.ClientID %>').prop('disabled', true);
        }

        window.onbeforeunload = preventMultipleSubmissions;
    </script>

</asp:Content>

