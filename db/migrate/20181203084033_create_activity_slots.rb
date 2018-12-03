class CreateActivitySlots < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_slots do |t|
      t.references :service, foreign_key: true
      t.string :opening_hours
      t.string :activities
      t.string :price
      t.boolean :appointment
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
