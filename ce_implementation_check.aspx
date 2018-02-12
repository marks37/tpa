<%@ Page Title="" Language="C#" MasterPageFile="~/Disers.master" AutoEventWireup="true" CodeFile="ce_implementation_check.aspx.cs" Inherits="ce_implementation_check" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /*.upper-navbar-wrapper .navbar{
    background-color: #4471C4;
    background-color: #4D8FAC;
    background-color: #48929B;
    background-color: #3794D5;
    background-color: #4A89DC;
    background-color: #37BC9B;


-webkit-box-shadow: 0px 0px 0px 0px rgba(97,97,97,1);
-moz-box-shadow: 0px 0px 0px 0px rgba(97,97,97,1);
box-shadow: 0px 0px 0px 0px rgba(97,97,97,1);
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-header-2-wrapper">
        <div class="text-center">
            <h4>Account Name</h4>
        </div>
    </div>
    <div class="lower-navbar-wrapper">
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-collapse collapse">
                    <ul class="nav nav-justified">
                        <li><a href="ce_review_plans.aspx">Review Plans</a></li>
                        <li class="active"><a href="ce_implementation_check.aspx">Initiatives Check</a></li>
                        <li><a href="ce_competitors.aspx">Competitor's Activity</a></li>
                        <li><a href="ce_closing.aspx">Closing</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="page-header-customer">
        <div class="text-center">
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">

                    <table class="table table-hover ">
                        <thead>
                            <tr class="info">
                                <th style="width: 4%;"></th>
                                <th>Initiative Title</th>
                                <th>Initiative Sub-Type</th>
                                <th>Brand</th>
                                <th>Category</th>
                                <th>Start Date</th>
                                <th>Allocation</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-toggle="modal" data-target="#myModal">
                                <td>
                                    <input type="checkbox" class="form-control" /></td>
                                <td>Tiki- Tiki Nutrition Month Bundling Promo</td>
                                <td>Promotions/ In-Store Bundling</td>
                                <td>Tiki-Tiki</td>
                                <td>OTX</td>
                                <td>June 01, 2016</td>
                                <td>10,000</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" class="form-control" /></td>
                                <td>Nutroplex Back to School Bundling Promo</td>
                                <td>Promotions/ In-Store Bundling</td>
                                <td>Nutroplex</td>
                                <td>OTX</td>
                                <td>June 01, 2016</td>
                                <td>70,000</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" class="form-control" /></td>
                                <td>Ceelin and Ceelin Plus Back to School Bundling Promo</td>
                                <td>Promotions/ In-Store Bundling</td>
                                <td>Ceelin</td>
                                <td>OTX</td>
                                <td>June 01, 2016</td>
                                <td>80,000</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" class="form-control" /></td>
                                <td>Myra Beauty Madness (BOTO Promo) for SM Group and Robinsons</td>
                                <td>Promotions/ In-Store Bundling</td>
                                <td>Myra</td>
                                <td>PC</td>
                                <td>June 01, 2016</td>
                                <td>60,000</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" class="form-control" /></td>
                                <td>pH Care 150ml with pH Care Minis 30ml In-store Bundling Promo</td>
                                <td>Promotions/ In-Store Bundling</td>
                                <td>pH Care</td>
                                <td>PCB</td>
                                <td>June 01, 2016</td>
                                <td>50,000</td>
                            </tr>
                        </tbody>
                    </table>
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

