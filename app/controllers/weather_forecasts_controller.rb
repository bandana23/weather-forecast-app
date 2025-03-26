class WeatherForecastsController < ApplicationController
    def show
        zip_code = params[:zip_code]
        cache_key = "weather_#{zip_code}"

        @weather = Rails.cache.fetch(cache_key,expires_in: 30.minutes) do 
            weather_forecast_service = WeatherForecastService.new(zip_code)
            weather_forecast_service.current_weather
        end

        #check for empty zipcode result
        if @weather.present?
            if Rails.cache.exist?(cache_key)
                @from_cache  = true
            else
                @from_cache  = false
            end
        else
            flash[:notice] = "No data found for the provided Zipcode"
            @flash_msg = flash[:notice]
            return render "show" 
        end
    end
end
