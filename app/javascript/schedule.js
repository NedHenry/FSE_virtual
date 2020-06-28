var schedule_url = "/schedule.json";
var days = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
$(document).ready(function(){
    $.getJSON(schedule_url,{},load_schedules);
});

function load_schedules(events) {
    load_list_schedules(events);
    load_grid_schedules(events);
    load_up_next(events,3);
}

function load_list_schedules(events) {
    template = $("div.schedule#list-view").find("li.template");
    $.each(events,function(index,event) {
        event_li = template.clone().removeClass('template').addClass('list-group-item');
        event_li.appendTo(template.parent());
        event_li.find("div.event-title").html(event['name']);
        event_li.find("div.event-location").html(event['location']);

        start = new Date(event['start'])
        end = new Date(event['end'])
        event_li.find("div.event-time").html(start.toLocaleDateString("en-US",{ weekday: 'long', hour: '2-digit', minute: '2-digit' }));
        duration = Math.round((end-start)/1000/60/60*4)/4
        unit = (duration > 1) ? 'hours' : 'hour'
        event_li.find("div.event-duration").html(Math.round((end-start)/1000/60/60*4)/4 +" "+unit)
        if(event['url']) {
            event_li.find('a').attr("href",event['url'])
        } else {
            event_li.find('a').removeAttr("href")
        }
        event_li.removeClass('hidden');
        event_li.show();
    });
}

function load_grid_schedules(events) {
    $("div.schedule#grid-view").each(function(index){
        var grid_div = $('this')
        $.each(events,function(event) {
            //TODO Not Implemented Yet
        });
    });
}

function load_up_next(events, num) {
    var template = $("div.schedule#up-next").find("li.template");
    var i = 1
    $.each(events,function(index,event) {
        now = new Date('2020-06-11 18:00:00')
        event_start = new Date(event["start"])
        //TODO sort out timezone offset
        if (event_start < now) {
            return true
        }
        if (i > num) {
            return false
        }
        i++;

        event_li = template.clone().removeClass('template');
        event_li.appendTo(template.parent());
        event_li.find("div.event-title").html(event['name']);
        event_li.find("div.event-location").html(event['location']);
        event_li.find("div.event-time").html(event['start']+' - '+event['end']);
        event_li.show();
    });
}
