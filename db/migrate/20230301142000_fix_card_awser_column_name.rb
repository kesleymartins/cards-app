class FixCardAwserColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :cards, :awser, :answer
  end
end
