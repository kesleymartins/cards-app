class Cycle < ApplicationRecord
  attribute :type, :string

  has_one :execution
  belongs_to :card

  has_one :cycle, class_name: 'Cycle', foreign_key: 'next_id'

  def is_last?
    self.next_id.nil?
  end
end
