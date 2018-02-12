<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="tl_workplan.aspx.cs" Inherits="tl_workplan" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .control-label {
            /*font-weight: 500;*/
        }

        dl {
            margin-bottom: 0;
            font-size: 14px;
        }

        dt {
            font-weight: 500;
            color: rgba(0,0,0,0.60);
            /*color: #9E9E9E;*/
            font-weight: normal;
        }

        dd {
            font-weight: normal;
            color: rgba(0,0,0,0.80);
        }


        .form-horizontal .control-label.text-left {
            text-align: left;
        }

        .test-tbl thead tr th:first-child {
            /*vertical-align: top;*/
            /*padding: 10px 5px;*/
            /*text-align: left;*/
            /*font-size: 14px;*/
            /*padding: 10px 15px;*/
            padding-left: 15px;
        }

        .test-tbl thead tr th:last-child {
            padding-right: 15px;
            /*padding-right: 50px;*/
        }

        .test-tbl tbody tr td:last-child {
            padding-right: 20px;
        }

        .test-tbl tbody tr td:first-child {
            /*vertical-align: top;*/
            /*padding: 10px 5px;*/
            /*text-align: left;*/
            /*font-size: 14px;*/
            /*padding: 10px 15px;*/
            padding-left: 20px;
        }

        .test-tbl tbody tr td:nth-child(2) {
        }

        .test-tbl tbody tr td {
            /*padding: 8px 20px;*/
            border-top: 0px solid #EEEEEE;
            /*border-bottom-color: #f5f5f5;*/
            padding-top: 10px;
            padding-bottom: 10px;
        }

        #workplans {
            /*border-bottom: 1px solid #ddd;*/
            border: 1px solid #ddd;
            background-color: #fff;
        }

            #workplans.dataTable {
                /*margin-top:5px;*/
                /*margin-top: 0px !important;*/
                /*border-bottom: 0px solid #ddd;*/
                /*margin-bottom: 5px !important;*/
            }

        #branches_tbl > tbody > tr > td {
            vertical-align: middle;
        }

        #workplans > thead > tr > th {
            font-weight: 600;
            line-height: 25px;
            border-bottom-width: 1px;
            border-bottom-color: #EEEEEE;
            /*padding: 15px 20px;*/
            padding-bottom: 8px;
            padding-top: 10px;
        }

        .table > tbody > tr {
        }

        .table > tbody {
        }

        .select2-container {
            width: 100% !important;
            /*padding: 0;*/
        }

        .lower-navbar-wrapper {
            position: fixed;
            top: 50px;
            z-index: 100;
            width: 100%;
        }

        .lower-navbar-wrapper {
            background-color: #FAFAFA;
            padding-top: 7px;
            padding-bottom: 7px;
            border-bottom: 1px solid #ddd;
        }

        body {
        }

        .select2-container--bootstrap .select2-results > .select2-results__options {
            max-height: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="lower-navbar">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;" class="text-muted">Workplan</span>
                <div class="btn-group hidden" role="group">
                    <a class="btn btn-default btn-sm">Workplan</a>
                </div>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar" id="toolbar">
                    <div class="btn-group" role="group">
                        <asp:Button ID="newVisitBtn" runat="server" Text="New Visit" CssClass="new-visit-btn btn  btn-success btn-sm" OnClick="newVisitBtn_Click" />
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>


    <div id="main-content-wrapper">
        <div class="">
            <br />
            <div class="container-fluid">
                <asp:Label ID="messagelbl" runat="server" Text=""></asp:Label>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>



                        <dx:EntityServerModeDataSource runat="server" ID="EntityServerModeDataSource1" ContextTypeName="Entities" OnSelecting="EntityServerModeDataSource1_Selecting" TableName="vw_data_workplan_tl"></dx:EntityServerModeDataSource>
                        
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <dx:ASPxButtonEdit ID="ASPxButtonEdit1" runat="server" EnableTheming="True" Theme="Material" Width="100%" AutoCompleteType="Disabled" Caption="Search">
                                        <Buttons>
                                            <dx:EditButton ClientVisible="False" Enabled="False">
                                            </dx:EditButton>
                                        </Buttons>
                                        <ClearButton DisplayMode="Always">
                                        </ClearButton>
                                    </dx:ASPxButtonEdit>
                                </div>
                            </div>
                        </div>

                        <dx:ASPxGridView ID="gvWorkplans" runat="server" AutoGenerateColumns="False" DataSourceID="EntityServerModeDataSource1" EnableTheming="True" KeyFieldName="id" Theme="Material" Width="100%" OnCellEditorInitialize="gvWorkplans_CellEditorInitialize" OnCommandButtonInitialize="gvWorkplans_CommandButtonInitialize" OnRowUpdating="gvWorkplans_RowUpdating" OnDataBound="gvWorkplans_DataBound" OnStartRowEditing="gvWorkplans_StartRowEditing" OnCustomButtonCallback="gvWorkplans_CustomButtonCallback">
                            <ClientSideEvents EndCallback="function(s, e) {
	adjustGV();
}" />
                            <SettingsPager AlwaysShowPager="True" PageSize="50">
                                <PageSizeItemSettings Visible="True" Items="50, 100, 200">
                                </PageSizeItemSettings>
                            </SettingsPager>
                            <SettingsSearchPanel CustomEditorID="ASPxButtonEdit1" Delay="600" />
                            <SettingsEditing Mode="PopupEditForm">
                            </SettingsEditing>
                            <Settings VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" ShowHeaderFilterButton="True" />
                            <SettingsBehavior AllowFocusedRow="True" AllowEllipsisInText="True" />
                            <SettingsPopup>
                                <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" ShowShadow="True" VerticalAlign="WindowCenter" VerticalOffset="-30" />
                                <CustomizationWindow HorizontalAlign="NotSet" VerticalAlign="NotSet" />
                            </SettingsPopup>
                            <EditFormLayoutProperties ColCount="2">
                                <Items>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="id">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="call_date">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="branch_code">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="branch_name">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="account_group_1">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="fullname">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="status">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="deadline">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="date_created">
                                    </dx:GridViewColumnLayoutItem>
                                    <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Right">
                                    </dx:EditModeCommandLayoutItem>
                                </Items>
                            </EditFormLayoutProperties>
                            <Columns>
                                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="4%">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="1" Caption="Wkplan No." SortIndex="0" SortOrder="Descending">
                                    <PropertiesTextEdit>
                                        <ReadOnlyStyle BackColor="#EEEEEE">
                                        </ReadOnlyStyle>
                                    </PropertiesTextEdit>
                                    <SettingsHeaderFilter Mode="CheckedList">
                                    </SettingsHeaderFilter>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="call_date" VisibleIndex="2" Caption="Call Date">
                                    <PropertiesDateEdit>
                                        <ReadOnlyStyle BackColor="#EEEEEE">
                                        </ReadOnlyStyle>
                                    </PropertiesDateEdit>
                                    <SettingsHeaderFilter Mode="DateRangePicker">
                                    </SettingsHeaderFilter>
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="branch_name" VisibleIndex="4" Caption="Branch Name" Width="25%" ReadOnly="True">
                                    <PropertiesTextEdit>
                                        <ReadOnlyStyle BackColor="#EEEEEE">
                                        </ReadOnlyStyle>
                                    </PropertiesTextEdit>
                                    <SettingsHeaderFilter Mode="CheckedList">
                                    </SettingsHeaderFilter>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="branch_code" VisibleIndex="3" Caption="Branch Code" ReadOnly="True">
                                    <PropertiesTextEdit>
                                        <ReadOnlyStyle BackColor="#EEEEEE">
                                        </ReadOnlyStyle>
                                    </PropertiesTextEdit>
                                    <SettingsHeaderFilter Mode="CheckedList">
                                    </SettingsHeaderFilter>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="account_group_1" VisibleIndex="5" Caption="Account Group" ReadOnly="True">
                                    <PropertiesTextEdit>
                                        <ReadOnlyStyle BackColor="#EEEEEE">
                                        </ReadOnlyStyle>
                                    </PropertiesTextEdit>
                                    <SettingsHeaderFilter Mode="CheckedList">
                                    </SettingsHeaderFilter>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="status" VisibleIndex="9" Caption="Status" ReadOnly="True">
                                    <PropertiesTextEdit>
                                        <ReadOnlyStyle BackColor="#EEEEEE">
                                        </ReadOnlyStyle>
                                    </PropertiesTextEdit>
                                    <SettingsHeaderFilter Mode="CheckedList">
                                    </SettingsHeaderFilter>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="date_created" VisibleIndex="11" Caption="Date Added" ReadOnly="True">
                                    <PropertiesDateEdit ConvertEmptyStringToNull="False">
                                        <DropDownButton ClientVisible="False" Enabled="False">
                                        </DropDownButton>
                                        <ReadOnlyStyle BackColor="#EEEEEE">
                                        </ReadOnlyStyle>
                                    </PropertiesDateEdit>
                                    <SettingsHeaderFilter Mode="DateRangePicker">
                                    </SettingsHeaderFilter>
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataDateColumn FieldName="deadline" VisibleIndex="10" Caption="Due" ReadOnly="True">
                                    <PropertiesDateEdit>
                                        <DropDownButton ClientVisible="False" Enabled="False">
                                        </DropDownButton>
                                        <ReadOnlyStyle BackColor="#EEEEEE">
                                        </ReadOnlyStyle>
                                    </PropertiesDateEdit>
                                    <SettingsHeaderFilter Mode="DateRangePicker">
                                    </SettingsHeaderFilter>
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Assigned" FieldName="fullname" ShowInCustomizationForm="True" VisibleIndex="8">
                                    <PropertiesComboBox>
                                        <ReadOnlyStyle BackColor="#EEEEEE">
                                        </ReadOnlyStyle>
                                    </PropertiesComboBox>
                                    <SettingsHeaderFilter Mode="CheckedList">
                                    </SettingsHeaderFilter>
                                </dx:GridViewDataComboBoxColumn>
                            </Columns>
                            <Styles>
                                <Header Font-Size="10pt">
                                    <Paddings Padding="2px" PaddingBottom="7px" PaddingTop="7px" />
                                </Header>
                                <AlternatingRow Enabled="True">
                                </AlternatingRow>
                                <Cell Font-Size="10pt">
                                    <Paddings Padding="2px" PaddingBottom="5px" PaddingTop="5px" />
                                </Cell>
                                <Footer Font-Size="10pt">
                                </Footer>
                                <PagerBottomPanel Font-Size="10pt">
                                    <Paddings Padding="2px" />
                                </PagerBottomPanel>
                                <CommandColumn>
                                    <Paddings Padding="2px" />
                                </CommandColumn>
                            </Styles>
                        </dx:ASPxGridView>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="refreshBtn" />
                    </Triggers>
                </asp:UpdatePanel>



            </div>
        </div>

        <footer class="">
            <br />
            <div class="container-fluid">
                <p class="text-muted text-right">Developed by: <a href="#">BSDGSYS</a>. 2017</p>
            </div>
        </footer>
    </div>


    <%--Edit Modal--%>
    <div class="modal fade" id="editModal" role="dialog" aria-labelledby="editModal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Edit Visit #<span id="workplanRef"></span></h4>
                    <asp:HiddenField ID="workplanID" runat="server" />
                    <input type="hidden" id="workplanId" />
                </div>
                <div class="modal-body">
                    <div class="">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Call Date</label>
                                <div class="col-md-10">
                                    <input type="date" id="callDateEdit" name="callDateEdit" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Target Branch</label>
                                <div class="col-md-10">
                                    <select id="branchSelectEdit" name="branchSelectEdit" disabled="disabled" class="form-control">
                                        <option></option>
                                        <%=getAssignedBranchesByUserID() %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Assigned To</label>
                                <div class="col-md-10">
                                    <select class="form-control" id="assignedToEdit" name="assignedToEdit" disabled="disabled">
                                        <option></option>
                                        <%=getAssignedUsers() %>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn-group" role="group">
                        <a class="btn btn-default cancel-visit-btn" data-dismiss="modal">Cancel</a>
                        <asp:Button ID="submitEditBtn" runat="server" CssClass="btn btn-primary" Text="Save Changes" OnClick="submitEditBtn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="submitBtn" />
                    <asp:AsyncPostBackTrigger ControlID="branchSelectOnChange" />
                </Triggers>
            </asp:UpdatePanel>
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">New Visit</h4>
                </div>
                <div class="modal-body">
                    <div class="">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Call Date</label>
                                <div class="col-sm-10">
                                    <input type="date" id="callDate" name="callDate" class="form-control" />
                                    <asp:Label ID="callDateValidation" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Target Branch</label>
                                <div class="col-sm-10">
                                    <select id="branchSelect" name="branchSelect" class="form-control">
                                        <option></option>
                                        <%=getAssignedBranchesByUserID() %>
                                    </select>
                                    <asp:Button ID="branchSelectOnChange" runat="server" OnClick="branchSelectOnChange_Click" Text="" formnovalidate="formnovalidate" value="cancel" CssClass="cancel hidden" />
                                    <asp:Label ID="branchValidation" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Assigned To</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="assignedTo" name="assignedTo">
                                        <option></option>
                                        <%=getAssignedUsers() %>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="checkbox">
                                        <input type="checkbox" id="checkbox_assignment" checked="checked" />
                                        <label for="checkbox_assignment">
                                            Always choose default assignment
                                        </label>
                                    </div>
                                    <asp:Label ID="assignedToValidation" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="hidden table table-bordered table-condensed table-hover" id="branches_tbl">
                        <thead>
                            <tr>
                                <th></th>
                                <th class="col-sm-2">Account Group</th>
                                <th class="col-sm-2">Branch Code</th>
                                <th class="col-sm-5">Branch Name</th>
                                <th class="col-sm-3">Last Visit</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">
                                    <input type="checkbox" /></td>
                                <td>Watsons</td>
                                <td>1322</td>
                                <td>WATSONS WATSONS ROBINSONS BUTUAN - 1322 - COMBINED</td>
                                <td>Cirilo Prieto<small class="text-muted">04.07.2017</small></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <div class="btn-group" role="group">
                        <a class="cancel-visit-btn btn btn-default" data-dismiss="modal">Cancel</a>
                        <asp:Button ID="submitBtn" runat="server" CssClass="hidden btn btn-success" Text="Save" OnClick="submitBtn_Click" />
                        <a class="btn btn-success" id="saveBtn">Save Visit</a>
                    </div>
                    <asp:Button ID="refreshBtn" CssClass="hidden" runat="server" Text="Refresh" OnClick="refreshBtn_Click" />
                </div>
            </div>
        </div>
    </div>

    <%--Validate Modal--%>
    <div class="modal fade" id="validateModal" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4>Confirm Submission</h4>
                </div>
                <div class="modal-body">
                    <p>
                        The system has found <span class="matches_count"></span> similar visit/s for <span class="qtr_count"></span>. Do you want to continue?
                    </p>
                    <br />
                    <table class="table table-condensed table-bordered" id="workplan_matches_tbl">
                        <thead>
                            <tr>
                                <th>Branch</th>
                                <th>Call Date</th>
                                <th>Due Date</th>
                                <th>Coordinator</th>
                                <th>Date Added</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="branch"></td>
                                <td class="call-date">04.07.2017</td>
                                <td class="due-date">04.17.2017</td>
                                <td class="assigned">Cirilio Prieto</td>
                                <td class="date-added">04.06.2017</td>
                            </tr>
                            <tr>
                                <td class="branch"></td>
                                <td class="call-date">04.07.2017</td>
                                <td class="due-date">04.17.2017</td>
                                <td class="assigned">Cirilio Prieto</td>
                                <td class="date-added">04.06.2017</td>
                            </tr>
                            <tr>
                                <td class="branch"></td>
                                <td class="call-date">04.07.2017</td>
                                <td class="due-date">04.17.2017</td>
                                <td class="assigned">Cirilio Prieto</td>
                                <td class="date-added">04.06.2017</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <div class="btn-group" role="group">
                        <%--<a class="btn btn-default" data-dismiss="modal" data-toggle="modal" data-target="#myModal">Cancel</a>--%>
                        <a class="btn btn-default" onclick="$('#validateModal').one('hidden.bs.modal', function() { $('#myModal').modal('show'); }).modal('hide');">Cancel</a>
                        <%--<a id="confirmBtn" class="btn btn-success">Proceed</a>--%>
                        <asp:Button ID="confirmBtn" CssClass="btn btn-success" runat="server" Text="Proceed" OnClick="confirmBtn_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>


    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="newVisitBtn" />
            <%--<asp:AsyncPostBackTrigger ControlID="workplan_rptr" />--%>
            <asp:AsyncPostBackTrigger ControlID="gvWorkplans"/>
            <asp:AsyncPostBackTrigger ControlID="confirmBtn" />
            <asp:AsyncPostBackTrigger ControlID="submitEditBtn" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress2" runat="server">
        <ProgressTemplate>
            <div id="loadingModal" aria-invalid="false">
                <!-- Place at bottom of page -->
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <script type="text/javascript">

        var validator;
        var isAjaxing = false

        $(document).ready(function () {
            adjustGV();

            var d = new Date();

            var qtr = getQuarter(d);
            $(".qtr_count").text("Q"+qtr);

            d.setDate(d.getDate() - 10);

            var dd = d.getDate();
            var mm = d.getMonth() + 1; //January is 0!
            var yyyy = d.getFullYear();

            if (dd < 10) {
                dd = '0' + dd
            }

            if (mm < 10) {
                mm = '0' + mm
            }

            today = yyyy + '-' + mm + '-' + dd;

            $("#callDate").attr({
                "min": today
            });

            $("#callDateEdit").attr({
                "min": today
            });

            //$("#myModal").on('show.bs.modal', function (e) {
            //    $("#myModal").modal('handleUpdate');
            //});

            //$("#validateModal").on('show.bs.modal', function (e) {
            //    $("#validateModal").modal('handleUpdate');
            //});

        })

        function adjustGV() {
            window.onload = function () {
                $('.dxgvCSD').css("width", "100%");
                $('.dxgvControl_Material .dxgvCSD').css("padding-right", "0");
                $('.dxgvCSD').css("padding-right", "0");
            };

            $(window).resize(function () {
                setTimeout(function () {
                    $('.dxgvCSD').css("width", "100%");
                    $('.dxgvControl_Material .dxgvCSD').css("padding-right", "0");
                    $('.dxgvCSD').css("padding-right", "0");
                }, 1);
            });

            $('.dxgvCSD').css("width", "100%");
            $('.dxgvControl_Material .dxgvCSD').css("padding-right", "0");
            $('.dxgvCSD').css("padding-right", "0");

            //alert("hello world");
        }

        function initializeVisitForm() {
            $("#myModal").modal({
                backdrop: 'static',
                keyboard: false
            });

            $('#myModal').on('shown.bs.modal', function (e) {
                initializeValidation();
            });
        }

        function initializeEditVisitForm() {
            $('#workplanRef').text(arguments[0]);
            if (isAjaxing) return;
            isAjaxing = true;
            $.ajax({
                method: "POST",
                url: "tl_workplan.aspx/editWorkplanByWorkplanId",
                data: '{workplanId: "' + arguments[0] + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true,
                success: function (response) {
                    var workplan = response.d;
                    //alert(workplan.Deadline);
                    if (workplan != null) {
                        $("#editModal").modal({
                            backdrop: 'static',
                            keyboard: false
                        });
                        $('#callDateEdit').val(workplan.CallDate);
                        $('#branchSelectEdit').val(workplan.BranchId).change();
                        $('#assignedToEdit').val(workplan.UserId).change();
                    } else {
                        alert("Workplan invalid!");
                    }
                },
                failure: function (response) {
                    alert("failed");
                },
                error: function (response) {
                    alert("error");
                }
            }).done(function () {
                isAjaxing = false;
            });

            $('#editModal').on('shown.bs.modal', function (e) {
                initializeValidation();
            });
        }

        function resetVisitForm() {
            if ($('#myModal').is(':visible')) {
                $("#assignedTo").val('').trigger('change');
                $("#branchSelect").val('').trigger('change');
                var form = $("#form1");
                form.validate().resetForm();
                form[0].reset();
                $(".has-error").each(function () {
                    $(this).removeClass("has-error");
                });
                form.validate().cancelSubmit = true;
                form.validate().destroy();
            } else if ($('#editModal').is(':visible')) {
                var form = $("#form1");
                form.validate().resetForm();
                form[0].reset();
                $(".has-error").each(function () {
                    $(this).removeClass("has-error");
                });
                form.validate().cancelSubmit = true;
                form.validate().destroy();
            }
        };

        function initializeValidation() {
            if ($('#myModal').is(':visible')) {
                $.validator.setDefaults({
                    highlight: function (element) {
                        var elem = $(element);
                        $(element).closest('.form-group').addClass('has-error');
                        //$(element).parent().removeClass('has-success').addClass('has-error');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-error');
                        //$(element).parent().removeClass('has-error').addClass('has-success');
                    },
                    errorElement: 'span',
                    errorClass: 'help-block',
                    errorPlacement: function (error, element) {
                        if (element.parent('.input-group').length) {
                            error.insertAfter(element.parent());
                        } else {
                            //error.insertAfter(element.parent());
                            element.parent().append(error);
                        }
                        //var elem = $(element);
                        //error.insertAfter(element);
                    }
                });

                validator = $("#form1").validate({
                    rules: {
                        callDate: {
                            required: true,
                            date: true,
                        },
                        branchSelect: {
                            required: true,
                        },
                        assignedTo: {
                            required: true,
                        }
                    },
                    messages: {
                        callDate: {
                            required: "This is required",
                        },
                        branchSelect: {
                            required: "This is required",
                        },
                        assignedTo: {
                            required: "This is required",
                        }
                    },
                    submitHandler: function (form) {
                    },
                });
            } else if ($('#editModal').is(':visible')) {
                $.validator.setDefaults({
                    highlight: function (element) {
                        var elem = $(element);
                        $(element).closest('.form-group').addClass('has-error');
                        //$(element).parent().removeClass('has-success').addClass('has-error');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-error');
                        //$(element).parent().removeClass('has-error').addClass('has-success');
                    },
                    errorElement: 'span',
                    errorClass: 'help-block',
                    errorPlacement: function (error, element) {
                        if (element.parent('.input-group').length) {
                            error.insertAfter(element.parent());
                        } else {
                            //error.insertAfter(element.parent());
                            element.parent().append(error);
                        }
                        //var elem = $(element);
                        //error.insertAfter(element);
                    }
                });

                validator = $("#form1").validate({
                    rules: {
                        callDateEdit: {
                            required: true,
                            date: true,
                        }
                    },
                    messages: {
                        callDateEdit: {
                            required: "This is required",
                        }
                    },
                    submitHandler: function (form) {
                    },
                });
            }
        }

        function setAssignedEmp() {
            var branchId = $('#branchSelect').val();
            if (branchId != null) {
                var defaultEmp = $('#checkbox_assignment').prop("checked");
                if (isAjaxing) return;
                isAjaxing = true;
                $.ajax({
                    method: "POST",
                    url: "tl_workplan.aspx/getAssignedEmpByBranchID",
                    data: '{branchId: "' + branchId + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function (response) {
                        var assignedUser = response.d;
                        //$('#assignedTo option[value=' + assignedUser.Id + ']').attr('selectec', 'selected');
                        if (defaultEmp === true) {
                            //alert(assignedUser.Id);
                            if (assignedUser.Id == null) {
                                //alert('Hey this is null!');
                                $('#assignedTo').closest('.form-group').addClass('has-error');
                                var $help = $("<span>", { "class": "help-block" });
                                $help.html("Branch has no default assignment. Please assign a user or choose a different branch");
                                $('#assignedTo').parent().append($help);
                                $('#checkbox_assignment').prop("disabled", true);
                                $("#assignedTo").val('').trigger('change');
                            } else {
                                $('#assignedTo').closest('.form-group').removeClass('has-error');
                                $('#assignedTo').parent().find('span.help-block').remove();
                                $('#assignedTo').val(assignedUser.Id).change();
                                $('#checkbox_assignment').prop("disabled", false);
                            }
                            //alert(assignedUser.Id);
                        }
                        //$(assignedUser).each(function () {
                        //    alert(this.Fullname);
                        //});
                        //alert(assignedUser.Id);
                    },
                    failure: function (response) {
                        alert("failed");
                    },
                    error: function (response) {
                        alert("error");
                    }
                }).done(function () {
                    isAjaxing = false;
                });
            }
        };

        function findWorkplanMatches() {
            var isValid = $("#form1").valid();
            if (isValid) {
                var callDateInput = $("#callDate").val();
                var branch = $("#branchSelect").val();
                var emp = $("#assignedTo").val();
                var workplan = { CallDate: callDateInput, BranchId: branch, UserId: emp };
                if (isAjaxing) return;
                isAjaxing = true;
                $.ajax({
                    method: "POST",
                    url: "tl_workplan.aspx/findWorkplanMatches",
                    data: JSON.stringify({ 'workplan': workplan }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function (response) {
                        var matches = response.d;

                        //$("#myModal").modal("hide");
                        //$("#myModal").on("hidden.bs.modal", function (e) {
                        //    //alert("hello world");
                        //    $("#validateModal").modal("show");
                        //});


                        if (matches === "") {
                            isAjaxing = false;
                            SaveWorkplan();
                        } else {
                            $("#workplan_matches_tbl").find("tbody").html(matches);
                            $(".matches_count").html($('#workplan_matches_tbl >tbody>tr').length);
                            //$('#validateModal').modal('handleUpdate');
                            $('#myModal').one('hidden.bs.modal', function () {
                                $('#validateModal').modal('show');
                            }).modal('hide');
                        }

                    },
                    failure: function (response) {
                        alert("failed");
                    },
                    error: function (response) {
                        alert("error");
                    }
                }).done(function () {
                    isAjaxing = false;
                });
            }
        }

        function SaveWorkplan() {
            var callDateInput = $("#callDate").val();
            var branch = $("#branchSelect").val();
            var emp = $("#assignedTo").val();
            var workplan = { CallDate: callDateInput, BranchId: branch, UserId: emp };
            if (isAjaxing) return;
            isAjaxing = true;
            $.ajax({
                method: "POST",
                url: "tl_workplan.aspx/saveWorkplan",
                data: JSON.stringify({ 'data': workplan }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true,
                success: function (response) {
                    $("#assignedTo").val('').trigger('change');
                    $("#branchSelect").val('').trigger('change');
                    var form = $("#form1");
                    form.validate().resetForm();
                    form[0].reset();
                    $(".has-error").each(function () {
                        $(this).removeClass("has-error");
                    });
                    form.validate().cancelSubmit = true;
                    form.validate().destroy();
                    //alert("workplan saved!");
                    //insert code here
                    $("#myModal").modal('hide');
                    var message = $("<div></div>").attr('id', 'myAlert').text("Workplan saved!");
                    var button = $("<button></button").addClass("close").attr('data-dismiss', 'alert').attr('type', 'button').attr('aria-label', 'Close').append($("<span></span>").html('&times;').attr('aria-hidden', 'true'));
                    message.append(button);
                    message.addClass("alert alert-success fade in");
                    $("#<%=messagelbl.ClientID%>").html(message);
                    $("#<%=refreshBtn.ClientID%>").click();
                },
                failure: function (response) {
                    alert("failed");
                },
                error: function (response) {
                    alert("error");
                }
            }).done(function () {
                isAjaxing = false;
            });
        }

        function confirmVisit() {
            $('#validateModal').modal('hide');
            SaveWorkplan();
        }

        function updateWorkplan() {
            var isValid = $("#form1").valid();
            var workplanRef = arguments[0];
            if (isValid) {
                var callDateInput = $("#callDateEdit").val();
                var workplan = { CallDate: callDateInput };
                if (isAjaxing) return;
                isAjaxing = true;
                $.ajax({
                    method: "POST",
                    url: "tl_workplan.aspx/updateWorkplan",
                    data: JSON.stringify({ 'data': workplan }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function (response) {
                        resetVisitForm();
                        $('#editModal').modal('hide');
                        $("#<%=refreshBtn.ClientID%>").click();
                        if (response.d) {
                            //alert("workplan saved!");
                            var message = $("<div></div>").attr('id', 'myAlert').text("Workplan #" + workplanRef + " updated!");
                            var button = $("<button></button").addClass("close").attr('data-dismiss', 'alert').attr('type', 'button').attr('aria-label', 'Close').append($("<span></span>").html('&times;').attr('aria-hidden', 'true'));
                            message.append(button);
                            message.addClass("alert alert-success fade in");
                        } else {
                            var message = $("<div></div>").attr('id', 'myAlert').text("Something went wrong!");
                            var button = $("<button></button").addClass("close").attr('data-dismiss', 'alert').attr('type', 'button').attr('aria-label', 'Close').append($("<span></span>").html('&times;').attr('aria-hidden', 'true'));
                            message.append(button);
                            message.addClass("alert alert-danger fade in");
                        }
                        $("#<%=messagelbl.ClientID%>").html(message);

                    },
                    error: function (response) {
                        alert("error");
                    },
                    failure: function (response) {
                        alert("failed");
                    }
                }).done(function () {
                    isAjaxing = false;
                });
            }
        }

        function initializeSettings(sender, args) {
            adjustGV();

            //Temporary fix for multiple instances of modal
            $('.modal').on('shown.bs.modal', function () {
                $('body').addClass('modal-open');
            });

            $('#workplans').DataTable({
                "ordering": false,
                "language": {
                    "emptyTable": "No data available"
                },
                "bDestroy": true
            });

            $("#myModal").on('hidden.bs.modal', function (e) {
                if ($('#validateModal').is(':visible')) {

                } else {
                    //resetVisitForm();
                }
            });

            $("#validateModal").on('hidden.bs.modal', function (e) {
                if ($('#myModal').is(':visible')) {

                } else {
                    resetVisitForm();
                }
            });

            $("#editModal").on('hidden.bs.modal', function (e) {
                resetVisitForm();
                if (isAjaxing) return;
                isAjaxing = true;
                $.ajax({
                    method: "POST",
                    url: "tl_workplan.aspx/clearSelection",
                    success: function (response) {
                        console.log("selection cleared!");
                    },
                    failure: function (response) {
                        console.log("failed");
                    },
                    error: function (response) {
                        console.log("error");
                    }
                }).done(function () {
                    isAjaxing = false;
                });
            });

            $(".cancel-visit-btn").on("click", function (e) {
                resetVisitForm();
            });

            $('#branchSelect').select2({
                placeholder: "",
                theme: "bootstrap",
                allowClear: true,
                templateResult: function (state) {
                    var option = state.text;
                    var str = option.split('!@#');
                    return $('<div><small><strong>' + str[0] + ' ' + str[1] + '</strong></small></br><div><small>' + str[2] + '</small></div></div>');
                },
                templateSelection: function (state) {
                    var option = state.text;
                    var str = option.split('!@#');
                    return str[0] + ' ' + null && str[1];
                },
            });

            $('#branchSelectEdit').select2({
                placeholder: "",
                theme: "bootstrap",
                allowClear: true,
                templateResult: function (state) {
                    var option = state.text;
                    var str = option.split('!@#');
                    return $('<div><small><strong>' + str[0] + ' ' + str[1] + '</strong></small></br><div><small>' + str[2] + '</small></div></div>');
                },
                templateSelection: function (state) {
                    var option = state.text;
                    var str = option.split('!@#');
                    return str[0] + ' ' + null && str[1];
                }
            });

            $('#branchSelect').on('change', function (e) {
                if ($('#branchSelect').val() != '' && $('#branchSelect').val() != null) {
                    setAssignedEmp();
                }
            });

            $("#checkbox_assignment").on("change", function () {
                var defaultEmp = $('#checkbox_assignment').prop("checked");
                if (defaultEmp === true) {
                    if ($('#branchSelect').val() != '' && $('#branchSelect').val() != null) {
                        setAssignedEmp();
                    }
                }
                //$("#assignedTo").prop("disabled", defaultEmp);
            });

            $("#saveBtn").on("click", function (e) {
                var isValid = $("#form1").valid();
                if (isValid) {
                    $("#<%=submitBtn.ClientID%>").click();
                }
            });

            $('.saveBtn').on("click", function (e) {
                if ($('#myModal').is(':visible')) {

                } else if ($('#editModal').is(':visible')) {

                }
            });

            $('#assignedTo').select2({
                placeholder: "",
                theme: "bootstrap",
                allowClear: true,
            });

        }

        function closeModal() {
            $('#myModal').modal('hide');
        }

        function closeEditModal() {
            $('#editModal').modal('hide');
        }

        function editModal() {
            $('#editModal').modal({
                backdrop: 'static',
                keyboard: false
            });
        }

        function preventMultipleSubmissions() {
            $('#<%=submitBtn.ClientID %>').prop('disabled', true);
        }

        function getQuarter(d) {
            //d = d || new Date();
            //var m = Math.floor(d.getMonth() / 3) + 2;
            //return m > 4 ? m - 4 : m;
            return Math.floor((d.getMonth() + 3) / 3);
        }

        window.onbeforeunload = preventMultipleSubmissions;

    </script>

</asp:Content>

