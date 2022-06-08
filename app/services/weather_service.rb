require 'open-uri'

class WeatherService
  CODES_TEMPS = ["Soleil", "Peu nuageux", "Ciel voilé", "Nuageux", "Très nuageux", "Couvert", "Brouillard", "Brouillard", "Pluie faible", "Pluie modérée", "Pluie forte", "Pluie faible", "Pluie modérée",
    "Pluie forte", "Bruine", "Neige faible", "Neige modérée", "Neige forte", "Pluie", "Pluie", "Pluie", "Averses",
    "Averses", "Averses", "Averses", "Averses", "Averses", "Averses", "Averses",
    "Averses", "Averses", "Averses", "Averses", "Averses", "Averses", "Averses",
    "Averses", "Averses", "Averses", "Averses", "Averses",
    "Averses", "Averses", "Averses", "Averses", "Averses",
    "Averses", "Averses", "Orages", "Orages", "Orages fort", "Orages", "Orages", "Orages", "Orages",
    "Orages", "Orages", "Orages", "Orages", "Orages", "Orages", "Orages", "Orages",
    "Orages", "Orages", "Orages", "Orages", "Orages",
    "Orages", "Orages", "Orages", "Orages", "Orages",
    "Orages", "Orages", "Pluies orageuses", "Pluie orageuses", "Neige orageuse", "Pluie faible", "Pluie modérée",
    "Pluie forte", "Neige faible", "Neige modérée", "Neige forte", "Pluie", "Pluie", "Pluie", "Averses"]

  def initialize(spot)
    @spot = spot
  end

  def call
    @spot.weathers.destroy_all
    latlngt = [@spot.latitude, @spot.longitude].join(",")
    lat = @spot.latitude
    lng = @spot.longitude

    URI.open("http://api.meteo-concept.com/api/forecast/daily?latlng=#{latlngt}&token=#{ENV['WEATHER_TOKEN']}") do |stream|
      city, forecasts = JSON.parse(stream.read).values_at('city','forecast')

      forecasts.first(7).each do |forecast|
        Weather.create!(
          spot: @spot,
          day: forecast["day"],
          datetime: Time.parse(forecast['datetime']),
          wind_direction: (forecast["dirwind10m"]),
          tmin: forecast["tmin"],
          tmax: forecast["tmax"],
          wind: forecast["wind10m"],
          gust: forecast["gust10m"],
          probarain:forecast["probarain"],
          weather: CODES_TEMPS[forecast["weather"].to_i]
        )
      end
    end

    URI.open("https://api.worldweatheronline.com/premium/v1/marine.ashx?q=#{lat},#{lng}&format=json&key=85bca80049ee46f093763719220806&tide=yes&td=24") do |stream|
      data = JSON.parse(stream.read)['data']["weather"]

      data.each do |weather_data|
        weather_date = Date.parse(weather_data["date"])
        weather = Weather.all.find { |weather| weather_date == weather.datetime.to_date && weather.spot == @spot }
        
        weather.uv = weather_data["uv"]

        weather_data["tides"].first["tide_data"].each do |tide_data|
          tide = Tide.new(
            tide_type: tide_data["tide_type"].downcase,
            time: Time.parse(tide_data["tideDateTime"]) + 2.hours
          )

          tide.weather = weather
          tide.save!
        end

        weather.save!
      end
    end
  end
end
