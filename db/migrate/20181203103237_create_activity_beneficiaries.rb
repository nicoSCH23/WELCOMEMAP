class CreateActivityBeneficiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_beneficiaries do |t|
      t.references :beneficiary, foreign_key: true
      t.references :activity_slot, foreign_key: true

      t.timestamps
    end
  end
end
