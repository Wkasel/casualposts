class DropRelation < ActiveRecord::Migration[5.0]
  def change
    remove_reference :regions, :regions, index:true, foreign_key: true
  end
end
