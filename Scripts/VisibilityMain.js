
//Set timeouts for when the warning message
//should be displayed, and what should happen 
//when the session actually expires.
function pageLoad() {
    setTimeout('ShowSessionTimeoutWarning()', '<%=iWarningTimeoutInMilliseconds%>');
    setTimeout('ShowSessionExpiredNotification()', '<%=iSessionTimeoutInMilliseconds%>');

    initializeSettings();
}

//Notify the user that his session is ABOUT to expire.
//Do so by making our warning div tag visible.
function ShowSessionTimeoutWarning() {
    $("#modalSessionTimeoutWarning").modal();
}

//Notify the user that his session HAS expired.
function ShowSessionExpiredNotification() {
    $("#modalSessionTimeoutWarning").modal();

    //Send the user to a new page.
    window.location = '<%=sTargetURLForSessionTimeout%>';
}

function ResetClientSideSessionTimers() {
    $("#modalSessionTimeoutWarning").modal('hide');
}


function extendedValidatorUpdateDisplay(obj) {
    // Appelle la méthode originale
    if (typeof originalValidatorUpdateDisplay === "function") {
        originalValidatorUpdateDisplay(obj);
    }
    // Récupère l'état du control (valide ou invalide) 
    // et ajoute ou enlève la classe has-error
    var control = document.getElementById(obj.controltovalidate);
    if (control) {
        var isValid = true;
        for (var i = 0; i < control.Validators.length; i += 1) {
            if (!control.Validators[i].isvalid) {
                isValid = false;
                break;
            }
        }
        if (isValid) {
            $(control).closest(".form-group").removeClass("has-error");
        } else {
            $(control).closest(".form-group").addClass("has-error");
        }
    }
}
// Remplace la méthode ValidatorUpdateDisplay
var originalValidatorUpdateDisplay = window.ValidatorUpdateDisplay;
window.ValidatorUpdateDisplay = extendedValidatorUpdateDisplay;


function closeChangePasswordModal() {
    $('#changePasswordModal').modal('hide');
}

function openChangePasswordModal() {
    $('#changePasswordModal').modal({
        backdrop: 'static',
        keyboard: false
    });
}

function validateForm() {
    return $("#form1").valid();
}