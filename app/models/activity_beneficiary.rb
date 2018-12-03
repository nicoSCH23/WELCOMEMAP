class ActivityBeneficiary < ApplicationRecord
  belongs_to :beneficiary
  belongs_to :activity_slot
end
