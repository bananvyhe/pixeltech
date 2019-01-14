job_type :sidekiq,  "cd :path && RAILS_ENV=:environment bundle exec sidekiq-client :task :output"

set :output, error: 'error.log', standard: 'cron.log'
set :environment, :development

every 1.minutes do
  sidekiq 'push CashWorker'
end