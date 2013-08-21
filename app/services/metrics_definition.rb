class MetricsDefinition

  cattr_accessor :definition
  attr_accessor :metrics

  class << self

    def inherited(base)
      super
      MetricsDefinition.definition ||= self.new
    end

    def metric(name)

      m = Metric.where(name: name).first_or_initialize

      yield(m)

      m.save

      MetricsDefinition.definition.metrics << m

    end

  end

  def initialize
    @metrics = []
  end

  def run_fetchers()
    @metrics.each do |m|
      m.fetch
    end
  end

end
