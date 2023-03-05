class DropCycleCards < ActiveRecord::Migration[7.0]
  def up
    drop_table :cycle_cards
  end

  def down
    create_table :cycle_cards do |t|
      t.references :cycle
      t.references :card
      t.integer :order
      
      t.timestamps        
    end
  end
end
