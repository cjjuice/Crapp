class AddFieldsToBathrooms < ActiveRecord::Migration
  def change
    add_column :bathrooms, :name, :string
    add_column :bathrooms, :address, :string
    add_column :bathrooms, :city, :string
    add_column :bathrooms, :state, :string
    add_column :bathrooms, :zip, :string
  end
end
