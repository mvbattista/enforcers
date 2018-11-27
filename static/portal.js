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
const eventUsersURL = '/api/event_user';
const checkinURL = '/api/check_in';
$(document).ready(function () {
    $(".chosen-select").chosen({width: "auto"});

    jQuery(window).on('resize', resizeChosen);
    $.get({
        'url': eventURL,
        'data': null,
        'success': function (data) {
            // console.log('data is' + data);
            rawEvents = data;
            currentEvents = rawEvents.filter(event => isEventCurrent(event));
            $.each(rawEvents, function (i, eventObject) {
                $('#event-select').append($("<option></option>").attr("value", eventObject.id).text(eventObject.name));
            });
            if (currentEvents.length) {
                $('#event-select')
            }
            $('.chosen-select').trigger("chosen:updated");
            // resizeChosen();
        },
        'dataType': 'json'
    });
    $('#event-select').chosen().change(function () {
        if ($('#event-select').val()) {
            $('#user-select-div').show();

            $.get({
                'url': eventUsersURL,
                'data': {'event': $('#event-select').val()},
                'success': function (data) {
                    // console.log('data is' + data);
                    eventUsers = data;
                    $('#event-user-select').find('option').remove().end().append('<option></option>');
                    // currentEvents = rawEvents.filter(event => isEventCurrent(event));
                    $.each(eventUsers, function (i, eventUserObject) {
                        $('#event-user-select').append($("<option></option>").attr("value", eventUserObject.id).text(eventUserObject.handle));
                    });
                    $('.chosen-select').trigger("chosen:updated");
                    // resizeChosen();
                },
                'dataType': 'json'
            });
            $.get();
        }
    });

});

// if (currentEvents.length === 1)
// {
//
// }

