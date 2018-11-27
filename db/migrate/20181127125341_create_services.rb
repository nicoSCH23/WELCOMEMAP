class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :hour
      t.text :comment

      t.timestamps
    end
  end
end
