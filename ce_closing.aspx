<%@ Page Title="" Language="C#" MasterPageFile="~/Disers.master" AutoEventWireup="true" CodeFile="ce_closing.aspx.cs" Inherits="ce_closing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                        <li><a href="ce_competitors.aspx">Competitor's Activity</a></li>
                        <li class="active"><a href="ce_closing.aspx">Closing</a></li>       
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
            <div class="col-md-offset-3 col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">Implementation Check Result</div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

