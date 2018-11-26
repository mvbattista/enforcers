function isEventCurrent(eventObj){
    const todaysDate = new Date();
    const startDate = Date(eventObj.work_start_date);
    const endDate = Date(eventObj.work_end_date);
    return !(startDate > todaysDate || endDate < todaysDate);
}

let rawEvents = [];
const openCheckinURL = '/api/check_in?end_date__isnull=True';
const eventURL = '/api/event';
const eventUsersURL = '/api/event_user?event=';
$(document).ready(function () {
    $.ajax({
      'url': eventURL,
      'data': null,
      'success': function (data) {
          // console.log('data is' + data);
          rawEvents = data;
      },
      'dataType': 'json'
    });
});
let currentEvents = rawEvents.filter(event => isEventCurrent(event));
$.each(rawEvents, function(eventObj) {
    $('#event-select').append($("<option></option>").attr("value",eventObj.id).text(eventObj.name));
});
if (currentEvents.length === 1) {

}

