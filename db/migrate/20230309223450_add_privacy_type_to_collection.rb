class AddPrivacyTypeToCollection < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :privacy, :string, null: false
  end
end
