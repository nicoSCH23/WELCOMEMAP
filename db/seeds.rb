# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

services = [[["showers"],{ name: 'Douches Jaures', address: "56 rue de Meaux, 75019 Paris", phone:"0650166564", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" }],
    [["showers"], { name: 'BainsGratuit', address: "17 Rue Blomet, 75015 Paris", phone: "0650166564", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" }],
    [['legal','showers'], { name: 'InfoMigrants', address: "9 square de Port-Royal, 75013 Paris", phone: "0650166564", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" }],
    [["clothes"], { name: 'ClothMigrants', address: "1 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris", phone: "0650166564", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" }],
    [["clothes"], { name: 'ClothRestauduCoeur', address: "42 Rue de Clichy, 75009 Paris", phone: "0650166564", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" }],
    [["food", "clothes"], { name: 'FooMigrants', address: "9 rue Edouard-Jacques, 75014 Paris", phone: "0650166564", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" }]
]

categories = [  { name: "Food", namefr: "Alimentaire", identif:"food", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543399775/laylcmw3ki7mkvmhx4mj.png"},
  { name: "Health access", namefr: "Accès aux soins", identif:"health", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543673333/first-aid-kit.png"},
  { name: 'Showers', namefr: "Douches", identif: "showers", icon: 'https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543399886/aqsfufl8msyz5qtptuei.png'},
  { name: "Clothes", namefr: "Vêtements", identif:"clothes", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543399872/uvxxdjtx2gzlum0jlydd.png"},
  { name: "Legal help", namefr: "Aide juridique", identif:"legal", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543676529/file.png"},
  { name: "Literacy", namefr: "Alphabétisation", identif:"literacy", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543676343/book.png"},
  { name: "Training", namefr: "Formation", identif:"courses", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543676602/presentation.png"},
  { name: "Support", namefr: "Accompagnement", identif:"support", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543676952/conversation.png"}
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

services.each do |service|
  serv = Service.create(service[1])
  service[0].each do |cat|
    serviceCat = ServiceCategory.new
    serviceCat.service = serv
    serviceCat.category = Category.where(identif: cat)[0]
    serviceCat.save
  end
end
