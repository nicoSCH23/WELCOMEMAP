class RemoveCategoryFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :category, :string
  end
end
