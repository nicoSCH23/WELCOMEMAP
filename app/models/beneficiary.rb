class Beneficiary < ApplicationRecord
  has_many :activity_beneficiaries
  has_many :activity_slots, through: :activity_beneficiaries

  translates :name
end
