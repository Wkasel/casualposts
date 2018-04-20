class UpdateCategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :category
    add_column :categories, :name, :string
    add_column :categories, :shortname, :string
  end
end
