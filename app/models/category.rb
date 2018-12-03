class Category < ApplicationRecord
  has_many :service_categories, dependent: :delete_all
  has_many :services, through: :service_categories
  translates :name
end
