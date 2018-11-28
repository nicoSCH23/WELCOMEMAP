# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

services = [{ name: 'Douches Jaures', address: "56 rue de Meaux, 75019 Paris", phone:"0650166564", category: "Showers", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" },
    { name: 'BainsGratuit', address: "17 Rue Blomet, 75015 Paris", phone: "0650166564", category: "Showers", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" },
    { name: 'InfoMigrants', address: "9 square de Port-Royal, 75013 Paris", phone: "0650166564", category: "Legal help", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" },
    { name: 'ClothMigrants', address: "1 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris", phone: "0650166564", category: "Clothes", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" },
    { name: 'ClothRestauduCoeur', address: "42 Rue de Clichy, 75009 Paris", phone: "0650166564", category: "Clothes", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" },
    { name: 'FooMigrants', address: "9 rue Edouard-Jacques, 75014 Paris", phone: "0650166564", category: "Food", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" }
]

services.each do |service|
  Service.create(service)
end
