class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.text :question
      t.text :awser
      t.integer :collection_id, index: true

      t.timestamps
    end
  end
end
