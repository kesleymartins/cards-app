class AddProgressToCycle < ActiveRecord::Migration[7.0]
  def change
    add_column :cycles, :progress, :integer, default: 0
  end
end
