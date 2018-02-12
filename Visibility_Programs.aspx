<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="Visibility_Programs.aspx.cs" Inherits="Visibility_Programs" %>

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
                <span style="font-size: 100%;" class="text-muted">Visibility Programs</span>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar">
                    <div class="btn-group hidden" role="group">
                        <a class="active btn btn-default btn-sm disabled">All</a>
                        <a class="btn btn-default btn-sm disabled">For Approval</a>
                        <a class="btn btn-default btn-sm disabled">Submitted</a>
                        <a class="btn btn-default btn-sm disabled">Missed</a>
                    </div>
                    &nbsp;
                    <div class="btn-group hidden" role="group">
                        <asp:LinkButton ID="prevBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-left text-muted"></span></asp:LinkButton>
                        <asp:LinkButton ID="nextBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-right text-muted"></span></asp:LinkButton>
                    </div>
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal">Add Visibility Item</a>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div id="main-content-wrapper">
        <div class="container-fluid">
            <br />
            <table class="table test-tbl table-hover" id="visib">
                <thead>
                    <tr>
                        <th class="small text-muted">CODE</th>
                        <th class="small text-muted">CATEGORY</th>
                        <th class="small text-muted">BRAND</th>
                        <th class="small text-muted">ASSIGNED</th>
                        <th class="small text-muted">ACTION</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="parentRepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("itemCode") %></td>
                                <td><%# Eval("category") %></td>
                                <td><%# Eval("brand") %></td>
                                <td></td>
                                <td><a class="btn btn-link">View</a></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Add Visibility Item</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Code</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control input-sm" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Category</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control input-sm" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Description</label>
                            <div class="col-sm-8">
                                <textarea class="form-control input-sm" rows="3"></textarea>
                            </div>
                        </div>
                    </div>
                    <table class="hidden table table-striped table-bordered nowrap table-condensed" cellspacing="0" id="rentals">
                        <thead>
                            <tr>
                                <th>Channel</th>
                                <th>Grouping</th>
                                <th>Branch</th>
                                <th>Duration</th>
                                <th>Division</th>
                                <th>Brand</th>
                                <th>Display Type</th>
                                <th>Type of Rented Space</th>
                                <th>Location of Rented Space</th>
                                <th>Layer Location</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Key Accounts</td>
                                <td>Watsons</td>
                                <td>LEE PLAZA DIPOLOG MALL</td>
                                <td>Jan.2016 - Dec.2016</td>
                                <td>OTX; ULCH without Milk;</td>
                                <td>Ceelin; Enervon;</td>
                                <td>Island Gondola</td>
                                <td>Per Layer</td>
                                <td>Inside the Cashier Counter</td>
                                <td>Layer 2</td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="hidden table table-striped table-hover table-bordered nowrap table-condensed" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Channel</th>
                                <th>Grouping</th>
                                <th>Branch</th>
                                <th>Display Type</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                <td>Key Accounts</td>
                                <td>Watsons</td>
                                <td>LEE PLAZA DIPOLOG MALL</td>
                                <td>Island Gondola</td>
                            </tr>
                            <tr class="collapse" id="collapseExample">
                                <td colspan="4">HELLO
                                </td>
                            </tr>
                            <tr role="button" data-toggle="collapse" href="#collapseExample1" aria-expanded="false" aria-controls="collapseExample1">
                                <td>Key Accounts</td>
                                <td>Watsons</td>
                                <td>LEE PLAZA DIPOLOG MALL</td>
                                <td>Island Gondola</td>
                            </tr>
                            <tr class="collapse" id="collapseExample1">
                                <td colspan="4">
                                    <div>
                                        HELLO
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary btn-sm" href="view_visibility_program.aspx">Create</a>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#myModal").on('shown.bs.modal', function (e) {
                //$('#rentals').DataTable({
                //    "scrollY": "300px",
                //    "scrollCollapse": true,
                //    "paging": false,
                //    "ordering": false,
                //    //"info": false,
                //    "language": {
                //        "emptyTable": "No data available",
                //    },
                //    responsive: true,
                //});
            });

            $("#myModal").on('hidden.bs.modal', function (e) {
                //$('#rentals').DataTable().fnDestroy();
            });

            $('#visib').DataTable({
                //"paging": false,
                "ordering": false,
                //"info": false,
                "language": {
                    "emptyTable": "No data available",
                },
                responsive: true,
            });
        });
    </script>
</asp:Content>

