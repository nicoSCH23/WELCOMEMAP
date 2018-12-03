class RemoveHourFromService < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :hour, :string
  end
end
