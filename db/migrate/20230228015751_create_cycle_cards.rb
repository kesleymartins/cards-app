class CreateCycleCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cycle_cards do |t|
      t.integer :status
      t.integer :cycle_id, index: true
      t.integer :card_id, index: true

      t.timestamps
    end
  end
end
