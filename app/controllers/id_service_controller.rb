class IdServiceController < ApplicationController
  respond_to :json

  def index
    respond_with(client.call(:generate).body.try(:[], :generate_response))
  end

  private

  def client
    @client ||= Savon.client(wsdl: "http://www.predic8.com:8080/base/IDService?wsdl")
  end
end
