class AddNullValidationToRequiredAssociations < ActiveRecord::Migration[7.0]
  def change
    change_column :cards, :collection_id, :integer, null: false
    change_column :scores, :card_id, :integer, null: false
  end
end
