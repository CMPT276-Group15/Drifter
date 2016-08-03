class Forecast < ActiveRecord::Base
end

def get_weather_data        
  ForecastIO.forecast(lat, lng)  
end
