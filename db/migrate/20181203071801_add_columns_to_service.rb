class AddColumnsToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :mail, :string
    add_column :services, :link, :string
    add_reference :services, :ngo, foreign_key: true
  end
end
