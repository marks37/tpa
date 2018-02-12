<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.master" AutoEventWireup="true" CodeFile="UpdateImplementationTemplate.aspx.cs" Inherits="UpdateImplementationTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <section id="page-header">
        <div class="container-fluid">
            <a class="page-breadcrumb">Home / TPA Reports / Implementation Reports</a>
            <h3 class="page-title">OCT 2016 – Implementation Template</h3>
            <!-- Nav tabs -->
            <div class="right-tabs clearfix">
                <ul class="nav nav-tabs" role="tablist" id="tabs">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" style="border-top: 3px solid #ff6a00;">Template</a></li>
                    <li role="presentation"><a href="#">Initiatives</a></li>
                    <li role="presentation"><a href="#">Pulse</a></li>
                    <li role="presentation"><a href="#">Graphs</a></li>
                </ul>
            </div>
        </div>
    </section>

    <br />
    <section id="page-content">
        <div class="container-fluid">
            <h4>Upload Report</h4>
            <div class="row">
                <section class="container-fluid">
                    <div class="wizard">
                        <div class="wizard-inner">
                            <div class="connecting-line"></div>
                            <ul class="nav nav-tabs" role="tablist">

                                <li role="presentation" class="active">
                                    <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-folder-open"></i>
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="disabled">
                                    <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-pencil"></i>
                                        </span>
                                    </a>
                                </li>
                                <li role="presentation" class="disabled">
                                    <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-picture"></i>
                                        </span>
                                    </a>
                                </li>

                                <li role="presentation" class="disabled">
                                    <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                                        <span class="round-tab">
                                            <i class="glyphicon glyphicon-ok"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div role="form">
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="step1">
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
                                    <a type="button" class="btn btn-default" href="Implementation_Template.aspx">Cancel</a>&nbsp;
                                    <button type="submit" class="btn btn-primary">Next</button>

                                    <%--<h3>Step 1</h3>
                                    <p>This is step 1</p>
                                    <ul class="list-inline pull-right">
                                        <li>
                                            <button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                                    </ul>--%>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="step2">
                                    <h3>Step 2</h3>
                                    <p>This is step 2</p>
                                    <ul class="list-inline pull-right">
                                        <li>
                                            <button type="button" class="btn btn-default prev-step">Previous</button></li>
                                        <li>
                                            <button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                                    </ul>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="step3">
                                    <h3>Step 3</h3>
                                    <p>This is step 3</p>
                                    <ul class="list-inline pull-right">
                                        <li>
                                            <button type="button" class="btn btn-default prev-step">Previous</button></li>
                                        <li>
                                            <button type="button" class="btn btn-default next-step">Skip</button></li>
                                        <li>
                                            <button type="button" class="btn btn-primary btn-info-full next-step">Save and continue</button></li>
                                    </ul>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="complete">
                                    <h3>Complete</h3>
                                    <p>You have successfully completed all steps.</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>
</asp:Content>

