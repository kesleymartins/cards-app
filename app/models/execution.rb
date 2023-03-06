class Execution < ApplicationRecord
    validates :score, presence: true
    validates :size, presence: true

    belongs_to :cycle
end
