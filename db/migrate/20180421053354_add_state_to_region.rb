class AddStateToRegion < ActiveRecord::Migration[5.0]
  def change
    add_column :regions, :state, :string
  end
end
