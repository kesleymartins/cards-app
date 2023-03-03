class RemoveCollectionStatus < ActiveRecord::Migration[7.0]
  def change
    remove_column :cycles, :status, :integer
  end
end
