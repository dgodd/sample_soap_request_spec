require 'rails_helper'

RSpec.describe IdServiceController, :type => :controller do
  let(:client) { double(:savon_client) }
  before do
    allow(Savon).to receive(:client) { client }
    allow(client).to receive(:call).with(:generate) { double(body: { generate_response: { id: '101' } } ) }
  end

  describe "index" do
    it "returns ok" do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
    end

    it "calls generate" do
      get :index, format: :json
      expect(response.body).to eq '{"id":"101"}'
    end
  end
end
