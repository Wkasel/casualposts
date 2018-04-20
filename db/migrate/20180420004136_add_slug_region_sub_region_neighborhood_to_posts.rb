class AddSlugRegionSubRegionNeighborhoodToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :slug, :string
    add_column :posts, :region_id, :integer
    add_column :posts, :subregion_id, :integer
    add_column :posts, :neighborhood_id, :integer
    add_index :posts, :slug
    add_index :posts, :region_id
    add_index :posts, :subregion_id
    add_index :posts, :neighborhood_id
  end
end
