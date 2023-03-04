class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :by_user, -> (user) { where(user: user) }  
  scope :latest, -> { order(created_at: :desc)}
end
