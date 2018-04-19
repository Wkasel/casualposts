class CreateSubregions < ActiveRecord::Migration[5.0]
  def change
    create_table :subregions do |t|
      t.string :name
      t.string :shortname
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
