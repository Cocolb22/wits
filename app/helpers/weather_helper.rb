module WeatherHelper

  def get_picto_for(weather)
    return unless weather

    if weather.match?(/(nuageux|couvert|voilé)/i)
      return image_tag 'icons/clouds.png'
    elsif weather.match?(/(pluie|bruine|averse)/i)
      return image_tag 'icons/rain.png'
    elsif weather.match?(/neige/i)
      return image_tag 'icons/neige.png'
    elsif weather.match?(/orage/i)
      return image_tag 'icons/thunder.png'
    elsif weather.match?(/brouillard/i)
      return image_tag 'icons/brouillard.png'
    else
      return image_tag 'icons/sun.png'
    end
  end
end
