class MetricsController < ApplicationController
  def index
    @dates = DailyMetric.group('date').select(:date)
    @metrics = Metric.all
  end
end
