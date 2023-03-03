class RemoveStatusFromCycleCard < ActiveRecord::Migration[7.0]
  def change
    remove_column :cycle_cards, :status, :integer
  end
end
