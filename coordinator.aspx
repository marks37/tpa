<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="coordinator.aspx.cs" Inherits="coordinator" %>

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
            /*border-bottom: 1px solid #ddd;*/
            border: 1px solid #ddd;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="lower-navbar">
        <div class="container-fluid">
            <div class="pull-left">
                <span style="font-size: 100%;" class="text-muted">Coordinator</span>
                <div class="btn-group hidden" role="group">
                    <a class="btn btn-default btn-sm">Coordinators</a>
                </div>
            </div>
            <div class="pull-right">
                <div class="" role="toolbar" id="toolbar">
                    <div class="btn-group" role="group">
                        <a class="btn btn-success btn-sm hidden" data-toggle="modal" data-target="#myModal">New Coordinator</a>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div id="main-content-wrapper">
        <div class="container-fluid">
            <br />
            <div id="message-box"></div>
            <div class="">
                <table class="table test-tbl table-hover" id="coordinators">
                    <thead>
                        <tr>
                            <th class="text-muted small col-md-2">Full Name</th>
                            <th class="text-muted small col-md-2">Username</th>
                            <th class="text-muted small col-md-2">Type</th>
                            <th class="text-muted small col-md-2">Team Leader</th>
                            <th class="col-md-2"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="coordinatorList" runat="server" OnItemDataBound="coordinatorList_ItemDataBound">
                            <ItemTemplate>
                                <tr>
                                    <td><%# DataBinder.Eval(Container.DataItem, "fullname") %></td>
                                    <td><%# DataBinder.Eval(Container.DataItem, "username") %></td>
                                    <td><%# DataBinder.Eval(Container.DataItem, "type") %></td>
                                    <td>
                                        <asp:Label ID="team_leader_lbl" runat="server" Text=""></asp:Label></td>
                                    <td class="text-right">
                                        <a class="edit-btn btn-link btn hidden" data-toggle="modal" data-target="#edit-user-modal" data-user="<%# DataBinder.Eval(Container.DataItem, "id") %>">Edit</a>
                                        <a class="edit-btn btn-link btn" data-toggle="modal" data-target="#change-password-modal" data-user="<%# DataBinder.Eval(Container.DataItem, "id") %>">Change Password</a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="edit-user-modal" tabindex="-1" role="dialog" aria-labelledby="edit-user-modal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Edit User</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>First Name</label><br />
                                    <input type="text" class="form-control" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Middle Initial</label><br />
                                    <input type="text" class="form-control"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Last Name</label><br />
                                    <input type="text" class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Team Leader</label>
                        <select class="form-control">
                            <option disabled="" selected="">Select</option>
                            <option>Ysma Angeles</option>
                            <option>Lezel Cruda</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="change-password-modal" tabindex="-1" role="dialog" aria-labelledby="change-password-modal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Change Password</h4>
                </div>
                <div class="modal-body">
                        <p>Password should have a minimum of 8 characters, atleast 1 lowercase letter, 1 uppercase letter, 1 number, & 1 special character.</p>
                    <br />
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="newPassword">New Password</label>
                            <div class="col-md-9">
                                <input type="password" id="newPassword" name="newPassword" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="confirmPassword">Re-Type Password</label>
                            <div class="col-md-9">
                                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" />
                            </div>
                        </div>
                        <div id="change-password-msg"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary" id="save-password-btn">Save changes</button>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <script type="text/javascript">
        function initializeSettings() {
            $('#coordinators').DataTable({
                //"paging": false,
                "ordering": false,
                //"info": false,
                "language": {
                    "emptyTable": "No data available"
                },
                "bDestroy": true
            });
        }

        $(document).ready(function () {
            var userId;
            var validator;
            $(".edit-btn").on('click', function () {
                $("#change-password-msg").html('');
                $("#myAlert").remove();

                $.validator.setDefaults({
                    highlight: function (element) {
                        $(element).closest('.form-group').addClass('has-error');
                    },
                    unhighlight: function (element) {
                        $(element).closest('.form-group').removeClass('has-error');
                    },
                    errorElement: 'span',
                    errorClass: 'help-block',
                    errorPlacement: function (error, element) {
                        if (element.parent('.input-group').length) {
                            error.insertAfter(element.parent());
                        } else {
                            error.insertAfter(element);
                        }
                    }
                });

                userId = $(this).data("user")

                validator = $("#form1").validate({
                    rules: {
                        newPassword: {
                            required: true,
                            regex: "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$",
                        },
                        confirmPassword: {
                            required: true,
                            equalTo: "#newPassword"
                        }
                    },
                    messages: {
                        newPassword: {
                            required: "This is required",
                            regex: "Minimum 8 characters, atleast 1 lowercase letter, 1 uppercase letter, 1 number, 1 special character",
                        },
                        confirmPassword: {
                            required: "This is required",
                            equalTo: "Passwords don't match.",
                        },
                    },
                    submitHandler: function (form) {

                    },
                });

                $.validator.addMethod("regex", function (value, element, regexp) {
                    var re = new RegExp(regexp);
                    return this.optional(element) || re.test(value);
                }, "Please check your input.");

                $.validator.addMethod("notEqual", function (value, element, param) {
                    return this.optional(element) || value != $(param).val();
                }, "This has to be different...");

            });

            $(".save-btn").on("click", function (e) {
                if ($("#edit-user-modal").is(':visible')) {
                    $.ajax({
                        type: "POST"
                    })
                }
            })
            
            $("#change-password-modal").on('hidden.bs.modal', function (e) {
                var form = $("#form1");
                form.validate().resetForm();
                form[0].reset();
                $(".has-error").each(function () {
                    $(this).removeClass("has-error");
                });
                form.validate().cancelSubmit = true;
                form.validate().destroy();
            });

            $("#save-password-btn").click(function (e) {
                var isValid = $("#form1").valid();
                if (isValid) {
                    var newPassword = $("#newPassword").val();
                    var confirmPassword = $("#confirmPassword").val();
                    $.ajax({
                        type: "POST",
                        url: "coordinator.aspx/savePassword",
                        data: "{userId: '"+userId+"', newPassword:'"+newPassword+"', confirmPassword: '"+confirmPassword+"'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: true,
                        success: function (msg) {
                            var message = $("<div></div>").attr('id', 'myAlert').text(msg.d[0]);
                            var button = $("<button></button").addClass("close").attr('data-dismiss', 'alert').attr('type','button').attr('aria-label','Close').append($("<span></span>").html('&times;').attr('aria-hidden','true'));
                            message.append(button);
                            if (!msg.d[1]) {
                                message.addClass("alert alert-success fade in");
                                $('#change-password-modal').modal('hide');
                                $("#message-box").html(message);
                            } else {
                                message.addClass("alert alert-danger fade in");
                                $("#change-password-msg").html(message);
                            }
                        },
                    });
                }
            });
        });
    </script>
</asp:Content>

