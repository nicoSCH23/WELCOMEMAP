class Category < ApplicationRecord
  has_many :activity_categories, dependent: :delete_all
  has_many :activity_slots, through: :activity_categories
  translates :name
end
