<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="WFAR.aspx.cs" Inherits="WFAR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .no-border {
            border: 0 !important;
        }

        .border-left {
            border: 1px solid #ddd !important;
        }

        .border-bottom {
            border-bottom: 1px solid #ddd;
        }

        .table-header-rotated th.row-header {
            font-size: 13px;
            font-weight: 100;
        }

        .table-header-rotated td {
            width: 50px;
            /*background-color: #ffd800;*/
            border-top: 1px solid #dddddd;
            border-left: 1px solid #dddddd;
            border-right: 1px solid #dddddd;
            vertical-align: middle;
            text-align: center;
        }

        .table-header-rotated th.rotate-45 {
            height: 80px;
            width: 50px;
            min-width: 50px;
            max-width: 50px;
            position: relative;
            vertical-align: bottom;
            padding: 0;
            font-size: 12px;
            line-height: 0.8;
            border: 0;
            border-top: 1px solid #ddd;
        }

            .table-header-rotated th.rotate-45 > div {
                /*background-color: #b6ff00;*/
                position: relative;
                top: 0px;
                left: 40px; /* 80 * tan(45) / 2 = 40 where 80 is the height on the cell and 45 is the transform angle*/
                height: 100%;
                -ms-transform: skew(-45deg,0deg);
                -moz-transform: skew(-45deg,0deg);
                -webkit-transform: skew(-45deg,0deg);
                -o-transform: skew(-45deg,0deg);
                transform: skew(-45deg,0deg);
                overflow: hidden;
                border-left: 1px solid #ddd;
                /*border-right: 1px solid #ddd;*/
                /*border-top: 1px solid #dddddd;*/
            }

            .table-header-rotated th.rotate-45 span {
                -ms-transform: skew(45deg,0deg) rotate(315deg);
                -moz-transform: skew(45deg,0deg) rotate(315deg);
                -webkit-transform: skew(45deg,0deg) rotate(315deg);
                -o-transform: skew(45deg,0deg) rotate(315deg);
                transform: skew(45deg,0deg) rotate(315deg);
                position: absolute;
                bottom: 30px; /* 40 cos(45) = 28 with an additional 2px margin*/
                left: -25px; /*Because it looked good, but there is probably a mathematical link here as well*/
                display: inline-block;
                // width: 100%;
                width: 85px; /* 80 / cos(45) - 40 cos (45) = 85 where 80 is the height of the cell, 40 the width of the cell and 45 the transform angle*/
                text-align: center;
                // white-space: nowrap; /*whether to display in one line or not*/
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <h3 class="text-muted">Weekly Field Activity Report</h3>
        <br />
        <div class="panel panel-default">
            <div class="panel-body">
                <br />
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Date From</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Date To</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Filter</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="table-responsive">
                        <table class="table table-header-rotated table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <!-- First column header is not rotated -->
                                    <th rowspan="2">CUSTOMER NAME/ BRANCH</th>
                                    <th rowspan="2">CALL DATE</th>
                                    <!-- Following headers are rotated -->
                                    <th class="text-center" colspan="8">Planogram
                                    </th>
                                    <th colspan="8" class="text-center">Stock Weights</th>
                                </tr>
                                <tr>
                                    <!-- First column header is not rotated -->

                                    <!-- Following headers are rotated -->
                                    <th class="rotate-45">
                                        <div><span>CV1L</span></div>
                                    </th>
                                    <th class="rotate-45">
                                        <div><span>CV2L</span></div>
                                    </th>
                                    <th class="rotate-45">
                                        <div><span>CV3L</span></div>
                                    </th>
                                    <th class="rotate-45">
                                        <div><span>PFF1L</span></div>
                                    </th>
                                    <th class="rotate-45">
                                        <div><span>CCA1L</span></div>
                                    </th>
                                    <th class="rotate-45">
                                        <div style="border-right: 1px solid #ddd;"><span>HBL1L</span></div>
                                    </th>

                                    <th class="rotate-45">
                                    </th>
                                    <th class="rotate-45">
                                    </th>

                                    <th class="rotate-45"style="border-left: 1px solid #ddd;">
                                        <div><span>CV1L</span></div>
                                    </th>
                                    <th class="rotate-45">
                                        <div><span>CV2L</span></div>
                                    </th>
                                    <th class="rotate-45">
                                        <div><span>CV3L</span></div>
                                    </th>
                                    <th class="rotate-45">
                                        <div><span>PFF1L</span></div>
                                    </th>
                                    <th class="rotate-45">
                                        <div><span>CCA1L</span></div>
                                    </th>
                                    <th class="rotate-45">
                                        <div style="border-right: 1px solid #ddd;"><span>HBL1L</span>
                                        </div>
                                    </th>

                                    <th class="rotate-45">

                                    </th>
                                    <th class="rotate-45"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th class="row-header">SSD BRUSMICK</th>
                                    <th class="row-header">10/31/2016</th>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <th class="row-header">SSD BALIBAGO R.S</th>
                                    <th class="row-header">10/31/2016</th>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <th class="row-header">SSD BRUSMICK</th>
                                    <th class="row-header">10/31/2016</th>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <th class="row-header">SSD BRUSMICK</th>
                                    <th class="row-header">10/31/2016</th>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <th class="row-header">SSD BRUSMICK</th>
                                    <th class="row-header">10/31/2016</th>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <th class="row-header">SSD BRUSMICK</th>
                                    <th class="row-header">10/31/2016</th>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <th class="row-header">SSD BRUSMICK</th>
                                    <th class="row-header">10/31/2016</th>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td>x</td>
                                    <td></td>
                                    <td></td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

