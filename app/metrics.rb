class DashboardMetrics < MetricsDefinition

  metric "github stargazers" do |m|
    m.reason = "Hallo!"

    m.fetch_with(lambda {
      5
    })
  end

end