class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.string :name
      t.string :shortname
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
