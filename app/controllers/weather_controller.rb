class WeatherController < ApplicationController
  respond_to :json

  def by_zip
    response = client.call :get_city_forecast_by_zip, message: { "ZIP" => params[:zip]  }
    respond_with response.body[:get_city_forecast_by_zip_response][:get_city_forecast_by_zip_result]
  end

  private

  def client
    @client ||= Savon.client(wsdl: "http://wsf.cdyne.com/WeatherWS/Weather.asmx?WSDL")
  end
end
