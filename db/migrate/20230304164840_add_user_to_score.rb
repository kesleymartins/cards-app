class AddUserToScore < ActiveRecord::Migration[7.0]
  def change
    add_reference :scores, :user, null: false, foreign_key: true, index: true
  end
end
