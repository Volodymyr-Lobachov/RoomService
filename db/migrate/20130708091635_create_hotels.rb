class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.references :user
      t.string :title
      t.boolean :breakfast
      t.text :room_description
      t.decimal :price, :precision => 8, :scale => 2 
      t.string :address

      t.timestamps
    end
    add_index :hotels, :user_id
  end
end
