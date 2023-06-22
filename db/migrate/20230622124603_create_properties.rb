class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :property_type
      t.integer :bedrooms
      t.integer :sitting_rooms
      t.integer :kitchens
      t.integer :bathrooms
      t.integer :toilets
      t.string :property_owner
      t.text :description
      t.date :valid_from
      t.date :valid_to

      t.timestamps
    end
  end
end
