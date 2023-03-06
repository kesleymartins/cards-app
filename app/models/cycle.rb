class Cycle < ApplicationRecord
  has_one :execution
  belongs_to :card

  has_one :cycle, class_name: 'Cycle', foreign_key: 'next_id'
  belongs_to :manager, class_name: 'Cycle', optional: true

  def is_last?
    self.next_id.nil?
  end
end
