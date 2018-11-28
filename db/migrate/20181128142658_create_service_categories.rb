class CreateServiceCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :service_categories do |t|
      t.references :category, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
