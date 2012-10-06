class CreateScoreTypes < ActiveRecord::Migration
  def change
    create_table :score_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
