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

function shiftToString(shiftObject) {
    let startDatetime = new Date(shiftObject.start_date);
    let endDatetime = new Date(shiftObject.end_date);
    let eventID = shiftObject.event;
    let dayName = getDayName(startDatetime);
    let shiftLocation = eventDetails[eventID]['locations'].find(obj => obj.id == shiftObject.location);
    return `${dayName} ${shiftLocation} (${startDatetime.toLocaleTimeString()} - ${endDatetime.toLocaleTimeString()})`;
}

function getDayName(dateObject) {
    let days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    return days[dateObject.getDay()];
}

function checkInToString(checkInObject) {
    let startDatetime = new Date(checkInObject.start_date);
    let endDatetime = new Date(checkInObject.end_date);
    let dayName = getDayName(startDatetime);
    return `${dayName}: ${startDatetime.toLocaleTimeString()} - ${endDatetime.toLocaleTimeString()}`
}

function formatTotalTime(secs) {
    function pad(num) {
        return ("0" + num).slice(-2);
    }
    let minutes = Math.floor(secs / 60);
    secs = secs % 60;
    let hours = Math.floor(minutes / 60)
    minutes = minutes % 60;
    return `${pad(hours)}:${pad(minutes)}:${pad(secs)}`;
    // return pad(hours)+":"+pad(minutes)+":"+pad(secs); for old browsers
}

let rawEvents = [];
let eventDetails = {}
const openCheckinURL = '/api/check_in?end_date__isnull=True';
const eventURL = '/api/event';
const eventUsersURL = '/api/event_user';
const checkinURL = '/api/check_in';
const eventShiftsURL = '/api/event_shift';
const locationURL = '/api/location';
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
            $('#user-info').hide();
            let eventID = $('#event-select').val()

            $.get({
                'url': eventUsersURL,
                'data': {'event': eventID},
                'success': function (data) {
                    // console.log('data is' + data);
                    eventUsers = data;
                    $('#event-user-select').find('option').remove().end().append('<option></option>');
                    // currentEvents = rawEvents.filter(event => isEventCurrent(event));
                    $.each(eventUsers, function (i, eventUserObject) {
                        $('#event-user-select').append($("<option></option>").attr("value", eventUserObject.id).text(eventUserObject.handle));
                    });
                    $('.chosen-select').trigger("chosen:updated");

                    if (!(eventID in eventDetails)) {
                        let details = {};
                        $.get({
                            'url': locationURL,
                            'data': {'event': eventID},
                            'dataType': 'json',
                            'success': function (data) {
                                details['locations'] = data;
                            }
                        });
                        $.get({
                            'url': eventShiftsURL,
                            'data': {'event': eventID},
                            'dataType': 'json',
                            'success': function (data) {
                                details['shifts'] = data;
                            }
                        });
                        eventDetails[eventID] = details;
                    }
                    // resizeChosen();
                },
                'dataType': 'json'
            });
        }
    });
    $('#event-user-select').chosen().change(function () {
        if ($('#event-user-select').val()) {
            $('#user-info').show();
            let eventUserID = $('#event-user-select').val()
            let chosenEventUser = eventUsers.find(obj => obj.id == eventUserID);
            let totalTime = formatTotalTime(parseInt(chosenEventUser.total_time));
            $('#user-total-hours').empty().text(totalTime);
            $('#checkin-list').empty();

            $.get({
                'url': checkinURL,
                'data': {'event_user': eventUserID},
                'success': function (data) {
                    // console.log('data is' + data);
                    checkIns = data;
                    // $('#event-user-select').find('option').remove().end().append('<option></option>');
                    // currentEvents = rawEvents.filter(event => isEventCurrent(event));
                    $.each(checkIns, function (i, checkInObject) {
                        $('#checkin-list').append($("<li></li>").text(checkInToString(checkInObject)));
                    });
                    // $('.chosen-select').trigger("chosen:updated");
                    // resizeChosen();
                },
                'dataType': 'json'
            });

        }

    });

});

// if (currentEvents.length === 1)
// {
//
// }

