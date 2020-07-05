# Load DSL and set up stages
require "capistrano/setup"
set :stage, :production

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
require "capistrano/rbenv"
# require "capistrano/chruby"
require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require "capistrano/passenger"
require 'capistrano/sidekiq'
require "whenever/capistrano"
require 'capistrano/sidekiq/monit' #to require monit tasks # Only for capistrano3_type, :user
 

set :rbenv_ruby, '2.5.1'
set :linked_files, %w{config/master.key}
set :init_system, :systemd
set :init_system, :upstart
set :upstart_service_name, 'sidekiq'
set :sidekiq_processes, 5
set :sidekiq_options_per_process, ["--queue high", "--queue default --queue low"]
# set :sidekiq_user, 'deploy'
# set :rbenv_map_bins, fetch(:rbenv_map_bins).to_a.concat(%w(sidekiq sidekiqctl))

# set :init_system, :systemd
# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require "capistrano/rvm"
# require "capistrano/rbenv"
# require "capistrano/chruby"
# require "capistrano/bundler"
# require "capistrano/rails/assets"
# require "capistrano/rails/migrations"
# require "capistrano/passenger"

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
