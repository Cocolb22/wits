module StatusHelper
  def icon_for_status(status)
    case status
    when "Mousse"
      image_tag("level/level_matelot.svg", class:"hat-class animate__animated animate__swing")
    when "Matelot"
      image_tag("level/level_capitaine.svg", class:"hat-class animate__animated animate__swing")
    when "Capitaine"
      image_tag("level/level_amiral.svg", class:"hat-class animate__animated animate__swing")
    when "Amiral"
      image_tag("level/level_vieux_briscard.svg", class:"hat-class animate__animated animate__swing")
    else
      image_tag("level/level_mousse.svg", class:"hat-class animate__animated animate__swing")
    end
  end
end
