class AddStatusToExecution < ActiveRecord::Migration[7.0]
  def change
    add_column :executions, :status, :string, null: false
  end
end
