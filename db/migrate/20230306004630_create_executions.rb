class CreateExecutions < ActiveRecord::Migration[7.0]
  def change
    create_table :executions do |t|
      t.integer :score, default: 0
      t.references :user, null: false, index: true, foreign_key: true
      t.references :collection, null: false, index: true, foreign_key: true
      t.references :cycle, null: false, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
