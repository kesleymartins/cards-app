class Card < ApplicationRecord
    validates :question, presence: true
    validates :awser, presence: true

    belongs_to :collection
end
