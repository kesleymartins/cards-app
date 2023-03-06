class FixCycleSelfLink < ActiveRecord::Migration[7.0]
  def change
    remove_reference :cycles, :cycle, index: true, foreign_key: true

    add_reference :cycles, :next, foreign_key: { to_table: :cycles }
  end
end
