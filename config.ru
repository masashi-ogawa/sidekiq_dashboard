require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://localhost:6379', :namespace => 'SidekiqBackground' }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://localhost:6379', :namespace => 'SidekiqBackground' }
end

require 'sidekiq/web'
map '/sidekiq' do
  use Rack::Auth::Basic, "Protected Area" do |username, password|
    username == 'sidekiq' && password == 'sidekiq'
  end

  run Sidekiq::Web
end
