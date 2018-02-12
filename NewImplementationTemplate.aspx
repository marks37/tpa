<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="NewImplementationTemplate.aspx.cs" Inherits="NewImplementationTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="page-header-wrap">
        <div class="container">
            <a class="page-breadcrumb">Home / TPA Reports /</a>
            <h3 class="page-title">Implementation Reports</h3>
            <!-- Nav tabs -->
            <div class="">
                <ul class="nav nav-tabs" role="tablist" id="tabs">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" style="border-top: 3px solid #ff6a00;">Repositories</a></li>
                </ul>
            </div>
        </div>
    </div>

    <br />

    <div id="page-content-wrap">
        <div class="container-fluid">
            <h4>Create a new Implementation Template</h4>
            <hr />
            <div class="row">
                <div class="col-xs-2 col-sm-2">
                    <div class="form-group">
                        <label>Channel</label>
                        <select class="form-control">
                            <option>LKA</option>
                            <option>GT</option>
                            <option>MT</option>
                            <option>MDC</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-3 col-sm-3">
                    <div class="form-group">
                        <label>Month</label>
                        <input type="date" class="form-control" />
                    </div>
                </div>
                <div class="col-xs-7 col-sm-7">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" class="form-control" value="Implementation Template" />
                    </div>
                </div>
            </div>
            <hr />
            <%--<div class="form-inline">
                <div class="form-group">
                    <label>Month</label>
                    <br />
                    <input type="date" class="form-control" />
                    <strong>&nbsp;&mdash;&nbsp;</strong>
                </div>
                <div class="form-group">
                    <label>Name</label>
                    <br />
                    <input type="text" class="form-control" />
                </div>
            </div>--%>
            <div class="form-group">
                <label>File Upload</label>
                <input type="file" />
                <span id="helpBlock" class="help-block"><strong>Important!</strong> The file should follow this <strong><a>format.</a></strong></span>
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" />
                    <strong>With Headers</strong> 
                </label>
            </div>
            <br />
            <a type="button" class="btn btn-default" href="Implementation_Reports.aspx">Cancel</a>&nbsp;<button type="submit" class="btn btn-primary">Create Template</button>

        </div>
    </div>
</asp:Content>

