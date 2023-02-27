class CreateCycles < ActiveRecord::Migration[7.0]
  def change
    create_table :cycles do |t|
      t.integer :status, default: 0
      t.integer :size
      t.integer :collection_id, index: true

      t.timestamps
    end
  end
end
