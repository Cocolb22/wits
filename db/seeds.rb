require "open-uri"
require 'json'
require 'time'

Spot.destroy_all
Activity.destroy_all
User.destroy_all
#############################################################################################
########################################### USERS ###########################################
#############################################################################################
corentin = User.new(nick_name: 'Cocolb22', email: "corentin@test.com", password: "password")
file_corentin = File.open("db/fixtures/Corentin.jpeg")
corentin.photo.attach(io: file_corentin, filename: 'Corentin.jpeg', content_type: 'image/jpeg')
corentin.save!

shiyun = User.new(first_name: 'Shiyun', last_name: 'Batlle', nick_name: 'RabbitBatlle', email: "shiyun@test.com",
                  password: "password", address: "2 rue de la mabilais, 35000 Rennes",
                  birthday: Date.new(1988, 6, 7), gender: "Femme")
file_shiyun = File.open("db/fixtures/Shiyun.jpeg")
shiyun.photo.attach(io: file_shiyun, filename: 'Shiyun.jpeg', content_type: 'image/jpeg')
shiyun.save!

aurore = User.new(first_name: 'Aurore', last_name: 'Qoi', nick_name: 'AuroreQoi', email: "aurore@test.com",
                  password: "password")
file_aurore = File.open("db/fixtures/Aurore.jpeg")
aurore.photo.attach(io: file_aurore, filename: 'aurore.jpeg', content_type: 'image/jpeg')
aurore.save!

valentin = User.new(first_name: 'Valentin', last_name: 'Renon', nick_name: 'Neron22', email: "valentin@test.com",
                    password: "password", address: "38 rue de bonne nouvelle, 22560 Trebeurden",
                    birthday: Date.new(1998, 8, 10))
file_valentin = File.open("db/fixtures/Valentin.png")
valentin.photo.attach(io: file_valentin, filename: 'Valentin.png', content_type: 'image/png')
valentin.save!

wits = User.new(first_name: 'wits', last_name: 'Wagon', nick_name: 'Wits', email: "wits@test.com",
                password: "password", address: "2 rue de la mabilais, 35000 Rennes",
                birthday: Date.new(2000, 2, 12), gender: "Homme")
file_wits = File.open("db/fixtures/WITS.png")
wits.photo.attach(io: file_wits, filename: 'WITS.png', content_type: 'image/png')
wits.save!

#############################################################################################
########################################### SPOTS ###########################################
#############################################################################################

evt_treb = Spot.new(user: wits, full_name: 'École de voile de Trébeurden', street: "3 Rue de Traou Meur", zipcode:"22560", city:"Trébeurden",
                    latitude: 48.768374, longitude: -3.581077,
                    description: 'L’école de voile de Trébeurden est une association labellisée FFVoile et située
                      au cœur de la côte de granit rose en Bretagne dont le but est de rendre
                      la voile accessible à tous !', spot_type: 'École', verified: true, icon: "school.png")
file_evt_treb = File.open("db/fixtures/evt_treb.jpeg")
evt_treb.photos.attach(io: file_evt_treb, filename: 'evt_treb.jpeg', content_type: 'image/jpeg')
evt_treb.save!

evt_ile_grande = Spot.new(user: wits, full_name: 'Base Nautique Ile Grande', street: "Imp. de Pors-Gelen", zipcode:"22560", city:"Pleumeur-Bodou",
                          latitude: 48.80651976306186, longitude: -3.5646267302955557,
                          description: "Affiliée à la Fédération Française de Voile, nous respectons la Charte Qualité,
                            ce qui nous confère les labels d'école française de voile, de voile loisir et d'école de sport.
                            Des stages ou locations sont proposés aux particuliers, aux groupes, comités d'entrprises ainsi
                            qu'aux classes sur une flotte variée (dériveurs, catamarans, PAV, kayak, voilier)
                            pendant les vacances de la Toussaint, Printemps et d'été.", spot_type: 'École', verified: true, icon: "school.png")
file_evt_ile_grande = File.open("db/fixtures/evt_ile_grande.jpeg")
evt_ile_grande.photos.attach(io: file_evt_ile_grande, filename: 'evt_ile_grande.jpeg', content_type: 'image/jpeg')
evt_ile_grande.save!

evt_tregastel = Spot.new(user: wits, full_name: 'Club Nautique de Trégastel', street: "41 Av. de la Grève Blanche", zipcode:"22730", city:"Trégastel",
                        latitude: 48.82996826216762, longitude: -3.52501805913103,
                        description: "Ecole Française de Voile et Ecole Française de Canoë-Kayak. Une équipe à votre
                          service : investis dans une démarche qualité, nous vous accueillons toute l'année dans une
                          ambiance familiale. Un matériel récent et entretenu : adaptées à tous les âges et
                          tous les niveaux. Pour votre confort, le portage est facilité.
                          Agréé Jeunesse et Sport", spot_type: 'École', verified: true, icon: "school.png")
file_evt_tregastel = File.open("db/fixtures/evt_tregastel.jpeg")
evt_tregastel.photos.attach(io: file_evt_tregastel, filename: 'evt_tregastel.jpeg', content_type: 'image/jpeg')
evt_tregastel.save!

evt_perros = Spot.new(user: wits, full_name: 'Centre Nautique de Perros-Guirec', street: "Plage de Trestraou", zipcode:"22700", city:"Perros-Guirec",
                      latitude: 48.8178555, longitude: -3.46072919,
                      description: 'Découvrir la voile, se perfectionner, louer du matériel ou simplement se laisser
                        guider lors d’une balade nautique : venez profiter d’un espace de navigation unique, le long
                        de la Côte de Granit Rose, au large de l’archipel des 7 îles. Une équipe de professionnels
                        qualifiés et une infrastructure moderne garantissent votre sécurité et votre confort.',
                      spot_type: 'École', verified: true, icon: "school.png")
file_evt_perros = File.open("db/fixtures/evt_perros.jpeg")
evt_perros.photos.attach(io: file_evt_perros, filename: 'evt_perros.jpeg', content_type: 'image/jpeg')
evt_perros.save!

plage_goas_treiz = Spot.new(user: wits, full_name: 'Plage de Goas Treiz', street: "Plage de Goas Treiz", zipcode:"22560", city:"Trébeurden",
                            latitude: 48.781748, longitude: -3.578422,
                            description: 'A la sortie de Trébeurden, face au marais du Quellen, la plage de Goas Treiz,
                              orientée Nord-Ouest est le spot de glisse prisé des wingfoilers, windsurfeurs et les kitesurfeurs
                              de la région. La navigation se fait vers Port Saint Sauveur à l’Ile Grande.
                              Attention aux ailerons à marée basse, de nombreux cailloux reste immergés.',
                            spot_type: 'Plage', verified: true, icon: "beach.png")
file_plage_goas_treiz = File.open("db/fixtures/plage_goas_treiz.jpeg")
plage_goas_treiz.photos.attach(io: file_plage_goas_treiz, filename: 'plage_goas_treiz.jpeg', content_type: 'image/jpeg')
plage_goas_treiz.save!

plage_tresmeur = Spot.new(user: wits, full_name: 'Plage de Tresmeur', street: "Plage de Tresmeur", zipcode:"22560", city:"Trébeurden",
                          latitude: 48.7668390, longitude: -3.58137660,
                          description: 'C’est le spot à proximité de l’Ecole de voile de Trébeurden.
                            On y pratique tous les sports de glisse : le windsurf, le wingfoil, le kyte selon
                            les conditions de vent. Les jours de pétole, les balades en SUP invitent à la découverte de
                            la côte. A Tresmeur, les bars sont sur la promenade le long de la plage,
                            le petit plus après une bonne nav.',
                          spot_type: 'Plage', verified: true, icon: "beach.png")
file_plage_tresmeur = File.open("db/fixtures/plage_tresmeur.jpeg")
plage_tresmeur.photos.attach(io: file_plage_tresmeur, filename: 'plage_tresmeur.jpeg', content_type: 'image/jpeg')
plage_tresmeur.save!

plage_toul_gwenn = Spot.new(user: User.first, full_name: 'Plage de Toul Gwenn', street: "Plage de Toul Gwenn", zipcode:"22560", city:"Pleumeur-Bodou",
                            latitude: 48.801364049065796, longitude: -3.563637586114924,
                            description: 'A l’abri des vents dominants, la plus grande dune de l’Ile Grande abrite
                              la plage de Toul Gwen. A marée haute, ce véritable lagon de sable blanc à l’eau transparente
                              est idéale pour s’initier aux plaisirs de la glisse : windsurf et stand up paddle.
                              En ayant quasiment toujours pied, les sessions entre l’île Aval et l’île Mouton
                              sont véritablement sécurisées.', spot_type: 'Plage', verified: true, icon: "beach.png")
file_plage_toul_gwenn = File.open("db/fixtures/plage_tresmeur.jpeg")
plage_toul_gwenn.photos.attach(io: file_plage_toul_gwenn, filename: 'plage_tresmeur.jpeg', content_type: 'image/jpeg')
plage_toul_gwenn.save!


TOKEN = "d94e51c82dfac84ee6e9e938fd9b66dd18dcddeab62d0eda61cd3ca9e99842a0"

CODES_TEMPS = ["Soleil", "Peu nuageux", "Ciel voilé", "Nuageux", "Très nuageux", "Couvert", "Brouillard", "Brouillard givrant", "Pluie faible", "Pluie modérée", "Pluie forte", "Pluie faible verglaçante", "Pluie modérée verglaçante",
                  "Pluie forte verglaçante", "Bruine", "Neige faible", "Neige modérée", "Neige forte", "Pluie et neige mêlées faibles", "Pluie et neige mêlées modérées", "Pluie et neige mêlées fortes", "Averses de pluie locales et faibles",
                  "Averses de pluie locales", "Averses locales et fortes", "Averses de pluie faibles", "Averses de pluie", "Averses de pluie fortes", "Averses de pluie faibles et fréquentes", "Averses de pluie fréquentes",
                  "Averses de pluie fortes et fréquentes", "Averses de neige localisées et faibles", "Averses de neige localisées", "Averses de neige localisées et fortes", "Averses de neige faibles", "Averses de neige", "Averses de neige fortes",
                  "Averses de neige faibles et fréquentes", "Averses de neige fréquentes", "Averses de neige fortes et fréquentes", "Averses de pluie et neige mêlées localisées et faibles", "Averses de pluie et neige mêlées localisées",
                  "Averses de pluie et neige mêlées localisées et fortes", "Averses de pluie et neige mêlées faibles", "Averses de pluie et neige mêlées", "Averses de pluie et neige mêlées fortes", "Averses de pluie et neige mêlées faibles et nombreuses",
                  "Averses de pluie et neige mêlées fréquentes", "Averses de pluie et neige mêlées fortes et fréquentes", "Orages faibles et locaux", "Orages locaux", "Orages fort et locaux", "Orages faibles", "Orages", "Orages forts", "Orages faibles et fréquents",
                  "Orages fréquents", "Orages forts et fréquents", "Orages faibles et locaux de neige ou grésil", "Orages locaux de neige ou grésil", "Orages locaux de neige ou grésil", "Orages faibles de neige ou grésil", "Orages de neige ou grésil", "Orages de neige ou grésil",
                  "Orages faibles et fréquents de neige ou grésil", "Orages fréquents de neige ou grésil", "Orages fréquents de neige ou grésil", "Orages faibles et locaux de pluie et neige mêlées ou grésil", "Orages locaux de pluie et neige mêlées ou grésil",
                  "Orages fort et locaux de pluie et neige mêlées ou grésil", "Orages faibles de pluie et neige mêlées ou grésil", "Orages de pluie et neige mêlées ou grésil", "Orages forts de pluie et neige mêlées ou grésil", "Orages faibles et fréquents de pluie et neige mêlées ou grésil",
                  "Orages fréquents de pluie et neige mêlées ou grésil", "Orages forts et fréquents de pluie et neige mêlées ou grésil", "Pluies orageuses", "Pluie et neige mêlées à caractère orageux", "Neige à caractère orageux", "Pluie faible intermittente", "Pluie modérée intermittente",
                  "Pluie forte intermittente", "Neige faible intermittente", "Neige modérée intermittente", "Neige forte intermittente", "Pluie et neige mêlées", "Pluie et neige mêlées", "Pluie et neige mêlées", "Averses de grêle"]



Spot.all.each do |spot|
  latlngt = [spot.latitude, spot.longitude].join(",")

  URI.open("http://api.meteo-concept.com/api/forecast/daily?latlng=#{latlngt}&token=#{TOKEN}") do |stream|
    city, forecasts = JSON.parse(stream.read).values_at('city','forecast')

    forecasts.each do |forecast|

      Weather.create!(
        spot: spot,
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

##################################################################################################
########################################### ACTIVITIES ###########################################
##################################################################################################

surf_activity = Activity.create!(name: "Surf", description: " Le surf (abréviation française de l'anglais surf-riding,
                                  où riding signifie « monter » et surf « (vagues) déferlantes ») est une pratique
                                  physique individuelle de glisse sur les vagues, au bord de l'océan.", icon:'surf.png')
surf_activity.save!

kitesurf_activity = Activity.create!(name: "Kitesurf", description: " Le kitesurf, ou planche aérotractée,
                                      est un sport de glisse consistant à évoluer avec une planche à la surface
                                      d'une étendue d'eau en étant tracté par un cerf-volant (kite en anglais)
                                      spécialement adapté, nommé aile ou voile. Ce sport a pris son essor au début
                                      des années 2000.", icon:'kite_surf.png')
kitesurf_activity.save!

kayak_activity = Activity.create!(name: "Kayak", description: "Un kayak ou kayac est un type de pirogue légère utilisant
                                  une pagaie pour le propulser, le diriger et l'équilibrer.", icon:"kayak.png")
kayak_activity.save!

cliff_diving_activity = Activity.create!(name: "Saut depuis une falaise", description: "Le saut de falaises est un sport
                                        qui consiste à se jeter de falaises où d'autres objets pour profiter d'un saut
                                        en chute libre avant d'atterrir dans l'eau", icon:"cliff_diving.png")
cliff_diving_activity.save!

yachting_activity = Activity.create!(name: "Char à voile", description: "Un char à voile est un véhicule à roues propulsé
                                      par une voile. Par métonymie, ce terme désigne aussi le sport qui consiste à
                                      conduire cet engin. Il est pratiqué sur les grandes plages de sable et quelques
                                      fois dans les terres.", icon:'yachting.png' )
yachting_activity.save!

windsurf_activity = Activity.create!(name: "Planche à voile", description: "La planche à voile (parfois désignée par
                                    son nom anglais, windsurf) est un type d'embarcation à voile minimaliste,
                                    c'est aussi le sport de glisse pratiqué avec cette embarcation.", icon:'windsurf.png' )
windsurf_activity.save!

scuba_diving_activity = Activity.create!(name: "Plongée en apnée", description: "La plongée sous-marine est une activité
                                          consistant à rester sous l'eau, soit en apnée dans le cas de la plongée libre,
                                          soit en respirant à l'aide d'un tuba ou le plus souvent en s'équipant d'une
                                          bouteille de plongée dans le cas de la plongée en scaphandre autonome.", icon:'scuba_diving.png')
scuba_diving_activity.save!

catamaran_activity = Activity.create!(name: "Catamaran", description: "Un catamaran est un bateau possédant deux coques,
                                      en général parallèles l'une à côté de l'autre. Le catamaran possédant deux coques
                                      se classe donc dans la catégorie des bateaux multicoques qui comprend également
                                      le trimaran, dont le nom dérive.", icon:'catamaran.png')
catamaran_activity.save!

##################################################################################################
########################################### SPOT_ACTIVITIES ######################################
##################################################################################################

surf_to_tresmeur = SpotActivity.create!(spot:plage_tresmeur, activity: surf_activity)
kayak_to_tresmeur = SpotActivity.create!(spot:plage_tresmeur, activity: kayak_activity)
kitesurf_to_tresmeur = SpotActivity.create!(spot:plage_tresmeur, activity: kitesurf_activity)

catamaran_to_toul_gwenn = SpotActivity.create!(spot:plage_toul_gwenn, activity: catamaran_activity)
cliff_diving_to_toul_gwenn = SpotActivity.create!(spot:plage_toul_gwenn, activity:cliff_diving_activity)
scuba_diving_to_toul_gwenn = SpotActivity.create!(spot:plage_toul_gwenn, activity: scuba_diving_activity)

kayak_to_goas_treiz = SpotActivity.create!(spot:plage_goas_treiz, activity: kayak_activity)
windsurf_to_goas_treiz = SpotActivity.create!(spot:plage_goas_treiz, activity: windsurf_activity)
yachting_to_goas_treiz = SpotActivity.create!(spot:plage_goas_treiz, activity: yachting_activity)


yachting_to_perros = SpotActivity.create!(spot:evt_perros, activity:yachting_activity )
catamaran_to_perros = SpotActivity.create!(spot:evt_perros, activity: catamaran_activity)
cliff_diving_to_perros = SpotActivity.create!(spot:evt_perros, activity:cliff_diving_activity)

cliff_diving_to_tregastel = SpotActivity.create!(spot:evt_tregastel, activity:cliff_diving_activity)
windsurf_to_tregastel = SpotActivity.create!(spot:evt_tregastel, activity: windsurf_activity)

cliff_diving_to_ile_grande = SpotActivity.create!(spot:evt_ile_grande, activity:cliff_diving_activity)
yachting_to_ile_grande = SpotActivity.create!(spot:evt_ile_grande, activity:yachting_activity )
surf_to_ile_grande = SpotActivity.create!(spot:evt_ile_grande, activity: surf_activity)
catamaran_to_ile_grande = SpotActivity.create!(spot:evt_ile_grande, activity: catamaran_activity)

surf_to_treb = SpotActivity.create!(spot:evt_treb, activity:surf_activity)
windsurf_to_treb = SpotActivity.create!(spot:evt_treb, activity: windsurf_activity)
kayak_to_treb = SpotActivity.create!(spot:evt_treb, activity: kayak_activity)
scuba_diving_to_treb = SpotActivity.create!(spot:evt_treb, activity: scuba_diving_activity)

##################################################################################################
########################################### COMMENTS #############################################
##################################################################################################

comment_to_treb = Comment.create!( user:valentin, spot:evt_treb, content:" une école pas terrible mais avec une super discothèque au dessus de la plage", rating: 3)
comment_to_treb_2 = Comment.create!( user:aurore, spot:evt_treb, content:" une école parfaite pour les débutants pour apprendre à naviguer", rating: 5)
comment_to_treb_3 = Comment.create!( user:shiyun, spot:evt_treb, content:" une plage agréable et proche de tous les commerces nécessaires pour une famille", rating: 5)

comment_to_ile_grande = Comment.create!( user:corentin, spot:evt_ile_grande, content:" le personnel est agréable et où il est possible de louer facilement des catamarans", rating: 4)
comment_to_ile_grande_2 = Comment.create!( user:valentin, spot:evt_ile_grande, content:" l'école m'a montré un super coin pas loin des rochers, où il y a pleins de jolis poissons", rating: 5)
comment_to_ile_grande_3 = Comment.create!( user:aurore, spot:evt_ile_grande, content:"ATTENTION AU MONITEUR QUI NE FAIT QUE REGARDER LES FILLES QUI MARCHENT SUR LA PLAGE", rating: 1)

comment_to_toul_gwenn = Comment.create!( user:shiyun, spot:plage_toul_gwenn, content:" une ballade sympa avec un moniteur en catamaran, dommage qu'il ne faisait pas beau", rating: 3)
comment_to_toul_gwenn_2 = Comment.create!( user:valentin, spot:plage_toul_gwenn, content:"le spot de saut est difficle d'accès, mais une fois qu'on y est, la vue est incroyable", rating: 5)
comment_to_toul_gwenn_3 = Comment.create!( user:corentin, spot:plage_toul_gwenn, content:"la plage était remplie de tous ses connards de parisiens, impossible de trouver une place, vivement qu'ils se cassent!", rating: 2)

comment_to_goas_treiz = Comment.create!( user:shiyun, spot: plage_goas_treiz, content:"la ballade en kayak le long de la cote de granit rose est à faire!", rating: 5)
comment_to_goas_treiz_2 = Comment.create!( user:aurore, spot: plage_goas_treiz, content:"un temps purement breton m'a empeché de bronzer, j'ai été obligé d'aller dans une salle de bronzage pour faire croire que j'étais parti en vacances.
  La prochaine fois j'irais à Nice", rating: 1)
comment_to_goas_treiz_3 = Comment.create!( user: corentin, spot:plage_goas_treiz, content:"la monitrice de planche à voile est compétente, je recommande la leçon", rating: 5)

comment_to_perros = Comment.create!(user:valentin, spot:evt_perros, content:"le moniteur de catamaran est vraiment nul, à cause de lui on a dessalé, et je garderais une cicatrice au visage après m'être pris le mat", rating: 0)
comment_to_perros_2 = Comment.create!(user:shiyun, spot:evt_perros, content:"j'ai réussi à faire une double backflip sur le spot de saut de 20 mètres, je suis prête pour les JO 2024", rating: 5)
comment_to_perros_3 = Comment.create!(user:corentin, spot:evt_perros, content:"le marchand de glaces fait des glaces artisanales à se taper le cul par terre", rating: 4)

comment_to_tregastel = Comment.create!(user:aurore, spot:evt_tregastel, content:"le petit saut du haut de la digue est à faire à marée haute, et non quand on voit le sable", rating: 2 )
comment_to_tregastel_2 = Comment.create!(user:shiyun, spot: evt_tregastel, content:"il a fait trop moche pour pouvoir profiter da la bouée géante de l'école de voile...", rating: 1)
comment_to_tregastel_3 = Comment.create!(user:valentin, spot:evt_tregastel, content: "une plage calme et agréable pour une ballade en famille le long du sentier des douaniers", rating: 4)

comment_to_tresmeur = Comment.create!(user:shiyun, spot:plage_tresmeur, content: "on m'avait vendu la plage comme étant belle, mais franchement c'est surcôté", rating: 1)
comment_to_tresmeur_2 = Comment.create!(user: valentin, spot: plage_tresmeur, content: " je me suis fait charrier sur les rochers à cause d'une rafale de vent, franchement cette plague est mal entretenu", rating: 0)
comment_to_tresmeur_3 = Comment.create!(user: aurore, spot: plage_tresmeur, content: "J'ai venu, j'ai vu, il a plu, cela ne m'a pas plu", rating: 0 )

##################################################################################################
########################################### FAVORITES ############################################
##################################################################################################

favorite_to_valentin = Favorite.create!(user:valentin , spot:plage_tresmeur)
favorite_to_valentin_1 = Favorite.create!(user:valentin , spot:evt_tregastel)
favorite_to_valentin_2 = Favorite.create!(user:valentin , spot:plage_goas_treiz)

favorite_to_shiyun = Favorite.create!(user:shiyun , spot:plage_goas_treiz)
favorite_to_shiyun_1 = Favorite.create!(user:shiyun , spot:plage_toul_gwenn)
favorite_to_shiyun_2 = Favorite.create!(user:shiyun , spot:evt_treb)
favorite_to_shiyun_3 = Favorite.create!(user:shiyun , spot:evt_ile_grande)


favorite_to_aurore = Favorite.create!(user:aurore , spot:plage_goas_treiz)
favorite_to_aurore_1 = Favorite.create!(user:aurore , spot:plage_tresmeur)
favorite_to_aurore_2 = Favorite.create!(user:aurore , spot:evt_perros)

favorite_to_corentin = Favorite.create!(user:corentin, spot: evt_perros)
favorite_to_corentin_1 = Favorite.create!(user:corentin, spot: evt_tregastel)
favorite_to_corentin_2 = Favorite.create!(user:corentin, spot: evt_treb )

##################################################################################################
########################################### SERVICES ############################################
##################################################################################################

services_to_perros = Service.create!(spot:evt_perros, parking: true, restaurant: true, shower: true, camping: true, beach_surveillance: true)
services_to_tregastel = Service.create!(spot:evt_tregastel, parking: true, shower: true, beach_surveillance: true)
services_to_tremeur = Service.create!(spot:plage_tresmeur, parking: true, beach_surveillance: true, restaurant: true)
services_to_goas_treiz = Service.create!(spot:plage_goas_treiz, shower: true)
services_to_toul_gwenn = Service.create!(spot: plage_toul_gwenn, restaurant:true, shower:true, beach_surveillance: true)
services_to_treb = Service.create!(spot:evt_treb, parking: true, beach_surveillance: true)
services_to_ile_grande = Service.create!(spot:evt_ile_grande, restaurant: true, shower: true, camping: true, beach_surveillance: true)

##################################################################################################
######################################### LIKES ##################################################
##################################################################################################

likes_to_comment = Like.create!(user: valentin, comment: comment_to_treb_2)
likes_to_comment_1 = Like.create!(user: valentin, comment: comment_to_tresmeur_3)
likes_to_comment_2 = Like.create!(user: valentin, comment: comment_to_ile_grande)

likes_to_comment_3 = Like.create!(user: shiyun, comment: comment_to_tresmeur_2 )
likes_to_comment_4 = Like.create!(user: shiyun, comment: comment_to_tresmeur_2 )
likes_to_comment_5 = Like.create!(user: shiyun, comment: comment_to_tregastel_3 )

likes_to_comment_6 = Like.create!(user: corentin, comment: comment_to_goas_treiz)
likes_to_comment_7 = Like.create!(user: corentin, comment: comment_to_treb_2)
likes_to_comment_8 = Like.create!(user: corentin, comment: comment_to_toul_gwenn_2)

likes_to_comment_9 = Like.create!(user:aurore, comment: comment_to_ile_grande_3)
likes_to_comment_10 = Like.create!(user:aurore, comment: comment_to_treb_2 )
likes_to_comment_11 = Like.create!(user: shiyun, comment: comment_to_tregastel_3 )
