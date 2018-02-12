<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="view_visibility_program.aspx.cs" Inherits="view_visibility_program" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .control {
            width: 20px;
        }

        .child td th {
            padding-left: 45px;
            padding-right: 10px;
            padding-top: 3px;
        }

        .child table {
            margin-bottom: 3px;
        }

        .highlight {
            background-color: #00ff90;
        }

        .rental-list-panel {
            border: 1px solid #ddd;
            box-shadow: none;
            -webkit-box-shadow: none;
        }

        .rental-list-name {
            font-weight: 500;
            font-size: 16px;
            -webkit-font-smoothing: antialised;
            text-shadow: rgba(0,0,0,.01) 0 0 1px;
        }

        .rentals-tbl.dataTable {
            margin-top: 0px !important;
        }

        .dataTables_scrollHeadInner {
            border-bottom: 2px solid #ddd;
        }

        .rentals-tbl > thead > tr > th {
            border-bottom: 0px;
        }

        .rentals-tbl > tbody > tr > td {
            border-bottom: 0px;
        }

        .dataTables_scrollHeadInner > .rentals-tbl > thead > tr > th:first-child {
            /*text-align: center !important;*/
        }

        .rentals-tbl > tbody > tr > td:first-child {
            /*text-align: center !important;*/
        }

        .rentals-tbl > thead > tr > td:last-child {
            /*padding: 15px;*/
        }

        .rentals-tbl > tbody > tr > td:last-child {
            /*padding: 15px;*/
        }

        .dataTables_scroll {
            margin-top: 15px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
        }

        .modal-footer {
            padding: 10px 15px;
        }

        #rentals_wrapper {
            background-color: #ffffff;
        }

        .dataTables_scrollBody {
            overflow-y: scroll !important;
            overflow-x: hidden !important;
        }


        .table-hover > tbody > tr > .child:hover {
            cursor: default !important;
        }

        .table-hover > tbody > tr > td:first-child:hover {
            cursor: pointer;
        }

        .table-hover > thead > tr > th:first-child:hover {
            cursor: pointer;
        }

        input[type="checkbox"] {
            cursor: pointer;
        }

        table.dataTable > tbody > tr.child:hover {
            /*background-color: #f5f5f5;*/
        }

        table.dataTable > tbody > tr.child ul.dtr-details li {
            border-bottom: 0px;
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
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal">Add Rentals</a>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <div id="main-content-wrapper">
        <br />
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div style="padding-left: 5px;">
                        <h2>CV1L<br />
                            <small>Children's Vitamins</small></h2>
                        <br />
                        <p>
                            <strong>Description:&nbsp;</strong><br />
                            Ceelin Base and Ceelin Plus
                        </p>
                    </div>
                    <br />
                    <table class="table table-striped table-bordered table-hover table-condensed nowrap" cellspacing="0">
                        <thead>
                            <tr>
                                <th class="col-md-1">Channel</th>
                                <th>Grouping</th>
                                <th>Branch</th>
                                <th>Display Type</th>
                                <th>Division</th>
                                <th>Brand</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                <td>Key Accounts</td>
                                <td>Watsons</td>
                                <td>LEE PLAZA DIPOLOG MALL LEE PLAZA DIPOLOG MALL</td>
                                <td>Island Gondola</td>
                                <td>OTX; ULCH without Milk;</td>
                                <td>Ceelin; Enervon;Ceelin; Enervon;Ceelin; Enervon</td>
                            </tr>
                            <tr class="collapse" id="collapseExample">
                                <td colspan="6">HELLO
                                </td>
                            </tr>
                            <tr role="button" data-toggle="collapse" href="#collapseExample1" aria-expanded="false" aria-controls="collapseExample1">
                                <td>Key Accounts</td>
                                <td>Watsons</td>
                                <td>LEE PLAZA DIPOLOG MALL</td>
                                <td>Island Gondola</td>
                                <td>OTX; ULCH without Milk</td>
                                <td>Ceelin; Enervon</td>
                            </tr>
                            <tr class="collapse" id="collapseExample1">
                                <td colspan="6">
                                    <div>
                                        HELLO
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-body" style="">
                    <div class="row hidden">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="hidden panel rental-list-panel panel-default">
                                <div class="panel-body">
                                    <input type="checkbox" />
                                    <label class="rental-list-name">
                                        WATSONS LEE PLAZA DIPOLOG MALL<br />
                                        <small>Key Accounts</small></label>
                                    <hr />
                                </div>
                            </div>

                            <div class="hidden rental-list-panel panel panel-default">
                                <div class="panel-heading">
                                    <input type="checkbox" />
                                    WATSONS LEE PLAZA DIPOLOG MALL
                                </div>
                                <div class="panel-body">
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">&nbsp;Add Rentals</h4>
                    <table class="table text-nowrap rentals-tbl table-striped table-hover table-condensed table-hover dt-responsive nowrap" id="rentals">
                        <thead>
                            <tr>
                                <th style="padding: 5px;" class="text-center">
                                    <span>
                                        <input type="checkbox" class="checkbox-all" /></span>
                                </th>
                                <th>Channel</th>
                                <th>Grouping</th>
                                <th>Branch</th>
                                <th>Division</th>
                                <th>Brand</th>
                                <th>Duration</th>
                                <th>Display Type</th>
                                <th>Rent Type</th>
                                <th>Rent Location</th>
                                <th>Layer Location</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center"><span>
                                    <input type="checkbox" class="checkbox" /></span></td>
                                <td>Key Accounts</td>
                                <td>Watsons</td>
                                <td>LEE PLAZA DIPOLOG MALL</td>
                                <td>OTX; ULCH without Milk;</td>
                                <td>Ceelin; Enervon;</td>
                                <td>Jan.2016 - Dec.2016</td>
                                <td>Island Gondola</td>
                                <td>Per Layer</td>
                                <td>Inside the Cashier Counter</td>
                                <td>Layer 2</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="text-center"><span>
                                    <input type="checkbox" class="checkbox" /></span></td>
                                <td>Key Accounts</td>
                                <td>Watsons</td>
                                <td>LEE PLAZA DIPOLOG MALL</td>
                                <td>OTX; ULCH without Milk;</td>
                                <td>Ceelin; Enervon;</td>
                                <td>Jan.2016 - Dec.2016</td>
                                <td>Island Gondola</td>
                                <td>Per Layer</td>
                                <td>Inside the Cashier Counter</td>
                                <td>Layer 2</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="text-center"><span>
                                    <input type="checkbox" class="checkbox" /></span></td>
                                <td>Key Accounts</td>
                                <td>Watsons</td>
                                <td>LEE PLAZA DIPOLOG MALL</td>
                                <td>OTX; ULCH without Milk;</td>
                                <td>Ceelin; Enervon;</td>
                                <td>Jan.2016 - Dec.2016</td>
                                <td>Island Gondola</td>
                                <td>Per Layer</td>
                                <td>Inside the Cashier Counter</td>
                                <td>Layer 2</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="text-center"><span>
                                    <input type="checkbox" class="checkbox" /></span></td>
                                <td>Key Accounts</td>
                                <td>Watsons</td>
                                <td>LEE PLAZA DIPOLOG MALL</td>
                                <td>OTX; ULCH without Milk;</td>
                                <td>Ceelin; Enervon;</td>
                                <td>Jan.2016 - Dec.2016</td>
                                <td>Island Gondola</td>
                                <td>Per Layer</td>
                                <td>Inside the Cashier Counter</td>
                                <td>Layer 2</td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="hidden" style="height: 442px; background-color: #ffffff; border: 1px solid #ddd; margin-top: 15px; margin-bottom: 15px;">
                    </div>
                    <table class="table table-striped hidden table-hover table-bordered nowrap table-condensed" cellspacing="0">
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
                    <div class="pull-right">
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary btn-sm" href="view_visibility_program.aspx">Save</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {

            var table = $('#rentals').DataTable({
                "scrollY": "400px",
                "scrollCollapse": false,
                "paging": false,
                "ordering": false,
                //"info": false,
                "language": {
                    "emptyTable": "No data available",
                },
                responsive: {
                    details: {
                        type: 'column',
                        target: -1,
                        renderer: function (api, rowIdx, columns) {
                            var data = $.map(columns, function (col, i) {
                                return col.hidden ?
                                    '<tr data-dt-row="' + col.rowIndex + '" data-dt-column="' + col.columnIndex + '">' +
                                        '<th>' + col.title + '' + '</th> ' +
                                        '<td>' + col.data + '</td>' +
                                    '</tr>' :
                                    '';
                            }).join('');

                            return data ?
                                $('<table/>').append(data) :
                                false;
                        }
                    }
                },
                columnDefs: [{
                    className: 'control',
                    orderable: false,
                    targets: -1
                }, {
                    className: 'checkBox',
                    orderable: false,
                    target: 1
                }],
                "dom": "<t>",
            });

            $("#myModal").on('shown.bs.modal', function (e) {
                table.columns.adjust().draw();
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

            $('.checkbox').on('change click', function () {
                //alert('checked!');

                if ($('.checkbox').length == $('.checkbox:checked').length) {
                    $('.checkbox-all').prop('checked', true);
                } else {
                    $('.checkbox-all').prop('checked', false);
                }
            });

            $('.rentals-tbl tr th:first-child input').on('change click', function () {
                $('.checkbox').not(this).prop('checked', this.checked);
                $('#rentals tbody tr').toggleClass('info', this.checked);
            });

            $('#rentals tr td:first-child').click(function (event) {
                if (event.target.type !== 'checkbox') {
                    $(':checkbox', this).trigger('click');
                }
            });

            $('td:first-child input').change(function () {
                $(this).closest('tr').toggleClass("info", this.checked);
            });
        });
    </script>
</asp:Content>

