class Card < ApplicationRecord
    validates :question, presence: true
    validates :answer, presence: true

    belongs_to :collection
    has_many :scores, dependent: :destroy
end
