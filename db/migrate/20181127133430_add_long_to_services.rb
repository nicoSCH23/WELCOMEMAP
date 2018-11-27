class AddLongToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :long, :string
  end
end
