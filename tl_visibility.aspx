<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="tl_visibility.aspx.cs" Inherits="tl_visibility" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
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

        .table {
            border: 1px solid #ddd;
            /*border-bottom: 1px solid #ddd;*/
            background-color: #fff;
        }

        table.dataTable {
            /*margin-top:5px;*/
            /*margin-top: 0px !important;*/
            /*border-bottom: 0px solid #ddd;*/
            /*margin-bottom: 5px !important;*/
        }

        .table > thead > tr > th {
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
            padding: 0;
        }

        body {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="lower-navbar">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;" class="text-muted">Surveys</span>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar">
                    <div class="btn-group hidden" role="group">
                        <a class="active btn btn-default btn-sm disabled">All</a>
                        <a class="btn btn-default btn-sm disabled">For Approval</a>
                        <a class="btn btn-default btn-sm disabled">Submitted</a>
                        <a class="btn btn-default btn-sm disabled">Missed</a>
                    </div>
                    &nbsp;
                    <div class="btn-group hidden" role="group">
                        <asp:LinkButton ID="prevBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-left text-muted"></span></asp:LinkButton>
                        <asp:LinkButton ID="nextBtn" CssClass="btn btn-sm btn-default disabled" runat="server"><span class="fa fa-chevron-right text-muted"></span></asp:LinkButton>
                    </div>
                    <div class="btn-group hidden" role="group">
                        <a class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">New Visit</a>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="" id="main-content-wrapper">
        <div class="container-fluid">
            <br />

            <dx:EntityServerModeDataSource ID="EntityServerModeDataSource1" runat="server" OnSelecting="EntityServerModeDataSource1_Selecting" ContextTypeName="Entities" TableName="vw_visibility_surveys_tl" />

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

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityServerModeDataSource1" EnableTheming="True" KeyFieldName="id" Theme="Material" Width="100%" OnCustomButtonCallback="ASPxGridView1_CustomButtonCallback">
                <ClientSideEvents EndCallback="function(s, e) {
adjustGV();
}" />
                <SettingsPager PageSize="50">
                    <PageSizeItemSettings Items="50, 100, 200" Visible="True">
                    </PageSizeItemSettings>
                </SettingsPager>
                <Settings VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" ShowHeaderFilterButton="True" />
                <SettingsBehavior AllowEllipsisInText="True" AllowFocusedRow="True" />
                <SettingsSearchPanel CustomEditorID="ASPxButtonEdit1" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Survey No." FieldName="id" ReadOnly="True" VisibleIndex="1" SortIndex="0" SortOrder="Descending">
                        <SettingsHeaderFilter Mode="CheckedList">
                        </SettingsHeaderFilter>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="branch_name" VisibleIndex="4" Caption="Branch Name" Width="25%">
                        <SettingsHeaderFilter Mode="CheckedList">
                        </SettingsHeaderFilter>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Branch Code" FieldName="branch_code" VisibleIndex="3">
                        <SettingsHeaderFilter Mode="CheckedList">
                        </SettingsHeaderFilter>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Account Group" FieldName="account_group_1" VisibleIndex="5">
                        <SettingsHeaderFilter Mode="CheckedList">
                        </SettingsHeaderFilter>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Status" FieldName="status" VisibleIndex="9">
                        <SettingsHeaderFilter Mode="CheckedList">
                        </SettingsHeaderFilter>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Due" FieldName="deadline" VisibleIndex="12">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Assigned" FieldName="fullname" VisibleIndex="8">
                        <SettingsHeaderFilter Mode="CheckedList">
                        </SettingsHeaderFilter>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" Width="4%">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="viewBtn" Text="View">
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataDateColumn Caption="Call Date" FieldName="call_date" VisibleIndex="2">
                    </dx:GridViewDataDateColumn>
                </Columns>
                <Styles>
                    <Header Font-Size="10pt">
                        <Paddings PaddingBottom="7px" PaddingLeft="2px" PaddingRight="2px" PaddingTop="7px" />
                    </Header>
                    <AlternatingRow Enabled="True">
                    </AlternatingRow>
                    <Cell Font-Size="10pt">
                        <Paddings PaddingBottom="5px" PaddingLeft="2px" PaddingRight="2px" PaddingTop="5px" />
                    </Cell>
                    <Footer Font-Size="10pt">
                    </Footer>
                    <PagerBottomPanel Font-Size="10pt">
                        <Paddings Padding="2px" />
                    </PagerBottomPanel>
                    <CommandColumn>
                        <Paddings PaddingBottom="2px" PaddingLeft="2px" PaddingRight="2px" PaddingTop="2px" />
                    </CommandColumn>
                </Styles>
            </dx:ASPxGridView>
        </div>
        <footer class="">
            <div class="container-fluid">
                <br />
                <p class="text-muted text-right">Developed by: <a href="#">BSDGSYS</a>. 2017</p>
            </div>
            <br />
        </footer>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            adjustGV();

            $('#visib').DataTable({
                //"paging": false,
                "ordering": false,
                //"info": false,
                "language": {
                    "emptyTable": "No data available",
                }
            });
        });

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

        function initializeSettings(sender, args) {
            adjustGV();
        }


    </script>
</asp:Content>

