# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

services = [{ name: 'Douches Jaures', address: "56 rue de Meaux, 75019 Paris", phone:"0650166564", category: "showers", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" },
    { name: 'InfoMigrants', address: "9 square de Port-Royal, 75013 Paris", phone: "0650166564", category: "legal help", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" },
    { name: 'FooMigrants', address: "9 rue Edouard-Jacques, 75014 Paris", phone: "0650166564", category: "food", hour: "9AM-9PM, Mon-Sat", comment: "Open all year round and free" }
]

services.each do |service|
  Service.create(service)
end
