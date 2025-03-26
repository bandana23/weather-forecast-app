require 'rails_helper'

RSpec.describe WeatherForecastsController, type: :controller do
    describe 'GET #show' do 
        context 'When a valid zipcode is provided' do 
            let(:zip_code) {'75454'}

            it 'fecthes weather forecast data' do 
                VCR.use_cassette("weather_forecast_75454") do 
                    get :show,params: {zip_code: zip_code}
                    expect(response).to have_http_status(:success)
                    # puts assigns.inspect
                    expect(assigns(:weather)).to be_present
                end
            end

            it 'displays weather forecast data from cache if data is available' do 
                get :show,params: {zip_code: zip_code}
                expect(assigns(:from_cache)).to eq(false)
            end
        end
    end
end