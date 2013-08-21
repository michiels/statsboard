class Metric < ActiveRecord::Base
  has_many :daily_metrics

  def fetch_with(block)
    @block = block
  end

  def fetch
    daily_metric = daily_metrics.where(date: Date.today).first_or_initialize

    puts "fetching #{name}"

    value = @block.call

    daily_metric.value = value

    daily_metric.save!
  end

end
