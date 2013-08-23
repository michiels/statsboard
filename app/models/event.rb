class Event < ActiveRecord::Base
  validates :happened_on, :description, presence: true
end
