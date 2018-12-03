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
puts "#{Category.count} users have been created"

# NGOs
puts 'Creating Ngos...'
ngos = [{name: "Médecins du Monde", link: "https://www.medecinsdumonde.org",logo: "https://www.medecinsdumonde.org/sites/default/files/LOGO-MdM_FR_RVB_GRAND-MARGE.png", description: "Présent en France et dans 80 pays, Médecins du Monde est un mouvement international indépendant de militants actifs qui soignent, témoignent et accompagnent le changement social. À partir de nos 388 programmes médicaux innovants et d’un plaidoyer basé sur des faits, nous mettons les personnes exclues et leurs communautés en capacité d’accéder à la santé tout en se battant pour un accès universel aux soins.​"},
  {name: "France terre d'asile", link: "http://www.france-terre-asile.org/", logo: "http://www.france-terre-asile.org/images/design/logo-ftda.png",description:"L'association France terre d'asile, fondée en décembre 1970, a principalement pour but le maintien et le développement d'une des plus anciennes traditions françaises, celle de l'asile et de garantir en France l'application de toutes les conventions internationales pertinentes. Pour l'association, il s'agit d'aider toutes les personnes en situation de migrations de droit, en particulier celles répondant aux définitions de « réfugié » et « d'apatride » précisées  par  les conventions  internationales, notamment  par  l'article  premier  de  la convention de Genève du 28 juillet 1951 complété par l'article premier du protocole de New-York du 31 janvier 1967 et par la convention de New-York du 30 août 1961, ainsi que les personnes ne bénéficiant pas du statut légal de réfugié ou d'apatride."}
]
puts "#{Ngo.count} users have been created"

# Services
puts 'Creating services...'
services = [[["showers"], { name: 'Douches Jaures', address: "56 rue de Meaux, 75019 Paris", phone:"0650166564", comment: "Open all year round and free" }],
    [["showers"], { name: 'BainsGratuit', address: "17 Rue Blomet, 75015 Paris", phone: "0650166564", comment: "Open all year round and free" }],
    [['legal','showers'], { name: 'InfoMigrants', address: "9 square de Port-Royal, 75013 Paris", phone: "0650166564", comment: "Open all year round and free" }],
    [["clothes"], { name: 'ClothMigrants', address: "1 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris", phone: "0650166564", comment: "Open all year round and free" }],
    [["clothes"], { name: 'ClothRestauduCoeur', address: "42 Rue de Clichy, 75009 Paris", phone: "0650166564", comment: "Open all year round and free" }],
    [["food", "clothes"], { name: 'FooMigrants', address: "9 rue Edouard-Jacques, 75014 Paris", phone: "0650166564", comment: "Open all year round and free" }]
]

services.each do |service|
  serv = Service.create(service[2])
  service[0].each do |cat|
    serviceCat = ServiceCategory.new
    serviceCat.service = serv
    serviceCat.category = Category.where(identif: cat)[0]
    serviceCat.save
  end
end
puts "#{Service.count} users have been created"

