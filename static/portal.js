function isEventCurrent(eventObj) {
    const todaysDate = new Date();
    const startDate = Date(eventObj.work_start_date);
    const endDate = Date(eventObj.work_end_date);
    return !(startDate > todaysDate || endDate < todaysDate);
}

function resizeChosen() {
    $(".chosen-container").each(function () {
        $(this).attr('style', 'width: 100%');
    });
}

let rawEvents = [];
const openCheckinURL = '/api/check_in?end_date__isnull=True';
const eventURL = '/api/event';
const eventUsersURL = '/api/event_user?event=';
$(document).ready(function () {
    $(".chosen-select").chosen({width: "auto"});

    jQuery(window).on('resize', resizeChosen);
    $.ajax({
        'url': eventURL,
        'data': null,
        'success': function (data) {
            // console.log('data is' + data);
            rawEvents = data;
            currentEvents = rawEvents.filter(event => isEventCurrent(event));
            $.each(rawEvents, function (i, eventObject) {
                $('#event-select').append($("<option></option>").attr("value", eventObject.id).text(eventObject.name));
            });
            $('#event-select').set
            $('.chosen-select').trigger("chosen:updated");
            // resizeChosen();
        },
        'dataType': 'json'
    });

});

// if (currentEvents.length === 1)
// {
//
// }

