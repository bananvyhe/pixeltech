env :PATH, ENV['PATH']
# env :GEM_PATH, ENV['GEM_PATH']
job_type :sidekiq,  "cd :path && RAILS_ENV=:environment sidekiq-client :task :output"
# set :output, error: '/log/whenever/error.log', standard: '/log/whenever/cron.log'

set :output, "#{path}/log/cron.log"

set :environment, :development 

every 1.minutes do
  rake   output: {error: "#{path}/log/error.log", standard: "#{path}/log/cron.log"}
end
 	
every 2.minutes do
  sidekiq 'push CashWorker'
end
# every 1.hours do
#   sidekiq 'push DayWorker'
# end
# every 15.minutes do
#   sidekiq 'push VkWorker'
# end
every 1.day, at: '12:00'  do
  sidekiq 'push DayWorker'
end
# every 1.minutes do
#   sidekiq 'push DayWorker'
# end
