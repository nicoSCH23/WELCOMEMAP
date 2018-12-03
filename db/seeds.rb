puts "Cleaning DB"
Category.destroy_all

# Users
puts 'Creating users...'
file = "db/users.yml"
users = YAML.load(open(file).read)

users["users"].each do |user|
  User.create!(user)
end
puts "#{User.count} users have been created"

# Categories
puts 'Creating categories...'
categories = [  { name: "Food", namefr: "Alimentaire", identif:"food", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543399775/laylcmw3ki7mkvmhx4mj.png"},
  { name: "Health access", namefr: "Accès aux soins", identif:"health", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543673333/first-aid-kit.png"},
  { name: 'Showers', namefr: "Douches", identif: "showers", icon: 'https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543399886/aqsfufl8msyz5qtptuei.png'},
  { name: "Clothes", namefr: "Vêtements", identif:"clothes", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543399872/uvxxdjtx2gzlum0jlydd.png"},
  { name: "Legal help", namefr: "Aide juridique", identif:"legal", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543676529/file.png"},
  { name: "Literacy", namefr: "Alphabétisation", identif:"literacy", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543676343/book.png"},
  { name: "Training", namefr: "Formation", identif:"courses", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543676602/presentation.png"},
  { name: "Day Care Center", namefr: "Accueil de jour", identif:"daycare", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543678833/welcome.png"}
]

categories.each do |category|
  cat = Category.new()
  cat.identif = category[:identif]
  cat.icon = category[:icon]
  I18n.locale = :en
  cat.name = category[:name]

  I18n.locale = :fr
  cat.name = category[:namefr]
  cat.save!
end
puts "#{Category.count} categories have been created"

# Beneficiaries
puts 'Creating Beneficiaries...'
file = "db/beneficiaries.yml"
beneficiaries = YAML.load(open(file).read)

beneficiaries["beneficiaries"].each do |beneficiary|
  ben = Beneficiary.new()
  I18n.locale = :en
  ben.name = beneficiary["name"]
  I18n.locale = :fr
  ben.name = beneficiary["namefr"]
  ben.save!
end

puts "#{Beneficiary.count} Beneficiaries have been created"

# NGOs
puts 'Creating Ngos...'
ngos = [{name: "Médecins du Monde", link: "https://www.medecinsdumonde.org",logo: "https://www.medecinsdumonde.org/sites/default/files/LOGO-MdM_FR_RVB_GRAND-MARGE.png", description: "Présent en France et dans 80 pays, Médecins du Monde est un mouvement international indépendant de militants actifs qui soignent, témoignent et accompagnent le changement social. À partir de nos 388 programmes médicaux innovants et d’un plaidoyer basé sur des faits, nous mettons les personnes exclues et leurs communautés en capacité d’accéder à la santé tout en se battant pour un accès universel aux soins.​"},
  {name: "France terre d'asile", link: "http://www.france-terre-asile.org/", logo: "http://www.france-terre-asile.org/images/design/logo-ftda.png",description:"L'association France terre d'asile, fondée en décembre 1970, a principalement pour but le maintien et le développement d'une des plus anciennes traditions françaises, celle de l'asile et de garantir en France l'application de toutes les conventions internationales pertinentes. Pour l'association, il s'agit d'aider toutes les personnes en situation de migrations de droit, en particulier celles répondant aux définitions de « réfugié » et « d'apatride » précisées  par  les conventions  internationales, notamment  par  l'article  premier  de  la convention de Genève du 28 juillet 1951 complété par l'article premier du protocole de New-York du 31 janvier 1967 et par la convention de New-York du 30 août 1961, ainsi que les personnes ne bénéficiant pas du statut légal de réfugié ou d'apatride."},
  {name: "Les Restos du Coeur", link: "https://www.restosducoeur.org/", logo: "https://www.restosducoeur.org/wp-content/uploads/2016/04/logo.svg",description:"Fondés par Coluche en 1985, les Restos du Cœur est une association loi de 1901, reconnue d’utilité publique, sous le nom officiel de « les Restaurants du Cœur – les Relais du Cœur ». Ils ont pour but « d’aider et d’apporter une assistance bénévole aux personnes démunies, notamment dans le domaine alimentaire par l’accès à des repas gratuits, et par la participation à leur insertion sociale et économique, ainsi qu’à toute action contre la pauvreté sous toutes ses formes »."}
]


ngos.each do |ngo|
  Ngo.create(ngo)
end

puts "#{Ngo.count} ngos have been created"

# Services
puts 'Creating services...'
services = [{ user_id: 1, ngo_id: 1, mail: "ile-de-france@medecinsdumonde.net", link:"https://www.medecinsdumonde.org/fr/contact/ile-de-france", name: 'Médecins de Monde, Paris', address: "15 boulevard de Picpus 75012 Paris", phone:"0143148181" },
    { user_id: 1, ngo_id: 1, link:"https://www.medecinsdumonde.org/fr/contact/auvergne-rhone-alpes-0", name: 'Médecins de Monde, Plaine-Saint-Denis', address: "8/10 rue des blés - 93210 La Plaine-Saint-Denis", phone: "0155931932" },
    { user_id: 1, ngo_id: 3, mail: "lestremplins@restosducoeur.org", link:"https://www.restosducoeur.org/associations-departementales/les-tremplins-des-restaurants-du-coeur-relais-du-coeur/", name: 'LES TREMPLINS DES RESTAURANTS DU CŒUR', address: "42 Rue de Clichy, 75009 Paris", phone: "0987335391" },
    { user_id: 1, mail: "example@ngo.com", link:"https://www.medecinsdumonde.org/fr/contact/auvergne-rhone-alpes-0", name: 'ClothMigrants', address: "1 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris", phone: "0650166564" },
    { user_id: 1, mail: "example@ngo.com", link:"https://www.medecinsdumonde.org/fr/contact/auvergne-rhone-alpes-0", name: 'ClothRestauduCoeur', address: "42 Rue de Clichy, 75009 Paris", phone: "0650166564" },
    { user_id: 1, mail: "example@ngo.com", link:"https://www.medecinsdumonde.org/fr/contact/auvergne-rhone-alpes-0", name: 'FooMigrants', address: "9 rue Edouard-Jacques, 75014 Paris", phone: "0650166564" }
]

services.each do |service|
  serv = Service.create(service)
end
puts "#{Service.count} services have been created"


# Services
puts 'Creating activities...'
activities = [[["showers"], { service_id: 1, title: 'Douches gratuites', opening_hours: "Lundi au Vendredi, de 9h a 13h et de 14h a 18h", appointment: false, price: "0"}],
    [["showers"], { service_id: 2, title: 'Douches gratuites', opening_hours: "Lundi au Vendredi, de 9h a 13h et de 14h a 18h", appointment: false, price: "0"}],
    [['legal','showers'], { service_id: 3, title: 'Assistance juridique', opening_hours: "Lundi au Vendredi, de 9h a 13h et de 14h a 18h", appointment: false, price: "10"}],
    [["clothes"], { service_id: 4, title: 'Vestiaire', opening_hours: "Lundi au Vendredi, de 9h a 13h et de 14h a 18h", appointment: false}],
    [["clothes"], { service_id: 5, title: 'Vestiaire', opening_hours: "Lundi au Vendredi, de 9h a 13h et de 14h a 18h", appointment: false}],
    [["daycare"], { service_id: 6, title: 'Vestiaire', opening_hours: "Lundi au Vendredi, de 9h a 13h et de 14h a 18h", appointment: false}],
    [["food", "clothes"], { service_id: 6, title: 'Distribution alimentaire', opening_hours: "Lundi au Vendredi, de 9h à 13h et de 14h a 18h", appointment: false, price: "0"}]
]

activities.each_with_index do |activity, index|
  acti = ActivitySlot.create(activity[1])
  activity[0].each do |cat|
    activityCat = ActivityCategory.new
    activityCat.activity_slot = acti
    activityCat.category = Category.where(identif: cat)[0]
    activityCat.save
  end
  activityBen = ActivityBeneficiary.new
  activityBen.beneficiary_id = rand(7..Beneficiary.all.length)
  activityBen.activity_slot = acti
  activityBen.save

  if index.odd?
    activityBen2 = ActivityBeneficiary.new
    activityBen2.beneficiary_id = rand(1..6)
    activityBen2.activity_slot = acti
    activityBen2.save
  end
end

puts "#{ActivitySlot.count} activities have been created"
puts "#{ActivityBeneficiary.count} beneficiaries have been assigned to activities"

