class AddLatLongToBathroom < ActiveRecord::Migration
  def change
    add_column :bathrooms, :lat, :string
    add_column :bathrooms, :longt, :string
  end
end
