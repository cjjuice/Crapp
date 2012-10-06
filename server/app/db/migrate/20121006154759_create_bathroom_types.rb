class CreateBathroomTypes < ActiveRecord::Migration
  def change
    create_table :bathroom_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
