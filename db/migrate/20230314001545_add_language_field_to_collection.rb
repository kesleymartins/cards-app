class AddLanguageFieldToCollection < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :language, :string, null: false
  end
end
