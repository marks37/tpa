<%@ Page Title="Visibility" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="view_visibility.aspx.cs" Inherits="new_visibility" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            margin-bottom: 70px;
            background-color: #F5F5F5;
        }

        .details-box {
            border: 1px solid #ddd;
            padding: 15px;
        }

        .input-group-addon-only {
            border-left: 1px solid #ccc !important;
            border-right: 1px solid #ccc !important;
            border-radius: 2px !important;
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

        #visibility > tbody > tr > td {
            /*padding-top:20px;*/
            /*padding-bottom:20px;*/
        }

        #visibility > thead > tr > th {
            border-bottom-width: 0px;
            border-bottom-color: #EEEEEE;
        }

            #visibility > thead > tr > th:first-child {
                /*padding-left: 20px;*/
            }

            #visibility > thead > tr > th:last-child {
                /*padding-right: 30px;*/
            }

        #visibility > tbody > tr:first-child > td:last-child {
            /*padding-left: 30px;*/
        }

        #visibility > tbody > tr > td {
            border-top: 0;
            /*border: 0;*/
        }

        #visibility > tbody + tbody {
            border-top: 1px solid #ddd;
        }


        #visibility > tbody:nth-child(even) {
            /*background: #f9f9f9;*/
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
                    /*border-top: 1px solid #EEEEEE;*/
                    /*border-bottom: 1px solid #EEEEEE;*/
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

        textarea {
            /*height: 1em;
            width: 50%;
            padding: 3px;*/
            /*transition: all 0.5s ease;*/
        }

            textarea:focus {
                /*height: 6em;*/
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="lower-navbar" class="container-fluid">
        <div class="">
            <div class="pull-left">
                <%string workplanId = Request.QueryString["pk"]; %>
                <span style="font-size: 100%;" class="text-muted">Visibility / <%=getWorkplan(workplanId).BranchName %></span>
            </div>
            <div class="pull-right">
                <a id="backBtn" runat="server" class="btn btn-default btn-sm" style="font-size: 18px; padding: 0px 10px;"><span class="text-muted fa fa-long-arrow-left"></span></a>
                <div class="btn-group" role="group">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <asp:LinkButton ID="saveDraftBtn" CssClass="btn btn-default btn-sm" runat="server" OnClick="saveDraftBtn_Click"><span class="">Save as Draft</span></asp:LinkButton>
                            <asp:Button ID="submitBtn" CssClass="btn btn-success btn-sm" runat="server" Text="Submit Visibility to TL" OnClick="submitBtn_Click" />
                            <a class="btn btn-default btn-sm disabled" id="statusBtn" runat="server" visible="false"></a>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="confirmSubmitBtn" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        <div class="clearfix"></div>
    </div>
    </div>

    <div class="" id="main-content-wrapper">

        <div class="container">
            <br />
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <asp:Label ID="validationSummary" ClientIDMode="Static" runat="server">eto yun</asp:Label>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="saveDraftBtn" />
                    <asp:AsyncPostBackTrigger ControlID="submitBtn" />
                    <asp:AsyncPostBackTrigger ControlID="confirmSubmitBtn" />
                </Triggers>
            </asp:UpdatePanel>


            <div class="panel panel-default">

                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-6">
                            <h3><%=getWorkplan(workplanId).BranchName %></h3>
                            <div class="form-group">
                                <h4><strong>Call Date:</strong> <%=getWorkplan(workplanId).CallDate%></h4>
                            </div>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>
                </div>

                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="test123" runat="server" Text="refresh" OnClick="test_Click" CssClass="hidden" />
                        <div class="">
                            <div class="">
                                <table id="visibility" class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <th class="text-muted ">Items</th>
                                            <th class="text-muted ">Measures</th>
                                            <th class="text-muted text-center col-md-1">Hit</th>
                                            <th class="text-muted col-md-2" colspan="2">Miss</th>
                                            <th class="text-muted text-left">Remarks</th>
                                            <th class="text-muted text-center"></th>
                                        </tr>
                                    </thead>
                                    <asp:PlaceHolder ID="surveyForm" runat="server"></asp:PlaceHolder>
                                    <asp:Repeater ID="parentRepeater" runat="server" OnItemDataBound="R1_ItemDataBound">
                                        <ItemTemplate>
                                            <tbody>
                                                <tr class="">
                                                    <td rowspan="<%# Convert.ToInt32(Eval("response_count"))+1 %>">
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
                                                <asp:Repeater ID="childRepeater" runat="server" OnItemCommand="childRepeater_ItemCommand" OnItemDataBound="R2_ItemDataBound">
                                                    <ItemTemplate>
                                                        <tr class="">
                                                            <td class="">
                                                                <br />
                                                                <br />
                                                                <%# Eval("name") %><asp:HiddenField ID="HiddenFieldId2" runat="server" Value='<%# Eval("id") %>' />
                                                                <br />
                                                                <asp:Label ID="itemValidate" CssClass="text-danger small" runat="server" Text=""></asp:Label>
                                                                <br />
                                                                <br />
                                                            </td>
                                                            <td class="text-center">
                                                                <div class="form-inline">
                                                                    <div class="input-group input-group-sm">
                                                                        <span class="input-group-addon input-group-addon-only">
                                                                            <div class="radio radio-success" style="padding-left: 5px; margin-bottom: -3px;">
                                                                                <asp:RadioButton ID="hitRadio" runat="server" GroupName="a" Checked='<%# ProcessMyDataItem(Eval("hit")) %>' />
                                                                                <asp:Label ID="Label2" AssociatedControlID="hitRadio" runat="server" Text=""></asp:Label>
                                                                            </div>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td class="text-center">
                                                                <div class="form-inline">
                                                                    <div class="input-group input-group-sm">
                                                                        <span class="input-group-addon">
                                                                            <div class="radio radio-danger" style="padding-left: 5px; margin-bottom: -3px;">
                                                                                <asp:RadioButton ID="missRadio" runat="server" GroupName="a" Checked='<%# ProcessMyDataItem(Eval("miss")) %>' />
                                                                                <asp:Label ID="Label1" AssociatedControlID="missRadio" runat="server" Text=""></asp:Label>
                                                                            </div>
                                                                        </span>
                                                                        <asp:DropDownList ID="remarksDDL" runat="server" CssClass="remarksddl form-control input-sm">
                                                                            <asp:ListItem Selected="True" Value="0" Text="Select"></asp:ListItem>
                                                                            <asp:ListItem Text="Not existing - No rented shelf but with entry in SIM."></asp:ListItem>
                                                                            <asp:ListItem Text="Wrong tagging of rented shelf - Shelf location is different from the actual display compared to SIM entry. Ex: GFE in SIM, GTD in the branch."></asp:ListItem>
                                                                            <asp:ListItem Text="Transferred - Display was transferred to a different location due to branch renovation/refacing."></asp:ListItem>
                                                                            <asp:ListItem Text="Under Refacing/Renovation - Branch under renovation/refacing"></asp:ListItem>
                                                                            <asp:ListItem Text="Under inventory - Branch under inventory (SEM1/SEM2)"></asp:ListItem>
                                                                            <asp:ListItem Text="Others"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td></td>
                                                            <td class="text-center">
                                                                <asp:TextBox ID="remarks" runat="server" TextMode="MultiLine" CssClass="form-control input-sm" Rows="3" Text='<%# Eval("remarks") %>'></asp:TextBox>
                                                            </td>
                                                            <td class="">
                                                                <div class="text-center">
                                                                    <asp:LinkButton ID="addPicBtn" OnClientClick="refreshForm();" runat="server" CssClass="btn btn-primary btn-sm" CommandName="addPicture" CommandArgument='<%# Eval("id") %>'>Add Picture</asp:LinkButton>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tbody>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="saveBtn" />
                        <asp:AsyncPostBackTrigger ControlID="test123" />
                        <asp:AsyncPostBackTrigger ControlID="saveDraftBtn" />
                        <asp:AsyncPostBackTrigger ControlID="submitBtn" />
                        <asp:AsyncPostBackTrigger ControlID="parentRepeater" />
                    </Triggers>
                </asp:UpdatePanel>

                <br />
            </div>
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
                                <%--<img id="blah" src="#" alt="your image" />--%>
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
                                                                    <div class="hidden">
                                                                        <img src="<%# DataBinder.Eval(Container.DataItem, "filePath") %>" class="img-responsive" alt="<%# DataBinder.Eval(Container.DataItem, "name") %>" />
                                                                    </div>
                                                                    <div>
                                                                        <asp:Image ID="picCon" runat="server" CssClass="img-responsive" />

                                                                    </div>
                                                                    <br />
                                                                    <br />
                                                                </div>
                                                                <div class="col-md-8 col-sm-8">
                                                                    <div class="">
                                                                        <div class="row">
                                                                            <div class="col-md-6 col-sm-6 col-xs-6">
                                                                                <div class="form-group">
                                                                                    <label class="">Branch Code</label>
                                                                                    <div class="">
                                                                                        <asp:TextBox ID="branchCode" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-6 col-sm-6 col-xs-6">
                                                                                <div class="form-group">
                                                                                    <label class="">Measure</label>
                                                                                    <div class="">
                                                                                        <asp:TextBox ID="measure" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-4 col-xs-4 hidden">
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
                                                                                <asp:Button ID="deleteBtn" runat="server" Text="Delete Photo" CssClass="btn btn-danger" CommandName="deletePic" CommandArgument='<%# Eval("id") %>' />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <%--<div class="row">
                                                            <div class="col-sm-3">
                                                                <div class="form-group">
                                                                    <label>Branch Code</label>
                                                                    <p class="form-control-static">SSD</p>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="form-group">
                                                                    <label>Shelf Brand Code</label>
                                                                    <select class="form-control" id="">
                                                                        <option>Select Shelf</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="form-group">
                                                                    <label>Measure</label>
                                                                    <p class="form-control-static">POG</p>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-3">
                                                                <div class="form-group">
                                                                    <label>Capture Date</label>
                                                                    <p class="form-control-static">YYYYMMDD</p>
                                                                </div>
                                                            </div>
                                                        </div>--%>
                                                                    <%--<div class="form-group">
                                                            <label>Brands</label>
                                                            <input type="text" class="form-control" />
                                                        </div>--%>
                                                                    <%--<div class="form-group">
                                                            <label>Remarks</label>
                                                            <textarea class="form-control" rows="2"></textarea>
                                                        </div>--%>
                                                                    <%--<a class="btn btn-danger">Delete</a>--%>
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
                            <input type="file" id="fileUpload" class="hidden" />
                            <asp:PlaceHolder ID="uploadBtnPlaceholder" runat="server">
                                <label class="btn btn-default btn-file pull-left btn-sm">
                                    Upload Photo
                                                                                <%--<input type="file" id="myFile" name="myFile" runat="server"/>--%>
                                    <ajaxToolkit:AsyncFileUpload ID="myFile" runat="server" ThrobberID="UpdateProgress2" OnClientUploadStarted="checkExtension" OnClientUploadComplete="refreshModal" OnUploadedComplete="myFile_UploadedComplete" CssClass="hidden" />
                                </label>
                            </asp:PlaceHolder>
                            <asp:Button ID="uploadBtn" runat="server" Text="Button" CommandName="uploadPhoto" CssClass="hidden" />
                            <asp:Button ID="refreshBtn" runat="server" Text="Button" OnClick="refreshBtn_Click" CssClass="hidden" />
                            <asp:PlaceHolder ID="closeBtnPlaceholder" runat="server">
                                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                            </asp:PlaceHolder>
                            <div class="btn-group" role="group">
                                <asp:Button ID="cancelBtn" runat="server" CssClass="btn btn-default btn-sm" Text="Cancel" OnClick="cancelBtn_Click" OnClientClick="closeModal()" />
                                <asp:Button ID="saveBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Save changes" OnClick="saveBtn_Click" />
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="parentRepeater" />
                        <%--<asp:AsyncPostBackTrigger ControlID="refreshBtn" />
                        <asp:AsyncPostBackTrigger ControlID="savebtn" />
                        <asp:AsyncPostBackTrigger ControlID="cancelBtn" />--%>
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
                    Hi! You're visibility survey will be submitted for approval. Changes won't be accepted beyond this. Do you wish to continue?
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <table class="table table-condensed">
                                <thead>
                                    <tr>
                                        <th>ITEMS</th>
                                        <th>MEASURES</th>
                                        <th>HIT</th>
                                        <th>MISS</th>
                                    </tr>
                                </thead>
                                <asp:Repeater ID="confirmParent" runat="server" OnItemDataBound="confirmParent_ItemDataBound">
                                    <ItemTemplate>
                                        <tbody>
                                            <tr>
                                                <td rowspan="2" class="col-md-5">
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
                                                        <td class="custom-row-1">
                                                            <br />
                                                            <br />
                                                            <%# Eval("name") %><br />
                                                            <br />
                                                            <br />
                                                            <asp:HiddenField ID="HiddenFieldId2" runat="server" Value='<%# Eval("id") %>' />
                                                        </td>
                                                        <td class="custom-row-1">
                                                            <asp:Label ID="hit" runat="server" Text=""></asp:Label>
                                                        </td>
                                                        <td class="custom-row-1">
                                                            <asp:Label ID="miss" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Cancel</button>
                        <asp:Button ID="confirmSubmitBtn" runat="server" Text="Submit" OnClientClick="$('#confirmModal').modal('hide');" OnClick="confirmSubmitBtn_Click" CssClass="btn btn-success btn-sm" />
                    </div>
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




    <asp:UpdateProgress ID="UpdateProgress2" runat="server">
        <ProgressTemplate>
            <div id="loadingModal">
                <!-- Place at bottom of page -->
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <script type="text/javascript">

        $("input.imgInp").change(function () {

            debugger;
            var img = $(this).closest('td').find("img.blah");

            readURL(this, img);
        });


        $('.modal').on('show.bs.modal', function () {
            $('.modal .modal-body').css('overflow-y', 'auto');
            $('.modal .modal-body').css('max-height', $(window).height() * 0.7);
        });

        function UploadFile(btn, input, target) {
            document.getElementById(btn).click();
        }

        function openModal() {
            $('#myModal').modal({
                //backdrop: 'static',
                //keyboard: false
            });
        }

        function alertModal() {
            $('#alertModal').modal();
        }

        function alertBox() {
            alert('hello world!');
        }

        function refreshModal() {
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
            //alert("hello wolrd");
        }

        $(document).ready(function () {
            radioListener();
        });

        function radioListener() {
            $('input[type="radio"]').change(function () {
                if ($(this).attr('value') === 'hitRadio') {
                    $(this).closest('td').next('td').find('.remarksddl').prop('disabled', "true");
                } else {
                    $(this).closest('.input-group').find('.remarksddl').prop('disabled', "");
                }
            });
        }

        function enableRemarks(ddl) {
            document.getElementById(ddl).disabled = false;
        }

        function disableRemarks(ddl) {
            document.getElementById(ddl).disabled = true;
        }

        function initializeSettings() {


            $('.date').datepicker({
                maxDate: new Date
            });

            $('.remarksddl').each(function () {
                if ($(this).closest('td').find('input[type="radio"]').is(':checked')) {
                    $(this).prop('disabled', '');
                } else {
                    $(this).prop('disabled', 'true');
                }
            });

            $('input[type="radio"]').change(function () {
                if ($(this).attr('value') === 'hitRadio') {
                    //$(this).closest('td').next('td').next('td').find('.remarksddl').prop('disabled', "true");
                    $(this).closest('td').next('td').find('.remarksddl').prop('disabled', "true");
                    //$('#ContentPlaceHolder1_parentRepeater_childRepeater_0_remarksDDL_0').prop('disabled', 'true');
                } else {
                    $(this).closest('.input-group').find('.remarksddl').prop('disabled', "");
                    //$(this).closest('td').next('td').find('.remarksddl').prop("disabled", "");
                    //$('#ContentPlaceHolder1_parentRepeater_childRepeater_0_remarksDDL_0').prop('disabled', '');
                }
            });

            $('#fileUpload').on("change", function () {
                debugger;
                var img = $("img.blah");

                var filesToUpload = $('#fileupload').files;
                if (!file.type.match(/image.*/)) {

                }

                //readURL(this);
            });

            function readURL(input) {

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        debugger;

                        $('#blah').attr("src", e.target.result);
                        //img.css("display", "");
                    }

                    reader.readAsDataURL(input.files[0]);
                }
            }
        }

        function checkExtension(sender, args) {
            var filename = args.get_fileName();
            var ext = filename.substring(filename.lastIndexOf(".") + 1);
            console.log(ext);
            //if (ext != 'png' || 'jpg') {
            if (['png', 'PNG', 'jpg', 'JPG', 'jpeg', 'JPEG'].indexOf(ext) < 0) {
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

        //function showAlert() {
        //    $("#validationSummary").addClass("in");
        //}

        function showAlert() {
            $("html, body").animate({ scrollTop: 0 }, "fast");
            window.setTimeout(function () {
                $("#myAlert").addClass("in");
            }, 200);
            return false;
        }

        //window.setTimeout(function () {
        //    showAlert();
        //}, 3000);

    </script>
</asp:Content>

