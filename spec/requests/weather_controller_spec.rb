require 'rails_helper'

RSpec.describe WeatherController, type: :request, vcr: true do
  it "outputs the correct data" do
    get "/weather/10028", nil, {'HTTP_ACCEPT' => "application/json"}

    json = JSON.parse(response.body)
    expect(json).to eq({
      "success"=>true,
      "response_text"=>"City Found",
      "state"=>"NY",
      "city"=>"New York",
      "weather_station_city"=>"White Plains",
      "forecast"=>{
        "date"=>"2014-08-13T00:00:00.000+00:00",
        "weather_id"=>"1",
        "desciption"=>"Thunder Storms",
        "temperatures"=>{
          "morning_low"=>"66",
          "daytime_high"=>"79"
        },
        "probability_of_precipiation"=>{
          "nighttime"=>"100",
          "daytime"=>"100"
        }
      }
    })
  end
end
