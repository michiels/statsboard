class DashboardMetrics < MetricsDefinition

  metric "locomotive-chef-repo stargazers" do |m|
    m.reason = "Bookmarks of locomotive-chef-repo indicates interest for do-it-yourself Rails server installation"

    m.fetch_with(lambda {
      return Octokit.repo('intercity/locomotive-chef-repo').watchers_count
    })
  end

  metric "intercity-gitlab stargazers" do |m|
    m.reason = "Bookmarks of intercity-gitlab indicates for installing GitLab on own server."

    m.fetch_with(lambda {
      return Octokit.repo('intercity/intercity-gitlab').watchers_count
    })
  end

end