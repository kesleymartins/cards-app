class AddExecutionSize < ActiveRecord::Migration[7.0]
  def change
    add_column :executions, :size, :integer, null: false
  end
end
