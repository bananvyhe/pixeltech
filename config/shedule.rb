# гем whenever позволяет определить консольную шелл-команду
job_type :sidekiq, "cd :path && RAILS_ENV=environment /usr/local/bin/bundle exec /usr/local/bin/sidekiq-client :task :output"

set :output, error: 'error.log', standart: 'cron.log'
set :environment, :development

every 1.minutes do
	sidekiq 'push CashWorker'
end