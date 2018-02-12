<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCoordinator.master" AutoEventWireup="true" CodeFile="ce_implementation_check1.aspx.cs" Inherits="ce_implementation_check1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .info-stat-title {
            font-size: 14px;
            font-weight: bold;
            background-color: #ddd;
            width: 100%;
            display: inline-block;
            padding: 5px;
            /*display: none;*/
        }

        .info-stat-content {
            height: 70px;
    /*height: 100px;*/
            padding: 5px;
            width: 100px;
            display: table-cell;
            text-align: center;
            vertical-align: middle;
        }

        .info-stat-txt {
            display: table-cell;
            vertical-align: top;
            height: 100px;
            width: 100px;
        }

        .info-stat {
            display: inline-block;
            height: 100px;
            width: 100px;
            padding: 0px;
            border-radius: 5px;
            border: 1px solid #ddd;
            margin-left: 10px;
            float:left;
            display: table-cell;
            vertical-align: bottom;
        }

        .info-stat p{
            height: 100px;
            width: 100px;
            display: table-cell;
            vertical-align: bottom;
        }

        .custom{
            font-size: 14px;
            /*font-weight: 400;*/
        }

        .dates span {
            /*font-size: 10px;*/
        }

        .dates .month {
            font-size: 20px;
        }

        .dates .day {
            font-size: 20px;
        }

        .num {
            font-size: 24px;
        }

        .panel {
            background-color: #FBFBFB;
        }

        .prodName {
            /*font-weight: bold;*/
        }

        .prodDesc {
            font-size: 14px;
        }

        .product {
            padding-left: 15px;
            font-size: 24px;
        }

        .status>.fa{
            font-size: 24px !important;
        }


        .success {
            background-color: #3a9b1e;
            color: white;
        }

        .table > thead > tr > th {
            border-bottom: 0px;
            font-size: 12px;
            padding-top: 15px;
            padding-bottom: 15px;
            /*background-color: rgb(231, 230,230);*/
            color: rgb(89, 89, 89);
            font-weight: 800;
            /*border-bottom: 1px solid rgb(89, 89, 89);*/
            padding-left: 30px;
        }

        .table > tbody > tr > td {
            vertical-align: top;
            padding-top: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgb(242, 242, 242);
            border-color: rgb(242, 242, 242);
            color: #4D4D4D;
            padding: 15px;
        }

        .table > tbody > tr > .text-right{
            padding-right: 15px;
            vertical-align: top;
        }

        .table > thead > tr > .text-right{
            padding-right: 15px;
        }


            .table > tbody > tr > td > strong {
                font-size: 16px;
                color: #767171;
                color: #4D4D4D;
            }

            .table > tbody > tr > td > small {
                font-size: 14px;
            }

            .table > tbody > tr > td > span > .fa {
                font-size: 15px;
            }

        .table > tbody > tr {
            cursor: pointer;
            margin-bottom: 10px;
            /*border: 1px solid rgb(242, 242, 242);*/
            /*border-top: 1px solid rgb(89, 89, 89);*/
        }

        .table {
            background-color: #FBFBFB;
            /*-webkit-box-shadow: 0px 1px 5px 0px rgba(227,227,227,1);
-moz-box-shadow: 0px 1px 5px 0px rgba(227,227,227,1);
box-shadow: 0px 1px 5px 0px rgba(227,227,227,1);*/
            border-collapse: collapse;
            /*border-top: 1px solid #000000;*/
        }
    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $(window).bind('scroll', function () {
                console.log($(window).scrollTop())
                if ($(window).scrollTop() > 25) {
                    $('.page-header-1-wrapper').addClass('page-header-1-wrapper-fixed');
                    $('.page-content').addClass('page-content-fixed');
                    $('.lower-navbar-wrapper').addClass('lower-navbar-wrapper-fixed');
                } else {
                    $('.page-content').removeClass('page-content-fixed');
                    $('.page-header-1-wrapper').removeClass('page-header-1-wrapper-fixed');
                    $('.lower-navbar-wrapper').removeClass('lower-navbar-wrapper-fixed');
                }
            });
        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-content">
        <div class="page-header-1-wrapper" style="">
            <div class="text-center">
                <h3>Budgetlane - Budgetlane Sta. Cruz</h3>
            </div>
        </div>
        <div class="lower-navbar-wrapper">
            <nav class="navbar navbar-default">
                <div class="container">
                    <div class="navbar-collapse collapse">
                        <ul class="" id="implem_steps">
                            <li class=""><a href="ce_review_plans1.aspx">Review Plans</a></li>
                            <li class="active"><a href="ce_implementation_check1.aspx">Initiatives Check</a></li>
                            <li><a href="ce_competitors.aspx">Competitor's Activity</a></li>
                            <li><a href="ce_closing.aspx">Closing</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class=" col-sm-8 col-sm-offset-2 col-md-10 col-md-offset-1">
                    <div class="page-header-2-wrapper">
                        <%--<h3>Initiatives Check - 0/3</h3>--%>
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <div class="panel">
                        <div class="panel-body">
                            <div style="width: 100%; height:256px; margin-top: -150px; margin-bottom: 80px;">
                                <div style="width: 420px; height: 100%; margin-left: auto; margin-right: auto; background-color: #FBFBFB; border: 1px solid #DDD;"></div>
                            </div>
                            <div class="text-center">
                                <h3>Initiatives</h3>
                            </div>
                        </div>
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th class="col-md-1 col-sm-1"></th>
                                    <th class="col-md-8  col-sm-9">INITIATIVES</th>
                                    <th class="text-right col-md-3">STARTED</th>
                                    <th class="text-right col-md-2">ALLOCATION</th>
                                    <th></th>
                                    <%--<th class="text-left">START/ALLOCATION</th>--%>
                                <%--<th class="text-center">IMPLEMENTATION</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr> 
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr> 
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr> 
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr> 
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr> 
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr> 
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr> 
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr> 
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr> 
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="text-center text-center middle"><span class="text-danger status"><i class="fa fa-circle"></i></span></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1-Sep-2016</span>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="custom">
                                            <span class="">1,000</span>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr> 
                            </tbody>
                        </table>
                    </div>

                    <div class="" style="display: none;">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th class="col-md-1"></th>
                                    <th>INITIATIVES</th>
                                    <th class="text-center"></th>
                                    <%--<th class="text-left">START/ALLOCATION</th>--%>
                                <%--<th class="text-center">IMPLEMENTATION</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class=""  data-toggle="modal" data-target="#myModal">
                                    <td class="col-sm-1">
                                        <input type="checkbox" class="form-control" /></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                        <%--<br />
                                    <br />
                                    <div class="">
                                <div class="box" style="font-size: 14px; height: 200px; width: 200px; line-height: 200px; vertical-align: middle; text-align: center; border: 3px solid #ddd; border-style: dashed; ">
                                    <span>Upload Image here</span>
                                </div>
                            </div>--%>
                                    </td>
                                    <td>
                                        <div class="text-center info-stat">
                                            <div class="dates info-stat-txt">

                                                
                                                <span class="info-stat-content">
                                                    <span class="month">Sep</span>
                                                    <br />
                                                    <span class="day">01</span>

                                                </span>
                                                <span class="info-stat-title">Start</span>
                                            </div>
                                            <%--<p>Start<br />Sep<br />01</p>--%>
                                        </div>
                                        <div class="dates text-center info-stat">
                                            <div class="info-stat-txt">
                                               
                                                <span class="info-stat-content">
                                                    <span class="num">1,000</span>
                                                </span>
                                                 <span class="info-stat-title">Allocation</span>
                                            </div>
                                        </div>
                                    </td>
                                    <%--<td class="text-center" style="border-left: 1px solid #ddd;">
                                    <div class="dates">
                                        <span class="month">Sep</span>
                                        <br />
                                        <span class="day">01</span>
                                    </div>
                                </td>
                                <td class="text-center"><span>1000</span></td>--%>
                                    <%--<td class="text-center">
                                    <div><span class="">Pending</span></div>
                                </td>--%>
                                </tr>
                                <tr class="">
                                    <td class="col-sm-1">
                                        <input type="checkbox" class="form-control" /></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                        <%--<br />
                                    <br />
                                    <div class="">
                                <div class="box" style="font-size: 14px; height: 200px; width: 200px; line-height: 200px; vertical-align: middle; text-align: center; border: 3px solid #ddd; border-style: dashed; ">
                                    <span>Upload Image here</span>
                                </div>
                            </div>--%>
                                    </td>
                                    <td>
                                        <div class="text-center info-stat">
                                            <div class="dates info-stat-txt">

                                                
                                                <span class="info-stat-content">
                                                    <span class="month">Sep</span>
                                                    <br />
                                                    <span class="day">01</span>

                                                </span>
                                                <span class="info-stat-title">Start</span>
                                            </div>
                                            <%--<p>Start<br />Sep<br />01</p>--%>
                                        </div>
                                        <div class="dates text-center info-stat">
                                            <div class="info-stat-txt">
                                               
                                                <span class="info-stat-content">
                                                    <span class="num">1,000</span>
                                                </span>
                                                 <span class="info-stat-title">Allocation</span>
                                            </div>
                                        </div>
                                    </td>
                                    <%--<td class="text-center" style="border-left: 1px solid #ddd;">
                                    <div class="dates">
                                        <span class="month">Sep</span>
                                        <br />
                                        <span class="day">01</span>
                                    </div>
                                </td>
                                <td class="text-center"><span>1000</span></td>--%>
                                    <%--<td class="text-center">
                                    <div><span class="">Pending</span></div>
                                </td>--%>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="" style="display: none;">
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th class="col-md-1"></th>
                                    <th>INITIATIVES</th>
                                    <th class="text-center"></th>
                                    <%--<th class="text-left">START/ALLOCATION</th>--%>
                                <%--<th class="text-center">IMPLEMENTATION</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="">
                                    <td class="col-sm-1">
                                        <input type="checkbox" class="form-control" /></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                        <%--<br />
                                    <br />
                                    <div class="">
                                <div class="box" style="font-size: 14px; height: 200px; width: 200px; line-height: 200px; vertical-align: middle; text-align: center; border: 3px solid #ddd; border-style: dashed; ">
                                    <span>Upload Image here</span>
                                </div>
                            </div>--%>
                                    </td>
                                    <td>
                                        <div class="text-center info-stat">
                                            <div class="dates info-stat-txt">

                                                <span class="info-stat-title">Start</span>
                                                <span class="info-stat-content">
                                                    <span class="month">Sep</span>
                                                    <br />
                                                    <span class="day">01</span>

                                                </span>
                                            </div>
                                            <%--<p>Start<br />Sep<br />01</p>--%>
                                        </div>
                                        <div class="dates text-center info-stat">
                                            <div class="info-stat-txt">
                                                <span class="info-stat-title">Allocation</span>
                                                <span class="info-stat-content">
                                                    <span class="num">1,000</span>
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                    <%--<td class="text-center" style="border-left: 1px solid #ddd;">
                                    <div class="dates">
                                        <span class="month">Sep</span>
                                        <br />
                                        <span class="day">01</span>
                                    </div>
                                </td>
                                <td class="text-center"><span>1000</span></td>--%>
                                    <%--<td class="text-center">
                                    <div><span class="">Pending</span></div>
                                </td>--%>
                                </tr>
                                <tr class="">
                                    <td class="col-sm-1">
                                        <input type="checkbox" class="form-control" /></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                        <%--<br />
                                    <br />
                                    <div class="">
                                <div class="box" style="font-size: 14px; height: 200px; width: 200px; line-height: 200px; vertical-align: middle; text-align: center; border: 3px solid #ddd; border-style: dashed; ">
                                    <span>Upload Image here</span>
                                </div>
                            </div>--%>
                                    </td>
                                    <td>
                                        <div class="text-center info-stat">
                                            <div class="dates info-stat-txt">

                                                <span class="info-stat-title">Start</span>
                                                <span class="info-stat-content">
                                                    <span class="month">Sep</span>
                                                    <br />
                                                    <span class="day">01</span>

                                                </span>
                                            </div>
                                            <%--<p>Start<br />Sep<br />01</p>--%>
                                        </div>
                                        <div class="dates text-center info-stat">
                                            <div class="info-stat-txt">
                                                <span class="info-stat-title">Allocation</span>
                                                <span class="info-stat-content">
                                                    <span class="num">1,000</span>
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                    <%--<td class="text-center" style="border-left: 1px solid #ddd;">
                                    <div class="dates">
                                        <span class="month">Sep</span>
                                        <br />
                                        <span class="day">01</span>
                                    </div>
                                </td>
                                <td class="text-center"><span>1000</span></td>--%>
                                    <%--<td class="text-center">
                                    <div><span class="">Pending</span></div>
                                </td>--%>
                                </tr>
                                <tr class="">
                                    <td class="col-sm-1">
                                        <input type="checkbox" class="form-control" /></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                        <%--<br />
                                    <br />
                                    <div class="">
                                <div class="box" style="font-size: 14px; height: 200px; width: 200px; line-height: 200px; vertical-align: middle; text-align: center; border: 3px solid #ddd; border-style: dashed; ">
                                    <span>Upload Image here</span>
                                </div>
                            </div>--%>
                                    </td>
                                    <td>
                                        <div class="text-center info-stat">
                                            <div class="dates info-stat-txt">

                                                <span class="info-stat-title">Start</span>
                                                <span class="info-stat-content">
                                                    <span class="month">Sep</span>
                                                    <br />
                                                    <span class="day">01</span>

                                                </span>
                                            </div>
                                            <%--<p>Start<br />Sep<br />01</p>--%>
                                        </div>
                                        <div class="dates text-center info-stat">
                                            <div class="info-stat-txt">
                                                <span class="info-stat-title">Allocation</span>
                                                <span class="info-stat-content">
                                                    <span class="num">1,000</span>
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                    <%--<td class="text-center" style="border-left: 1px solid #ddd;">
                                    <div class="dates">
                                        <span class="month">Sep</span>
                                        <br />
                                        <span class="day">01</span>
                                    </div>
                                </td>
                                <td class="text-center"><span>1000</span></td>--%>
                                    <%--<td class="text-center">
                                    <div><span class="">Pending</span></div>
                                </td>--%>
                                </tr>
                                <tr class="">
                                    <td class="col-sm-1">
                                        <input type="checkbox" class="form-control" /></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                        <%--<br />
                                    <br />
                                    <div class="">
                                <div class="box" style="font-size: 14px; height: 200px; width: 200px; line-height: 200px; vertical-align: middle; text-align: center; border: 3px solid #ddd; border-style: dashed; ">
                                    <span>Upload Image here</span>
                                </div>
                            </div>--%>
                                    </td>
                                    <td>
                                        <div class="text-center info-stat">
                                            <div class="dates info-stat-txt">

                                                <span class="info-stat-title">Start</span>
                                                <span class="info-stat-content">
                                                    <span class="month">Sep</span>
                                                    <br />
                                                    <span class="day">01</span>

                                                </span>
                                            </div>
                                            <%--<p>Start<br />Sep<br />01</p>--%>
                                        </div>
                                        <div class="dates text-center info-stat">
                                            <div class="info-stat-txt">
                                                <span class="info-stat-title">Allocation</span>
                                                <span class="info-stat-content">
                                                    <span class="num">1,000</span>
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                    <%--<td class="text-center" style="border-left: 1px solid #ddd;">
                                    <div class="dates">
                                        <span class="month">Sep</span>
                                        <br />
                                        <span class="day">01</span>
                                    </div>
                                </td>
                                <td class="text-center"><span>1000</span></td>--%>
                                    <%--<td class="text-center">
                                    <div><span class="">Pending</span></div>
                                </td>--%>
                                </tr>
                                <tr class="">
                                    <td class="col-sm-1">
                                        <input type="checkbox" class="form-control" /></td>
                                    <td style="border-left: 1px solid rgb(242, 242, 242);">
                                        <div class="product">
                                            <span class="prodName">Ceelin Plus Rainy Days In-Store Bundling</span>
                                            <br />
                                            <%--<span class="prodDesc">Start Date: 1-Sep-2016 | Allocation: 1,000</span>--%>
                                            <span class="prodDesc">Status: <span class="label label-info">Pending</span></span>
                                            <br />
                                            <ul class="tags">
                                                <li class="filter-item">Promotion</li>
                                                <li class="filter-item">Warehouse Bundling</li>
                                                <li class="filter-item">OTX</li>
                                                <li class="filter-item">Pediatrica</li>
                                                <li class="filter-item">Ceelin</li>
                                            </ul>
                                        </div>

                                        <%--<br />
                                    <br />
                                    <div class="">
                                <div class="box" style="font-size: 14px; height: 200px; width: 200px; line-height: 200px; vertical-align: middle; text-align: center; border: 3px solid #ddd; border-style: dashed; ">
                                    <span>Upload Image here</span>
                                </div>
                            </div>--%>
                                    </td>
                                    <td>
                                        <div class="text-center info-stat">
                                            <div class="dates info-stat-txt">

                                                <span class="info-stat-title">Start</span>
                                                <span class="info-stat-content">
                                                    <span class="month">Sep</span>
                                                    <br />
                                                    <span class="day">01</span>

                                                </span>
                                            </div>
                                            <%--<p>Start<br />Sep<br />01</p>--%>
                                        </div>
                                        <div class="dates text-center info-stat">
                                            <div class="info-stat-txt">
                                                <span class="info-stat-title">Allocation</span>
                                                <span class="info-stat-content">
                                                    <span class="num">1,000</span>
                                                </span>
                                            </div>
                                        </div>
                                    </td>
                                    <%--<td class="text-center" style="border-left: 1px solid #ddd;">
                                    <div class="dates">
                                        <span class="month">Sep</span>
                                        <br />
                                        <span class="day">01</span>
                                    </div>
                                </td>
                                <td class="text-center"><span>1000</span></td>--%>
                                    <%--<td class="text-center">
                                    <div><span class="">Pending</span></div>
                                </td>--%>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <div class="text-center">
                        <h4 class="modal-title" id="myModalLabel">Tiki- Tiki Nutrition Month Bundling Promo</h4>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Status</label>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <select class="form-control">
                                            <option>-Select-</option>
                                            <option>For Sell-In</option>
                                            <option>Waiting for Approval</option>
                                            <option>Waiting for LOA</option>
                                            <option>Approved by Account, for Implementation</option>
                                            <option>Implemented</option>
                                            <option>Approved by Account, for Implementation</option>
                                            <option>Approved by Account, for Implementation</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Picture</label>
                                <div class="box" style="height: 200px; width: 100%; line-height: 200px; vertical-align: middle; text-align: center; border: 3px solid #ddd; margin: auto; border-style: dashed; ">
                                    <span>Upload Image here</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="">Date</label>
                                <input type="date" class="form-control" id="date" />
                            </div>
                            <div class="form-group">
                                <label for="">Actual Bundle</label>
                                <input type="number" class="form-control" id="num" />
                            </div>
                            <div class="form-group">
                                <label for="">Remarks</label>
                                <textarea class="form-control" rows="5"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

