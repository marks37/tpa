<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="New_Visibility_Pictures.aspx.cs" Inherits="New_Visibility_Pictures" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxFileManager" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #visib_pictures > tbody > tr > td {
            padding-top: 30px;
            padding-bottom: 30px;
            /*border-top: 0px;*/
        }

        #visib_pictures > tbody > tr:first-child > td {
            border-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <h3 class="text-muted">
            <%string workplanId = Request.QueryString["pk"]; %>
            <%=getWorkplan(workplanId).Status %>
            <%Response.Write(DateTime.Now);%></h3>
        <br />
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <h4><strong>Account Branch:</strong> <%=getWorkplan(workplanId).BranchName %></h4>
                            <h4><strong>Call Date:</strong> <%=getWorkplan(workplanId).CallDate%></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default" style="border-left: 0px; border-right: 0px;">
            <div class="panel-heading">
                <h4 class="pull-left">CV1L Planogram</h4>
        <a class="btn btn-default pull-right" data-toggle="modal" data-target="#myModal">Upload Pictures</a>
                <div class="clearfix"></div>
            </div>
            <dx:ASPxFileManager ID="ASPxFileManager1" runat="server" Visible="false">
                <Settings RootFolder="~\" ThumbnailFolder="~\Thumb\" />
            </dx:ASPxFileManager>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1">
                        <div class="row">
                            <asp:Repeater ID="picRepeater" runat="server">
                                <ItemTemplate>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-4 col-sm-4 col-xs-12 text-center">
                                            <div class="img-thumbnail">
                                                <img src="<%# DataBinder.Eval(Container.DataItem, "filePath") %>" class="img-responsive" />
                                                <br />
                                                <span><strong>FileName:</strong> <%# DataBinder.Eval(Container.DataItem, "fileName") %><br />
                                                    <strong>Date:</strong> <%# DataBinder.Eval(Container.DataItem, "dateCreated") %>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="col-md-8 col-sm-8 col-xs-12">
                                            <div class="">
                                                <div class="row" style="display: none;">
                                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                                        <div class="form-group">
                                                            <label class="">Branch Code</label>
                                                            <div class="">
                                                                <p class="form-control-static">SSD</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                                        <div class="form-group">
                                                            <label class="">Measure</label>
                                                            <div class="">
                                                                <p class="form-control-static">POG</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-sm-4 col-xs-4">
                                                        <div class="form-group">
                                                            <label class="">Capture Date</label>
                                                            <div class="">
                                                                <p class="form-control-static">YYYYMMDD</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="">Shelf Brand Code</label>
                                                    <div class="">
                                                        <select class="form-control" id="">
                                                            <option>Select Shelf</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="">Remarks</label>
                                                    <div class="">
                                                        <textarea class="form-control" rows="2"></textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="">
                                                        <a class="btn btn-danger">Delete</a>
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
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <table id="visib_pictures" class="visib_pictures table" style="display: none;">
                            <tbody>
                                <tr>
                                    <td class="text-center" style="width: 200px;">
                                        <div class="img-thumbnail">
                                            <img src="Images/end_of_day_logo2.png" class="" width="200" height="240" />

                                            <br />
                                            <span><strong>FileName:</strong> Img_000<br />
                                                <strong>Date:</strong> 2016/12/16
                                            </span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group">
                                            <label>Shelf Brand Code</label>
                                            <select class="form-control" id="">
                                                <option>Select Shelf</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Brands</label>
                                            <input type="text" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label>Remarks</label>
                                            <textarea class="form-control" rows="2"></textarea>
                                        </div>
                                        <a class="btn btn-danger">Delete</a>
                                        <asp:Label ID="testLbl" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center col-md-6">
            <%--<a class="btn btn-primary btn-block">Save!</a>--%>
            <%--<asp:Button ID="backBtn" CssClass="btn btn-default btn-block" runat="server" Text="Back" OnClick="backBtn_Click" />--%>
        </div>
        <div class="text-center col-md-6">
            <asp:Button ID="submitBtn" CssClass="btn btn-primary btn-block" runat="server" Text="Save Changes" OnClick="submitBtn_Click" />
        </div>
        <div class="clearfix"></div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center" id="myModalLabel">Upload Pictures</h4>
                </div>
                <div class="modal-body">
                    <ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1" runat="server" OnUploadComplete="AjaxFileUpload1_UploadComplete" AllowedFileTypes="jpg,jpeg" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

