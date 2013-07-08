class AddVisitedHotelsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :visited_hotels, :string
  end
end
