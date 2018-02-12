<%@ Page Title="" Language="C#" MasterPageFile="~/Disers.master" AutoEventWireup="true" CodeFile="ce_competitors.aspx.cs" Inherits="ce_competitors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /*.upper-navbar-wrapper .navbar {
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
                        <li><a href="ce_implementation_check.aspx">Initiatives Check</a></li>
                        <li class="active"><a href="#">Competitor's Activity</a></li>
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
                    <div class="panel-heading"><a class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i>Add competitor</a></div>
                    <table class="table table-hover ">
                        <thead>
                            <tr class="">
                                <th style="width: 4%;"></th>
                                <th>Category</th>
                                <th>Brand</th>
                                <th>Competitor</th>
                                <th>Initiative</th>
                                <th>Activity Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="6" class="text-center">No Data</td>
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
                    <h4 class="modal-title text-center" id="myModalLabel">New Competitor</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-offset-2 col-md-8">
                            <div class="form-group">
                                <label>Category</label>
                                <select class="form-control">
                                    <option>-Select-</option>
                                    <option>OTC Livewell</option>
                                    <option>Personal Care</option>
                                    <option>New Customer Platform</option>
                                    <option>New Customer Platform</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Competitor Brand</label>
                                <input class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>Competitor Name</label>
                                <input class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>Initiative</label>
                                <input class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>Activity Date/Period(Duration/Date Observed)</label>
                                <input class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Picture</label>
                                <div class="box" style="height: 200px; width: 100%; line-height: 200px; vertical-align: middle; text-align: center; border: 3px solid #ddd; margin: auto; border-style: dashed; ">
                                    <span>Upload Image here</span>
                                </div>
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

