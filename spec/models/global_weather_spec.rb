require 'rails_helper'

describe GlobalWeather, type: :model, vcr: true do
  describe ".get_weather" do
    it "responds with the location" do
      actual = subject.get_weather('New York', 'United States')
      expect(actual["Location"]).to eq("NEW YORK LA GUARDIA AIRPORT , NY, United States (KLGA) 40-47N 73-53W 11M")
    end
  end
end
