require 'rails_helper'
require 'webmock/rspec'

RSpec.describe WeatherForecastService, type: :service do
  let(:zip_code) { '75454' } # Example zip code
  let(:api_key) { 'test_api_key' }
  let(:weather_service) { WeatherForecastService.new(zip_code) }

  before do
    # Set up the environment variable for the API key (mock it)
    allow(ENV).to receive(:[]).with('WEATHER_API_KEY').and_return(api_key)
  end

  describe '#current_weather' do
    context 'when the API request is successful' do
      let(:response_body) do
        {
          'main' => { 'temp' => 20, 'temp_max' => 25, 'temp_min' => 15 },
          'weather' => [{ 'description' => 'clear sky' }],
          'name' => 'Melissa'
        }.to_json
      end

      before do
        # Stub the HTTP request to return a successful response
        stub_request(:get, "https://api.openweathermap.org/data/2.5/weather?zip=#{zip_code},us&appid=#{api_key}&units=metric")
          .to_return(status: 200, body: response_body, headers: { 'Content-Type' => 'application/json' })
      end

      it 'returns the current weather data' do
        result = weather_service.current_weather

        expect(result).to eq({
          temperature: 20,
          high: 25,
          low: 15,
          description: 'clear sky',
          cityName: 'Melissa'
        })
      end
    end

    context 'when the API request is unsuccessful' do
      before do
        # Stub the HTTP request to return an error response (non-200 status)
        stub_request(:get, "https://api.openweathermap.org/data/2.5/weather?zip=#{zip_code},us&appid=#{api_key}&units=metric")
          .to_return(status: 500, body: '', headers: { 'Content-Type' => 'application/json' })
      end

      it 'returns nil' do
        result = weather_service.current_weather
        expect(result).to be_nil
      end
    end

    context 'when the API response is missing expected data' do
      let(:invalid_response_body) do
        {
          'main' => { 'temp' => 20 },
          'weather' => [] # No weather description available
        }.to_json
      end

      before do
        stub_request(:get, "https://api.openweathermap.org/data/2.5/weather?zip=#{zip_code},us&appid=#{api_key}&units=metric")
          .to_return(status: 200, body: invalid_response_body, headers: { 'Content-Type' => 'application/json' })
      end

      it 'returns nil if expected data is missing' do
        result = weather_service.current_weather
        expect(result).to be_nil
      end
    end
  end
end