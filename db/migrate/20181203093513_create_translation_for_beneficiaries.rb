class CreateTranslationForBeneficiaries < ActiveRecord::Migration[5.2]
  def up
      Beneficiary.create_translation_table!({
                                            name: :string}, {migrate_data: true})
    end

    def down
      Beneficiary.drop_translation_table! migrate_data: true
    end
end
