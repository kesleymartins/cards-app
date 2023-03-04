class AddUserToCollection < ActiveRecord::Migration[7.0]
  def change
    add_reference :collections, :user, null: false, foreign_key: true, index: true
   end
end
