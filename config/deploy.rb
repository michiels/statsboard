require 'bundler/capistrano'
require 'intercity/capistrano'

set :whenever_command, "bundle exec whenever"
require 'whenever/capistrano'

set :application, "statsboard_production"
set :repository,  "git@github.com:michiels/statsboard.git"

server "intercityup.com", :web, :app, :db, primary: true

after "deploy:finalize_update", "deploy:link_secret_token"
after "deploy:finialize_update", "mixpanel:link"

namespace :mixpanel do
  task :link do
    run "rm -f #{release_path}/config/initializers/mixpanel.rb && ln -nfs #{shared_path}/config/mixpanel.rb #{release_path}/config/initializers/mixpanel.rb"
  end
end

namespace :deploy do
  task :link_secret_token do
    run "rm -f #{release_path}/config/initializers/secret_token.rb && ln -nfs #{shared_path}/config/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
  end
end

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"