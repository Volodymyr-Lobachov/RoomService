class AddOwnerToComents < ActiveRecord::Migration
  def change
  	add_column :coments, :user_id, :integer
  	add_index :coments, :user_id
  end
end
