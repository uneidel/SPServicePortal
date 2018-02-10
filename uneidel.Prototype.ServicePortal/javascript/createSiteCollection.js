$(function () {


    $(".CheckName").find("input").focusout(function () {

        var text = $(".CheckName").find("input").val();

        var url = "/services/serviceportalws.svc/" + "VerifySCName";
        $.ajax({
            type: "POST",
            url: url,
            data: '{"scname": "' + text + '"}',
            contentType: "application/json; charset=utf-8", // content type sent to server
            success: ServiceSucceeded,
            error: ServiceFailed
        });

    });

});
function ServiceFailed(result) {
    alert('Service call failed: ' + result.status + '  ' + result.statusText);
}
function ServiceSucceeded(data, textStatus, jqXHR) {
    var resultObject = data.d;
    if (resultObject == true) {

        $(".CheckName").find("input").css("background-color", "red");
    }
}
function Log(msg) {
    //$("#logdiv").append(msg + "<br />");
}
