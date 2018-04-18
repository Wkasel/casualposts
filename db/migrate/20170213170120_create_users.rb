class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, {limit: 50, null: false, unique: true}
      t.string :email, {null: false, unique: true}
      t.string :password_digest, null: false

      t.timestamps
    end
    add_index :users, :username, {order: {username: :desc}}
  end
end
