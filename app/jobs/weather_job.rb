class WeatherJob < ApplicationJob
  queue_as :default

  def perform(spot)
    WeatherService.new(spot).call
  end
end
