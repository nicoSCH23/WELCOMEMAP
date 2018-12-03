class CreateActivityCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_categories do |t|
      t.references :category, foreign_key: true
      t.references :activity_slot, foreign_key: true

      t.timestamps
    end
  end
end
