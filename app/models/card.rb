class Card < ApplicationRecord
    validates :question, presence: true
    validates :awser, presence: true

    belongs_to :collection
    has_many :cycle_cards, dependent: :destroy
end
