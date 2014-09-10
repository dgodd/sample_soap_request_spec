class WeatherController < ApplicationController
  def by_zip
    data = client.call :get_city_forecast_by_zip, message: { "ZIP" => params[:zip]  }
    data = data.body[:get_city_forecast_by_zip_response][:get_city_forecast_by_zip_result]
    forecast = data.delete(:forecast_result)[:forecast].first rescue {}
    data[:forecast] = forecast

    render json: data
  end

  private

  def client
    @client ||= Savon.client(wsdl: "http://wsf.cdyne.com/WeatherWS/Weather.asmx?WSDL")
  end
end
