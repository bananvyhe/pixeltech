env :PATH, ENV['PATH']
# env :GEM_PATH, ENV['GEM_PATH']
job_type :sidekiq,  "cd :path && RAILS_ENV=:environment sidekiq-client :task :output"

set :output, error: 'error.log', standard: 'cron.log'
set :environment, :production

every 1.hours do
  sidekiq 'push CashWorker'
end