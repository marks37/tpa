<%@ Page Title="Visibility" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="admin_view_visibility.aspx.cs" Inherits="admin_view_visibility" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            margin-bottom: 70px;
        }

        #main_navbar {
            /*display:none;*/
        }

        .modal-header {
            border-bottom-width: 2px;
        }

        .modal-body {
            max-height: 100%;
            height: 100%;
            min-height: 100%;
        }

        .modal-footer {
            border-top-width: 2px;
        }

        #visibility > tbody > tr > .custom-row-1 {
            /*padding-bottom: 0px;*/
        }

        #visibility > tbody > tr > .custom-row-2 {
            /*padding-top: 0px;*/
        }

        .details-box {
            border: 1px solid #ddd;
            padding: 15px;
        }

        #visibility > thead > tr > th:first-child {
            padding-left: 20px;
        }

        #visibility > thead > tr > th:last-child {
            /*padding-right: 30px;*/
        }

        #visibility > tbody > tr:first-child > td:last-child {
            /*padding-left: 30px;*/
        }

        #visibility > tbody > tr > td {
            /*border-top: 0;*/
            /*border: 0;*/
        }


        #visibility > tbody:nth-child(even) {
            background: #f9f9f9;
        }

        #visibility > tbody {
            /*background: #f9f9f9;*/
        }

            #visibility > tbody:hover {
                background: #f5f5f5;
            }

        #visibility {
            counter-reset: rowNumber;
        }

            #visibility > tbody {
                counter-increment: rowNumber;
            }

                #visibility > tbody tr:first-child td:first-child > address {
                    margin-left: 15px;
                    /*float: right;*/
                }

                #visibility > tbody tr:first-child td:first-child::before {
                    /*content: counter(rowNumber)". ";
                    min-width: 1em;
                    margin-right: 0.5em;*/
                }

                #visibility > tbody, #visibility > tbody + tbody {
                    border-top: 1px solid #ddd;
                    border-bottom: 1px solid #ddd;
                }

        #visib_pictures > tbody > tr > td {
            padding-top: 20px;
            padding-bottom: 20px;
            /*border-bottom: 1px solid #ddd;*/
            vertical-align: top;
        }

        #visib_pictures > tbody > tr:first-child > td {
            border-top: 0;
        }

        #visib_pictures {
            background-color: transparent !important;
        }

        .modal-body {
            background: #F5F5F5;
        }

        #loadingModal {
            position: fixed;
            z-index: 9000;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: rgba( 255, 255, 255, .8 ) url('http://i.stack.imgur.com/FhHRx.gif') 50% 50% no-repeat;
        }

        /* When the body has the loading class, we turn
           the scrollbar off with overflow:hidden */
        body.loading {
            overflow: hidden;
        }

            /* Anytime the body has the loading class, our
           modal element will be visible */
            body.loading #loadingmodal {
                display: block;
            }
    </style>
    <link href="Content/select2.min.css" rel="stylesheet" />
    <link href="Content/select2-bootstrap.min.css" rel="stylesheet" />
    <link href="Content/select2-bootstrap.css" rel="stylesheet" />
    <script src="Scripts/select2.min.js"></script>
    <link href="Content/jquery-ui.css" rel="stylesheet" />
    <link href="Content/bootstrap-modal-carousel.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap-modal-carousel.min.js"></script>
    <script src="Scripts/demo.min.js"></script>
    <script src="Scripts/AsyncFileUploadValidationPlugin.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="" style="display: none">
        <div class="navbar navbar-default navbar-fixed-top" style="">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Visibility.aspx"><i class="fa fa-long-arrow-left"></i></a>
                    <a class="navbar-brand" href="#">Visibility Home</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                    </ul>
                    <%--<div class="navbar-form navbar-right">
                        <button type="submit" class="btn btn-success">Save As Draft</button>
                    </div>--%>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </div>
    </div>
    <div class="" style="display: none">
        <div class="navbar navbar-default navbar-fixed-bottom" style="">
            <div class="container">
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                    <ul class="nav navbar-nav">
                    </ul>
                    <div class="navbar-form navbar-right">
                        <button type="submit" class="btn btn-success">Save As Draft</button>
                    </div>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </div>
    </div>
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="Visibility.aspx">Home</a></li>
            <li class="active">Visibility Data</li>
        </ol>
        <h3 class="text-muted hidden">
            <%string workplanId = Request.QueryString["pk"]; %>
            <%=getWorkplan(workplanId).Status %>
            <%Response.Write(DateTime.Now);%>
        </h3>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <%--<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>--%>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="parentRepeater" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:Label ID="validationSummary" runat="server"></asp:Label>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <h4><strong>Account Branch:</strong> <%=getWorkplan(workplanId).BranchName %></h4>
                            <h4><strong>Call Date:</strong> <%=getWorkplan(workplanId).CallDate%></h4>
                        </div>
                        <%--<div class="form-group">
                            <label>ACCOUNT</label>
                            <select class="form-control" id="branchSelect">
                                <option></option>
                                <%=loadBranches()%>
                            </select>
                            <asp:HiddenField ID="branchHidden" runat="server" />
                        </div>--%>
                    </div>
                    <div class="col-md-6">

                        <%--<div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">CALL DATE</div>
                                <input type="date" class="form-control">
                            </div>
                        </div>--%>
                        <%--<div class="form-group">
                            <label>CALL DATE</label>
                            <input type="date" class="form-control" id="callDate" />
                            <asp:HiddenField ID="callDateHidden" runat="server" />
                        </div>--%>
                    </div>
                </div>
                <br />
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="test123" runat="server" Text="refresh" OnClick="test_Click" CssClass="hidden" />
                        <div class="table-responsive">
                            <table id="visibility" class="table table-condensed" style="">
                                <thead>
                                    <tr>
                                        <th class="col-md-4">ITEMS</th>
                                        <th class="col-md-2">MEASURES</th>
                                        <th class="text-center col-md-1">HIT</th>
                                        <th class="text-center col-md-1">MISS</th>
                                        <th class="col-md-2 text-center">REMARKS</th>
                                        <th class="col-md-2 text-center">PICTURES</th>
                                    </tr>
                                </thead>
                                <asp:PlaceHolder ID="surveyForm" runat="server"></asp:PlaceHolder>
                                <asp:Repeater ID="parentRepeater" runat="server" OnItemDataBound="R1_ItemDataBound">
                                    <ItemTemplate>
                                        <tbody>
                                            <tr>
                                                <td rowspan="3">
                                                    <address>
                                                        <br />
                                                        <strong><%# DataBinder.Eval(Container.DataItem, "itemCode") %><asp:HiddenField ID="HiddenFieldId1" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id") %>' />
                                                        </strong>
                                                        <br>
                                                        <%# DataBinder.Eval(Container.DataItem, "category") %><br>
                                                        <%# DataBinder.Eval(Container.DataItem, "brand") %><br>
                                                        <%# DataBinder.Eval(Container.DataItem, "display_type") %>
                                                    </address>
                                                </td>
                                            </tr>
                                            <%--DataSource='<%# Eval("standard") %>'--%>
                                            <asp:Repeater ID="childRepeater" runat="server" OnItemCommand="childRepeater_ItemCommand" OnItemDataBound="R2_ItemDataBound">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="custom-row-1">
                                                            <%# Eval("name") %><asp:HiddenField ID="HiddenFieldId2" runat="server" Value='<%# Eval("id") %>' />
                                                            <br />
                                                            <asp:Label ID="itemValidate" runat="server" Text=""></asp:Label>
                                                        </td>
                                                        <td class="custom-row-1 text-center">
                                                            <div class="radio radio-success">
                                                                <%--<input type="radio" name="optionsRadios<%# Eval("id") %>" id="optionsRadios1<%# Eval("id") %>" value="option">
                                                    <label for="optionsRadios1<%# Eval("id") %>">
                                                    </label>--%>
                                                                <asp:RadioButton ID="hitRadio" runat="server" GroupName="a" Checked='<%# ProcessMyDataItem(Eval("hit")) %>' />
                                                                <asp:Label ID="Label2" AssociatedControlID="hitRadio" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="custom-row-1 text-center">
                                                            <div class="radio radio-danger">
                                                                <%--<input type="radio" name="optionsRadios<%# Eval("id") %>" id="optionsRadios2<%# Eval("id") %>" value="option">
                                                    <label for="optionsRadios2<%# Eval("id") %>">
                                                    </label>--%>
                                                                <asp:RadioButton ID="missRadio" runat="server" GroupName="a" Checked='<%# ProcessMyDataItem(Eval("miss")) %>' />
                                                                <asp:Label ID="Label1" AssociatedControlID="missRadio" runat="server" Text=""></asp:Label>
                                                            </div>
                                                        </td>
                                                        <td class="text-center">
                                                            <asp:TextBox ID="remarks" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="2" Text='<%# Eval("remarks") %>'></asp:TextBox>

                                                        </td>
                                                        <td class="">
                                                            <div class="text-center">
                                                                <%--<a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">Add Picture</a>--%>
                                                                <%--<a class="btn btn-default btn-sm" href="New_Visibility_Pictures.aspx?pk=<%=Request.QueryString["pk"]%>&item=<%# Eval("id") %>">Add Picture</a>--%>
                                                                <asp:Button ID="addPicBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Add Picture" CommandName="addPicture" CommandArgument='<%# Eval("id") %>' CausesValidation="false" />
                                                            </div>

                                                            <%--<img id="blah<%# Eval("id") %>" class="blah" src="#" alt="your image" height="50" width="50" style="display: none;" />
                                                <label class="btn btn-default btn-file">
                                                    Add Picture
                                                    <input type='file' id="imgInp<%# Eval("id") %>" class="imgInp" style="display: none;" />
                                                </label>--%>
                                                        </td>
                                                    </tr>
                                                    <%--<tr>
                                            <td class="custom-row-2 sub-col">Stock Weights</td>
                                            <td class="custom-row-2 sub-col text-center">
                                                <div class="radio radio-success">
                                                    <input type="radio" name="optionsRadios2" id="optionsRadios3" value="option1">
                                                    <label for="optionsRadios3">
                                                    </label>
                                                </div>
                                            </td>
                                            <td class="custom-row-2 sub-col text-center">
                                                <div class="radio radio-danger">
                                                    <input type="radio" name="optionsRadios2" id="optionsRadios4" value="option1">
                                                    <label for="optionsRadios4optionsRadios4">
                                                    </label>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <textarea rows="2" class="form-control"></textarea>
                                            </td>
                                            <td class="text-center">
                                                <a class="btn btn-default btn-sm">Add Picture</a>
                                            </td>
                                        </tr>--%>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="saveBtn" />
                        <asp:AsyncPostBackTrigger ControlID="test123" />
                    </Triggers>
                </asp:UpdatePanel>

                <br />
            </div>
        </div>

        <div class="text-center col-md-4">
            <%--<a class="btn btn-primary btn-block">Save!</a>--%>
            <%--<asp:Button ID="cancelBtn" CssClass="btn btn-default btn-block" runat="server" Text="Cancel" OnClick="cancelBtn_Click" />--%>
            <a href="admin_visibility.aspx" class="btn btn-primary btn-block">Back</a>
            <%--<asp:Button ID="backBtn" CssClass="btn btn-primary" runat="server" Text="Back" />--%>
        </div>

        <div class="text-center col-md-4">
            <%--<a class="btn btn-primary btn-block">Save!</a>--%>
            <asp:Button ID="saveDraftBtn" CssClass="btn btn-primary btn-block" runat="server" Text="Save as Draft" OnClick="saveDraftBtn_Click" />
        </div>
        <div class="text-center col-md-4">
            <asp:Button ID="submitBtn" CssClass="btn btn-primary btn-block" runat="server" Text="Submit" OnClick="submitBtn_Click" />
        </div>
        <div class="clearfix"></div>

    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-header">
                            <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                            <h4 class="modal-title text-left" id="myModalLabel">
                                <asp:Label ID="modalTitle" runat="server" Text="Label"></asp:Label><asp:HiddenField ID="responseIdHidden" runat="server" />
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div style="min-height: 400px;">
                                <asp:Label ID="pictureMessage" runat="server"></asp:Label>
                                <div class="">
                                    <table id="visib_pictures" class="table">
                                        <tbody>
                                            <asp:Repeater ID="picRepeater" runat="server" OnItemDataBound="picRepeater_ItemDataBound" OnItemCommand="picRepeater_ItemCommand">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <asp:HiddenField ID="HiddenFieldPicId" runat="server" />
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-md-4 col-sm-4 text-center">
                                                                    <div class="">
                                                                        <img src="<%# DataBinder.Eval(Container.DataItem, "filePath") %>" class="img-responsive" alt="<%# DataBinder.Eval(Container.DataItem, "name") %>" />
                                                                        <span><strong>FileName:</strong> <%# DataBinder.Eval(Container.DataItem, "fileName") %><br />
                                                                            <strong>Date:</strong> <%# DataBinder.Eval(Container.DataItem, "dateCreated") %>
                                                                        </span>
                                                                    </div>
                                                                    <br />
                                                                    <br />
                                                                </div>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <div class="">
                                                                        <div class="row">
                                                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                                                <div class="form-group">
                                                                                    <label class="">Branch Code</label>
                                                                                    <div class="">
                                                                                        <asp:TextBox ID="branchCode" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                                                <div class="form-group">
                                                                                    <label class="">Measure</label>
                                                                                    <div class="">
                                                                                        <asp:TextBox ID="measure" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                                                <div class="form-group">
                                                                                    <label class="">Capture Date</label>
                                                                                    <div class="">
                                                                                        <asp:TextBox ID="dateCaptured" CssClass="form-control date" runat="server"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group hidden">
                                                                            <label class="">Shelf Brand</label>
                                                                            <div class="">
                                                                                <%--<select class="form-control" id="">
                                                                                <option>Select Shelf</option>
                                                                            </select>--%>
                                                                                <asp:DropDownList ID="shelfBrandDDL" runat="server" CssClass="form-control" Visible="false">
                                                                                    <asp:ListItem Value="0">-Select Shelf-</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <%--<asp:RequiredFieldValidator Display="Dynamic" InitialValue="0" ID="RequiredFieldValidator1" runat="server" ErrorMessage="<strong class='text-danger'>This is required!</strong>" ControlToValidate="shelfBrandDDL"></asp:RequiredFieldValidator>--%>
                                                                                <asp:Label ID="shelfValidate" runat="server" Text=""></asp:Label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label class="">Remarks</label>
                                                                            <div class="">
                                                                                <asp:TextBox ID="remarks" Rows="2" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <div class="">
                                                                                <asp:Button ID="deleteBtn" runat="server" Text="Delete" CssClass="btn btn-danger" CommandName="deletePic" CommandArgument='<%# Eval("id") %>' />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:PlaceHolder ID="uploadBtnPlaceholder" runat="server">
                                <label class="btn btn-default btn-file pull-left">
                                    Upload Photo
                                                                                <%--<input type="file" id="myFile" name="myFile" runat="server"/>--%>
                                    <ajaxToolkit:AsyncFileUpload ID="myFile" runat="server" ThrobberID="UpdateProgress2" OnClientUploadStarted="checkExtension" OnClientUploadComplete="refreshModal" OnUploadedComplete="myFile_UploadedComplete" CssClass="hidden" />
                                </label>
                            </asp:PlaceHolder>
                            <asp:Button ID="uploadBtn" runat="server" Text="Button" CommandName="uploadPhoto" CssClass="hidden" />
                            <asp:Button ID="refreshBtn" runat="server" Text="Button" OnClick="refreshBtn_Click" CssClass="hidden" />
                            <asp:PlaceHolder ID="closeBtnPlaceholder" runat="server">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </asp:PlaceHolder>
                            <asp:Button ID="cancelBtn" runat="server" CssClass="btn btn-default" Text="Cancel" OnClick="cancelBtn_Click" CausesValidation="false" OnClientClick="closeModal()" />
                            <asp:Button ID="saveBtn" runat="server" CssClass="btn btn-primary" Text="Save changes" OnClick="saveBtn_Click" CausesValidation="true" />

                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="parentRepeater" />
                        <asp:AsyncPostBackTrigger ControlID="refreshBtn" />
                        <asp:AsyncPostBackTrigger ControlID="savebtn" />
                        <asp:AsyncPostBackTrigger ControlID="cancelBtn" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Confirm submission</h4>
                </div>
                <div class="modal-body">
                    <%--Hi! You're visibility report will be submitted for approval. Changes won't be accepted beyond this. Do you wish to continue?--%>
                    <table class="table">
                        <thead>
                            <tr>
                                <td>ITEMS</td>
                                <td>MEASURES</td>
                                <td>HIT</td>
                                <td>MISS</td>
                            </tr>
                        </thead>
                        <asp:Repeater ID="confirmParent" runat="server" OnItemDataBound="confirmParent_ItemDataBound">
                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <td rowspan="3" class="col-md-5">
                                            <address>
                                                <br />
                                                <strong><%# DataBinder.Eval(Container.DataItem, "itemCode") %><asp:HiddenField ID="HiddenFieldId1" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id") %>' />
                                                </strong>
                                                <br>
                                                <%# DataBinder.Eval(Container.DataItem, "category") %><br>
                                                <%# DataBinder.Eval(Container.DataItem, "brand") %><br>
                                                <%# DataBinder.Eval(Container.DataItem, "display_type") %>
                                            </address>
                                        </td>
                                    </tr>
                                    <asp:Repeater ID="confirmChild" runat="server" OnItemDataBound="confirmChild_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="custom-row-1"><%# Eval("name") %><asp:HiddenField ID="HiddenFieldId2" runat="server" Value='<%# Eval("id") %>' />
                                                </td>
                                                <td class="custom-row-1">
                                                    <asp:Label ID="hit" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td class="custom-row-1 text-center">
                                                    <asp:Label ID="miss" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="confirmSubmitBtn" runat="server" Text="Submit" OnClick="confirmSubmitBtn_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="alertModal" tabindex="-1" role="dialog">
        <div class="modal-dialog panel-danger" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Error</h4>
                </div>
                <div class="modal-body">
                    <asp:Label ID="alertMessage" runat="server" Text=""></asp:Label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->




    <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div id="loadingModal">
                <!-- Place at bottom of page -->
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <script type="text/javascript">

        //$(document).on('change', 'input.imgInp', function () {
        //    var input = $(this)[0];
        //    var target = "";
        //    var render = "";

        //    debugger;
        //    var img = $(this).closest('td').find("img.blah");

        //    if (input.files && input.files[0]) {
        //        var reader = new FileReader();

        //        reader.onload = function (e) {
        //            target = e.target.result;
        //            img.attr('src', target);
        //        }
        //        render = reader.readAsDataURL(input.files[0]);
        //    }
        //});

        $("input.imgInp").change(function () {

            //$table = $(this).parents(".modal-dialog").find('.modal-body').find('.table').find('tbody').find('tr:last')
            //.after()


            debugger;
            var img = $(this).closest('td').find("img.blah");

            readURL(this, img);
        });

        function readURL(input, img) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    debugger;

                    img.attr("src", e.target.result);
                    img.css("display", "");
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $('.modal').on('show.bs.modal', function () {
            $('.modal .modal-body').css('overflow-y', 'auto');
            $('.modal .modal-body').css('max-height', $(window).height() * 0.7);
        });

        function UploadFile(btn, input, target) {
            //var name = 'uploadBtn' + a;
            document.getElementById(btn).click();
            //document.getElementsByClassName(name)[0].click();
            //$('.uploadBtn' + a).click();
            //$(".uploadBtn"+a+"").trigger("click");
            //$('#' + target).val($(input).val());
            //alert('success '+$(input).val()+" BTN: "+btn);
        }

        function openModal() {
            $('#myModal').modal({
                backdrop: 'static',
                keyboard: false
            });
            //$('.modal-body').css("max-height", "100%");
        }

        function alertModal() {
            $('#alertModal').modal();
        }

        function refreshModal() {

            <%--$("#<%=myFile.ClientID %>").Validate(
            {
                MessageControlId: "<%=myFileValidation.ClientID%>",
                ValidFileExtensions: ["doc", "docx"]
            });--%>

            $('#<%=refreshBtn.ClientID%>').click();
        }

        function refreshParent() {
            $('#<%=test123.ClientID%>').click();
        }

        function closeModal() {
            $('#myModal').modal('hide');
        }

        function confirmModal() {
            $('#confirmModal').modal({
                backdrop: 'static',
                keyboard: false
            });
        }

        $(document).ready(function () {

        });

        function pageLoad() {
            $('.date').datepicker({
                maxDate: new Date
            });
        }

        function checkExtension(sender, args) {
            var filename = args.get_fileName();
            var ext = filename.substring(filename.lastIndexOf(".") + 1);
            console.log(ext);
            //if (ext != 'png' || 'jpg') {
            if (['png', 'jpg'].indexOf(ext) < 0) {
                throw {
                    name: "Invalid File Type",
                    level: "Error",
                    message: "Invalid File",
                    htmlMessage: "Invalid File"
                }

                return false;
            }
            return true;
        }

    </script>
</asp:Content>

