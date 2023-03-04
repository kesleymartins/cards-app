class AddUserToCycle < ActiveRecord::Migration[7.0]
  def change
    add_reference :cycles, :user, null: false, foreign_key: true
  end
end
