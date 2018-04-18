class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.string :name
      t.string :shortname
      t.string :softlink

      t.timestamps
    end
  end
end
