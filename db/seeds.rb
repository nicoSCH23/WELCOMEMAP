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

categories = [{ name: 'Showers', identif: "showers", icon: 'https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543399886/aqsfufl8msyz5qtptuei.png'},
  { name: "Clothes", identif:"clothes", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543399872/uvxxdjtx2gzlum0jlydd.png"},
  { name: "Legal help", identif:"legal", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543399899/Legal.png"},
  { name: "Food", identif:"food", icon: "https://res.cloudinary.com/dy1ezu1aw/image/upload/v1543399775/laylcmw3ki7mkvmhx4mj.png"}
]

categories.each do |category|
  Category.create(category)
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
