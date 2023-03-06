class CleanCycleTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :cycles, :size, :integer
    remove_column :cycles, :progress, :integer
    remove_reference :cycles, :user, index: true, foreign_key: true
    remove_reference :cycles, :collection, index: true
  end
end
