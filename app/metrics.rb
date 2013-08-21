class DashboardMetrics < MetricsDefinition

  metric "github stargazers" do |m|
    m.reason = "Hallo!"

    m.fetch_with do
      5
    end
  end

end