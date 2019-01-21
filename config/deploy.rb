# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"
# set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

# set :sidekiq_processes, 2
# set :sidekiq_options_per_process, ["--queue high", "--queue default --queue low"]

set :application, "pixeltech"
set :repo_url, "git@github.com:bananvyhe/pixeltech.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
 set :deploy_to, "/home/deploy/apps/pxtech"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
 append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
 append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/uploads"
# role :all, %w{deploy@46.161.39.175}
set :pty,  false
set :init_system, :systemd
set :sidekiq_monit_use_sudo, false
set :upstart_service_name, 'sidekiq'
#set :pty,  false
SSHKit.config.command_map[:sidekiq] = "bundle exec sidekiq"
SSHKit.config.command_map[:sidekiqctl] = "bundle exec sidekiqctl"



# set :sidekiq_processes, 2
# set :sidekiq_options_per_process, ["--queue high", "--queue default --queue low"]
# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
