class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :reviewText
      t.references :bathroom

      t.timestamps
    end
    add_index :reviews, :bathroom_id
  end
end
