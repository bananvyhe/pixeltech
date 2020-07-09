Sidekiq::Extensions.enable_delay!
Sidekiq.configure_server do |config|
	config.redis = { url: 'redis://127.0.0.1:6380/sidekiq_test', namespace: "sidekiq_pixeltech" }
end

Sidekiq.configure_client do |config|
	config.redis = { url: 'redis://127.0.0.1:6380/sidekiq_test', namespace: "sidekiq_pixeltech" }
end