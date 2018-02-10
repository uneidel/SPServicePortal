
function ShowModalDialog(id)
{
    $("#denyOrder").text(id);
    $('#basic-modal-content').modal();
}

function ApproveOrder(id, action, reason)
{
   
    var url = "/services/serviceportalws.svc/" + "ApproveOrder";


    $.ajax({
        type: "POST",
        url: url,
        data: '{"orderid": "' + id + '","action": "' + action + '","reason": "' + reason + '"}',
        contentType: "application/json; charset=utf-8", 
        success: ServiceSucceeded,
        error: ServiceFailed
    });
}

function ServiceFailed(result) {
    alert('Service call failed: ' + result.status + '  ' + result.statusText);
}
function ServiceSucceeded(result) {
    window.location.reload(true);
}
function Log(msg) {
    //$("#logdiv").append(msg + "<br />");
}
$(function () {
    
    $("table.grid").find("tr").mouseenter(function () {
        var orderId = $(this).attr("orderId");
        var type = $(this).attr("orderType");
        if (type == "SiteCollectionCreation") {
            var url = "/services/serviceportalws.svc/" + "GetSCDetails";
            $.ajax({
                type: "POST",
                url: url,
                data: '{"orderId": "' + orderId + '"}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data, status, jqXHR) {
                    
                    var json = $.parseJSON(data.d);
                    if (json == null) { return;}
                    var html = "<span>Details:</span><br /><table>";
                    $.each(json, function (i, y) {
                        html += "<tr><td style='font-weight:bold'>" + i + "</td><td>" + y + "</td></tr>"

                    });
                    html += "</table>";
                    $("#popup").append(html);
                    $("#popup").show();
                },
                error: function (data) {
                    var me = 1;
                }
            })
        }

    }).mouseleave(function () {
        if ($("#popup").is(":visible") == true) {
            $("#popup").hide().empty();


        }
    });;
});