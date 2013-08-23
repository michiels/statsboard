class MetricsController < ApplicationController
  def index
    @dates = DailyMetric.group('date').select(:date)

    @metrics = Metric.all

    @event = Event.new
    @event.happened_on = Date.today

    @events = Event.order('happened_on desc, id desc')
  end
end
