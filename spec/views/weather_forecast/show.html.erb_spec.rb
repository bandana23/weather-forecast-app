require 'rails_helper'

RSpec.feature "weather_forecast/show", type: :feature do
  context "when weather data is available" do
    before do
      # Allowing the WeatherForecastService to accept a valid weather response.
      allow_any_instance_of(WeatherForecastService).to receive(:current_weather).and_return({
        temperature: 28.77,
        high: 30.0,
        low: 25.0,
        description: 'clear sky',
        cityName: 'Melissa'
      })

      #entering a valid zip code to check response.
      visit weather_forecasts_path(zip_code: '75001') 
    end

    #To display current weather forecast header
    it 'displays the weather forecast header' do
      expect(page).to have_content("Weather Forecast")
    end

    #This test will display current weather info
    it 'displays the current weather information' do
      expect(page).to have_content("Temperature: 28.77 °C")
      expect(page).to have_content("High: 30.0 °C")
      expect(page).to have_content("Low: 25.0 °C")
      expect(page).to have_content("Description: clear sky")
      expect(page).to have_content("CityName: Melissa")
    end
    it 'displays data retrieved from cache' do
      expect(page).to have_content("Data retrieved from cache")
    end

  end

  context "when no weather data is available" do
    before do
      # Allowing the WeatherForecastService with no weather data.
      allow_any_instance_of(WeatherForecastService).to receive(:current_weather).and_return(nil)

      # trying to enter a zip code that does not return weather data.
      visit weather_forecasts_path(zip_code:'1223')  
    end

    it 'displays a flash message when no weather data is found' do
      # It will display alert message if no data is available
      expect(page).to have_css('.alert-danger', text: "No data found for the provided Zipcode")
    end

    it 'redirects to the root path when no data is found' do
      # After no data is found, it should redirect to show path
      expect(page.current_path).to eq("/weather_forecasts")
    end
  end
end