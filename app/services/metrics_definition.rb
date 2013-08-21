class MetricsDefinition

  cattr_accessor :definition
  attr_accessor :metrics

  class << self

    def inherited(base)
      super
      MetricsDefinition.definition ||= self.new
    end

    def metric(name)

      m = Metric.new

      yield(m)

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

class Metric
  attr_accessor :reason

  def fetch_with(block)
    @block = block
  end

  def fetch
    puts @block.call
  end

end