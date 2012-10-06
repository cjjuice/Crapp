class CreateBathrooms < ActiveRecord::Migration
  def change
    create_table :bathrooms do |t|
      t.boolean :isHandicapAccessible
      t.boolean :isPublic
      t.boolean :isFamily
      t.boolean :isFamily
      t.boolean :isGreen
      t.boolean :isUnisex
      t.boolean :isHandsFree
      t.boolean :hasProductDispenser
      t.boolean :hasAttendent
      t.boolean :hasSignage
      t.boolean :hasWifi
      t.references :venue
      t.references :BathroomType

      t.timestamps
    end
    add_index :bathrooms, :venue_id
    add_index :bathrooms, :BathroomType_id
  end
end
