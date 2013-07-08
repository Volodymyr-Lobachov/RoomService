class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :hotel
      t.string :title

      t.timestamps
    end
    add_index :photos, :hotel_id
  end
end
