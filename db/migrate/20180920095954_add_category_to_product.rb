class AddCategoryToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :category, :string
    add_column :products, :vegetarian, :boolean
  end
end
