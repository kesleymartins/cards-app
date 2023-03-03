class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.integer :value, default: 0
      t.integer :card_id, index: true

      t.timestamps
    end
  end
end
