class SetupCycle < ActiveRecord::Migration[7.0]
  def change
    add_reference :cycles, :card, index: true, foreign_key: true, null: false
    add_reference :cycles, :cycle, index: true, foreign_key: true
  end
end
