require "open-uri"
require 'json'
require 'time'

Spot.destroy_all
Activity.destroy_all
User.destroy_all
#############################################################################################
########################################### USERS ###########################################
#############################################################################################
corentin = User.new(
                    nick_name: 'Cocolb22',
                    email: "corentin@test.com",
                    password: "password"
                  )
file_corentin = File.open("db/fixtures/Corentin.jpeg")
corentin.photo.attach(io: file_corentin, filename: 'Corentin.jpeg', content_type: 'image/jpeg')
corentin.save!

shiyun = User.new(
                  email: "shiyun@test.com",
                  password: "password",
                  nick_name: 'RabbitBatlle',
                  address: "2 rue de la mabilais, 35000 Rennes", address_completed: true,
                  first_name: 'Shiyun', first_name_completed: true,
                  last_name: 'Batlle', last_name_completed: true,
                  birthday: Date.new(1988, 6, 7), birthday_completed: true,
                  gender: "Femme", gender_completed: true,
                  profile_exp: 150,
                  status: "Capitaine"
                )
file_shiyun = File.open("db/fixtures/Shiyun.jpeg")
shiyun.photo.attach(io: file_shiyun, filename: 'Shiyun.jpeg', content_type: 'image/jpeg')
shiyun.save!

aurore = User.new(
                  nick_name: 'AuroreQoi',
                  email: "aurore@test.com",
                  password: "password",
                  first_name: 'Aurore', first_name_completed: true,
                  last_name: 'Qoi', last_name_completed: true,
                  profile_exp: 260,
                  status: "Amiral"
                )
file_aurore = File.open("db/fixtures/Aurore.jpeg")
aurore.photo.attach(io: file_aurore, filename: 'aurore.jpeg', content_type: 'image/jpeg')
aurore.save!

valentin = User.new(
                  nick_name: 'Neron22',
                  email: "valentin@test.com",
                  password: "password",
                  first_name: 'Valentin', first_name_completed: true,
                  last_name: 'Renon', last_name_completed: true,
                  address: "38 rue de bonne nouvelle, 22560 Trebeurden", address_completed: true,
                  birthday: Date.new(1998, 8, 10), birthday_completed: true,
                  profile_exp: 550,
                  status: "Vieux Briscard"
                  )
file_valentin = File.open("db/fixtures/Valentin.png")
valentin.photo.attach(io: file_valentin, filename: 'Valentin.png', content_type: 'image/png')
valentin.save!

wits = User.new(
              nick_name: 'Wits',
              email: "wits@test.com",
              password: "password",
              first_name: 'wits', first_name_completed: true,
              last_name: 'Wagon', last_name_completed: true,
              address: "2 rue de la mabilais, 35000 Rennes", address_completed: true,
              birthday: Date.new(2000, 2, 12), birthday_completed: true,
              gender: "Homme", gender_completed: true,
              profile_exp:10
               )
file_wits = File.open("db/fixtures/WITS.png")
wits.photo.attach(io: file_wits, filename: 'WITS.png', content_type: 'image/png')
wits.save!

emilie = User.new(
  nick_name: 'emijolie',
  email: "emilie@test.com",
  password: "password"
)
file_emilie = File.open("db/fixtures/fake1.jpeg")
emilie.photo.attach(io: file_emilie, filename: 'fake1.jpeg', content_type: 'image/jpeg')
emilie.save!

aurelie = User.new(
  nick_name: 'auré',
  email: "aurelie@test.com",
  password: "password"
)
file_aurelie = File.open("db/fixtures/fake2.jpeg")
aurelie.photo.attach(io: file_aurelie, filename: 'fake2.jpeg', content_type: 'image/jpeg')
aurelie.save!

alicia = User.new(
  nick_name: 'alili',
  email: "alicia@test.com",
  password: "password"
)
file_alicia = File.open("db/fixtures/fake3.jpeg")
alicia.photo.attach(io: file_alicia, filename: 'fake3.jpeg', content_type: 'image/jpeg')
alicia.save!

jean_michou = User.new(
  nick_name: 'jean_michou',
  email: "jean_michou@test.com",
  password: "password"
)
file_jean_michou = File.open("db/fixtures/fake4.jpeg")
jean_michou.photo.attach(io: file_jean_michou, filename: 'fake4.jpeg', content_type: 'image/jpeg')
jean_michou.save!

sylvie = User.new(
  nick_name: 'vartan22',
  email: "sylvie@test.com",
  password: "password"
)
file_sylvie = File.open("db/fixtures/fake5.jpeg")
sylvie.photo.attach(io: file_sylvie, filename: 'fake5.jpeg', content_type: 'image/jpeg')
sylvie.save!

morganne = User.new(
  nick_name: "momor l'amor",
  email: "morganne@test.com",
  password: "password"
)
file_morganne = File.open("db/fixtures/fake6.jpeg")
morganne.photo.attach(io: file_morganne, filename: 'fake6.jpeg', content_type: 'image/jpeg')
morganne.save!

julio = User.new(
  nick_name: 'el iglesia',
  email: "julio@test.com",
  password: "password"
)
file_julio = File.open("db/fixtures/fake7.jpeg")
julio.photo.attach(io: file_julio, filename: 'fake7.jpeg', content_type: 'image/jpeg')
julio.save!

camille = User.new(
  nick_name: 'mimile',
  email: "camille@test.com",
  password: "password"
)
file_camille = File.open("db/fixtures/fake8.jpeg")
camille.photo.attach(io: file_camille, filename: 'fake8.jpeg', content_type: 'image/jpeg')
camille.save!

helene = User.new(
  nick_name: 'la troyenne',
  email: "helene@test.com",
  password: "password"
)
file_helene = File.open("db/fixtures/fake9.jpeg")
helene.photo.attach(io: file_helene, filename: 'fake9.jpeg', content_type: 'image/jpeg')
helene.save!

audrey = User.new(
  nick_name: 'pas pulvar',
  email: "audrey@test.com",
  password: "password"
)
file_audrey = File.open("db/fixtures/fake10.jpeg")
audrey.photo.attach(io: file_audrey, filename: 'fake10.jpeg', content_type: 'image/jpeg')
audrey.save!

patrick = User.new(
  nick_name: 'papat',
  email: "patrick@test.com",
  password: "password"
)
file_patrick = File.open("db/fixtures/fake11.jpeg")
patrick.photo.attach(io: file_patrick, filename: 'fake11.jpeg', content_type: 'image/jpeg')
patrick.save!

elsa = User.new(
  nick_name: 'libérée',
  email: "elsa@test.com",
  password: "password"
)
file_elsa = File.open("db/fixtures/fake12.jpeg")
elsa.photo.attach(io: file_elsa, filename: 'fake12.jpeg', content_type: 'image/jpeg')
elsa.save!

anna = User.new(
  nick_name: 'ptite blonde',
  email: "anna@test.com",
  password: "password"
)
file_anna = File.open("db/fixtures/fake13.jpeg")
anna.photo.attach(io: file_anna, filename: 'fake13.jpeg', content_type: 'image/jpeg')
anna.save!

zoe = User.new(
  nick_name: 'zozo',
  email: "zoe@test.com",
  password: "password"
)
file_zoe = File.open("db/fixtures/fake14.jpeg")
zoe.photo.attach(io: file_zoe, filename: 'fake14.jpeg', content_type: 'image/jpeg')
zoe.save!

michelle = User.new(
  nick_name: 'michou',
  email: "michelle@test.com",
  password: "password"
)
file_michelle = File.open("db/fixtures/fake15.jpeg")
michelle.photo.attach(io: file_michelle, filename: 'fake15.jpeg', content_type: 'image/jpeg')
michelle.save!

emilia = User.new(
  nick_name: 'clé',
  email: "emilia@test.com",
  password: "password"
)
file_emilia = File.open("db/fixtures/fake16.jpeg")
emilia.photo.attach(io: file_emilia, filename: 'fake16.jpeg', content_type: 'image/jpeg')
emilia.save!

sophie = User.new(
  nick_name: 'blondie',
  email: "sophie@test.com",
  password: "password"
)
file_sophie = File.open("db/fixtures/fake17.jpeg")
sophie.photo.attach(io: file_sophie, filename: 'fake17.jpeg', content_type: 'image/jpeg')
sophie.save!

christianne = User.new(
  nick_name: 'bibi',
  email: "christianne@test.com",
  password: "password"
)
file_christianne = File.open("db/fixtures/fake18.jpeg")
christianne.photo.attach(io: file_christianne, filename: 'fake18.jpeg', content_type: 'image/jpeg')
christianne.save!

noe = User.new(
  nick_name: 'sir19854',
  email: "noe@test.com",
  password: "password"
)
file_noe = File.open("db/fixtures/fake19.jpeg")
noe.photo.attach(io: file_noe, filename: 'fake19.jpeg', content_type: 'image/jpeg')
noe.save!

christine = User.new(
  nick_name: 'cricri',
  email: "christine@test.com",
  password: "password"
)
file_christine = File.open("db/fixtures/fake20.jpeg")
christine.photo.attach(io: file_christine, filename: 'fake20.jpeg', content_type: 'image/jpeg')
christine.save!

maelie = User.new(
  nick_name: 'kawaii',
  email: "maelie@test.com",
  password: "password"
)
file_maelie = File.open("db/fixtures/fake21.jpeg")
maelie.photo.attach(io: file_maelie, filename: 'fake21.jpeg', content_type: 'image/jpeg')
maelie.save!

charles = User.new(
  nick_name: 'le roi',
  email: "charles@test.com",
  password: "password"
)
file_charles = File.open("db/fixtures/fake22.jpeg")
charles.photo.attach(io: file_charles, filename: 'fake22.jpeg', content_type: 'image/jpeg')
charles.save!

francois = User.new(
  nick_name: 'francois',
  email: "francois@test.com",
  password: "password"
)
file_francois = File.open("db/fixtures/fake23.jpeg")
francois.photo.attach(io: file_francois, filename: 'fake23.jpeg', content_type: 'image/jpeg')
francois.save!

sarah = User.new(
  nick_name: 'sarah38',
  email: "sarah@test.com",
  password: "password"
)
file_sarah = File.open("db/fixtures/fake24.jpeg")
sarah.photo.attach(io: file_sarah, filename: 'fake24.jpeg', content_type: 'image/jpeg')
sarah.save!

josianne = User.new(
  nick_name: 'jojo',
  email: "josianne@test.com",
  password: "password"
)
file_josianne = File.open("db/fixtures/fake26.jpeg")
josianne.photo.attach(io: file_josianne, filename: 'fake26.jpeg', content_type: 'image/jpeg')
josianne.save!

melanie = User.new(
  nick_name: 'mel',
  email: "melanie@test.com",
  password: "password"
)
file_melanie = File.open("db/fixtures/fake27.jpeg")
melanie.photo.attach(io: file_melanie, filename: 'fake27.jpeg', content_type: 'image/jpeg')
melanie.save!

jeanne = User.new(
  nick_name: 'pépétte',
  email: "jeanne@test.com",
  password: "password"
)
file_jeanne = File.open("db/fixtures/fake28.jpeg")
jeanne.photo.attach(io: file_jeanne, filename: 'fake28.jpeg', content_type: 'image/jpeg')
jeanne.save!

thomas = User.new(
  nick_name: 'dallina',
  email: "thomas@test.com",
  password: "password"
)
file_thomas = File.open("db/fixtures/fake29.jpeg")
thomas.photo.attach(io: file_thomas, filename: 'fake29.jpeg', content_type: 'image/jpeg')
thomas.save!

arianne = User.new(
  nick_name: 'doudou',
  email: "arianne@test.com",
  password: "password"
)
file_arianne = File.open("db/fixtures/fake30.jpeg")
arianne.photo.attach(io: file_arianne, filename: 'fake30.jpeg', content_type: 'image/jpeg')
arianne.save!

marianne = User.new(
  nick_name: 'revolutionnaire',
  email: "marianne@test.com",
  password: "password"
)
file_marianne = File.open("db/fixtures/fake31.jpeg")
marianne.photo.attach(io: file_marianne, filename: 'fake31.jpeg', content_type: 'image/jpeg')
marianne.save!

olympe = User.new(
  nick_name: 'gouges',
  email: "olympe@test.com",
  password: "password"
)
file_olympe = File.open("db/fixtures/fake32.jpeg")
olympe.photo.attach(io: file_olympe, filename: 'fake32.jpeg', content_type: 'image/jpeg')
olympe.save!

louisa = User.new(
  nick_name: 'délice',
  email: "louisa@test.com",
  password: "password"
)
file_louisa = File.open("db/fixtures/fake25.jpeg")
louisa.photo.attach(io: file_louisa, filename: 'fake25.jpeg', content_type: 'image/jpeg')
louisa.save!

eloise = User.new(
  nick_name: 'elo',
  email: "eloise@test.com",
  password: "password"
)
file_eloise = File.open("db/fixtures/fake33.jpeg")
eloise.photo.attach(io: file_eloise, filename: 'fake33.jpeg', content_type: 'image/jpeg')
eloise.save!

marc = User.new(
  nick_name: 'marcus32',
  email: "marc@test.com",
  password: "password"
)
file_marc = File.open("db/fixtures/fake34.jpeg")
marc.photo.attach(io: file_marc, filename: 'fake34.jpeg', content_type: 'image/jpeg')
marc.save!

jean = User.new(
  nick_name: 'ptit mec',
  email: "jean@test.com",
  password: "password"
)
file_jean = File.open("db/fixtures/fake36.jpeg")
jean.photo.attach(io: file_jean, filename: 'fake36.jpeg', content_type: 'image/jpeg')
jean.save!

claude = User.new(
  nick_name: 'claudius le best',
  email: "claude@test.com",
  password: "password"
)
file_claude = File.open("db/fixtures/fake37.jpeg")
claude.photo.attach(io: file_claude, filename: 'fake37.jpeg', content_type: 'image/jpeg')
claude.save!

#############################################################################################
########################################### SPOTS ###########################################
#############################################################################################

evt_treb = Spot.new(user: wits, full_name: 'École de voile de Trébeurden', street: "3 Rue de Traou Meur", zipcode:"22560", city:"Trébeurden",
                    latitude: 48.768374, longitude: -3.581077,
                    description: 'L’école de voile de Trébeurden est une association labellisée FFVoile et située
                      au cœur de la côte de granit rose en Bretagne dont le but est de rendre
                      la voile accessible à tous !', spot_type: 'École', verified: true, icon: "type-sailing.svg")
evt_treb.build_address
file_evt_treb = File.open("db/fixtures/evt_treb.jpeg")
evt_treb.photos.attach(io: file_evt_treb, filename: 'evt_treb.jpeg', content_type: 'image/jpeg')

file_evt_treb = File.open("db/fixtures/spot_tresmeur_photo.jpeg")
evt_treb.photos.attach(io: file_evt_treb, filename: 'spot_tresmeur_photo.jpeg', content_type: 'image/jpeg')
evt_treb.save!

evt_ile_grande = Spot.new(user: wits, full_name: 'Base Nautique Ile Grande', street: "Imp. de Pors-Gelen", zipcode:"22560", city:"Pleumeur-Bodou",
                          latitude: 48.80651976306186, longitude: -3.5646267302955557,
                          description: "Affiliée à la Fédération Française de Voile, nous respectons la Charte Qualité,
                            ce qui nous confère les labels d'école française de voile, de voile loisir et d'école de sport.
                            Des stages ou locations sont proposés aux particuliers, aux groupes, comités d'entrprises ainsi
                            qu'aux classes sur une flotte variée (dériveurs, catamarans, PAV, kayak, voilier)
                            pendant les vacances de la Toussaint, Printemps et d'été.", spot_type: 'École', verified: true, icon: "type-sailing.svg")
evt_ile_grande.build_address
file_evt_ile_grande = File.open("db/fixtures/evt_ile_grande.jpeg")
evt_ile_grande.photos.attach(io: file_evt_ile_grande, filename: 'evt_ile_grande.jpeg', content_type: 'image/jpeg')
evt_ile_grande.save!

evt_tregastel = Spot.new(user: wits, full_name: 'Club Nautique de Trégastel', street: "41 Av. de la Grève Blanche", zipcode:"22730", city:"Trégastel",
                        latitude: 48.82996826216762, longitude: -3.52501805913103,
                        description: "Ecole Française de Voile et Ecole Française de Canoë-Kayak. Une équipe à votre
                          service : investis dans une démarche qualité, nous vous accueillons toute l'année dans une
                          ambiance familiale. Un matériel récent et entretenu : adaptées à tous les âges et
                          tous les niveaux. Pour votre confort, le portage est facilité.
                          Agréé Jeunesse et Sport", spot_type: 'École', verified: true, icon: "type-sailing.svg")
evt_tregastel.build_address
file_evt_tregastel = File.open("db/fixtures/evt_tregastel.jpeg")
evt_tregastel.photos.attach(io: file_evt_tregastel, filename: 'evt_tregastel.jpeg', content_type: 'image/jpeg')
evt_tregastel.save!

evt_perros = Spot.new(user: wits, full_name: 'Centre Nautique de Perros-Guirec', street: "Plage de Trestraou", zipcode:"22700", city:"Perros-Guirec",
                      latitude: 48.8178555, longitude: -3.46072919,
                      description: 'Découvrir la voile, se perfectionner, louer du matériel ou simplement se laisser
                        guider lors d’une balade nautique : venez profiter d’un espace de navigation unique, le long
                        de la Côte de Granit Rose, au large de l’archipel des 7 îles. Une équipe de professionnels
                        qualifiés et une infrastructure moderne garantissent votre sécurité et votre confort.',
                      spot_type: 'École', verified: true, icon: "type-sailing.svg")
evt_perros.build_address
file_evt_perros = File.open("db/fixtures/evt_perros.jpeg")
evt_perros.photos.attach(io: file_evt_perros, filename: 'evt_perros.jpeg', content_type: 'image/jpeg')
evt_perros.save!

plage_goas_treiz = Spot.new(user: wits, full_name: 'Plage de Goas Treiz', street: "Plage de Goas Treiz", zipcode:"22560", city:"Trébeurden",
                            latitude: 48.781748, longitude: -3.578422,
                            description: 'A la sortie de Trébeurden, face au marais du Quellen, la plage de Goas Treiz,
                              orientée Nord-Ouest est le spot de glisse prisé des wingfoilers, windsurfeurs et les kitesurfeurs
                              de la région. La navigation se fait vers Port Saint Sauveur à l’Ile Grande.
                              Attention aux ailerons à marée basse, de nombreux cailloux reste immergés.',
                            spot_type: 'Plage', verified: true, icon: "type-beach.svg")
plage_goas_treiz.build_address
file_plage_goas_treiz = File.open("db/fixtures/plage_goas_treiz.jpeg")
plage_goas_treiz.photos.attach(io: file_plage_goas_treiz, filename: 'plage_goas_treiz.jpeg', content_type: 'image/jpeg')

file_plage_goas_treiz = File.open("db/fixtures/plage_goas_treiz_2.jpeg")
plage_goas_treiz.photos.attach(io: file_plage_goas_treiz, filename: 'plage_goas_treiz_2.jpeg', content_type: 'image/jpeg')

file_plage_goas_treiz = File.open("db/fixtures/plage_goas_treiz_3.jpeg")
plage_goas_treiz.photos.attach(io: file_plage_goas_treiz, filename: 'plage_goas_treiz_3.jpeg', content_type: 'image/jpeg')
plage_goas_treiz.save!

plage_tresmeur = Spot.new(user: wits, full_name: 'Plage de Tresmeur', street: "Plage de Tresmeur", zipcode:"22560", city:"Trébeurden",
                          latitude: 48.7668390, longitude: -3.58137660,
                          description: 'C’est le spot à proximité de l’Ecole de voile de Trébeurden.
                            On y pratique tous les sports de glisse : le windsurf, le wingfoil, le kyte selon
                            les conditions de vent. Les jours de pétole, les balades en SUP invitent à la découverte de
                            la côte. A Tresmeur, les bars sont sur la promenade le long de la plage,
                            le petit plus après une bonne nav.',
                          spot_type: 'Plage', verified: true, icon: "type-beach.svg")
plage_tresmeur.build_address
file_plage_tresmeur = File.open("db/fixtures/plage_tresmeur.jpeg")
plage_tresmeur.photos.attach(io: file_plage_tresmeur, filename: 'plage_tresmeur.jpeg', content_type: 'image/jpeg')
file_plage_tresmeur1 = File.open("db/fixtures/spot_tresmeur_photo.jpeg")
plage_tresmeur.photos.attach(io: file_plage_tresmeur1, filename: 'spot_tresmeur_photo.jpeg', content_type: 'image/jpeg')
file_plage_tresmeur2 = File.open("db/fixtures/spot_tresmeur_photo_2.jpeg")
plage_tresmeur.photos.attach(io: file_plage_tresmeur2, filename: 'spot_tresmeur_photo_2.jpeg', content_type: 'image/jpeg')
file_plage_tresmeur3 = File.open("db/fixtures/spot_tresmeur_photo_3.jpeg")
plage_tresmeur.photos.attach(io: file_plage_tresmeur3, filename: 'spot_tresmeur_photo_3.jpeg', content_type: 'image/jpeg')
plage_tresmeur.save!

plage_toul_gwenn = Spot.new(user: User.first, full_name: 'Plage de Toul Gwenn', street: "Plage de Toul Gwenn", zipcode:"22560", city:"Pleumeur-Bodou",
                            latitude: 48.801364049065796, longitude: -3.563637586114924,
                            description: 'A l’abri des vents dominants, la plus grande dune de l’Ile Grande abrite
                              la plage de Toul Gwen. A marée haute, ce véritable lagon de sable blanc à l’eau transparente
                              est idéale pour s’initier aux plaisirs de la glisse : windsurf et stand up paddle.
                              En ayant quasiment toujours pied, les sessions entre l’île Aval et l’île Mouton
                              sont véritablement sécurisées.', spot_type: 'Plage', verified: true, icon: "type-beach.svg")
plage_toul_gwenn.build_address
file_plage_toul_gwenn = File.open("db/fixtures/Plage_toul_gwen.jpeg")
plage_toul_gwenn.photos.attach(io: file_plage_toul_gwenn, filename: 'Plage_toul_gwen.jpeg', content_type: 'image/jpeg')
file_plage_toul_gwenn = File.open("db/fixtures/plage_toul_gwen_2.jpeg")
plage_toul_gwenn.photos.attach(io: file_plage_toul_gwenn, filename: 'plage_toul_gwen_2.jpeg', content_type: 'image/jpeg')
plage_toul_gwenn.save!

Spot.all.each do |spot|
  WeatherService.new(spot).call
end

##################################################################################################
########################################### ACTIVITIES ###########################################
##################################################################################################

surf_activity = Activity.create!(name: "Surf", description: " Le surf (abréviation française de l'anglais surf-riding,
                                  où riding signifie « monter » et surf « (vagues) déferlantes ») est une pratique
                                  physique individuelle de glisse sur les vagues, au bord de l'océan.",
                                  icon: 'Surf-small.svg', bigicon: "Surf.svg")
surf_activity.save!

jet_ski_activity = Activity.create!(name: "Jetski", description: " Le Jet Ski (abréviation française de l'anglais Jet Ski-riding,
                                  où riding signifie « monter » et Jet Ski « (vagues) déferlantes ») est une pratique
                                  physique individuelle de glisse sur les vagues, au bord de l'océan.",
                                    icon: 'jet_ski-small.svg', bigicon: "JetSki.svg")
jet_ski_activity.save!

kitesurf_activity = Activity.create!(name: "Kitesurf", description: " Le kitesurf, ou planche aérotractée,
                                      est un sport de glisse consistant à évoluer avec une planche à la surface
                                      d'une étendue d'eau en étant tracté par un cerf-volant (kite en anglais)
                                      spécialement adapté, nommé aile ou voile. Ce sport a pris son essor au début
                                      des années 2000.", icon: 'KiteSurf-small.svg', bigicon: "KiteSurf.svg")
kitesurf_activity.save!

kayak_activity = Activity.create!(name: "Kayak", description: "Un kayak ou kayac est un type de pirogue légère utilisant
                                  une pagaie pour le propulser, le diriger et l'équilibrer.",
                                  icon: "Kayak-small.svg", bigicon: "Kayak.svg")
kayak_activity.save!

cliff_diving_activity = Activity.create!(name: "Saut de falaise", description: "Le saut de falaises est un sport
                                        qui consiste à se jeter de falaises où d'autres objets pour profiter d'un saut
                                        en chute libre avant d'atterrir dans l'eau",
                                         icon: "SauteFalaise-small.svg", bigicon: "SauteFalaise.svg")
cliff_diving_activity.save!

yachting_activity = Activity.create!(name: "Char à voile", description: "Un char à voile est un véhicule à roues propulsé
                                      par une voile. Par métonymie, ce terme désigne aussi le sport qui consiste à
                                      conduire cet engin. Il est pratiqué sur les grandes plages de sable et quelques
                                      fois dans les terres.", icon:'CharVoile-small.svg', bigicon: "CharVoile.svg")
yachting_activity.save!

windsurf_activity = Activity.create!(name: "Planche à voile", description: "La planche à voile (parfois désignée par
                                    son nom anglais, windsurf) est un type d'embarcation à voile minimaliste,
                                    c'est aussi le sport de glisse pratiqué avec cette embarcation.",
                                    icon:'Windsurf-small.svg', bigicon: "Windsurf.svg")
windsurf_activity.save!

scuba_diving_activity = Activity.create!(name: "Apnée", description: "La plongée sous-marine est une activité
                                          consistant à rester sous l'eau, soit en apnée dans le cas de la plongée libre,
                                          soit en respirant à l'aide d'un tuba ou le plus souvent en s'équipant d'une
                                          bouteille de plongée dans le cas de la plongée en scaphandre autonome.",
                                         icon: 'Scuba-small.svg', bigicon: "Scuba.svg")
scuba_diving_activity.save!

catamaran_activity = Activity.create!(name: "Catamaran", description: "Un catamaran est un bateau possédant deux coques,
                                      en général parallèles l'une à côté de l'autre. Le catamaran possédant deux coques
                                      se classe donc dans la catégorie des bateaux multicoques qui comprend également
                                      le trimaran, dont le nom dérive.", icon: 'Sailing-small.svg', bigicon: "Sailing.svg")
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
comment_to_treb_4 = Comment.create!( user:valentin, spot:evt_treb, content:" Superbe Plage j'y passerai tout mes été", rating: 5)
comment_to_treb_5 = Comment.create!( user:corentin, spot:evt_treb, content:" Incroyable sable fin ici, parfait pour les fin de soirées autour du feu", rating: 4)
comment_to_treb_6 = Comment.create!( user:emilie, spot:evt_treb, content:" J'ai grandis ici et j'ai vu la plage se dégradée au fur et a mesure du temps.", rating: 2)
comment_to_treb_7 = Comment.create!( user:wits, spot:evt_treb, content:" Sympathique avec les enfants, mais beaucoup de monde", rating: 2)
comment_to_treb_8 = Comment.create!( user:aurelie, spot:evt_treb, content:" TROP BIEN J'AI PECHO ", rating: 5)
comment_to_treb_9 = Comment.create!( user:alicia, spot:evt_treb, content:" pas mal pour un tour en bateau mais les gens la météo n'était pas au rendez-vous", rating: 3)
comment_to_treb_10 = Comment.create!( user:jean_michou, spot:evt_treb, content:" le parking est sublime, très beau béton", rating: 5)
comment_to_treb_11 = Comment.create!( user:sylvie, spot:evt_treb, content:" il fait froid dans cette région !!!! ", rating: 2)
comment_to_treb_12 = Comment.create!( user:morganne, spot:evt_treb, content:" hé bé, c'est pas mal hein", rating: 4)
comment_to_treb_13 = Comment.create!( user:julio, spot:evt_treb, content:" oui ", rating: 3)
comment_to_treb_14 = Comment.create!( user:camille, spot:evt_treb, content:" comment je fais pour laisser un commentaire? ", rating: 2)
comment_to_treb_15 = Comment.create!( user:helene, spot:evt_treb, content:" incroyable plage !!!!! sur la tête de ma mère j'ai même vu une baleine! ", rating: 5)
comment_to_treb_16 = Comment.create!( user:thomas, spot:evt_treb, content:" un jour j'ai attrapé un pigeon a main nu ici ! ", rating: 4)
comment_to_treb_17 = Comment.create!( user:olympe, spot:evt_treb, content:" ok sans plus", rating: 3)
comment_to_treb_18 = Comment.create!( user:marc, spot:evt_treb, content:" sérieux je sais pas ce qu'il vous faut mais je trouve ça legit ", rating: 4)
comment_to_treb_19 = Comment.create!( user:audrey, spot:evt_treb, content:" la meilleure partie du road-trip ici était le trajet ", rating: 1)
comment_to_treb_20 = Comment.create!( user:patrick, spot:evt_treb, content:" pas mal si on veut cacher un corps, mais c'est tout ", rating: 3)
comment_to_treb_21 = Comment.create!( user:elsa, spot:evt_treb, content:" bien amusée ici en famille c'était bath ", rating: 5)
comment_to_treb_22 = Comment.create!( user:anna, spot:evt_treb, content:" si vous trouver une montre swatch c'est la mienne merci de me prévenir", rating: 3)
comment_to_treb_23 = Comment.create!( user:zoe, spot:evt_treb, content:" je pense que cette plage est trop surcoté, elle est pas si bien que ça ", rating: 2)
comment_to_treb_24 = Comment.create!( user:michelle, spot:evt_treb, content:" je cherchais l'hopital pour donner naissance a mon premier enfant maps m'a conduit ici ", rating: 2)
comment_to_treb_25 = Comment.create!( user:sophie, spot:evt_treb, content:" j'ai trouvé une montre swatch ! trop bien ", rating: 5)
comment_to_treb_26 = Comment.create!( user:christianne, spot:evt_treb, content:" je crois que c'est ici qu'a été tournée un long dimanche de fiancaille !!!! meilleur film ", rating: 5)
comment_to_treb_27 = Comment.create!( user:arianne, spot:evt_treb, content:" je crois avoir vu jean yves le drian en maillot de bain mdr", rating: 3)
comment_to_treb_28 = Comment.create!( user:christine, spot:evt_treb, content:" vous pensez pas qu'il y a trop de commentaire sur cette page ? ", rating: 5)
comment_to_treb_29 = Comment.create!( user:louisa, spot:evt_treb, content:" nan easy il en faut plein de toute façon tkt", rating: 5)
comment_to_treb_30 = Comment.create!( user:jean, spot:evt_treb, content:" Ce serait trop bien qu'il y ai un ciné nocturne ici en été! ", rating: 4)
comment_to_treb_31 = Comment.create!( user:noe, spot:evt_treb, content:" le vendeur de glace n'avais plus de vanille :( ", rating: 1)
comment_to_treb_32 = Comment.create!( user:maelie, spot:evt_treb, content:" j'aurai du partir en vacances a Seattle, au moins la bas les gens sont sympathiques", rating: 1)
comment_to_treb_33 = Comment.create!( user:charles, spot:evt_treb, content:" Moi de mon temps on se plaignait pas du monde sur la plage! même s'il y a trop de monde", rating: 3)
comment_to_treb_34 = Comment.create!( user:francois, spot:evt_treb, content:" j'ai perdu au concours de création de chateau de sable T.T", rating: 4)
comment_to_treb_35 = Comment.create!( user:sarah, spot:evt_treb, content:" belle plage, sable agréable, plein de choses a faire et tres jolie ville!  ", rating: 5)
comment_to_treb_36 = Comment.create!( user:josianne, spot:evt_treb, content:" vous pensez qu'il y a une vie après la mort?", rating: 4)
comment_to_treb_37 = Comment.create!( user:melanie, spot:evt_treb, content:" la plage est supposée être surveillé. Ce n'est pas le cas. Mais la plage est belle ", rating: 4)
comment_to_treb_38 = Comment.create!( user:marianne, spot:evt_treb, content:" l'eau est propre! c'est de plus en plus rare", rating: 5)
comment_to_treb_39 = Comment.create!( user:eloise, spot:evt_treb, content:" j'ai gagné un concours de chateau de sable mdr !", rating: 5)
comment_to_treb_40 = Comment.create!( user:claude, spot:evt_treb, content:" Toujours la détente ici j'adore !!!!", rating: 4)
comment_to_treb_41 = Comment.create!( user:anna, spot:evt_treb, content:" plage plutot sale, je suis sur que c'est a cause de ces fichus touristes ! ", rating: 2)
comment_to_treb_42 = Comment.create!( user:michelle, spot:evt_treb, content:" j'ouvre mon restaurant de tapas ! n'hésitez pas a passer !!", rating: 5)
comment_to_treb_43 = Comment.create!( user:camille, spot:evt_treb, content:" Tellement d'activité ici !!! on ne s'ennuit jamais ! ", rating: 4)
comment_to_treb_44 = Comment.create!( user:marianne, spot:evt_treb, content:" y a un mec il m'a venère je lui ai foutu mon poings dans la gueule, ça détends", rating: 4)

comment_to_treb_45 = Comment.new( user:wits, spot:evt_treb, content:" mon premier spot de surf, c'était chill", rating: 4)
file_comment_to_treb_photo_1 = File.open("db/fixtures/comment_to_treb_photo_1.jpeg")
comment_to_treb_45.images.attach(io: file_comment_to_treb_photo_1, filename: 'comment_to_treb_photo_1.jpeg', content_type: 'image/jpeg')
comment_to_treb_45.save!

comment_to_treb_46 = Comment.create!( user:charles, spot:evt_treb, content:" je ne sais pas si c'est le bonne endroit pour dire ceci mais je crois que le restaurant d'a coté m'a rendu malade ", rating: 3)

comment_to_treb_47 = Comment.create!( user:helene, spot:evt_treb, content:" les mouettes ici sont très sympathique j'adore ! ", rating: 4)

comment_to_treb_48 = Comment.create!( user:eloise, spot:evt_treb, content:" c'est quoi ces gros pigeon blanc et jaune sur le sable la???? ils mangent mes churros", rating: 2)

comment_to_treb_49 = Comment.new( user:noe, spot:evt_treb, content:" mes parents m'ont forcé a sortir alors que j'étais en plein raid sur WoW", rating: 1)
file_comment_to_treb_photo_2 = File.open("db/fixtures/comment_to_treb_photo_2.jpeg")
comment_to_treb_49.images.attach(io: file_comment_to_treb_photo_2, filename: 'comment_to_treb_photo_2.jpeg', content_type: 'image/jpeg')
comment_to_treb_49.save!

comment_to_treb_50 = Comment.new( user:josianne, spot:evt_treb, content:" je suis venue en hiver pour éviter la foule, il faisait froid mais la session était dingue !!!", rating: 4)
file_comment_to_treb_photo_3 = File.open("db/fixtures/comment_to_treb_photo_3.jpeg")
comment_to_treb_50.images.attach(io: file_comment_to_treb_photo_3, filename: 'comment_to_treb_photo_3.jpeg', content_type: 'image/jpeg')
comment_to_treb_50.save!

comment_to_treb_51 = Comment.new( user:wits, spot:evt_treb, content:" jolie petite plage bien sympathique, balade en kayak avec la famille jusqu'à Miliau c'était magnifique ! ", rating: 4)



comment_to_treb_52 = Comment.create!( user:julio, spot:evt_treb, content:" Les monos de l'école de voile sont top, ça dérape souvent au bambou's après la session et ça finit en boite aux Chandelles !", rating: 2)

comment_to_treb_53 = Comment.new( user:arianne, spot:evt_treb, content:" Super spot de repli quand ça tabasse partout ailleurs ! Ça ferme fort mais il y a moyen de se caler des petites visières !", rating: 3)
file_comment_to_treb_photo_5 = File.open("db/fixtures/comment_to_treb_photo_5.jpeg")
comment_to_treb_53.images.attach(io: file_comment_to_treb_photo_5, filename: 'comment_to_treb_photo_6.jpeg', content_type: 'image/jpeg')
comment_to_treb_53.save!

comment_to_treb_54 = Comment.new( user:valentin, spot:evt_treb, content:" Super spot pour le Wingfoil, mais j'y viens souvent aussi avec ma fille ! Elle adore !", rating: 3)
file_comment_to_treb_photo_6 = File.open("db/fixtures/comment_to_treb_photo_6.jpeg")
comment_to_treb_54.images.attach(io: file_comment_to_treb_photo_6, filename: 'comment_to_treb_photo_6.jpeg', content_type: 'image/jpeg')

file_comment_to_treb_photo_6 = File.open("db/fixtures/spot_tresmeur_photo_2.jpeg")
comment_to_treb_54.images.attach(io: file_comment_to_treb_photo_6, filename: 'spot_tresmeur_photo_2.jpeg', content_type: 'image/jpeg')

file_comment_to_treb_photo_6 = File.open("db/fixtures/spot_tresmeur_photo_3.jpeg")
comment_to_treb_54.images.attach(io: file_comment_to_treb_photo_6, filename: 'spot_tresmeur_photo_3.jpeg', content_type: 'image/jpeg')
comment_to_treb_54.save!


comment_to_ile_grande = Comment.create!( user:corentin, spot:evt_ile_grande, content:" le personnel est agréable et où il est possible de louer facilement des catamarans", rating: 4)
comment_to_ile_grande_2 = Comment.create!( user:valentin, spot:evt_ile_grande, content:" l'école m'a montré un super coin pas loin des rochers, où il y a pleins de jolis poissons", rating: 5)
comment_to_ile_grande_3 = Comment.create!( user:aurore, spot:evt_ile_grande, content:"ATTENTION AU MONITEUR QUI NE FAIT QUE REGARDER LES FILLES QUI MARCHENT SUR LA PLAGE", rating: 1)

comment_to_toul_gwenn = Comment.create!( user:shiyun, spot:plage_toul_gwenn, content:" une ballade sympa avec un moniteur en catamaran, dommage qu'il ne faisait pas beau", rating: 3)
comment_to_toul_gwenn_2 = Comment.create!( user:valentin, spot:plage_toul_gwenn, content:"le spot de saut est difficle d'accès, mais une fois qu'on y est, la vue est incroyable", rating: 5)
comment_to_toul_gwenn_3 = Comment.create!( user:corentin, spot:plage_toul_gwenn, content:"la plage était remplie de tous ses connards de parisiens, impossible de trouver une place, vivement qu'ils se cassent!", rating: 2)

comment_to_goas_treiz = Comment.create!( user:shiyun, spot: plage_goas_treiz, content:"La ballade en kayak le long de la cote de granit rose est à faire!", rating: 5)
comment_to_goas_treiz_2 = Comment.create!( user:aurore, spot: plage_goas_treiz, content:"Un temps purement breton m'a empeché de bronzer, j'ai été obligé d'aller dans une salle de bronzage pour faire croire que j'étais parti en vacances.
  La prochaine fois j'irais à Nice, mais le spot était chouette quand même", rating: 4)

comment_to_goas_treiz_3 = Comment.new( user: corentin, spot:plage_goas_treiz, content:"la monitrice de planche à voile est compétente, je recommande la leçon", rating: 5)
file_comment_to_goas_treiz_photo_3 = File.open("db/fixtures/comment_to_treb_photo_3.jpeg")
comment_to_goas_treiz_3.images.attach(io: file_comment_to_goas_treiz_photo_3, filename: 'comment_to_goas_treiz_photo_3.jpeg', content_type: 'image/jpeg')
comment_to_goas_treiz_3.save!

comment_to_goas_treiz_4 = Comment.new( user:helene, spot:plage_goas_treiz, content:" les mouettes ici sont très sympathique j'adore ! ", rating: 4)
file_comment_to_goas_treiz_photo_4 = File.open("db/fixtures/comment_to_goas_treiz_photo_4.png")
comment_to_goas_treiz_4.images.attach(io: file_comment_to_goas_treiz_photo_4, filename: 'comment_to_goas_treiz_photo_4.png', content_type: 'image/png')
comment_to_goas_treiz_4.save!

comment_to_goas_treiz_5 = Comment.create!( user:eloise, spot:plage_goas_treiz, content:" c'est quoi ces gros pigeon blanc et jaune sur le sable la???? ils mangent mes churros", rating: 4)

comment_to_goas_treiz_6 = Comment.new( user:noe, spot:plage_goas_treiz, content:" mes parents m'ont forcé a sortir alors que j'étais en plein raid sur WoW", rating: 3)
file_comment_to_goas_treiz_photo_6 = File.open("db/fixtures/comment_to_goas_treiz_photo_6.jpeg")
comment_to_goas_treiz_6.images.attach(io: file_comment_to_goas_treiz_photo_6, filename: 'comment_to_goas_treiz_photo_6.jpeg', content_type: 'image/jpeg')
comment_to_goas_treiz_6.save!

comment_to_goas_treiz_7 = Comment.new( user:josianne, spot:plage_goas_treiz, content:" je suis venue en hiver pour éviter la foule, il faisait froid !!!", rating: 3)
file_comment_to_goas_treiz_photo_7 = File.open("db/fixtures/comment_to_goas_treiz_photo_7.jpeg")
comment_to_goas_treiz_7.images.attach(io: file_comment_to_goas_treiz_photo_7, filename: 'comment_to_goas_treiz_photo_7.jpeg', content_type: 'image/jpeg')
comment_to_goas_treiz_7.save!

comment_to_goas_treiz_8 = Comment.new( user:wits, spot:plage_goas_treiz, content:" jolie petite plage bien sympathique, hate de me faire des ami.e.s pour leur faire découvrir ", rating: 4)
file_comment_to_goas_treiz_photo_8 = File.open("db/fixtures/comment_to_goas_treiz_photo_8.jpeg")
comment_to_goas_treiz_8.images.attach(io: file_comment_to_goas_treiz_photo_8, filename: 'comment_to_goas_treiz_photo_8.jpeg', content_type: 'image/jpeg')
comment_to_goas_treiz_8.save!

comment_to_goas_treiz_9 = Comment.new( user:julio, spot:plage_goas_treiz, content:" Spot incroyable par vent d'ouest, du monde à l'eau, grosse session ! ", rating: 4)
file_comment_to_goas_treiz_photo_9 = File.open("db/fixtures/comment_to_goas_treiz_photo_9.jpeg")
comment_to_goas_treiz_9.images.attach(io: file_comment_to_goas_treiz_photo_9, filename: 'comment_to_goas_treiz_photo_9.jpeg', content_type: 'image/jpeg')
comment_to_goas_treiz_9.save!

comment_to_goas_treiz_10 = Comment.new( user:arianne, spot:plage_goas_treiz, content:" Les locaux sont top par contre il y a quelques patates rocheuses en plein milieu, faites gaffe si vous êtes en foil", rating: 5)
file_comment_to_goas_treiz_photo_10 = File.open("db/fixtures/comment_to_goas_treiz_photo_10.jpeg")
comment_to_goas_treiz_10.images.attach(io: file_comment_to_goas_treiz_photo_10, filename: 'comment_to_goas_treiz_photo_10.jpeg', content_type: 'image/jpeg')
comment_to_goas_treiz_10.save!

comment_to_goas_treiz_11 = Comment.new( user:camille, spot:plage_goas_treiz, content:" Tellement d'activité ici !!! on ne s'ennuit jamais ! ", rating: 4)
file_comment_to_goas_treiz_photo_11 = File.open("db/fixtures/comment_to_goas_treiz_photo_11.jpeg")
comment_to_goas_treiz_11.images.attach(io: file_comment_to_goas_treiz_photo_11, filename: 'comment_to_goas_treiz_photo_11.jpeg', content_type: 'image/jpeg')
comment_to_goas_treiz_11.save!

comment_to_goas_treiz_12 = Comment.create!( user:marianne, spot:plage_goas_treiz, content:" y a un mec il m'a venère je lui ai foutu mon poings dans la gueule, ça détends", rating: 4)

comment_to_goas_treiz_13 = Comment.new( user:wits, spot:plage_goas_treiz, content:" mon premier spot de kite, c'était chill", rating: 4)
file_comment_to_goas_treiz_photo_13 = File.open("db/fixtures/comment_to_goas_treiz_photo_13.jpeg")
comment_to_goas_treiz_13.images.attach(io: file_comment_to_goas_treiz_photo_13, filename: 'comment_to_goas_treiz_photo_13.jpeg', content_type: 'image/jpeg')
comment_to_goas_treiz_13.save!

comment_to_perros = Comment.create!(user:valentin, spot:evt_perros, content:"le moniteur de catamaran est vraiment nul, à cause de lui on a dessalé, et je garderais une cicatrice au visage après m'être pris le mat", rating: 0)
comment_to_perros_2 = Comment.create!(user:shiyun, spot:evt_perros, content:"j'ai réussi à faire une double backflip sur le spot de saut de 20 mètres, je suis prête pour les JO 2024", rating: 5)
comment_to_perros_3 = Comment.create!(user:corentin, spot:evt_perros, content:"le marchand de glaces fait des glaces artisanales à se taper le cul par terre", rating: 4)

comment_to_tregastel = Comment.create!(user:aurore, spot:evt_tregastel, content:"le petit saut du haut de la digue est à faire à marée haute, et non quand on voit le sable", rating: 2 )
comment_to_tregastel_2 = Comment.create!(user:shiyun, spot: evt_tregastel, content:"il a fait trop moche pour pouvoir profiter da la bouée géante de l'école de voile...", rating: 1)
comment_to_tregastel_3 = Comment.create!(user:valentin, spot:evt_tregastel, content: "une plage calme et agréable pour une ballade en famille le long du sentier des douaniers", rating: 4)

comment_to_tresmeur = Comment.create!(user:shiyun, spot:plage_tresmeur, content: "on m'avait vendu la plage comme étant belle, mais franchement c'est surcôté", rating: 4)
comment_to_tresmeur_2 = Comment.create!(user: valentin, spot: plage_tresmeur, content: " je me suis fait charrier sur les rochers à cause d'une rafale de vent, franchement cette plague est mal entretenu", rating: 2)
comment_to_tresmeur_3 = Comment.create!(user: aurore, spot: plage_tresmeur, content: "J'ai venu, j'ai vu, il a plu, cela ne m'a pas plu", rating: 2 )

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
