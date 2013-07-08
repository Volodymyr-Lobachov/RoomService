class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.references :hotel
      t.text :mark

      t.timestamps
    end
    add_index :coments, :hotel_id
  end
end
