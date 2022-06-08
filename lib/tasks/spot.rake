namespace :spot do
  desc "Get updated weather for spots"
  task get_all_weather: :environment do
    spots = Spot.all
    puts "Enqueuing update of #{spots.size} spots..."
    spots.each do |spot|
      WeatherJob.perform_later(spot)
    end
  end
end
