class ScheduleController < ApplicationController
  
  CLASHFINDER_NAME="test"
  CLASHFINDER_BASE="https://clashfinder.com/data/event/"

  def json
    events = clashfinder_json['locations'].reduce([]) do |events, location|
      events + location["events"].map { |event| event.merge({"location" => location["name"], "tz_offset" => clashfinder_json['tzoffset'] })}
    end
    render json: events, cached: true
  end

  private
    
  def clashfinder_url
    File.join CLASHFINDER_BASE, "#{CLASHFINDER_NAME}.json"
  end

  def clashfinder_json
    @clash_json ||= JSON.parse(Net::HTTP.get(URI.parse(clashfinder_url)))
  end
  
end
