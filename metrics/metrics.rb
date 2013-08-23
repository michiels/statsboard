require 'open-uri'

class DashboardMetrics < MetricsDefinition

  metric "unique visitor frontpage loads on intercityup.com" do |m|
    m.reason = "Unique visitors to our homepage indicate an interest for our activities."

    m.fetch_with(lambda {
      config = MIXPANEL_CONFIG
      client = Mixpanel::Client.new(config)

      data = client.request('events/properties', {
        'event' => 'Loaded a Page',
        'name' => 'url',
        'values' => ['http://www.intercityup.com/'],
        'type' => 'unique',
        'unit' => 'day',
        'interval' => '1'
      })

      Metric.logger.info data.inspect

      data['data']['values'].first[1].values.first

    })
  end

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

  metric "intercity all versions gem downloads" do |m|
    m.reason = "Intercity gem downloads indicate usage for deployment"

    m.fetch_with(lambda {
      url = open('http://www.rubygems.org/api/v1/downloads/intercity-0.0.1.json')
      json = url.read
      JSON.parse(json)['total_downloads']
    })
  end

  metric "intercity-gitlab stargazers" do |m|
    m.reason = "Bookmarks of intercity-gitlab indicates for installing GitLab on own server."

    m.fetch_with(lambda {
      return Octokit.repo('intercity/intercity-gitlab').watchers_count
    })
  end

end