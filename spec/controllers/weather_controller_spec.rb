require 'rails_helper'

RSpec.describe WeatherController, :type => :controller do
  let(:client) { double(:savon_client) }
  before do
    allow(Savon).to receive(:client) { client }
    allow(client).to receive(:call).with(:get_city_forecast_by_zip, message: { "ZIP" => "10028" }).and_return(
      double(body: { get_city_forecast_by_zip_response: { get_city_forecast_by_zip_result: {
        data: 'from soap service' } } } ))
  end

  describe "by_zip" do
    it "returns ok" do
      get :by_zip, zip: 10028, format: :json
      expect(response).to have_http_status(:ok)
    end

    it "calls get_city_forecast_by_zip" do
      get :by_zip, zip: 10028, format: :json
      expect(response.body).to eq '{"data":"from soap service","forecast":{}}'
    end
  end
end
