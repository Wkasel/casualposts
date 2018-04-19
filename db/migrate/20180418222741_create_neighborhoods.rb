class CreateNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.references :subregion, foreign_key: true

      t.timestamps
    end
  end
end
