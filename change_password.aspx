<%@ Page Title="" Language="C#" MasterPageFile="~/VisibilityMain.master" AutoEventWireup="true" CodeFile="change_password.aspx.cs" Inherits="change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            padding-top: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main-content-wrapper">
        <div class="container-fluid">
            <br />
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h4>Change Password</h4>
                            <hr />
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="form-horizontal" id="changePasswordForm">
                                        <asp:Panel ID="messagelbl" runat="server">
                                            <br />
                                        </asp:Panel>
                                        <div class="form-group">
                                            <span class="col-sm-4 control-label">Current Password</span>
                                            <div class="col-sm-6">
                                                <asp:TextBox CssClass="form-control form-a" ID="oldPassword" ClientIDMode="Static" TextMode="Password" runat="server"></asp:TextBox>
                                                <%--<asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator1" ControlToValidate="oldpassword" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <span class="col-sm-4 control-label">New Password</span>
                                            <div class="col-sm-6">
                                                <asp:TextBox CssClass="form-control form-a" ID="newPassword" ClientIDMode="Static" TextMode="Password" runat="server"></asp:TextBox>
                                                <%--<asp:RegularExpressionValidator EnableClientScript="false" ID="regex1" runat="server" Display="Dynamic" CssClass="help-block" ControlToValidate="newPassword" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character"></asp:RegularExpressionValidator>--%>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <span class="col-sm-4 control-label">Confirm Password</span>
                                            <div class="col-sm-6">
                                                <asp:TextBox CssClass="form-control form-a required" equalTo="#newPassword" ID="confirmPassword" ClientIDMode="Static" TextMode="Password" runat="server"></asp:TextBox>
                                                <asp:Label ID="confirmPasswordValidator" runat="server" Text=""></asp:Label>
                                                <%--<asp:CompareValidator EnableClientScript="false" ID="CompareValidator1" runat="server" Display="Dynamic" CssClass="help-block" ControlToCompare="newPassword" Operator="Equal" Type="String" ControlToValidate="confirmPassword" ErrorMessage="Passwords don't match"></asp:CompareValidator>--%>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="form-group">
                                            <div class="col-sm-offset-4 col-sm-6">
                                                <asp:Button ID="saveBtn" OnClick="saveBtn_Click" ClientIDMode="Static" CssClass="btn btn-primary" runat="server" Text="Save" />
                                                <asp:Button ID="cancelBtn" CssClass="btn btn-default" runat="server" Text="Clear" />
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="cancelBtn" />
                                    <asp:PostBackTrigger ControlID="saveBtn" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            // override jquery validate plugin defaults
            $.validator.setDefaults({
                highlight: function(element) {
                    $(element).closest('.form-group').addClass('has-error');
                },
                unhighlight: function(element) {
                    $(element).closest('.form-group').removeClass('has-error');
                },
                errorElement: 'span',
                errorClass: 'help-block',
                errorPlacement: function(error, element) {
                    if(element.parent('.input-group').length) {
                        error.insertAfter(element.parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });

            $("#form1").validate({
                rules: {
                    <%=oldPassword.UniqueID%>: {
                        required: true,
                    },
                    <%=newPassword.UniqueID%>: {
                        required: true,
                        regex: "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$",
                        notEqual: "#oldPassword",
                    },
                    <%=confirmPassword.UniqueID%>: {
                        required: true,
                    }
                },
                messages: {
                    <%=oldPassword.UniqueID%>: {
                        required: "This is required",
                    },
                    <%=newPassword.UniqueID%>: {
                        required: "This is required",
                        notEqual: "New password should be different.",
                        regex: "Minimum 8 characters, atleast 1 lowercase letter, 1 uppercase letter, 1 number, 1 special character",
                    },
                    <%=confirmPassword.UniqueID%>: {
                        required: "This is required",
                        equalTo: "Passwords don't match.",
                    },
                },
                submitHandler: function(form) {
                    var oldPassword = $("#oldPassword").val();
                    var newPassword = $("#newPassword").val();
                    var confirmPassword = $("#confirmPassword").val();
            
                    $.ajax({
                        type: "POST",
                        url: "change_password.aspx/validateForm",
                        data: "{ oldPassword: '"+ oldPassword +"', newPassword: '"+ newPassword +"',confirmPassword:'" +confirmPassword +"'}",
                        contentType: "application/json; charset=utf-8",
                        dataType:"json",
                        async: true,
                        success: function(msg){
                            if(msg.d[1]==="success"){
                                var message  = $("<div></div>").attr('id','myAlert').addClass("alert alert-success fade in");                                
                                message.text(msg.d[0]);
                                $("#oldPassword").val("");
                                $("#newPassword").val("");
                                $("#confirmPassword").val("");
                            }else{
                                var message  = $("<div></div>").attr('id','myAlert').addClass("alert alert-danger fade in");
                                message.text(msg.d[0]);   
                            }
                            $("#<%=messagelbl.ClientID%>").html(message);
                        },
                        error: function(){
                            alert("Error!");
                        }
                    });
                    return false;
                },
            });

            $.validator.addMethod("regex", function(value, element, regexp) {
                var re = new RegExp(regexp);
                return this.optional(element) || re.test(value);
            }, "Please check your input.");
        
            $.validator.addMethod("notEqual", function(value, element, param) {
                return this.optional(element) || value != $(param).val();
            }, "This has to be different...");
        
        });

        
        
        Sys.Application.add_load(function () {
            function test() {
                $(".form-a").on('keyup change blur', function () {
                    var validation = 0;
                    var empty_flds = 0;
                    var error = $("<span></span>").addClass('help-block').text("This is required.");
                    if ($(this).val() == "") {
                        if ($(this).closest('div').find('span.help-block').length) {
                            $(this).closest('div').find('span.help-block').text("This is required.");
                        } else {
                            $(this).closest('div').append(error);
                        }
                        $(this).closest('div').addClass('has-error');
                        $(this).removeClass("passed");
                    } else {
                        $(this).closest('div').removeClass('has-error');
                        $(this).closest('div').find('.help-block').remove();
                        $(this).addClass("passed");
                    }
                    $('.form-a').each(function () {
                        if (!$.trim($(this).val())) {
                            empty_flds++;
                        }
                        if ($(this).hasClass("passed")) {
                            validation++;
                        }
                    });
                    if (validation != 3) {
                        $('#saveBtn').attr('disabled', 'true');
                    } else {
                        $('#saveBtn').removeAttr('disabled');
                    }
                });

                function update() {
                    var validation = 0;
                    $('.form-a').each(function () {
                        if ($(this).hasClass("passed")) {
                            validation++;
                        }
                        if (validation != 3) {
                            $('#saveBtn').attr('disabled', 'true');
                        } else {
                            $('#saveBtn').removeAttr('disabled');
                        }
                    });
                }

                function validateForm() {
                    var error = $("<span></span>").addClass('help-block');
                    var oldPassword = $("#oldPassword");
                    var newPassword = $("#newPassword");
                    var confirmPassword = $("#confirmPassword");
                    var check = new RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");

                    if (oldPassword.val() == "") {
                        error.text("This is required");
                        addError(oldPassword, error);
                    } else {
                        removeError(oldPassword);
                    }

                    if (newPassword.val() == "") {
                        error.text("This is required");
                        addError(newPassword, error);
                    } else if (!check.test(newPassword.val())) {
                        var options = [
        set0 = ['Minimum 8 characters', 'atleast 1 upper case english letter', 'atleast 1 lower case english letter', 'atleast 1 digit', 'atleast 1 special character'],
        set1 = ['First Option', 'Second Option', 'Third Option']
                        ];
                        var reqList = document.createElement('ul').appendChild(makeUL(options[0]));
                        error.append('');
                        error.append(reqList);
                        addError(newPassword, error);
                    } else {
                        removeError(newPassword);
                    }

                }

                $(".form-a").on('keyup change blur', function () {
                    //update();
                });

                $("#oldPassword").on("keyup change blur", function () {
                    var error = $("<span></span>").addClass('help-block');
                    if ($(this).val() == "") {
                        error.text("This is required");
                        addError($(this), error);
                    } else {
                        removeError($(this));
                    }
                });

                $("#newPassword").on('keyup change blur', function () {
                    var value = $(this).val();
                    var check = new RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");
                    var error = $("<span></span>").addClass('help-block');

                    if ($(this).val() == "") {
                        error.text("This is required");
                        addError($(this), error);
                    } else if (!check.test(value)) {
                        var options = [
        set0 = ['Minimum 8 characters', 'atleast 1 upper case english letter', 'atleast 1 lower case english letter', 'atleast 1 digit', 'atleast 1 special character'],
        set1 = ['First Option', 'Second Option', 'Third Option']
                        ];
                        var reqList = document.createElement('ul').appendChild(makeUL(options[0]));
                        error.append('');
                        error.append(reqList);
                        addError($(this), error);
                    } else {
                        removeError($(this));
                    }
                });

                function makeUL(array) {
                    // Create the list element:
                    var list = document.createElement('ul');

                    for (var i = 0; i < array.length; i++) {
                        // Create the list item:
                        var item = document.createElement('li');

                        // Set its contents:
                        item.appendChild(document.createTextNode(array[i]));

                        // Add it to the list:
                        list.appendChild(item);
                    }

                    // Finally, return the constructed list:
                    return list;
                }

                $('#confirmPassword').on('change keyup blur', function () {
                    var newPasswordVal = $('#newPassword').val();
                    var confirmPasswordVal = $(this).val();
                    var error = $("<span></span>").addClass('help-block');
                    if ($(this).val() == '') {
                        error.text("This is required");
                        addError($(this), error);
                    } else if (newPasswordVal != confirmPasswordVal) {
                        error.text("Passwords don't match");
                        addError($(this), error);
                    } else {
                        removeError($(this));
                    }
                });

                function addError(input, error) {
                    if (input.closest('div').find('span.help-block').length) {
                        //$(this).closest('div.form-group').find('.help-block').remove();
                        input.closest('div').find('.help-block').remove();
                        input.closest('div').append(error);
                    } else {
                        input.closest('div').append(error);
                    }
                    input.closest('div').addClass('has-error');
                    input.removeClass("passed");
                }

                function removeError(input) {
                    input.closest('div').removeClass('has-error');
                    input.closest('div').find('.help-block').remove();
                    input.addClass("passed");
                }
            }
            
            

        });

    </script>

</asp:Content>

