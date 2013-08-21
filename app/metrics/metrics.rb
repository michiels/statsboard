class DashboardMetrics < MetricsDefinition

  metric "locomotive-chef-repo stargazers" do |m|
    m.reason = "Bookmarks of locomotive-chef-repo indicates interest for do-it-yourself Rails server installation"

    m.fetch_with(lambda {
      return Octokit.repo('intercity/locomotive-chef-repo').watchers_count
    })
  end

end