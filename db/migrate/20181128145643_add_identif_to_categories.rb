class AddIdentifToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :identif, :string
  end
end
