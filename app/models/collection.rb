class Collection < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true

    has_many :cards, dependent: :destroy
end
