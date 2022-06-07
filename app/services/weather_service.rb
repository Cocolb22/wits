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

    URI.open("http://api.meteo-concept.com/api/forecast/daily?latlng=#{latlngt}&token=#{ENV['WEATHER_TOKEN']}") do |stream|
      city, forecasts = JSON.parse(stream.read).values_at('city','forecast')

      forecasts.each do |forecast|
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

    URI.open("https://api.stormglass.io/v2/tide/sea-level/point?latlng=#{latlngt}&token=#{ENV['WEATHER_TOKEN']}") do |stream|
      city, forecasts = JSON.parse(stream.read).values_at('city','forecast')

      forecasts.each do |forecast|
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

end
