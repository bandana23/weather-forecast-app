class WeatherForecastService
    include HTTParty
    base_uri 'https://api.openweathermap.org/data/2.5'

    def  initialize(zip_code)
        @zip_code = zip_code
        @api_key = ENV['WEATHER_API_KEY']
    end

    def current_weather
        response = self.class.get("/weather", query: { zip: "#{@zip_code},us", appid: @api_key, units: 'metric' })
        return nil if response.code != 200
        get_weather_data = response.parsed_response
        # puts get_weather_data.inspect
        if get_weather_data && get_weather_data['main'] && get_weather_data['weather'].first
            {
                temperature: get_weather_data['main']['temp'],
                high: get_weather_data['main']['temp_max'],
                low: get_weather_data['main']['temp_min'],
                description:get_weather_data['weather'].first['description'],
                cityName: get_weather_data['name']
            }
        else
            nil 
        end
    end

end