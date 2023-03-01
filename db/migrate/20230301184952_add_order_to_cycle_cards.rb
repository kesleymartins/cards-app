class AddOrderToCycleCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cycle_cards, :order, :integer
  end
end
