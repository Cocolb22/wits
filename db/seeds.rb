require "open-uri"

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
                  age: 25, gender: "Femme")
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
                    age: 33)
file_valentin = File.open("db/fixtures/valentin.jpeg")
valentin.photo.attach(io: file_valentin, filename: 'valentin.jpeg', content_type: 'image/jpeg')
valentin.save!

wits = User.new(first_name: 'wits', last_name: 'Wagon', nick_name: 'Wits', email: "wits@test.com",
                password: "password", address: "2 rue de la mabilais, 35000 Rennes",
                age: 40, gender: "Homme")
file_wits = File.open("db/fixtures/WITS.png")
wits.photo.attach(io: file_wits, filename: 'WITS.png', content_type: 'image/png')
wits.save!

#############################################################################################
########################################### SPOTS ###########################################
#############################################################################################

evt_treb = Spot.new(user: wits, full_name: 'École de voile de Trébeurden', address: "3 Rue de Traou Meur, 22560 Trébeurden",
                    longitute: 48.768374, latitude: -3.581077,
                    description: 'L’école de voile de Trébeurden est une association labellisée FFVoile et située
                      au cœur de la côte de granit rose en Bretagne dont le but est de rendre
                      la voile accessible à tous !', type: 'École', verified: true)
file_evt_treb = File.open("db/fixtures/evt_treb.jpeg")
evt_treb.photo.attach(io: file_evt_treb, filename: 'evt_treb.jpeg', content_type: 'image/jpeg')
evt_treb.save!

evt_ile_grande = Spot.new(user: wits, full_name: 'Base Nautique Ile Grande', address: "Imp. de Pors-Gelen, 22560 Pleumeur-Bodou",
                          longitute: 48.80651976306186, latitude: -3.5646267302955557,
                          description: "Affiliée à la Fédération Française de Voile, nous respectons la Charte Qualité,
                            ce qui nous confère les labels d'école française de voile, de voile loisir et d'école de sport.
                            Des stages ou locations sont proposés aux particuliers, aux groupes, comités d'entrprises ainsi
                            qu'aux classes sur une flotte variée (dériveurs, catamarans, PAV, kayak, voilier)
                            pendant les vacances de la Toussaint, Printemps et d'été.", type: 'École', verified: true)
file_evt_ile_grande = File.open("db/fixtures/evt_ile_grande.jpeg")
evt_ile_grande.photo.attach(io: file_evt_ile_grande, filename: 'evt_ile_grande.jpeg', content_type: 'image/jpeg')
evt_ile_grande.save!

evt_tregastel = Spot.new(user: wits, full_name: 'Club Nautique de Trégastel', address: "41 Av. de la Grève Blanche, 22730 Trégastel",
                         longitute: 48.82996826216762, latitude: -3.52501805913103,
                         description: "Ecole Française de Voile et Ecole Française de Canoë-Kayak. Une équipe à votre
                          service : investis dans une démarche qualité, nous vous accueillons toute l'année dans une
                          ambiance familiale. Un matériel récent et entretenu : adaptées à tous les âges et
                          tous les niveaux. Pour votre confort, le portage est facilité.
                          Agréé Jeunesse et Sport", type: 'École', verified: true)
file_evt_tregastel = File.open("db/fixtures/evt_tregastel.jpeg")
evt_tregastel.photo.attach(io: file_evt_tregastel, filename: 'evt_tregastel.jpeg', content_type: 'image/jpeg')
evt_tregastel.save!

evt_perros = Spot.new(user: wits, full_name: 'Centre Nautique de Perros-Guirec', address: "Plage de Trestraou, 22700 Perros-Guirec",
                      longitute: 48.8178555, latitude: -3.46072919,
                      description: 'Découvrir la voile, se perfectionner, louer du matériel ou simplement se laisser
                        guider lors d’une balade nautique : venez profiter d’un espace de navigation unique, le long
                        de la Côte de Granit Rose, au large de l’archipel des 7 îles. Une équipe de professionnels
                        qualifiés et une infrastructure moderne garantissent votre sécurité et votre confort.',
                      type: 'École', verified: true)
file_evt_perros = File.open("db/fixtures/evt_perros.jpeg")
evt_perros.photo.attach(io: file_evt_perros, filename: 'evt_perros.jpeg', content_type: 'image/jpeg')
evt_perros.save!

plage_goas_treiz = Spot.new(user: wits, full_name: 'Plage de Goas Treiz', address: "Plage de Goas Treiz, 22560 Trébeurden",
                            longitute: 48.781748, latitude: 3.578422,
                            description: 'A la sortie de Trébeurden, face au marais du Quellen, la plage de Goas Treiz,
                              orientée Nord-Ouest est le spot de glisse prisé des wingfoilers, windsurfeurs et les kitesurfeurs
                              de la région. La navigation se fait vers Port Saint Sauveur à l’Ile Grande.
                              Attention aux ailerons à marée basse, de nombreux cailloux reste immergés.',
                            type: 'Plage', verified: true)
file_plage_goas_treiz = File.open("db/fixtures/plage_goas_treiz.jpeg")
plage_goas_treiz.photo.attach(io: file_plage_goas_treiz, filename: 'plage_goas_treiz.jpeg', content_type: 'image/jpeg')
plage_goas_treiz.save!

plage_goas_treiz = Spot.new(user: wits, full_name: 'Plage de Tresmeur', address: "Plage de Tresmeur, 22560 Trébeurden",
                            longitute: 48.7668390, latitude: -3.58137660,
                            description: 'C’est le spot à proximité de l’Ecole de voile de Trébeurden.
                              On y pratique tous les sports de glisse : le windsurf, le wingfoil, le kyte selon
                              les conditions de vent. Les jours de pétole, les balades en SUP invitent à la découverte de
                              la côte. A Tresmeur, les bars sont sur la promenade le long de la plage,
                              le petit plus après une bonne nav.',
                            type: 'Plage', verified: true)
file_plage_goas_treiz = File.open("db/fixtures/plage_goas_treiz.jpeg")
plage_goas_treiz.photo.attach(io: file_plage_goas_treiz, filename: 'plage_goas_treiz.jpeg', content_type: 'image/jpeg')
plage_goas_treiz.save!

plage_tresmeur = Spot.new(user: wits, full_name: 'Plage de Tresmeur', address: "Plage de Tresmeur, 22560 Trébeurden",
                          longitute: 48.7668390, latitude: -3.58137660,
                          description: 'C’est le spot à proximité de l’Ecole de voile de Trébeurden.
                            On y pratique tous les sports de glisse : le windsurf, le wingfoil, le kyte selon
                            les conditions de vent. Les jours de pétole, les balades en SUP invitent à la découverte de
                            la côte. A Tresmeur, les bars sont sur la promenade le long de la plage,
                            le petit plus après une bonne nav.',
                          type: 'Plage', verified: true)
file_plage_tresmeur = File.open("db/fixtures/plage_tresmeur.jpeg")
plage_tresmeur.photo.attach(io: file_plage_tresmeur, filename: 'plage_tresmeur.jpeg', content_type: 'image/jpeg')
plage_tresmeur.save!

plage_toul_gwenn = Spot.new(user: wits, full_name: 'Plage de Toul Gwenn', address: "Plage de Toul Gwenn, 22560 Pleumeur-Bodou",
                            longitute: 48.801364049065796, latitude: -3.563637586114924,
                            description: 'A l’abri des vents dominants, la plus grande dune de l’Ile Grande abrite
                              la plage de Toul Gwen. A marée haute, ce véritable lagon de sable blanc à l’eau transparente
                              est idéale pour s’initier aux plaisirs de la glisse : windsurf et stand up paddle.
                              En ayant quasiment toujours pied, les sessions entre l’île Aval et l’île Mouton
                              sont véritablement sécurisées.', type: 'Plage', verified: true)
file_plage_toul_gwenn = File.open("db/fixtures/plage_toul_gwenn.jpeg")
plage_toul_gwenn.photo.attach(io: file_plage_toul_gwenn, filename: 'plage_toul_gwenn.jpeg', content_type: 'image/jpeg')
plage_toul_gwenn.save!

##################################################################################################
########################################### ACTIVITIES ###########################################
##################################################################################################

surf_activity = Activity.create!(name: "Surf", description: " Le surf (abréviation française de l'anglais surf-riding,
                                  où riding signifie « monter » et surf « (vagues) déferlantes ») est une pratique
                                  physique individuelle de glisse sur les vagues, au bord de l'océan.")
file_surf_activity = File.open("db/fixtures/surf_icon.png")
surf_activity.photo.attach(io: file_surf_activity, filename: 'surf_icon.png', content_type: 'image/png')
surf_activity.save!

kitesurf_activity = Activity.create!(name: "Kitesurf", description: " Le kitesurf, ou planche aérotractée,
                                      est un sport de glisse consistant à évoluer avec une planche à la surface
                                      d'une étendue d'eau en étant tracté par un cerf-volant (kite en anglais)
                                      spécialement adapté, nommé aile ou voile. Ce sport a pris son essor au début
                                      des années 2000.")
file_kitesurf_activity = File.open("db/fixtures/kitesurf_icon.jpg")
kitesurf_activity.photo.attach(io: file_kitesurf_activity, filename: 'kitesurf_icon.jpg', content_type: 'image/jpg')
kitesurf_activity.save!

kayak_activity = Activity.create!(name: "Kayak", description: "Un kayak ou kayac est un type de pirogue légère utilisant
                                  une pagaie pour le propulser, le diriger et l'équilibrer.")
file_kayak_activity = File.open("db/fixtures/kayak_icon.jpg")
kayak_activity.photo.attach(io: file_kayak_activity, filename: 'kayak_icon.jpg', content_type: 'image/jpg')
kayak_activity.save!

cliff_diving_activity = Activity.create!(name: "Saut depuis une falaise", description: "Le saut de falaises est un sport
                                        qui consiste à se jeter de falaises où d'autres objets pour profiter d'un saut
                                        en chute libre avant d'atterrir dans l'eau")
file_cliff_diving_activity = File.open("db/fixtures/cliff_diving_icon.png")
cliff_diving_activity.photo.attach(io: file_cliff_diving_activity, filename: 'cliff_diving_icon.png', content_type: 'image/png')
cliff_diving_activity.save!

yachting_activity = Activity.create!(name: "Char à voile", description: "Un char à voile est un véhicule à roues propulsé
                                      par une voile. Par métonymie, ce terme désigne aussi le sport qui consiste à
                                      conduire cet engin. Il est pratiqué sur les grandes plages de sable et quelques
                                      fois dans les terres.")
file_yachting_activity = File.open("db/fixtures/yachting_icon.jpg")
yachting_activity.photo.attach(io: file_yachting_activity, filename: 'yachting_icon.jpg', content_type: 'image/jpg')
yachting_activity.save!

windsurf_activity = Activity.create!(name: "Planche à voile", description: "La planche à voile (parfois désignée par
                                    son nom anglais, windsurf) est un type d'embarcation à voile minimaliste,
                                    c'est aussi le sport de glisse pratiqué avec cette embarcation.")
file_windsurf_activity = File.open("db/fixtures/windsurf_icon.jpg")
windsurf_activity.photo.attach(io: file_windsurf_activity, filename: 'windsurf_icon.jpg', content_type: 'image/jpg')
windsurf_activity.save!

scuba_diving_activity = Activity.create!(name: "Plongée en apnée", description: "La plongée sous-marine est une activité
                                          consistant à rester sous l'eau, soit en apnée dans le cas de la plongée libre,
                                          soit en respirant à l'aide d'un tuba ou le plus souvent en s'équipant d'une
                                          bouteille de plongée dans le cas de la plongée en scaphandre autonome.")
file_scuba_diving_activity = File.open("db/fixtures/scuba_diving_icon.png")
scuba_diving_activity.photo.attach(io: file_scuba_diving_activity, filename: 'scuba_diving_icon.png', content_type: 'image/png')
scuba_diving_activity.save!

catamaran_activity = Activity.create!(name: "Catamaran", description: "Un catamaran est un bateau possédant deux coques,
                                      en général parallèles l'une à côté de l'autre. Le catamaran possédant deux coques
                                      se classe donc dans la catégorie des bateaux multicoques qui comprend également
                                      le trimaran, dont le nom dérive.")
file_catamaran_activity = File.open("db/fixtures/catamaran_icon.jpg")
catamaran_activity.photo.attach(io: file_catamaran_activity, filename: 'catamaran_icon.jpg', content_type: 'image/jpg')
catamaran_activity.save!
