<%@ Page Title="" Language="C#" MasterPageFile="~/Disers.master" AutoEventWireup="true" CodeFile="ce_review_plans.aspx.cs" Inherits="ce_review_plans" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

        /*.lower-navbar-wrapper .navbar{
    background-color: #48CFAD;
}
        .lower-navbar-wrapper .navbar-default .navbar-nav>.active>a, 
.lower-navbar-wrapper .navbar-default .navbar-nav>.active>a:focus, 
.lower-navbar-wrapper .navbar-default .navbar-nav>.active>a:hover{
    background-color: transparent;
    border-bottom: 2px solid #A0D468;
    color: #767171;
    color: #fff;
    color: #FF6408;
}

.lower-navbar-wrapper .navbar-default .navbar-nav > li > a:hover {
    background-color: transparent;
    border-bottom: 2px solid #A0D468;
    color: #767171;
    color: #fff;
    color: #FF6408;
}

.lower-navbar-wrapper .navbar-default .navbar-nav>li>a{
    color: rgba(0,0,0,.175);
    color: 	#767171;
    color: #fff;
    color: #FF6408;
}*/


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-header-2-wrapper" style="">
        <div class="text-center">
            <h4>Implementation Check</h4>
        </div>
    </div>
    <div class="lower-navbar-wrapper">
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-collapse collapse">
                    <ul class="nav nav-justified">
                        <li class="active"><a href="ce_review_plans.aspx">Review Plans</a></li> 
                        <li><a href="ce_implementation_check.aspx">Initiatives Check</a></li>
                        <li><a href="ce_competitors.aspx">Competitor's Activity</a></li>
                        <li><a href="ce_closing.aspx">Closing</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="page-header-customer">
        <div class="text-left">
            
        <%--<h4>Customer Name</h4>--%>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                        <div class="panel-heading">
                            <strong>Pending Implementation</strong>
                        </div>
                        <table class="table table-hover nowrap">
                            <thead>
                                <tr class="">
                                    <th style="width: 4%;">Status</th>
                                    <th>Account Name</th>
                                    <th>Branches</th>
                                    <th>Activity</th>
                                    <th style="width: 15%;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" class="form-control"/></td>
                                    <td>Robinsons</td>
                                    <td>Robinsons Balagtas</td>
                                    <td>Implementation Check</td>
                                    <td><a class="btn btn-primary btn-group-justified" href="ce_implementation_check.aspx">Visit</a></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="form-control"/></td>
                                    <td>Robinsons</td>
                                    <td>Robinsons Balagtas</td>
                                    <td>Implementation Check</td>
                                    <td><a class="btn btn-primary btn-group-justified">Visit</a></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="form-control"/></td>
                                    <td>Robinsons</td>
                                    <td>Robinsons Balagtas</td>
                                    <td>Implementation Check</td>
                                    <td><a class="btn btn-primary btn-group-justified">Visit</a></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="form-control"/></td>
                                    <td>Robinsons</td>
                                    <td>Robinsons Balagtas</td>
                                    <td>Implementation Check</td>
                                    <td><a class="btn btn-primary btn-group-justified">Visit</a></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="form-control"/></td>
                                    <td>Robinsons</td>
                                    <td>Robinsons Balagtas</td>
                                    <td>Implementation Check</td>
                                    <td><a class="btn btn-primary btn-group-justified">Visit</a></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="form-control"/></td>
                                    <td>Robinsons</td>
                                    <td>Robinsons Balagtas</td>
                                    <td>Implementation Check</td>
                                    <td><a class="btn btn-primary btn-group-justified">Visit</a></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="form-control"/></td>
                                    <td>Robinsons</td>
                                    <td>Robinsons Balagtas</td>
                                    <td>Implementation Check</td>
                                    <td><a class="btn btn-primary btn-group-justified">Visit</a></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="form-control"/></td>
                                    <td>Robinsons</td>
                                    <td>Robinsons Balagtas</td>
                                    <td>Implementation Check</td>
                                    <td><a class="btn btn-primary btn-group-justified">Visit</a></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="form-control"/></td>
                                    <td>Robinsons</td>
                                    <td>Robinsons Balagtas</td>
                                    <td>Implementation Check</td>
                                    <td><a class="btn btn-primary btn-group-justified">Visit</a></td>
                                </tr>
                            </tbody>
                        </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

