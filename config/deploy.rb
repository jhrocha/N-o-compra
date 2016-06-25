lock '3.5'

set :application, "reasons_for_not_buying_api"
set :repo_url, "https://github.com/jhrocha/reasons_for_not_buying_api.git"
set :ruby_version, "ruby-2.2.1"
set :deploy_via, :remote_cache
set :copy_exclude, [ '.git' ]
set :base_path, "/var/www/db-api"
set :ruby_gemset, "@global"
set :user, "passenger"
set :bundle_gemfile, -> { release_path.join('Gemfile') }

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, false

# Default value for :linked_files is []
set :linked_files, %w{.env}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for keep_releases is 5
set :keep_releases, 8

set :ssh_options, {
    forward_agent: true
}

SSHKit.config.command_map[:rake]  = "bundle exec rake" #8
SSHKit.config.command_map[:rails] = "bundle exec rails"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart, :update_cron

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
