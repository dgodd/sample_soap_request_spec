class GlobalWeather
  def initialize
    @client = Savon.client(wsdl: "http://www.webservicex.com/globalweather.asmx?WSDL")
  end

  def get_weather(city, country)
    xml = @client.call(:get_weather, message: { "CityName" => city, "CountryName" => country }).body.try(:[], :get_weather_response).try(:[], :get_weather_result)
    Hash.from_xml(xml).try(:[], "CurrentWeather")
  end

  def get_cities_by_country(country)
    xml = @client.call(:get_cities_by_country, message: { "CountryName" => country }).body.try(:[], :get_cities_by_country_response).try(:[], :get_cities_by_country_result)
    data = Hash.from_xml(xml)["NewDataSet"]["Table"] rescue []
    data.map { |x| x["City"] }
  end
end
