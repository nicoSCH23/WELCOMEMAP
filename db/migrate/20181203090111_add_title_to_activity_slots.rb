class AddTitleToActivitySlots < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_slots, :title, :string
  end
end
