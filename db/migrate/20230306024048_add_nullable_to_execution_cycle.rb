class AddNullableToExecutionCycle < ActiveRecord::Migration[7.0]
  def change
    change_column_null :executions, :cycle_id, true
  end
end
