class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.decimal :cost
      t.references :category
      t.references :user
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps
    end
  end
end
