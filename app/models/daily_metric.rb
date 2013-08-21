class DailyMetric < ActiveRecord::Base
  belongs_to :metric
  validates :date, presence: true, uniqueness: { scope: :metric }

  validates :value, presence: true, numericality: true
end
