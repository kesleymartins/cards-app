class Favorite < ApplicationRecord
  belongs_to :collection
  belongs_to :user
end
