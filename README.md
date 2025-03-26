# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
* Rails Version - Rails 7.2.2.1
* Ruby version - ruby 3.1.2p20

* System dependencies- Openssl version should be OpenSSL 3.4.1 11 Feb 2025 (Library: OpenSSL 3.4.1 11 Feb 2025) if rails 7.
# Steps to get the project run
    - get the project from github
    - Ruby should be installed (https://rvm.io/rvm/install)
    - bundle install
    - no models or no schema config since we are calling an api called openweather api through service
    - rails s
* Configuration of Service: (base_uri 'https://api.openweathermap.org/data/2.5')
    # I am using this free api service to check the weather forecast through zipcode.
    # I created a weather_api_key by logging into that and to use in this application/can use the default one also.
    # Calling this service to my weather forecasts controller in show method


* Database creation

* Database initialization

* How to run the test suite


# To RUN ALL TESTS TOGETHER
bundle exec rspec - It will run all test included in this project

# To Run the service test:
rspec spec/services/weather_forecast_service_spec.rb --format documentation
# To Run the controller test:
rspec spec/controllers/weather_forecast_controller_spec.rb --format documentation
# To Run specific view test here I have show.html.erb
rspec spec/views/weather_forecast/show.html.erb_spec.rb --format documentation



* Services (job queues, cache servers, search engines, etc.)
    - first go to rails console rails c and check the service response by below line
    - WeatherForecastService.new('75454')
* Deployment instructions

* ...
