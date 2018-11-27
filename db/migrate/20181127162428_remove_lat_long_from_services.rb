class RemoveLatLongFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :lat, :string
    remove_column :services, :long, :string
  end
end
