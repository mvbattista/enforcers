function getCookie(name) {
    var start = document.cookie.indexOf(name + "=");
    var len = start + name.length + 1;
    if ((!start) && (name != document.cookie.substring(0, name.length))) {
        return null;
    }
    if (start == -1) return null;
    var end = document.cookie.indexOf(';', len);
    if (end == -1) end = document.cookie.length;
    return unescape(document.cookie.substring(len, end));
}

function isEventCurrent(eventObj) {
    const todaysDate = new Date();
    const startDate = Date(eventObj.work_start_date);
    const endDate = Date(eventObj.work_end_date);
    return !(startDate > todaysDate || endDate < todaysDate);
}

function updateTotalTime(eventUserObj) {
    let totalTime = formatTotalTime(parseInt(eventUserObj.total_time));
    $('#user-total-hours').empty().text(totalTime);
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

function formatCheckin(startDate, startTime, endTime, eventUserID) {
    let startDateObj = new Date(startDate + " " + startTime);
    let endDateObj = new Date(startDate + " " + endTime);
    if (endDateObj < startDateObj) {
        endDateObj.setDate(endDateObj.getDate() + 1);
    }
    return {
        'event_user': eventUserID,
        'start_date': startDateObj.toISOString(),
        'end_date': endDateObj.toISOString()
    }
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
    $(".timepicker-input").timepicker({
        icons: {up: 'fas fa-chevron-up', down: 'fas fa-chevron-down'}
    });

    jQuery(window).on('resize', resizeChosen);
    $.get({
        'url': eventURL,
        'data': null,
        'beforeSend': function (xhr) {
            xhr.setRequestHeader('X-CSRFToken', getCookie('csrftoken'));
        },
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
            let eventID = $('#event-select').val();

            $.get({
                'url': eventUsersURL,
                'data': {'event': eventID},
                'beforeSend': function (xhr) {
                    xhr.setRequestHeader('X-CSRFToken', getCookie('csrftoken'));
                },
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
            chosenEventObj = rawEvents.filter(event => event.id == eventID)[0];
            let rawEventEndDateObj = new Date(chosenEventObj.work_end_date);

            let eventEndDateObj = new Date(rawEventEndDateObj.getTime() + rawEventEndDateObj.getTimezoneOffset() * 60000);

            let daysOfEvent = [];
            let d = new Date(chosenEventObj.work_start_date);
            d = new Date(d.getTime() + d.getTimezoneOffset() * 60000);
            for (; d <= eventEndDateObj; d.setDate(d.getDate() + 1)) {
                daysOfEvent.push(new Date(d));
            }
            $('#checkin-date-select').find('option').remove().end().append('<option></option>');
            $.each(daysOfEvent, function (i, eventObject) {
                $('#checkin-date-select').append($("<option></option>").attr("value",
                    eventObject.toISOString().split('T')[0]).text(eventObject.toLocaleDateString('en-US',
                    {weekday: 'short', year: 'numeric', month: 'numeric', day: 'numeric'})));
            });
        }
    });
    $('#event-user-select').chosen().change(function () {
        if ($('#event-user-select').val()) {
            $('#user-info').show();
            let eventUserID = $('#event-user-select').val();
            let chosenEventUser = eventUsers.find(obj => obj.id == eventUserID);
            updateTotalTime(chosenEventUser);

            $.get({
                'url': checkinURL,
                'data': {'event_user': eventUserID},
                'beforeSend': function (xhr) {
                    xhr.setRequestHeader('X-CSRFToken', getCookie('csrftoken'));
                },
                'success': function (data) {
                    // console.log('data is' + data);
                    checkIns = data;
                    // $('#event-user-select').find('option').remove().end().append('<option></option>');
                    // currentEvents = rawEvents.filter(event => isEventCurrent(event));
                    $('#checkin-list').empty();

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
    $('#checkin-add').click(function () {
        // Create API dates
        let eventUserID = $('#event-user-select').val();
        let checkinPayload = formatCheckin($('#checkin-date-select').val(), $('#checkin-start-time').val(),
            $('#checkin-end-time').val(), eventUserID);
        // Post to API, test success
        $.post({
            'url': checkinURL,
            'data': JSON.stringify(checkinPayload),
            'contentType': "application/json; charset=utf-8",
            'beforeSend': function (xhr) {
                xhr.setRequestHeader('X-CSRFToken', getCookie('csrftoken'));
            },
            'success': function (data) {
                // Add successful checkin to list

                $('#checkin-list').append($("<li></li>").text(checkInToString(data)));

                // Update total time
                $.get({
                    'url': eventUsersURL + "/" + eventUserID,
                    'beforeSend': function (xhr) {
                        xhr.setRequestHeader('X-CSRFToken', getCookie('csrftoken'));
                    },
                    'success': function (data) {
                        updateTotalTime(data);
                        // resizeChosen();
                    },
                    'dataType': 'json'
                });
                // Clear selected input fields
                return false;
            },
            'error': function (jqxhr, status, exception) {
                alert('Exception:', exception);
                return false;
            },
            'dataType': 'json'
        });


    });

});

// if (currentEvents.length === 1)
// {
//
// }

