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

      forecasts.first(10).each do |forecast|
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

    URI.open("https://api.stormglass.io/v2/tide/extremes/point?lat=#{lat}&lng=#{lng}",
            "Authorization" => "fb35486c-2f03-11eb-8db0-0242ac130002-fb35495c-2f03-11eb-8db0-0242ac130002") do |stream|
      data, meta = JSON.parse(stream.read).values_at('data','meta')

      data.each do |tide_data|
        tide = Tide.new(
          tide_type: tide_data["type"],
          time: Time.parse(tide_data["time"]) + 2.hours
        )
        tide.weather = Weather.all.find { |weather| tide.time.to_date == weather.datetime.to_date && weather.spot == @spot }
        tide.save!
      end
    end
  end
end
