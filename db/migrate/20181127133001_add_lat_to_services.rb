class AddLatToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :lat, :string
  end
end
