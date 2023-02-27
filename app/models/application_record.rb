class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.latest
    order(created_at: :desc)
  end
end
