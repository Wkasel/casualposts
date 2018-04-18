class CreateSubregions < ActiveRecord::Migration[5.0]
  def change
    create_table :subregions do |t|
      t.string :name
      t.string :shortname
      t.referneces :region

      t.timestamps
    end
  end
end
