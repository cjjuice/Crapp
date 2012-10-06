class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :value
      t.references :bathroom
      t.references :ScoreType

      t.timestamps
    end
    add_index :scores, :bathroom_id
    add_index :scores, :ScoreType_id
  end
end
