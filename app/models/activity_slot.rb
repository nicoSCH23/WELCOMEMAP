class ActivitySlot < ApplicationRecord
  has_many :activity_beneficiaries
  has_many :beneficiaries, through: :activity_beneficiaries
  accepts_nested_attributes_for :beneficiaries
  has_many :activity_categories, dependent: :delete_all
  has_many :categories, through: :activity_categories
  accepts_nested_attributes_for :categories
  belongs_to :service
end
