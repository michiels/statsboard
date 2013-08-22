require 'open-uri'

class DashboardMetrics < MetricsDefinition

  metric "locomotive-chef-repo stargazers" do |m|
    m.reason = "Bookmarks of locomotive-chef-repo indicates interest for do-it-yourself Rails server installation"

    m.fetch_with(lambda {
      return Octokit.repo('intercity/locomotive-chef-repo').watchers_count
    })
  end

  metric "locomotive-chef-repo forks" do |m|
    m.reason = "Forks might indicate usage of the chef recipes"

    m.fetch_with(lambda {
      return Octokit.repo('intercity/locomotive-chef-repo').network_count
    })
  end

  metric "intercity 0.0.1 gem downloads" do |m|
    m.reason = "Intercity gem downloads indicate usage for deployment"

    m.fetch_with(lambda {
      url = open('http://www.rubygems.org/api/v1/downloads/intercity-0.0.1.json')
      json = url.read
      JSON.parse(json)['version_downloads']
    })
  end

  metric "intercity-gitlab stargazers" do |m|
    m.reason = "Bookmarks of intercity-gitlab indicates for installing GitLab on own server."

    m.fetch_with(lambda {
      return Octokit.repo('intercity/intercity-gitlab').watchers_count
    })
  end

end