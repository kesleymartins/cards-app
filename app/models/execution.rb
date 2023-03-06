class Execution < ApplicationRecord
    validates :score, presence: true
    
    belongs_to :cycle
end
