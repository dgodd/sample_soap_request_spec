require 'rails_helper'

RSpec.describe WeatherController, type: :request, vcr: true do
  it "outputs the correct data" do
    get "/id_service", nil, {'HTTP_ACCEPT' => "application/json"}

    json = JSON.parse(response.body)
    expect(json).to eq({
      "id" => "-00016",
      "@xmlns:ns2" => "http://predic8.com/wsdl/IDService/1/"
    })
  end
end
